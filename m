From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27153] New: [NV18] Frequent lockups during graphical
	activities
Date: Wed, 17 Mar 2010 20:26:20 -0700 (PDT)
Message-ID: <bug-27153-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=27153

           Summary: [NV18] Frequent lockups during graphical activities
           Product: xorg
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: chalserogers-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Forwarded from Launchpad:
https://bugs.edge.launchpad.net/ubuntu/+source/xserver-xorg-video-nouveau/+bug/537741

Whenever something graphically intensive happens (except, apparently, video)
like compositing, a gpu lockup occurs, freezing X and even terminal switching
but allowing use of SysRq commands. Can sometimes switch terminals by first
pressing Alt-SysRq-K. Only occurs with an NV18 card; NV17 works fine, for
example.

I have enabled compositing in Metacity. One test was selecting the Applications
menu and rapidly switching through that and Places and System, which eventually
froze X. After doing Alt-SysRq-K, it allowed me to log back in, and I tried
again with no problem; I opened some semi-transparent terminals, enlarged them,
and moved them around over eachother. Trying to enlarge the ~eighth terminal
froze X. Eventually I had a kernel panic. Occasionally I can't even boot fully.
Sometimes X will freeze and allow cursor movement, other times won't. Has
occured a couple times in a (Ctrl-Alt-F1...) virtual terminal.

Often I see colorful flashing as textures load, particularly at boot. Once I
rebooted and seen the screen as it was when X froze, for a few seconds, and it
cleared and finished loading GNOME.

I suppose there is a chance the card is defective...but it has no problem with
the NVIDIA binary drivers. (As an aside, I even had Compiz running in Nouveau
for some durations before freezing.)

Xorg log: http://launchpadlibrarian.net/40822534/XorgLogOld.txt
Boot dmesg: http://launchpadlibrarian.net/40822504/BootDmesg.txt
dmesg around the freeze & SAK recovery:
http://launchpadlibrarian.net/40822506/CurrentDmesg.txt
lspci: http://launchpadlibrarian.net/40822515/Lspci.txt


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
