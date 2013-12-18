From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58378] [NV86] Distorted graphics on NVIDIA GeForce
 8400M G after upgrade the kernel to 3.7.0 version
Date: Wed, 18 Dec 2013 13:39:51 +0000
Message-ID: <bug-58378-8800-TqzAblItlj@http.bugs.freedesktop.org/>
References: <bug-58378-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0656340995=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58378-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0656340995==
Content-Type: multipart/alternative; boundary="1387373991.F4aCFB5.11866"; charset="us-ascii"


--1387373991.F4aCFB5.11866
Date: Wed, 18 Dec 2013 13:39:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58378

--- Comment #49 from Andreas Loew <awl1-hi6Y0CQ0nG0@public.gmane.org> ---
OK, tired with RHEL 6.5 kernel 2.6.32.431 and the two options:

Command line: ro root=UUID=034d34cd-a464-4ee3-8db9-d6061a318a16 rd_NO_LUKS
LANG=en_US.UTF-8  KEYBOARDTYPE=pc KEYTABLE=de-latin1-nodeadkeys rd_NO_MD
SYSFONT=latarcyrheb-sun16 rd_NO_LVM rd_NO_DM nouveau.perflvl_wr=7777
nouveau.perflvl=1 crashkernel=auto

and saw

nouveau 0000:01:00.0: setting latency timer to 64
nouveau 0000:01:00.0: power state changed by ACPI to D0
nouveau 0000:01:00.0: power state changed by ACPI to D0
nouveau 0000:01:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x086a00a2
nouveau  [  DEVICE][0000:01:00.0] Chipset: G86 (NV86)
nouveau  [  DEVICE][0000:01:00.0] Family : NV50
nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
nouveau  [   VBIOS][0000:01:00.0] BIT signature found
nouveau  [   VBIOS][0000:01:00.0] version 60.86.49.00.27
nouveau  [     PFB][0000:01:00.0] RAM type: DDR2
nouveau  [     PFB][0000:01:00.0] RAM size: 256 MiB
nouveau  [     PFB][0000:01:00.0]    ZCOMP: 646 tags
nouveau  [  PTHERM][0000:01:00.0] FAN control: none / external
nouveau  [  PTHERM][0000:01:00.0] fan management: disabled
nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
nouveau  [  PTHERM][0000:01:00.0] Programmed thresholds [ 90(3), 95(3), 125(5),
125(5) ]
[TTM] Zone  kernel: Available graphics memory: 2963482 kiB
[TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[TTM] Initializing pool allocator
[TTM] Initializing DMA pool allocator
nouveau  [     DRM] VRAM: 256 MiB
nouveau  [     DRM] GART: 512 MiB
nouveau  [     DRM] TMDS table version 2.0
nouveau  [     DRM] DCB version 4.0
nouveau  [     DRM] DCB outp 00: 010003f3 00010035
nouveau  [     DRM] DCB outp 01: 02811300 00000028
nouveau  [     DRM] DCB outp 02: 02822312 00000030
nouveau  [     DRM] DCB outp 03: 01833320 00000028
nouveau  [     DRM] DCB conn 00: 0040
nouveau  [     DRM] DCB conn 01: 0100
nouveau  [     DRM] DCB conn 02: 1255
nouveau  [     DRM] DCB conn 03: 0351
nouveau  [     DRM] BIOS FP mode: 1680x1050 (119880kHz pixel clock)
nouveau E[  PTHERM][0000:01:00.0] unhandled intr 0x000001e1
Slow work thread pool: Starting up
Slow work thread pool: Ready
nouveau W[     DRM] unknown connector type 55
nouveau W[     DRM] unknown connector type 51
[drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[drm] No driver support for vblank timestamp query.
nouveau  [     DRM] ACPI backlight interface available, not registering our own
nouveau  [     DRM] 3 available performance level(s)
nouveau  [     DRM] 0: core 169MHz shader 338MHz memory 100MHz voltage 1150mV
fanspeed 100%
nouveau  [     DRM] 1: core 275MHz shader 550MHz memory 200MHz voltage 1150mV
fanspeed 100%
nouveau  [     DRM] 2: core 400MHz shader 800MHz memory 400MHz voltage 1200mV
fanspeed 100%
nouveau  [     DRM] c: core 275MHz shader 550MHz memory 99MHz voltage 1200mV
nouveau  [     DRM] setting performance level: 1
nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x88888888 FAULT at 0x100844
nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x11111111 FAULT at 0x100764
nouveau  [     DRM] > reclocking took 8299680ns

nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000010 FAULT at 0x10200c
nouveau  [     DRM] MM: using CRYPT for buffer copies
nouveau  [     DRM] allocated 1680x1050 fb: 0x60000, bo ffff8801b3e6d400
fbcon: nouveaufb (fb0) is primary device

So it seems we had some "reclocking" taking place, but also we still have the
errors about "MMIO write" errors, and also the screen is distorted in the exact
same way like before even after just two minutes...

Any comments?

Thanks,
Andreas

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1387373991.F4aCFB5.11866
Date: Wed, 18 Dec 2013 13:39:51 +0000
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
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378#c49">Comment # 49</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378">bug 58378</a>
              from <span class="vcard"><a class="email" href="mailto:awl1&#64;gmx.net" title="Andreas Loew &lt;awl1&#64;gmx.net&gt;"> <span class="fn">Andreas Loew</span></a>
</span></b>
        <pre>OK, tired with RHEL 6.5 kernel 2.6.32.431 and the two options:

Command line: ro root=UUID=034d34cd-a464-4ee3-8db9-d6061a318a16 rd_NO_LUKS
LANG=en_US.UTF-8  KEYBOARDTYPE=pc KEYTABLE=de-latin1-nodeadkeys rd_NO_MD
SYSFONT=latarcyrheb-sun16 rd_NO_LVM rd_NO_DM nouveau.perflvl_wr=7777
nouveau.perflvl=1 crashkernel=auto

and saw

nouveau 0000:01:00.0: setting latency timer to 64
nouveau 0000:01:00.0: power state changed by ACPI to D0
nouveau 0000:01:00.0: power state changed by ACPI to D0
nouveau 0000:01:00.0: PCI INT A -&gt; GSI 16 (level, low) -&gt; IRQ 16
nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x086a00a2
nouveau  [  DEVICE][0000:01:00.0] Chipset: G86 (NV86)
nouveau  [  DEVICE][0000:01:00.0] Family : NV50
nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
nouveau  [   VBIOS][0000:01:00.0] BIT signature found
nouveau  [   VBIOS][0000:01:00.0] version 60.86.49.00.27
nouveau  [     PFB][0000:01:00.0] RAM type: DDR2
nouveau  [     PFB][0000:01:00.0] RAM size: 256 MiB
nouveau  [     PFB][0000:01:00.0]    ZCOMP: 646 tags
nouveau  [  PTHERM][0000:01:00.0] FAN control: none / external
nouveau  [  PTHERM][0000:01:00.0] fan management: disabled
nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
nouveau  [  PTHERM][0000:01:00.0] Programmed thresholds [ 90(3), 95(3), 125(5),
125(5) ]
[TTM] Zone  kernel: Available graphics memory: 2963482 kiB
[TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[TTM] Initializing pool allocator
[TTM] Initializing DMA pool allocator
nouveau  [     DRM] VRAM: 256 MiB
nouveau  [     DRM] GART: 512 MiB
nouveau  [     DRM] TMDS table version 2.0
nouveau  [     DRM] DCB version 4.0
nouveau  [     DRM] DCB outp 00: 010003f3 00010035
nouveau  [     DRM] DCB outp 01: 02811300 00000028
nouveau  [     DRM] DCB outp 02: 02822312 00000030
nouveau  [     DRM] DCB outp 03: 01833320 00000028
nouveau  [     DRM] DCB conn 00: 0040
nouveau  [     DRM] DCB conn 01: 0100
nouveau  [     DRM] DCB conn 02: 1255
nouveau  [     DRM] DCB conn 03: 0351
nouveau  [     DRM] BIOS FP mode: 1680x1050 (119880kHz pixel clock)
nouveau E[  PTHERM][0000:01:00.0] unhandled intr 0x000001e1
Slow work thread pool: Starting up
Slow work thread pool: Ready
nouveau W[     DRM] unknown connector type 55
nouveau W[     DRM] unknown connector type 51
[drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[drm] No driver support for vblank timestamp query.
nouveau  [     DRM] ACPI backlight interface available, not registering our own
nouveau  [     DRM] 3 available performance level(s)
nouveau  [     DRM] 0: core 169MHz shader 338MHz memory 100MHz voltage 1150mV
fanspeed 100%
nouveau  [     DRM] 1: core 275MHz shader 550MHz memory 200MHz voltage 1150mV
fanspeed 100%
nouveau  [     DRM] 2: core 400MHz shader 800MHz memory 400MHz voltage 1200mV
fanspeed 100%
nouveau  [     DRM] c: core 275MHz shader 550MHz memory 99MHz voltage 1200mV
nouveau  [     DRM] setting performance level: 1
nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x88888888 FAULT at 0x100844
nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x11111111 FAULT at 0x100764
nouveau  [     DRM] &gt; reclocking took 8299680ns

nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000010 FAULT at 0x10200c
nouveau  [     DRM] MM: using CRYPT for buffer copies
nouveau  [     DRM] allocated 1680x1050 fb: 0x60000, bo ffff8801b3e6d400
fbcon: nouveaufb (fb0) is primary device

So it seems we had some &quot;reclocking&quot; taking place, but also we still have the
errors about &quot;MMIO write&quot; errors, and also the screen is distorted in the exact
same way like before even after just two minutes...

Any comments?

Thanks,
Andreas</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1387373991.F4aCFB5.11866--

--===============0656340995==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0656340995==--
