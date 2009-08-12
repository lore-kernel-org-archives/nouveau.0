From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 2/3] kms: Implement output->get_property when
	RandR1.3 is available.
Date: Wed, 12 Aug 2009 02:18:27 +0200
Message-ID: <1250036308-28736-3-git-send-email-currojerez@riseup.net>
References: <1250036308-28736-1-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1250036308-28736-1-git-send-email-currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This allows getting updated values when the kernel is modifying them
behind our back.
---
 src/drmmode_display.c |   53 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 53 insertions(+), 0 deletions(-)

diff --git a/src/drmmode_display.c b/src/drmmode_display.c
index 805dc5b..9b61da8 100644
--- a/src/drmmode_display.c
+++ b/src/drmmode_display.c
@@ -836,6 +836,56 @@ drmmode_output_set_property(xf86OutputPtr output, Atom property,
 	return TRUE;
 }
 
+#ifdef RANDR_13_INTERFACE
+static Bool
+drmmode_output_get_property(xf86OutputPtr output, Atom property)
+{
+
+	drmmode_output_private_ptr drmmode_output = output->driver_private;
+	drmmode_ptr drmmode = drmmode_output->drmmode;
+	uint32_t value;
+	int err, i;
+
+	drmModeFreeConnector(drmmode_output->mode_output);
+
+	drmmode_output->mode_output =
+		drmModeGetConnector(drmmode->fd, drmmode_output->output_id);
+
+	for (i = 0; i < drmmode_output->num_props; i++) {
+		drmmode_prop_ptr p = &drmmode_output->props[i];
+		if (p->atoms[0] != property)
+			continue;
+
+		value = drmmode_output->mode_output->prop_values[p->index];
+
+		if (p->mode_prop->flags & DRM_MODE_PROP_RANGE) {
+			err = RRChangeOutputProperty(output->randr_output,
+						     property, XA_INTEGER, 32,
+						     PropModeReplace, 1, &value,
+						     FALSE, FALSE);
+
+			return !err;
+		} else if (p->mode_prop->flags & DRM_MODE_PROP_ENUM) {
+			int		j;
+
+			/* search for matching name string, then set its value down */
+			for (j = 0; j < p->mode_prop->count_enums; j++) {
+				if (p->mode_prop->enums[j].value == value)
+					break;
+			}
+
+			err = RRChangeOutputProperty(output->randr_output, property,
+						     XA_ATOM, 32, PropModeReplace, 1,
+						     &p->atoms[j+1], FALSE, FALSE);
+
+			return !err;
+		}
+	}
+
+	return FALSE;
+}
+#endif
+
 static const xf86OutputFuncsRec drmmode_output_funcs = {
 	.create_resources = drmmode_output_create_resources,
 	.dpms = drmmode_output_dpms,
@@ -853,6 +903,9 @@ static const xf86OutputFuncsRec drmmode_output_funcs = {
 
 	.get_modes = drmmode_output_get_modes,
 	.set_property = drmmode_output_set_property,
+#ifdef RANDR_13_INTERFACE
+	.get_property = drmmode_output_get_property,
+#endif
 	.destroy = drmmode_output_destroy
 };
 
-- 
1.6.3.3
