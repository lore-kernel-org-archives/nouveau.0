From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89558] [NV118] GM108 not supported by nouveau
Date: Wed, 30 Sep 2015 19:03:48 +0000
Message-ID: <bug-89558-8800-4aJ8qveCE4@http.bugs.freedesktop.org/>
References: <bug-89558-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0132257044=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89558-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0132257044==
Content-Type: multipart/alternative; boundary="1443639828.DDC4ba4.25650"; charset="UTF-8"


--1443639828.DDC4ba4.25650
Date: Wed, 30 Sep 2015 19:03:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89558

--- Comment #40 from Andrey Borzenkov <arvidjaar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Using current kernel.org git as of dd36d7393d6310b0c1adefb22fba79c3cf8a577c and
adding 0x118 to select 0x117 driver I get

[   67.595247] nouveau: module verification failed: signature and/or required
key missing - tainting kernel
[   67.601091] MXM: GUID detected in BIOS
[   67.601144] ACPI Warning: \_SB_.PCI0.RP05.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20150818/nsarguments-95)
[   67.601182] ACPI Warning: \_SB_.PCI0.RP05.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20150818/nsarguments-95)
[   67.601330] pci 0000:03:00.0: optimus capabilities: enabled, status dynamic
power, hda bios codec supported
[   67.601331] VGA switcheroo: detected Optimus DSM method \_SB_.PCI0.RP05.PEGP
handle
[   67.601380] nouveau 0000:03:00.0: enabling device (0006 -> 0007)
[   67.601421] nouveau 0000:03:00.0: NVIDIA GM107 (118000a2)
[   67.614439] nouveau 0000:03:00.0: bios: version 82.08.18.00.2a
[   67.698727] nouveau 0000:03:00.0: fb: 2048 MiB DDR3
[   67.698759] nouveau 0000:03:00.0: priv: HUB0: 6013d4 00005730 (1b408200)
[   67.698795] nouveau 0000:03:00.0: priv: HUB0: 10ecc0 ffffffff (1840822c)
[   68.975809] vga_switcheroo: enabled
[   68.975924] [TTM] Zone  kernel: Available graphics memory: 4031282 kiB
[   68.975925] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[   68.975936] [TTM] Initializing pool allocator
[   68.975940] [TTM] Initializing DMA pool allocator
[   68.975950] nouveau 0000:03:00.0: DRM: VRAM: 2048 MiB
[   68.975951] nouveau 0000:03:00.0: DRM: GART: 1048576 MiB
[   68.975953] nouveau 0000:03:00.0: DRM: Pointer to TMDS table invalid
[   68.975955] nouveau 0000:03:00.0: DRM: DCB version 4.0
[   68.975956] nouveau 0000:03:00.0: DRM: Pointer to flat panel table invalid
[   69.132692] nouveau 0000:03:00.0: DRM: MM: using COPY for buffer copies
[   69.132701] [drm] Initialized nouveau 1.3.0 20120801 for 0000:03:00.0 on
minor 1

/dev/dri nodes are correctly created for a second card. Unfortunately attempt
to actually run something on secondary GPU results in

[   184.755] (II) [drm] nouveau interface version: 1.3.0
[   184.755] (EE) Unknown chipset: NV118

While running up to date kernel is easy, getting up to date Xorg is probably
more challenging (I'm writing this on Ubuntu 14.04). But kernel side looks
promising. Please let me know if you need any additional logs from nouveau or
nVidia driver.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1443639828.DDC4ba4.25650
Date: Wed, 30 Sep 2015 19:03:48 +0000
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
   title="NEW - [NV118] GM108 not supported by nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89558#c40">Comment # 40</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV118] GM108 not supported by nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89558">bug 89558</a>
              from <span class="vcard"><a class="email" href="mailto:arvidjaar&#64;gmail.com" title="Andrey Borzenkov &lt;arvidjaar&#64;gmail.com&gt;"> <span class="fn">Andrey Borzenkov</span></a>
</span></b>
        <pre>Using current kernel.org git as of dd36d7393d6310b0c1adefb22fba79c3cf8a577c and
adding 0x118 to select 0x117 driver I get

[   67.595247] nouveau: module verification failed: signature and/or required
key missing - tainting kernel
[   67.601091] MXM: GUID detected in BIOS
[   67.601144] ACPI Warning: \_SB_.PCI0.RP05.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20150818/nsarguments-95)
[   67.601182] ACPI Warning: \_SB_.PCI0.RP05.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20150818/nsarguments-95)
[   67.601330] pci 0000:03:00.0: optimus capabilities: enabled, status dynamic
power, hda bios codec supported
[   67.601331] VGA switcheroo: detected Optimus DSM method \_SB_.PCI0.RP05.PEGP
handle
[   67.601380] nouveau 0000:03:00.0: enabling device (0006 -&gt; 0007)
[   67.601421] nouveau 0000:03:00.0: NVIDIA GM107 (118000a2)
[   67.614439] nouveau 0000:03:00.0: bios: version 82.08.18.00.2a
[   67.698727] nouveau 0000:03:00.0: fb: 2048 MiB DDR3
[   67.698759] nouveau 0000:03:00.0: priv: HUB0: 6013d4 00005730 (1b408200)
[   67.698795] nouveau 0000:03:00.0: priv: HUB0: 10ecc0 ffffffff (1840822c)
[   68.975809] vga_switcheroo: enabled
[   68.975924] [TTM] Zone  kernel: Available graphics memory: 4031282 kiB
[   68.975925] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[   68.975936] [TTM] Initializing pool allocator
[   68.975940] [TTM] Initializing DMA pool allocator
[   68.975950] nouveau 0000:03:00.0: DRM: VRAM: 2048 MiB
[   68.975951] nouveau 0000:03:00.0: DRM: GART: 1048576 MiB
[   68.975953] nouveau 0000:03:00.0: DRM: Pointer to TMDS table invalid
[   68.975955] nouveau 0000:03:00.0: DRM: DCB version 4.0
[   68.975956] nouveau 0000:03:00.0: DRM: Pointer to flat panel table invalid
[   69.132692] nouveau 0000:03:00.0: DRM: MM: using COPY for buffer copies
[   69.132701] [drm] Initialized nouveau 1.3.0 20120801 for 0000:03:00.0 on
minor 1

/dev/dri nodes are correctly created for a second card. Unfortunately attempt
to actually run something on secondary GPU results in

[   184.755] (II) [drm] nouveau interface version: 1.3.0
[   184.755] (EE) Unknown chipset: NV118

While running up to date kernel is easy, getting up to date Xorg is probably
more challenging (I'm writing this on Ubuntu 14.04). But kernel side looks
promising. Please let me know if you need any additional logs from nouveau or
nVidia driver.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1443639828.DDC4ba4.25650--

--===============0132257044==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0132257044==--
