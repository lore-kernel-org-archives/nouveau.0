From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67878] [NV98] [BISECTED] Hardware freeze after
 resume from suspend
Date: Tue, 27 May 2014 15:28:34 +0000
Message-ID: <bug-67878-8800-64JV6bvApP@http.bugs.freedesktop.org/>
References: <bug-67878-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1104074558=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67878-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1104074558==
Content-Type: multipart/alternative; boundary="1401204513.673f8D404.31006"; charset="us-ascii"


--1401204513.673f8D404.31006
Date: Tue, 27 May 2014 15:28:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67878

--- Comment #40 from Jochen <jf-Jn17RpidJxba5EbDDlwbIw@public.gmane.org> ---
I hit this bug upon upgrade from Ubuntu 12.04 to 14.04. I can confirm nouveau
is working in Ubuntu kernel 3.7.10 and it freezes on resume in 3.13.0.
My hardware:

02:00.0 VGA compatible controller: NVIDIA Corporation C79 [GeForce 9400M] (rev
b1) (prog-if 00 [VGA controller])
    Subsystem: Apple Inc. MacBook5,1
    Flags: bus master, fast devsel, latency 0, IRQ 16
    Memory at d2000000 (32-bit, non-prefetchable) [size=16M]
    Memory at c0000000 (64-bit, prefetchable) [size=256M]
    Memory at d0000000 (64-bit, prefetchable) [size=32M]
    I/O ports at 1000 [size=128]
    Expansion ROM at d3000000 [disabled] [size=128K]
    Capabilities: [60] Power Management version 2
    Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
    Kernel driver in use: nouveau

[    3.918406] nouveau 0000:02:00.0: setting latency timer to 64
[    3.919370] nouveau  [  DEVICE][0000:02:00.0] BOOT0  : 0x0ac180b1
[    3.919374] nouveau  [  DEVICE][0000:02:00.0] Chipset: MCP79/MCP7A (NVAC)
[    3.919376] nouveau  [  DEVICE][0000:02:00.0] Family : NV50
[    3.930101] nouveau  [   VBIOS][0000:02:00.0] checking PRAMIN for image...
[    3.995688] nouveau  [   VBIOS][0000:02:00.0] ... appears to be valid
[    3.995692] nouveau  [   VBIOS][0000:02:00.0] using image from PRAMIN
[    3.995827] nouveau  [   VBIOS][0000:02:00.0] BIT signature found
[    3.995831] nouveau  [   VBIOS][0000:02:00.0] version 62.79.40.00
[    4.069047] nouveau  [     MXM][0000:02:00.0] no VBIOS data, nothing to do
[    4.147303] nouveau  [     PFB][0000:02:00.0] RAM type: stolen system memory
[    4.147309] nouveau  [     PFB][0000:02:00.0] RAM size: 256 MiB
[    4.938049] nouveau  [     DRM] VRAM: 256 MiB
[    4.938053] nouveau  [     DRM] GART: 512 MiB
[    4.938057] nouveau  [     DRM] BIT BIOS found
[    4.938061] nouveau  [     DRM] Bios version 62.79.40.00
[    4.938065] nouveau  [     DRM] TMDS table version 2.0
[    4.938068] nouveau  [     DRM] DCB version 4.0
[    4.938071] nouveau  [     DRM] DCB outp 00: 01000123 00010014
[    4.938073] nouveau  [     DRM] DCB outp 01: 02021232 00000010
[    4.938076] nouveau  [     DRM] DCB outp 02: 02021286 0f220010
[    4.938078] nouveau  [     DRM] DCB conn 00: 00000040
[    4.938081] nouveau  [     DRM] DCB conn 01: 0000a146
[    6.473715] nouveau  [     DRM] 4 available performance level(s)
[    6.473720] nouveau  [     DRM] 0: core 100MHz shader 200MHz voltage 900mV
fanspeed 100%
[    6.473724] nouveau  [     DRM] 1: core 150MHz shader 300MHz voltage 900mV
fanspeed 100%
[    6.473728] nouveau  [     DRM] 2: core 350MHz shader 800MHz voltage 900mV
fanspeed 100%
[    6.473731] nouveau  [     DRM] 3: core 450MHz shader 1100MHz voltage 1010mV
fanspeed 100%
[    6.473734] nouveau  [     DRM] c:
[    6.498971] nouveau  [     DRM] MM: using M2MF for buffer copies
[    6.593834] nouveau  [     DRM] allocated 1280x800 fb: 0x50000, bo
ffff88013692ac00
[    6.593930] fbcon: nouveaufb (fb0) is primary device
[    6.862546] fb0: nouveaufb frame buffer device
[    6.863165] [drm] Initialized nouveau 1.1.0 20120801 for 0000:02:00.0 on
minor 0

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1401204513.673f8D404.31006
Date: Tue, 27 May 2014 15:28:33 +0000
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
   title="NEW --- - [NV98] [BISECTED] Hardware freeze after resume from suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67878#c40">Comment # 40</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV98] [BISECTED] Hardware freeze after resume from suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67878">bug 67878</a>
              from <span class="vcard"><a class="email" href="mailto:jf&#64;fahrner.name" title="Jochen &lt;jf&#64;fahrner.name&gt;"> <span class="fn">Jochen</span></a>
</span></b>
        <pre>I hit this bug upon upgrade from Ubuntu 12.04 to 14.04. I can confirm nouveau
is working in Ubuntu kernel 3.7.10 and it freezes on resume in 3.13.0.
My hardware:

02:00.0 VGA compatible controller: NVIDIA Corporation C79 [GeForce 9400M] (rev
b1) (prog-if 00 [VGA controller])
    Subsystem: Apple Inc. MacBook5,1
    Flags: bus master, fast devsel, latency 0, IRQ 16
    Memory at d2000000 (32-bit, non-prefetchable) [size=16M]
    Memory at c0000000 (64-bit, prefetchable) [size=256M]
    Memory at d0000000 (64-bit, prefetchable) [size=32M]
    I/O ports at 1000 [size=128]
    Expansion ROM at d3000000 [disabled] [size=128K]
    Capabilities: [60] Power Management version 2
    Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
    Kernel driver in use: nouveau

[    3.918406] nouveau 0000:02:00.0: setting latency timer to 64
[    3.919370] nouveau  [  DEVICE][0000:02:00.0] BOOT0  : 0x0ac180b1
[    3.919374] nouveau  [  DEVICE][0000:02:00.0] Chipset: MCP79/MCP7A (NVAC)
[    3.919376] nouveau  [  DEVICE][0000:02:00.0] Family : NV50
[    3.930101] nouveau  [   VBIOS][0000:02:00.0] checking PRAMIN for image...
[    3.995688] nouveau  [   VBIOS][0000:02:00.0] ... appears to be valid
[    3.995692] nouveau  [   VBIOS][0000:02:00.0] using image from PRAMIN
[    3.995827] nouveau  [   VBIOS][0000:02:00.0] BIT signature found
[    3.995831] nouveau  [   VBIOS][0000:02:00.0] version 62.79.40.00
[    4.069047] nouveau  [     MXM][0000:02:00.0] no VBIOS data, nothing to do
[    4.147303] nouveau  [     PFB][0000:02:00.0] RAM type: stolen system memory
[    4.147309] nouveau  [     PFB][0000:02:00.0] RAM size: 256 MiB
[    4.938049] nouveau  [     DRM] VRAM: 256 MiB
[    4.938053] nouveau  [     DRM] GART: 512 MiB
[    4.938057] nouveau  [     DRM] BIT BIOS found
[    4.938061] nouveau  [     DRM] Bios version 62.79.40.00
[    4.938065] nouveau  [     DRM] TMDS table version 2.0
[    4.938068] nouveau  [     DRM] DCB version 4.0
[    4.938071] nouveau  [     DRM] DCB outp 00: 01000123 00010014
[    4.938073] nouveau  [     DRM] DCB outp 01: 02021232 00000010
[    4.938076] nouveau  [     DRM] DCB outp 02: 02021286 0f220010
[    4.938078] nouveau  [     DRM] DCB conn 00: 00000040
[    4.938081] nouveau  [     DRM] DCB conn 01: 0000a146
[    6.473715] nouveau  [     DRM] 4 available performance level(s)
[    6.473720] nouveau  [     DRM] 0: core 100MHz shader 200MHz voltage 900mV
fanspeed 100%
[    6.473724] nouveau  [     DRM] 1: core 150MHz shader 300MHz voltage 900mV
fanspeed 100%
[    6.473728] nouveau  [     DRM] 2: core 350MHz shader 800MHz voltage 900mV
fanspeed 100%
[    6.473731] nouveau  [     DRM] 3: core 450MHz shader 1100MHz voltage 1010mV
fanspeed 100%
[    6.473734] nouveau  [     DRM] c:
[    6.498971] nouveau  [     DRM] MM: using M2MF for buffer copies
[    6.593834] nouveau  [     DRM] allocated 1280x800 fb: 0x50000, bo
ffff88013692ac00
[    6.593930] fbcon: nouveaufb (fb0) is primary device
[    6.862546] fb0: nouveaufb frame buffer device
[    6.863165] [drm] Initialized nouveau 1.1.0 20120801 for 0000:02:00.0 on
minor 0</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1401204513.673f8D404.31006--

--===============1104074558==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1104074558==--
