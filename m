From: Matthew Garrett <mjg59-1xO5oi07KQx4cg9Nei1l7Q@public.gmane.org>
Subject: RANDR1.2 and LVDS
Date: Thu, 5 Jul 2007 03:57:37 +0100
Message-ID: <20070705025737.GA15808@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
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

Hi!

I've written a small amount of code that gets the randr 1.2 branch much 
closer to working for me on a laptop. Most of the changes are fairly 
obvious, but a couple of comments:

1) The changes to nv_crtc.c are clearly bogus, but I'm not sure what on 
earth these registers do. I need to set them to get a moderately 
sane-looking picture

2) The fp registers poked in nv_output.c don't seem to do anything on 
lvds. No matter what I set them to, the picture is identical

3) This doesn't /quite/ work for me yet. I have a solid and recognisable 
picture, but it's only about the left two thirds of my screen, centred 
on the display with black borders. Clearly the panel programming isn't 
/quite/ right yet...

Signed-off-by: Matthew Garrett <mjg59-1xO5oi07KQx4cg9Nei1l7Q@public.gmane.org>

diff --git a/src/nv_crtc.c b/src/nv_crtc.c
index 5b646d0..3388a3a 100644
--- a/src/nv_crtc.c
+++ b/src/nv_crtc.c
@@ -945,8 +945,9 @@ nv_crtc_mode_set_regs(xf86CrtcPtr crtc, DisplayModePtr mode)
     } else
        regp->cursorConfig |= 0x02000000;
 
-    regp->CRTC[NV_VGA_CRTCX_FP_HTIMING] = 0;
-    regp->CRTC[NV_VGA_CRTCX_FP_VTIMING] = 0;
+    // FIXME: Figure out what these actually do
+    regp->CRTC[NV_VGA_CRTCX_FP_HTIMING] = 0xa;
+    regp->CRTC[NV_VGA_CRTCX_FP_VTIMING] = 0x2;
 
     regp->unk830 = mode->CrtcVDisplay - 3;
     regp->unk834 = mode->CrtcVDisplay - 1;
diff --git a/src/nv_output.c b/src/nv_output.c
index 9f72fd3..558aa5c 100644
--- a/src/nv_output.c
+++ b/src/nv_output.c
@@ -287,6 +287,23 @@ nv_output_mode_valid(xf86OutputPtr output, DisplayModePtr pMode)
     return MODE_OK;
 }
 
+static int
+nv_output_lvds_mode_valid(xf86OutputPtr output, DisplayModePtr pMode)
+{
+    NVOutputPrivatePtr nv_output = output->driver_private;
+
+    if (pMode->Flags & V_DBLSCAN)
+	return MODE_NO_DBLESCAN;
+  
+    if (pMode->Clock > 400000 || pMode->Clock < 25000)
+	return MODE_CLOCK_RANGE;
+
+    if (pMode->HDisplay > nv_output->fpWidth
+	|| pMode->VDisplay > nv_output->fpHeight)
+      return MODE_PANEL;
+
+    return MODE_OK;
+}
 
 static Bool
 nv_output_mode_fixup(xf86OutputPtr output, DisplayModePtr mode,
@@ -351,27 +368,28 @@ nv_output_mode_set_regs(xf86OutputPtr output, DisplayModePtr mode)
     {
 	is_fp = TRUE;
 
-	for (i = 0; i < 7; i++) {
+	if (nv_output->type == OUTPUT_DIGITAL) {
+	  for (i = 0; i < 7; i++) {
 	    regp->fp_horiz_regs[i] = savep->fp_horiz_regs[i];
 	    regp->fp_vert_regs[i] = savep->fp_vert_regs[i];
+	  }
+	  
+	  regp->fp_horiz_regs[REG_DISP_END] = mode->CrtcHDisplay - 1;
+	  regp->fp_horiz_regs[REG_DISP_TOTAL] = mode->CrtcHTotal - 1;
+	  regp->fp_horiz_regs[REG_DISP_CRTC] = mode->CrtcHDisplay;
+	  regp->fp_horiz_regs[REG_DISP_SYNC_START] = mode->CrtcHSyncStart - 1;
+	  regp->fp_horiz_regs[REG_DISP_SYNC_END] = mode->CrtcHSyncEnd - 1;
+	  regp->fp_horiz_regs[REG_DISP_VALID_START] = mode->CrtcHSkew;
+	  regp->fp_horiz_regs[REG_DISP_VALID_END] = mode->CrtcHDisplay - 1;
+	  
+	  regp->fp_vert_regs[REG_DISP_END] = mode->CrtcVDisplay - 1;
+	  regp->fp_vert_regs[REG_DISP_TOTAL] = mode->CrtcVTotal - 1;
+	  regp->fp_vert_regs[REG_DISP_CRTC] = mode->CrtcVDisplay;
+	  regp->fp_vert_regs[REG_DISP_SYNC_START] = mode->CrtcVSyncStart - 1;
+	  regp->fp_vert_regs[REG_DISP_SYNC_END] = mode->CrtcVSyncEnd - 1;
+	  regp->fp_vert_regs[REG_DISP_VALID_START] = 0;
+	  regp->fp_vert_regs[REG_DISP_VALID_END] = mode->CrtcVDisplay - 1;
 	}
-
-	regp->fp_horiz_regs[REG_DISP_END] = mode->CrtcHDisplay - 1;
-	regp->fp_horiz_regs[REG_DISP_TOTAL] = mode->CrtcHTotal - 1;
-	regp->fp_horiz_regs[REG_DISP_CRTC] = mode->CrtcHDisplay;
-	regp->fp_horiz_regs[REG_DISP_SYNC_START] = mode->CrtcHSyncStart - 1;
-	regp->fp_horiz_regs[REG_DISP_SYNC_END] = mode->CrtcHSyncEnd - 1;
-	regp->fp_horiz_regs[REG_DISP_VALID_START] = mode->CrtcHSkew;
-	regp->fp_horiz_regs[REG_DISP_VALID_END] = mode->CrtcHDisplay - 1;
-	
-	regp->fp_vert_regs[REG_DISP_END] = mode->CrtcVDisplay - 1;
-	regp->fp_vert_regs[REG_DISP_TOTAL] = mode->CrtcVTotal - 1;
-	regp->fp_vert_regs[REG_DISP_CRTC] = mode->CrtcVDisplay;
-	regp->fp_vert_regs[REG_DISP_SYNC_START] = mode->CrtcVSyncStart - 1;
-	regp->fp_vert_regs[REG_DISP_SYNC_END] = mode->CrtcVSyncEnd - 1;
-	regp->fp_vert_regs[REG_DISP_VALID_START] = 0;
-	regp->fp_vert_regs[REG_DISP_VALID_END] = mode->CrtcVDisplay - 1;
-    
     }
 
     if (pNv->Architecture >= NV_ARCH_10) 
@@ -650,11 +668,11 @@ nv_output_lvds_get_modes(xf86OutputPtr output)
     ScrnInfoPtr	pScrn = output->scrn;
     NVOutputPrivatePtr nv_output = output->driver_private;
 
-    //    nv_output->fpWidth = NVOutputReadRAMDAC(output, NV_RAMDAC_FP_HDISP_END) + 1;
-    //    nv_output->fpHeight = NVOutputReadRAMDAC(output, NV_RAMDAC_FP_VDISP_END) + 1;
+    nv_output->fpWidth = NVOutputReadRAMDAC(output, NV_RAMDAC_FP_HDISP_END) + 1;
+    nv_output->fpHeight = NVOutputReadRAMDAC(output, NV_RAMDAC_FP_VDISP_END) + 1;
     nv_output->fpSyncs = NVOutputReadRAMDAC(output, NV_RAMDAC_FP_CONTROL) & 0x30000033;
-    //    xf86DrvMsg(pScrn->scrnIndex, X_PROBED, "Panel size is %i x %i\n",
-    //	       nv_output->fpWidth, nv_output->fpHeight);
+    xf86DrvMsg(pScrn->scrnIndex, X_PROBED, "Panel size is %i x %i\n",
+    	       nv_output->fpWidth, nv_output->fpHeight);
 
     return NULL;
 
@@ -664,7 +682,7 @@ static const xf86OutputFuncsRec nv_lvds_output_funcs = {
     .dpms = nv_panel_output_dpms,
     .save = nv_output_save,
     .restore = nv_output_restore,
-    .mode_valid = nv_output_mode_valid,
+    .mode_valid = nv_output_lvds_mode_valid,
     .mode_fixup = nv_output_mode_fixup,
     .mode_set = nv_output_mode_set,
     .detect = nv_output_lvds_detect,
@@ -707,6 +725,37 @@ static void nv_add_analog_output(ScrnInfoPtr pScrn, int i2c_index)
   pNv->analog_count++;
 }
 
+static void nv_add_lvds_output(ScrnInfoPtr pScrn, int i2c_index)
+{
+  NVPtr pNv = NVPTR(pScrn);
+  xf86OutputPtr	    output;
+  NVOutputPrivatePtr    nv_output;
+  char outputname[20];
+  int   crtc_mask = (1<<0) | (1<<1);
+
+  sprintf(outputname, "LVDS-%d", pNv->lvds_count);
+  output = xf86OutputCreate (pScrn, &nv_lvds_output_funcs, outputname);
+  if (!output)
+    return;
+  nv_output = xnfcalloc (sizeof (NVOutputPrivateRec), 1);
+  if (!nv_output)
+  {
+    xf86OutputDestroy (output);
+    return;
+  }
+  
+  output->driver_private = nv_output;
+  nv_output->type = OUTPUT_PANEL;
+  
+  nv_output->ramdac = pNv->lvds_count;
+  
+  nv_output->pDDCBus = pNv->pI2CBus[i2c_index];
+  
+  output->possible_crtcs = crtc_mask;
+  xf86DrvMsg(pScrn->scrnIndex, X_PROBED, "Adding output %s\n", outputname);
+
+  pNv->lvds_count++;
+}
 
 static void nv_add_digital_output(ScrnInfoPtr pScrn, int i2c_index)
 {
@@ -784,6 +833,9 @@ void NvDCBSetupOutputs(ScrnInfoPtr pScrn)
 	case 0: /* analog */
 	  nv_add_analog_output(pScrn, port);
 	  break;
+	case 1: /* panel */
+	  nv_add_lvds_output(pScrn, port);
+	  break;
 	case 2:
 	  nv_add_digital_output(pScrn, port);
 	default:
diff --git a/src/nv_type.h b/src/nv_type.h
index fd5054f..fe18e38 100644
--- a/src/nv_type.h
+++ b/src/nv_type.h
@@ -309,6 +309,7 @@ typedef struct _NVRec {
     int dcb_entries;
 
     int analog_count;
+    int lvds_count;
     int digital_count;
     CARD32 dcb_table[NV40_NUM_DCB_ENTRIES]; /* 10 is a good limit */
 } NVRec;

-- 
Matthew Garrett | mjg59-1xO5oi07KQx4cg9Nei1l7Q@public.gmane.org
