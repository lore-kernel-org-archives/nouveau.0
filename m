From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 15481] New: Nouveau on nVidia Corporation G71
 [GeForce 7950 GT]: works but lockup for 6 min at shutdown
Date: Sun, 13 Apr 2008 00:54:48 -0700 (PDT)
Message-ID: <bug-15481-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=15481

           Summary: Nouveau on nVidia Corporation G71 [GeForce 7950 GT]:
                    works but lockup for 6 min at shutdown
           Product: xorg
           Version: 7.3
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: high
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: eric.valette-GANU6spQydw@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=15870)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=15870)
glxinfo output

Yesterday, I've extracted everything related to nouveau from git repositories.
That is:
       1) drm
       2) xf86-video-nouveau
       3) mesa (in a second step, see below)

Build everything, made the drm, and nouveau module auto load at startup, then
changed my xorg.conf (attached).

Immediately, I did see huge 2D performance improvement, but noticed running
glxgears that 3D was not there. Confirmed by the message in Xorg.log.0 about
AIGLX. I then started to add

Section "ServerFlags"
        Option "AIGLX" "on"
EndSection

But when restarting X, the machine hang for quite a long time. It is not dead,
as I can ping it or event ssh to it. But you do not have any keyboard input
(even caps lock led).

I then decided to be adventurous and try the 3D. And managed to install it. I
now have some basic 3D acceleration except that if I magnify Glxgears, it gets
a sigsegv.

But the "not fatal" hang for 6 min at shutdown remains. The last message I see,
before it really starts printing garbled init 0 message again is the "failed to
idle channel 1 before destroy. Prepare for strangeness.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
