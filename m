From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26980] GT230M or GT218 with nouveau: X server hangs
 spontaneously
Date: Fri, 20 Aug 2010 08:32:20 -0700 (PDT)
Message-ID: <20100820153220.2DC8A1300AD@annarchy.freedesktop.org>
References: <bug-26980-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-26980-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=26980

--- Comment #36 from Sebastian Thias <bugs-OXl1b/uZKHizQB+pC5nmwQ@public.gmane.org> 2010-08-20 08:32:19 PDT ---
(In reply to comment #35)
> Yes. you didn't listen when I said this bug is NVA3+ only. Your card is NV86.
> 
> Do you get any interesting messages in kernel around the lockup? This is almost
> certainly some other bug.

OK, sorry for that. Yes, my kernel gives me

[29470.176297] [drm] nouveau 0000:01:00.0: PFIFO_DMA_PUSHER - Ch 2
[29470.176975] [drm] nouveau 0000:01:00.0: PGRAPH_DATA_ERROR - Ch 2/5 Class
0x8297 Mthd 0x1560 Data 0x00000000:0xcccccccc
[29470.176979] [drm] nouveau 0000:01:00.0: PGRAPH_DATA_ERROR - INVALID_VALUE
[29470.176990] [drm] nouveau 0000:01:00.0: PGRAPH_DATA_ERROR - Ch 2/5 Class
0x8297 Mthd 0x1564 Data 0x00000000:0xcccccccc
[29470.176993] [drm] nouveau 0000:01:00.0: PGRAPH_DATA_ERROR - INVALID_BITFIELD

So, I think I'll try my luck with bug 26733 or open a new one, if they don't
like my problem there either :)

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
