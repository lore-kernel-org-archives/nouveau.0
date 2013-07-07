From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54700] Distorted graphics (double cursor) with
 GeForce 4200Go (NV28)
Date: Sun, 07 Jul 2013 12:16:54 +0000
Message-ID: <bug-54700-8800-qbfaW6LpRB@http.bugs.freedesktop.org/>
References: <bug-54700-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0289827280=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54700-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0289827280==
Content-Type: multipart/alternative; boundary="1373199414.BBec1.5900"; charset="us-ascii"


--1373199414.BBec1.5900
Date: Sun, 7 Jul 2013 12:16:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=54700

--- Comment #4 from r.ductor-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
UPDATE: same problem with newer versions (yesterday's debian testing releases)

# uname -a
Linux majorana 3.9-1-686-pae #1 SMP Debian 3.9.6-1 i686 GNU/Linux

# aptitude show xserver-xorg-video-nouveau
Package: xserver-xorg-video-nouveau      
State: installed
Automatically installed: yes
Version: 1:1.0.8-1
Priority: optional
Section: x11
Maintainer: Debian X Strike Force <debian-x-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org>
Architecture: i386
Uncompressed Size: 479 k
Depends: libc6 (>= 2.15), libdrm-nouveau2 (>= 2.4.34), libdrm2 (>= 2.4.17),
libudev0 (>= 146), xorg-video-abi-12,
         xserver-xorg-core (>= 2:1.12.3.901)
Recommends: libgl1-mesa-dri (>= 7.11.1)
Provides: xorg-driver-video
Description: X.Org X server -- Nouveau display driver
 This driver for the X.Org X server (see xserver-xorg for a further
description) provides support for NVIDIA Riva, TNT,
 GeForce, and Quadro cards. 

# lsmod|egrep 'fb|nv'
# lsmod|egrep 'nouveau'
nouveau               631975  2 
mxm_wmi                12467  1 nouveau
wmi                    13051  2 mxm_wmi,nouveau
ttm                    52594  1 nouveau
drm_kms_helper         27237  2 ch7006,nouveau
drm                   165971  5 ttm,drm_kms_helper,ch7006,nouveau
i2c_algo_bit           12713  1 nouveau
i2c_core               19248  5 drm,drm_kms_helper,i2c_algo_bit,ch7006,nouveau
video                  17462  1 nouveau
button                 12824  1 nouveau
#

# ls /etc/X11/xorg.conf
ls: cannot access /etc/X11/xorg.conf: No such file or directory
# ls /etc/X11/xorg.conf.d
modesetting.conf-off  nouveau.conf
# cat /etc/X11/xorg.conf.d/nouveau.conf 
Section "Device"
Identifier "Device0"
Driver "nouveau"
EndSection

# cat /boot/config-`uname -r`|egrep 'FRAMEBUFFER'
CONFIG_FRAMEBUFFER_CONSOLE=y
CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y

# cat /boot/config-`uname -r`|egrep 'HW_CONSOLE_BINDING'
CONFIG_VT_HW_CONSOLE_BINDING=y

# cat /proc/fb
0 nouveaufb


MORE INFO TO BE ATTACHED.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1373199414.BBec1.5900
Date: Sun, 7 Jul 2013 12:16:54 +0000
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
   title="NEW --- - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700">bug 54700</a>
              from <span class="vcard"><a class="email" href="mailto:r.ductor&#64;gmail.com" title="r.ductor&#64;gmail.com">r.ductor&#64;gmail.com</a>
</span></b>
        <pre>UPDATE: same problem with newer versions (yesterday's debian testing releases)

# uname -a
Linux majorana 3.9-1-686-pae #1 SMP Debian 3.9.6-1 i686 GNU/Linux

# aptitude show xserver-xorg-video-nouveau
Package: xserver-xorg-video-nouveau      
State: installed
Automatically installed: yes
Version: 1:1.0.8-1
Priority: optional
Section: x11
Maintainer: Debian X Strike Force &lt;<a href="mailto:debian-x&#64;lists.debian.org">debian-x&#64;lists.debian.org</a>&gt;
Architecture: i386
Uncompressed Size: 479 k
Depends: libc6 (&gt;= 2.15), libdrm-nouveau2 (&gt;= 2.4.34), libdrm2 (&gt;= 2.4.17),
libudev0 (&gt;= 146), xorg-video-abi-12,
         xserver-xorg-core (&gt;= 2:1.12.3.901)
Recommends: libgl1-mesa-dri (&gt;= 7.11.1)
Provides: xorg-driver-video
Description: X.Org X server -- Nouveau display driver
 This driver for the X.Org X server (see xserver-xorg for a further
description) provides support for NVIDIA Riva, TNT,
 GeForce, and Quadro cards. 

# lsmod|egrep 'fb|nv'
# lsmod|egrep 'nouveau'
nouveau               631975  2 
mxm_wmi                12467  1 nouveau
wmi                    13051  2 mxm_wmi,nouveau
ttm                    52594  1 nouveau
drm_kms_helper         27237  2 ch7006,nouveau
drm                   165971  5 ttm,drm_kms_helper,ch7006,nouveau
i2c_algo_bit           12713  1 nouveau
i2c_core               19248  5 drm,drm_kms_helper,i2c_algo_bit,ch7006,nouveau
video                  17462  1 nouveau
button                 12824  1 nouveau
#

# ls /etc/X11/xorg.conf
ls: cannot access /etc/X11/xorg.conf: No such file or directory
# ls /etc/X11/xorg.conf.d
modesetting.conf-off  nouveau.conf
# cat /etc/X11/xorg.conf.d/nouveau.conf 
Section &quot;Device&quot;
Identifier &quot;Device0&quot;
Driver &quot;nouveau&quot;
EndSection

# cat /boot/config-`uname -r`|egrep 'FRAMEBUFFER'
CONFIG_FRAMEBUFFER_CONSOLE=y
CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y

# cat /boot/config-`uname -r`|egrep 'HW_CONSOLE_BINDING'
CONFIG_VT_HW_CONSOLE_BINDING=y

# cat /proc/fb
0 nouveaufb


MORE INFO TO BE ATTACHED.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1373199414.BBec1.5900--

--===============0289827280==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0289827280==--
