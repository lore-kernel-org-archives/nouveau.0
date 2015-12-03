From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70354] [NVE6, NVE7] HUB_INIT timeout on graph init,
 blob fw doesn't help
Date: Thu, 03 Dec 2015 23:08:07 +0000
Message-ID: <bug-70354-8800-vK4SlUfw6e@http.bugs.freedesktop.org/>
References: <bug-70354-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1063989351=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70354-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1063989351==
Content-Type: multipart/alternative; boundary="1449184087.e050fc1.16400"; charset="UTF-8"


--1449184087.e050fc1.16400
Date: Thu, 3 Dec 2015 23:08:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70354

--- Comment #90 from Wouter van Kesteren <woutershep-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hello, i'm not exactly sure if this is the right place but i just tried kernel
4.4.0-rc3.
I wanted to add that on my machine a manual 'c800' workaround was also needed
to make it work.
My laptop is a Clevo barebone with 'Model: W355ST' 'Product code: W355STQ' on
the back and dmidecode gives 'W35xSTQ_370ST'

% dmesg | grep nouveau without 'c800':

nouveau 0000:01:00.0: enabling device (0006 -> 0007)
nouveau 0000:01:00.0: NVIDIA GK106 (0e6220a1)
nouveau 0000:01:00.0: bios: version 80.06.51.00.17
nouveau 0000:01:00.0: fb: 2048 MiB GDDR5
nouveau 0000:01:00.0: bus: MMIO write of 00000004 FAULT at 620018 [ IBUS ]
nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
nouveau 0000:01:00.0: DRM: Pointer to TMDS table invalid
nouveau 0000:01:00.0: DRM: DCB version 4.0
nouveau 0000:01:00.0: DRM: Pointer to flat panel table invalid
nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on minor 1
nouveau 0000:01:00.0: DRM: evicting buffers...
nouveau 0000:01:00.0: DRM: waiting for kernel channels to go idle...
nouveau 0000:01:00.0: DRM: suspending client object trees...
nouveau 0000:01:00.0: DRM: suspending kernel object tree...
nouveau 0000:01:00.0: DRM: resuming kernel object tree...
nouveau 0000:01:00.0: bus: MMIO write of 00000004 FAULT at 620018 [ IBUS ]
nouveau 0000:01:00.0: DRM: resuming client object trees...
nouveau 0000:01:00.0: timeout at
/root/kernel/git/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:1479/gf100_gr_init_ctxctl()!
nouveau 0000:01:00.0: gr: 409000 - done 00000240
nouveau 0000:01:00.0: gr: 409000 - stat 00000000 00000000 00000000 00000000
nouveau 0000:01:00.0: gr: 409000 - stat 00000000 00000000 00000006 00000001
nouveau 0000:01:00.0: gr: 502000 - done 00000340
nouveau 0000:01:00.0: gr: 502000 - stat 80000000 00006500 00000000 00000000
nouveau 0000:01:00.0: gr: 502000 - stat 00000000 00000000 00000002 00000000
nouveau 0000:01:00.0: gr: 50a000 - done 00000300
nouveau 0000:01:00.0: gr: 50a000 - stat 00000000 0000f100 00000000 00000000
nouveau 0000:01:00.0: gr: 50a000 - stat 00000000 00000000 00000000 00000000
nouveau 0000:01:00.0: gr: 512000 - done 00000300
nouveau 0000:01:00.0: gr: 512000 - stat 00000000 00000000 00000000 00000000
nouveau 0000:01:00.0: gr: 512000 - stat 00000000 00000000 00000000 00000000
nouveau 0000:01:00.0: gr: init failed, -16
nouveau 0000:01:00.0: DRM: evicting buffers...
nouveau 0000:01:00.0: DRM: waiting for kernel channels to go idle...

% dmesg | grep nouveau with 'c800':

Command line: initrd=\efi\exherbo\initramfs.cpio.xz
nouveau.config=War00C800_0=1
nouveau 0000:01:00.0: enabling device (0006 -> 0007)
nouveau 0000:01:00.0: NVIDIA GK106 (0e6220a1)
nouveau 0000:01:00.0: bios: version 80.06.51.00.17
nouveau 0000:01:00.0: fb: 2048 MiB GDDR5
nouveau 0000:01:00.0: bus: MMIO write of 00000004 FAULT at 620018 [ IBUS ]
nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
nouveau 0000:01:00.0: DRM: Pointer to TMDS table invalid
nouveau 0000:01:00.0: DRM: DCB version 4.0
nouveau 0000:01:00.0: DRM: Pointer to flat panel table invalid
nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on minor 1
nouveau 0000:01:00.0: DRM: evicting buffers...
nouveau 0000:01:00.0: DRM: waiting for kernel channels to go idle...
nouveau 0000:01:00.0: DRM: suspending client object trees...
nouveau 0000:01:00.0: DRM: suspending kernel object tree...
nouveau 0000:01:00.0: DRM: resuming kernel object tree...
nouveau 0000:01:00.0: bus: MMIO write of 00000004 FAULT at 620018 [ IBUS ]
nouveau 0000:01:00.0: DRM: resuming client object trees...
nouveau 0000:01:00.0: pmu: hw bug workaround enabled
nouveau 0000:01:00.0: pmu: hw bug workaround enabled
nouveau 0000:01:00.0: DRM: evicting buffers...
nouveau 0000:01:00.0: DRM: waiting for kernel channels to go idle...
nouveau 0000:01:00.0: DRM: suspending client object trees...
nouveau 0000:01:00.0: DRM: suspending kernel object tree...

% lspci -nnv

01:00.0 3D controller [0302]: NVIDIA Corporation GK106M [GeForce GTX 765M]
[10de:11e2] (rev a1)
    Subsystem: CLEVO/KAPOK Computer GK106M [GeForce GTX 765M] [1558:3537]
    Flags: bus master, fast devsel, latency 0, IRQ 26
    Memory at f6000000 (32-bit, non-prefetchable) [size=16M]
    Memory at e0000000 (64-bit, prefetchable) [size=256M]
    Memory at f0000000 (64-bit, prefetchable) [size=32M]
    I/O ports at e000 [size=128]
    Expansion ROM at f7000000 [disabled] [size=512K]
    Capabilities: [60] Power Management version 3
    Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
    Capabilities: [78] Express Endpoint, MSI 00
    Capabilities: [b4] Vendor Specific Information: Len=14 <?>
    Capabilities: [100] Virtual Channel
    Capabilities: [128] Power Budgeting <?>
    Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024 <?>
    Capabilities: [900] #19
    Kernel driver in use: nouveau

I think this should be enough info to put the workaround in the kernel right?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1449184087.e050fc1.16400
Date: Thu, 3 Dec 2015 23:08:07 +0000
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
   title="NEW - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn't help"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354#c90">Comment # 90</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn't help"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354">bug 70354</a>
              from <span class="vcard"><a class="email" href="mailto:woutershep&#64;gmail.com" title="Wouter van Kesteren &lt;woutershep&#64;gmail.com&gt;"> <span class="fn">Wouter van Kesteren</span></a>
</span></b>
        <pre>Hello, i'm not exactly sure if this is the right place but i just tried kernel
4.4.0-rc3.
I wanted to add that on my machine a manual 'c800' workaround was also needed
to make it work.
My laptop is a Clevo barebone with 'Model: W355ST' 'Product code: W355STQ' on
the back and dmidecode gives 'W35xSTQ_370ST'

% dmesg | grep nouveau without 'c800':

nouveau 0000:01:00.0: enabling device (0006 -&gt; 0007)
nouveau 0000:01:00.0: NVIDIA GK106 (0e6220a1)
nouveau 0000:01:00.0: bios: version 80.06.51.00.17
nouveau 0000:01:00.0: fb: 2048 MiB GDDR5
nouveau 0000:01:00.0: bus: MMIO write of 00000004 FAULT at 620018 [ IBUS ]
nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
nouveau 0000:01:00.0: DRM: Pointer to TMDS table invalid
nouveau 0000:01:00.0: DRM: DCB version 4.0
nouveau 0000:01:00.0: DRM: Pointer to flat panel table invalid
nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on minor 1
nouveau 0000:01:00.0: DRM: evicting buffers...
nouveau 0000:01:00.0: DRM: waiting for kernel channels to go idle...
nouveau 0000:01:00.0: DRM: suspending client object trees...
nouveau 0000:01:00.0: DRM: suspending kernel object tree...
nouveau 0000:01:00.0: DRM: resuming kernel object tree...
nouveau 0000:01:00.0: bus: MMIO write of 00000004 FAULT at 620018 [ IBUS ]
nouveau 0000:01:00.0: DRM: resuming client object trees...
nouveau 0000:01:00.0: timeout at
/root/kernel/git/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:1479/gf100_gr_init_ctxctl()!
nouveau 0000:01:00.0: gr: 409000 - done 00000240
nouveau 0000:01:00.0: gr: 409000 - stat 00000000 00000000 00000000 00000000
nouveau 0000:01:00.0: gr: 409000 - stat 00000000 00000000 00000006 00000001
nouveau 0000:01:00.0: gr: 502000 - done 00000340
nouveau 0000:01:00.0: gr: 502000 - stat 80000000 00006500 00000000 00000000
nouveau 0000:01:00.0: gr: 502000 - stat 00000000 00000000 00000002 00000000
nouveau 0000:01:00.0: gr: 50a000 - done 00000300
nouveau 0000:01:00.0: gr: 50a000 - stat 00000000 0000f100 00000000 00000000
nouveau 0000:01:00.0: gr: 50a000 - stat 00000000 00000000 00000000 00000000
nouveau 0000:01:00.0: gr: 512000 - done 00000300
nouveau 0000:01:00.0: gr: 512000 - stat 00000000 00000000 00000000 00000000
nouveau 0000:01:00.0: gr: 512000 - stat 00000000 00000000 00000000 00000000
nouveau 0000:01:00.0: gr: init failed, -16
nouveau 0000:01:00.0: DRM: evicting buffers...
nouveau 0000:01:00.0: DRM: waiting for kernel channels to go idle...

% dmesg | grep nouveau with 'c800':

Command line: initrd=\efi\exherbo\initramfs.cpio.xz
nouveau.config=War00C800_0=1
nouveau 0000:01:00.0: enabling device (0006 -&gt; 0007)
nouveau 0000:01:00.0: NVIDIA GK106 (0e6220a1)
nouveau 0000:01:00.0: bios: version 80.06.51.00.17
nouveau 0000:01:00.0: fb: 2048 MiB GDDR5
nouveau 0000:01:00.0: bus: MMIO write of 00000004 FAULT at 620018 [ IBUS ]
nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
nouveau 0000:01:00.0: DRM: Pointer to TMDS table invalid
nouveau 0000:01:00.0: DRM: DCB version 4.0
nouveau 0000:01:00.0: DRM: Pointer to flat panel table invalid
nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on minor 1
nouveau 0000:01:00.0: DRM: evicting buffers...
nouveau 0000:01:00.0: DRM: waiting for kernel channels to go idle...
nouveau 0000:01:00.0: DRM: suspending client object trees...
nouveau 0000:01:00.0: DRM: suspending kernel object tree...
nouveau 0000:01:00.0: DRM: resuming kernel object tree...
nouveau 0000:01:00.0: bus: MMIO write of 00000004 FAULT at 620018 [ IBUS ]
nouveau 0000:01:00.0: DRM: resuming client object trees...
nouveau 0000:01:00.0: pmu: hw bug workaround enabled
nouveau 0000:01:00.0: pmu: hw bug workaround enabled
nouveau 0000:01:00.0: DRM: evicting buffers...
nouveau 0000:01:00.0: DRM: waiting for kernel channels to go idle...
nouveau 0000:01:00.0: DRM: suspending client object trees...
nouveau 0000:01:00.0: DRM: suspending kernel object tree...

% lspci -nnv

01:00.0 3D controller [0302]: NVIDIA Corporation GK106M [GeForce GTX 765M]
[10de:11e2] (rev a1)
    Subsystem: CLEVO/KAPOK Computer GK106M [GeForce GTX 765M] [1558:3537]
    Flags: bus master, fast devsel, latency 0, IRQ 26
    Memory at f6000000 (32-bit, non-prefetchable) [size=16M]
    Memory at e0000000 (64-bit, prefetchable) [size=256M]
    Memory at f0000000 (64-bit, prefetchable) [size=32M]
    I/O ports at e000 [size=128]
    Expansion ROM at f7000000 [disabled] [size=512K]
    Capabilities: [60] Power Management version 3
    Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
    Capabilities: [78] Express Endpoint, MSI 00
    Capabilities: [b4] Vendor Specific Information: Len=14 &lt;?&gt;
    Capabilities: [100] Virtual Channel
    Capabilities: [128] Power Budgeting &lt;?&gt;
    Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024 &lt;?&gt;
    Capabilities: [900] #19
    Kernel driver in use: nouveau

I think this should be enough info to put the workaround in the kernel right?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1449184087.e050fc1.16400--

--===============1063989351==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1063989351==--
