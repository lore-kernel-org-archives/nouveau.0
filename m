From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 3/3] kms: Add TV-out support
Date: Wed, 12 Aug 2009 02:18:28 +0200
Message-ID: <1250036308-28736-4-git-send-email-currojerez@riseup.net>
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

---
 src/drmmode_display.c |   75 ++++++++++++++++++++++++++++++++++++++++++++++--
 1 files changed, 71 insertions(+), 4 deletions(-)

diff --git a/src/drmmode_display.c b/src/drmmode_display.c
index 9b61da8..daa3f53 100644
--- a/src/drmmode_display.c
+++ b/src/drmmode_display.c
@@ -571,8 +571,16 @@ drmmode_output_detect(xf86OutputPtr output)
 }
 
 static Bool
-drmmode_output_mode_valid(xf86OutputPtr output, DisplayModePtr pModes)
+drmmode_output_mode_valid(xf86OutputPtr output, DisplayModePtr mode)
 {
+	drmmode_output_private_ptr drmmode_output = output->driver_private;
+	drmModeConnectorPtr koutput = drmmode_output->mode_output;
+
+	if (koutput->connector_type == DRM_MODE_CONNECTOR_TV
+	    && mode->type & M_T_DEFAULT)
+		/* Default modes are harmful here. */
+		return MODE_BAD;
+
 	return MODE_OK;
 }
 
@@ -778,8 +786,10 @@ static Bool
 drmmode_output_set_property(xf86OutputPtr output, Atom property,
 			    RRPropertyValuePtr value)
 {
+	ScrnInfoPtr pScrn = output->scrn;
 	drmmode_output_private_ptr drmmode_output = output->driver_private;
 	drmmode_ptr drmmode = drmmode_output->drmmode;
+	const char* property_name = NameForAtom(property);
 	int i, ret;
 
 	for (i = 0; i < drmmode_output->num_props; i++) {
@@ -802,7 +812,7 @@ drmmode_output_set_property(xf86OutputPtr output, Atom property,
 			if (ret)
 				return FALSE;
 
-			return TRUE;
+			goto out;
 
 		} else if (p->mode_prop->flags & DRM_MODE_PROP_ENUM) {
 			Atom	atom;
@@ -825,7 +835,7 @@ drmmode_output_set_property(xf86OutputPtr output, Atom property,
 					if (ret)
 						return FALSE;
 
-					return TRUE;
+					goto out;
 				}
 			}
 
@@ -833,6 +843,62 @@ drmmode_output_set_property(xf86OutputPtr output, Atom property,
 		}
 	}
 
+out:
+	/* The following properties are evil because they often
+	 * render the current CRTC mode invalid.
+	 */
+
+	if (!strcmp(property_name, "mode")
+	    || !strcmp(property_name, "scale")) {
+		xf86CrtcPtr crtc = output->crtc;
+		drmmode_crtc_private_ptr drmmode_crtc;
+		DisplayModePtr mode,
+			mode_same = NULL,
+			mode_preferred = NULL;
+
+		drmModeFreeConnector(drmmode_output->mode_output);
+		drmmode_output->mode_output = drmModeGetConnector(drmmode->fd,
+			drmmode_output->output_id);
+
+		if (!drmmode_output->mode_output || !pScrn->vtSema
+		    || !crtc || !crtc->enabled)
+			return TRUE;
+
+		drmmode_crtc = crtc->driver_private;
+
+		xf86ProbeOutputModes(pScrn, 0, 0);
+		xf86SetScrnInfoModes(pScrn);
+
+		/* Look for a mode with the same dimensions, otherwise
+		 * use the preferred one. */
+
+		for (mode = output->probed_modes; mode;
+		     mode = mode->next) {
+			if (crtc->mode.HDisplay == mode->HDisplay
+			    && crtc->mode.VDisplay == mode->VDisplay)
+				mode_same = mode;
+
+			if (mode->type & M_T_PREFERRED)
+				mode_preferred = mode;
+		}
+
+		if (mode_same)
+			mode = mode_same;
+		else if (mode_preferred)
+			mode = mode_preferred;
+
+		/* Disable the CRTC first to ensure a full modeset is performed. */
+		drmModeSetCrtc(drmmode->fd, drmmode_crtc->mode_crtc->crtc_id,
+			       0, 0, 0, NULL, 0, NULL);
+
+		if(mode)
+			drmmode_set_mode_major(crtc, mode, crtc->rotation, crtc->x, crtc->y);
+
+		if (output->randr_output->modes)
+			xf86RandR12TellChanged(pScrn->pScreen);
+
+	}
+
 	return TRUE;
 }
 
@@ -922,13 +988,14 @@ const char *output_names[] = { "None",
 			       "DVI-D",
 			       "DVI-A",
 			       "Composite",
-			       "TV",
+			       "SVIDEO",
 			       "LVDS",
 			       "CTV",
 			       "DIN",
 			       "DP",
 			       "HDMI",
 			       "HDMI",
+			       "TV",
 };
 
 
-- 
1.6.3.3
