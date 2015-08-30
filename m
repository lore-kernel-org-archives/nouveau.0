From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91779] Pure EFI: MacBookPro3,
 1 (NV84) fails to load nouveau on linux 4.1 -- Invalid ROM contents
Date: Sun, 30 Aug 2015 06:56:06 +0000
Message-ID: <bug-91779-8800-l6L8U0DuUy@http.bugs.freedesktop.org/>
References: <bug-91779-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0548861841=="
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


--===============0548861841==
Content-Type: multipart/alternative; boundary="1440917766.74aD1.20716"; charset="UTF-8"


--1440917766.74aD1.20716
Date: Sun, 30 Aug 2015 06:56:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91779

--- Comment #9 from Jeremy Huddleston <jeremyhu-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org> ---
BTW, copying /sys/kernel/debug/dri/0/vbios.rom to /lib/firmware when in
BIOS-emulation mode has allowed me to get nouveau loaded when in pure EFI mode
via:

$ sudo modprobe nouveau config=NvBios=vbios.rom

However, there's some really bad screen flicker with the 3.13 kernel from
Ubuntu 14.04.3.  It looks as though the screen is refreshing at about 60Hz and
every other frame is all black (issue doesn't happen in the BIOS-emulation mode
on the same kernel).

I'll give a newer kernel a try.

Here's from the successful load:

Aug 29 23:50:09 wedge kernel: [  366.044062] [drm] hdmi device  not found 1 0 1
Aug 29 23:50:09 wedge kernel: [  366.044343] nouveau  [  DEVICE][0000:01:00.0]
BOOT0  : 0x084700a2
Aug 29 23:50:09 wedge kernel: [  366.044346] nouveau  [  DEVICE][0000:01:00.0]
Chipset: G84 (NV84)
Aug 29 23:50:09 wedge kernel: [  366.044348] nouveau  [  DEVICE][0000:01:00.0]
Family : NV50
Aug 29 23:50:09 wedge kernel: [  366.048106] nouveau  [   VBIOS][0000:01:00.0]
image: vbios.rom
Aug 29 23:50:09 wedge kernel: [  366.048159] nouveau  [   VBIOS][0000:01:00.0]
... appears to be valid
Aug 29 23:50:09 wedge kernel: [  366.048284] nouveau  [   VBIOS][0000:01:00.0]
BIT signature found
Aug 29 23:50:09 wedge kernel: [  366.048287] nouveau  [   VBIOS][0000:01:00.0]
version 60.84.49.03.00
Aug 29 23:50:09 wedge kernel: [  366.068374] nouveau 0000:01:00.0: irq 48 for
MSI/MSI-X
Aug 29 23:50:09 wedge kernel: [  366.068393] nouveau  [     PMC][0000:01:00.0]
MSI interrupts enabled
Aug 29 23:50:09 wedge kernel: [  366.068435] nouveau  [     PFB][0000:01:00.0]
RAM type: GDDR3
Aug 29 23:50:09 wedge kernel: [  366.068438] nouveau  [     PFB][0000:01:00.0]
RAM size: 128 MiB
Aug 29 23:50:09 wedge kernel: [  366.068440] nouveau  [     PFB][0000:01:00.0] 
  ZCOMP: 1892 tags
Aug 29 23:50:09 wedge kernel: [  366.077496] nouveau  [    VOLT][0000:01:00.0]
GPU voltage: 1130000uv
Aug 29 23:50:09 wedge kernel: [  366.101061] nouveau  [  PTHERM][0000:01:00.0]
FAN control: none / external
Aug 29 23:50:09 wedge kernel: [  366.101070] nouveau  [  PTHERM][0000:01:00.0]
fan management: automatic
Aug 29 23:50:09 wedge kernel: [  366.101074] nouveau  [  PTHERM][0000:01:00.0]
internal sensor: yes
Aug 29 23:50:09 wedge kernel: [  366.101082] nouveau  [     CLK][0000:01:00.0]
20: core 169 MHz shader 338 MHz memory 100 MHz
Aug 29 23:50:09 wedge kernel: [  366.101086] nouveau  [     CLK][0000:01:00.0]
21: core 283 MHz shader 566 MHz memory 297 MHz
Aug 29 23:50:09 wedge kernel: [  366.101090] nouveau  [     CLK][0000:01:00.0]
22: core 375 MHz shader 750 MHz memory 502 MHz
Aug 29 23:50:09 wedge kernel: [  366.101093] nouveau  [     CLK][0000:01:00.0]
23: core 470 MHz shader 940 MHz memory 635 MHz
Aug 29 23:50:09 wedge kernel: [  366.101136] nouveau  [     CLK][0000:01:00.0]
--: core 275 MHz shader 550 MHz memory 302 MHz
Aug 29 23:50:09 wedge kernel: [  366.101287] [TTM] Zone  kernel: Available
graphics memory: 2022336 kiB
Aug 29 23:50:09 wedge kernel: [  366.101289] [TTM] Initializing pool allocator
Aug 29 23:50:09 wedge kernel: [  366.101295] [TTM] Initializing DMA pool
allocator
Aug 29 23:50:09 wedge kernel: [  366.101306] nouveau  [     DRM] VRAM: 128 MiB
Aug 29 23:50:09 wedge kernel: [  366.101308] nouveau  [     DRM] GART: 1048576
MiB
Aug 29 23:50:09 wedge kernel: [  366.101312] nouveau  [     DRM] TMDS table
version 2.0
Aug 29 23:50:09 wedge kernel: [  366.101315] nouveau  [     DRM] DCB version
4.0
Aug 29 23:50:09 wedge kernel: [  366.101317] nouveau  [     DRM] DCB outp 00:
01000123 00010034
Aug 29 23:50:09 wedge kernel: [  366.101320] nouveau  [     DRM] DCB outp 01:
02011210 00000028
Aug 29 23:50:09 wedge kernel: [  366.101322] nouveau  [     DRM] DCB outp 02:
02011212 00010030
Aug 29 23:50:09 wedge kernel: [  366.101324] nouveau  [     DRM] DCB outp 03:
01011211 0080c070
Aug 29 23:50:09 wedge kernel: [  366.101327] nouveau  [     DRM] DCB conn 00:
0040
Aug 29 23:50:09 wedge kernel: [  366.101330] nouveau  [     DRM] DCB conn 01:
1120
Aug 29 23:50:09 wedge kernel: [  366.118124] nouveau W[     DRM] unknown
connector type 20
Aug 29 23:50:09 wedge kernel: [  366.118165] nouveau W[     DRM] failed to
create encoder 0/1/0: -19
Aug 29 23:50:09 wedge kernel: [  366.118168] [drm] Supports vblank timestamp
caching Rev 2 (21.10.2013).
Aug 29 23:50:09 wedge kernel: [  366.118169] [drm] No driver support for vblank
timestamp query.
Aug 29 23:50:09 wedge kernel: [  366.135710] nouveau  [     DRM] MM: using
CRYPT for buffer copies
Aug 29 23:50:09 wedge kernel: [  366.186174] nouveau  [     DRM] allocated
1440x900 fb: 0x60000, bo ffff8800368e4c00
Aug 29 23:50:09 wedge kernel: [  366.186291] fbcon: nouveaufb (fb0) is primary
device
Aug 29 23:50:11 wedge kernel: [  367.253708] Console: switching to colour frame
buffer device 180x56
Aug 29 23:50:11 wedge kernel: [  367.255103] nouveau 0000:01:00.0: fb0:
nouveaufb frame buffer device
Aug 29 23:50:11 wedge kernel: [  367.255106] nouveau 0000:01:00.0: registered
panic notifier
Aug 29 23:50:11 wedge kernel: [  367.255112] [drm] Initialized nouveau 1.1.2
20120801 for 0000:01:00.0 on minor 0

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1440917766.74aD1.20716
Date: Sun, 30 Aug 2015 06:56:06 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91779#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Pure EFI: MacBookPro3,1 (NV84) fails to load nouveau on linux 4.1 -- Invalid ROM contents"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91779">bug 91779</a>
              from <span class="vcard"><a class="email" href="mailto:jeremyhu&#64;freedesktop.org" title="Jeremy Huddleston &lt;jeremyhu&#64;freedesktop.org&gt;"> <span class="fn">Jeremy Huddleston</span></a>
</span></b>
        <pre>BTW, copying /sys/kernel/debug/dri/0/vbios.rom to /lib/firmware when in
BIOS-emulation mode has allowed me to get nouveau loaded when in pure EFI mode
via:

$ sudo modprobe nouveau config=NvBios=vbios.rom

However, there's some really bad screen flicker with the 3.13 kernel from
Ubuntu 14.04.3.  It looks as though the screen is refreshing at about 60Hz and
every other frame is all black (issue doesn't happen in the BIOS-emulation mode
on the same kernel).

I'll give a newer kernel a try.

Here's from the successful load:

Aug 29 23:50:09 wedge kernel: [  366.044062] [drm] hdmi device  not found 1 0 1
Aug 29 23:50:09 wedge kernel: [  366.044343] nouveau  [  DEVICE][0000:01:00.0]
BOOT0  : 0x084700a2
Aug 29 23:50:09 wedge kernel: [  366.044346] nouveau  [  DEVICE][0000:01:00.0]
Chipset: G84 (NV84)
Aug 29 23:50:09 wedge kernel: [  366.044348] nouveau  [  DEVICE][0000:01:00.0]
Family : NV50
Aug 29 23:50:09 wedge kernel: [  366.048106] nouveau  [   VBIOS][0000:01:00.0]
image: vbios.rom
Aug 29 23:50:09 wedge kernel: [  366.048159] nouveau  [   VBIOS][0000:01:00.0]
... appears to be valid
Aug 29 23:50:09 wedge kernel: [  366.048284] nouveau  [   VBIOS][0000:01:00.0]
BIT signature found
Aug 29 23:50:09 wedge kernel: [  366.048287] nouveau  [   VBIOS][0000:01:00.0]
version 60.84.49.03.00
Aug 29 23:50:09 wedge kernel: [  366.068374] nouveau 0000:01:00.0: irq 48 for
MSI/MSI-X
Aug 29 23:50:09 wedge kernel: [  366.068393] nouveau  [     PMC][0000:01:00.0]
MSI interrupts enabled
Aug 29 23:50:09 wedge kernel: [  366.068435] nouveau  [     PFB][0000:01:00.0]
RAM type: GDDR3
Aug 29 23:50:09 wedge kernel: [  366.068438] nouveau  [     PFB][0000:01:00.0]
RAM size: 128 MiB
Aug 29 23:50:09 wedge kernel: [  366.068440] nouveau  [     PFB][0000:01:00.0] 
  ZCOMP: 1892 tags
Aug 29 23:50:09 wedge kernel: [  366.077496] nouveau  [    VOLT][0000:01:00.0]
GPU voltage: 1130000uv
Aug 29 23:50:09 wedge kernel: [  366.101061] nouveau  [  PTHERM][0000:01:00.0]
FAN control: none / external
Aug 29 23:50:09 wedge kernel: [  366.101070] nouveau  [  PTHERM][0000:01:00.0]
fan management: automatic
Aug 29 23:50:09 wedge kernel: [  366.101074] nouveau  [  PTHERM][0000:01:00.0]
internal sensor: yes
Aug 29 23:50:09 wedge kernel: [  366.101082] nouveau  [     CLK][0000:01:00.0]
20: core 169 MHz shader 338 MHz memory 100 MHz
Aug 29 23:50:09 wedge kernel: [  366.101086] nouveau  [     CLK][0000:01:00.0]
21: core 283 MHz shader 566 MHz memory 297 MHz
Aug 29 23:50:09 wedge kernel: [  366.101090] nouveau  [     CLK][0000:01:00.0]
22: core 375 MHz shader 750 MHz memory 502 MHz
Aug 29 23:50:09 wedge kernel: [  366.101093] nouveau  [     CLK][0000:01:00.0]
23: core 470 MHz shader 940 MHz memory 635 MHz
Aug 29 23:50:09 wedge kernel: [  366.101136] nouveau  [     CLK][0000:01:00.0]
--: core 275 MHz shader 550 MHz memory 302 MHz
Aug 29 23:50:09 wedge kernel: [  366.101287] [TTM] Zone  kernel: Available
graphics memory: 2022336 kiB
Aug 29 23:50:09 wedge kernel: [  366.101289] [TTM] Initializing pool allocator
Aug 29 23:50:09 wedge kernel: [  366.101295] [TTM] Initializing DMA pool
allocator
Aug 29 23:50:09 wedge kernel: [  366.101306] nouveau  [     DRM] VRAM: 128 MiB
Aug 29 23:50:09 wedge kernel: [  366.101308] nouveau  [     DRM] GART: 1048576
MiB
Aug 29 23:50:09 wedge kernel: [  366.101312] nouveau  [     DRM] TMDS table
version 2.0
Aug 29 23:50:09 wedge kernel: [  366.101315] nouveau  [     DRM] DCB version
4.0
Aug 29 23:50:09 wedge kernel: [  366.101317] nouveau  [     DRM] DCB outp 00:
01000123 00010034
Aug 29 23:50:09 wedge kernel: [  366.101320] nouveau  [     DRM] DCB outp 01:
02011210 00000028
Aug 29 23:50:09 wedge kernel: [  366.101322] nouveau  [     DRM] DCB outp 02:
02011212 00010030
Aug 29 23:50:09 wedge kernel: [  366.101324] nouveau  [     DRM] DCB outp 03:
01011211 0080c070
Aug 29 23:50:09 wedge kernel: [  366.101327] nouveau  [     DRM] DCB conn 00:
0040
Aug 29 23:50:09 wedge kernel: [  366.101330] nouveau  [     DRM] DCB conn 01:
1120
Aug 29 23:50:09 wedge kernel: [  366.118124] nouveau W[     DRM] unknown
connector type 20
Aug 29 23:50:09 wedge kernel: [  366.118165] nouveau W[     DRM] failed to
create encoder 0/1/0: -19
Aug 29 23:50:09 wedge kernel: [  366.118168] [drm] Supports vblank timestamp
caching Rev 2 (21.10.2013).
Aug 29 23:50:09 wedge kernel: [  366.118169] [drm] No driver support for vblank
timestamp query.
Aug 29 23:50:09 wedge kernel: [  366.135710] nouveau  [     DRM] MM: using
CRYPT for buffer copies
Aug 29 23:50:09 wedge kernel: [  366.186174] nouveau  [     DRM] allocated
1440x900 fb: 0x60000, bo ffff8800368e4c00
Aug 29 23:50:09 wedge kernel: [  366.186291] fbcon: nouveaufb (fb0) is primary
device
Aug 29 23:50:11 wedge kernel: [  367.253708] Console: switching to colour frame
buffer device 180x56
Aug 29 23:50:11 wedge kernel: [  367.255103] nouveau 0000:01:00.0: fb0:
nouveaufb frame buffer device
Aug 29 23:50:11 wedge kernel: [  367.255106] nouveau 0000:01:00.0: registered
panic notifier
Aug 29 23:50:11 wedge kernel: [  367.255112] [drm] Initialized nouveau 1.1.2
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

--1440917766.74aD1.20716--

--===============0548861841==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0548861841==--
