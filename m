From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26733] Full-screen XV causes graphics lockup
Date: Mon, 23 Aug 2010 07:44:13 -0700 (PDT)
Message-ID: <20100823144414.10C2C1300A3@annarchy.freedesktop.org>
References: <bug-26733-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-26733-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=26733

--- Comment #28 from Sebastian Thias <bugs-OXl1b/uZKHizQB+pC5nmwQ@public.gmane.org> 2010-08-23 07:44:12 PDT ---
Thank you for your great work with nouveau so far!
Sadly - no luck with latest ddx. Is there anything I can do to aid debuging?

Kernel:
[15225.713082] [drm] nouveau 0000:01:00.0: PFIFO_DMA_PUSHER - Ch 2
[15225.714082] [drm] nouveau 0000:01:00.0: PFIFO_CACHE_ERROR - Ch 2/0 Mthd
0x000
0 Data 0x08000000
[15225.714125] [drm] nouveau 0000:01:00.0: PFIFO_DMA_PUSHER - Ch 2
[15234.445019] [drm] nouveau 0000:01:00.0: reloc wait_idle failed: -16
[15234.445028] [drm] nouveau 0000:01:00.0: reloc apply: -16

X backtrace of where it's stuck:
#0  0x00007fe68a2680a8 in OUT_RING (ppix=0x2a90670, is_src=0)
    at /usr/include/nouveau/nouveau_pushbuf.h:67
#1  NV50EXAAcquireSurface2D (ppix=0x2a90670, is_src=0) at nv50_exa.c:130
#2  0x00007fe68a268bc0 in NV50EXAPrepareSolid (pdpix=0x2a90670, alu=3,
    planemask=4294967295, fg=0) at nv50_exa.c:235
#3  0x00007fe6897e179d in ?? () from /usr/lib64/xorg/modules/libexa.so
#4  0x00000000004d4b80 in ?? ()
#5  0x00000000004ce2bd in ?? ()
#6  0x000000000042f99c in ?? ()
#7  0x00000000004250eb in _start ()

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
