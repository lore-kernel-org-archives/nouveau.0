From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 32959] New: X fails to set mode on NV11 and dies.
Date: Mon, 10 Jan 2011 05:30:18 -0800 (PST)
Message-ID: <bug-32959-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=32959

           Summary: X fails to set mode on NV11 and dies.
           Product: xorg
           Version: unspecified
          Platform: x86 (IA32)
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: alex.buell-XLQCo7u1tb3e9xe1eoZjHA@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=41836)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=41836)
dmesg

Using Gentoo.

Hardware: Dell Inspiron 8100 w/ NV11 chipset
Kernel: gentoo-sources-2.6.36-r5 (nouveaufb)
Xorg: 1.9.3.901
xf86-video-nouveau: 0.0.16_pre20101130
libdrm: 2.4.23

Xorg.0.log and dmesg provided as attachments.

Xorg fails to start as it can't set mode. 

This is a pre-release version of the X server from The X.Org Foundation.
It is not supported in any way.
Bugs may be filed in the bugzilla at http://bugs.freedesktop.org/.
Select the "xorg" product for bugs you find in this release.
Before reporting bugs in pre-release versions please check the
latest version in the X.Org Foundation git repository.
See http://wiki.x.org/wiki/GitPage for git access instructions.

X.Org X Server 1.9.3.901 (1.9.4 RC 1)
Release Date: 2011-01-07
X Protocol Version 11, Revision 0
Build Operating System: Linux 2.6.36-gentoo-r5 i686 Gentoo
Current Operating System: Linux hydrogen 2.6.36-gentoo-r5 #5 SMP PREEMPT Mon
Jan 10 01:42:57 GMT 2011 i686
Kernel command line: root=/dev/ram0
real_root=UUID=1b6432ff-e01f-4b70-942b-f03e1707717c udev vga=791
video=1600x1200 lapic apic=verbose splash=verbose
Build Date: 09 January 2011  04:44:53PM

Current version of pixman: 0.20.0
    Before reporting problems, check http://wiki.x.org
    to make sure that you have the latest version.
Markers: (--) probed, (**) from config file, (==) default setting,
    (++) from command line, (!!) notice, (II) informational,
    (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(==) Log file: "/var/log/Xorg.0.log", Time: Mon Jan 10 13:29:12 2011
(==) Using system config directory "/usr/share/X11/xorg.conf.d"
(EE) Failed to load module "vesa" (module does not exist, 0)
(EE) Failed to load module "fbdev" (module does not exist, 0)
(EE) NOUVEAU(0): failed to set mode: Invalid argument
Fatal server error:
failed to create screen resources

Please consult the The X.Org Foundation support 
     at http://wiki.x.org
 for help. 
Please also check the log file at "/var/log/Xorg.0.log" for additional
information.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
