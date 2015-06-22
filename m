From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91051] New: GT650M and Nouveau - NOUVEAU(0): [drm]
 failed to set drm interface version.
Date: Mon, 22 Jun 2015 08:10:42 +0000
Message-ID: <bug-91051-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1740238517=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============1740238517==
Content-Type: multipart/alternative; boundary="1434960642.b0f81eA0.25816"; charset="UTF-8"


--1434960642.b0f81eA0.25816
Date: Mon, 22 Jun 2015 08:10:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91051

            Bug ID: 91051
           Summary: GT650M and Nouveau - NOUVEAU(0): [drm] failed to set
                    drm interface version.
           Product: Mesa
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: stu.axon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Not sure if this is the right place...

OS:  
Ubuntu 15.04,  Using oibaf PPA.  Laptop: Asus N56VZ


I have GT650M with Intel.    The nouveau driver doesn't seem to load with this
error in /var/log/Xorg.8.log:

NOUVEAU(0): [drm] failed to set drm interface version.

Googling, I've found people with the same issue, but no solution that is not
"use the proprietary drivers" which is I prefer not to do as they are quite
fragile during upgrades.

With earlier kernels (about 3 releases of Ubuntu back?) - Nouveau worked fine
with bumblebee, it hasn't for quite a long time, I've got a suspicion that
Nouveau and Bumblebee hasn't been working for anybody else during that time too
(since searching for a fix on and off the last few years).


/var/log/Xorg.8.log
[  8990.687] 
X.Org X Server 1.17.1
Release Date: 2015-02-10
[  8990.687] X Protocol Version 11, Revision 0
[  8990.687] Build Operating System: Linux 3.2.0-61-generic x86_64 Ubuntu
[  8990.687] Current Operating System: Linux beezlebub 3.19.0-20-generic
#20-Ubuntu SMP Fri May 29 10:10:47 UTC 2015 x86_64
[  8990.687] Kernel command line:
BOOT_IMAGE=/vmlinuz-3.19.0-20-generic.efi.signed
root=UUID=14ac372e-6980-4fe8-b247-fae92d54b0c5 ro quiet splash
acpi_enforce_resources=lax intel_pstate=enable rcutree.rcu_idle_gp_delay=1
vt.handoff=7
[  8990.687] Build Date: 19 March 2015  09:26:59AM
[  8990.687] xorg-server 2:1.17.1-0ubuntu3 (For technical support please see
http://www.ubuntu.com/support) 
[  8990.687] Current version of pixman: 0.32.6
[  8990.687]     Before reporting problems, check http://wiki.x.org
    to make sure that you have the latest version.
[  8990.687] Markers: (--) probed, (**) from config file, (==) default setting,
    (++) from command line, (!!) notice, (II) informational,
    (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[  8990.687] (==) Log file: "/var/log/Xorg.8.log", Time: Mon Jun 22 16:05:14
2015
[  8990.687] (++) Using config file: "/etc/bumblebee/xorg.conf.nouveau"
[  8990.687] (++) Using config directory: "/etc/bumblebee/xorg.conf.d"
[  8990.687] (==) Using system config directory "/usr/share/X11/xorg.conf.d"
[  8990.687] (==) ServerLayout "Layout0"
[  8990.687] (==) No screen section available. Using defaults.
[  8990.687] (**) |-->Screen "Default Screen Section" (0)
[  8990.687] (**) |   |-->Monitor "<default monitor>"
[  8990.688] (==) No device specified for screen "Default Screen Section".
    Using the first device section listed.
[  8990.688] (**) |   |-->Device "DiscreteNvidia"
[  8990.688] (==) No monitor specified for screen "Default Screen Section".
    Using a default monitor configuration.
[  8990.688] (**) Option "AutoAddDevices" "false"
[  8990.688] (**) Option "AutoAddGPU" "false"
[  8990.688] (**) Not automatically adding devices
[  8990.688] (==) Automatically enabling devices
[  8990.688] (**) Not automatically adding GPU devices
[  8990.688] (WW) The directory "/usr/share/fonts/X11/cyrillic" does not exist.
[  8990.688]     Entry deleted from font path.
[  8990.688] (WW) The directory "/usr/share/fonts/X11/75dpi/" does not exist.
[  8990.688]     Entry deleted from font path.
[  8990.688] (WW) The directory "/usr/share/fonts/X11/75dpi" does not exist.
[  8990.688]     Entry deleted from font path.
[  8990.688] (==) FontPath set to:
    /usr/share/fonts/X11/misc,
    /usr/share/fonts/X11/100dpi/:unscaled,
    /usr/share/fonts/X11/Type1,
    /usr/share/fonts/X11/100dpi,
    built-ins
[  8990.688] (==) ModulePath set to
"/usr/lib/x86_64-linux-gnu/xorg/extra-modules,/usr/lib/xorg/extra-modules,/usr/lib/xorg/modules"
[  8990.688] (==) |-->Input Device "<default pointer>"
[  8990.688] (==) |-->Input Device "<default keyboard>"
[  8990.688] (==) The core pointer device wasn't specified explicitly in the
layout.
    Using the default mouse configuration.
[  8990.688] (==) The core keyboard device wasn't specified explicitly in the
layout.
    Using the default keyboard configuration.
[  8990.688] (II) Loader magic: 0x7f66b0169d80
[  8990.688] (II) Module ABI versions:
[  8990.688]     X.Org ANSI C Emulation: 0.4
[  8990.688]     X.Org Video Driver: 19.0
[  8990.688]     X.Org XInput driver : 21.0
[  8990.688]     X.Org Server Extension : 9.0
[  8990.688] (II) xfree86: Adding drm device (/dev/dri/card1)
[  8990.688] (II) xfree86: Adding drm device (/dev/dri/card0)
[  8990.689] (--) PCI: (0:1:0:0) 10de:0fd1:1043:2103 rev 161, Mem @
0xf6000000/16777216, 0xe0000000/268435456, 0xf0000000/33554432, I/O @
0x0000e000/128, BIOS @ 0x????????/524288
[  8990.689] (II) LoadModule: "glx"
[  8990.689] (II) Loading /usr/lib/xorg/modules/extensions/libglx.so
[  8990.690] (II) Module glx: vendor="X.Org Foundation"
[  8990.690]     compiled for 1.17.1, module version = 1.0.0
[  8990.690]     ABI class: X.Org Server Extension, version 9.0
[  8990.690] (==) AIGLX enabled
[  8990.690] (II) LoadModule: "nouveau"
[  8990.690] (II) Loading /usr/lib/xorg/modules/drivers/nouveau_drv.so
[  8990.690] (II) Module nouveau: vendor="X.Org Foundation"
[  8990.690]     compiled for 1.17.1, module version = 1.0.11
[  8990.690]     Module class: X.Org Video Driver
[  8990.690]     ABI class: X.Org Video Driver, version 19.0
[  8990.690] (II) LoadModule: "mouse"
[  8990.690] (II) Loading /usr/lib/xorg/modules/input/mouse_drv.so
[  8990.690] (II) Module mouse: vendor="X.Org Foundation"
[  8990.690]     compiled for 1.16.0, module version = 1.9.1
[  8990.690]     Module class: X.Org XInput Driver
[  8990.690]     ABI class: X.Org XInput driver, version 21.0
[  8990.690] (II) LoadModule: "kbd"
[  8990.690] (WW) Warning, couldn't open module kbd
[  8990.690] (II) UnloadModule: "kbd"
[  8990.690] (II) Unloading kbd
[  8990.690] (EE) Failed to load module "kbd" (module does not exist, 0)
[  8990.690] (II) NOUVEAU driver 
[  8990.690] (II) NOUVEAU driver for NVIDIA chipset families :
[  8990.690]     RIVA TNT        (NV04)
[  8990.690]     RIVA TNT2       (NV05)
[  8990.690]     GeForce 256     (NV10)
[  8990.690]     GeForce 2       (NV11, NV15)
[  8990.690]     GeForce 4MX     (NV17, NV18)
[  8990.690]     GeForce 3       (NV20)
[  8990.690]     GeForce 4Ti     (NV25, NV28)
[  8990.690]     GeForce FX      (NV3x)
[  8990.690]     GeForce 6       (NV4x)
[  8990.690]     GeForce 7       (G7x)
[  8990.690]     GeForce 8       (G8x)
[  8990.691]     GeForce GTX 200 (NVA0)
[  8990.691]     GeForce GTX 400 (NVC0)
[  8990.691] (--) using VT number 7

[  8990.691] (II) [drm] nouveau interface version: 1.2.1
[  8990.691] (II) Loading sub module "dri2"
[  8990.691] (II) LoadModule: "dri2"
[  8990.691] (II) Module "dri2" already built-in
[  8990.691] (EE) NOUVEAU(0): [drm] failed to set drm interface version.
[  8990.691] (EE) NOUVEAU(0): [drm] error opening the drm
[  8990.691] (EE) NOUVEAU(0): 904: 
[  8990.691] (II) UnloadModule: "nouveau"
[  8990.691] (EE) Screen(s) found, but none have a usable configuration.
[  8990.691] (EE) 
Fatal server error:
[  8990.691] (EE) no screens found(EE) 
[  8990.691] (EE) 
Please consult the The X.Org Foundation support 
     at http://wiki.x.org
 for help. 
[  8990.691] (EE) Please also check the log file at "/var/log/Xorg.8.log" for
additional information.
[  8990.691] (EE) 
[  8990.691] (EE) Server terminated with error (1). Closing log file.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1434960642.b0f81eA0.25816
Date: Mon, 22 Jun 2015 08:10:42 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - GT650M and Nouveau - NOUVEAU(0): [drm] failed to set drm interface version."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91051">91051</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>GT650M and Nouveau - NOUVEAU(0): [drm] failed to set drm interface version.
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>stu.axon&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Not sure if this is the right place...

OS:  
Ubuntu 15.04,  Using oibaf PPA.  Laptop: Asus N56VZ


I have GT650M with Intel.    The nouveau driver doesn't seem to load with this
error in /var/log/Xorg.8.log:

NOUVEAU(0): [drm] failed to set drm interface version.

Googling, I've found people with the same issue, but no solution that is not
&quot;use the proprietary drivers&quot; which is I prefer not to do as they are quite
fragile during upgrades.

With earlier kernels (about 3 releases of Ubuntu back?) - Nouveau worked fine
with bumblebee, it hasn't for quite a long time, I've got a suspicion that
Nouveau and Bumblebee hasn't been working for anybody else during that time too
(since searching for a fix on and off the last few years).


/var/log/Xorg.8.log
[  8990.687] 
X.Org X Server 1.17.1
Release Date: 2015-02-10
[  8990.687] X Protocol Version 11, Revision 0
[  8990.687] Build Operating System: Linux 3.2.0-61-generic x86_64 Ubuntu
[  8990.687] Current Operating System: Linux beezlebub 3.19.0-20-generic
#20-Ubuntu SMP Fri May 29 10:10:47 UTC 2015 x86_64
[  8990.687] Kernel command line:
BOOT_IMAGE=/vmlinuz-3.19.0-20-generic.efi.signed
root=UUID=14ac372e-6980-4fe8-b247-fae92d54b0c5 ro quiet splash
acpi_enforce_resources=lax intel_pstate=enable rcutree.rcu_idle_gp_delay=1
vt.handoff=7
[  8990.687] Build Date: 19 March 2015  09:26:59AM
[  8990.687] xorg-server 2:1.17.1-0ubuntu3 (For technical support please see
<a href="http://www.ubuntu.com/support">http://www.ubuntu.com/support</a>) 
[  8990.687] Current version of pixman: 0.32.6
[  8990.687]     Before reporting problems, check <a href="http://wiki.x.org">http://wiki.x.org</a>
    to make sure that you have the latest version.
[  8990.687] Markers: (--) probed, (**) from config file, (==) default setting,
    (++) from command line, (!!) notice, (II) informational,
    (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[  8990.687] (==) Log file: &quot;/var/log/Xorg.8.log&quot;, Time: Mon Jun 22 16:05:14
2015
[  8990.687] (++) Using config file: &quot;/etc/bumblebee/xorg.conf.nouveau&quot;
[  8990.687] (++) Using config directory: &quot;/etc/bumblebee/xorg.conf.d&quot;
[  8990.687] (==) Using system config directory &quot;/usr/share/X11/xorg.conf.d&quot;
[  8990.687] (==) ServerLayout &quot;Layout0&quot;
[  8990.687] (==) No screen section available. Using defaults.
[  8990.687] (**) |--&gt;Screen &quot;Default Screen Section&quot; (0)
[  8990.687] (**) |   |--&gt;Monitor &quot;&lt;default monitor&gt;&quot;
[  8990.688] (==) No device specified for screen &quot;Default Screen Section&quot;.
    Using the first device section listed.
[  8990.688] (**) |   |--&gt;Device &quot;DiscreteNvidia&quot;
[  8990.688] (==) No monitor specified for screen &quot;Default Screen Section&quot;.
    Using a default monitor configuration.
[  8990.688] (**) Option &quot;AutoAddDevices&quot; &quot;false&quot;
[  8990.688] (**) Option &quot;AutoAddGPU&quot; &quot;false&quot;
[  8990.688] (**) Not automatically adding devices
[  8990.688] (==) Automatically enabling devices
[  8990.688] (**) Not automatically adding GPU devices
[  8990.688] (WW) The directory &quot;/usr/share/fonts/X11/cyrillic&quot; does not exist.
[  8990.688]     Entry deleted from font path.
[  8990.688] (WW) The directory &quot;/usr/share/fonts/X11/75dpi/&quot; does not exist.
[  8990.688]     Entry deleted from font path.
[  8990.688] (WW) The directory &quot;/usr/share/fonts/X11/75dpi&quot; does not exist.
[  8990.688]     Entry deleted from font path.
[  8990.688] (==) FontPath set to:
    /usr/share/fonts/X11/misc,
    /usr/share/fonts/X11/100dpi/:unscaled,
    /usr/share/fonts/X11/Type1,
    /usr/share/fonts/X11/100dpi,
    built-ins
[  8990.688] (==) ModulePath set to
&quot;/usr/lib/x86_64-linux-gnu/xorg/extra-modules,/usr/lib/xorg/extra-modules,/usr/lib/xorg/modules&quot;
[  8990.688] (==) |--&gt;Input Device &quot;&lt;default pointer&gt;&quot;
[  8990.688] (==) |--&gt;Input Device &quot;&lt;default keyboard&gt;&quot;
[  8990.688] (==) The core pointer device wasn't specified explicitly in the
layout.
    Using the default mouse configuration.
[  8990.688] (==) The core keyboard device wasn't specified explicitly in the
layout.
    Using the default keyboard configuration.
[  8990.688] (II) Loader magic: 0x7f66b0169d80
[  8990.688] (II) Module ABI versions:
[  8990.688]     X.Org ANSI C Emulation: 0.4
[  8990.688]     X.Org Video Driver: 19.0
[  8990.688]     X.Org XInput driver : 21.0
[  8990.688]     X.Org Server Extension : 9.0
[  8990.688] (II) xfree86: Adding drm device (/dev/dri/card1)
[  8990.688] (II) xfree86: Adding drm device (/dev/dri/card0)
[  8990.689] (--) PCI: (0:1:0:0) 10de:0fd1:1043:2103 rev 161, Mem &#64;
0xf6000000/16777216, 0xe0000000/268435456, 0xf0000000/33554432, I/O &#64;
0x0000e000/128, BIOS &#64; 0x????????/524288
[  8990.689] (II) LoadModule: &quot;glx&quot;
[  8990.689] (II) Loading /usr/lib/xorg/modules/extensions/libglx.so
[  8990.690] (II) Module glx: vendor=&quot;X.Org Foundation&quot;
[  8990.690]     compiled for 1.17.1, module version = 1.0.0
[  8990.690]     ABI class: X.Org Server Extension, version 9.0
[  8990.690] (==) AIGLX enabled
[  8990.690] (II) LoadModule: &quot;nouveau&quot;
[  8990.690] (II) Loading /usr/lib/xorg/modules/drivers/nouveau_drv.so
[  8990.690] (II) Module nouveau: vendor=&quot;X.Org Foundation&quot;
[  8990.690]     compiled for 1.17.1, module version = 1.0.11
[  8990.690]     Module class: X.Org Video Driver
[  8990.690]     ABI class: X.Org Video Driver, version 19.0
[  8990.690] (II) LoadModule: &quot;mouse&quot;
[  8990.690] (II) Loading /usr/lib/xorg/modules/input/mouse_drv.so
[  8990.690] (II) Module mouse: vendor=&quot;X.Org Foundation&quot;
[  8990.690]     compiled for 1.16.0, module version = 1.9.1
[  8990.690]     Module class: X.Org XInput Driver
[  8990.690]     ABI class: X.Org XInput driver, version 21.0
[  8990.690] (II) LoadModule: &quot;kbd&quot;
[  8990.690] (WW) Warning, couldn't open module kbd
[  8990.690] (II) UnloadModule: &quot;kbd&quot;
[  8990.690] (II) Unloading kbd
[  8990.690] (EE) Failed to load module &quot;kbd&quot; (module does not exist, 0)
[  8990.690] (II) NOUVEAU driver 
[  8990.690] (II) NOUVEAU driver for NVIDIA chipset families :
[  8990.690]     RIVA TNT        (NV04)
[  8990.690]     RIVA TNT2       (NV05)
[  8990.690]     GeForce 256     (NV10)
[  8990.690]     GeForce 2       (NV11, NV15)
[  8990.690]     GeForce 4MX     (NV17, NV18)
[  8990.690]     GeForce 3       (NV20)
[  8990.690]     GeForce 4Ti     (NV25, NV28)
[  8990.690]     GeForce FX      (NV3x)
[  8990.690]     GeForce 6       (NV4x)
[  8990.690]     GeForce 7       (G7x)
[  8990.690]     GeForce 8       (G8x)
[  8990.691]     GeForce GTX 200 (NVA0)
[  8990.691]     GeForce GTX 400 (NVC0)
[  8990.691] (--) using VT number 7

[  8990.691] (II) [drm] nouveau interface version: 1.2.1
[  8990.691] (II) Loading sub module &quot;dri2&quot;
[  8990.691] (II) LoadModule: &quot;dri2&quot;
[  8990.691] (II) Module &quot;dri2&quot; already built-in
[  8990.691] (EE) NOUVEAU(0): [drm] failed to set drm interface version.
[  8990.691] (EE) NOUVEAU(0): [drm] error opening the drm
[  8990.691] (EE) NOUVEAU(0): 904: 
[  8990.691] (II) UnloadModule: &quot;nouveau&quot;
[  8990.691] (EE) Screen(s) found, but none have a usable configuration.
[  8990.691] (EE) 
Fatal server error:
[  8990.691] (EE) no screens found(EE) 
[  8990.691] (EE) 
Please consult the The X.Org Foundation support 
     at <a href="http://wiki.x.org">http://wiki.x.org</a>
 for help. 
[  8990.691] (EE) Please also check the log file at &quot;/var/log/Xorg.8.log&quot; for
additional information.
[  8990.691] (EE) 
[  8990.691] (EE) Server terminated with error (1). Closing log file.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1434960642.b0f81eA0.25816--

--===============1740238517==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1740238517==--
