From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 14597] randr12 failures on 12" powerbooks,
	and workarounds
Date: Fri, 29 Feb 2008 16:33:28 -0800 (PST)
Message-ID: <20080301003329.145471300ED@annarchy.freedesktop.org>
References: <bug-14597-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-14597-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=14597





--- Comment #17 from Stuart Bennett <sb476-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>  2008-02-29 16:33:28 PST ---
So, to add some notes from IRC conversation:
LVDS_RESET is the problem causer.
It seems that even with the script disabled, link_head_and_output causes
problems.

So:
Can you find what in link_head_and_output causes the problem? I'd advise
something like the following (on a clean git copy):

1) double check that it works with just link_head... and the script disabled:

@@ -2838,12 +2838,13 @@ static void call_lvds_manufacturer_script(ScrnInfoPtr
pScrn, int head, int dcb_e
        xf86DrvMsg(pScrn->scrnIndex, X_INFO, "Calling LVDS script %d:\n",
script);
        nv_idx_port_wr(pScrn, CRTC_INDEX_COLOR, NV_VGA_CRTCX_OWNER,
                   head ? NV_VGA_CRTCX_OWNER_HEADB : NV_VGA_CRTCX_OWNER_HEADA);
-       parse_init_table(pScrn, bios, scriptofs, &iexec);
+       if (script != LVDS_RESET)
+               parse_init_table(pScrn, bios, scriptofs, &iexec);

        if (script == LVDS_PANEL_OFF)
                usleep(off_on_delay * 1000);
-       if (script == LVDS_RESET)
-               link_head_and_output(pScrn, head, dcb_entry);
+//     if (script == LVDS_RESET)
+//             link_head_and_output(pScrn, head, dcb_entry);
 }

2) re-enable call to link_head_and_output(), comment all five calls to nv32_wr
in link_head_and_output(), and progressively re-enable, until it breaks. I'm
hoping the first two are ok, and the last 3 are the problem here, but the
hardware likes to defy me.

Note that changing preferred_output (p-o) is not a valid solution here, as it
dictates the register set written: p-o of 0 causes the writes to go to 0x6808bX
(which only affects the unused encoder on the unused output), and p-o of 1
causes them to go to 0x6828bX (the correct encoder) -- see the addition of
NV_PRAMDAC0_SIZE to tmds_ctrlN.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
