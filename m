From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90388] New: PDISP errors in logs
Date: Sun, 10 May 2015 14:36:02 +0000
Message-ID: <bug-90388-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1915221770=="
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


--===============1915221770==
Content-Type: multipart/alternative; boundary="1431268562.328D2AD1.7287"; charset="UTF-8"


--1431268562.328D2AD1.7287
Date: Sun, 10 May 2015 14:36:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90388

            Bug ID: 90388
           Summary: PDISP errors in logs
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: artafinde-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 115667
  --> https://bugs.freedesktop.org/attachment.cgi?id=115667&action=edit
dmesg from a boot.

PDISP error filling the dmesg. It's quite spammy but other than that the X
works (GDM loads fine).

Using Archlinux up to date.
~$ pacman -Qi xf86-video-nouveau
Name           : xf86-video-nouveau
Version        : 1.0.11-3
Description    : Open Source 2D acceleration driver for nVidia cards
Architecture   : x86_64
URL            : http://nouveau.freedesktop.org/
Licenses       : GPL
Groups         : xorg-drivers  xorg
Provides       : None
Depends On     : libdrm  systemd  mesa-dri
Optional Deps  : None
Required By    : None
Optional For   : None
Conflicts With : xorg-server<1.16  X-ABI-VIDEODRV_VERSION<19 
X-ABI-VIDEODRV_VERSION>=20
Replaces       : None
Installed Size : 218.00 KiB
Packager       : Laurent Carlier <lordheavym-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Build Date     : Thu 05 Feb 2015 08:01:59 PM GMT
Install Date   : Thu 30 Apr 2015 08:09:35 PM BST
Install Reason : Explicitly installed
Install Script : Yes
Validated By   : Signature
~$ modinfo nouveau
filename:      
/lib/modules/4.0.2-2-ck/kernel/drivers/gpu/drm/nouveau/nouveau.ko.gz
license:        GPL and additional rights
description:    nVidia Riva/TNT/GeForce/Quadro/Tesla
author:         Nouveau Project
alias:          pci:v000012D2d*sv*sd*bc03sc*i*
alias:          pci:v000010DEd*sv*sd*bc03sc*i*
depends:       
drm,drm_kms_helper,ttm,mxm-wmi,i2c-core,hwmon,button,wmi,video,i2c-algo-bit
intree:         Y
vermagic:       4.0.2-2-ck SMP preempt mod_unload modversions 
parm:           tv_norm:Default TV norm.
        Supported: PAL, PAL-M, PAL-N, PAL-Nc, NTSC-M, NTSC-J,
            hd480i, hd480p, hd576i, hd576p, hd720p, hd1080i.
        Default: PAL
        *NOTE* Ignored for cards with external TV encoders. (charp)
parm:           vram_pushbuf:Create DMA push buffers in VRAM (int)
parm:           nofbaccel:Disable fbcon acceleration (int)
parm:           tv_disable:Disable TV-out detection (int)
parm:           ignorelid:Ignore ACPI lid status (int)
parm:           duallink:Allow dual-link TMDS (default: enabled) (int)
parm:           pstate:enable sysfs pstate file, which will be moved in the
future (int)
parm:           config:option string to pass to driver core (charp)
parm:           debug:debug string to pass to driver core (charp)
parm:           noaccel:disable kernel/abi16 acceleration (int)
parm:           modeset:enable driver (default: auto, 0 = disabled, 1 =
enabled, 2 = headless) (int)
parm:           runpm:disable (0), force enable (1), optimus only default (-1)
(int)
parm:           agpmode:AGP mode (0 to disable AGP) (int)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1431268562.328D2AD1.7287
Date: Sun, 10 May 2015 14:36:02 +0000
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
   title="NEW - PDISP errors in logs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90388">90388</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>PDISP errors in logs
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
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
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>artafinde&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=115667" name="attach_115667" title="dmesg from a boot.">attachment 115667</a> <a href="attachment.cgi?id=115667&amp;action=edit" title="dmesg from a boot.">[details]</a></span>
dmesg from a boot.

PDISP error filling the dmesg. It's quite spammy but other than that the X
works (GDM loads fine).

Using Archlinux up to date.
~$ pacman -Qi xf86-video-nouveau
Name           : xf86-video-nouveau
Version        : 1.0.11-3
Description    : Open Source 2D acceleration driver for nVidia cards
Architecture   : x86_64
URL            : <a href="http://nouveau.freedesktop.org/">http://nouveau.freedesktop.org/</a>
Licenses       : GPL
Groups         : xorg-drivers  xorg
Provides       : None
Depends On     : libdrm  systemd  mesa-dri
Optional Deps  : None
Required By    : None
Optional For   : None
Conflicts With : xorg-server&lt;1.16  X-ABI-VIDEODRV_VERSION&lt;19 
X-ABI-VIDEODRV_VERSION&gt;=20
Replaces       : None
Installed Size : 218.00 KiB
Packager       : Laurent Carlier &lt;<a href="mailto:lordheavym&#64;gmail.com">lordheavym&#64;gmail.com</a>&gt;
Build Date     : Thu 05 Feb 2015 08:01:59 PM GMT
Install Date   : Thu 30 Apr 2015 08:09:35 PM BST
Install Reason : Explicitly installed
Install Script : Yes
Validated By   : Signature
~$ modinfo nouveau
filename:      
/lib/modules/4.0.2-2-ck/kernel/drivers/gpu/drm/nouveau/nouveau.ko.gz
license:        GPL and additional rights
description:    nVidia Riva/TNT/GeForce/Quadro/Tesla
author:         Nouveau Project
alias:          pci:v000012D2d*sv*sd*bc03sc*i*
alias:          pci:v000010DEd*sv*sd*bc03sc*i*
depends:       
drm,drm_kms_helper,ttm,mxm-wmi,i2c-core,hwmon,button,wmi,video,i2c-algo-bit
intree:         Y
vermagic:       4.0.2-2-ck SMP preempt mod_unload modversions 
parm:           tv_norm:Default TV norm.
        Supported: PAL, PAL-M, PAL-N, PAL-Nc, NTSC-M, NTSC-J,
            hd480i, hd480p, hd576i, hd576p, hd720p, hd1080i.
        Default: PAL
        *NOTE* Ignored for cards with external TV encoders. (charp)
parm:           vram_pushbuf:Create DMA push buffers in VRAM (int)
parm:           nofbaccel:Disable fbcon acceleration (int)
parm:           tv_disable:Disable TV-out detection (int)
parm:           ignorelid:Ignore ACPI lid status (int)
parm:           duallink:Allow dual-link TMDS (default: enabled) (int)
parm:           pstate:enable sysfs pstate file, which will be moved in the
future (int)
parm:           config:option string to pass to driver core (charp)
parm:           debug:debug string to pass to driver core (charp)
parm:           noaccel:disable kernel/abi16 acceleration (int)
parm:           modeset:enable driver (default: auto, 0 = disabled, 1 =
enabled, 2 = headless) (int)
parm:           runpm:disable (0), force enable (1), optimus only default (-1)
(int)
parm:           agpmode:AGP mode (0 to disable AGP) (int)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1431268562.328D2AD1.7287--

--===============1915221770==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1915221770==--
