From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23792] New: Getting inverted colors after having
 launched Virtualbox with Nouveau driver
Date: Tue,  8 Sep 2009 03:51:07 -0700 (PDT)
Message-ID: <bug-23792-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=23792

           Summary: Getting inverted colors after having launched Virtualbox
                    with Nouveau driver
           Product: xorg
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: thomas.pegeot-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Hello,

Lauching Virtualbox on my computer makes the screen get inverted/negative
colors when i open new qt/kde applications. If i focus on an older windows
(launched before Virtualbox), the screen goes back to normal colors, and vice
versa. When the colors are inverted, my screen looks like this :
http://bbs.archlinux.org/viewtopic.php?id=77040 (it's not my thread). 
Restarting X solves the problem. ;)

The kernel (master branch), mesa, libdrm, xf86-video-nouveau were compiled this
morming from the git repos. ;)

I got this problem for the first time about 1 month ago but I didn't really
know whether this problem was related to nouveau or not...

I use KDE with compositing (via Xrender) and toggling off compositing doesn't
solve the problem. 

This morning i tried the NV driver, and this problem didn't occur. 

My graphic card : 05:00.0 VGA compatible controller: nVidia Corporation NV41.1
[GeForce 6800] (rev a2)

Feel free to ask if you have any further questions. 

Regards

Thank you in advance!


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
