From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 14403] NV17: LVDS0 is black with Randr 1.2,
 works when randr 1.  2 is disabled
Date: Fri, 15 Feb 2008 08:14:13 -0800 (PST)
Message-ID: <20080215161413.5670E130051@annarchy.freedesktop.org>
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





--- Comment #23 from Stuart Bennett <sb476-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>  2008-02-15 08:14:12 PST ---
Working from the all three applied state of your last dump, the diff against
no-randr12 shows a few things still, so (on top of the previous changes):
0) do the PLL_SELECT change (unlikely to do anything, but still)
1) nv_crtc.c:1454 regp->fp_vert_regs[REG_DISP_CRTC] = 0x41a;
2) nv_bios.c:2808 
if (pNv->dcb_table.entry[dcb_entry].type == OUTPUT_LVDS)
        (i.e. remove dual_link test)
 & nv_crtc.c:1533 remove "if" test so 
regp->fp_control[nv_crtc->head] |= (8 << 28) is always set
3) nv_bios.c:3152 lvdsmanufacturerindex = 1;


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
