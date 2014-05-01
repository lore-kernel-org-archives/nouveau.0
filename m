From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78092] GK208M [GeForce GT 730M] (rev ff) (prog-if
 ff) nouveau module load fail
Date: Thu, 01 May 2014 07:21:54 +0000
Message-ID: <bug-78092-8800-UB6Jblt0aH@http.bugs.freedesktop.org/>
References: <bug-78092-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1881671638=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-78092-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1881671638==
Content-Type: multipart/alternative; boundary="1398928914.EeD60.1600"; charset="us-ascii"


--1398928914.EeD60.1600
Date: Thu, 1 May 2014 07:21:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78092

--- Comment #17 from Anton Gubarkov <anton.gubarkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I did notice the missing curly brackets too and fixed them.
ok, tracked this mistery down to unset CONFIG_VGA_SWITCHEROO. Once set, calls
are in place.

[ 3456.395879] wmi: Mapper unloaded
[ 3459.834473] wmi: Mapper loaded
[ 3459.835817] DEBUG: doing DSM detection
[ 3459.835820] DEBUG: probing vga card #1
[ 3459.835821] DEBUG: called nouveau_dsm_pci_probe
[ 3459.835826] DEBUG: !acpi_has_method(dhandle, "_DSM")
[ 3459.835828] DEBUG: probing vga card #2
[ 3459.835828] DEBUG: called nouveau_dsm_pci_probe
[ 3459.835954] ACPI Warning: \_SB_.PCI0.PEG_.VID_._DSM: Argument #4 type
mismatch -
 Found [Buffer], ACPI requires [Package] (20140214/nsarguments-95)
[ 3459.836314] DEBUG: nouveau_check_optimus_dsm result: c010001
[ 3459.836316] DEBUG: retval after nouveau_check_optimus_dsm(dhandle): 2
[ 3459.836321] ACPI Warning: \_SB_.PCI0.PEG_.VID_._DSM: Argument #4 type
mismatch -
 Found [Buffer], ACPI requires [Package] (20140214/nsarguments-95)
[ 3459.836653] pci 0000:01:00.0: optimus capabilities: enabled, status dynamic
powe
r, hda bios codec supported
[ 3459.836657] VGA switcheroo: detected Optimus DSM method \_SB_.PCI0.PEG_.VID_
han
dle
[ 3459.836953] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x108100a1
[ 3459.836955] nouveau  [  DEVICE][0000:01:00.0] Chipset: GK208 (NV108)
[ 3459.836957] nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
[ 3459.838506] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[ 3459.838510] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[ 3459.838511] nouveau  [   VBIOS][0000:01:00.0] checking PROM for image...
[ 3459.838565] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[ 3459.838566] nouveau  [   VBIOS][0000:01:00.0] checking ACPI for image...
[ 3459.838568] DEBUG: dsm_detected: 0, optimus_detected: 1
[ 3460.002952] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[ 3460.002955] nouveau  [   VBIOS][0000:01:00.0] using image from ACPI
[ 3460.003021] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[ 3460.003023] nouveau  [   VBIOS][0000:01:00.0] version 80.28.2a.00.30
[ 3460.003876] nouveau  [   VBIOS][0000:01:00.0] running init tables
[ 3460.046746] nouveau 0000:01:00.0: irq 49 for MSI/MSI-X
[ 3460.046758] nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
[ 3460.046796] nouveau  [     PFB][0000:01:00.0] RAM type: DDR3
[ 3460.046797] nouveau  [     PFB][0000:01:00.0] RAM size: 1024 MiB
[ 3460.046799] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
[ 3460.046857] nouveau E[   PIBUS][0000:01:00.0] HUB0: 0x6013d4 0xbadf5701
(0x19708200)
[ 3460.046863] nouveau E[   PIBUS][0000:01:00.0] GPC0: 0x4188ac 0x00000001
(0x1970822e)
[ 3460.051219] nouveau  [    VOLT][0000:01:00.0] GPU voltage: 600000uv
[ 3460.691537] nouveau  [  PTHERM][0000:01:00.0] FAN control: none / external
[ 3460.691548] nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
[ 3460.691565] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[ 3460.691599] nouveau  [     CLK][0000:01:00.0] 07: core 405 MHz memory 810
MHz 
[ 3460.691650] nouveau  [     CLK][0000:01:00.0] 0a: core 405-875 MHz memory
1620 MHz 
[ 3460.691715] nouveau  [     CLK][0000:01:00.0] 0f: core 405-875 MHz memory
2002 MHz 
[ 3460.691777] nouveau  [     CLK][0000:01:00.0] --: core 405 MHz memory 810
MHz 
[ 3460.703809] vga_switcheroo: enabled
[ 3460.703931] [TTM] Zone  kernel: Available graphics memory: 8155342 kiB
[ 3460.703932] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[ 3460.703932] [TTM] Initializing pool allocator
[ 3460.703936] [TTM] Initializing DMA pool allocator
[ 3460.703943] nouveau  [     DRM] VRAM: 1024 MiB
[ 3460.703943] nouveau  [     DRM] GART: 1048576 MiB
[ 3460.703946] nouveau E[     DRM] Pointer to TMDS table invalid
[ 3460.703947] nouveau  [     DRM] DCB version 4.0
[ 3460.703948] nouveau E[     DRM] Pointer to flat panel table invalid
[ 3460.710300] nouveau  [     DRM] MM: using COPY for buffer copies
[ 3460.710305] [drm] Initialized nouveau 1.1.1 20120801 for 0000:01:00.0 on
minor 1
[ 3465.713671] ACPI Warning: \_SB_.PCI0.PEG_.VID_._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20140214/nsarguments-95)
[ 3465.713979] ACPI Warning: \_SB_.PCI0.PEG_.VID_._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20140214/nsarguments-95)

however xrandr sees no nouveau provider:
2349-pb8edcn linux # xrandr --listproviders
Providers: number : 1
Provider 0: id: 0x48 cap: 0xb, Source Output, Sink Output, Sink Offload crtcs:
3 outputs: 6 associated providers: 0 name:Intel

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1398928914.EeD60.1600
Date: Thu, 1 May 2014 07:21:54 +0000
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
   title="NEW --- - GK208M [GeForce GT 730M] (rev ff) (prog-if ff) nouveau module load fail"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78092#c17">Comment # 17</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - GK208M [GeForce GT 730M] (rev ff) (prog-if ff) nouveau module load fail"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78092">bug 78092</a>
              from <span class="vcard"><a class="email" href="mailto:anton.gubarkov&#64;gmail.com" title="Anton Gubarkov &lt;anton.gubarkov&#64;gmail.com&gt;"> <span class="fn">Anton Gubarkov</span></a>
</span></b>
        <pre>I did notice the missing curly brackets too and fixed them.
ok, tracked this mistery down to unset CONFIG_VGA_SWITCHEROO. Once set, calls
are in place.

[ 3456.395879] wmi: Mapper unloaded
[ 3459.834473] wmi: Mapper loaded
[ 3459.835817] DEBUG: doing DSM detection
[ 3459.835820] DEBUG: probing vga card #1
[ 3459.835821] DEBUG: called nouveau_dsm_pci_probe
[ 3459.835826] DEBUG: !acpi_has_method(dhandle, &quot;_DSM&quot;)
[ 3459.835828] DEBUG: probing vga card #2
[ 3459.835828] DEBUG: called nouveau_dsm_pci_probe
[ 3459.835954] ACPI Warning: \_SB_.PCI0.PEG_.VID_._DSM: Argument #4 type
mismatch -
 Found [Buffer], ACPI requires [Package] (20140214/nsarguments-95)
[ 3459.836314] DEBUG: nouveau_check_optimus_dsm result: c010001
[ 3459.836316] DEBUG: retval after nouveau_check_optimus_dsm(dhandle): 2
[ 3459.836321] ACPI Warning: \_SB_.PCI0.PEG_.VID_._DSM: Argument #4 type
mismatch -
 Found [Buffer], ACPI requires [Package] (20140214/nsarguments-95)
[ 3459.836653] pci 0000:01:00.0: optimus capabilities: enabled, status dynamic
powe
r, hda bios codec supported
[ 3459.836657] VGA switcheroo: detected Optimus DSM method \_SB_.PCI0.PEG_.VID_
han
dle
[ 3459.836953] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x108100a1
[ 3459.836955] nouveau  [  DEVICE][0000:01:00.0] Chipset: GK208 (NV108)
[ 3459.836957] nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
[ 3459.838506] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[ 3459.838510] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[ 3459.838511] nouveau  [   VBIOS][0000:01:00.0] checking PROM for image...
[ 3459.838565] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[ 3459.838566] nouveau  [   VBIOS][0000:01:00.0] checking ACPI for image...
[ 3459.838568] DEBUG: dsm_detected: 0, optimus_detected: 1
[ 3460.002952] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[ 3460.002955] nouveau  [   VBIOS][0000:01:00.0] using image from ACPI
[ 3460.003021] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[ 3460.003023] nouveau  [   VBIOS][0000:01:00.0] version 80.28.2a.00.30
[ 3460.003876] nouveau  [   VBIOS][0000:01:00.0] running init tables
[ 3460.046746] nouveau 0000:01:00.0: irq 49 for MSI/MSI-X
[ 3460.046758] nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
[ 3460.046796] nouveau  [     PFB][0000:01:00.0] RAM type: DDR3
[ 3460.046797] nouveau  [     PFB][0000:01:00.0] RAM size: 1024 MiB
[ 3460.046799] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
[ 3460.046857] nouveau E[   PIBUS][0000:01:00.0] HUB0: 0x6013d4 0xbadf5701
(0x19708200)
[ 3460.046863] nouveau E[   PIBUS][0000:01:00.0] GPC0: 0x4188ac 0x00000001
(0x1970822e)
[ 3460.051219] nouveau  [    VOLT][0000:01:00.0] GPU voltage: 600000uv
[ 3460.691537] nouveau  [  PTHERM][0000:01:00.0] FAN control: none / external
[ 3460.691548] nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
[ 3460.691565] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[ 3460.691599] nouveau  [     CLK][0000:01:00.0] 07: core 405 MHz memory 810
MHz 
[ 3460.691650] nouveau  [     CLK][0000:01:00.0] 0a: core 405-875 MHz memory
1620 MHz 
[ 3460.691715] nouveau  [     CLK][0000:01:00.0] 0f: core 405-875 MHz memory
2002 MHz 
[ 3460.691777] nouveau  [     CLK][0000:01:00.0] --: core 405 MHz memory 810
MHz 
[ 3460.703809] vga_switcheroo: enabled
[ 3460.703931] [TTM] Zone  kernel: Available graphics memory: 8155342 kiB
[ 3460.703932] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[ 3460.703932] [TTM] Initializing pool allocator
[ 3460.703936] [TTM] Initializing DMA pool allocator
[ 3460.703943] nouveau  [     DRM] VRAM: 1024 MiB
[ 3460.703943] nouveau  [     DRM] GART: 1048576 MiB
[ 3460.703946] nouveau E[     DRM] Pointer to TMDS table invalid
[ 3460.703947] nouveau  [     DRM] DCB version 4.0
[ 3460.703948] nouveau E[     DRM] Pointer to flat panel table invalid
[ 3460.710300] nouveau  [     DRM] MM: using COPY for buffer copies
[ 3460.710305] [drm] Initialized nouveau 1.1.1 20120801 for 0000:01:00.0 on
minor 1
[ 3465.713671] ACPI Warning: \_SB_.PCI0.PEG_.VID_._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20140214/nsarguments-95)
[ 3465.713979] ACPI Warning: \_SB_.PCI0.PEG_.VID_._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20140214/nsarguments-95)

however xrandr sees no nouveau provider:
2349-pb8edcn linux # xrandr --listproviders
Providers: number : 1
Provider 0: id: 0x48 cap: 0xb, Source Output, Sink Output, Sink Offload crtcs:
3 outputs: 6 associated providers: 0 name:Intel</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1398928914.EeD60.1600--

--===============1881671638==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1881671638==--
