From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 14597] randr12 failures on 12" powerbooks,
	and workarounds
Date: Fri, 29 Feb 2008 02:37:18 -0800 (PST)
Message-ID: <20080229103718.57C2C1300C0@annarchy.freedesktop.org>
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


Stuart Bennett <sb476-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |sb476-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org




--- Comment #15 from Stuart Bennett <sb476-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>  2008-02-29 02:37:17 PST ---
Try this:

diff --git a/src/nv_bios.c b/src/nv_bios.c
index 08e4ad8..c62cfac 100644
--- a/src/nv_bios.c
+++ b/src/nv_bios.c
@@ -2828,8 +2828,15 @@ static void call_lvds_manufacturer_script(ScrnInfoPtr
pScrn, int head, int dcb_e

        if (script == LVDS_PANEL_OFF)
                usleep(off_on_delay * 1000);
-       if (script == LVDS_RESET)
+       if (script == LVDS_RESET) {
+               nv32_wr(pScrn, 0x006828b4, 0x72);
+               nv32_wr(pScrn, 0x006828b0, 0x02);
+               nv32_wr(pScrn, 0x006828b4, 0x01);
+               nv32_wr(pScrn, 0x006828b0, 0x2f);
+               nv32_wr(pScrn, 0x00001588, 0);
+
                link_head_and_output(pScrn, head, dcb_entry, false);
+       }
 }

 static uint16_t clkcmptable(bios_t *bios, uint16_t clktable, int pxclk)


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
