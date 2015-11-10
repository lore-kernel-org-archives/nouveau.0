From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92863] Complete freeze even with NvGrUseFW=1
Date: Tue, 10 Nov 2015 21:47:49 +0000
Message-ID: <bug-92863-8800-v6MdaSkCnd@http.bugs.freedesktop.org/>
References: <bug-92863-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0671841974=="
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


--===============0671841974==
Content-Type: multipart/alternative; boundary="1447192069.ecC85A1.6719"; charset="UTF-8"


--1447192069.ecC85A1.6719
Date: Tue, 10 Nov 2015 21:47:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92863

--- Comment #10 from xenith-bjxz+0elTSj2eFz/2MeuCQ@public.gmane.org ---
[    2.087715] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0e6000a1
[    2.087716] nouveau  [  DEVICE][0000:01:00.0] Chipset: GK106 (NVE6)
[    2.087717] nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
[    2.147941] nouveau  [   VBIOS][0000:01:00.0] using image from PROM
[    2.148026] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    2.148028] nouveau  [   VBIOS][0000:01:00.0] version 80.06.28.00.08
[    2.148267] nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
[    2.148309] nouveau  [     PFB][0000:01:00.0] RAM type: GDDR5
[    2.148310] nouveau  [     PFB][0000:01:00.0] RAM size: 2048 MiB
[    2.148311] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
[    2.150251] nouveau  [    VOLT][0000:01:00.0] GPU voltage: 862500uv
[    2.199717] nouveau  [  PTHERM][0000:01:00.0] FAN control: PWM
[    2.199730] nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
[    2.199747] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[    2.199799] nouveau  [     CLK][0000:01:00.0] 07: core 324 MHz memory 648
MHz 
[    2.199817] nouveau  [     CLK][0000:01:00.0] 0a: core 324-862 MHz memory
1620 MHz 
[    2.199867] nouveau  [     CLK][0000:01:00.0] 0d: core 549-1280 MHz memory
6008 MHz 
[    2.199927] nouveau  [     CLK][0000:01:00.0] 0f: core 549-1280 MHz memory
6008 MHz 
[    2.199996] nouveau  [     CLK][0000:01:00.0] --: core 324 MHz memory 648
MHz 
[    2.321325] nouveau  [  PGRAPH][0000:01:00.0] using external firmware
[    2.321845] nouveau  [     DRM] VRAM: 2048 MiB
[    2.321847] nouveau  [     DRM] GART: 1048576 MiB
[    2.321852] nouveau  [     DRM] TMDS table version 2.0
[    2.321854] nouveau  [     DRM] DCB version 4.0
[    2.321857] nouveau  [     DRM] DCB outp 00: 02000f00 00000000
[    2.321860] nouveau  [     DRM] DCB outp 01: 01000f02 00020030
[    2.321862] nouveau  [     DRM] DCB outp 03: 02011f62 00020010
[    2.321864] nouveau  [     DRM] DCB outp 04: 04822fb6 0f420010
[    2.321866] nouveau  [     DRM] DCB outp 05: 04022f72 00020010
[    2.321868] nouveau  [     DRM] DCB outp 06: 08033f82 00020030
[    2.321870] nouveau  [     DRM] DCB conn 00: 00001030
[    2.321873] nouveau  [     DRM] DCB conn 01: 00010161
[    2.321875] nouveau  [     DRM] DCB conn 02: 00020246
[    2.321877] nouveau  [     DRM] DCB conn 03: 01000331
[    2.331934] nouveau  [     DRM] MM: using COPY for buffer copies
[    2.618631] nouveau  [     DRM] allocated 1920x1080 fb: 0x60000, bo
ffff880408cea000
[    2.618767] fbcon: nouveaufb (fb0) is primary device
[    3.105431] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    3.105431] nouveau 0000:01:00.0: registered panic notifier
[    3.117562] [drm] Initialized nouveau 1.2.2 20120801 for 0000:01:00.0 on
minor 0
[ 4940.515646] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: SIGNATURE
[ 4940.515652] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 16 [dolphin[8564]]
subc 7 mthd 0x1808 data 0x0017180a
[ 4940.515668] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: SIGNATURE
[ 4940.515670] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 16 [dolphin[8564]]
subc 7 mthd 0x1808 data 0x0017180a
[ 4940.515682] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: GPPTR PBENTRY
SIGNATURE
[ 4940.515684] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 16 [dolphin[8564]]
subc 7 mthd 0x1808 data 0x0017180a
[ 4940.515695] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: GPPTR PBENTRY
SIGNATURE
[ 4940.515697] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 16 [dolphin[8564]]
subc 7 mthd 0x1808 data 0x0017180a
[ 4940.515709] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: GPPTR PBENTRY
SIGNATURE
[ 4940.515710] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 16 [dolphin[8564]]
subc 7 mthd 0x1808 data 0x0017180a
[ 4940.515723] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: GPPTR SIGNATURE
[ 4940.515725] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 16 [dolphin[8564]]
subc 7 mthd 0x1808 data 0x0017180a
[ 4940.515727] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: HCE_RE_ILLEGAL_OP
[ 4940.515730] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 16 00001808
0017180a
[ 4940.515739] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: SIGNATURE
[ 4940.515741] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 16 [dolphin[8564]]
subc 7 mthd 0x1808 data 0x0017180a
[ 4940.515753] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: SIGNATURE
[ 4940.515754] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 16 [dolphin[8564]]
subc 7 mthd 0x1808 data 0x0017180a
[ 4940.515772] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: SIGNATURE
[ 4940.515774] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 16 [dolphin[8564]]
subc 7 mthd 0x1808 data 0x0017180a
[ 4940.515785] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: SIGNATURE
[ 4940.515787] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 16 [dolphin[8564]]
subc 7 mthd 0x1808 data 0x0017180a
[ 4940.515800] nouveau E[   PFIFO][0000:01:00.0] read fault at 0x02000f1000
[VA_LIMIT_VIOLATION] from PBDMA0/HOST on channel 0x023eec4000 [unknown]

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1447192069.ecC85A1.6719
Date: Tue, 10 Nov 2015 21:47:49 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92863#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Complete freeze even with NvGrUseFW=1"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92863">bug 92863</a>
              from <span class="vcard"><a class="email" href="mailto:xenith&#64;overtmind.com" title="xenith&#64;overtmind.com">xenith&#64;overtmind.com</a>
</span></b>
        <pre>[    2.087715] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0e6000a1
[    2.087716] nouveau  [  DEVICE][0000:01:00.0] Chipset: GK106 (NVE6)
[    2.087717] nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
[    2.147941] nouveau  [   VBIOS][0000:01:00.0] using image from PROM
[    2.148026] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    2.148028] nouveau  [   VBIOS][0000:01:00.0] version 80.06.28.00.08
[    2.148267] nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
[    2.148309] nouveau  [     PFB][0000:01:00.0] RAM type: GDDR5
[    2.148310] nouveau  [     PFB][0000:01:00.0] RAM size: 2048 MiB
[    2.148311] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
[    2.150251] nouveau  [    VOLT][0000:01:00.0] GPU voltage: 862500uv
[    2.199717] nouveau  [  PTHERM][0000:01:00.0] FAN control: PWM
[    2.199730] nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
[    2.199747] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[    2.199799] nouveau  [     CLK][0000:01:00.0] 07: core 324 MHz memory 648
MHz 
[    2.199817] nouveau  [     CLK][0000:01:00.0] 0a: core 324-862 MHz memory
1620 MHz 
[    2.199867] nouveau  [     CLK][0000:01:00.0] 0d: core 549-1280 MHz memory
6008 MHz 
[    2.199927] nouveau  [     CLK][0000:01:00.0] 0f: core 549-1280 MHz memory
6008 MHz 
[    2.199996] nouveau  [     CLK][0000:01:00.0] --: core 324 MHz memory 648
MHz 
[    2.321325] nouveau  [  PGRAPH][0000:01:00.0] using external firmware
[    2.321845] nouveau  [     DRM] VRAM: 2048 MiB
[    2.321847] nouveau  [     DRM] GART: 1048576 MiB
[    2.321852] nouveau  [     DRM] TMDS table version 2.0
[    2.321854] nouveau  [     DRM] DCB version 4.0
[    2.321857] nouveau  [     DRM] DCB outp 00: 02000f00 00000000
[    2.321860] nouveau  [     DRM] DCB outp 01: 01000f02 00020030
[    2.321862] nouveau  [     DRM] DCB outp 03: 02011f62 00020010
[    2.321864] nouveau  [     DRM] DCB outp 04: 04822fb6 0f420010
[    2.321866] nouveau  [     DRM] DCB outp 05: 04022f72 00020010
[    2.321868] nouveau  [     DRM] DCB outp 06: 08033f82 00020030
[    2.321870] nouveau  [     DRM] DCB conn 00: 00001030
[    2.321873] nouveau  [     DRM] DCB conn 01: 00010161
[    2.321875] nouveau  [     DRM] DCB conn 02: 00020246
[    2.321877] nouveau  [     DRM] DCB conn 03: 01000331
[    2.331934] nouveau  [     DRM] MM: using COPY for buffer copies
[    2.618631] nouveau  [     DRM] allocated 1920x1080 fb: 0x60000, bo
ffff880408cea000
[    2.618767] fbcon: nouveaufb (fb0) is primary device
[    3.105431] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    3.105431] nouveau 0000:01:00.0: registered panic notifier
[    3.117562] [drm] Initialized nouveau 1.2.2 20120801 for 0000:01:00.0 on
minor 0
[ 4940.515646] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: SIGNATURE
[ 4940.515652] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 16 [dolphin[8564]]
subc 7 mthd 0x1808 data 0x0017180a
[ 4940.515668] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: SIGNATURE
[ 4940.515670] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 16 [dolphin[8564]]
subc 7 mthd 0x1808 data 0x0017180a
[ 4940.515682] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: GPPTR PBENTRY
SIGNATURE
[ 4940.515684] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 16 [dolphin[8564]]
subc 7 mthd 0x1808 data 0x0017180a
[ 4940.515695] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: GPPTR PBENTRY
SIGNATURE
[ 4940.515697] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 16 [dolphin[8564]]
subc 7 mthd 0x1808 data 0x0017180a
[ 4940.515709] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: GPPTR PBENTRY
SIGNATURE
[ 4940.515710] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 16 [dolphin[8564]]
subc 7 mthd 0x1808 data 0x0017180a
[ 4940.515723] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: GPPTR SIGNATURE
[ 4940.515725] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 16 [dolphin[8564]]
subc 7 mthd 0x1808 data 0x0017180a
[ 4940.515727] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: HCE_RE_ILLEGAL_OP
[ 4940.515730] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 16 00001808
0017180a
[ 4940.515739] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: SIGNATURE
[ 4940.515741] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 16 [dolphin[8564]]
subc 7 mthd 0x1808 data 0x0017180a
[ 4940.515753] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: SIGNATURE
[ 4940.515754] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 16 [dolphin[8564]]
subc 7 mthd 0x1808 data 0x0017180a
[ 4940.515772] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: SIGNATURE
[ 4940.515774] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 16 [dolphin[8564]]
subc 7 mthd 0x1808 data 0x0017180a
[ 4940.515785] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: SIGNATURE
[ 4940.515787] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 16 [dolphin[8564]]
subc 7 mthd 0x1808 data 0x0017180a
[ 4940.515800] nouveau E[   PFIFO][0000:01:00.0] read fault at 0x02000f1000
[VA_LIMIT_VIOLATION] from PBDMA0/HOST on channel 0x023eec4000 [unknown]</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1447192069.ecC85A1.6719--

--===============0671841974==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0671841974==--
