From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 15949] LVDS-0 has wrapped screen with Randr1.2
Date: Wed, 13 Aug 2008 11:03:20 -0700 (PDT)
Message-ID: <20080813180320.BA458130168@annarchy.freedesktop.org>
References: <bug-15949-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-15949-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=15949





--- Comment #14 from Stuart Bennett <sb476-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>  2008-08-13 11:03:19 PST ---
Three things to try (try them individually first, then if no success, try them
together), then add to the bug which one or which combination works (if any).

1) use a different 1280x800 mode at runtime:

xrandr --newmode "1280x800R"   71.00  1280 1328 1360 1440  800 803 809 823
xrandr --addmode LVDS-0 1280x800R
xrandr --output LVDS-0 --mode 1280x800R

2) hard code panel size in nv_crtc.c (then re-run make install etc):

@@ -945,7 +945,7 @@ nv_crtc_mode_set_fp_regs(xf86CrtcPtr crtc, DisplayModePtr
mode, DisplayModePtr a

        regp->fp_horiz_regs[REG_DISP_END] = adjusted_mode->HDisplay - 1;
        regp->fp_horiz_regs[REG_DISP_TOTAL] = adjusted_mode->HTotal - 1;
-       regp->fp_horiz_regs[REG_DISP_CRTC] = adjusted_mode->HSyncStart - 75 -
1;
+       regp->fp_horiz_regs[REG_DISP_CRTC] = 0x500;
        regp->fp_horiz_regs[REG_DISP_SYNC_START] = adjusted_mode->HSyncStart -
1;
        regp->fp_horiz_regs[REG_DISP_SYNC_END] = adjusted_mode->HSyncEnd - 1;
        regp->fp_horiz_regs[REG_DISP_VALID_START] = adjusted_mode->HSkew;
@@ -953,7 +953,7 @@ nv_crtc_mode_set_fp_regs(xf86CrtcPtr crtc, DisplayModePtr
mode, DisplayModePtr a

        regp->fp_vert_regs[REG_DISP_END] = adjusted_mode->VDisplay - 1;
        regp->fp_vert_regs[REG_DISP_TOTAL] = adjusted_mode->VTotal - 1;
-       regp->fp_vert_regs[REG_DISP_CRTC] = adjusted_mode->VTotal - 5 - 1;
+       regp->fp_vert_regs[REG_DISP_CRTC] = 0x320;
        regp->fp_vert_regs[REG_DISP_SYNC_START] = adjusted_mode->VSyncStart -
1;
        regp->fp_vert_regs[REG_DISP_SYNC_END] = adjusted_mode->VSyncEnd - 1;
        regp->fp_vert_regs[REG_DISP_VALID_START] = 0;

3) change a flag register in nv_crtc.c (then re-run make install etc):

@@ -1018,7 +1018,7 @@ nv_crtc_mode_set_fp_regs(xf86CrtcPtr crtc, DisplayModePtr
mode, DisplayModePtr a
                regp->fp_control |= (8 << 28);

        /* Use the generic value, and enable x-scaling, y-scaling, and the TMDS
enable bit */
-       regp->debug_0 = 0x01101191;
+       regp->debug_0 = 0x01141191;
        /* We want automatic scaling */
        regp->debug_1 = 0;
        /* This can override HTOTAL and VTOTAL */


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
