From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 16375] New: Xv frame rate > refresh rate causes 100%
	CPU usage
Date: Mon, 16 Jun 2008 01:30:01 -0700 (PDT)
Message-ID: <bug-16375-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

http://bugs.freedesktop.org/show_bug.cgi?id=16375

           Summary: Xv frame rate > refresh rate causes 100% CPU usage
           Product: xorg
           Version: git
          Platform: All
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: drzeus-bugzilla-p3sGCRWkH8CeZLLa646FqQ@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


This bug is about the issue where playing some videos causes X to eat 100% CPU
for no apparent reason. It was known early that the cause was nouveau spinning
on DMA notifiers, but it wasn't really known why. After an evening of
debugging, I was able to explore the problem.

The issue occurs when PutImage() is called at a faster rate than images are
transferred by the hardware. I.e. you get a backlog of frames you want to DMA.
So the driver is doing exactly what it was supposed to do, it waits for a DMA
notifier to become available.

Now the bad assumption here was that waiting for a DMA notifier was a rare
occurance. Unfortunately it can be provoked under quite normal circumstances:

1. Input video is a NTSC video at 30 FPS

2. Monitor is running at 60 Hz

3. The video is interlaced, and the deinterlacer is one that outputs an image
each field, not each frame, effectively doubling the frame rate.

4. The driver is waiting for vsync between each frame to avoid tearing.

The result is a Xv stream at 60 Hz, which has very good odds of drowning the
(vsync-locked) DMA engine.

So you can't really solve the basic problem of the player wanting to output
frames faster than is possible (again, because of the vsync restriction). What
can be done is to make sure that waiting for a DMA notifier is done without
hogging the CPU.

For comparison, the radeon engine seems to do a blocking DRM call as its means
of throttling. The driver uses a different design, but from what I can tell the
throttling point is where it allocates FIFO space for the Xv image.



Related to this issue is the fact that you can get incorrect frame orders on
screen (the output tends to flicker a bit). This is an inherent effect of the
racy design of libXv (and possibly the Xv protocol itself). When using
XvShmPutImage(), there is no notifier that the server has had time to process
the image. If it takes to long, your player will start overwriting the buffer
with the next frame. With double buffring players (like mplayer), this will in
most cases have the effect of frames getting displayed in the wrong order.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
