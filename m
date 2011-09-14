From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40866] New: Caught signal 11 (Segmentation fault).
 Server aborting
Date: Wed, 14 Sep 2011 03:06:33 -0700 (PDT)
Message-ID: <bug-40866-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=40866

           Summary: Caught signal 11 (Segmentation fault). Server aborting
           Product: xorg
           Version: unspecified
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: johndoe99-HPQIj1OAFZMvJsYlp49lxw@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=51186)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=51186)
xorg.conf

ubuntu 10.04
nVidia Corporation NV25 [GeForce4 Ti 4400] rev 163
3.0.4-030004-generic #201108301138 SMP Tue Aug 30 13:13:07 UTC 2011 i686
GNU/Linux
kernel from http://kernel.ubuntu.com/~kernel-ppa/mainline/ 

add repository
http://ppa.launchpad.net/xorg-edgers/ppa/ubuntu
http://ppa.launchpad.net/ubuntu-x-swat/x-updates/ubuntu

Backtrace:
[    19.598] 0: /usr/bin/X (xorg_backtrace+0x3b) [0x80ad18b]
[    19.598] 1: /usr/bin/X (0x8048000+0x60685) [0x80a8685]
[    19.598] 2: (vdso) (__kernel_rt_sigreturn+0x0) [0xb77b740c]
[    19.598] 3: /usr/lib/xorg/modules/drivers/nouveau_drv.so
(0xb732a000+0xc7b3) [0xb73367b3]
[    19.598] 4: /usr/lib/xorg/modules/drivers/nouveau_drv.so
(0xb732a000+0xd168) [0xb7337168]
[    19.598] 5: /usr/bin/X (AddScreen+0x198) [0x808d2b8]
[    19.598] 6: /usr/bin/X (InitOutput+0x228) [0x80b17f8]
[    19.598] 7: /usr/bin/X (0x8048000+0x1eb4b) [0x8066b4b]
[    19.598] 8: /lib/tls/i686/cmov/libc.so.6 (__libc_start_main+0xe6)
[0xb74d3bd6]
[    19.598] 9: /usr/bin/X (0x8048000+0x1e8f1) [0x80668f1]
[    19.598] Segmentation fault at address 0x6000
[    19.598] 
Fatal server error:
[    19.598] Caught signal 11 (Segmentation fault). Server aborting

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
