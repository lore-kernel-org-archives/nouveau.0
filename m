From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99482] New: nouveau driver returns -16 trying to
	hibernate
Date: Sat, 21 Jan 2017 15:31:58 +0000
Message-ID: <bug-99482-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1682032655=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1682032655==
Content-Type: multipart/alternative; boundary="14850127180.cCa3559ef.14325";
 charset="UTF-8"


--14850127180.cCa3559ef.14325
Date: Sat, 21 Jan 2017 15:31:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99482

            Bug ID: 99482
           Summary: nouveau driver returns -16 trying to hibernate
           Product: xorg
           Version: 7.7 (2012.06)
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: blocker
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: brian-SquOHqY54CVWr29BmMi2cA@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

I am running Fedora 25 with kernel 4.8.15-300.fc25.x86_64.  I don't actually
actively use the nouveau driver as my machine has an Intel/Nvidia hybrid so=
 I
use the Intel driver for X.  But even when I do that, the nouveau driver ge=
ts
loaded (with 2 references) unless I blacklist it.

So given the above, when I try to hibernate it typically works once but a
second attempt to hibernate (after having been woken up of course) will fail
and the kernel reports:

Jan 20 17:42:15 laptop kernel: PM: Syncing filesystems ... done.
Jan 20 17:42:15 laptop kernel: Freezing user space processes ... (elapsed 0=
.264
seconds) done.
Jan 20 17:42:15 laptop kernel: Double checking all user space processes aft=
er
OOM killer disable... (elapsed 0.000 seconds)
Jan 20 17:42:15 laptop kernel: PM: Marking nosave pages: [mem
0x00000000-0x00000fff]
Jan 20 17:42:15 laptop kernel: PM: Marking nosave pages: [mem
0x0009d000-0x000fffff]
Jan 20 17:42:15 laptop kernel: PM: Marking nosave pages: [mem
0x48b7f000-0x49ffefff]
Jan 20 17:42:15 laptop kernel: PM: Marking nosave pages: [mem
0x4a000000-0xffffffff]
Jan 20 17:42:15 laptop kernel: PM: Basic memory bitmaps created
Jan 20 17:42:15 laptop kernel: PM: Preallocating image memory... done
(allocated 1487391 pages)
Jan 20 17:42:15 laptop kernel: PM: Allocated 5949564 kbytes in 0.34 seconds
(17498.71 MB/s)
Jan 20 17:42:15 laptop kernel: Freezing remaining freezable tasks ... (elap=
sed
0.216 seconds) done.
Jan 20 17:42:15 laptop kernel: Suspending console(s) (use no_console_suspen=
d to
debug)
Jan 20 17:42:15 laptop kernel: tpm tpm0: TPM savestate took 3100ms
Jan 20 17:42:15 laptop kernel: parport_pc 00:04: disabled
Jan 20 17:42:15 laptop kernel: nouveau 0000:01:00.0: DRM: suspending consol=
e...
Jan 20 17:42:15 laptop kernel: nouveau 0000:01:00.0: DRM: suspending displa=
y...
Jan 20 17:42:15 laptop kernel: nouveau 0000:01:00.0: DRM: evicting buffers.=
..
Jan 20 17:42:15 laptop kernel: nouveau 0000:01:00.0: DRM: waiting for kernel
channels to go idle...
Jan 20 17:42:15 laptop kernel: nouveau 0000:01:00.0: DRM: failed to idle
channel 0 [DRM]
Jan 20 17:42:15 laptop kernel: nouveau 0000:01:00.0: DRM: resuming display.=
..
Jan 20 17:42:15 laptop kernel: pci_pm_freeze(): nouveau_pmops_freeze+0x0/0x=
20
[nouveau] returns -16
Jan 20 17:42:15 laptop kernel: dpm_run_callback(): pci_pm_freeze+0x0/0xf0
returns -16
Jan 20 17:42:15 laptop kernel: PM: Device 0000:01:00.0 failed to freeze asy=
nc:
error -16
Jan 20 17:42:15 laptop kernel: usb usb1: root hub lost power or was reset
Jan 20 17:42:15 laptop kernel: usb usb3: root hub lost power or was reset
Jan 20 17:42:15 laptop kernel: usb usb4: root hub lost power or was reset
Jan 20 17:42:15 laptop kernel: usb usb2: root hub lost power or was reset
Jan 20 17:42:15 laptop kernel: ehci-pci 0000:00:1a.0: cache line size of 64=
 is
not supported
Jan 20 17:42:15 laptop kernel: ehci-pci 0000:00:1d.0: cache line size of 64=
 is
not supported
Jan 20 17:42:15 laptop kernel: sd 0:0:0:0: [sda] Starting disk
Jan 20 17:42:15 laptop kernel: pciehp 0000:3c:03.0:pcie204: Device 0000:5f:=
00.0
already exists at 0000:5f:00, cannot hot-add
Jan 20 17:42:15 laptop kernel: pciehp 0000:3c:03.0:pcie204: Cannot add devi=
ce
at 0000:5f:00
Jan 20 17:42:15 laptop kernel: usb 1-1: reset high-speed USB device number 3
using ehci-pci
Jan 20 17:42:15 laptop kernel: usb 2-1: reset high-speed USB device number 2
using ehci-pci
Jan 20 17:42:15 laptop kernel: ata3: SATA link down (SStatus 0 SControl 300)
Jan 20 17:42:15 laptop kernel: ata1: SATA link up 6.0 Gbps (SStatus 133
SControl 300)
Jan 20 17:42:15 laptop kernel: ata1.00: supports DRM functions and may not =
be
fully accessible
Jan 20 17:42:15 laptop kernel: ata4: SATA link down (SStatus 0 SControl 300)
Jan 20 17:42:15 laptop kernel: ata1.00: supports DRM functions and may not =
be
fully accessible
Jan 20 17:42:15 laptop kernel: ata1.00: configured for UDMA/133
Jan 20 17:42:15 laptop kernel: usb 3-7: reset high-speed USB device number 3
using xhci_hcd
Jan 20 17:42:15 laptop kernel: usb 3-5: reset full-speed USB device number 2
using xhci_hcd
Jan 20 17:42:15 laptop kernel: usb 3-12: reset full-speed USB device number=
 4
using xhci_hcd
Jan 20 17:42:15 laptop kernel: rtc_cmos 00:03: System wakeup disabled by AC=
PI
Jan 20 17:42:15 laptop kernel: parport_pc 00:04: activated
Jan 20 17:42:15 laptop kernel: PM: restore of devices complete after 1370.0=
00
msecs

As you can see, the fatal part is the:

Jan 20 17:42:15 laptop kernel: pci_pm_freeze(): nouveau_pmops_freeze+0x0/0x=
20
[nouveau] returns -16
Jan 20 17:42:15 laptop kernel: dpm_run_callback(): pci_pm_freeze+0x0/0xf0
returns -16
Jan 20 17:42:15 laptop kernel: PM: Device 0000:01:00.0 failed to freeze asy=
nc:
error -16

If I do blacklist the nouveau driver completely so that it does not get loa=
ded
into the kernel even, I can hibernate and resume over and over again with no
problem.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14850127180.cCa3559ef.14325
Date: Sat, 21 Jan 2017 15:31:58 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nouveau driver returns -16 trying to hibernate"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99482">99482</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau driver returns -16 trying to hibernate
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>7.7 (2012.06)
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
          <td>blocker
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
          <td>brian&#64;interlinx.bc.ca
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I am running Fedora 25 with kernel 4.8.15-300.fc25.x86_64.  I =
don't actually
actively use the nouveau driver as my machine has an Intel/Nvidia hybrid so=
 I
use the Intel driver for X.  But even when I do that, the nouveau driver ge=
ts
loaded (with 2 references) unless I blacklist it.

So given the above, when I try to hibernate it typically works once but a
second attempt to hibernate (after having been woken up of course) will fail
and the kernel reports:

Jan 20 17:42:15 laptop kernel: PM: Syncing filesystems ... done.
Jan 20 17:42:15 laptop kernel: Freezing user space processes ... (elapsed 0=
.264
seconds) done.
Jan 20 17:42:15 laptop kernel: Double checking all user space processes aft=
er
OOM killer disable... (elapsed 0.000 seconds)
Jan 20 17:42:15 laptop kernel: PM: Marking nosave pages: [mem
0x00000000-0x00000fff]
Jan 20 17:42:15 laptop kernel: PM: Marking nosave pages: [mem
0x0009d000-0x000fffff]
Jan 20 17:42:15 laptop kernel: PM: Marking nosave pages: [mem
0x48b7f000-0x49ffefff]
Jan 20 17:42:15 laptop kernel: PM: Marking nosave pages: [mem
0x4a000000-0xffffffff]
Jan 20 17:42:15 laptop kernel: PM: Basic memory bitmaps created
Jan 20 17:42:15 laptop kernel: PM: Preallocating image memory... done
(allocated 1487391 pages)
Jan 20 17:42:15 laptop kernel: PM: Allocated 5949564 kbytes in 0.34 seconds
(17498.71 MB/s)
Jan 20 17:42:15 laptop kernel: Freezing remaining freezable tasks ... (elap=
sed
0.216 seconds) done.
Jan 20 17:42:15 laptop kernel: Suspending console(s) (use no_console_suspen=
d to
debug)
Jan 20 17:42:15 laptop kernel: tpm tpm0: TPM savestate took 3100ms
Jan 20 17:42:15 laptop kernel: parport_pc 00:04: disabled
Jan 20 17:42:15 laptop kernel: nouveau 0000:01:00.0: DRM: suspending consol=
e...
Jan 20 17:42:15 laptop kernel: nouveau 0000:01:00.0: DRM: suspending displa=
y...
Jan 20 17:42:15 laptop kernel: nouveau 0000:01:00.0: DRM: evicting buffers.=
..
Jan 20 17:42:15 laptop kernel: nouveau 0000:01:00.0: DRM: waiting for kernel
channels to go idle...
Jan 20 17:42:15 laptop kernel: nouveau 0000:01:00.0: DRM: failed to idle
channel 0 [DRM]
Jan 20 17:42:15 laptop kernel: nouveau 0000:01:00.0: DRM: resuming display.=
..
Jan 20 17:42:15 laptop kernel: pci_pm_freeze(): nouveau_pmops_freeze+0x0/0x=
20
[nouveau] returns -16
Jan 20 17:42:15 laptop kernel: dpm_run_callback(): pci_pm_freeze+0x0/0xf0
returns -16
Jan 20 17:42:15 laptop kernel: PM: Device 0000:01:00.0 failed to freeze asy=
nc:
error -16
Jan 20 17:42:15 laptop kernel: usb usb1: root hub lost power or was reset
Jan 20 17:42:15 laptop kernel: usb usb3: root hub lost power or was reset
Jan 20 17:42:15 laptop kernel: usb usb4: root hub lost power or was reset
Jan 20 17:42:15 laptop kernel: usb usb2: root hub lost power or was reset
Jan 20 17:42:15 laptop kernel: ehci-pci 0000:00:1a.0: cache line size of 64=
 is
not supported
Jan 20 17:42:15 laptop kernel: ehci-pci 0000:00:1d.0: cache line size of 64=
 is
not supported
Jan 20 17:42:15 laptop kernel: sd 0:0:0:0: [sda] Starting disk
Jan 20 17:42:15 laptop kernel: pciehp 0000:3c:03.0:pcie204: Device 0000:5f:=
00.0
already exists at 0000:5f:00, cannot hot-add
Jan 20 17:42:15 laptop kernel: pciehp 0000:3c:03.0:pcie204: Cannot add devi=
ce
at 0000:5f:00
Jan 20 17:42:15 laptop kernel: usb 1-1: reset high-speed USB device number 3
using ehci-pci
Jan 20 17:42:15 laptop kernel: usb 2-1: reset high-speed USB device number 2
using ehci-pci
Jan 20 17:42:15 laptop kernel: ata3: SATA link down (SStatus 0 SControl 300)
Jan 20 17:42:15 laptop kernel: ata1: SATA link up 6.0 Gbps (SStatus 133
SControl 300)
Jan 20 17:42:15 laptop kernel: ata1.00: supports DRM functions and may not =
be
fully accessible
Jan 20 17:42:15 laptop kernel: ata4: SATA link down (SStatus 0 SControl 300)
Jan 20 17:42:15 laptop kernel: ata1.00: supports DRM functions and may not =
be
fully accessible
Jan 20 17:42:15 laptop kernel: ata1.00: configured for UDMA/133
Jan 20 17:42:15 laptop kernel: usb 3-7: reset high-speed USB device number 3
using xhci_hcd
Jan 20 17:42:15 laptop kernel: usb 3-5: reset full-speed USB device number 2
using xhci_hcd
Jan 20 17:42:15 laptop kernel: usb 3-12: reset full-speed USB device number=
 4
using xhci_hcd
Jan 20 17:42:15 laptop kernel: rtc_cmos 00:03: System wakeup disabled by AC=
PI
Jan 20 17:42:15 laptop kernel: parport_pc 00:04: activated
Jan 20 17:42:15 laptop kernel: PM: restore of devices complete after 1370.0=
00
msecs

As you can see, the fatal part is the:

Jan 20 17:42:15 laptop kernel: pci_pm_freeze(): nouveau_pmops_freeze+0x0/0x=
20
[nouveau] returns -16
Jan 20 17:42:15 laptop kernel: dpm_run_callback(): pci_pm_freeze+0x0/0xf0
returns -16
Jan 20 17:42:15 laptop kernel: PM: Device 0000:01:00.0 failed to freeze asy=
nc:
error -16

If I do blacklist the nouveau driver completely so that it does not get loa=
ded
into the kernel even, I can hibernate and resume over and over again with no
problem.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14850127180.cCa3559ef.14325--

--===============1682032655==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1682032655==--
