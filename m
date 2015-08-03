From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91535] New: Chrome can cause a nouveau 'multiple
 instances of buffer' message when overlaying a menu leading to X lockup
Date: Mon, 03 Aug 2015 00:44:37 +0000
Message-ID: <bug-91535-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0289048733=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0289048733==
Content-Type: multipart/alternative; boundary="1438562677.CBEE251.25464"; charset="UTF-8"


--1438562677.CBEE251.25464
Date: Mon, 3 Aug 2015 00:44:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91535

            Bug ID: 91535
           Summary: Chrome can cause a nouveau 'multiple instances of
                    buffer' message when overlaying a menu leading to X
                    lockup
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: pure.logic-SyKdqv6vbfZdzvEItQ6vdLNAH6kLmebB@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Chrome Version 44.0.2403.125 (64-bit) on ubuntu with 
libdrm-2.4.60, libdrm-2.4.56 and Peter Hurley's libdrm-2.4.60 with the fix
applied for this bug : https://bugs.freedesktop.org/show_bug.cgi?id=89842#c19
can cause the kernel driver to reject validation of a push_buffer from the
nouveau push_buffer logic in nouveau_pushbuf_kick, leading to the following
message

nouveau E[chrome[2737]] multiple instances of buffer 33 on validation list 
nouveau E[chrome[2737]] validate_init 
nouveau E[chrome[2737]] validate: -22 
nouveau E[chrome[2737]] multiple instances of buffer 18 on validation list 
nouveau E[chrome[2737]] validate_init 
nouveau E[chrome[2737]] validate: -22 
nouveau E[ PFIFO][0000:01:00.0] PFIFO: read fault at 
0x0003e21000 [PAGE_NOT_PRESENT] from (unknown enum 
0x00000000)/GPC0/(unknown enum 0x0000000f) on channel 0x007f80c000 
[unknown] 

The following work-around works for me on Linux 4.2-rc4

http://www.gossamer-threads.com/lists/linux/kernel/2228405

Where I tell the kernel to 'continue' if it already has mapped memory specified
in a push buffer for a given PID.

Using that work-around means I still get the 'multiple instances' error message
but, it's not treated as fatal and so far has been completely stable for me.

The feedback from LKML was that this is probably a bug in libdrm.

I've downloaded and run the test associated with bug 89842 i.e.
libdrm-2.4.60/tests/nouveau/threaded.c using various versions of libdrm2 as
suggested on LKML and I can confirm that the race condition the test tests for
is not present.

Launchpad PPA @ ppa:phurley/libdrm - 2.4.60 with bugfix 89842 applied does not
fault on the threaded test libdrm-2.4.60/tests/nouveau/threaded.c but does get
into a 'multiple instances' state on the nouveau push_buf list - again on the
stock ubuntu kernel and the tip-of-tree 4.2-rcX

deckard@aineko:~/Development/nouveau/libdrm-2.4.60$ dpkg -s libdrm2
Package: libdrm2
Status: install ok installed
Priority: optional
Section: libs
Installed-Size: 106
Maintainer: Debian X Strike Force <debian-x-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org>
Architecture: amd64
Multi-Arch: same
Source: libdrm
Version: 2.4.60-2ppa1~trusty1
Depends: libc6 (>= 2.17)
Pre-Depends: multiarch-support
Description: Userspace interface to kernel DRM services -- runtime
 This library implements the userspace interface to the kernel DRM
 services.  DRM stands for "Direct Rendering Manager", which is the
 kernelspace portion of the "Direct Rendering Infrastructure" (DRI).
 The DRI is currently used on Linux to provide hardware-accelerated
 OpenGL drivers.
 .
 This package provides the runtime environment for libdrm.

deckard@aineko:~/Development/nouveau/libdrm-2.4.60$ uname -a
Linux aineko 4.2.0-rc4+ #50 SMP Thu Jul 30 01:22:01 IST 2015 x86_64 x86_64
x86_64 GNU/Linux

Chrome Version 44.0.2403.125 (64-bit)

Steps to replicate:

Run the version of chrome indicated above. Open a number of tabs to different
websites. Click on the horizontal bars in the top right to get the drop-down
menu, and hover the cursor over bookmarks or recent tabs.

This process is a bit hit and miss and make take a unknown number of tabs/time
to elicit the behaviour, sorry I can't be more concise at this point.

It's not clear if bug 89842 will fix all or some of the issues reported in this
Ubuntu thread : http://tinyurl.com/orvbzf3 but, I've verified the test program
developed to debug that race condition doesn't cause a mjultiple instances
message on my machine.

2014 Macbook pro - running bunutu 14.04, issue is present with stock ubuntu
kernel and the 4.2-rcX kernel I'm using to debug this issue.

01:00.0 VGA compatible controller: NVIDIA Corporation GK107M [GeForce GT 750M
Mac Edition] (rev a1) (prog-if 00 [VGA controller])
    Subsystem: Apple Inc. Device 0130
    Flags: bus master, fast devsel, latency 0, IRQ 45
    Memory at c0000000 (32-bit, non-prefetchable) [size=16M]
    Memory at 80000000 (64-bit, prefetchable) [size=256M]
    Memory at 90000000 (64-bit, prefetchable) [size=32M]
    I/O ports at 1000 [size=128]
    Expansion ROM at c1000000 [disabled] [size=512K]
    Capabilities: [60] Power Management version 3
    Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
    Capabilities: [78] Express Endpoint, MSI 00
    Capabilities: [b4] Vendor Specific Information: Len=14 <?>
    Capabilities: [100] Virtual Channel
    Capabilities: [128] Power Budgeting <?>
    Capabilities: [420] Advanced Error Reporting
    Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024 <?>
    Capabilities: [900] #19
    Kernel driver in use: nouveau

01:00.1 Audio device: NVIDIA Corporation GK107 HDMI Audio Controller (rev a1)
    Subsystem: Apple Inc. Device 0130
    Flags: bus master, fast devsel, latency 0, IRQ 17
    Memory at c1080000 (32-bit, non-prefetchable) [size=16K]
    Capabilities: [60] Power Management version 3
    Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
    Capabilities: [78] Express Endpoint, MSI 00
    Kernel driver in use: snd_hda_intel

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1438562677.CBEE251.25464
Date: Mon, 3 Aug 2015 00:44:37 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Chrome can cause a nouveau 'multiple instances of buffer' message when overlaying a menu leading to X lockup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91535">91535</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Chrome can cause a nouveau 'multiple instances of buffer' message when overlaying a menu leading to X lockup
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>critical
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>pure.logic&#64;nexus-software.ie
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Chrome Version 44.0.2403.125 (64-bit) on ubuntu with 
libdrm-2.4.60, libdrm-2.4.56 and Peter Hurley's libdrm-2.4.60 with the fix
applied for this bug : <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - Nvidia nouveau drivers hangs all gnome when opening the new legacy tray (and many other situations) in 3.16.0"
   href="show_bug.cgi?id=89842#c19">https://bugs.freedesktop.org/show_bug.cgi?id=89842#c19</a>
can cause the kernel driver to reject validation of a push_buffer from the
nouveau push_buffer logic in nouveau_pushbuf_kick, leading to the following
message

nouveau E[chrome[2737]] multiple instances of buffer 33 on validation list 
nouveau E[chrome[2737]] validate_init 
nouveau E[chrome[2737]] validate: -22 
nouveau E[chrome[2737]] multiple instances of buffer 18 on validation list 
nouveau E[chrome[2737]] validate_init 
nouveau E[chrome[2737]] validate: -22 
nouveau E[ PFIFO][0000:01:00.0] PFIFO: read fault at 
0x0003e21000 [PAGE_NOT_PRESENT] from (unknown enum 
0x00000000)/GPC0/(unknown enum 0x0000000f) on channel 0x007f80c000 
[unknown] 

The following work-around works for me on Linux 4.2-rc4

<a href="http://www.gossamer-threads.com/lists/linux/kernel/2228405">http://www.gossamer-threads.com/lists/linux/kernel/2228405</a>

Where I tell the kernel to 'continue' if it already has mapped memory specified
in a push buffer for a given PID.

Using that work-around means I still get the 'multiple instances' error message
but, it's not treated as fatal and so far has been completely stable for me.

The feedback from LKML was that this is probably a bug in libdrm.

I've downloaded and run the test associated with <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - Nvidia nouveau drivers hangs all gnome when opening the new legacy tray (and many other situations) in 3.16.0"
   href="show_bug.cgi?id=89842">bug 89842</a> i.e.
libdrm-2.4.60/tests/nouveau/threaded.c using various versions of libdrm2 as
suggested on LKML and I can confirm that the race condition the test tests for
is not present.

Launchpad PPA &#64; ppa:phurley/libdrm - 2.4.60 with bugfix 89842 applied does not
fault on the threaded test libdrm-2.4.60/tests/nouveau/threaded.c but does get
into a 'multiple instances' state on the nouveau push_buf list - again on the
stock ubuntu kernel and the tip-of-tree 4.2-rcX

deckard&#64;aineko:~/Development/nouveau/libdrm-2.4.60$ dpkg -s libdrm2
Package: libdrm2
Status: install ok installed
Priority: optional
Section: libs
Installed-Size: 106
Maintainer: Debian X Strike Force &lt;<a href="mailto:debian-x&#64;lists.debian.org">debian-x&#64;lists.debian.org</a>&gt;
Architecture: amd64
Multi-Arch: same
Source: libdrm
Version: 2.4.60-2ppa1~trusty1
Depends: libc6 (&gt;= 2.17)
Pre-Depends: multiarch-support
Description: Userspace interface to kernel DRM services -- runtime
 This library implements the userspace interface to the kernel DRM
 services.  DRM stands for &quot;Direct Rendering Manager&quot;, which is the
 kernelspace portion of the &quot;Direct Rendering Infrastructure&quot; (DRI).
 The DRI is currently used on Linux to provide hardware-accelerated
 OpenGL drivers.
 .
 This package provides the runtime environment for libdrm.

deckard&#64;aineko:~/Development/nouveau/libdrm-2.4.60$ uname -a
Linux aineko 4.2.0-rc4+ #50 SMP Thu Jul 30 01:22:01 IST 2015 x86_64 x86_64
x86_64 GNU/Linux

Chrome Version 44.0.2403.125 (64-bit)

Steps to replicate:

Run the version of chrome indicated above. Open a number of tabs to different
websites. Click on the horizontal bars in the top right to get the drop-down
menu, and hover the cursor over bookmarks or recent tabs.

This process is a bit hit and miss and make take a unknown number of tabs/time
to elicit the behaviour, sorry I can't be more concise at this point.

It's not clear if <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - Nvidia nouveau drivers hangs all gnome when opening the new legacy tray (and many other situations) in 3.16.0"
   href="show_bug.cgi?id=89842">bug 89842</a> will fix all or some of the issues reported in this
Ubuntu thread : <a href="http://tinyurl.com/orvbzf3">http://tinyurl.com/orvbzf3</a> but, I've verified the test program
developed to debug that race condition doesn't cause a mjultiple instances
message on my machine.

2014 Macbook pro - running bunutu 14.04, issue is present with stock ubuntu
kernel and the 4.2-rcX kernel I'm using to debug this issue.

01:00.0 VGA compatible controller: NVIDIA Corporation GK107M [GeForce GT 750M
Mac Edition] (rev a1) (prog-if 00 [VGA controller])
    Subsystem: Apple Inc. Device 0130
    Flags: bus master, fast devsel, latency 0, IRQ 45
    Memory at c0000000 (32-bit, non-prefetchable) [size=16M]
    Memory at 80000000 (64-bit, prefetchable) [size=256M]
    Memory at 90000000 (64-bit, prefetchable) [size=32M]
    I/O ports at 1000 [size=128]
    Expansion ROM at c1000000 [disabled] [size=512K]
    Capabilities: [60] Power Management version 3
    Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
    Capabilities: [78] Express Endpoint, MSI 00
    Capabilities: [b4] Vendor Specific Information: Len=14 &lt;?&gt;
    Capabilities: [100] Virtual Channel
    Capabilities: [128] Power Budgeting &lt;?&gt;
    Capabilities: [420] Advanced Error Reporting
    Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024 &lt;?&gt;
    Capabilities: [900] #19
    Kernel driver in use: nouveau

01:00.1 Audio device: NVIDIA Corporation GK107 HDMI Audio Controller (rev a1)
    Subsystem: Apple Inc. Device 0130
    Flags: bus master, fast devsel, latency 0, IRQ 17
    Memory at c1080000 (32-bit, non-prefetchable) [size=16K]
    Capabilities: [60] Power Management version 3
    Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
    Capabilities: [78] Express Endpoint, MSI 00
    Kernel driver in use: snd_hda_intel</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1438562677.CBEE251.25464--

--===============0289048733==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0289048733==--
