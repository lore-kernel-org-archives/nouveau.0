From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 29800] New: drm detects GPU lockup with dual
 cards/Xorg hard locks even with single screen
Date: Wed, 25 Aug 2010 08:21:50 -0700 (PDT)
Message-ID: <bug-29800-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=29800

           Summary: drm detects GPU lockup with dual cards/Xorg hard locks
                    even with single screen
           Product: xorg
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: Speeddymon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


[tspear@tomcat ~]$ cat /etc/redhat-release 
Fedora release 13 (Goddard)
[tspear@tomcat ~]$ uname -r
2.6.33.6-147.2.4.fc13.x86_64
[tspear@tomcat ~]$ rpm -qa |grep nouveau
xorg-x11-drv-nouveau-0.0.16-7.20100423git13c1043.fc13.x86_64
[tspear@tomcat ~]$ X -version

X.Org X Server 1.8.2
Release Date: 2010-07-01
X Protocol Version 11, Revision 0
Build Operating System: x86-16 2.6.32-44.el6.x86_64 
Current Operating System: Linux tomcat.localdomain 2.6.33.6-147.2.4.fc13.x86_64
#1 SMP Fri Jul 23 17:14:44 UTC 2010 x86_64
Kernel command line: ro root=/dev/mapper/vg_tomcat-lv_root
rd_LVM_LV=vg_tomcat/lv_root rd_LVM_LV=vg_tomcat/lv_swap rd_NO_LUKS rd_NO_MD
rd_NO_DM LANG=en_US.UTF-8 SYSFONT=latarcyrheb-sun16 KEYTABLE=us rhgb quiet 3
Build Date: 03 August 2010  05:10:46AM
Build ID: xorg-x11-server 1.8.2-3.fc13 
Current version of pixman: 0.18.0
    Before reporting problems, check http://bodhi.fedoraproject.org/
    to make sure that you have the latest version.
[tspear@tomcat ~]$ lspci -nn
05:00.0 VGA compatible controller [0300]: nVidia Corporation G86 [GeForce 8400
GS] [10de:0422] (rev a1)
06:00.0 VGA compatible controller [0300]: nVidia Corporation G86 [GeForce 8400
GS] [10de:0422] (rev a1)

2xPCI cards, onboard intel chip is enabled but there is no video output to the
monitor plugged into that port.

3 screen setup: Left goes to intel port, center goes to the primary card which
I believe is PCI:5:0:0, right goes to second card which I believe is PCI:6:0:0

There is no xorg.conf file as Fedora makes use of default settings built into
X.

During init, the first thing I see after selecting the OS is some messages from
drm saying that it detected a lockup in GPU-0 and then again in GPU-1. Then
there is no activity on the center screen (it is still getting a signal, but
the screen just does not update). The right screen gets the fedora loading
logo. If I hit escape, then the center screen shows the usual services starting
while the right screen loses the progress indicator but keeps the blue
background.

Afterward, init completes normally as long as I am going to runlevel 3. I can
then login on the center screen, but the right screen continues to display the
fedora load screen indefinitely.

If I go to runlevel 5 at boot, then I get a garbled center screen and the
fedora logo indefinitely on the right screen.

If I startx from runlevel 3, then the center screen gets the black and white
dots screen but no mouse cursor while the right screen again shows the fedora
load screen indefinitely; the machine hard locks to the point that I have to
pull the plug or hit the power button. After rebooting, there is nothing
written to the Xorg.0.log.

With the binary nvidia driver, the machine also hard locks after disabling both
displays and I can see in the Xorg.0.log that the nvidia driver attached to the
first GPU has gone into a wait state.

This is a Dell Optiplex 780 with 2 PCI slots and 1 PCI-E x16 slot. I have also
tried to get Single PCI-E and PCI cards to work together (both 8400GS but
different manufacturers) to no avail.

I'm sure there is more info you need, so please ask. This is a work machine,
but I am allowed to work on it to try to get 2 monitors working under X, with 2
physical cards, whatever way I have to.

For the record, Twinview works fine with a single dual-head card under nouveau,
which is what I am using right now to post this. It works under nvidia but I am
trying to stick with open source since the likelihood of getting it working
quicker is with open source. :-)

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
