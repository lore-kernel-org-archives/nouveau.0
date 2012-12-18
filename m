From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58316] fedora 17 kernel 3.7.0-1.PAE failed plymouth
 and enable msi error
Date: Tue, 18 Dec 2012 22:16:06 +0000
Message-ID: <bug-58316-8800-lEREU4haIE@http.bugs.freedesktop.org/>
References: <bug-58316-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2055830653=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58316-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2055830653==
Content-Type: multipart/alternative; boundary="1355868966.Aeab1.16814"; charset="us-ascii"


--1355868966.Aeab1.16814
Date: Tue, 18 Dec 2012 22:16:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58316

--- Comment #4 from javier sanz <jsanza-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Working without problems f17 , 3.6.8 series ...
3.7.0 not working

configuration .. no nouveau files in system, and no kind of config reference,
like neither msi nor similar

startx verbose 6 , only shows ...

[   110.982] 
X.Org X Server 1.12.4
Release Date: 2012-08-27
[   111.038] X Protocol Version 11, Revision 0
[   111.058] Build Operating System:  2.6.32-279.9.1.el6.x86_64 
[   111.099] Current Operating System: Linux darkstar 3.7.0-1.fc17.i686.PAE #1
SMP Fri Dec 14 14:33:10 CET 2012 i686
[   111.100] Kernel command line:
BOOT_IMAGE=/boot/vmlinuz-3.7.0-1.fc17.i686.PAE
root=UUID=72d947e4-91a9-42c8-a11a-d92b72f4efad ro rd.md=0 rd.lvm=0 rd.dm=0
SYSFONT=latarcyrheb-sun16 rd.luks=0 KEYTABLE=es LANG=en_US.UTF-8 rhgb quiet
nouveau.perflvl_wr=7777 GRUB_TERMINAL=console
[   111.215] Build Date: 28 November 2012  05:13:08PM
[   111.238] Build ID: xorg-x11-server 1.12.4-1.fc17 
[   111.261] Current version of pixman: 0.24.4
[   111.308]    Before reporting problems, check http://wiki.x.org
        to make sure that you have the latest version.
[   111.308] Markers: (--) probed, (**) from config file, (==) default setting,
        (++) from command line, (!!) notice, (II) informational,
        (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[   111.408] (==) Log file: "/var/log/Xorg.0.log", Time: Sat Dec 15 19:31:18
2012
[   111.434] (==) Using config directory: "/etc/X11/xorg.conf.d"
[   111.461] (==) Using system config directory "/usr/share/X11/xorg.conf.d"
[   111.488] (==) No Layout section.  Using the first Screen section.
[   111.515] (==) No screen section available. Using defaults.
[   111.543] (**) |-->Screen "Default Screen Section" (0)
[   111.569] (**) |   |-->Monitor "<default monitor>"
[   111.622] (==) No device specified for screen "Default Screen Section".
        Using the first device section listed.
[   111.649] (**) |   |-->Device "Nvidia card"
[   111.705] (==) No monitor specified for screen "Default Screen Section".
        Using a default monitor configuration.
[   111.734] (==) Automatically adding devices
[   111.763] (==) Automatically enabling devices
[   111.845] (==) FontPath set to:
        catalogue:/etc/X11/fontpath.d,
        built-ins
[   111.872] (==) ModulePath set to "/usr/lib/xorg/modules"
[   111.950] (II) The server relies on udev to provide the list of input
devices.
        If no devices become available, reconfigure udev or disable
AutoAddDevices.
[   111.976] (II) Loader magic: 0x8224580
[   112.001] (II) Module ABI versions:
[   112.026]    X.Org ANSI C Emulation: 0.4
[   112.051]    X.Org Video Driver: 12.1
[   112.075]    X.Org XInput driver : 16.0
[   112.099]    X.Org Server Extension : 6.0
[   112.100] (--) PCI:*(0:1:0:0) 10de:0ca3:0000:0000 rev 162, Mem @
0xf9000000/16777216, 0xd0000000/268435456, 0xee000000/33554432, I/O @
0x0000cf00/128, BIOS @ 0x????????/524288
[   112.173] (II) LoadModule: "extmod"
[   112.219] (II) Loading /usr/lib/xorg/modules/extensions/libextmod.so
[   112.243] (II) Module extmod: vendor="X.Org Foundation"
[   112.243]    compiled for 1.12.4, module version = 1.0.0
[   112.291]    Module class: X.Org Server Extension
[   112.316]    ABI class: X.Org Server Extension, version 6.0
[   112.341] (II) Loading extension SELinux
[   112.365] (II) Loading extension MIT-SCREEN-SAVER
[   112.388] (II) Loading extension XFree86-VidModeExtension
[   112.410] (II) Loading extension XFree86-DGA
[   112.431] (II) Loading extension DPMS
[   112.451] (II) Loading extension XVideo
[   112.472] (II) Loading extension XVideo-MotionCompensation
[   112.493] (II) Loading extension X-Resource
[   112.493] (II) LoadModule: "dbe"
[   112.534] (II) Loading /usr/lib/xorg/modules/extensions/libdbe.so
[   112.555] (II) Module dbe: vendor="X.Org Foundation"
[   112.555]    compiled for 1.12.4, module version = 1.0.0
[   112.596]    Module class: X.Org Server Extension
[   112.616]    ABI class: X.Org Server Extension, version 6.0
[   112.636] (II) Loading extension DOUBLE-BUFFER
[   112.636] (II) LoadModule: "glx"
[   112.677] (II) Loading /usr/lib/xorg/modules/extensions/libglx.so
[   112.698] (II) Module glx: vendor="X.Org Foundation"
[   112.698]    compiled for 1.12.4, module version = 1.0.0
[   112.741]    ABI class: X.Org Server Extension, version 6.0
[   112.762] (==) AIGLX enabled
[   112.783] (II) Loading extension GLX
[   112.783] (II) LoadModule: "record"
[   112.822] (II) Loading /usr/lib/xorg/modules/extensions/librecord.so
[   112.842] (II) Module record: vendor="X.Org Foundation"
[   112.843]    compiled for 1.12.4, module version = 1.13.0
[   112.882]    Module class: X.Org Server Extension
[   112.902]    ABI class: X.Org Server Extension, version 6.0
[   112.922] (II) Loading extension RECORD
[   112.922] (II) LoadModule: "dri"
[   112.961] (II) Loading /usr/lib/xorg/modules/extensions/libdri.so
[   112.981] (II) Module dri: vendor="X.Org Foundation"
[   112.982]    compiled for 1.12.4, module version = 1.0.0
[   113.024]    ABI class: X.Org Server Extension, version 6.0
[   113.046] (II) Loading extension XFree86-DRI
[   113.046] (II) LoadModule: "dri2"
[   113.091] (II) Loading /usr/lib/xorg/modules/extensions/libdri2.so
[   113.114] (II) Module dri2: vendor="X.Org Foundation"
[   113.114]    compiled for 1.12.4, module version = 1.2.0
[   113.160]    ABI class: X.Org Server Extension, version 6.0
[   113.183] (II) Loading extension DRI2
[   113.183] (II) LoadModule: "nouveau"
[   113.228] (II) Loading /usr/lib/xorg/modules/drivers/nouveau_drv.so
[   113.251] (II) Module nouveau: vendor="X.Org Foundation"
[   113.252]    compiled for 1.12.2, module version = 0.0.16
[   113.298]    Module class: X.Org Video Driver
[   113.321]    ABI class: X.Org Video Driver, version 12.0
[   113.344] (II) NOUVEAU driver 
[   113.367] (II) NOUVEAU driver for NVIDIA chipset families :
[   113.367]    RIVA TNT        (NV04)
[   113.390]    RIVA TNT2       (NV05)
[   113.413]    GeForce 256     (NV10)
[   113.435]    GeForce 2       (NV11, NV15)
[   113.457]    GeForce 4MX     (NV17, NV18)
[   113.477]    GeForce 3       (NV20)
[   113.497]    GeForce 4Ti     (NV25, NV28)
[   113.517]    GeForce FX      (NV3x)
[   113.536]    GeForce 6       (NV4x)
[   113.554]    GeForce 7       (G7x)
[   113.572]    GeForce 8       (G8x)
[   113.589]    GeForce GTX 200 (NVA0)
[   113.605]    GeForce GTX 400 (NVC0)
[   113.649] (++) using VT number 2

[   113.649] drmOpenDevice: node name is /dev/dri/card0
[   113.671] [drm] failed to load kernel module "nouveau"
[   113.671] (EE) [drm] failed to open device
[   113.671] (EE) No devices detected.
[   113.671] 
Fatal server error:
[   113.671] no screens found
[   113.671] 
Please consult the Fedora Project support 
         at http://wiki.x.org
 for help. 
[   113.671] Please also check the log file at "/var/log/Xorg.0.log" for
additional information.
[   113.671]

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1355868966.Aeab1.16814
Date: Tue, 18 Dec 2012 22:16:06 +0000
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
   title="NEW --- - fedora 17 kernel 3.7.0-1.PAE failed plymouth and enable msi error"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58316#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - fedora 17 kernel 3.7.0-1.PAE failed plymouth and enable msi error"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58316">bug 58316</a>
              from <span class="vcard"><a class="email" href="mailto:jsanza&#64;gmail.com" title="javier sanz &lt;jsanza&#64;gmail.com&gt;"> <span class="fn">javier sanz</span></a>
</span></b>
        <pre>Working without problems f17 , 3.6.8 series ...
3.7.0 not working

configuration .. no nouveau files in system, and no kind of config reference,
like neither msi nor similar

startx verbose 6 , only shows ...

[   110.982] 
X.Org X Server 1.12.4
Release Date: 2012-08-27
[   111.038] X Protocol Version 11, Revision 0
[   111.058] Build Operating System:  2.6.32-279.9.1.el6.x86_64 
[   111.099] Current Operating System: Linux darkstar 3.7.0-1.fc17.i686.PAE #1
SMP Fri Dec 14 14:33:10 CET 2012 i686
[   111.100] Kernel command line:
BOOT_IMAGE=/boot/vmlinuz-3.7.0-1.fc17.i686.PAE
root=UUID=72d947e4-91a9-42c8-a11a-d92b72f4efad ro rd.md=0 rd.lvm=0 rd.dm=0
SYSFONT=latarcyrheb-sun16 rd.luks=0 KEYTABLE=es LANG=en_US.UTF-8 rhgb quiet
nouveau.perflvl_wr=7777 GRUB_TERMINAL=console
[   111.215] Build Date: 28 November 2012  05:13:08PM
[   111.238] Build ID: xorg-x11-server 1.12.4-1.fc17 
[   111.261] Current version of pixman: 0.24.4
[   111.308]    Before reporting problems, check <a href="http://wiki.x.org">http://wiki.x.org</a>
        to make sure that you have the latest version.
[   111.308] Markers: (--) probed, (**) from config file, (==) default setting,
        (++) from command line, (!!) notice, (II) informational,
        (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[   111.408] (==) Log file: &quot;/var/log/Xorg.0.log&quot;, Time: Sat Dec 15 19:31:18
2012
[   111.434] (==) Using config directory: &quot;/etc/X11/xorg.conf.d&quot;
[   111.461] (==) Using system config directory &quot;/usr/share/X11/xorg.conf.d&quot;
[   111.488] (==) No Layout section.  Using the first Screen section.
[   111.515] (==) No screen section available. Using defaults.
[   111.543] (**) |--&gt;Screen &quot;Default Screen Section&quot; (0)
[   111.569] (**) |   |--&gt;Monitor &quot;&lt;default monitor&gt;&quot;
[   111.622] (==) No device specified for screen &quot;Default Screen Section&quot;.
        Using the first device section listed.
[   111.649] (**) |   |--&gt;Device &quot;Nvidia card&quot;
[   111.705] (==) No monitor specified for screen &quot;Default Screen Section&quot;.
        Using a default monitor configuration.
[   111.734] (==) Automatically adding devices
[   111.763] (==) Automatically enabling devices
[   111.845] (==) FontPath set to:
        catalogue:/etc/X11/fontpath.d,
        built-ins
[   111.872] (==) ModulePath set to &quot;/usr/lib/xorg/modules&quot;
[   111.950] (II) The server relies on udev to provide the list of input
devices.
        If no devices become available, reconfigure udev or disable
AutoAddDevices.
[   111.976] (II) Loader magic: 0x8224580
[   112.001] (II) Module ABI versions:
[   112.026]    X.Org ANSI C Emulation: 0.4
[   112.051]    X.Org Video Driver: 12.1
[   112.075]    X.Org XInput driver : 16.0
[   112.099]    X.Org Server Extension : 6.0
[   112.100] (--) PCI:*(0:1:0:0) 10de:0ca3:0000:0000 rev 162, Mem &#64;
0xf9000000/16777216, 0xd0000000/268435456, 0xee000000/33554432, I/O &#64;
0x0000cf00/128, BIOS &#64; 0x????????/524288
[   112.173] (II) LoadModule: &quot;extmod&quot;
[   112.219] (II) Loading /usr/lib/xorg/modules/extensions/libextmod.so
[   112.243] (II) Module extmod: vendor=&quot;X.Org Foundation&quot;
[   112.243]    compiled for 1.12.4, module version = 1.0.0
[   112.291]    Module class: X.Org Server Extension
[   112.316]    ABI class: X.Org Server Extension, version 6.0
[   112.341] (II) Loading extension SELinux
[   112.365] (II) Loading extension MIT-SCREEN-SAVER
[   112.388] (II) Loading extension XFree86-VidModeExtension
[   112.410] (II) Loading extension XFree86-DGA
[   112.431] (II) Loading extension DPMS
[   112.451] (II) Loading extension XVideo
[   112.472] (II) Loading extension XVideo-MotionCompensation
[   112.493] (II) Loading extension X-Resource
[   112.493] (II) LoadModule: &quot;dbe&quot;
[   112.534] (II) Loading /usr/lib/xorg/modules/extensions/libdbe.so
[   112.555] (II) Module dbe: vendor=&quot;X.Org Foundation&quot;
[   112.555]    compiled for 1.12.4, module version = 1.0.0
[   112.596]    Module class: X.Org Server Extension
[   112.616]    ABI class: X.Org Server Extension, version 6.0
[   112.636] (II) Loading extension DOUBLE-BUFFER
[   112.636] (II) LoadModule: &quot;glx&quot;
[   112.677] (II) Loading /usr/lib/xorg/modules/extensions/libglx.so
[   112.698] (II) Module glx: vendor=&quot;X.Org Foundation&quot;
[   112.698]    compiled for 1.12.4, module version = 1.0.0
[   112.741]    ABI class: X.Org Server Extension, version 6.0
[   112.762] (==) AIGLX enabled
[   112.783] (II) Loading extension GLX
[   112.783] (II) LoadModule: &quot;record&quot;
[   112.822] (II) Loading /usr/lib/xorg/modules/extensions/librecord.so
[   112.842] (II) Module record: vendor=&quot;X.Org Foundation&quot;
[   112.843]    compiled for 1.12.4, module version = 1.13.0
[   112.882]    Module class: X.Org Server Extension
[   112.902]    ABI class: X.Org Server Extension, version 6.0
[   112.922] (II) Loading extension RECORD
[   112.922] (II) LoadModule: &quot;dri&quot;
[   112.961] (II) Loading /usr/lib/xorg/modules/extensions/libdri.so
[   112.981] (II) Module dri: vendor=&quot;X.Org Foundation&quot;
[   112.982]    compiled for 1.12.4, module version = 1.0.0
[   113.024]    ABI class: X.Org Server Extension, version 6.0
[   113.046] (II) Loading extension XFree86-DRI
[   113.046] (II) LoadModule: &quot;dri2&quot;
[   113.091] (II) Loading /usr/lib/xorg/modules/extensions/libdri2.so
[   113.114] (II) Module dri2: vendor=&quot;X.Org Foundation&quot;
[   113.114]    compiled for 1.12.4, module version = 1.2.0
[   113.160]    ABI class: X.Org Server Extension, version 6.0
[   113.183] (II) Loading extension DRI2
[   113.183] (II) LoadModule: &quot;nouveau&quot;
[   113.228] (II) Loading /usr/lib/xorg/modules/drivers/nouveau_drv.so
[   113.251] (II) Module nouveau: vendor=&quot;X.Org Foundation&quot;
[   113.252]    compiled for 1.12.2, module version = 0.0.16
[   113.298]    Module class: X.Org Video Driver
[   113.321]    ABI class: X.Org Video Driver, version 12.0
[   113.344] (II) NOUVEAU driver 
[   113.367] (II) NOUVEAU driver for NVIDIA chipset families :
[   113.367]    RIVA TNT        (NV04)
[   113.390]    RIVA TNT2       (NV05)
[   113.413]    GeForce 256     (NV10)
[   113.435]    GeForce 2       (NV11, NV15)
[   113.457]    GeForce 4MX     (NV17, NV18)
[   113.477]    GeForce 3       (NV20)
[   113.497]    GeForce 4Ti     (NV25, NV28)
[   113.517]    GeForce FX      (NV3x)
[   113.536]    GeForce 6       (NV4x)
[   113.554]    GeForce 7       (G7x)
[   113.572]    GeForce 8       (G8x)
[   113.589]    GeForce GTX 200 (NVA0)
[   113.605]    GeForce GTX 400 (NVC0)
[   113.649] (++) using VT number 2

[   113.649] drmOpenDevice: node name is /dev/dri/card0
[   113.671] [drm] failed to load kernel module &quot;nouveau&quot;
[   113.671] (EE) [drm] failed to open device
[   113.671] (EE) No devices detected.
[   113.671] 
Fatal server error:
[   113.671] no screens found
[   113.671] 
Please consult the Fedora Project support 
         at <a href="http://wiki.x.org">http://wiki.x.org</a>
 for help. 
[   113.671] Please also check the log file at &quot;/var/log/Xorg.0.log&quot; for
additional information.
[   113.671]</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1355868966.Aeab1.16814--

--===============2055830653==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2055830653==--
