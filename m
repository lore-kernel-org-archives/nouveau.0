From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92863] Complete freeze even with NvGrUseFW=1
Date: Sun, 08 Nov 2015 23:13:30 +0000
Message-ID: <bug-92863-8800-vTH2kTlqyh@http.bugs.freedesktop.org/>
References: <bug-92863-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0179076492=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92863-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0179076492==
Content-Type: multipart/alternative; boundary="1447024410.02DfDd8C1.9256"; charset="UTF-8"


--1447024410.02DfDd8C1.9256
Date: Sun, 8 Nov 2015 23:13:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92863

--- Comment #4 from xenith-bjxz+0elTSj2eFz/2MeuCQ@public.gmane.org ---
[    1.716481] fb: switching to nouveaufb from EFI VGA
[    1.716744] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0e6000a1
[    1.716745] nouveau  [  DEVICE][0000:01:00.0] Chipset: GK106 (NVE6)
[    1.716746] nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
[    1.776515] nouveau  [   VBIOS][0000:01:00.0] using image from PROM
[    1.776601] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    1.776603] nouveau  [   VBIOS][0000:01:00.0] version 80.06.28.00.08
[    1.776851] nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
[    1.776900] nouveau  [     PFB][0000:01:00.0] RAM type: GDDR5
[    1.776901] nouveau  [     PFB][0000:01:00.0] RAM size: 2048 MiB
[    1.776902] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
[    1.778847] nouveau  [    VOLT][0000:01:00.0] GPU voltage: 862500uv
[    1.828519] nouveau  [  PTHERM][0000:01:00.0] FAN control: PWM
[    1.828532] nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
[    1.828555] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[    1.828599] nouveau  [     CLK][0000:01:00.0] 07: core 324 MHz memory 648
MHz 
[    1.828617] nouveau  [     CLK][0000:01:00.0] 0a: core 324-862 MHz memory
1620 MHz 
[    1.828667] nouveau  [     CLK][0000:01:00.0] 0d: core 549-1280 MHz memory
6008 MHz 
[    1.828728] nouveau  [     CLK][0000:01:00.0] 0f: core 549-1280 MHz memory
6008 MHz 
[    1.828796] nouveau  [     CLK][0000:01:00.0] --: core 324 MHz memory 648
MHz 
[    1.950416] nouveau  [     DRM] VRAM: 2048 MiB
[    1.950425] nouveau  [     DRM] GART: 1048576 MiB
[    1.950429] nouveau  [     DRM] TMDS table version 2.0
[    1.950430] nouveau  [     DRM] DCB version 4.0
[    1.950432] nouveau  [     DRM] DCB outp 00: 02000f00 00000000
[    1.950434] nouveau  [     DRM] DCB outp 01: 01000f02 00020030
[    1.950436] nouveau  [     DRM] DCB outp 03: 02011f62 00020010
[    1.950437] nouveau  [     DRM] DCB outp 04: 04822fb6 0f420010
[    1.950438] nouveau  [     DRM] DCB outp 05: 04022f72 00020010
[    1.950440] nouveau  [     DRM] DCB outp 06: 08033f82 00020030
[    1.950441] nouveau  [     DRM] DCB conn 00: 00001030
[    1.950443] nouveau  [     DRM] DCB conn 01: 00010161
[    1.950445] nouveau  [     DRM] DCB conn 02: 00020246
[    1.950446] nouveau  [     DRM] DCB conn 03: 01000331
[    1.957375] nouveau  [     DRM] MM: using COPY for buffer copies
[    2.257255] nouveau  [     DRM] allocated 1920x1080 fb: 0x60000, bo
ffff880408faa000
[    2.257345] fbcon: nouveaufb (fb0) is primary device
[    2.744011] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    2.744012] nouveau 0000:01:00.0: registered panic notifier
[    2.746206] [drm] Initialized nouveau 1.2.2 20120801 for 0000:01:00.0 on
minor 0
[   59.151525] nouveau E[   PFIFO][0000:01:00.0] SCHED_ERROR [ CTXSW_TIMEOUT ]
[   59.151530] nouveau E[   PFIFO][0000:01:00.0] PGRAPH engine fault on channel
7, recovering...

This is stock F23 now, but yesterday I observed the same behavior in new code
with the 4.4 kernel and mesa 11.1.1-dev here:
https://bugs.freedesktop.org/show_bug.cgi?id=72180#c43

I tried various things, including "options nouveau config=War00C800_0=1" and
confirming by observing the workaround output in dmesg. Still crashes.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1447024410.02DfDd8C1.9256
Date: Sun, 8 Nov 2015 23:13:30 +0000
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
   title="NEW - Complete freeze even with NvGrUseFW=1"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92863#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Complete freeze even with NvGrUseFW=1"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92863">bug 92863</a>
              from <span class="vcard"><a class="email" href="mailto:xenith&#64;overtmind.com" title="xenith&#64;overtmind.com">xenith&#64;overtmind.com</a>
</span></b>
        <pre>[    1.716481] fb: switching to nouveaufb from EFI VGA
[    1.716744] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0e6000a1
[    1.716745] nouveau  [  DEVICE][0000:01:00.0] Chipset: GK106 (NVE6)
[    1.716746] nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
[    1.776515] nouveau  [   VBIOS][0000:01:00.0] using image from PROM
[    1.776601] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    1.776603] nouveau  [   VBIOS][0000:01:00.0] version 80.06.28.00.08
[    1.776851] nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
[    1.776900] nouveau  [     PFB][0000:01:00.0] RAM type: GDDR5
[    1.776901] nouveau  [     PFB][0000:01:00.0] RAM size: 2048 MiB
[    1.776902] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
[    1.778847] nouveau  [    VOLT][0000:01:00.0] GPU voltage: 862500uv
[    1.828519] nouveau  [  PTHERM][0000:01:00.0] FAN control: PWM
[    1.828532] nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
[    1.828555] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[    1.828599] nouveau  [     CLK][0000:01:00.0] 07: core 324 MHz memory 648
MHz 
[    1.828617] nouveau  [     CLK][0000:01:00.0] 0a: core 324-862 MHz memory
1620 MHz 
[    1.828667] nouveau  [     CLK][0000:01:00.0] 0d: core 549-1280 MHz memory
6008 MHz 
[    1.828728] nouveau  [     CLK][0000:01:00.0] 0f: core 549-1280 MHz memory
6008 MHz 
[    1.828796] nouveau  [     CLK][0000:01:00.0] --: core 324 MHz memory 648
MHz 
[    1.950416] nouveau  [     DRM] VRAM: 2048 MiB
[    1.950425] nouveau  [     DRM] GART: 1048576 MiB
[    1.950429] nouveau  [     DRM] TMDS table version 2.0
[    1.950430] nouveau  [     DRM] DCB version 4.0
[    1.950432] nouveau  [     DRM] DCB outp 00: 02000f00 00000000
[    1.950434] nouveau  [     DRM] DCB outp 01: 01000f02 00020030
[    1.950436] nouveau  [     DRM] DCB outp 03: 02011f62 00020010
[    1.950437] nouveau  [     DRM] DCB outp 04: 04822fb6 0f420010
[    1.950438] nouveau  [     DRM] DCB outp 05: 04022f72 00020010
[    1.950440] nouveau  [     DRM] DCB outp 06: 08033f82 00020030
[    1.950441] nouveau  [     DRM] DCB conn 00: 00001030
[    1.950443] nouveau  [     DRM] DCB conn 01: 00010161
[    1.950445] nouveau  [     DRM] DCB conn 02: 00020246
[    1.950446] nouveau  [     DRM] DCB conn 03: 01000331
[    1.957375] nouveau  [     DRM] MM: using COPY for buffer copies
[    2.257255] nouveau  [     DRM] allocated 1920x1080 fb: 0x60000, bo
ffff880408faa000
[    2.257345] fbcon: nouveaufb (fb0) is primary device
[    2.744011] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    2.744012] nouveau 0000:01:00.0: registered panic notifier
[    2.746206] [drm] Initialized nouveau 1.2.2 20120801 for 0000:01:00.0 on
minor 0
[   59.151525] nouveau E[   PFIFO][0000:01:00.0] SCHED_ERROR [ CTXSW_TIMEOUT ]
[   59.151530] nouveau E[   PFIFO][0000:01:00.0] PGRAPH engine fault on channel
7, recovering...

This is stock F23 now, but yesterday I observed the same behavior in new code
with the 4.4 kernel and mesa 11.1.1-dev here:
<a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED INVALID - [NVE6] Random GPU Lockups, works with blob PGRAPH fw"
   href="show_bug.cgi?id=72180#c43">https://bugs.freedesktop.org/show_bug.cgi?id=72180#c43</a>

I tried various things, including &quot;options nouveau config=War00C800_0=1&quot; and
confirming by observing the workaround output in dmesg. Still crashes.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1447024410.02DfDd8C1.9256--

--===============0179076492==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0179076492==--
