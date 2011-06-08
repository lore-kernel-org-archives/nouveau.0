From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 38074] New: Dual head doesn't work for some
 combination of monitors (second screen still off)
Date: Wed,  8 Jun 2011 07:30:40 -0700 (PDT)
Message-ID: <bug-38074-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=38074

           Summary: Dual head doesn't work for some combination of
                    monitors (second screen still off)
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: jcapik-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=47716)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=47716)
dmesg

Hello.

I'm experiencing an issue, when dual-head seems to not work for combination of
displays, where the total width or height in pixels exceeds some value.

Failing combinations:
1920x1080 + 1920x1080
1920x1080 + 1650x1050

Working combinations:
1920x1080 + 1280x1024 
1650x1050 + 1280x1024

NOTE 1 : It works without problems with the binary driver.
NOTE 2 : There's quite good chance, that it has nothing to do with the total
width/height since the 1280x1024 monitor is connected via DVI-I to D-SUB
converter and it's a different brand with different timing.

Versions:
---------------------------
X.Org X Server 1.10.2
Release Date: 2011-05-28
X Protocol Version 11, Revision 0
Current Operating System: Linux **** 2.6.38.7-30.fc15.x86_64 #1 SMP Fri May 27
05:15:53 UTC 2011 x86_64
Current version of pixman: 0.20.2

xrandr program version       1.3.4
Server reports RandR version 1.3

xorg-x11-drv-nouveau-0.0.16-24.20110324git8378443.fc15.x86_64
---------------------------

I'm willing to provide You with register dumps from blob & nouveau if You want.
Just tell me where to download the right tool for taking the dumps.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
