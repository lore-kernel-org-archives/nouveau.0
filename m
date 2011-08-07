From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 39901] New: 4 monitors on two graphic cards GeRorce
 450 does not work
Date: Sun,  7 Aug 2011 08:09:33 -0700 (PDT)
Message-ID: <bug-39901-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=39901

           Summary: 4 monitors on two graphic cards GeRorce 450 does not
                    work
           Product: xorg
           Version: unspecified
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: linux-fVFUNJGjhxXsq35pWSNszA@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=50013)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=50013)
config files, logs and pictures of configuration

Hi,
I am unable to create a working configuration with 4 monitors on 2 GeForce 450
(dual headed). I am able to make it working with 3 monitors - see
xorg.conf.tripple. The log file is xorg.0.log.tripple. The configuration works
also with Xinerama - see monitor-tripple.jpg.

When I add 4th display into the configuration (the same way as 2nd and 3rd) the
X doesn't start - see xorg.conf.quadro. No specific error message in the system
or xorg log - see xorg.0.log.quadro.


I also tried to configure it with proprietary nvidia drivers - I can start X
with 4 separate screens, but as soon as I enable Xinerama, the desktop is
"shifted" to the most right monitor and I must click on the first monitor to be
provided on the last one (even for two monitors) - see monitor-nvidia.jpg
(selection is on right monitor, a mouse cursor on the left one - so there is an
offset of a whole monitor). With 4 monitors the offset is 3 monitors :-( 

So, I see it as a bug that I am not able to enhance a working dual
configuration into quadro one. Neither with nvidia nor nouveau drivers. 


I have this config:

X version:
X.Org X Server 1.10.1
Release Date: 2011-04-15
X Protocol Version 11, Revision 0
Build Operating System: Linux 2.6.24-27-server i686 Ubuntu
Current Operating System: Linux harfa 2.6.38-10-generic-pae #46-Ubuntu SMP Tue
Jun 28 16:54:49 UTC 2011 i686
Kernel command line: BOOT_IMAGE=/boot/vmlinuz-2.6.38-10-generic-pae
root=UUID=2e66a48e-ff81-4e7f-8a24-b4f5dd2425a4 ro vmalloc=512M quiet splash
vt.handoff=7
Build Date: 21 May 2011  11:38:35AM
xorg-server 2:1.10.1-1ubuntu1.1 (For technical support please see
http://www.ubuntu.com/support) 
Current version of pixman: 0.20.2
    Before reporting problems, check http://wiki.x.org
    to make sure that you have the latest version.

lspci:
01:00.0 VGA compatible controller: nVidia Corporation GF106 [GeForce 450 GTS]
(rev a1)
01:00.1 Audio device: nVidia Corporation GF106 High Definition Audio Controller
(rev a1)
02:00.0 VGA compatible controller: nVidia Corporation GF106 [GeForce 450 GTS]
(rev a1)
02:00.1 Audio device: nVidia Corporation GF106 High Definition Audio Controller
(rev a1)

Regards
Vaclav

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
