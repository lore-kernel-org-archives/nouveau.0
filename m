From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98582] nouveau on a GM108 fails to resume properly
 from suspension
Date: Thu, 05 Oct 2017 12:57:00 +0000
Message-ID: <bug-98582-8800-W3YvBgNWuT@http.bugs.freedesktop.org/>
References: <bug-98582-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1062378200=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98582-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1062378200==
Content-Type: multipart/alternative; boundary="15072082200.b57dF8f.15085";
 charset="UTF-8"


--15072082200.b57dF8f.15085
Date: Thu, 5 Oct 2017 12:57:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98582

--- Comment #14 from hoboprimate-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Might be usefull to put here a snippet of the boot for the last months kern=
el
versions:

nouveau 0000:03:00.0: bus: MMIO read of 00000000 FAULT at 612004 [ IBUS ]
nouveau 0000:03:00.0: bus: MMIO read of 00000000 FAULT at 10ac08 [ IBUS ]
usb 2-5: New USB device found, idVendor=3D04ca, idProduct=3D300b
usb 2-5: New USB device strings: Mfr=3D0, Product=3D0, SerialNumber=3D0
fbcon: inteldrmfb (fb0) is primary device
clocksource: Switched to clocksource tsc
vga_switcheroo: enabled
[TTM] Zone  kernel: Available graphics memory: 3014696 kiB
[TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[TTM] Initializing pool allocator
[TTM] Initializing DMA pool allocator
nouveau 0000:03:00.0: DRM: VRAM: 2048 MiB
nouveau 0000:03:00.0: DRM: GART: 1048576 MiB
nouveau 0000:03:00.0: DRM: Pointer to TMDS table invalid
nouveau 0000:03:00.0: DRM: DCB version 4.0
nouveau 0000:03:00.0: DRM: Pointer to flat panel table invalid
nouveau 0000:03:00.0: DRM: MM: using COPY for buffer copies
[drm] Initialized nouveau 1.3.1 20120801 for 0000:03:00.0 on minor 1
Console: switching to colour frame buffer device 170x48
i915 0000:00:02.0: fb0: inteldrmfb frame buffer device
[drm:intel_set_cpu_fifo_underrun_reporting [i915]] *ERROR* uncleared fifo
underrun on pipe
[drm:intel_cpu_fifo_underrun_irq_handler [i915]] *ERROR* CPU pipe A FIFO
underrun

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15072082200.b57dF8f.15085
Date: Thu, 5 Oct 2017 12:57:00 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - nouveau on a GM108 fails to resume properly from sus=
pension"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98582#c14">Commen=
t # 14</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - nouveau on a GM108 fails to resume properly from sus=
pension"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98582">bug 98582<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
hoboprimate&#64;gmail.com" title=3D"hoboprimate&#64;gmail.com">hoboprimate&=
#64;gmail.com</a>
</span></b>
        <pre>Might be usefull to put here a snippet of the boot for the las=
t months kernel
versions:

nouveau 0000:03:00.0: bus: MMIO read of 00000000 FAULT at 612004 [ IBUS ]
nouveau 0000:03:00.0: bus: MMIO read of 00000000 FAULT at 10ac08 [ IBUS ]
usb 2-5: New USB device found, idVendor=3D04ca, idProduct=3D300b
usb 2-5: New USB device strings: Mfr=3D0, Product=3D0, SerialNumber=3D0
fbcon: inteldrmfb (fb0) is primary device
clocksource: Switched to clocksource tsc
vga_switcheroo: enabled
[TTM] Zone  kernel: Available graphics memory: 3014696 kiB
[TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[TTM] Initializing pool allocator
[TTM] Initializing DMA pool allocator
nouveau 0000:03:00.0: DRM: VRAM: 2048 MiB
nouveau 0000:03:00.0: DRM: GART: 1048576 MiB
nouveau 0000:03:00.0: DRM: Pointer to TMDS table invalid
nouveau 0000:03:00.0: DRM: DCB version 4.0
nouveau 0000:03:00.0: DRM: Pointer to flat panel table invalid
nouveau 0000:03:00.0: DRM: MM: using COPY for buffer copies
[drm] Initialized nouveau 1.3.1 20120801 for 0000:03:00.0 on minor 1
Console: switching to colour frame buffer device 170x48
i915 0000:00:02.0: fb0: inteldrmfb frame buffer device
[drm:intel_set_cpu_fifo_underrun_reporting [i915]] *ERROR* uncleared fifo
underrun on pipe
[drm:intel_cpu_fifo_underrun_irq_handler [i915]] *ERROR* CPU pipe A FIFO
underrun</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15072082200.b57dF8f.15085--

--===============1062378200==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1062378200==--
