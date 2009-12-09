From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 25527] New: The console doesn't work with Nouveau
 and KMS on a 9400M
Date: Tue,  8 Dec 2009 17:24:49 -0800 (PST)
Message-ID: <bug-25527-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=25527

           Summary: The console doesn't work with Nouveau and KMS on a 9400M
           Product: xorg
           Version: 7.5
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: ilbardo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=31854)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=31854)
Xorg log

Hardware: MacBook Unibody (5,1) with nVidia 9400M

Software: Arch Linux x86_64 fully up-to-date with a custom built 2.6.32 kernel,
xorg-server 1.7.3, xf86-video-nouveau 0.0.10 (git 20091207), nouveau-drm 0.0.15
(git 20091206)

Symptoms: as soon as the nouveau module is lodaded (in early or late mode) the
screen's backlight goes off. The console is fully functional even though it
isn't shown. As soon as X starts the light come back on and everything works,
even though some artifacts are shown on the top before the login manager
appears. Going back to a console with ctrl+alt+fn makes the cursor disappear,
but the image doesn't change, and pressing ctrl+alt+f7 makes the cursor
reappear and X refreshes again.

Possibly related: resume doesn't work, even with s3-bios, s3-mode and vbe-post
quirks.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
