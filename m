From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 68488] New: Lockup and reboot on T61 with nouveau
	driver/exa
Date: Fri, 23 Aug 2013 21:26:28 +0000
Message-ID: <bug-68488-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0645307428=="
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


--===============0645307428==
Content-Type: multipart/alternative; boundary="1377293188.E7faC1f12.13225"; charset="us-ascii"


--1377293188.E7faC1f12.13225
Date: Fri, 23 Aug 2013 21:26:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=68488

          Priority: medium
            Bug ID: 68488
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Lockup and reboot on T61 with nouveau driver/exa
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: major
    Classification: Unclassified
                OS: All
          Reporter: a9016009-Mmb7MZpHnFY@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 84540
  --> https://bugs.freedesktop.org/attachment.cgi?id=84540&action=edit
Full Xorg.1.log file

xorg-x11-drv-nouveau-1.0.9-1.fc19.i686
xorg-x11-server-Xorg-1.14.2-9.fc19.i686
kernel-PAE-3.10.7-200.fc19.i686

For about two or three weeks now my Lenovo Thinkpad T61 with Fedora 19 suddenly
locks (mouse does not move; no switching to console possible; music loops) and
decides to reboot after a few seconds. This is unfortunate.

The culprit seems to be doing an interaction with Firefox (closing a tab,
switching to another application) triggering an issue lower in the stack.


Attached X.org.log has a backtrace at the very end:


[ 79121.354] nouveau_exa_upload_to_screen:384 - falling back to memcpy ignores
tiling
[ 79121.981] (EE) 
[ 79121.981] (EE) Backtrace:
[ 79122.286] (EE) 0: /usr/bin/X (OsLookupColor+0x136) [0x80b69c6]
[ 79125.656] (EE) 1: ? (?+0x136) [0xb7740541]
[ 79125.892] (EE) 2: /lib/libpixman-1.so.0 (pixman_region_union+0x67)
[0x481be347]
[ 79125.893] (EE) 3: /usr/lib/xorg/modules/libexa.so (exaMoveOutPixmap+0x116e)
[0xb75a004e]
[ 79125.893] (EE) 4: /usr/lib/xorg/modules/libexa.so (exaMoveOutPixmap+0x1807)
[0xb75a0da7]
[ 79125.894] (EE) 5: /usr/lib/xorg/modules/libexa.so (exaMoveOutPixmap+0x37b7)
[0xb75a4bf7]
[ 79125.894] (EE) 6: /usr/lib/xorg/modules/libexa.so (exaWaitSync+0xe0)
[0xb759de20]
[ 79125.895] (EE) 7: /usr/lib/xorg/modules/libexa.so
(exaEnableDisableFBAccess+0xf09) [0xb75a8b29]
[ 79125.895] (EE) 8: /usr/lib/xorg/modules/libexa.so
(exaEnableDisableFBAccess+0x1cc6) [0xb75aa4a6]
[ 79125.895] (EE) 9: /usr/lib/xorg/modules/libexa.so
(exaEnableDisableFBAccess+0x1e05) [0xb75aa5e5]
[ 79125.896] (EE) 10: /usr/bin/X (DamageRegionAppend+0x670) [0x8176e60]
[ 79125.975] (EE) 11: /usr/bin/X (CompositePicture+0x2a0) [0x816b3c0]
[ 79125.975] (EE) 12: /usr/lib/xorg/modules/libexa.so
(exaEnableDisableFBAccess+0x2a51) [0xb75ac411]
[ 79125.976] (EE) 13: /usr/bin/X (CompositeTrapezoids+0x9f) [0x816b66f]
[ 79125.976] (EE) 14: /usr/bin/X (AddTraps+0x5046) [0x8175856]
[ 79125.976] (EE) 15: /usr/bin/X (AddTraps+0x19e) [0x816bc3e]
[ 79125.976] (EE) 16: /usr/bin/X (SendErrorToClient+0x3dd) [0x807a84d]
[ 79125.977] (EE) 17: /usr/bin/X (_init+0x4659) [0x806c6a9]
[ 79126.016] (EE) 18: /lib/libc.so.6 (__libc_start_main+0xf3) [0x46f69963]
[ 79126.016] (EE) 19: /usr/bin/X (_start+0x21) [0x806884a]
[ 79126.017] (EE) 
[ 79126.017] (EE) Segmentation fault at address 0x3
[ 79126.017] (EE) 
Fatal server error:
[ 79126.017] (EE) Caught signal 11 (Segmentation fault). Server aborting



$:andre\> sudo lspci -nn
00:00.0 Host bridge [0600]: Intel Corporation Mobile PM965/GM965/GL960 Memory
Controller Hub [8086:2a00] (rev 0c)
00:01.0 PCI bridge [0604]: Intel Corporation Mobile PM965/GM965/GL960 PCI
Express Root Port [8086:2a01] (rev 0c)
00:19.0 Ethernet controller [0200]: Intel Corporation 82566MM Gigabit Network
Connection [8086:1049] (rev 03)
00:1a.0 USB controller [0c03]: Intel Corporation 82801H (ICH8 Family) USB UHCI
Controller #4 [8086:2834] (rev 03)
00:1a.1 USB controller [0c03]: Intel Corporation 82801H (ICH8 Family) USB UHCI
Controller #5 [8086:2835] (rev 03)
00:1a.7 USB controller [0c03]: Intel Corporation 82801H (ICH8 Family) USB2 EHCI
Controller #2 [8086:283a] (rev 03)
00:1b.0 Audio device [0403]: Intel Corporation 82801H (ICH8 Family) HD Audio
Controller [8086:284b] (rev 03)
00:1c.0 PCI bridge [0604]: Intel Corporation 82801H (ICH8 Family) PCI Express
Port 1 [8086:283f] (rev 03)
00:1c.1 PCI bridge [0604]: Intel Corporation 82801H (ICH8 Family) PCI Express
Port 2 [8086:2841] (rev 03)
00:1c.2 PCI bridge [0604]: Intel Corporation 82801H (ICH8 Family) PCI Express
Port 3 [8086:2843] (rev 03)
00:1c.3 PCI bridge [0604]: Intel Corporation 82801H (ICH8 Family) PCI Express
Port 4 [8086:2845] (rev 03)
00:1c.4 PCI bridge [0604]: Intel Corporation 82801H (ICH8 Family) PCI Express
Port 5 [8086:2847] (rev 03)
00:1d.0 USB controller [0c03]: Intel Corporation 82801H (ICH8 Family) USB UHCI
Controller #1 [8086:2830] (rev 03)
00:1d.1 USB controller [0c03]: Intel Corporation 82801H (ICH8 Family) USB UHCI
Controller #2 [8086:2831] (rev 03)
00:1d.2 USB controller [0c03]: Intel Corporation 82801H (ICH8 Family) USB UHCI
Controller #3 [8086:2832] (rev 03)
00:1d.7 USB controller [0c03]: Intel Corporation 82801H (ICH8 Family) USB2 EHCI
Controller #1 [8086:2836] (rev 03)
00:1e.0 PCI bridge [0604]: Intel Corporation 82801 Mobile PCI Bridge
[8086:2448] (rev f3)
00:1f.0 ISA bridge [0601]: Intel Corporation 82801HEM (ICH8M-E) LPC Interface
Controller [8086:2811] (rev 03)
00:1f.1 IDE interface [0101]: Intel Corporation 82801HM/HEM (ICH8M/ICH8M-E) IDE
Controller [8086:2850] (rev 03)
00:1f.2 SATA controller [0106]: Intel Corporation 82801HM/HEM (ICH8M/ICH8M-E)
SATA Controller [AHCI mode] [8086:2829] (rev 03)
00:1f.3 SMBus [0c05]: Intel Corporation 82801H (ICH8 Family) SMBus Controller
[8086:283e] (rev 03)
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation G86M [Quadro NVS
140M] [10de:0429] (rev a1)
03:00.0 Network controller [0280]: Intel Corporation PRO/Wireless 4965 AG or
AGN [Kedron] Network Connection [8086:4230] (rev 61)
15:00.0 CardBus bridge [0607]: Ricoh Co Ltd RL5c476 II [1180:0476] (rev ba)
15:00.1 FireWire (IEEE 1394) [0c00]: Ricoh Co Ltd R5C832 IEEE 1394 Controller
[1180:0832] (rev 04)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377293188.E7faC1f12.13225
Date: Fri, 23 Aug 2013 21:26:28 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Lockup and reboot on T61 with nouveau driver/exa"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68488">68488</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Lockup and reboot on T61 with nouveau driver/exa
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>a9016009&#64;gmx.de
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=84540" name="attach_84540" title="Full Xorg.1.log file">attachment 84540</a> <a href="attachment.cgi?id=84540&amp;action=edit" title="Full Xorg.1.log file">[details]</a></span>
Full Xorg.1.log file

xorg-x11-drv-nouveau-1.0.9-1.fc19.i686
xorg-x11-server-Xorg-1.14.2-9.fc19.i686
kernel-PAE-3.10.7-200.fc19.i686

For about two or three weeks now my Lenovo Thinkpad T61 with Fedora 19 suddenly
locks (mouse does not move; no switching to console possible; music loops) and
decides to reboot after a few seconds. This is unfortunate.

The culprit seems to be doing an interaction with Firefox (closing a tab,
switching to another application) triggering an issue lower in the stack.


Attached X.org.log has a backtrace at the very end:


[ 79121.354] nouveau_exa_upload_to_screen:384 - falling back to memcpy ignores
tiling
[ 79121.981] (EE) 
[ 79121.981] (EE) Backtrace:
[ 79122.286] (EE) 0: /usr/bin/X (OsLookupColor+0x136) [0x80b69c6]
[ 79125.656] (EE) 1: ? (?+0x136) [0xb7740541]
[ 79125.892] (EE) 2: /lib/libpixman-1.so.0 (pixman_region_union+0x67)
[0x481be347]
[ 79125.893] (EE) 3: /usr/lib/xorg/modules/libexa.so (exaMoveOutPixmap+0x116e)
[0xb75a004e]
[ 79125.893] (EE) 4: /usr/lib/xorg/modules/libexa.so (exaMoveOutPixmap+0x1807)
[0xb75a0da7]
[ 79125.894] (EE) 5: /usr/lib/xorg/modules/libexa.so (exaMoveOutPixmap+0x37b7)
[0xb75a4bf7]
[ 79125.894] (EE) 6: /usr/lib/xorg/modules/libexa.so (exaWaitSync+0xe0)
[0xb759de20]
[ 79125.895] (EE) 7: /usr/lib/xorg/modules/libexa.so
(exaEnableDisableFBAccess+0xf09) [0xb75a8b29]
[ 79125.895] (EE) 8: /usr/lib/xorg/modules/libexa.so
(exaEnableDisableFBAccess+0x1cc6) [0xb75aa4a6]
[ 79125.895] (EE) 9: /usr/lib/xorg/modules/libexa.so
(exaEnableDisableFBAccess+0x1e05) [0xb75aa5e5]
[ 79125.896] (EE) 10: /usr/bin/X (DamageRegionAppend+0x670) [0x8176e60]
[ 79125.975] (EE) 11: /usr/bin/X (CompositePicture+0x2a0) [0x816b3c0]
[ 79125.975] (EE) 12: /usr/lib/xorg/modules/libexa.so
(exaEnableDisableFBAccess+0x2a51) [0xb75ac411]
[ 79125.976] (EE) 13: /usr/bin/X (CompositeTrapezoids+0x9f) [0x816b66f]
[ 79125.976] (EE) 14: /usr/bin/X (AddTraps+0x5046) [0x8175856]
[ 79125.976] (EE) 15: /usr/bin/X (AddTraps+0x19e) [0x816bc3e]
[ 79125.976] (EE) 16: /usr/bin/X (SendErrorToClient+0x3dd) [0x807a84d]
[ 79125.977] (EE) 17: /usr/bin/X (_init+0x4659) [0x806c6a9]
[ 79126.016] (EE) 18: /lib/libc.so.6 (__libc_start_main+0xf3) [0x46f69963]
[ 79126.016] (EE) 19: /usr/bin/X (_start+0x21) [0x806884a]
[ 79126.017] (EE) 
[ 79126.017] (EE) Segmentation fault at address 0x3
[ 79126.017] (EE) 
Fatal server error:
[ 79126.017] (EE) Caught signal 11 (Segmentation fault). Server aborting



$:andre\&gt; sudo lspci -nn
00:00.0 Host bridge [0600]: Intel Corporation Mobile PM965/GM965/GL960 Memory
Controller Hub [8086:2a00] (rev 0c)
00:01.0 PCI bridge [0604]: Intel Corporation Mobile PM965/GM965/GL960 PCI
Express Root Port [8086:2a01] (rev 0c)
00:19.0 Ethernet controller [0200]: Intel Corporation 82566MM Gigabit Network
Connection [8086:1049] (rev 03)
00:1a.0 USB controller [0c03]: Intel Corporation 82801H (ICH8 Family) USB UHCI
Controller #4 [8086:2834] (rev 03)
00:1a.1 USB controller [0c03]: Intel Corporation 82801H (ICH8 Family) USB UHCI
Controller #5 [8086:2835] (rev 03)
00:1a.7 USB controller [0c03]: Intel Corporation 82801H (ICH8 Family) USB2 EHCI
Controller #2 [8086:283a] (rev 03)
00:1b.0 Audio device [0403]: Intel Corporation 82801H (ICH8 Family) HD Audio
Controller [8086:284b] (rev 03)
00:1c.0 PCI bridge [0604]: Intel Corporation 82801H (ICH8 Family) PCI Express
Port 1 [8086:283f] (rev 03)
00:1c.1 PCI bridge [0604]: Intel Corporation 82801H (ICH8 Family) PCI Express
Port 2 [8086:2841] (rev 03)
00:1c.2 PCI bridge [0604]: Intel Corporation 82801H (ICH8 Family) PCI Express
Port 3 [8086:2843] (rev 03)
00:1c.3 PCI bridge [0604]: Intel Corporation 82801H (ICH8 Family) PCI Express
Port 4 [8086:2845] (rev 03)
00:1c.4 PCI bridge [0604]: Intel Corporation 82801H (ICH8 Family) PCI Express
Port 5 [8086:2847] (rev 03)
00:1d.0 USB controller [0c03]: Intel Corporation 82801H (ICH8 Family) USB UHCI
Controller #1 [8086:2830] (rev 03)
00:1d.1 USB controller [0c03]: Intel Corporation 82801H (ICH8 Family) USB UHCI
Controller #2 [8086:2831] (rev 03)
00:1d.2 USB controller [0c03]: Intel Corporation 82801H (ICH8 Family) USB UHCI
Controller #3 [8086:2832] (rev 03)
00:1d.7 USB controller [0c03]: Intel Corporation 82801H (ICH8 Family) USB2 EHCI
Controller #1 [8086:2836] (rev 03)
00:1e.0 PCI bridge [0604]: Intel Corporation 82801 Mobile PCI Bridge
[8086:2448] (rev f3)
00:1f.0 ISA bridge [0601]: Intel Corporation 82801HEM (ICH8M-E) LPC Interface
Controller [8086:2811] (rev 03)
00:1f.1 IDE interface [0101]: Intel Corporation 82801HM/HEM (ICH8M/ICH8M-E) IDE
Controller [8086:2850] (rev 03)
00:1f.2 SATA controller [0106]: Intel Corporation 82801HM/HEM (ICH8M/ICH8M-E)
SATA Controller [AHCI mode] [8086:2829] (rev 03)
00:1f.3 SMBus [0c05]: Intel Corporation 82801H (ICH8 Family) SMBus Controller
[8086:283e] (rev 03)
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation G86M [Quadro NVS
140M] [10de:0429] (rev a1)
03:00.0 Network controller [0280]: Intel Corporation PRO/Wireless 4965 AG or
AGN [Kedron] Network Connection [8086:4230] (rev 61)
15:00.0 CardBus bridge [0607]: Ricoh Co Ltd RL5c476 II [1180:0476] (rev ba)
15:00.1 FireWire (IEEE 1394) [0c00]: Ricoh Co Ltd R5C832 IEEE 1394 Controller
[1180:0832] (rev 04)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377293188.E7faC1f12.13225--

--===============0645307428==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0645307428==--
