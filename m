From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 31920] New: Brightness control is erratic
 (/sys/class/backlight/nv_backlight/max_brightness is wrong)
Date: Thu, 25 Nov 2010 10:06:35 -0800 (PST)
Message-ID: <bug-31920-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=31920

           Summary: Brightness control is erratic
                    (/sys/class/backlight/nv_backlight/max_brightness is
                    wrong)
           Product: xorg
           Version: git
          Platform: Other
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: rohandhruva-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


I have a Sony Vaio CW2 laptop, with an Nvidia GeForce 310M card. I am using the
nouveau driver from git (via the xorg-edgers ubuntu repository). I have to say
it works really well - I even get desktop effects in KDE with Gallium. 

However, there is one problem with screen brightness. The max_brightness value
for the backlight interface (/sys/class/backlight/nv_backlight/max_brightness)
is set to 1025. When I use KDE power-devil (or any brightness control tool), it
reduces the brightness by tiny fractions, which still keeps the screen at full
brightness. The brightness actually varies only between 0 and 127 (128-1025 are
full brightness), and then too only if I change it in increments of 10 or 20. I
think ideally the max_brightness value should be 7 (or 10?) and it should vary
in steps of 1.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
