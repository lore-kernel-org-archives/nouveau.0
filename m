From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 43668] New: Secondary monitor always in standby on
 dual head NV94
Date: Fri, 09 Dec 2011 15:28:56 +0000
Message-ID: <bug-43668-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=43668

             Bug #: 43668
           Summary: Secondary monitor always in standby on dual head NV94
    Classification: Unclassified
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: sep16-8DAjSxpRXgY@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created attachment 54270
  --> https://bugs.freedesktop.org/attachment.cgi?id=54270
Xorg log using nouveau-0.0.16_pre20111109

After switching from the nVidia binary drivers to nouveau, I am unable to use
my dual head setup; the second monitor refuses to come out of standby.

xrandr -q reports that the monitors are recognized and correctly configured.  
In gnome-shell I can drag a window off of the working monitor, so it appears
that the desktop is configured as expected, just that the secondary monitor is
not receiving a signal.

It seems to work fine with no xorg.conf, and I tried various configurations for
about six hours with no success.  The only thing was that when I used the
RightOf/LeftOf options in the Monitors sections, gnome3 would come up in
fallback mode.

nVidia binary drivers 290.10 (and earlier) have worked fine.

 - XFX nVidia GeForce 9600GT (NV50/NV94) w/ dual DVI-I outputs
 - dual NEC 2560x1600 monitors
 - xorg-server 1.11.2
 - nouveau 0.0.16_pre20111109 (also tried _pre20110323)
 - Gentoo amd64 linux-3.1.0

I'll attach some basic logs; let me know if you need anything else.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
