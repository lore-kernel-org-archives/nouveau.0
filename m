From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 36416] New: External monitor connected to docking
 station gets no signal, although recognized
Date: Wed, 20 Apr 2011 03:24:38 -0700 (PDT)
Message-ID: <bug-36416-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=36416

           Summary: External monitor connected to docking station gets no
                    signal, although recognized
           Product: xorg
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: alex-LJ/xIhIu6xqjKv3TNrM5DQ@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=45851)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=45851)
System Information (emerge --info)

Hello,

I'm running a gentoo amd64 installation on my Dell Precision M6300. It resides
in a docking station, so I don't have to connect 10 cables, when returning to
my desk. My external Monitor (HP LP2475w) is connected via the DVI-D connector
at the docking station.
"xrandr -q" lists the monitor. But if I enable it the monitor stays blank,
showing a "no signal" message and goes to sleep. Unplugging and replugging
doesn't improve it. The monitor is also listed in the Monitor section of the
system settings on my gnome 3 desktop, but it's the same game like with the
xrandr command line tool.
BUT, if I take my Laptop out of docking station and connect the monitor to the
DVI-D connector of the Laptop I immediately get a signal.
From what I can see, it seems that the signals don't get remapped, when the
Laptop is inside the docking station. Just a guess.
With the proprietary Nvidia driver this configuration works just fine (except
that the suspend is not working with gnome 3).

Please tell me the logs/debug messages you need, I already attached some.

Thanks in advance,
Alex

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
