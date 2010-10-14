From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 30865] New: Segfault after upgrading xorg-edgers
 Nouveau a couple of commits
Date: Thu, 14 Oct 2010 04:18:04 -0700 (PDT)
Message-ID: <bug-30865-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=30865

           Summary: Segfault after upgrading xorg-edgers Nouveau a couple
                    of commits
           Product: xorg
           Version: git
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: nigel-MhVfhJ0qHmuWn91e4EydUaxOck334EZe@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


After upgrading xorg-edgers to the latest release, I'm unable to use...

Old versions:
libdrm2 2.4.22+git20100929.624e58e3-0ubuntu0sarvatt~lucid
libdrm-nouveau1 2.4.22+git20100929.624e58e3-0ubuntu0sarvatt~lucid
libkms1 2.4.22+git20100929.624e58e3-0ubuntu0sarvatt~lucid
xserver-xorg-video-nouveau 1:0.0.16+git20101003.9a5142fa-0ubuntu0sarvatt~lucid

New versions:
libdrm2 2.4.22+git20101012.09b10626-0ubuntu0sarvatt~lucid
libdrm-nouveau1 2.4.22+git20101012.09b10626-0ubuntu0sarvatt~lucid
libkms1 2.4.22+git20101012.09b10626-0ubuntu0sarvatt~lucid
xserver-xorg-video-nouveau 1:0.0.16+git20101003.9a5142fa-0ubuntu0sarvatt~lucid

Xorg's error log contains

[    11.642] (II) Initializing built-in extension COMPOSITE
[    11.642] (II) Initializing built-in extension DAMAGE
[    11.733] 
Backtrace:
[    11.733] 0: /usr/bin/X (xorg_backtrace+0x3b) [0x80ad18b]
[    11.733] 1: /usr/bin/X (0x8048000+0x60685) [0x80a8685]
[    11.733] 2: (vdso) (__kernel_rt_sigreturn+0x0) [0xb785640c]
[    11.733] 3: /usr/lib/dri/nouveau_dri.so (0xb618b000+0x15e291) [0xb62e9291]
[    11.734] Segmentation fault at address 0xa0
[    11.734] 
Fatal server error:
[    11.734] Caught signal 11 (Segmentation fault). Server aborting

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
