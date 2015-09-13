From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91988] New: nouveau causes complete system hang -
 SCHED_ERROR CTXSW_TIMEOUT PGRAPH engine fault PBDMA0 ACQUIRE
Date: Sun, 13 Sep 2015 00:16:27 +0000
Message-ID: <bug-91988-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0569872076=="
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


--===============0569872076==
Content-Type: multipart/alternative; boundary="1442103387.175C1.11874"; charset="UTF-8"


--1442103387.175C1.11874
Date: Sun, 13 Sep 2015 00:16:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91988

            Bug ID: 91988
           Summary: nouveau causes complete system hang - SCHED_ERROR
                    CTXSW_TIMEOUT PGRAPH engine fault PBDMA0 ACQUIRE
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: jamespharvey20-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

I experience a complete lockup every 1-3 days, except the mouse cursor still
moves.  Keyboard LED's don't flash.  Num/Caps/Scroll Lock doesn't toggle the
keyboard LED's.  Can't switch to text tty's.  Can't ping its IP or ssh into
from another machine.  Proprietary nVidia driver works fine.  This has been
happening since I switched to nouveau a few months ago.

JOURNALCTL SHOWS (VIEWABLE AFTER REBOOT)
Sep 12 08:45:39 kvm kernel: nouveau E[   PFIFO][0000:06:00.0] SCHED_ERROR [
CTXSW_TIMEOUT ]
Sep 12 08:45:39 kvm kernel: nouveau E[   PFIFO][0000:06:00.0] PGRAPH engine
fault on channel 7, recovering...
Sep 12 09:22:18 kvm kernel: nouveau E[   PFIFO][0000:06:00.0] PBDMA0: ACQUIRE
Sep 12 09:22:18 kvm kernel: nouveau E[   PFIFO][0000:06:00.0] PBDMA0: ch 2
[Xorg[655]] subc 0 mthd 0x001c data 0x00001004
{{{ then the last 2 lines repeat for about 50 lines, the nothing more is logged
until the reboot }}}

SYSTEM NOTES
microcode: Microcode Update Driver: v2.00 <tigran-ppwZ4lME3+KI6QP4U9MhSdBc4/FLrbF6@public.gmane.org>, Peter
Oruba
No overclocking
Inside thoroughly vacuumed regularly, no dust blocking heatsink, all
temperatures in good range
lspci -k viewable here: http://pastebin.ca/3160329
lsusb viewable here: http://pastebin.ca/3160278
lsusb -t viewable here: http://pastebin.ca/3160279
Single hard drive, passes extensive testing, btrfs
Most recent motherboard BIOS - MSI X99S SLI PLUS (1.8 3/20/2015)
Most recent VGA BIOS - XFX nVidia GeForce GT 640 2GB (7/14/2012)

SYSTEM SPECIFICATIONS
DMI: MSI MS-7885/X99S SLI PLUS (MS-7885), BIOS 1.80 03/20/2015
Haswell-E -- smpboot: CPU0: Intel(R) Core(TM) i7-5820K CPU @ 3.30GHz (fam: 06,
model: 3f, stepping: 02)
Linux version 4.1.6-1-ARCH (builduser@tobias) (gcc version 5.2.0 (GCC) ) #1 SMP
PREEMPT Mon Aug 17 08:52:28 CEST 2015
Memory: 32840088K/33447336K available (5699K kernel code, 893K rwdata, 1732K
rodata, 1180K init, 1152K bss, 607248K reserved, 0K cma-reserved)
06:00.0 VGA compatible controller: NVIDIA Corporation GK107 [GeForce GT 640]
(rev a1)
Model=TOSHIBA MD04ACA500, FwRev=FP2A --- Plugged into motherboard SATA, no SATA
controllers
KDE plasma-desktop/workspace 5.4.1-2
nouveau driver 1.0.11-3

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1442103387.175C1.11874
Date: Sun, 13 Sep 2015 00:16:27 +0000
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
   title="NEW - nouveau causes complete system hang - SCHED_ERROR CTXSW_TIMEOUT PGRAPH engine fault PBDMA0 ACQUIRE"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91988">91988</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau causes complete system hang - SCHED_ERROR CTXSW_TIMEOUT PGRAPH engine fault PBDMA0 ACQUIRE
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
          <td>All
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
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
          <td>jamespharvey20&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I experience a complete lockup every 1-3 days, except the mouse cursor still
moves.  Keyboard LED's don't flash.  Num/Caps/Scroll Lock doesn't toggle the
keyboard LED's.  Can't switch to text tty's.  Can't ping its IP or ssh into
from another machine.  Proprietary nVidia driver works fine.  This has been
happening since I switched to nouveau a few months ago.

JOURNALCTL SHOWS (VIEWABLE AFTER REBOOT)
Sep 12 08:45:39 kvm kernel: nouveau E[   PFIFO][0000:06:00.0] SCHED_ERROR [
CTXSW_TIMEOUT ]
Sep 12 08:45:39 kvm kernel: nouveau E[   PFIFO][0000:06:00.0] PGRAPH engine
fault on channel 7, recovering...
Sep 12 09:22:18 kvm kernel: nouveau E[   PFIFO][0000:06:00.0] PBDMA0: ACQUIRE
Sep 12 09:22:18 kvm kernel: nouveau E[   PFIFO][0000:06:00.0] PBDMA0: ch 2
[Xorg[655]] subc 0 mthd 0x001c data 0x00001004
{{{ then the last 2 lines repeat for about 50 lines, the nothing more is logged
until the reboot }}}

SYSTEM NOTES
microcode: Microcode Update Driver: v2.00 &lt;<a href="mailto:tigran&#64;aivazian.fsnet.co.uk">tigran&#64;aivazian.fsnet.co.uk</a>&gt;, Peter
Oruba
No overclocking
Inside thoroughly vacuumed regularly, no dust blocking heatsink, all
temperatures in good range
lspci -k viewable here: <a href="http://pastebin.ca/3160329">http://pastebin.ca/3160329</a>
lsusb viewable here: <a href="http://pastebin.ca/3160278">http://pastebin.ca/3160278</a>
lsusb -t viewable here: <a href="http://pastebin.ca/3160279">http://pastebin.ca/3160279</a>
Single hard drive, passes extensive testing, btrfs
Most recent motherboard BIOS - MSI X99S SLI PLUS (1.8 3/20/2015)
Most recent VGA BIOS - XFX nVidia GeForce GT 640 2GB (7/14/2012)

SYSTEM SPECIFICATIONS
DMI: MSI MS-7885/X99S SLI PLUS (MS-7885), BIOS 1.80 03/20/2015
Haswell-E -- smpboot: CPU0: Intel(R) Core(TM) i7-5820K CPU &#64; 3.30GHz (fam: 06,
model: 3f, stepping: 02)
Linux version 4.1.6-1-ARCH (builduser&#64;tobias) (gcc version 5.2.0 (GCC) ) #1 SMP
PREEMPT Mon Aug 17 08:52:28 CEST 2015
Memory: 32840088K/33447336K available (5699K kernel code, 893K rwdata, 1732K
rodata, 1180K init, 1152K bss, 607248K reserved, 0K cma-reserved)
06:00.0 VGA compatible controller: NVIDIA Corporation GK107 [GeForce GT 640]
(rev a1)
Model=TOSHIBA MD04ACA500, FwRev=FP2A --- Plugged into motherboard SATA, no SATA
controllers
KDE plasma-desktop/workspace 5.4.1-2
nouveau driver 1.0.11-3</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1442103387.175C1.11874--

--===============0569872076==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0569872076==--
