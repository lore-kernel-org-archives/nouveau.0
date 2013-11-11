From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71472] [NV108] GT-740M not detected
Date: Mon, 11 Nov 2013 20:54:26 +0000
Message-ID: <bug-71472-8800-9maVpd9852@http.bugs.freedesktop.org/>
References: <bug-71472-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0752207781=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71472-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0752207781==
Content-Type: multipart/alternative; boundary="1384203266.A1cdaA6c1.9476"; charset="us-ascii"


--1384203266.A1cdaA6c1.9476
Date: Mon, 11 Nov 2013 20:54:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71472

Andrey Melnikov <temnota.am-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|NOTABUG                     |---

--- Comment #2 from Andrey Melnikov <temnota.am-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Ok, kernel driver not support GK208 at all.
mmio traces:

nvidia 331.20 + startx
http://woofie.cef.spbstu.ru/mmiotrace-startx.log

nvidia 331.20 + start + nvidia-settings
http://woofie.cef.spbstu.ru/mmiotrace-nvs.log

Xorg driver already v1.0.10 - still no go:

[     7.237] (II) LoadModule: "nouveau"
[     7.237] (II) Loading /usr/lib/xorg/modules/drivers/nouveau_drv.so
[     7.239] (II) Module nouveau: vendor="X.Org Foundation"
[     7.239]    compiled for 1.14.3, module version = 1.0.10
[     7.239]    Module class: X.Org Video Driver
[     7.239]    ABI class: X.Org Video Driver, version 14.1
[     7.239] (II) LoadModule: "glx"
[     7.239] (II) Loading /usr/lib/xorg/modules/extensions/libglx.so
[     7.242] (II) Module glx: vendor="X.Org Foundation"
[     7.242]    compiled for 1.14.3, module version = 1.0.0
[     7.242]    ABI class: X.Org Server Extension, version 7.0
[     7.242] (==) AIGLX enabled
[     7.242] Loading extension GLX
[     7.242] (==) Matched intel as autoconfigured driver 0
[     7.242] (==) Matched intel as autoconfigured driver 1
[     7.242] (==) Matched vesa as autoconfigured driver 2
[     7.242] (==) Matched modesetting as autoconfigured driver 3
[     7.242] (==) Matched fbdev as autoconfigured driver 4
[     7.242] (==) Assigned the driver to the xf86ConfigLayout
[     7.242] (II) LoadModule: "intel"
[     7.242] (II) Loading /usr/lib/xorg/modules/drivers/intel_drv.so
[     7.247] (II) Module intel: vendor="X.Org Foundation"
[     7.247]    compiled for 1.14.3, module version = 2.99.905
[     7.247]    Module class: X.Org Video Driver
[     7.247]    ABI class: X.Org Video Driver, version 14.1
...
[     7.249] (II) NOUVEAU driver Date:   Thu Nov 7 14:56:48 2013 +1000
[     7.249] (II) NOUVEAU driver for NVIDIA chipset families :
[     7.249]    RIVA TNT        (NV04)
[     7.249]    RIVA TNT2       (NV05)
[     7.249]    GeForce 256     (NV10)
[     7.249]    GeForce 2       (NV11, NV15)
[     7.249]    GeForce 4MX     (NV17, NV18)
[     7.249]    GeForce 3       (NV20)
[     7.249]    GeForce 4Ti     (NV25, NV28)
[     7.249]    GeForce FX      (NV3x)
[     7.249]    GeForce 6       (NV4x)
[     7.249]    GeForce 7       (G7x)
[     7.249]    GeForce 8       (G8x)
[     7.249]    GeForce GTX 200 (NVA0)
[     7.249]    GeForce GTX 400 (NVC0)
[     7.249] (II) intel: Driver for Intel(R) Integrated Graphics Chipsets:
        i810, i810-dc100, i810e, i815, i830M, 845G, 854, 852GM/855GM, 865G,
        915G, E7221 (i915), 915GM, 945G, 945GM, 945GME, Pineview GM,
        Pineview G, 965G, G35, 965Q, 946GZ, 965GM, 965GME/GLE, G33, Q35, Q33,
        GM45, 4 Series, G45/G43, Q45/Q43, G41, B43, HD Graphics,
        HD Graphics 2000, HD Graphics 3000, HD Graphics 2500,
        HD Graphics 4000, HD Graphics P4000, HD Graphics 4600,
        HD Graphics 5000, HD Graphics P4600/P4700, Iris(TM) Graphics 5100,
        HD Graphics 4400, HD Graphics 4200, Iris(TM) Pro Graphics 5200
[     7.250] (II) VESA: driver for VESA chipsets: vesa
[     7.250] (II) modesetting: Driver for Modesetting Kernel Drivers: kms
[     7.250] (II) FBDEV: driver for framebuffer: fbdev
[     7.250] (++) using VT number 7

[     7.251] (II) intel(0): SNA compiled: xserver-xorg-video-intel
2:2.99.905+git20131023.b70390b4-0ubuntu0sarvatt (Robert Hooker
<sarvatt-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>)
[     7.252] (WW) Falling back to old probe method for vesa
[     7.252] (WW) Falling back to old probe method for modesetting
[     7.252] (WW) Falling back to old probe method for fbdev
[     7.252] (II) Loading sub module "fbdevhw"
[     7.252] (II) LoadModule: "fbdevhw"
[     7.252] (II) Loading /usr/lib/xorg/modules/libfbdevhw.so
[     7.253] (II) Module fbdevhw: vendor="X.Org Foundation"
[     7.253]    compiled for 1.14.3, module version = 0.0.2
[     7.253]    ABI class: X.Org Video Driver, version 14.1
[     7.254] (II) intel(0): Creating default Display subsection in Screen
section
        "Default Screen Section" for depth/fbbpp 24/32
[     7.254] (==) intel(0): Depth 24, (--) framebuffer bpp 32
[     7.254] (==) intel(0): RGB weight 888
[     7.254] (==) intel(0): Default visual is TrueColor
[     7.254] (--) intel(0): Integrated Graphics Chipset: Intel(R) HD Graphics
4000
[     7.254] (--) intel(0): CPU: x86-64, sse2, sse3, ssse3, sse4.1, sse4.2, avx
[     7.255] (**) intel(0): Framebuffer tiled
[     7.255] (**) intel(0): Pixmaps tiled
[     7.255] (**) intel(0): "Tear free" disabled
[     7.255] (**) intel(0): Forcing per-crtc-pixmaps? no
[     7.255] (II) intel(0): Output LVDS1 has no monitor section
[     7.255] (--) intel(0): found backlight control interface acpi_video1 (type
'firmware')
[     7.255] (II) intel(0): Output VGA1 has no monitor section
[     7.255] (II) intel(0): Output HDMI1 has no monitor section
[     7.255] (II) intel(0): Output DP1 has no monitor section
[     7.255] (II) intel(0): Output VIRTUAL1 has no monitor section
[     7.255] (--) intel(0): Output LVDS1 using initial mode 1366x768 on pipe 0
[     7.255] (==) intel(0): DPI set to (96, 96)
[     7.255] (II) Loading sub module "dri2"
[     7.255] (II) LoadModule: "dri2"
[     7.255] (II) Module "dri2" already built-in
[     7.255] (II) UnloadModule: "nouveau"
[     7.255] (II) Unloading nouveau
....

Any ideas?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1384203266.A1cdaA6c1.9476
Date: Mon, 11 Nov 2013 20:54:26 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:temnota.am&#64;gmail.com" title="Andrey Melnikov &lt;temnota.am&#64;gmail.com&gt;"> <span class="fn">Andrey Melnikov</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NV108] GT-740M not detected"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71472">bug 71472</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>RESOLVED
           </td>
           <td>REOPENED
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Resolution</td>
           <td>NOTABUG
           </td>
           <td>---
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NV108] GT-740M not detected"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71472#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NV108] GT-740M not detected"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71472">bug 71472</a>
              from <span class="vcard"><a class="email" href="mailto:temnota.am&#64;gmail.com" title="Andrey Melnikov &lt;temnota.am&#64;gmail.com&gt;"> <span class="fn">Andrey Melnikov</span></a>
</span></b>
        <pre>Ok, kernel driver not support GK208 at all.
mmio traces:

nvidia 331.20 + startx
<a href="http://woofie.cef.spbstu.ru/mmiotrace-startx.log">http://woofie.cef.spbstu.ru/mmiotrace-startx.log</a>

nvidia 331.20 + start + nvidia-settings
<a href="http://woofie.cef.spbstu.ru/mmiotrace-nvs.log">http://woofie.cef.spbstu.ru/mmiotrace-nvs.log</a>

Xorg driver already v1.0.10 - still no go:

[     7.237] (II) LoadModule: &quot;nouveau&quot;
[     7.237] (II) Loading /usr/lib/xorg/modules/drivers/nouveau_drv.so
[     7.239] (II) Module nouveau: vendor=&quot;X.Org Foundation&quot;
[     7.239]    compiled for 1.14.3, module version = 1.0.10
[     7.239]    Module class: X.Org Video Driver
[     7.239]    ABI class: X.Org Video Driver, version 14.1
[     7.239] (II) LoadModule: &quot;glx&quot;
[     7.239] (II) Loading /usr/lib/xorg/modules/extensions/libglx.so
[     7.242] (II) Module glx: vendor=&quot;X.Org Foundation&quot;
[     7.242]    compiled for 1.14.3, module version = 1.0.0
[     7.242]    ABI class: X.Org Server Extension, version 7.0
[     7.242] (==) AIGLX enabled
[     7.242] Loading extension GLX
[     7.242] (==) Matched intel as autoconfigured driver 0
[     7.242] (==) Matched intel as autoconfigured driver 1
[     7.242] (==) Matched vesa as autoconfigured driver 2
[     7.242] (==) Matched modesetting as autoconfigured driver 3
[     7.242] (==) Matched fbdev as autoconfigured driver 4
[     7.242] (==) Assigned the driver to the xf86ConfigLayout
[     7.242] (II) LoadModule: &quot;intel&quot;
[     7.242] (II) Loading /usr/lib/xorg/modules/drivers/intel_drv.so
[     7.247] (II) Module intel: vendor=&quot;X.Org Foundation&quot;
[     7.247]    compiled for 1.14.3, module version = 2.99.905
[     7.247]    Module class: X.Org Video Driver
[     7.247]    ABI class: X.Org Video Driver, version 14.1
...
[     7.249] (II) NOUVEAU driver Date:   Thu Nov 7 14:56:48 2013 +1000
[     7.249] (II) NOUVEAU driver for NVIDIA chipset families :
[     7.249]    RIVA TNT        (NV04)
[     7.249]    RIVA TNT2       (NV05)
[     7.249]    GeForce 256     (NV10)
[     7.249]    GeForce 2       (NV11, NV15)
[     7.249]    GeForce 4MX     (NV17, NV18)
[     7.249]    GeForce 3       (NV20)
[     7.249]    GeForce 4Ti     (NV25, NV28)
[     7.249]    GeForce FX      (NV3x)
[     7.249]    GeForce 6       (NV4x)
[     7.249]    GeForce 7       (G7x)
[     7.249]    GeForce 8       (G8x)
[     7.249]    GeForce GTX 200 (NVA0)
[     7.249]    GeForce GTX 400 (NVC0)
[     7.249] (II) intel: Driver for Intel(R) Integrated Graphics Chipsets:
        i810, i810-dc100, i810e, i815, i830M, 845G, 854, 852GM/855GM, 865G,
        915G, E7221 (i915), 915GM, 945G, 945GM, 945GME, Pineview GM,
        Pineview G, 965G, G35, 965Q, 946GZ, 965GM, 965GME/GLE, G33, Q35, Q33,
        GM45, 4 Series, G45/G43, Q45/Q43, G41, B43, HD Graphics,
        HD Graphics 2000, HD Graphics 3000, HD Graphics 2500,
        HD Graphics 4000, HD Graphics P4000, HD Graphics 4600,
        HD Graphics 5000, HD Graphics P4600/P4700, Iris(TM) Graphics 5100,
        HD Graphics 4400, HD Graphics 4200, Iris(TM) Pro Graphics 5200
[     7.250] (II) VESA: driver for VESA chipsets: vesa
[     7.250] (II) modesetting: Driver for Modesetting Kernel Drivers: kms
[     7.250] (II) FBDEV: driver for framebuffer: fbdev
[     7.250] (++) using VT number 7

[     7.251] (II) intel(0): SNA compiled: xserver-xorg-video-intel
2:2.99.905+git20131023.b70390b4-0ubuntu0sarvatt (Robert Hooker
&lt;<a href="mailto:sarvatt&#64;ubuntu.com">sarvatt&#64;ubuntu.com</a>&gt;)
[     7.252] (WW) Falling back to old probe method for vesa
[     7.252] (WW) Falling back to old probe method for modesetting
[     7.252] (WW) Falling back to old probe method for fbdev
[     7.252] (II) Loading sub module &quot;fbdevhw&quot;
[     7.252] (II) LoadModule: &quot;fbdevhw&quot;
[     7.252] (II) Loading /usr/lib/xorg/modules/libfbdevhw.so
[     7.253] (II) Module fbdevhw: vendor=&quot;X.Org Foundation&quot;
[     7.253]    compiled for 1.14.3, module version = 0.0.2
[     7.253]    ABI class: X.Org Video Driver, version 14.1
[     7.254] (II) intel(0): Creating default Display subsection in Screen
section
        &quot;Default Screen Section&quot; for depth/fbbpp 24/32
[     7.254] (==) intel(0): Depth 24, (--) framebuffer bpp 32
[     7.254] (==) intel(0): RGB weight 888
[     7.254] (==) intel(0): Default visual is TrueColor
[     7.254] (--) intel(0): Integrated Graphics Chipset: Intel(R) HD Graphics
4000
[     7.254] (--) intel(0): CPU: x86-64, sse2, sse3, ssse3, sse4.1, sse4.2, avx
[     7.255] (**) intel(0): Framebuffer tiled
[     7.255] (**) intel(0): Pixmaps tiled
[     7.255] (**) intel(0): &quot;Tear free&quot; disabled
[     7.255] (**) intel(0): Forcing per-crtc-pixmaps? no
[     7.255] (II) intel(0): Output LVDS1 has no monitor section
[     7.255] (--) intel(0): found backlight control interface acpi_video1 (type
'firmware')
[     7.255] (II) intel(0): Output VGA1 has no monitor section
[     7.255] (II) intel(0): Output HDMI1 has no monitor section
[     7.255] (II) intel(0): Output DP1 has no monitor section
[     7.255] (II) intel(0): Output VIRTUAL1 has no monitor section
[     7.255] (--) intel(0): Output LVDS1 using initial mode 1366x768 on pipe 0
[     7.255] (==) intel(0): DPI set to (96, 96)
[     7.255] (II) Loading sub module &quot;dri2&quot;
[     7.255] (II) LoadModule: &quot;dri2&quot;
[     7.255] (II) Module &quot;dri2&quot; already built-in
[     7.255] (II) UnloadModule: &quot;nouveau&quot;
[     7.255] (II) Unloading nouveau
....

Any ideas?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1384203266.A1cdaA6c1.9476--

--===============0752207781==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0752207781==--
