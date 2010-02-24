From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26733] New: Full-screen XV causes graphics lockup
Date: Wed, 24 Feb 2010 07:56:08 -0800 (PST)
Message-ID: <bug-26733-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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

http://bugs.freedesktop.org/show_bug.cgi?id=26733

           Summary: Full-screen XV causes graphics lockup
           Product: xorg
           Version: git
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: tavianator-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Since updating libdrm, xf86-video-nouveau, and the DRM module to the latest GIT
(as of today), any time I make a video full-screen in VLC (with XVideo output)
on my nv92, the screen freezes.  Through ssh I found this in dmesg at the time
of the crash, which I'm told is bad:

[drm] nouveau 0000:04:00.0: PFIFO_DMA_PUSHER - Ch 2
[drm] nouveau 0000:04:00.0: PGRAPH_ERROR - nSource: DATA_ERROR, nStatus:
[drm] nouveau 0000:04:00.0: PGRAPH_ERROR - Ch 2/2 Class 0x502d Mthd 0x0844 Data
0x00104218:0x00104218
[drm] nouveau 0000:04:00.0: PGRAPH_ERROR - nSource: DATA_ERROR, nStatus:
[drm] nouveau 0000:04:00.0: PGRAPH_ERROR - Ch 2/2 Class 0x502d Mthd 0x0854 Data
0x4d6a0000:0x4d6a0000
[drm] nouveau 0000:04:00.0: nouveau_channel_free: freeing fifo 2
[drm] nouveau 0000:04:00.0: Failed to idle channel 2.
[drm] nouveau 0000:04:00.0: PFIFO_DMA_PUSHER - Ch 127
[drm] nouveau 0000:04:00.0: Allocating FIFO number 2
[drm] nouveau 0000:04:00.0: nouveau_channel_alloc: initialised FIFO 2
[drm] nouveau 0000:04:00.0: nouveau_channel_free: freeing fifo 2
[drm] nouveau 0000:04:00.0: Failed to idle channel 2.
[drm] nouveau 0000:04:00.0: nouveau_channel_free: freeing fifo 1


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
