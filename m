From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 25036] New: KMS + multihead leaves ghost mouse
	pointer
Date: Wed, 11 Nov 2009 07:57:22 -0800 (PST)
Message-ID: <bug-25036-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=25036

           Summary: KMS + multihead leaves ghost mouse pointer
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
               URL: http://bbs.archlinux.org/viewtopic.php?id=83925
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: ataraxia937-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


I'm running a November 1st snapshot build of both the DDX and DRM modules, as
provided by Arch Linux. Hardware is a GeForce 9400 GT. There are two monitors
attached, configured via RandR. I don't have any options set in xorg.conf other
than the RandR setup.

When I move my mouse from one screen to the other, a "ghost pointer" is left
behind in the last place on the now-inactive screen that the pointer was drawn.
It remains there until I enter that screen again. While it is there, the cursor
glyph updates in sync with the "real" pointer on the active screen.

If I move the mouse slowly enough that the cursor visually reaches the edge of
the screen before I cross to the other screen, the ghost won't appear until the
glyph changes, at which point the ghost suddenly appears, mapped on the
edgemost column of the screen. It then remains there and behaves just as in the
previous case.

There are no interesting log messages from either the DDX or the DRM.

This bug only occurs with KMS enabled.

This resembles bug 12471, except that there, the ghost is always in the
top-left corner.

The URL attached to this bug is to a thread on the Arch Forums describing this
bug.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
