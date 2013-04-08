From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 62914] ZaphodHeads doesn't work after upgrading to
	xorg 1.14
Date: Mon, 08 Apr 2013 15:13:02 +0000
Message-ID: <bug-62914-8800-mcHH9RhawM@http.bugs.freedesktop.org/>
References: <bug-62914-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0525811813=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-62914-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0525811813==
Content-Type: multipart/alternative; boundary="1365433982.dfA21.21214"; charset="us-ascii"


--1365433982.dfA21.21214
Date: Mon, 8 Apr 2013 15:13:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=62914

--- Comment #2 from Maxim P. Dementiev <max-sDaPYKTrDkuHXe+LvDLADg@public.gmane.org> ---
I've got the same problem.

X.Org X Server 1.13.1
Release Date: 2012-12-13
[  6286.574] X Protocol Version 11, Revision 0
[  6286.574] Build Operating System: Linux 3.6.11-gentoo x86_64 Gentoo
[  6286.575] Current Operating System: Linux vaio 3.7.10-gentoo #1 SMP Sun Mar
17 20:02:26 MSK 2013 x86_64
[  6286.575] Kernel command line: root=/dev/sda2
[  6286.576] Build Date: 16 February 2013  12:46:40AM
[  6286.576]  
[  6286.577] Current version of pixman: 0.28.0
.....
[  6286.581] (==) Using system config directory "/usr/share/X11/xorg.conf.d"
[  6286.581] (==) ServerLayout "MyLayout"
[  6286.581] (**) |-->Screen "LCDScreen" (0)
[  6286.581] (**) |   |-->Monitor "MyVaioLCD"
[  6286.581] (**) |   |-->Device "NvidiaLCD"
[  6286.581] (**) |-->Screen "FlatronScreen" (1)
[  6286.581] (**) |   |-->Monitor "MyFlatron"
[  6286.581] (**) |   |-->Device "NvidiaCRT"
[  6286.581] (**) Option "Xinerama" "1"
.....
[  6286.582] (II) Module ABI versions:
[  6286.582]     X.Org ANSI C Emulation: 0.4
[  6286.582]     X.Org Video Driver: 13.1
[  6286.582]     X.Org XInput driver : 18.0
[  6286.582]     X.Org Server Extension : 7.0
[  6286.583] (II) config/udev: Adding drm device (/dev/dri/card0)
[  6286.585] (--) PCI:*(0:1:0:0) 10de:0a75:104d:9067 rev 162, Mem @
0xe2000000/16777216, 0xd0000000/268435456, 0xe0000000/33554432, I/O @
0x0000d000/128, BIOS @ 0x????????/524288
[  6286.585] (II) Open ACPI successful (/var/run/acpid.socket)
.....
[  6286.597] (II) Module glx: vendor="X.Org Foundation"
[  6286.597]     compiled for 1.13.1, module version = 1.0.0
[  6286.597]     ABI class: X.Org Server Extension, version 7.0
[  6286.597] (==) AIGLX enabled
[  6286.598] Loading extension GLX
[  6286.598] (II) LoadModule: "nouveau"
[  6286.598] (II) Loading /usr/lib64/xorg/modules/drivers/nouveau_drv.so
[  6286.598] (II) Module nouveau: vendor="X.Org Foundation"
[  6286.598]     compiled for 1.13.1, module version = 1.0.6
[  6286.598]     Module class: X.Org Video Driver
[  6286.598]     ABI class: X.Org Video Driver, version 13.1
[  6286.598] (II) NOUVEAU driver 
.....
[  6286.598] (--) using VT number 7

[  6286.600] (II) [drm] nouveau interface version: 1.1.0
[  6286.600] (II) [drm] nouveau interface version: 1.1.0
[  6286.600] (II) Loading sub module "dri"
[  6286.600] (II) LoadModule: "dri"
[  6286.600] (II) Module "dri" already built-in
[  6286.600] (II) NOUVEAU(0): Loaded DRI module
[  6286.600] (--) NOUVEAU(0): Chipset: "NVIDIA NVa8"
[  6286.601] (**) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
[  6286.601] (==) NOUVEAU(0): RGB weight 888
[  6286.601] (==) NOUVEAU(0): Default visual is TrueColor
[  6286.601] (**) NOUVEAU(0): Option "ZaphodHeads" "LVDS-1,VGA-1"
[  6286.601] (==) NOUVEAU(0): Using HW cursor
[  6286.601] (==) NOUVEAU(0): GLX sync to VBlank disabled.
[  6286.601] (==) NOUVEAU(0): Page flipping enabled
[  6286.601] (==) NOUVEAU(0): Swap limit set to 2 [Max allowed 2]
[  6286.646] (II) NOUVEAU(0): Output LVDS-1 using monitor section MyVaioLCD
[  6286.646] (**) NOUVEAU(0): Option "Enable" "true"
[  6286.685] (II) NOUVEAU(0): Output VGA-1 using monitor section MyFlatron
[  6286.685] (**) NOUVEAU(0): Option "Enable" "true"
[  6286.689] (II) NOUVEAU(0): EDID for output LVDS-1
[  6286.689] (II) NOUVEAU(0): Manufacturer: SNY  Model: 6fa  Serial#: 0
.....
[  6286.729] (II) NOUVEAU(0): Output LVDS-1 enabled by config file
[  6286.729] (II) NOUVEAU(0): Output VGA-1 enabled by config file
[  6286.729] (II) NOUVEAU(0): Using exact sizes for initial modes
[  6286.729] (II) NOUVEAU(0): Output LVDS-1 using initial mode 1600x900
[  6286.729] (II) NOUVEAU(0): Output VGA-1 using initial mode 1600x900
.....
[  6286.730] (II) Module shadowfb: vendor="X.Org Foundation"
[  6286.730]     compiled for 1.13.1, module version = 1.0.0
[  6286.730]     ABI class: X.Org ANSI C Emulation, version 0.4
[  6286.730] (II) Loading sub module "dri"
[  6286.730] (II) LoadModule: "dri"
[  6286.730] (II) Module "dri" already built-in
[  6286.730] (II) NOUVEAU(1): Loaded DRI module
[  6286.730] (EE) NOUVEAU(1): [drm] failed to set drm interface version.
[  6286.730] (EE) NOUVEAU(1): [drm] error opening the drm
[  6286.730] (EE) NOUVEAU(1): 819: 
[  6286.730] (II) UnloadModule: "nouveau"
[  6286.730] (--) Depth 24 pixmap format is 32 bpp
[  6286.733] (II) NOUVEAU(0): Opened GPU channel 0
[  6286.747] (II) NOUVEAU(0): [DRI2] Setup complete
[  6286.747] (II) NOUVEAU(0): [DRI2]   DRI driver: nouveau
[  6286.747] (II) NOUVEAU(0): [DRI2]   VDPAU driver: nouveau
[  6286.750] (II) EXA(0): Driver allocated offscreen pixmaps

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1365433982.dfA21.21214
Date: Mon, 8 Apr 2013 15:13:02 +0000
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
   title="NEW --- - ZaphodHeads doesn't work after upgrading to xorg 1.14"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62914#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - ZaphodHeads doesn't work after upgrading to xorg 1.14"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62914">bug 62914</a>
              from <span class="vcard"><a class="email" href="mailto:max&#64;e-soft.ru" title="Maxim P. Dementiev &lt;max&#64;e-soft.ru&gt;"> <span class="fn">Maxim P. Dementiev</span></a>
</span></b>
        <pre>I've got the same problem.

X.Org X Server 1.13.1
Release Date: 2012-12-13
[  6286.574] X Protocol Version 11, Revision 0
[  6286.574] Build Operating System: Linux 3.6.11-gentoo x86_64 Gentoo
[  6286.575] Current Operating System: Linux vaio 3.7.10-gentoo #1 SMP Sun Mar
17 20:02:26 MSK 2013 x86_64
[  6286.575] Kernel command line: root=/dev/sda2
[  6286.576] Build Date: 16 February 2013  12:46:40AM
[  6286.576]  
[  6286.577] Current version of pixman: 0.28.0
.....
[  6286.581] (==) Using system config directory &quot;/usr/share/X11/xorg.conf.d&quot;
[  6286.581] (==) ServerLayout &quot;MyLayout&quot;
[  6286.581] (**) |--&gt;Screen &quot;LCDScreen&quot; (0)
[  6286.581] (**) |   |--&gt;Monitor &quot;MyVaioLCD&quot;
[  6286.581] (**) |   |--&gt;Device &quot;NvidiaLCD&quot;
[  6286.581] (**) |--&gt;Screen &quot;FlatronScreen&quot; (1)
[  6286.581] (**) |   |--&gt;Monitor &quot;MyFlatron&quot;
[  6286.581] (**) |   |--&gt;Device &quot;NvidiaCRT&quot;
[  6286.581] (**) Option &quot;Xinerama&quot; &quot;1&quot;
.....
[  6286.582] (II) Module ABI versions:
[  6286.582]     X.Org ANSI C Emulation: 0.4
[  6286.582]     X.Org Video Driver: 13.1
[  6286.582]     X.Org XInput driver : 18.0
[  6286.582]     X.Org Server Extension : 7.0
[  6286.583] (II) config/udev: Adding drm device (/dev/dri/card0)
[  6286.585] (--) PCI:*(0:1:0:0) 10de:0a75:104d:9067 rev 162, Mem &#64;
0xe2000000/16777216, 0xd0000000/268435456, 0xe0000000/33554432, I/O &#64;
0x0000d000/128, BIOS &#64; 0x????????/524288
[  6286.585] (II) Open ACPI successful (/var/run/acpid.socket)
.....
[  6286.597] (II) Module glx: vendor=&quot;X.Org Foundation&quot;
[  6286.597]     compiled for 1.13.1, module version = 1.0.0
[  6286.597]     ABI class: X.Org Server Extension, version 7.0
[  6286.597] (==) AIGLX enabled
[  6286.598] Loading extension GLX
[  6286.598] (II) LoadModule: &quot;nouveau&quot;
[  6286.598] (II) Loading /usr/lib64/xorg/modules/drivers/nouveau_drv.so
[  6286.598] (II) Module nouveau: vendor=&quot;X.Org Foundation&quot;
[  6286.598]     compiled for 1.13.1, module version = 1.0.6
[  6286.598]     Module class: X.Org Video Driver
[  6286.598]     ABI class: X.Org Video Driver, version 13.1
[  6286.598] (II) NOUVEAU driver 
.....
[  6286.598] (--) using VT number 7

[  6286.600] (II) [drm] nouveau interface version: 1.1.0
[  6286.600] (II) [drm] nouveau interface version: 1.1.0
[  6286.600] (II) Loading sub module &quot;dri&quot;
[  6286.600] (II) LoadModule: &quot;dri&quot;
[  6286.600] (II) Module &quot;dri&quot; already built-in
[  6286.600] (II) NOUVEAU(0): Loaded DRI module
[  6286.600] (--) NOUVEAU(0): Chipset: &quot;NVIDIA NVa8&quot;
[  6286.601] (**) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
[  6286.601] (==) NOUVEAU(0): RGB weight 888
[  6286.601] (==) NOUVEAU(0): Default visual is TrueColor
[  6286.601] (**) NOUVEAU(0): Option &quot;ZaphodHeads&quot; &quot;LVDS-1,VGA-1&quot;
[  6286.601] (==) NOUVEAU(0): Using HW cursor
[  6286.601] (==) NOUVEAU(0): GLX sync to VBlank disabled.
[  6286.601] (==) NOUVEAU(0): Page flipping enabled
[  6286.601] (==) NOUVEAU(0): Swap limit set to 2 [Max allowed 2]
[  6286.646] (II) NOUVEAU(0): Output LVDS-1 using monitor section MyVaioLCD
[  6286.646] (**) NOUVEAU(0): Option &quot;Enable&quot; &quot;true&quot;
[  6286.685] (II) NOUVEAU(0): Output VGA-1 using monitor section MyFlatron
[  6286.685] (**) NOUVEAU(0): Option &quot;Enable&quot; &quot;true&quot;
[  6286.689] (II) NOUVEAU(0): EDID for output LVDS-1
[  6286.689] (II) NOUVEAU(0): Manufacturer: SNY  Model: 6fa  Serial#: 0
.....
[  6286.729] (II) NOUVEAU(0): Output LVDS-1 enabled by config file
[  6286.729] (II) NOUVEAU(0): Output VGA-1 enabled by config file
[  6286.729] (II) NOUVEAU(0): Using exact sizes for initial modes
[  6286.729] (II) NOUVEAU(0): Output LVDS-1 using initial mode 1600x900
[  6286.729] (II) NOUVEAU(0): Output VGA-1 using initial mode 1600x900
.....
[  6286.730] (II) Module shadowfb: vendor=&quot;X.Org Foundation&quot;
[  6286.730]     compiled for 1.13.1, module version = 1.0.0
[  6286.730]     ABI class: X.Org ANSI C Emulation, version 0.4
[  6286.730] (II) Loading sub module &quot;dri&quot;
[  6286.730] (II) LoadModule: &quot;dri&quot;
[  6286.730] (II) Module &quot;dri&quot; already built-in
[  6286.730] (II) NOUVEAU(1): Loaded DRI module
[  6286.730] (EE) NOUVEAU(1): [drm] failed to set drm interface version.
[  6286.730] (EE) NOUVEAU(1): [drm] error opening the drm
[  6286.730] (EE) NOUVEAU(1): 819: 
[  6286.730] (II) UnloadModule: &quot;nouveau&quot;
[  6286.730] (--) Depth 24 pixmap format is 32 bpp
[  6286.733] (II) NOUVEAU(0): Opened GPU channel 0
[  6286.747] (II) NOUVEAU(0): [DRI2] Setup complete
[  6286.747] (II) NOUVEAU(0): [DRI2]   DRI driver: nouveau
[  6286.747] (II) NOUVEAU(0): [DRI2]   VDPAU driver: nouveau
[  6286.750] (II) EXA(0): Driver allocated offscreen pixmaps</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1365433982.dfA21.21214--

--===============0525811813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0525811813==--
