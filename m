From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 85742] GF117M Can *not* use nouveau at all
Date: Mon, 22 Dec 2014 15:01:05 +0000
Message-ID: <bug-85742-8800-eUXBxmhO2c@http.bugs.freedesktop.org/>
References: <bug-85742-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0735431674=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-85742-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0735431674==
Content-Type: multipart/alternative; boundary="1419260464.5e7AFEfD1.6123"; charset="UTF-8"


--1419260464.5e7AFEfD1.6123
Date: Mon, 22 Dec 2014 15:01:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=85742

--- Comment #3 from lampshade-IjDXvh/HVVUAvxtiuMwx3w@public.gmane.org ---
And I have some more info form dmesg from vanilla 3.14.1
[    0.023586] pci 0000:01:00.0: [10de:1140] type 00 class 0x030000
[    0.023595] pci 0000:01:00.0: reg 0x10: [mem 0xb2000000-0xb2ffffff]
[    0.023606] pci 0000:01:00.0: reg 0x14: [mem 0xa0000000-0xafffffff 64bit
pref]
[    0.023617] pci 0000:01:00.0: reg 0x1c: [mem 0xb0000000-0xb1ffffff 64bit
pref]
[    0.023625] pci 0000:01:00.0: reg 0x24: [io  0x2000-0x207f]
[    0.023633] pci 0000:01:00.0: reg 0x30: [mem 0xfff80000-0xffffffff pref]
[    0.023694] vgaarb: device added:
PCI:0000:01:00.0,decodes=io+mem,owns=none,locks=none
[    0.050452] pci 0000:01:00.0: no compatible bridge window for [mem
0xfff80000-0xffffffff pref]
[    0.050497] pci 0000:01:00.0: BAR 6: can't assign mem pref (size 0x80000)
[    0.077544] pci 0000:01:00.0: Signaling PME through PCIe PME interrupt
[    0.938676] nouveau 0000:01:00.0: enabling device (0006 -> 0007)
[    0.938682] nouveau 0000:01:00.0: can't find IRQ for PCI INT A; please try
using pci=biosirq
[    0.938740] nouveau T[  DEVICE][0000:01:00.0] inc() == 2
[    0.938755] nouveau T[     DRM] inc() == 3
[    0.938758] nouveau T[  DEVICE][0000:01:00.0] use(+1) == 1
[    0.938759] nouveau T[  DEVICE][0000:01:00.0] initialising...
[    0.938761] nouveau D[  DEVICE][0000:01:00.0] initialised
[    0.938762] nouveau T[     DRM] inc() == 4
[    0.938764] nouveau T[     DRM] inc() == 5
[    0.938766] nouveau T[  DEVICE][0000:01:00.0] inc() == 3
[    0.938943] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0d7000a2
[    0.938945] nouveau  [  DEVICE][0000:01:00.0] Chipset: GF117 (NVD7)
[    0.938946] nouveau  [  DEVICE][0000:01:00.0] Family : NVD0
[    0.938948] nouveau D[  DEVICE][0000:01:00.0] crystal freq: 27000KHz
[    0.941491] nouveau T[  DEVICE][0000:01:00.0] inc() == 4
[    0.941493] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[    0.989660] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[    0.989662] nouveau  [   VBIOS][0000:01:00.0] checking PROM for image...
[    0.989721] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[    0.989722] nouveau  [   VBIOS][0000:01:00.0] checking ACPI for image...
[    0.989724] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[    0.989725] nouveau  [   VBIOS][0000:01:00.0] checking PCIROM for image...
[    0.989727] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[    0.989728] nouveau  [   VBIOS][0000:01:00.0] checking PLATFORM for image...
[    0.989730] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[    0.989731] nouveau E[   VBIOS][0000:01:00.0] unable to locate usable image
[    0.989762] nouveau E[  DEVICE][0000:01:00.0] failed to create 0x10000001,
-22
[    0.989793] nouveau T[  DEVICE][0000:01:00.0] dec() == 3
[    0.989795] nouveau E[     DRM] failed to create 0x80000080, -22
[    0.989821] nouveau T[  DEVICE][0000:01:00.0] dec() == 2
[    0.989823] nouveau T[     DRM] dec() == 4
[    0.989824] nouveau T[     DRM] dec() == 3
[    0.989825] nouveau T[  DEVICE][0000:01:00.0] use(-1) == 0
[    0.989827] nouveau T[  DEVICE][0000:01:00.0] stopping...
[    0.989828] nouveau D[  DEVICE][0000:01:00.0] stopped
[    0.989829] nouveau T[     DRM] dec() == 2
[    0.989831] nouveau D[     DRM] fini running
[    0.989833] nouveau T[     DRM] 0xffffffff:0xffffffff fini children
[    0.989835] nouveau T[     DRM] 0xffffffff:0xffffffff fini running
[    0.989836] nouveau T[     DRM] use(-1) == 1
[    0.989838] nouveau T[     DRM] 0xffffffff:0xffffffff fini completed
[    0.989839] nouveau D[     DRM] fini completed with 0
[    0.989840] nouveau T[     DRM] dec() == 0
[    0.989842] nouveau D[     DRM] destroying
[    0.989843] nouveau T[  DEVICE][0000:01:00.0] dec() == 1
[    0.989845] nouveau T[     DRM] 0xffffffff:0xffffffff destroy running
[    0.989846] nouveau T[     DRM] 0xffffffff:0xffffffff destroy completed
[    0.989848] nouveau T[     DRM] dec() == -1
[    0.989895] nouveau T[  DEVICE][0000:01:00.0] dec() == 0
[    0.989897] nouveau D[  DEVICE][0000:01:00.0] destroying
[    0.989940] nouveau: probe of 0000:01:00.0 failed with error -22

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1419260464.5e7AFEfD1.6123
Date: Mon, 22 Dec 2014 15:01:04 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - GF117M Can *not* use nouveau at all"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85742#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - GF117M Can *not* use nouveau at all"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85742">bug 85742</a>
              from <span class="vcard"><a class="email" href="mailto:lampshade&#64;poczta.fm" title="lampshade&#64;poczta.fm">lampshade&#64;poczta.fm</a>
</span></b>
        <pre>And I have some more info form dmesg from vanilla 3.14.1
[    0.023586] pci 0000:01:00.0: [10de:1140] type 00 class 0x030000
[    0.023595] pci 0000:01:00.0: reg 0x10: [mem 0xb2000000-0xb2ffffff]
[    0.023606] pci 0000:01:00.0: reg 0x14: [mem 0xa0000000-0xafffffff 64bit
pref]
[    0.023617] pci 0000:01:00.0: reg 0x1c: [mem 0xb0000000-0xb1ffffff 64bit
pref]
[    0.023625] pci 0000:01:00.0: reg 0x24: [io  0x2000-0x207f]
[    0.023633] pci 0000:01:00.0: reg 0x30: [mem 0xfff80000-0xffffffff pref]
[    0.023694] vgaarb: device added:
PCI:0000:01:00.0,decodes=io+mem,owns=none,locks=none
[    0.050452] pci 0000:01:00.0: no compatible bridge window for [mem
0xfff80000-0xffffffff pref]
[    0.050497] pci 0000:01:00.0: BAR 6: can't assign mem pref (size 0x80000)
[    0.077544] pci 0000:01:00.0: Signaling PME through PCIe PME interrupt
[    0.938676] nouveau 0000:01:00.0: enabling device (0006 -&gt; 0007)
[    0.938682] nouveau 0000:01:00.0: can't find IRQ for PCI INT A; please try
using pci=biosirq
[    0.938740] nouveau T[  DEVICE][0000:01:00.0] inc() == 2
[    0.938755] nouveau T[     DRM] inc() == 3
[    0.938758] nouveau T[  DEVICE][0000:01:00.0] use(+1) == 1
[    0.938759] nouveau T[  DEVICE][0000:01:00.0] initialising...
[    0.938761] nouveau D[  DEVICE][0000:01:00.0] initialised
[    0.938762] nouveau T[     DRM] inc() == 4
[    0.938764] nouveau T[     DRM] inc() == 5
[    0.938766] nouveau T[  DEVICE][0000:01:00.0] inc() == 3
[    0.938943] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0d7000a2
[    0.938945] nouveau  [  DEVICE][0000:01:00.0] Chipset: GF117 (NVD7)
[    0.938946] nouveau  [  DEVICE][0000:01:00.0] Family : NVD0
[    0.938948] nouveau D[  DEVICE][0000:01:00.0] crystal freq: 27000KHz
[    0.941491] nouveau T[  DEVICE][0000:01:00.0] inc() == 4
[    0.941493] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[    0.989660] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[    0.989662] nouveau  [   VBIOS][0000:01:00.0] checking PROM for image...
[    0.989721] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[    0.989722] nouveau  [   VBIOS][0000:01:00.0] checking ACPI for image...
[    0.989724] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[    0.989725] nouveau  [   VBIOS][0000:01:00.0] checking PCIROM for image...
[    0.989727] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[    0.989728] nouveau  [   VBIOS][0000:01:00.0] checking PLATFORM for image...
[    0.989730] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[    0.989731] nouveau E[   VBIOS][0000:01:00.0] unable to locate usable image
[    0.989762] nouveau E[  DEVICE][0000:01:00.0] failed to create 0x10000001,
-22
[    0.989793] nouveau T[  DEVICE][0000:01:00.0] dec() == 3
[    0.989795] nouveau E[     DRM] failed to create 0x80000080, -22
[    0.989821] nouveau T[  DEVICE][0000:01:00.0] dec() == 2
[    0.989823] nouveau T[     DRM] dec() == 4
[    0.989824] nouveau T[     DRM] dec() == 3
[    0.989825] nouveau T[  DEVICE][0000:01:00.0] use(-1) == 0
[    0.989827] nouveau T[  DEVICE][0000:01:00.0] stopping...
[    0.989828] nouveau D[  DEVICE][0000:01:00.0] stopped
[    0.989829] nouveau T[     DRM] dec() == 2
[    0.989831] nouveau D[     DRM] fini running
[    0.989833] nouveau T[     DRM] 0xffffffff:0xffffffff fini children
[    0.989835] nouveau T[     DRM] 0xffffffff:0xffffffff fini running
[    0.989836] nouveau T[     DRM] use(-1) == 1
[    0.989838] nouveau T[     DRM] 0xffffffff:0xffffffff fini completed
[    0.989839] nouveau D[     DRM] fini completed with 0
[    0.989840] nouveau T[     DRM] dec() == 0
[    0.989842] nouveau D[     DRM] destroying
[    0.989843] nouveau T[  DEVICE][0000:01:00.0] dec() == 1
[    0.989845] nouveau T[     DRM] 0xffffffff:0xffffffff destroy running
[    0.989846] nouveau T[     DRM] 0xffffffff:0xffffffff destroy completed
[    0.989848] nouveau T[     DRM] dec() == -1
[    0.989895] nouveau T[  DEVICE][0000:01:00.0] dec() == 0
[    0.989897] nouveau D[  DEVICE][0000:01:00.0] destroying
[    0.989940] nouveau: probe of 0000:01:00.0 failed with error -22</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1419260464.5e7AFEfD1.6123--

--===============0735431674==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0735431674==--
