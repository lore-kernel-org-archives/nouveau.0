From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76475] [NVE7] fails to load due to unknown opcode
 0x80 (incorrect vbios)
Date: Sun, 23 Mar 2014 17:52:02 +0000
Message-ID: <bug-76475-8800-i8APZkue9N@http.bugs.freedesktop.org/>
References: <bug-76475-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0738442543=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-76475-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0738442543==
Content-Type: multipart/alternative; boundary="1395597122.ad58aBA2.1233"; charset="us-ascii"


--1395597122.ad58aBA2.1233
Date: Sun, 23 Mar 2014 17:52:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76475

--- Comment #8 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
OK, as best I can tell from the mmiotrace, it's using the ACPI method[1].
Further, your acpi dump indeed contains a _DSM method, as well as a _ROM
method, which should be used to get at the ROM. Unfortunately, it would appear
that evaluating _DSM fails for you:

[    2.920235] ACPI Warning: \_SB_.PCI0.PEG0.GFX0._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20131218/nsarguments-95)
[    2.920300] ACPI: \_SB_.PCI0.PEG0.GFX0: failed to evaluate _DSM

Why it's failing to evaluate the DSM is, unfortunately, beyond my knowledge of
how these things work. The failure did not seem present in earlier versions (at
least not as vocally), although it still didn't find the ACPI ROM back then
either. I don't know if that acpi warning is what actually cause it, or if
there's something else.

At the top of nouveau_acpi.c:nouveau_acpi_rom_supported, there's a check for
dsm_detected or optimus_detected. Try removing that check entirely and let it
just try to grab the ROM from ACPI no matter what. I think that dsm_detected
might not be getting set even if the earlier _DSM call had succeeded.

[1] Here is what I'm seeing. The other things are identifiable as the PRAMIN
and PROM methods. I'm assuming that the maps of random-seeming memory are
actually it reading out the ACPI rom.

[0] 1248.299066 MMIO32 R 0x619f04 0x007ffe09 PDISPLAY.VGA.ROM_WINDOW => { BASE
= 0x7ffe0000 | ENABLE | TARGET = VRAM }
[0] 1248.299087 MMIO32 R 0x022438 0x00000002 PUNITS.DESIGN_PART_COUNT => 0x2
[0] 1248.299105 MMIO32 R 0x022554 0x00000000 PUNITS.HW_MC_DISABLE_MASK => 0
[0] 1248.299123 MMIO32 R 0x100800 0x00000002 PFFB.PART_CONFIG => { PART_COUNT =
0x2 | MEM_SPLIT_PART = 0 }
[0] 1248.299139 MMIO32 R 0x11020c 0x00000400 PBFB[0].MEM_AMOUNT => 0x40000000
[0] 1248.299158 MMIO32 R 0x11120c 0x00000400 PBFB[0x1].MEM_AMOUNT => 0x40000000
[0] 1248.299177 MMIO32 R 0x001700 0x00007ff0 PBUS.HOST_MEM.PMEM => { OFFSET =
0x7ff00000 | TARGET = VRAM }
[0] 1248.299188, MEM8 7ffe0000 => ef
[0] 1248.299197, MEM8 7ffe0001 => be
SLEEP 0.212000ms
[0] 1248.299409 MMIO32 R 0x619f04 0x007ffe09 PDISPLAY.VGA.ROM_WINDOW => { BASE
= 0x7ffe0000 | ENABLE | TARGET = VRAM }
[0] 1248.299423, MEM16 7ffe0000 => beef
[0] 1248.299442 MMIO32 R 0x101000 0x9f408480 PSTRAPS.STRAPS0_PRIMARY => { VALUE
= { RAMCFG = 0 | CRYSTAL = 0 | DEVICE_ID_0_3 = 0x1 | BAR1_SIZE = 25
6MB | ROM_TYPE = SPI | FP_CONFIG = 0xf | DEVICE_ID_4 = 0x1 | DEVICE_ID_5 = 0 |
0x80 } | OVERRIDE_ENABLE }
[0] 1248.299483 MMIO32 R 0x088050 0x00000001 PPCI.ROM_SHADOW_ENABLE => 0x1
[0] 1248.299505 MMIO32 W 0x088050 0x00000000 PPCI.ROM_SHADOW_ENABLE <= 0
[0] 1248.299524 MMIO32 R 0x088050 0x00000000 PPCI.ROM_SHADOW_ENABLE => 0
[0] 1248.299540 MMIO32 R 0x300000 0x00000000 PROM[0] => 0
                                             PROM[0x1] => 0
                                             PROM[0x2] => 0
                                             PROM[0x3] => 0
[0] 1248.299557 MMIO32 W 0x088050 0x00000001 PPCI.ROM_SHADOW_ENABLE <= 0x1
MAP 1248.299831 6 0xde759000 0xffffc900040ba000 0x1000 0x0 0
SLEEP 0.304000ms
UNMAP 1248.309290 6 0x0 0
MAP 1248.309326 7 0xde75a000 0xffffc900040bc000 0x1000 0x0 0
SLEEP 4.378000ms
UNMAP 1248.309595 7 0x0 0
MAP 1248.309828 8 0xde75a000 0xffffc900040be000 0x1000 0x0 0
SLEEP 0.472000ms
UNMAP 1248.317354 8 0x0 0
MAP 1248.317361 9 0xde75b000 0xffffc900040fa000 0x1000 0x0 0
SLEEP 2.454000ms
UNMAP 1248.317627 9 0x0 0

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1395597122.ad58aBA2.1233
Date: Sun, 23 Mar 2014 17:52:02 +0000
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
   title="NEW --- - [NVE7] fails to load due to unknown opcode 0x80 (incorrect vbios)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76475#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] fails to load due to unknown opcode 0x80 (incorrect vbios)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76475">bug 76475</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>OK, as best I can tell from the mmiotrace, it's using the ACPI method[1].
Further, your acpi dump indeed contains a _DSM method, as well as a _ROM
method, which should be used to get at the ROM. Unfortunately, it would appear
that evaluating _DSM fails for you:

[    2.920235] ACPI Warning: \_SB_.PCI0.PEG0.GFX0._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20131218/nsarguments-95)
[    2.920300] ACPI: \_SB_.PCI0.PEG0.GFX0: failed to evaluate _DSM

Why it's failing to evaluate the DSM is, unfortunately, beyond my knowledge of
how these things work. The failure did not seem present in earlier versions (at
least not as vocally), although it still didn't find the ACPI ROM back then
either. I don't know if that acpi warning is what actually cause it, or if
there's something else.

At the top of nouveau_acpi.c:nouveau_acpi_rom_supported, there's a check for
dsm_detected or optimus_detected. Try removing that check entirely and let it
just try to grab the ROM from ACPI no matter what. I think that dsm_detected
might not be getting set even if the earlier _DSM call had succeeded.

[1] Here is what I'm seeing. The other things are identifiable as the PRAMIN
and PROM methods. I'm assuming that the maps of random-seeming memory are
actually it reading out the ACPI rom.

[0] 1248.299066 MMIO32 R 0x619f04 0x007ffe09 PDISPLAY.VGA.ROM_WINDOW =&gt; { BASE
= 0x7ffe0000 | ENABLE | TARGET = VRAM }
[0] 1248.299087 MMIO32 R 0x022438 0x00000002 PUNITS.DESIGN_PART_COUNT =&gt; 0x2
[0] 1248.299105 MMIO32 R 0x022554 0x00000000 PUNITS.HW_MC_DISABLE_MASK =&gt; 0
[0] 1248.299123 MMIO32 R 0x100800 0x00000002 PFFB.PART_CONFIG =&gt; { PART_COUNT =
0x2 | MEM_SPLIT_PART = 0 }
[0] 1248.299139 MMIO32 R 0x11020c 0x00000400 PBFB[0].MEM_AMOUNT =&gt; 0x40000000
[0] 1248.299158 MMIO32 R 0x11120c 0x00000400 PBFB[0x1].MEM_AMOUNT =&gt; 0x40000000
[0] 1248.299177 MMIO32 R 0x001700 0x00007ff0 PBUS.HOST_MEM.PMEM =&gt; { OFFSET =
0x7ff00000 | TARGET = VRAM }
[0] 1248.299188, MEM8 7ffe0000 =&gt; ef
[0] 1248.299197, MEM8 7ffe0001 =&gt; be
SLEEP 0.212000ms
[0] 1248.299409 MMIO32 R 0x619f04 0x007ffe09 PDISPLAY.VGA.ROM_WINDOW =&gt; { BASE
= 0x7ffe0000 | ENABLE | TARGET = VRAM }
[0] 1248.299423, MEM16 7ffe0000 =&gt; beef
[0] 1248.299442 MMIO32 R 0x101000 0x9f408480 PSTRAPS.STRAPS0_PRIMARY =&gt; { VALUE
= { RAMCFG = 0 | CRYSTAL = 0 | DEVICE_ID_0_3 = 0x1 | BAR1_SIZE = 25
6MB | ROM_TYPE = SPI | FP_CONFIG = 0xf | DEVICE_ID_4 = 0x1 | DEVICE_ID_5 = 0 |
0x80 } | OVERRIDE_ENABLE }
[0] 1248.299483 MMIO32 R 0x088050 0x00000001 PPCI.ROM_SHADOW_ENABLE =&gt; 0x1
[0] 1248.299505 MMIO32 W 0x088050 0x00000000 PPCI.ROM_SHADOW_ENABLE &lt;= 0
[0] 1248.299524 MMIO32 R 0x088050 0x00000000 PPCI.ROM_SHADOW_ENABLE =&gt; 0
[0] 1248.299540 MMIO32 R 0x300000 0x00000000 PROM[0] =&gt; 0
                                             PROM[0x1] =&gt; 0
                                             PROM[0x2] =&gt; 0
                                             PROM[0x3] =&gt; 0
[0] 1248.299557 MMIO32 W 0x088050 0x00000001 PPCI.ROM_SHADOW_ENABLE &lt;= 0x1
MAP 1248.299831 6 0xde759000 0xffffc900040ba000 0x1000 0x0 0
SLEEP 0.304000ms
UNMAP 1248.309290 6 0x0 0
MAP 1248.309326 7 0xde75a000 0xffffc900040bc000 0x1000 0x0 0
SLEEP 4.378000ms
UNMAP 1248.309595 7 0x0 0
MAP 1248.309828 8 0xde75a000 0xffffc900040be000 0x1000 0x0 0
SLEEP 0.472000ms
UNMAP 1248.317354 8 0x0 0
MAP 1248.317361 9 0xde75b000 0xffffc900040fa000 0x1000 0x0 0
SLEEP 2.454000ms
UNMAP 1248.317627 9 0x0 0</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1395597122.ad58aBA2.1233--

--===============0738442543==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0738442543==--
