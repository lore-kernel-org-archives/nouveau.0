From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76475] [NVE7] fails to load due to unknown opcode
 0x80 (incorrect vbios)
Date: Wed, 26 Mar 2014 22:50:46 +0000
Message-ID: <bug-76475-8800-Tudp4BbXwM@http.bugs.freedesktop.org/>
References: <bug-76475-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0453457974=="
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


--===============0453457974==
Content-Type: multipart/alternative; boundary="1395874246.B8aCe1.27001"; charset="us-ascii"


--1395874246.B8aCe1.27001
Date: Wed, 26 Mar 2014 22:50:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76475

--- Comment #9 from patrick.clara-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
I have played a bit with the _ROM method and acpi_call. It actually returns a
bios of nearly double the size of the PCIROM so there should not be doubts that
the PCIROM is the wrong one.

I have tried removing that check in nouveau_acpi.c:nouveau_acpi_rom_supported
and it actually seem to load correctly, except a kworker uses 100 of CPU, but
this happened also in 3.12 and maybe is another bug which is unrelated to this
one.

[   24.412373] [drm] Initialized drm 1.1.0 20060810
[   24.645116] ACPI Warning: \_SB_.PCI0.PEG0.GFX0._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20131218/nsarguments-95)
[   24.645180] ACPI: \_SB_.PCI0.PEG0.GFX0: failed to evaluate _DSM
[   24.645209] checking generic (e0000000 1e8000) vs hw (e0000000 10000000)
[   24.645211] fb: conflicting fb hw usage nouveaufb vs simple - removing
generic driver
[   24.645285] Console: switching to colour dummy device 80x25
[   24.646505] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0e7110a2
[   24.646511] nouveau  [  DEVICE][0000:01:00.0] Chipset: GK107 (NVE7)
[   24.646514] nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
[   24.654219] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[   24.654229] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[   24.654231] nouveau  [   VBIOS][0000:01:00.0] checking PROM for image...
[   24.654288] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[   24.654290] nouveau  [   VBIOS][0000:01:00.0] checking ACPI for image...
[   26.781797] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[   26.781806] nouveau  [   VBIOS][0000:01:00.0] using image from ACPI
[   26.782089] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[   26.782095] nouveau  [   VBIOS][0000:01:00.0] version 80.07.46.00.45
[   26.783154] nouveau 0000:01:00.0: irq 48 for MSI/MSI-X
[   26.783173] nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
[   26.783251] nouveau  [     PFB][0000:01:00.0] RAM type: GDDR5
[   26.783254] nouveau  [     PFB][0000:01:00.0] RAM size: 2048 MiB
[   26.783257] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
[   26.802029] nouveau  [    VOLT][0000:01:00.0] GPU voltage: 925000uv
[   26.826224] nouveau  [  PTHERM][0000:01:00.0] FAN control: none / external
[   26.826233] nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
[   26.826238] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[   26.826280] nouveau  [     CLK][0000:01:00.0] 07: core 270-405 MHz memory
810 MHz
[   26.826365] nouveau  [     CLK][0000:01:00.0] 0a: core 270-835 MHz memory
1600 MHz
[   26.826431] nouveau  [     CLK][0000:01:00.0] 0f: core 270-835 MHz memory
4000 MHz
[   26.826571] nouveau  [     CLK][0000:01:00.0] --: core 405 MHz memory 648
MHz
[   26.870817] [TTM] Zone  kernel: Available graphics memory: 4074432 kiB
[   26.870819] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[   26.870821] [TTM] Initializing pool allocator
[   26.870826] [TTM] Initializing DMA pool allocator
[   26.870838] nouveau  [     DRM] VRAM: 2048 MiB
[   26.870840] nouveau  [     DRM] GART: 1048576 MiB
[   26.870844] nouveau  [     DRM] TMDS table version 2.0
[   26.870846] nouveau  [     DRM] DCB version 4.0
[   26.870848] nouveau  [     DRM] DCB outp 00: 04800fb6 0f430014
[   26.870850] nouveau  [     DRM] DCB outp 01: 02011f00 00000000
[   26.870852] nouveau  [     DRM] DCB outp 02: 02022f62 00020010
[   26.870853] nouveau  [     DRM] DCB conn 00: 00020047
[   26.870856] nouveau  [     DRM] DCB conn 01: 00000100
[   26.870857] nouveau  [     DRM] DCB conn 02: 00010261
[   26.872193] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[   26.872195] [drm] Driver supports precise vblank timestamp query.
[   26.872197] nouveau  [     DRM] ACPI backlight interface available, not
registering our own
[   26.884895] nouveau  [     DRM] MM: using COPY for buffer copies
[   26.936448] nouveau  [     DRM] allocated 2880x1620 fb: 0x80000, bo
ffff880210ea2400
[   27.246200] Console: switching to colour frame buffer device 360x101
[   27.260592] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[   27.260594] nouveau 0000:01:00.0: registered panic notifier
[   27.260598] [drm] Initialized nouveau 1.1.1 v3.14-rc7-59-g08edb33c4e1b81001
for 0000:01:00.0 on minor 0


At this point I would like to clarify that I don't really understand much about
the whole thing but in anycase I have written down about some experimentation.
I hope is doesn't contain too much nonsense....

I actually don't understand this check in
nouveau_acpi.c:nouveau_acpi_rom_supported

if (!nouveau_dsm_priv.dsm_detected && !nouveau_dsm_priv.optimus_detected)
        return false;

Why, in order to read the vbios from ACPI do we need either a dsm or optimus?
Lets suppose this check makes sense.

We see that nouveau_dsm_priv.dsm_detected and nouveau_dsm_priv.optimus_detected
should get set in nouveau_acpi.c:nouveau_dsm_detect. In my case vga_count==1
and gets set in the first while loop. Since nouveau_dsm_priv.dsm_detected needs
vga_count==2 in order to become true, it will never be the case.

So lets check why nouveau_dsm_priv.optimus_detected does not become true.

has_dsm and has_optimus turns out to be both 0. Simplay becouse
retval = nouveau_dsm_pci_probe(pdev); is also 0.

In nouveau_acpi.c:nouveau_dsm_pci_probe the relevant check should be

if (nouveau_check_optimus_dsm(dhandle))
        retval |= NOUVEAU_DSM_HAS_OPT;

nouveau_check_optimus_dsm obviously returns 0.

nouveau_acpi.c:nouveau_check_optimus_dsm exits at this check

if (nouveau_optimus_dsm(handle, 0, 0, &result))
        return 0;

becouse of the "failed to evaluate _DSM" error, triggered in
nouveau_acpi.c:nouveau_optimus_dsm at this point.

obj = acpi_evaluate_dsm_typed(handle, nouveau_op_dsm_muid, 0x00000100,
                      func, &argv4, ACPI_TYPE_BUFFER);

It calls the _DSM metod and checks if obj->type == ACPI_TYPE_BUFFER. On my
machine it turns out to be of type ACPI_TYPE_INTEGER. As it is called in
nouveau_acpi.c:nouveau_dsm, but as seen before nouveau_dsm_priv.dsm_detected
seems to be excluded becouse of that vga_count==2.

Other notebooks in the same Zenbook Prime series seems to have optimus and not
some older switching methods so for the moment I assume the whole condition
around vga_count==2 is correct and nouveau_dsm_priv.dsm_detected is not
interesting for us. Also my machine doesnt have 2 gpus but maybe it could have
some kind of permanently disabled optimus

I tried to change that ACPI_TYPE_BUFFER in ACPI_TYPE_INTEGER. The "failed to
evaluate _DSM" error disappears and nouveau_acpi.c:nouveau_check_optimus_dsm
executes till the end, but it still returns 0 or false becouse result in
nouveau_acpi.c:nouveau_optimus_dsm doesnt get set to something other than 0.

It does not enter in this block

if (obj->buffer.length == 4) {
    *result |= obj->buffer.pointer[0];
    *result |= (obj->buffer.pointer[1] << 8);
    *result |= (obj->buffer.pointer[2] << 16);
    *result |= (obj->buffer.pointer[3] << 24);
}

simply becouse acpi_evaluate_dsm_typed returns 0. Also acpi_call confirms it.

I have seen it is called using this parameter

static const char nouveau_op_dsm_muid[] = {
    0xF8, 0xD8, 0x86, 0xA4, 0xDA, 0x0B, 0x1B, 0x47,
    0xA7, 0x2B, 0x60, 0x42, 0xA6, 0xB5, 0xBE, 0xE0,
};

I think it should be somewhere in the dsdt but I have found this inside _DSM

0x75,0x0B,0xA5,0xD4,0xC7,0x65,0xF7,0x46,
0xBF,0xB7,0x41,0x51,0x4C,0xEA,0x02,0x44

echo "\_SB.PCI0.PEG0.GFX0._DSM
{0x75,0x0B,0xA5,0xD4,0xC7,0x65,0xF7,0x46,0xBF,0xB7,0x41,0x51,0x4C,0xEA,0x02,0x44}
0x100 0 0" > call

gives {0x01, 0x00, 0x50, 0x00} as output.

So giving in the above instead of the original nouveau_op_dsm_muid removes the
need of changing that ACPI_TYPE_BUFFER in to ACPI_TYPE_INTEGER, since now its
output is correct.

Still this condition in nouveau_acpi.c:nouveau_check_optimus_dsm doesnt hold

return result & 1 && result & (1 << NOUVEAU_DSM_OPTIMUS_CAPS);

I actually don't fully understand the sense of nouveau_op_dsm_muid[] but maybe
it is coupled with NOUVEAU_DSM_OPTIMUS_CAPS.

Changing NOUVEAU_DSM_OPTIMUS_CAPS to 16 instead of 1A in order to simulate
interpretation of {0x01, 0x00, 0x50, 0x00} leads to this


[drm] Initialized drm 1.1.0 20060810
[  188.108609] ACPI Warning: \_SB_.PCI0.PEG0.GFX0._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20131218/nsarguments-95)
[  188.108682] ACPI Warning: \_SB_.PCI0.PEG0.GFX0._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20131218/nsarguments-95)
[  188.108770] ACPI: \_SB_.PCI0.PEG0.GFX0: failed to evaluate _DSM
[  188.108776] pci 0000:01:00.0: optimus capabilities: disabled, status
[  188.108780] VGA switcheroo: detected Optimus DSM method \_SB_.PCI0.PEG0.GFX0
handle
[  188.108803] checking generic (e0000000 1e8000) vs hw (e0000000 10000000)
[  188.108805] fb: conflicting fb hw usage nouveaufb vs simple - removing
generic driver
[  188.108887] Console: switching to colour dummy device 80x25
[  188.109934] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0e7110a2
[  188.109938] nouveau  [  DEVICE][0000:01:00.0] Chipset: GK107 (NVE7)
[  188.109941] nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
[  188.116780] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[  188.116790] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[  188.116793] nouveau  [   VBIOS][0000:01:00.0] checking PROM for image...
[  188.116868] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[  188.116872] nouveau  [   VBIOS][0000:01:00.0] checking ACPI for image...
[  190.339394] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[  190.339402] nouveau  [   VBIOS][0000:01:00.0] using image from ACPI
[  190.339686] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[  190.339692] nouveau  [   VBIOS][0000:01:00.0] version 80.07.46.00.45
[  190.341007] nouveau 0000:01:00.0: irq 48 for MSI/MSI-X
[  190.341022] nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
[  190.341090] nouveau  [     PFB][0000:01:00.0] RAM type: GDDR5
[  190.341093] nouveau  [     PFB][0000:01:00.0] RAM size: 2048 MiB
[  190.341096] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
[  190.359931] nouveau  [    VOLT][0000:01:00.0] GPU voltage: 925000uv
[  190.384143] nouveau  [  PTHERM][0000:01:00.0] FAN control: none / external
[  190.384152] nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
[  190.384157] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[  190.384198] nouveau  [     CLK][0000:01:00.0] 07: core 270-405 MHz memory
810 MHz
[  190.384284] nouveau  [     CLK][0000:01:00.0] 0a: core 270-835 MHz memory
1600 MHz
[  190.384348] nouveau  [     CLK][0000:01:00.0] 0f: core 270-835 MHz memory
4000 MHz
[  190.384489] nouveau  [     CLK][0000:01:00.0] --: core 405 MHz memory 648
MHz
[  190.428782] [TTM] Zone  kernel: Available graphics memory: 4074432 kiB
[  190.428785] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[  190.428786] [TTM] Initializing pool allocator
[  190.428791] [TTM] Initializing DMA pool allocator
[  190.428803] nouveau  [     DRM] VRAM: 2048 MiB
[  190.428805] nouveau  [     DRM] GART: 1048576 MiB
[  190.428809] nouveau  [     DRM] TMDS table version 2.0
[  190.428811] nouveau  [     DRM] DCB version 4.0
[  190.428813] nouveau  [     DRM] DCB outp 00: 04800fb6 0f430014
[  190.428815] nouveau  [     DRM] DCB outp 01: 02011f00 00000000
[  190.428817] nouveau  [     DRM] DCB outp 02: 02022f62 00020010
[  190.428819] nouveau  [     DRM] DCB conn 00: 00020047
[  190.428821] nouveau  [     DRM] DCB conn 01: 00000100
[  190.428823] nouveau  [     DRM] DCB conn 02: 00010261
[  190.430141] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[  190.430143] [drm] Driver supports precise vblank timestamp query.
[  190.430145] nouveau  [     DRM] ACPI backlight interface available, not
registering our own
[  190.442596] nouveau  [     DRM] MM: using COPY for buffer copies
[  190.493975] nouveau  [     DRM] allocated 2880x1620 fb: 0x80000, bo
ffff880213a52c00
[  190.798327] Console: switching to colour frame buffer device 360x101
[  190.812684] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[  190.812686] nouveau 0000:01:00.0: registered panic notifier
[  190.812691] [drm] Initialized nouveau 1.1.1 v3.14-rc7-59-g08edb33c4e1b81001
for 0000:01:00.0 on minor 0


There is again the "failed to evaluate _DSM" error, but this time it gets
triggered when nouveau_optimus_dsm() is called for the second time.

I also have seen that the "failed to evaluate _DSM" error was introduced with
the committs b072e53b0a27a885d8be3d08c8d8758292762f39 and
e284175a96e5af087ea7806b3e38282b524ff5b9. I could even understand that, since
it is not an optimus laptop, DSM could fail, but this brings me to the initial
question. Why do we need _DSM to load vbios from _ROM?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1395874246.B8aCe1.27001
Date: Wed, 26 Mar 2014 22:50:46 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76475#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] fails to load due to unknown opcode 0x80 (incorrect vbios)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76475">bug 76475</a>
              from <span class="vcard"><a class="email" href="mailto:patrick.clara&#64;gmail.com" title="patrick.clara&#64;gmail.com">patrick.clara&#64;gmail.com</a>
</span></b>
        <pre>I have played a bit with the _ROM method and acpi_call. It actually returns a
bios of nearly double the size of the PCIROM so there should not be doubts that
the PCIROM is the wrong one.

I have tried removing that check in nouveau_acpi.c:nouveau_acpi_rom_supported
and it actually seem to load correctly, except a kworker uses 100 of CPU, but
this happened also in 3.12 and maybe is another bug which is unrelated to this
one.

[   24.412373] [drm] Initialized drm 1.1.0 20060810
[   24.645116] ACPI Warning: \_SB_.PCI0.PEG0.GFX0._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20131218/nsarguments-95)
[   24.645180] ACPI: \_SB_.PCI0.PEG0.GFX0: failed to evaluate _DSM
[   24.645209] checking generic (e0000000 1e8000) vs hw (e0000000 10000000)
[   24.645211] fb: conflicting fb hw usage nouveaufb vs simple - removing
generic driver
[   24.645285] Console: switching to colour dummy device 80x25
[   24.646505] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0e7110a2
[   24.646511] nouveau  [  DEVICE][0000:01:00.0] Chipset: GK107 (NVE7)
[   24.646514] nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
[   24.654219] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[   24.654229] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[   24.654231] nouveau  [   VBIOS][0000:01:00.0] checking PROM for image...
[   24.654288] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[   24.654290] nouveau  [   VBIOS][0000:01:00.0] checking ACPI for image...
[   26.781797] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[   26.781806] nouveau  [   VBIOS][0000:01:00.0] using image from ACPI
[   26.782089] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[   26.782095] nouveau  [   VBIOS][0000:01:00.0] version 80.07.46.00.45
[   26.783154] nouveau 0000:01:00.0: irq 48 for MSI/MSI-X
[   26.783173] nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
[   26.783251] nouveau  [     PFB][0000:01:00.0] RAM type: GDDR5
[   26.783254] nouveau  [     PFB][0000:01:00.0] RAM size: 2048 MiB
[   26.783257] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
[   26.802029] nouveau  [    VOLT][0000:01:00.0] GPU voltage: 925000uv
[   26.826224] nouveau  [  PTHERM][0000:01:00.0] FAN control: none / external
[   26.826233] nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
[   26.826238] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[   26.826280] nouveau  [     CLK][0000:01:00.0] 07: core 270-405 MHz memory
810 MHz
[   26.826365] nouveau  [     CLK][0000:01:00.0] 0a: core 270-835 MHz memory
1600 MHz
[   26.826431] nouveau  [     CLK][0000:01:00.0] 0f: core 270-835 MHz memory
4000 MHz
[   26.826571] nouveau  [     CLK][0000:01:00.0] --: core 405 MHz memory 648
MHz
[   26.870817] [TTM] Zone  kernel: Available graphics memory: 4074432 kiB
[   26.870819] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[   26.870821] [TTM] Initializing pool allocator
[   26.870826] [TTM] Initializing DMA pool allocator
[   26.870838] nouveau  [     DRM] VRAM: 2048 MiB
[   26.870840] nouveau  [     DRM] GART: 1048576 MiB
[   26.870844] nouveau  [     DRM] TMDS table version 2.0
[   26.870846] nouveau  [     DRM] DCB version 4.0
[   26.870848] nouveau  [     DRM] DCB outp 00: 04800fb6 0f430014
[   26.870850] nouveau  [     DRM] DCB outp 01: 02011f00 00000000
[   26.870852] nouveau  [     DRM] DCB outp 02: 02022f62 00020010
[   26.870853] nouveau  [     DRM] DCB conn 00: 00020047
[   26.870856] nouveau  [     DRM] DCB conn 01: 00000100
[   26.870857] nouveau  [     DRM] DCB conn 02: 00010261
[   26.872193] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[   26.872195] [drm] Driver supports precise vblank timestamp query.
[   26.872197] nouveau  [     DRM] ACPI backlight interface available, not
registering our own
[   26.884895] nouveau  [     DRM] MM: using COPY for buffer copies
[   26.936448] nouveau  [     DRM] allocated 2880x1620 fb: 0x80000, bo
ffff880210ea2400
[   27.246200] Console: switching to colour frame buffer device 360x101
[   27.260592] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[   27.260594] nouveau 0000:01:00.0: registered panic notifier
[   27.260598] [drm] Initialized nouveau 1.1.1 v3.14-rc7-59-g08edb33c4e1b81001
for 0000:01:00.0 on minor 0


At this point I would like to clarify that I don't really understand much about
the whole thing but in anycase I have written down about some experimentation.
I hope is doesn't contain too much nonsense....

I actually don't understand this check in
nouveau_acpi.c:nouveau_acpi_rom_supported

if (!nouveau_dsm_priv.dsm_detected &amp;&amp; !nouveau_dsm_priv.optimus_detected)
        return false;

Why, in order to read the vbios from ACPI do we need either a dsm or optimus?
Lets suppose this check makes sense.

We see that nouveau_dsm_priv.dsm_detected and nouveau_dsm_priv.optimus_detected
should get set in nouveau_acpi.c:nouveau_dsm_detect. In my case vga_count==1
and gets set in the first while loop. Since nouveau_dsm_priv.dsm_detected needs
vga_count==2 in order to become true, it will never be the case.

So lets check why nouveau_dsm_priv.optimus_detected does not become true.

has_dsm and has_optimus turns out to be both 0. Simplay becouse
retval = nouveau_dsm_pci_probe(pdev); is also 0.

In nouveau_acpi.c:nouveau_dsm_pci_probe the relevant check should be

if (nouveau_check_optimus_dsm(dhandle))
        retval |= NOUVEAU_DSM_HAS_OPT;

nouveau_check_optimus_dsm obviously returns 0.

nouveau_acpi.c:nouveau_check_optimus_dsm exits at this check

if (nouveau_optimus_dsm(handle, 0, 0, &amp;result))
        return 0;

becouse of the &quot;failed to evaluate _DSM&quot; error, triggered in
nouveau_acpi.c:nouveau_optimus_dsm at this point.

obj = acpi_evaluate_dsm_typed(handle, nouveau_op_dsm_muid, 0x00000100,
                      func, &amp;argv4, ACPI_TYPE_BUFFER);

It calls the _DSM metod and checks if obj-&gt;type == ACPI_TYPE_BUFFER. On my
machine it turns out to be of type ACPI_TYPE_INTEGER. As it is called in
nouveau_acpi.c:nouveau_dsm, but as seen before nouveau_dsm_priv.dsm_detected
seems to be excluded becouse of that vga_count==2.

Other notebooks in the same Zenbook Prime series seems to have optimus and not
some older switching methods so for the moment I assume the whole condition
around vga_count==2 is correct and nouveau_dsm_priv.dsm_detected is not
interesting for us. Also my machine doesnt have 2 gpus but maybe it could have
some kind of permanently disabled optimus

I tried to change that ACPI_TYPE_BUFFER in ACPI_TYPE_INTEGER. The &quot;failed to
evaluate _DSM&quot; error disappears and nouveau_acpi.c:nouveau_check_optimus_dsm
executes till the end, but it still returns 0 or false becouse result in
nouveau_acpi.c:nouveau_optimus_dsm doesnt get set to something other than 0.

It does not enter in this block

if (obj-&gt;buffer.length == 4) {
    *result |= obj-&gt;buffer.pointer[0];
    *result |= (obj-&gt;buffer.pointer[1] &lt;&lt; 8);
    *result |= (obj-&gt;buffer.pointer[2] &lt;&lt; 16);
    *result |= (obj-&gt;buffer.pointer[3] &lt;&lt; 24);
}

simply becouse acpi_evaluate_dsm_typed returns 0. Also acpi_call confirms it.

I have seen it is called using this parameter

static const char nouveau_op_dsm_muid[] = {
    0xF8, 0xD8, 0x86, 0xA4, 0xDA, 0x0B, 0x1B, 0x47,
    0xA7, 0x2B, 0x60, 0x42, 0xA6, 0xB5, 0xBE, 0xE0,
};

I think it should be somewhere in the dsdt but I have found this inside _DSM

0x75,0x0B,0xA5,0xD4,0xC7,0x65,0xF7,0x46,
0xBF,0xB7,0x41,0x51,0x4C,0xEA,0x02,0x44

echo &quot;\_SB.PCI0.PEG0.GFX0._DSM
{0x75,0x0B,0xA5,0xD4,0xC7,0x65,0xF7,0x46,0xBF,0xB7,0x41,0x51,0x4C,0xEA,0x02,0x44}
0x100 0 0&quot; &gt; call

gives {0x01, 0x00, 0x50, 0x00} as output.

So giving in the above instead of the original nouveau_op_dsm_muid removes the
need of changing that ACPI_TYPE_BUFFER in to ACPI_TYPE_INTEGER, since now its
output is correct.

Still this condition in nouveau_acpi.c:nouveau_check_optimus_dsm doesnt hold

return result &amp; 1 &amp;&amp; result &amp; (1 &lt;&lt; NOUVEAU_DSM_OPTIMUS_CAPS);

I actually don't fully understand the sense of nouveau_op_dsm_muid[] but maybe
it is coupled with NOUVEAU_DSM_OPTIMUS_CAPS.

Changing NOUVEAU_DSM_OPTIMUS_CAPS to 16 instead of 1A in order to simulate
interpretation of {0x01, 0x00, 0x50, 0x00} leads to this


[drm] Initialized drm 1.1.0 20060810
[  188.108609] ACPI Warning: \_SB_.PCI0.PEG0.GFX0._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20131218/nsarguments-95)
[  188.108682] ACPI Warning: \_SB_.PCI0.PEG0.GFX0._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20131218/nsarguments-95)
[  188.108770] ACPI: \_SB_.PCI0.PEG0.GFX0: failed to evaluate _DSM
[  188.108776] pci 0000:01:00.0: optimus capabilities: disabled, status
[  188.108780] VGA switcheroo: detected Optimus DSM method \_SB_.PCI0.PEG0.GFX0
handle
[  188.108803] checking generic (e0000000 1e8000) vs hw (e0000000 10000000)
[  188.108805] fb: conflicting fb hw usage nouveaufb vs simple - removing
generic driver
[  188.108887] Console: switching to colour dummy device 80x25
[  188.109934] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0e7110a2
[  188.109938] nouveau  [  DEVICE][0000:01:00.0] Chipset: GK107 (NVE7)
[  188.109941] nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
[  188.116780] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[  188.116790] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[  188.116793] nouveau  [   VBIOS][0000:01:00.0] checking PROM for image...
[  188.116868] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[  188.116872] nouveau  [   VBIOS][0000:01:00.0] checking ACPI for image...
[  190.339394] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[  190.339402] nouveau  [   VBIOS][0000:01:00.0] using image from ACPI
[  190.339686] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[  190.339692] nouveau  [   VBIOS][0000:01:00.0] version 80.07.46.00.45
[  190.341007] nouveau 0000:01:00.0: irq 48 for MSI/MSI-X
[  190.341022] nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
[  190.341090] nouveau  [     PFB][0000:01:00.0] RAM type: GDDR5
[  190.341093] nouveau  [     PFB][0000:01:00.0] RAM size: 2048 MiB
[  190.341096] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
[  190.359931] nouveau  [    VOLT][0000:01:00.0] GPU voltage: 925000uv
[  190.384143] nouveau  [  PTHERM][0000:01:00.0] FAN control: none / external
[  190.384152] nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
[  190.384157] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[  190.384198] nouveau  [     CLK][0000:01:00.0] 07: core 270-405 MHz memory
810 MHz
[  190.384284] nouveau  [     CLK][0000:01:00.0] 0a: core 270-835 MHz memory
1600 MHz
[  190.384348] nouveau  [     CLK][0000:01:00.0] 0f: core 270-835 MHz memory
4000 MHz
[  190.384489] nouveau  [     CLK][0000:01:00.0] --: core 405 MHz memory 648
MHz
[  190.428782] [TTM] Zone  kernel: Available graphics memory: 4074432 kiB
[  190.428785] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[  190.428786] [TTM] Initializing pool allocator
[  190.428791] [TTM] Initializing DMA pool allocator
[  190.428803] nouveau  [     DRM] VRAM: 2048 MiB
[  190.428805] nouveau  [     DRM] GART: 1048576 MiB
[  190.428809] nouveau  [     DRM] TMDS table version 2.0
[  190.428811] nouveau  [     DRM] DCB version 4.0
[  190.428813] nouveau  [     DRM] DCB outp 00: 04800fb6 0f430014
[  190.428815] nouveau  [     DRM] DCB outp 01: 02011f00 00000000
[  190.428817] nouveau  [     DRM] DCB outp 02: 02022f62 00020010
[  190.428819] nouveau  [     DRM] DCB conn 00: 00020047
[  190.428821] nouveau  [     DRM] DCB conn 01: 00000100
[  190.428823] nouveau  [     DRM] DCB conn 02: 00010261
[  190.430141] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[  190.430143] [drm] Driver supports precise vblank timestamp query.
[  190.430145] nouveau  [     DRM] ACPI backlight interface available, not
registering our own
[  190.442596] nouveau  [     DRM] MM: using COPY for buffer copies
[  190.493975] nouveau  [     DRM] allocated 2880x1620 fb: 0x80000, bo
ffff880213a52c00
[  190.798327] Console: switching to colour frame buffer device 360x101
[  190.812684] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[  190.812686] nouveau 0000:01:00.0: registered panic notifier
[  190.812691] [drm] Initialized nouveau 1.1.1 v3.14-rc7-59-g08edb33c4e1b81001
for 0000:01:00.0 on minor 0


There is again the &quot;failed to evaluate _DSM&quot; error, but this time it gets
triggered when nouveau_optimus_dsm() is called for the second time.

I also have seen that the &quot;failed to evaluate _DSM&quot; error was introduced with
the committs b072e53b0a27a885d8be3d08c8d8758292762f39 and
e284175a96e5af087ea7806b3e38282b524ff5b9. I could even understand that, since
it is not an optimus laptop, DSM could fail, but this brings me to the initial
question. Why do we need _DSM to load vbios from _ROM?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1395874246.B8aCe1.27001--

--===============0453457974==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0453457974==--
