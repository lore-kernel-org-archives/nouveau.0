From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 15161] New: Unable To Get Full Resolution (exceeds
 panel dimensions)
Date: Fri, 21 Mar 2008 08:32:44 -0700 (PDT)
Message-ID: <bug-15161-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=15161

           Summary: Unable To Get Full Resolution (exceeds panel dimensions)
           Product: xorg
           Version: 7.3
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: dgoodwin-eRDYlh02QjtL43Ps8y5oD9BPR1lH4CV8@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=15379)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=15379)
Current xorg.conf, slightly tweaked with modelines and syncs for my monitor.

Been using the proprietary nvidia drivers for years but not currently able to
use these (running Fedora 9) so trying to get my full resolution (1600x1200)
working with the nouveau driver, or even nv. (both yield this same problem) 

I have a Dell 2001fp LCD display and a nVidia GeForce 6200 video card. While
1600x1200 works easily with nvidia driver, using nouveau (or nv) I always max
out at 1280x1024. The most suspicious entry on Xorg.0.log is:

(II) NOUVEAU(0): Not using mode "1600x1200" (exceeds panel dimensions)

Fedora starts me off with a very basic xorg.conf which I've been trying to
tweak manually with modelines and sync ranges, but nothing seems to change the
outcome. (config still works, just same max resolution)

Attaching current xorg.conf and Xorg.0.log.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
