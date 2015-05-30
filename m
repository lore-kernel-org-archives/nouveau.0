From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82714] [G84] nouveau fails to properly initialize GPU
Date: Sat, 30 May 2015 16:36:35 +0000
Message-ID: <bug-82714-8800-qvihMF9wmQ@http.bugs.freedesktop.org/>
References: <bug-82714-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1132054999=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-82714-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1132054999==
Content-Type: multipart/alternative; boundary="1433003795.5f4C2fa2.11529"; charset="UTF-8"


--1433003795.5f4C2fa2.11529
Date: Sat, 30 May 2015 16:36:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=82714

--- Comment #15 from Bruno <bonbons-lhzhVDjRGQBulxpn9UvDqw@public.gmane.org> ---
Created attachment 116181
  --> https://bugs.freedesktop.org/attachment.cgi?id=116181&action=edit
linux-4.0, + modprobe nouveau debug=debug runpm=0

(In reply to Pierre Moreau from comment #14)
> Could you please run `nvapeek 8841c` and post the result here please?

./envytools/nva/nvapeek 8841c
0008841c: 00000400

> If you get a non-zero value v, write value = (v & 0xffffff00) to 8841c using
> `nvapoke 8841c value` **before** loading Nouveau. nvapeek and nvapoke are
> found in the envytools repo: https://github.com/envytools/envytools

modprobe nouveau
[  747.279238] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x084000a2
[  747.279252] nouveau  [  DEVICE][0000:01:00.0] Chipset: G84 (NV84)
[  747.279257] nouveau  [  DEVICE][0000:01:00.0] Family : NV50
[  747.379554] nouveau  [   VBIOS][0000:01:00.0] using image from PROM
[  747.379705] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[  747.379710] nouveau  [   VBIOS][0000:01:00.0] version 60.84.32.00.00
[  747.381119] nouveau  [ DEVINIT][0000:01:00.0] adaptor not initialised
[  747.381140] nouveau  [   VBIOS][0000:01:00.0] running init tables
[  747.442531] nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
[  747.442593] nouveau  [     PFB][0000:01:00.0] RAM type: GDDR3
[  747.442597] nouveau  [     PFB][0000:01:00.0] RAM size: 512 MiB
[  747.442601] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 1892 tags
[  747.445672] nouveau  [    VOLT][0000:01:00.0] GPU voltage: 1300000uv
[  747.474545] nouveau  [  PTHERM][0000:01:00.0] FAN control: PWM
[  747.474597] nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
[  747.474644] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[  747.494680] nouveau  [     CLK][0000:01:00.0] 20: core 675 MHz shader 1450
MHz memory 1008 MHz
[  747.494743] nouveau  [     CLK][0000:01:00.0] --: core 675 MHz shader 1458
MHz memory 900 MHz
[  747.495846] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT
at 0x103d94
[  747.496017] nouveau  [     DRM] VRAM: 512 MiB
[  747.496049] nouveau  [     DRM] GART: 1048576 MiB
[  747.496067] nouveau  [     DRM] TMDS table version 2.0
[  747.496079] nouveau  [     DRM] DCB version 4.0
[  747.496096] nouveau  [     DRM] DCB outp 00: 01000302 00020030
[  747.496124] nouveau  [     DRM] DCB outp 01: 02000300 00000028
[  747.496138] nouveau  [     DRM] DCB outp 02: 04012310 00000028
[  747.496150] nouveau  [     DRM] DCB outp 03: 02021322 00020010
[  747.496161] nouveau  [     DRM] DCB conn 00: 1030
[  747.496184] nouveau  [     DRM] DCB conn 01: 2161
[  747.496202] nouveau  [     DRM] DCB conn 02: 0200
[  747.496218] nouveau  [     DRM] DCB conn 03: 0362
[  747.525704] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[  747.525721] [drm] Driver supports precise vblank timestamp query.
[  747.973933] Clocksource tsc unstable (delta = -209664716 ns)
[  749.145223] nouveau W[   PFIFO][0000:01:00.0] unknown intr 0x00200000
[  749.145653] nouveau  [     DRM] MM: using CRYPT for buffer copies
[  749.145754] Switched to clocksource hpet
[  750.783934] nouveau  [     DRM] allocated 1280x1024 fb: 0x70000, bo
ffff8800beb1b538
[  750.784312] nouveau 0000:01:00.0: fb1: nouveaufb frame buffer device
[  750.784344] [drm] Initialized nouveau 1.2.1 20120801 for 0000:01:00.0 on
minor 1

After this X11 gets stuck in runtime-PM:
[<ffffffff8158358c>] rpm_resume+0x18c/0x5c0
[<ffffffff81583a08>] __pm_runtime_resume+0x48/0x70
[<ffffffffa0090d63>] nouveau_drm_open+0x43/0x220 [nouveau]
[<ffffffff814512cd>] drm_open+0x1ad/0x4b0
[<ffffffff81457811>] drm_stub_open+0xb1/0x130
[<ffffffff811cb4a1>] chrdev_open+0xb1/0x190
[<ffffffff811c4751>] do_dentry_open.isra.19+0x101/0x330
[<ffffffff811c49f1>] vfs_open+0x41/0x50
[<ffffffff811d462b>] do_last.isra.56+0x25b/0xf20
[<ffffffff811d5379>] path_openat+0x89/0x5a0
[<ffffffff811d6c0e>] do_filp_open+0x3e/0xa0
[<ffffffff811c5f4e>] do_sys_open+0x12e/0x230
[<ffffffff811c6069>] SyS_open+0x19/0x20
[<ffffffff81879a72>] system_call_fastpath+0x12/0x17
[<ffffffffffffffff>] 0xffffffffffffffff

With runpm=0 things behave somewhat better (display lights up - tested on DVI
output where earlier tests were with VGA).

Though once X has started system gets sluggish (periods of "freeze" and
continue) until it fully freezes.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1433003795.5f4C2fa2.11529
Date: Sat, 30 May 2015 16:36:35 +0000
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
          bz_status_ASSIGNED "
   title="ASSIGNED - [G84] nouveau fails to properly initialize GPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82714#c15">Comment # 15</a>
              on <a class="bz_bug_link 
          bz_status_ASSIGNED "
   title="ASSIGNED - [G84] nouveau fails to properly initialize GPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82714">bug 82714</a>
              from <span class="vcard"><a class="email" href="mailto:bonbons&#64;sysophe.eu" title="Bruno &lt;bonbons&#64;sysophe.eu&gt;"> <span class="fn">Bruno</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=116181" name="attach_116181" title="linux-4.0, + modprobe nouveau debug=debug runpm=0">attachment 116181</a> <a href="attachment.cgi?id=116181&amp;action=edit" title="linux-4.0, + modprobe nouveau debug=debug runpm=0">[details]</a></span>
linux-4.0, + modprobe nouveau debug=debug runpm=0

(In reply to Pierre Moreau from <a href="show_bug.cgi?id=82714#c14">comment #14</a>)
<span class="quote">&gt; Could you please run `nvapeek 8841c` and post the result here please?</span >

./envytools/nva/nvapeek 8841c
0008841c: 00000400

<span class="quote">&gt; If you get a non-zero value v, write value = (v &amp; 0xffffff00) to 8841c using
&gt; `nvapoke 8841c value` **before** loading Nouveau. nvapeek and nvapoke are
&gt; found in the envytools repo: <a href="https://github.com/envytools/envytools">https://github.com/envytools/envytools</a></span >

modprobe nouveau
[  747.279238] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x084000a2
[  747.279252] nouveau  [  DEVICE][0000:01:00.0] Chipset: G84 (NV84)
[  747.279257] nouveau  [  DEVICE][0000:01:00.0] Family : NV50
[  747.379554] nouveau  [   VBIOS][0000:01:00.0] using image from PROM
[  747.379705] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[  747.379710] nouveau  [   VBIOS][0000:01:00.0] version 60.84.32.00.00
[  747.381119] nouveau  [ DEVINIT][0000:01:00.0] adaptor not initialised
[  747.381140] nouveau  [   VBIOS][0000:01:00.0] running init tables
[  747.442531] nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
[  747.442593] nouveau  [     PFB][0000:01:00.0] RAM type: GDDR3
[  747.442597] nouveau  [     PFB][0000:01:00.0] RAM size: 512 MiB
[  747.442601] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 1892 tags
[  747.445672] nouveau  [    VOLT][0000:01:00.0] GPU voltage: 1300000uv
[  747.474545] nouveau  [  PTHERM][0000:01:00.0] FAN control: PWM
[  747.474597] nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
[  747.474644] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[  747.494680] nouveau  [     CLK][0000:01:00.0] 20: core 675 MHz shader 1450
MHz memory 1008 MHz
[  747.494743] nouveau  [     CLK][0000:01:00.0] --: core 675 MHz shader 1458
MHz memory 900 MHz
[  747.495846] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT
at 0x103d94
[  747.496017] nouveau  [     DRM] VRAM: 512 MiB
[  747.496049] nouveau  [     DRM] GART: 1048576 MiB
[  747.496067] nouveau  [     DRM] TMDS table version 2.0
[  747.496079] nouveau  [     DRM] DCB version 4.0
[  747.496096] nouveau  [     DRM] DCB outp 00: 01000302 00020030
[  747.496124] nouveau  [     DRM] DCB outp 01: 02000300 00000028
[  747.496138] nouveau  [     DRM] DCB outp 02: 04012310 00000028
[  747.496150] nouveau  [     DRM] DCB outp 03: 02021322 00020010
[  747.496161] nouveau  [     DRM] DCB conn 00: 1030
[  747.496184] nouveau  [     DRM] DCB conn 01: 2161
[  747.496202] nouveau  [     DRM] DCB conn 02: 0200
[  747.496218] nouveau  [     DRM] DCB conn 03: 0362
[  747.525704] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[  747.525721] [drm] Driver supports precise vblank timestamp query.
[  747.973933] Clocksource tsc unstable (delta = -209664716 ns)
[  749.145223] nouveau W[   PFIFO][0000:01:00.0] unknown intr 0x00200000
[  749.145653] nouveau  [     DRM] MM: using CRYPT for buffer copies
[  749.145754] Switched to clocksource hpet
[  750.783934] nouveau  [     DRM] allocated 1280x1024 fb: 0x70000, bo
ffff8800beb1b538
[  750.784312] nouveau 0000:01:00.0: fb1: nouveaufb frame buffer device
[  750.784344] [drm] Initialized nouveau 1.2.1 20120801 for 0000:01:00.0 on
minor 1

After this X11 gets stuck in runtime-PM:
[&lt;ffffffff8158358c&gt;] rpm_resume+0x18c/0x5c0
[&lt;ffffffff81583a08&gt;] __pm_runtime_resume+0x48/0x70
[&lt;ffffffffa0090d63&gt;] nouveau_drm_open+0x43/0x220 [nouveau]
[&lt;ffffffff814512cd&gt;] drm_open+0x1ad/0x4b0
[&lt;ffffffff81457811&gt;] drm_stub_open+0xb1/0x130
[&lt;ffffffff811cb4a1&gt;] chrdev_open+0xb1/0x190
[&lt;ffffffff811c4751&gt;] do_dentry_open.isra.19+0x101/0x330
[&lt;ffffffff811c49f1&gt;] vfs_open+0x41/0x50
[&lt;ffffffff811d462b&gt;] do_last.isra.56+0x25b/0xf20
[&lt;ffffffff811d5379&gt;] path_openat+0x89/0x5a0
[&lt;ffffffff811d6c0e&gt;] do_filp_open+0x3e/0xa0
[&lt;ffffffff811c5f4e&gt;] do_sys_open+0x12e/0x230
[&lt;ffffffff811c6069&gt;] SyS_open+0x19/0x20
[&lt;ffffffff81879a72&gt;] system_call_fastpath+0x12/0x17
[&lt;ffffffffffffffff&gt;] 0xffffffffffffffff

With runpm=0 things behave somewhat better (display lights up - tested on DVI
output where earlier tests were with VGA).

Though once X has started system gets sluggish (periods of &quot;freeze&quot; and
continue) until it fully freezes.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1433003795.5f4C2fa2.11529--

--===============1132054999==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1132054999==--
