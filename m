From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91779] Pure EFI: MacBookPro3,
 1 (NV84) fails to load nouveau on linux 4.1 -- Invalid ROM contents
Date: Mon, 31 Aug 2015 06:33:12 +0000
Message-ID: <bug-91779-8800-WVj58V2bQn@http.bugs.freedesktop.org/>
References: <bug-91779-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1580287563=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91779-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1580287563==
Content-Type: multipart/alternative; boundary="1441002792.434eb5bb1.14387"; charset="UTF-8"


--1441002792.434eb5bb1.14387
Date: Mon, 31 Aug 2015 06:33:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91779

--- Comment #11 from Jeremy Huddleston <jeremyhu-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org> ---
Sweet.  Thanks for the help.  So with 'sudo modprobe nouveau
config=NvBios=vbios.rom,NvForcePost=1', I'm seeing things working great so far.
 The kernel logging from the initialization is shown below.

So now that *I'm* up and running, what can we do to help out Joe User here? 
I'll try out a newer kernel to see if NvForcePost=1 is still required, and if
not, maybe we'll need a quirk.  And what can we do to get the firmware for Joe
User?

Aug 30 23:28:30 wedge kernel: [  124.139997] [drm] Initialized drm 1.1.0
20060810
Aug 30 23:28:30 wedge kernel: [  124.174617] wmi: Mapper loaded
Aug 30 23:28:30 wedge kernel: [  124.245291] checking generic (c0030000 710000)
vs hw (c0000000 10000000)
Aug 30 23:28:30 wedge kernel: [  124.245295] fb: conflicting fb hw usage
nouveaufb vs EFI VGA - removing generic driver
Aug 30 23:28:30 wedge kernel: [  124.245377] Console: switching to colour dummy
device 80x25
Aug 30 23:28:30 wedge kernel: [  124.245495] nouveau 0000:01:00.0: enabling
device (0006 -> 0007)
Aug 30 23:28:30 wedge kernel: [  124.245734] [drm] hdmi device  not found 1 0 1
Aug 30 23:28:30 wedge kernel: [  124.246032] nouveau  [  DEVICE][0000:01:00.0]
BOOT0  : 0x084700a2
Aug 30 23:28:30 wedge kernel: [  124.246035] nouveau  [  DEVICE][0000:01:00.0]
Chipset: G84 (NV84)
Aug 30 23:28:30 wedge kernel: [  124.246038] nouveau  [  DEVICE][0000:01:00.0]
Family : NV50
Aug 30 23:28:30 wedge kernel: [  124.265240] nouveau  [   VBIOS][0000:01:00.0]
image: vbios.rom
Aug 30 23:28:30 wedge kernel: [  124.265323] nouveau  [   VBIOS][0000:01:00.0]
... appears to be valid
Aug 30 23:28:30 wedge kernel: [  124.265489] nouveau  [   VBIOS][0000:01:00.0]
BIT signature found
Aug 30 23:28:30 wedge kernel: [  124.265495] nouveau  [   VBIOS][0000:01:00.0]
version 60.84.49.03.00
Aug 30 23:28:30 wedge kernel: [  124.265707] nouveau  [   VBIOS][0000:01:00.0]
running init tables
Aug 30 23:28:31 wedge kernel: [  124.326633] nouveau 0000:01:00.0: irq 48 for
MSI/MSI-X
Aug 30 23:28:31 wedge kernel: [  124.326656] nouveau  [     PMC][0000:01:00.0]
MSI interrupts enabled
Aug 30 23:28:31 wedge kernel: [  124.326708] nouveau  [     PFB][0000:01:00.0]
RAM type: GDDR3
Aug 30 23:28:31 wedge kernel: [  124.326712] nouveau  [     PFB][0000:01:00.0]
RAM size: 128 MiB
Aug 30 23:28:31 wedge kernel: [  124.326716] nouveau  [     PFB][0000:01:00.0] 
  ZCOMP: 1892 tags
Aug 30 23:28:31 wedge kernel: [  124.335737] nouveau  [    VOLT][0000:01:00.0]
GPU voltage: 1130000uv
Aug 30 23:28:31 wedge kernel: [  124.359793] nouveau  [  PTHERM][0000:01:00.0]
FAN control: none / external
Aug 30 23:28:31 wedge kernel: [  124.359802] nouveau  [  PTHERM][0000:01:00.0]
fan management: automatic
Aug 30 23:28:31 wedge kernel: [  124.359806] nouveau  [  PTHERM][0000:01:00.0]
internal sensor: yes
Aug 30 23:28:31 wedge kernel: [  124.359832] nouveau  [     CLK][0000:01:00.0]
20: core 169 MHz shader 338 MHz memory 100 MHz
Aug 30 23:28:31 wedge kernel: [  124.359836] nouveau  [     CLK][0000:01:00.0]
21: core 283 MHz shader 566 MHz memory 297 MHz
Aug 30 23:28:31 wedge kernel: [  124.359840] nouveau  [     CLK][0000:01:00.0]
22: core 375 MHz shader 750 MHz memory 502 MHz
Aug 30 23:28:31 wedge kernel: [  124.359843] nouveau  [     CLK][0000:01:00.0]
23: core 470 MHz shader 940 MHz memory 635 MHz
Aug 30 23:28:31 wedge kernel: [  124.359883] nouveau  [     CLK][0000:01:00.0]
--: core 275 MHz shader 550 MHz memory 300 MHz
Aug 30 23:28:31 wedge kernel: [  124.360073] [TTM] Zone  kernel: Available
graphics memory: 2022336 kiB
Aug 30 23:28:31 wedge kernel: [  124.360075] [TTM] Initializing pool allocator
Aug 30 23:28:31 wedge kernel: [  124.360080] [TTM] Initializing DMA pool
allocator
Aug 30 23:28:31 wedge kernel: [  124.360091] nouveau  [     DRM] VRAM: 128 MiB
Aug 30 23:28:31 wedge kernel: [  124.360093] nouveau  [     DRM] GART: 1048576
MiB
Aug 30 23:28:31 wedge kernel: [  124.360098] nouveau  [     DRM] TMDS table
version 2.0
Aug 30 23:28:31 wedge kernel: [  124.360100] nouveau  [     DRM] DCB version
4.0
Aug 30 23:28:31 wedge kernel: [  124.360103] nouveau  [     DRM] DCB outp 00:
01000123 00010034
Aug 30 23:28:31 wedge kernel: [  124.360105] nouveau  [     DRM] DCB outp 01:
02011210 00000028
Aug 30 23:28:31 wedge kernel: [  124.360107] nouveau  [     DRM] DCB outp 02:
02011212 00010030
Aug 30 23:28:31 wedge kernel: [  124.360110] nouveau  [     DRM] DCB outp 03:
01011211 0080c070
Aug 30 23:28:31 wedge kernel: [  124.360112] nouveau  [     DRM] DCB conn 00:
0040
Aug 30 23:28:31 wedge kernel: [  124.360115] nouveau  [     DRM] DCB conn 01:
1120
Aug 30 23:28:31 wedge kernel: [  124.376927] nouveau W[     DRM] unknown
connector type 20
Aug 30 23:28:31 wedge kernel: [  124.376965] nouveau W[     DRM] failed to
create encoder 0/1/0: -19
Aug 30 23:28:31 wedge kernel: [  124.376967] [drm] Supports vblank timestamp
caching Rev 2 (21.10.2013).
Aug 30 23:28:31 wedge kernel: [  124.376969] [drm] No driver support for vblank
timestamp query.
Aug 30 23:28:31 wedge kernel: [  124.394728] nouveau  [     DRM] MM: using
CRYPT for buffer copies
Aug 30 23:28:31 wedge kernel: [  124.447363] nouveau  [     DRM] allocated
1440x900 fb: 0x60000, bo ffff8800a2cb0000
Aug 30 23:28:31 wedge kernel: [  124.450045] fbcon: nouveaufb (fb0) is primary
device
Aug 30 23:28:31 wedge kernel: [  124.507258] Console: switching to colour frame
buffer device 180x56
Aug 30 23:28:31 wedge kernel: [  124.551887] nouveau 0000:01:00.0: fb0:
nouveaufb frame buffer device
Aug 30 23:28:31 wedge kernel: [  124.551890] nouveau 0000:01:00.0: registered
panic notifier
Aug 30 23:28:31 wedge kernel: [  124.551896] [drm] Initialized nouveau 1.1.2
20120801 for 0000:01:00.0 on minor 0

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1441002792.434eb5bb1.14387
Date: Mon, 31 Aug 2015 06:33:12 +0000
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
   title="NEW - Pure EFI: MacBookPro3,1 (NV84) fails to load nouveau on linux 4.1 -- Invalid ROM contents"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91779#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Pure EFI: MacBookPro3,1 (NV84) fails to load nouveau on linux 4.1 -- Invalid ROM contents"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91779">bug 91779</a>
              from <span class="vcard"><a class="email" href="mailto:jeremyhu&#64;freedesktop.org" title="Jeremy Huddleston &lt;jeremyhu&#64;freedesktop.org&gt;"> <span class="fn">Jeremy Huddleston</span></a>
</span></b>
        <pre>Sweet.  Thanks for the help.  So with 'sudo modprobe nouveau
config=NvBios=vbios.rom,NvForcePost=1', I'm seeing things working great so far.
 The kernel logging from the initialization is shown below.

So now that *I'm* up and running, what can we do to help out Joe User here? 
I'll try out a newer kernel to see if NvForcePost=1 is still required, and if
not, maybe we'll need a quirk.  And what can we do to get the firmware for Joe
User?

Aug 30 23:28:30 wedge kernel: [  124.139997] [drm] Initialized drm 1.1.0
20060810
Aug 30 23:28:30 wedge kernel: [  124.174617] wmi: Mapper loaded
Aug 30 23:28:30 wedge kernel: [  124.245291] checking generic (c0030000 710000)
vs hw (c0000000 10000000)
Aug 30 23:28:30 wedge kernel: [  124.245295] fb: conflicting fb hw usage
nouveaufb vs EFI VGA - removing generic driver
Aug 30 23:28:30 wedge kernel: [  124.245377] Console: switching to colour dummy
device 80x25
Aug 30 23:28:30 wedge kernel: [  124.245495] nouveau 0000:01:00.0: enabling
device (0006 -&gt; 0007)
Aug 30 23:28:30 wedge kernel: [  124.245734] [drm] hdmi device  not found 1 0 1
Aug 30 23:28:30 wedge kernel: [  124.246032] nouveau  [  DEVICE][0000:01:00.0]
BOOT0  : 0x084700a2
Aug 30 23:28:30 wedge kernel: [  124.246035] nouveau  [  DEVICE][0000:01:00.0]
Chipset: G84 (NV84)
Aug 30 23:28:30 wedge kernel: [  124.246038] nouveau  [  DEVICE][0000:01:00.0]
Family : NV50
Aug 30 23:28:30 wedge kernel: [  124.265240] nouveau  [   VBIOS][0000:01:00.0]
image: vbios.rom
Aug 30 23:28:30 wedge kernel: [  124.265323] nouveau  [   VBIOS][0000:01:00.0]
... appears to be valid
Aug 30 23:28:30 wedge kernel: [  124.265489] nouveau  [   VBIOS][0000:01:00.0]
BIT signature found
Aug 30 23:28:30 wedge kernel: [  124.265495] nouveau  [   VBIOS][0000:01:00.0]
version 60.84.49.03.00
Aug 30 23:28:30 wedge kernel: [  124.265707] nouveau  [   VBIOS][0000:01:00.0]
running init tables
Aug 30 23:28:31 wedge kernel: [  124.326633] nouveau 0000:01:00.0: irq 48 for
MSI/MSI-X
Aug 30 23:28:31 wedge kernel: [  124.326656] nouveau  [     PMC][0000:01:00.0]
MSI interrupts enabled
Aug 30 23:28:31 wedge kernel: [  124.326708] nouveau  [     PFB][0000:01:00.0]
RAM type: GDDR3
Aug 30 23:28:31 wedge kernel: [  124.326712] nouveau  [     PFB][0000:01:00.0]
RAM size: 128 MiB
Aug 30 23:28:31 wedge kernel: [  124.326716] nouveau  [     PFB][0000:01:00.0] 
  ZCOMP: 1892 tags
Aug 30 23:28:31 wedge kernel: [  124.335737] nouveau  [    VOLT][0000:01:00.0]
GPU voltage: 1130000uv
Aug 30 23:28:31 wedge kernel: [  124.359793] nouveau  [  PTHERM][0000:01:00.0]
FAN control: none / external
Aug 30 23:28:31 wedge kernel: [  124.359802] nouveau  [  PTHERM][0000:01:00.0]
fan management: automatic
Aug 30 23:28:31 wedge kernel: [  124.359806] nouveau  [  PTHERM][0000:01:00.0]
internal sensor: yes
Aug 30 23:28:31 wedge kernel: [  124.359832] nouveau  [     CLK][0000:01:00.0]
20: core 169 MHz shader 338 MHz memory 100 MHz
Aug 30 23:28:31 wedge kernel: [  124.359836] nouveau  [     CLK][0000:01:00.0]
21: core 283 MHz shader 566 MHz memory 297 MHz
Aug 30 23:28:31 wedge kernel: [  124.359840] nouveau  [     CLK][0000:01:00.0]
22: core 375 MHz shader 750 MHz memory 502 MHz
Aug 30 23:28:31 wedge kernel: [  124.359843] nouveau  [     CLK][0000:01:00.0]
23: core 470 MHz shader 940 MHz memory 635 MHz
Aug 30 23:28:31 wedge kernel: [  124.359883] nouveau  [     CLK][0000:01:00.0]
--: core 275 MHz shader 550 MHz memory 300 MHz
Aug 30 23:28:31 wedge kernel: [  124.360073] [TTM] Zone  kernel: Available
graphics memory: 2022336 kiB
Aug 30 23:28:31 wedge kernel: [  124.360075] [TTM] Initializing pool allocator
Aug 30 23:28:31 wedge kernel: [  124.360080] [TTM] Initializing DMA pool
allocator
Aug 30 23:28:31 wedge kernel: [  124.360091] nouveau  [     DRM] VRAM: 128 MiB
Aug 30 23:28:31 wedge kernel: [  124.360093] nouveau  [     DRM] GART: 1048576
MiB
Aug 30 23:28:31 wedge kernel: [  124.360098] nouveau  [     DRM] TMDS table
version 2.0
Aug 30 23:28:31 wedge kernel: [  124.360100] nouveau  [     DRM] DCB version
4.0
Aug 30 23:28:31 wedge kernel: [  124.360103] nouveau  [     DRM] DCB outp 00:
01000123 00010034
Aug 30 23:28:31 wedge kernel: [  124.360105] nouveau  [     DRM] DCB outp 01:
02011210 00000028
Aug 30 23:28:31 wedge kernel: [  124.360107] nouveau  [     DRM] DCB outp 02:
02011212 00010030
Aug 30 23:28:31 wedge kernel: [  124.360110] nouveau  [     DRM] DCB outp 03:
01011211 0080c070
Aug 30 23:28:31 wedge kernel: [  124.360112] nouveau  [     DRM] DCB conn 00:
0040
Aug 30 23:28:31 wedge kernel: [  124.360115] nouveau  [     DRM] DCB conn 01:
1120
Aug 30 23:28:31 wedge kernel: [  124.376927] nouveau W[     DRM] unknown
connector type 20
Aug 30 23:28:31 wedge kernel: [  124.376965] nouveau W[     DRM] failed to
create encoder 0/1/0: -19
Aug 30 23:28:31 wedge kernel: [  124.376967] [drm] Supports vblank timestamp
caching Rev 2 (21.10.2013).
Aug 30 23:28:31 wedge kernel: [  124.376969] [drm] No driver support for vblank
timestamp query.
Aug 30 23:28:31 wedge kernel: [  124.394728] nouveau  [     DRM] MM: using
CRYPT for buffer copies
Aug 30 23:28:31 wedge kernel: [  124.447363] nouveau  [     DRM] allocated
1440x900 fb: 0x60000, bo ffff8800a2cb0000
Aug 30 23:28:31 wedge kernel: [  124.450045] fbcon: nouveaufb (fb0) is primary
device
Aug 30 23:28:31 wedge kernel: [  124.507258] Console: switching to colour frame
buffer device 180x56
Aug 30 23:28:31 wedge kernel: [  124.551887] nouveau 0000:01:00.0: fb0:
nouveaufb frame buffer device
Aug 30 23:28:31 wedge kernel: [  124.551890] nouveau 0000:01:00.0: registered
panic notifier
Aug 30 23:28:31 wedge kernel: [  124.551896] [drm] Initialized nouveau 1.1.2
20120801 for 0000:01:00.0 on minor 0</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1441002792.434eb5bb1.14387--

--===============1580287563==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1580287563==--
