From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 35630] New: NV31: PFIFO_DMA_PUSHER while running
	x11perf
Date: Thu, 24 Mar 2011 09:40:19 -0700 (PDT)
Message-ID: <bug-35630-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=35630

           Summary: NV31: PFIFO_DMA_PUSHER while running x11perf
           Product: xorg
           Version: git
          Platform: x86 (IA32)
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: johannesobermayr-Mmb7MZpHnFY@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


kernel-desktop-2.6.37.1-1.2.2.i586
drm-nouveau-kmp-desktop-20110315.1729_k2.6.37.1_1.2-1.1.i586
xorg-x11-server-7.6_1.9.3-15.18.4.i586
Mesa-7.10.99.git20110318.0231-1.1.i586
Mesa-nouveau3d-7.10.99.git20110318.0231-1.1.i586
xorg-x11-driver-video-nouveau-0.0.16.git20110303.2117-1.1.i586
(git versions are UTC dates)

$ x11perf -all
1st try: 3 Testing Fill 10x10 aa pre-added trapezoid
2nd try: 3 Testing Fill 100x100 aa pre-added trapezoid

[drm] nouveau 0000:01:00.0: PFIFO_DMA_PUSHER - Ch 1 Get 0x000102c0 Put
0x000102d0 State 0x80002054 (err: INVALID_CMD) Push 0x00000000
[drm] nouveau 0000:01:00.0: PFIFO_DMA_PUSHER - Ch 1 Get 0x000102d4 Put
0x000102e0 State 0x60000000 (err: RET_SUBR_INACTIVE) Push 0x00000000

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
