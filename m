From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 88868] PowerPC e5500, kernel crash, GT520, GT610
Date: Mon, 02 Feb 2015 10:59:02 +0000
Message-ID: <bug-88868-8800-nWATTsCSoe@http.bugs.freedesktop.org/>
References: <bug-88868-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1619663963=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-88868-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1619663963==
Content-Type: multipart/alternative; boundary="1422874742.0eCC41.24362"; charset="UTF-8"


--1422874742.0eCC41.24362
Date: Mon, 2 Feb 2015 10:59:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=88868

--- Comment #19 from Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Dmitriy from comment #18)
> Created attachment 113050 [details]
> correct image (BOOT0  : 0x043100a4)
> 
> log with error, I attach to "Comment 15"
> 
> if use param nouveau.noaccel=1 then log view like this and no error, but the
> image anyway incorrect:
> [drm] Initialized drm 1.1.0 20060810
> nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0d90a0a1
> nouveau  [  DEVICE][0000:01:00.0] Chipset: GF119 (NVD9)
> nouveau  [  DEVICE][0000:01:00.0] Family : NVC0
> nouveau  [   VBIOS][0000:01:00.0] checking OpenFirmware for image...
> nouveau  [   VBIOS][0000:01:00.0] Unable to get the OF node
> nouveau  [   VBIOS][0000:01:00.0] ... signature not found
> nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
> nouveau  [   VBIOS][0000:01:00.0] ... signature not found
> nouveau  [   VBIOS][0000:01:00.0] checking PROM for image...
> nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
> nouveau  [   VBIOS][0000:01:00.0] using image from PROM
> nouveau  [   VBIOS][0000:01:00.0] BIT signature found
> nouveau  [   VBIOS][0000:01:00.0] version 75.19.55.00.02
> nouveau  [ DEVINIT][0000:01:00.0] adaptor not initialised
> nouveau  [   VBIOS][0000:01:00.0] running init tables
> nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
> nouveau W[     PFB][0000:01:00.0][0x00000000][c0000001fe2c6800] reclocking
> of this ram type unsupported
> nouveau  [     PFB][0000:01:00.0] RAM type: DDR3
> nouveau  [     PFB][0000:01:00.0] RAM size: 1024 MiB
> nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
> nouveau  [    VOLT][0000:01:00.0] GPU voltage: 900000uv
> nouveau  [  PTHERM][0000:01:00.0] FAN control: PWM
> nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
> nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
> nouveau  [     CLK][0000:01:00.0] 07: core 270 MHz memory 405 MHz 
> nouveau  [     CLK][0000:01:00.0] 0f: core 810 MHz memory 500 MHz 
> nouveau  [     CLK][0000:01:00.0] --: core 270 MHz memory 405 MHz 
> [TTM] Zone  kernel: Available graphics memory: 4091134 kiB
> [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
> [TTM] Initializing pool allocator
> [TTM] Initializing DMA pool allocator
> nouveau  [     DRM] VRAM: 1024 MiB
> nouveau  [     DRM] GART: 1048576 MiB
> nouveau  [     DRM] TMDS table version 2.0
> nouveau  [     DRM] DCB version 4.0
> nouveau  [     DRM] DCB outp 00: 02000300 00000000
> nouveau  [     DRM] DCB outp 01: 01000302 00020030
> nouveau  [     DRM] DCB outp 02: 02011362 00020010
> nouveau  [     DRM] DCB outp 03: 04022310 00000000
> nouveau  [     DRM] DCB conn 00: 00001030
> nouveau  [     DRM] DCB conn 01: 00002161
> nouveau  [     DRM] DCB conn 02: 00000200
> [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> [drm] Driver supports precise vblank timestamp query.
> nouveau  [     DRM] allocated 1024x768 fb: 0x60000, bo c00000007e2d7400
> nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
> nouveau 0000:01:00.0: registered panic notifier
> [drm] Initialized nouveau 1.2.1 20120801 for 0000:01:00.0 on minor 0
> 
> 
> 
> And I have video card with "boot=0x043100a4". For this video card no need
> patch and no need new kernel and bootId always read correct.
> [drm] Initialized drm 1.1.0 20060810
> nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x043100a4
> nouveau  [  DEVICE][0000:01:00.0] Chipset: NV43 (NV43)
> nouveau  [  DEVICE][0000:01:00.0] Family : NV40
> nouveau  [   VBIOS][0000:01:00.0] checking OpenFirmware for image...
> nouveau  [   VBIOS][0000:01:00.0] Unable to get the OF node
> nouveau  [   VBIOS][0000:01:00.0] ... signature not found
> nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
> nouveau  [   VBIOS][0000:01:00.0] ... signature not found
> nouveau  [   VBIOS][0000:01:00.0] checking PROM for image...
> nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
> nouveau  [   VBIOS][0000:01:00.0] using image from PROM
> nouveau  [   VBIOS][0000:01:00.0] BIT signature found
> nouveau  [   VBIOS][0000:01:00.0] version 05.43.02.88.00
> nouveau  [ DEVINIT][0000:01:00.0] adaptor not initialised
> nouveau  [   VBIOS][0000:01:00.0] running init tables
> nouveau  [     PFB][0000:01:00.0] RAM type: DDR2
> nouveau  [     PFB][0000:01:00.0] RAM size: 512 MiB
> 
> 
> for this video card early I attach log by nvagetbios for info
> log by nvagetbios -s PRAMIN >vbios_pramin.rom (64.00 KB, text/plain) 
> 2015-01-29 15:12
> 
> nvagetbios -s PROM >vbios_prom.rom (1.00 MB, text/plain) 
> 2015-01-29 15:13 
> 
> and screen view is correct.
> 
> Why does GT520 or GT610 not work like video card with "BOOT0: 0x043100a4" (((
Because those boards are about 5 generations newer, and almost *completely*
different.  As I already told you, nothing newer has ever been tested on
big-endian to my knowledge.

I have access to a G5, and planned to look into it today, but technical
difficulties and more pressing issues got in the way.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1422874742.0eCC41.24362
Date: Mon, 2 Feb 2015 10:59:02 +0000
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
   title="NEW - PowerPC e5500, kernel crash, GT520, GT610"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88868#c19">Comment # 19</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - PowerPC e5500, kernel crash, GT520, GT610"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88868">bug 88868</a>
              from <span class="vcard"><a class="email" href="mailto:skeggsb&#64;gmail.com" title="Ben Skeggs &lt;skeggsb&#64;gmail.com&gt;"> <span class="fn">Ben Skeggs</span></a>
</span></b>
        <pre>(In reply to Dmitriy from <a href="show_bug.cgi?id=88868#c18">comment #18</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=113050" name="attach_113050" title="correct image (BOOT0  : 0x043100a4)">attachment 113050</a> <a href="attachment.cgi?id=113050&amp;action=edit" title="correct image (BOOT0  : 0x043100a4)">[details]</a></span>
&gt; correct image (BOOT0  : 0x043100a4)
&gt; 
&gt; log with error, I attach to &quot;<a href="show_bug.cgi?id=88868#c15">Comment 15</a>&quot;
&gt; 
&gt; if use param nouveau.noaccel=1 then log view like this and no error, but the
&gt; image anyway incorrect:
&gt; [drm] Initialized drm 1.1.0 20060810
&gt; nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0d90a0a1
&gt; nouveau  [  DEVICE][0000:01:00.0] Chipset: GF119 (NVD9)
&gt; nouveau  [  DEVICE][0000:01:00.0] Family : NVC0
&gt; nouveau  [   VBIOS][0000:01:00.0] checking OpenFirmware for image...
&gt; nouveau  [   VBIOS][0000:01:00.0] Unable to get the OF node
&gt; nouveau  [   VBIOS][0000:01:00.0] ... signature not found
&gt; nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
&gt; nouveau  [   VBIOS][0000:01:00.0] ... signature not found
&gt; nouveau  [   VBIOS][0000:01:00.0] checking PROM for image...
&gt; nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
&gt; nouveau  [   VBIOS][0000:01:00.0] using image from PROM
&gt; nouveau  [   VBIOS][0000:01:00.0] BIT signature found
&gt; nouveau  [   VBIOS][0000:01:00.0] version 75.19.55.00.02
&gt; nouveau  [ DEVINIT][0000:01:00.0] adaptor not initialised
&gt; nouveau  [   VBIOS][0000:01:00.0] running init tables
&gt; nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
&gt; nouveau W[     PFB][0000:01:00.0][0x00000000][c0000001fe2c6800] reclocking
&gt; of this ram type unsupported
&gt; nouveau  [     PFB][0000:01:00.0] RAM type: DDR3
&gt; nouveau  [     PFB][0000:01:00.0] RAM size: 1024 MiB
&gt; nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
&gt; nouveau  [    VOLT][0000:01:00.0] GPU voltage: 900000uv
&gt; nouveau  [  PTHERM][0000:01:00.0] FAN control: PWM
&gt; nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
&gt; nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
&gt; nouveau  [     CLK][0000:01:00.0] 07: core 270 MHz memory 405 MHz 
&gt; nouveau  [     CLK][0000:01:00.0] 0f: core 810 MHz memory 500 MHz 
&gt; nouveau  [     CLK][0000:01:00.0] --: core 270 MHz memory 405 MHz 
&gt; [TTM] Zone  kernel: Available graphics memory: 4091134 kiB
&gt; [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
&gt; [TTM] Initializing pool allocator
&gt; [TTM] Initializing DMA pool allocator
&gt; nouveau  [     DRM] VRAM: 1024 MiB
&gt; nouveau  [     DRM] GART: 1048576 MiB
&gt; nouveau  [     DRM] TMDS table version 2.0
&gt; nouveau  [     DRM] DCB version 4.0
&gt; nouveau  [     DRM] DCB outp 00: 02000300 00000000
&gt; nouveau  [     DRM] DCB outp 01: 01000302 00020030
&gt; nouveau  [     DRM] DCB outp 02: 02011362 00020010
&gt; nouveau  [     DRM] DCB outp 03: 04022310 00000000
&gt; nouveau  [     DRM] DCB conn 00: 00001030
&gt; nouveau  [     DRM] DCB conn 01: 00002161
&gt; nouveau  [     DRM] DCB conn 02: 00000200
&gt; [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
&gt; [drm] Driver supports precise vblank timestamp query.
&gt; nouveau  [     DRM] allocated 1024x768 fb: 0x60000, bo c00000007e2d7400
&gt; nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
&gt; nouveau 0000:01:00.0: registered panic notifier
&gt; [drm] Initialized nouveau 1.2.1 20120801 for 0000:01:00.0 on minor 0
&gt; 
&gt; 
&gt; 
&gt; And I have video card with &quot;boot=0x043100a4&quot;. For this video card no need
&gt; patch and no need new kernel and bootId always read correct.
&gt; [drm] Initialized drm 1.1.0 20060810
&gt; nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x043100a4
&gt; nouveau  [  DEVICE][0000:01:00.0] Chipset: NV43 (NV43)
&gt; nouveau  [  DEVICE][0000:01:00.0] Family : NV40
&gt; nouveau  [   VBIOS][0000:01:00.0] checking OpenFirmware for image...
&gt; nouveau  [   VBIOS][0000:01:00.0] Unable to get the OF node
&gt; nouveau  [   VBIOS][0000:01:00.0] ... signature not found
&gt; nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
&gt; nouveau  [   VBIOS][0000:01:00.0] ... signature not found
&gt; nouveau  [   VBIOS][0000:01:00.0] checking PROM for image...
&gt; nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
&gt; nouveau  [   VBIOS][0000:01:00.0] using image from PROM
&gt; nouveau  [   VBIOS][0000:01:00.0] BIT signature found
&gt; nouveau  [   VBIOS][0000:01:00.0] version 05.43.02.88.00
&gt; nouveau  [ DEVINIT][0000:01:00.0] adaptor not initialised
&gt; nouveau  [   VBIOS][0000:01:00.0] running init tables
&gt; nouveau  [     PFB][0000:01:00.0] RAM type: DDR2
&gt; nouveau  [     PFB][0000:01:00.0] RAM size: 512 MiB
&gt; 
&gt; 
&gt; for this video card early I attach log by nvagetbios for info
&gt; log by nvagetbios -s PRAMIN &gt;vbios_pramin.rom (64.00 KB, text/plain) 
&gt; 2015-01-29 15:12
&gt; 
&gt; nvagetbios -s PROM &gt;vbios_prom.rom (1.00 MB, text/plain) 
&gt; 2015-01-29 15:13 
&gt; 
&gt; and screen view is correct.
&gt; 
&gt; Why does GT520 or GT610 not work like video card with &quot;BOOT0: 0x043100a4&quot; (((</span >
Because those boards are about 5 generations newer, and almost *completely*
different.  As I already told you, nothing newer has ever been tested on
big-endian to my knowledge.

I have access to a G5, and planned to look into it today, but technical
difficulties and more pressing issues got in the way.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1422874742.0eCC41.24362--

--===============1619663963==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1619663963==--
