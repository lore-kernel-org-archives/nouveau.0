From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23672] New: Nouveau KMS fails with error: Failed to
 fence channel 0
Date: Wed,  2 Sep 2009 23:38:57 -0700 (PDT)
Message-ID: <bug-23672-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=23672

           Summary: Nouveau KMS fails with error: Failed to fence channel 0
           Product: xorg
           Version: git
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: azverkan-/E1597aS9LQAvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=29162)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=29162)
Kernel log of nouveau KMS failure with drm debug enabled

While loading the nouveau module with KMS enabled, I get an ton of unhandled
interrupt messages followed by the error "Failed to fence channel 0" at which
point the driver fails to setup the device.  This is with nouveau git at
c9071b39d2612ef3d5a634ce54cddb122def2fdf which incorporates the INIT_LIST_HEAD
fix which prevents the kernel from oopsing after the initialization failure.

Even with the oops fix from git, attempting to start xorg and
xf86-video-nouveau on the primary card after the secondary fails results in a
partial system lock.  The kernel still responds to Alt-SysRQ requests, but of
the rest of the operating system is unresponsive to network or keybaord events
at this point.



There are two cards in the system, the 9800 is the primary and the secondary
card is the 7800.  Modesetting appears to work for the 9800 device and then
fail on the 7800 device from looking in the log.

03:00.0 VGA compatible controller: nVidia Corporation G92 [GeForce 9800 GTX]
(rev a2)
06:00.0 VGA compatible controller: nVidia Corporation G70 [GeForce 7800 GTX]
(rev a1)

Loading the nouveau module without modesetting enabled succeeds and
successfully sets up the 9800 as the primary card and is usable by
xf86-video-nouveau and xorg from git head.  I haven't yet attempted to see if
the secondary 7800 is also usable without modesetting enabled.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
