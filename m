From: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] nouveau/mode: split out create_ranged_atom
Date: Thu,  6 Jun 2013 11:35:00 +1000
Message-ID: <1370482501-14023-1-git-send-email-airlied@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

From: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

This is preperation for the backlight support code.

Signed-off-by: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 src/drmmode_display.c | 54 ++++++++++++++++++++++++++++++++-------------------
 1 file changed, 34 insertions(+), 20 deletions(-)

diff --git a/src/drmmode_display.c b/src/drmmode_display.c
index 6033a6d..ad7bc1f 100644
--- a/src/drmmode_display.c
+++ b/src/drmmode_display.c
@@ -767,6 +767,33 @@ drmmode_property_ignore(drmModePropertyPtr prop)
 }
 
 static void
+nouveau_create_ranged_atom(xf86OutputPtr output, Atom *atom,
+		   const char *name, INT32 min, INT32 max,
+		   uint64_t value, Bool immutable)
+{
+    int err;
+    INT32 atom_range[2];
+
+    atom_range[0] = min;
+    atom_range[1] = max;
+
+    *atom = MakeAtom(name, strlen(name), TRUE);
+    err = RRConfigureOutputProperty(output->randr_output, *atom,
+				    FALSE, TRUE, immutable,
+				    2, atom_range);
+    if (err != 0) {
+	xf86DrvMsg(output->scrn->scrnIndex, X_ERROR,
+		   "RRConfigureOutputProperty error, %d\n", err);
+    }
+    err = RRChangeOutputProperty(output->randr_output, *atom,
+				 XA_INTEGER, 32, PropModeReplace, 1, &value, FALSE, TRUE);
+    if (err != 0) {
+	xf86DrvMsg(output->scrn->scrnIndex, X_ERROR,
+		   "RRChangeOutputProperty error, %d\n", err);
+    }
+}
+
+static void
 drmmode_output_create_resources(xf86OutputPtr output)
 {
 	drmmode_output_private_ptr drmmode_output = output->driver_private;
@@ -800,30 +827,17 @@ drmmode_output_create_resources(xf86OutputPtr output)
 		value = drmmode_output->mode_output->prop_values[p->index];
 
 		if (drmmode_prop->flags & DRM_MODE_PROP_RANGE) {
-			INT32 range[2];
-
 			p->num_atoms = 1;
 			p->atoms = calloc(p->num_atoms, sizeof(Atom));
 			if (!p->atoms)
 				continue;
-			p->atoms[0] = MakeAtom(drmmode_prop->name, strlen(drmmode_prop->name), TRUE);
-			range[0] = drmmode_prop->values[0];
-			range[1] = drmmode_prop->values[1];
-			err = RRConfigureOutputProperty(output->randr_output, p->atoms[0],
-							FALSE, TRUE,
-							drmmode_prop->flags & DRM_MODE_PROP_IMMUTABLE ? TRUE : FALSE,
-							2, range);
-			if (err != 0) {
-				xf86DrvMsg(output->scrn->scrnIndex, X_ERROR,
-					   "RRConfigureOutputProperty error, %d\n", err);
-			}
-			err = RRChangeOutputProperty(output->randr_output, p->atoms[0],
-						     XA_INTEGER, 32, PropModeReplace, 1,
-						     &value, FALSE, FALSE);
-			if (err != 0) {
-				xf86DrvMsg(output->scrn->scrnIndex, X_ERROR,
-					   "RRChangeOutputProperty error, %d\n", err);
-			}
+
+			nouveau_create_ranged_atom(output, &p->atoms[0],
+						  drmmode_prop->name,
+						  drmmode_prop->values[0],
+						  drmmode_prop->values[1],
+						  value,
+						  drmmode_prop->flags & DRM_MODE_PROP_IMMUTABLE ? TRUE : FALSE);
 		} else if (drmmode_prop->flags & DRM_MODE_PROP_ENUM) {
 			p->num_atoms = drmmode_prop->count_enums + 1;
 			p->atoms = calloc(p->num_atoms, sizeof(Atom));
-- 
1.8.2.1
