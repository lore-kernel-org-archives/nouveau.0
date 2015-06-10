From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90871] NV30: Xfwm4 use_compositing - garbled display
Date: Wed, 10 Jun 2015 01:42:47 +0000
Message-ID: <bug-90871-8800-KuXjmJa3tE@http.bugs.freedesktop.org/>
References: <bug-90871-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0737710625=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90871-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0737710625==
Content-Type: multipart/alternative; boundary="1433875367.2b0F4e1.16820"; charset="UTF-8"


--1433875367.2b0F4e1.16820
Date: Tue, 9 Jun 2015 11:42:47 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90871

poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Severity|critical                    |major

--- Comment #5 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---

I recompiled Fedora 21 versions:

libdrm-2.4.60-1.fc22.i686
xorg-x11-server-common-1.16.3-2.fc22.i686
xorg-x11-server-Xorg-1.16.3-2.fc22.i686
xorg-x11-drv-modesetting-0.9.0-2.fc22.i686
xorg-x11-drv-nouveau-1.0.11-1.fc22.i686
mesa-dri-drivers-10.4.7-1.20150323.fc22.i686
mesa-filesystem-10.4.7-1.20150323.fc22.i686
mesa-libEGL-10.4.7-1.20150323.fc22.i686
mesa-libgbm-10.4.7-1.20150323.fc22.i686
mesa-libGL-10.4.7-1.20150323.fc22.i686
mesa-libglapi-10.4.7-1.20150323.fc22.i686
mesa-libGLES-10.4.7-1.20150323.fc22.i686

and tried once more,
but the result is the same - "analytical cubism" - with Xfwm4 GLX build
$ xfconf-query -c xfwm4 -p /general/use_compositing
true


Interestingly, in contrast to Xorg-1.17.1,
on Xorg-1.16.3 NV30 can work with 'modesetting':

[ 8.911] 
X.Org X Server 1.16.3
Release Date: 2014-12-20
[ 8.911] X Protocol Version 11, Revision 0
[ 8.911] Build Operating System: lnx 4.0.4-303.fc22.i686 
[ 8.914] Build Date: 09 June 2015  04:53:40PM
[ 8.914] Build ID: xorg-x11-server 1.16.3-2.fc22 
[ 8.914] Current version of pixman: 0.32.6
[ 8.914] (==) Log file: "/var/log/Xorg.0.log", Time: Tue Jun  9 19:36:31 2015
[ 8.915] (==) Using config directory: "/etc/X11/xorg.conf.d"
[ 8.915] (==) Using system config directory "/usr/share/X11/xorg.conf.d"
[ 8.915] (==) No Layout section.  Using the first Screen section.

[ 8.915] (==) No screen section available. Using defaults.
[ 8.915] (**) |-->Screen "Default Screen Section" (0)
[ 8.915] (**) |   |-->Monitor "<default monitor>"
[ 8.916] (==) No device specified for screen "Default Screen Section".
    Using the first device section listed.
[ 8.916] (**) |   |-->Device "NVIDIA NV34"
[ 8.916] (==) No monitor specified for screen "Default Screen Section".
    Using a default monitor configuration.
[ 8.916] (==) Automatically adding devices
[ 8.916] (==) Automatically enabling devices
[ 8.916] (==) Automatically adding GPU devices
[ 8.916] (==) ModulePath set to "/usr/lib/xorg/modules"
[ 8.916] (II) Loader magic: 0x8282740
[ 8.916] (II) Module ABI versions:
[ 8.916]     X.Org ANSI C Emulation: 0.4
[ 8.916]     X.Org Video Driver: 18.0
[ 8.916]     X.Org Server Extension : 8.0
[ 8.924] (II) xfree86: Adding drm device (/dev/dri/card0)
[ 8.929] (II) LoadModule: "glx"
[ 8.929] (II) Loading /usr/lib/xorg/modules/extensions/libglx.so
[ 8.948] (II) Module glx: vendor="X.Org Foundation"
[ 8.948]     compiled for 1.16.3, module version = 1.0.0
[ 8.948]     ABI class: X.Org Server Extension, version 8.0
[ 8.948] (==) AIGLX enabled
[ 8.948] (II) LoadModule: "modesetting"
[ 8.948] (II) Loading /usr/lib/xorg/modules/drivers/modesetting_drv.so
[ 8.948] (II) Module modesetting: vendor="X.Org Foundation"
[ 8.948]     compiled for 1.16.3, module version = 0.9.0
[ 8.948]     Module class: X.Org Video Driver
[ 8.948]     ABI class: X.Org Video Driver, version 18.0
[ 8.948] (II) modesetting: Driver for Modesetting Kernel Drivers: kms
[ 8.948] (++) using VT number 1

[ 8.949] (II) modesetting(0): using drv /dev/dri/card0
[ 8.949] (II) modesetting(0): Creating default Display subsection in Screen
section
[ 9.039] (II) modesetting(0): Output DVI-0 has no monitor section
[ 9.186] (II) modesetting(0): EDID for output DVI-0
[ 9.215] (II) modesetting(0): Output DVI-0 connected
[ 9.217] (==) modesetting(0): Backing store enabled
[ 9.217] (II) modesetting(0): RandR 1.2 enabled, ignore the following RandR
disabled message.
[ 9.238] (==) modesetting(0): DPMS enabled
[ 9.260] (--) RandR disabled
[ 9.277] (II) AIGLX: Screen 0 is not DRI2 capable
[ 9.277] (EE) AIGLX: reverting to software rendering
[ 9.295] (II) AIGLX: Loaded and initialized swrast
[ 9.295] (II) GLX: Initialized DRISWRAST GL provider for screen 0
[ 9.297] (II) modesetting(0): Damage tracking initialized
[ 9.297] (II) modesetting(0): Setting screen physical size to 370 x 277
...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1433875367.2b0F4e1.16820
Date: Tue, 9 Jun 2015 11:42:47 -0700
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:pomidorabelisima&#64;gmail.com" title="poma &lt;pomidorabelisima&#64;gmail.com&gt;"> <span class="fn">poma</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - NV30: Xfwm4 use_compositing - garbled display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90871">bug 90871</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Severity</td>
           <td>critical
           </td>
           <td>major
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - NV30: Xfwm4 use_compositing - garbled display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90871#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - NV30: Xfwm4 use_compositing - garbled display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90871">bug 90871</a>
              from <span class="vcard"><a class="email" href="mailto:pomidorabelisima&#64;gmail.com" title="poma &lt;pomidorabelisima&#64;gmail.com&gt;"> <span class="fn">poma</span></a>
</span></b>
        <pre>
I recompiled Fedora 21 versions:

libdrm-2.4.60-1.fc22.i686
xorg-x11-server-common-1.16.3-2.fc22.i686
xorg-x11-server-Xorg-1.16.3-2.fc22.i686
xorg-x11-drv-modesetting-0.9.0-2.fc22.i686
xorg-x11-drv-nouveau-1.0.11-1.fc22.i686
mesa-dri-drivers-10.4.7-1.20150323.fc22.i686
mesa-filesystem-10.4.7-1.20150323.fc22.i686
mesa-libEGL-10.4.7-1.20150323.fc22.i686
mesa-libgbm-10.4.7-1.20150323.fc22.i686
mesa-libGL-10.4.7-1.20150323.fc22.i686
mesa-libglapi-10.4.7-1.20150323.fc22.i686
mesa-libGLES-10.4.7-1.20150323.fc22.i686

and tried once more,
but the result is the same - &quot;analytical cubism&quot; - with Xfwm4 GLX build
$ xfconf-query -c xfwm4 -p /general/use_compositing
true


Interestingly, in contrast to Xorg-1.17.1,
on Xorg-1.16.3 NV30 can work with 'modesetting':

[ 8.911] 
X.Org X Server 1.16.3
Release Date: 2014-12-20
[ 8.911] X Protocol Version 11, Revision 0
[ 8.911] Build Operating System: lnx 4.0.4-303.fc22.i686 
[ 8.914] Build Date: 09 June 2015  04:53:40PM
[ 8.914] Build ID: xorg-x11-server 1.16.3-2.fc22 
[ 8.914] Current version of pixman: 0.32.6
[ 8.914] (==) Log file: &quot;/var/log/Xorg.0.log&quot;, Time: Tue Jun  9 19:36:31 2015
[ 8.915] (==) Using config directory: &quot;/etc/X11/xorg.conf.d&quot;
[ 8.915] (==) Using system config directory &quot;/usr/share/X11/xorg.conf.d&quot;
[ 8.915] (==) No Layout section.  Using the first Screen section.

[ 8.915] (==) No screen section available. Using defaults.
[ 8.915] (**) |--&gt;Screen &quot;Default Screen Section&quot; (0)
[ 8.915] (**) |   |--&gt;Monitor &quot;&lt;default monitor&gt;&quot;
[ 8.916] (==) No device specified for screen &quot;Default Screen Section&quot;.
    Using the first device section listed.
[ 8.916] (**) |   |--&gt;Device &quot;NVIDIA NV34&quot;
[ 8.916] (==) No monitor specified for screen &quot;Default Screen Section&quot;.
    Using a default monitor configuration.
[ 8.916] (==) Automatically adding devices
[ 8.916] (==) Automatically enabling devices
[ 8.916] (==) Automatically adding GPU devices
[ 8.916] (==) ModulePath set to &quot;/usr/lib/xorg/modules&quot;
[ 8.916] (II) Loader magic: 0x8282740
[ 8.916] (II) Module ABI versions:
[ 8.916]     X.Org ANSI C Emulation: 0.4
[ 8.916]     X.Org Video Driver: 18.0
[ 8.916]     X.Org Server Extension : 8.0
[ 8.924] (II) xfree86: Adding drm device (/dev/dri/card0)
[ 8.929] (II) LoadModule: &quot;glx&quot;
[ 8.929] (II) Loading /usr/lib/xorg/modules/extensions/libglx.so
[ 8.948] (II) Module glx: vendor=&quot;X.Org Foundation&quot;
[ 8.948]     compiled for 1.16.3, module version = 1.0.0
[ 8.948]     ABI class: X.Org Server Extension, version 8.0
[ 8.948] (==) AIGLX enabled
[ 8.948] (II) LoadModule: &quot;modesetting&quot;
[ 8.948] (II) Loading /usr/lib/xorg/modules/drivers/modesetting_drv.so
[ 8.948] (II) Module modesetting: vendor=&quot;X.Org Foundation&quot;
[ 8.948]     compiled for 1.16.3, module version = 0.9.0
[ 8.948]     Module class: X.Org Video Driver
[ 8.948]     ABI class: X.Org Video Driver, version 18.0
[ 8.948] (II) modesetting: Driver for Modesetting Kernel Drivers: kms
[ 8.948] (++) using VT number 1

[ 8.949] (II) modesetting(0): using drv /dev/dri/card0
[ 8.949] (II) modesetting(0): Creating default Display subsection in Screen
section
[ 9.039] (II) modesetting(0): Output DVI-0 has no monitor section
[ 9.186] (II) modesetting(0): EDID for output DVI-0
[ 9.215] (II) modesetting(0): Output DVI-0 connected
[ 9.217] (==) modesetting(0): Backing store enabled
[ 9.217] (II) modesetting(0): RandR 1.2 enabled, ignore the following RandR
disabled message.
[ 9.238] (==) modesetting(0): DPMS enabled
[ 9.260] (--) RandR disabled
[ 9.277] (II) AIGLX: Screen 0 is not DRI2 capable
[ 9.277] (EE) AIGLX: reverting to software rendering
[ 9.295] (II) AIGLX: Loaded and initialized swrast
[ 9.295] (II) GLX: Initialized DRISWRAST GL provider for screen 0
[ 9.297] (II) modesetting(0): Damage tracking initialized
[ 9.297] (II) modesetting(0): Setting screen physical size to 370 x 277
...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1433875367.2b0F4e1.16820--

--===============0737710625==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0737710625==--
