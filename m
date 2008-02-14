From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 14403] NV17: LVDS0 is black with Randr 1.2,
 works when randr 1.  2 is disabled
Date: Wed, 13 Feb 2008 20:18:51 -0800 (PST)
Message-ID: <20080214041852.045A813005D@annarchy.freedesktop.org>
References: <bug-14403-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-14403-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=14403





--- Comment #20 from Stuart Bennett <sb476-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>  2008-02-13 20:18:51 PST ---
Ok, from looking at a quick diff of those, NV_RAMDAC_FP_CONTROL1,
NV_RAMDAC_FP_DEBUG00, and NV_RAMDAC_OUTPUT* stand out as possibly interesting.

Respectively, can you try these:
1) nv_crtc.c:1494
        change regp->fp_control[nv_crtc->head] = 0x00000000;
        for regp->fp_control[nv_crtc->head] = 0x00100000;
2) nv_crtc.c:1696-7
        remove the two lines with PWRDOWN in them
3) nv_output.c:601-2
        swap output_reg[0] for output_reg[1], and vice-versa

One other thing (very unlikely to have an effect) is to avoid the ORing of
pllsel with NV_RAMDAC_PLL_SELECT_VCLK_RATIO_DB2, nv_crtc.c around line 790


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
