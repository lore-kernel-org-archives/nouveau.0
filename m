From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93629] [NVE6] complete system freeze,
 PGRAPH engine fault on channel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]
Date: Thu, 27 Oct 2016 14:39:29 +0000
Message-ID: <bug-93629-8800-3Gftkt1CGd@http.bugs.freedesktop.org/>
References: <bug-93629-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0367090509=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93629-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0367090509==
Content-Type: multipart/alternative; boundary="14775791690.Cb97DEcfD.5930";
 charset="UTF-8"


--14775791690.Cb97DEcfD.5930
Date: Thu, 27 Oct 2016 14:39:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D93629

--- Comment #34 from Martin Assarsson <martin.assarsson-rqlJWC5cqnXQT0dZR+AlfA@public.gmane.org> ---
Some days this lockup occurs multiple times.
I can log in to the machine via ssh but UI is completely locked.
Have tried to forcefully kill gdm and restart it, and successfully got it
running, but not for long.

...
Oct 27 10:56:40 martin-m4800 nm-dispatcher: req:1 'dhcp4-change' [eno1]: new
request (1 scripts)
Oct 27 10:56:40 martin-m4800 nm-dispatcher: req:1 'dhcp4-change' [eno1]: st=
art
running ordered scripts...
Oct 27 10:59:10 martin-m4800 kernel: [12589.373968] nouveau 0000:01:00.0: f=
ifo:
SCHED_ERROR 0a [CTXSW_TIMEOUT]
Oct 27 10:59:10 martin-m4800 kernel: [12589.373974] nouveau 0000:01:00.0: f=
ifo:
gr engine fault on channel 9, recovering...
...
Oct 27 15:48:30 martin-m4800 kernel: [17226.068134] nouveau 0000:01:00.0: g=
r:
TRAP ch 8 [007f5d4000 gnome-shell[1802]]
Oct 27 15:48:30 martin-m4800 kernel: [17226.068145] nouveau 0000:01:00.0: g=
r:
GPC0/PROP trap: 00000080 [ZETA_STORAGE_TYPE_MISMATCH] x =3D 1672, y =3D 56,=
 format
=3D 0, storage type =3D fe
Oct 27 15:48:35 martin-m4800 kernel: [17230.454392] nouveau 0000:01:00.0: f=
ifo:
SCHED_ERROR 0a [CTXSW_TIMEOUT]
Oct 27 15:48:35 martin-m4800 kernel: [17230.454398] nouveau 0000:01:00.0: f=
ifo:
gr engine fault on channel 9, recovering...
...
Oct 27 16:02:48 martin-m4800 wpa_supplicant[1304]: wlp5s0: Reject scan trig=
ger
since one is already pending
Oct 27 16:04:48 martin-m4800 chromium.desktop[2104]: couldn't lock 16384 by=
tes
of memory (secret_session): Cannot allocate memory
Oct 27 16:04:50 martin-m4800 minissdpd[896]: 5 new devices added
Oct 27 16:05:09 martin-m4800 kernel: [  782.928665] nouveau 0000:01:00.0: f=
ifo:
SCHED_ERROR 0a [CTXSW_TIMEOUT]
Oct 27 16:05:09 martin-m4800 kernel: [  782.928671] nouveau 0000:01:00.0: f=
ifo:
gr engine fault on channel 9, recovering...
...

Linux martin-m4800 4.7.0-1-amd64 #1 SMP Debian 4.7.8-1 (2016-10-19) x86_64
GNU/Linux
libdrm-nouveau2/testing,now 2.4.71-1 amd64 [installed,automatic]
xserver-xorg-video-nouveau/testing,now 1:1.0.13-1 amd64 [installed,automati=
c]
libegl1-mesa/testing,now 12.0.3-1 amd64 [installed,automatic]
libgl1-mesa-dev/testing,now 12.0.3-1 amd64 [installed,automatic]
libgl1-mesa-dri/testing,now 12.0.3-1 amd64 [installed,automatic]
libgl1-mesa-glx/testing,now 12.0.3-1 amd64 [installed,automatic]
libglapi-mesa/testing,now 12.0.3-1 amd64 [installed,automatic]
libgles2-mesa/testing,now 12.0.3-1 amd64 [installed,automatic]
libglu1-mesa/testing,now 9.0.0-2.1 amd64 [installed,automatic]
libglu1-mesa-dev/testing,now 9.0.0-2.1 amd64 [installed,automatic]
libwayland-egl1-mesa/testing,now 12.0.3-1 amd64 [installed,automatic]
mesa-common-dev/testing,now 12.0.3-1 amd64 [installed,automatic]
mesa-va-drivers/testing,now 12.0.3-1 amd64 [installed,automatic]
mesa-vdpau-drivers/testing,now 12.0.3-1 amd64 [installed,automatic]
libwayland-client0/testing,now 1.11.0-2 amd64 [installed,automatic]
libwayland-cursor0/testing,now 1.11.0-2 amd64 [installed,automatic]
libwayland-egl1-mesa/testing,now 12.0.3-1 amd64 [installed,automatic]
libwayland-server0/testing,now 1.11.0-2 amd64 [installed,automatic]
xwayland/testing,now 2:1.18.4-2 amd64 [installed,automatic]
gnome-shell/testing,now 3.22.1-1 amd64 [installed,automatic]

Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
LoadModule: "nv"
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (WW) Warnin=
g,
couldn't open module nv
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
UnloadModule: "nv"
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II) Unload=
ing
nv
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (EE) Failed=
 to
load module "nv" (module does not exist, 0)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
LoadModule: "modesetting"
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II) Loading
/usr/lib/xorg/modules/drivers/modesetting_drv.so
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II) Module
modesetting: vendor=3D"X.Org Foundation"
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011compiled
for 1.18.4, module version =3D 1.18.4
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011Module
class: X.Org Video Driver
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011ABI cla=
ss:
X.Org Video Driver, version 20.0
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
LoadModule: "fbdev"
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II) Loading
/usr/lib/xorg/modules/drivers/fbdev_drv.so
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II) Module
fbdev: vendor=3D"X.Org Foundation"
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011compiled
for 1.18.0, module version =3D 0.4.4
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011Module
class: X.Org Video Driver
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011ABI cla=
ss:
X.Org Video Driver, version 20.0
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
LoadModule: "vesa"
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II) Loading
/usr/lib/xorg/modules/drivers/vesa_drv.so
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II) Module
vesa: vendor=3D"X.Org Foundation"
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011compiled
for 1.18.0, module version =3D 2.3.4
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011Module
class: X.Org Video Driver
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011ABI cla=
ss:
X.Org Video Driver, version 20.0
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II) NOUVEAU
driver Date:   Tue Sep 20 00:31:06 2016 -0400
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II) NOUVEAU
driver for NVIDIA chipset families :
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011RIVA TN=
T=20=20=20
    (NV04)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011RIVA TN=
T2=20=20
    (NV05)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011GeForce=
 256
    (NV10)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011GeForce=
 2=20=20
    (NV11, NV15)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011GeForce=
 4MX
    (NV17, NV18)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011GeForce=
 3=20=20
    (NV20)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011GeForce=
 4Ti
    (NV25, NV28)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011GeForce=
 FX=20
    (NV3x)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011GeForce=
 6=20=20
    (NV4x)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011GeForce=
 7=20=20
    (G7x)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011GeForce=
 8=20=20
    (G8x)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011GeForce=
 GTX
200 (NVA0)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011GeForce=
 GTX
400 (NVC0)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
modesetting: Driver for Modesetting Kernel Drivers: kms
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II) FBDEV:
driver for framebuffer: fbdev
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II) VESA:
driver for VESA chipsets: vesa
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]:
xf86EnableIOPorts: failed to set IOPL for I/O (Operation not permitted)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II) [drm]
nouveau interface version: 1.3.1
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (WW) Falling
back to old probe method for modesetting
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (WW) Falling
back to old probe method for fbdev
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II) Loading
sub module "fbdevhw"
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
LoadModule: "fbdevhw"
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II) Loading
/usr/lib/xorg/modules/libfbdevhw.so
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II) Module
fbdevhw: vendor=3D"X.Org Foundation"
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011compiled
for 1.18.4, module version =3D 0.0.2
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011ABI cla=
ss:
X.Org Video Driver, version 20.0
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (WW) Falling
back to old probe method for vesa
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (WW) VGA
arbiter: cannot open kernel arbiter, no multi-card support
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II) Loading
sub module "dri2"
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
LoadModule: "dri2"
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II) Module
"dri2" already built-in
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (--)
NOUVEAU(0): Chipset: "NVIDIA NVE6"
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Creating default Display subsection in Screen section
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011"Default
Screen Section" for depth/fbbpp 24/32
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (=3D=3D)
NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (=3D=3D)
NOUVEAU(0): RGB weight 888
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (=3D=3D)
NOUVEAU(0): Default visual is TrueColor
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (=3D=3D)
NOUVEAU(0): Using HW cursor
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (=3D=3D)
NOUVEAU(0): Allowed maximum DRI level 2.
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (=3D=3D)
NOUVEAU(0): GLX sync to VBlank enabled.
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (=3D=3D)
NOUVEAU(0): Page flipping enabled
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (=3D=3D)
NOUVEAU(0): Swap limit set to 1 [Max allowed 2]
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (=3D=3D)
NOUVEAU(0): Page flipping synced to vblank by kernel.
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Initializing outputs ...
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Output DP-1 has no monitor section
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Output DP-2 has no monitor section
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Output eDP-1 has no monitor section
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Output DP-3 has no monitor section
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Output VGA-1 has no monitor section
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): 5 crtcs needed for screen.
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Allocated crtc nr. 0 to this screen.
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Allocated crtc nr. 1 to this screen.
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Allocated crtc nr. 2 to this screen.
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Allocated crtc nr. 3 to this screen.
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): EDID for output DP-1
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Manufacturer: DEL  Model: d01c  Serial#: 808532051
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Year: 2010  Week: 22
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): EDID Version: 1.3
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Digital Display Input
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Max Image Size [cm]: horiz.: 51  vert.: 29
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Gamma: 2.20
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): DPMS capabilities: StandBy Suspend Off
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Supported color encodings: RGB 4:4:4 YCrCb 4:4:4
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): First detailed timing is preferred mode
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): redX: 0.660 redY: 0.325   greenX: 0.217 greenY: 0.676
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): blueX: 0.146 blueY: 0.075   whiteX: 0.313 whiteY: 0.329
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Supported established timings:
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): 720x400@70Hz
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): 640x480@60Hz
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): 640x480@75Hz
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): 800x600@60Hz
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): 800x600@75Hz
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): 1024x768@60Hz
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): 1024x768@75Hz
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): 1280x1024@75Hz
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Manufacturer's mask: 0
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Supported standard timings:
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #0: hsize: 1152  vsize 864  refresh: 75  vid: 20337
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #1: hsize: 1280  vsize 1024  refresh: 60  vid: 32897
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #2: hsize: 1680  vsize 1050  refresh: 60  vid: 179
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Supported detailed timing:
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): clock: 156.8 MHz   Image Size:  510 x 290 mm
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): h_active: 2048  h_sync: 2096  h_sync_end 2128 h_blank_end 2208
h_border: 0
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): v_active: 1152  v_sync: 1155  v_sync_end 1160 v_blanking: 1185
v_border: 0
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Serial No: T940F05V018S
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Ranges: V min: 56 V max: 85 Hz, H min: 30 H max: 92 kHz, PixClo=
ck
max 175 MHz
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Monitor name: DELL SP2309W
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): EDID (in hex):
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #01100ffffffffffff0010ac1cd053383130
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #0111614010380331d78ea1855a95337ad25
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #011135054a54b00714f8180b30001010101
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #0110101010101013b3d00a0808021403020
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #0113500fe221100001a000000ff00543934
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #0113046303556303138530a000000fd0038
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #011551e5c11000a202020202020000000fc
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #0110044454c4c20535032333039570a005d
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Printing probed modes for output DP-1
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline "2048x1152"x59.9  156.75  2048 2096 2128 2208  1152 11=
55
1160 1185 +hsync -vsync (71.0 kHz eP)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline "1680x1050"x59.9  119.00  1680 1728 1760 1840  1050 10=
53
1059 1080 +hsync -vsync (64.7 kHz e)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline "1280x1024"x75.0  135.00  1280 1296 1440 1688  1024 10=
25
1028 1066 +hsync +vsync (80.0 kHz e)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline "1280x1024"x60.0  108.00  1280 1328 1440 1688  1024 10=
25
1028 1066 +hsync +vsync (64.0 kHz e)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline "1152x864"x75.0  108.00  1152 1216 1344 1600  864 865 =
868
900 +hsync +vsync (67.5 kHz e)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline "1024x768"x75.0   78.75  1024 1040 1136 1312  768 769 =
772
800 +hsync +vsync (60.0 kHz e)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184 1344  768 771 =
777
806 -hsync -vsync (48.4 kHz e)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline "800x600"x75.0   49.50  800 816 896 1056  600 601 604 =
625
+hsync +vsync (46.9 kHz e)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 968 1056  600 601 605 =
628
+hsync +vsync (37.9 kHz e)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline "640x480"x75.0   31.50  640 656 720 840  480 481 484 5=
00
-hsync -vsync (37.5 kHz e)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline "640x480"x59.9   25.18  640 656 752 800  480 490 492 5=
25
-hsync -vsync (31.5 kHz e)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline "720x400"x70.1   28.32  720 738 846 900  400 412 414 4=
49
-hsync +vsync (31.5 kHz e)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): EDID for output DP-2
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): EDID for output eDP-1
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Manufacturer: SHP  Model: 13f9  Serial#: 0
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Year: 2013  Week: 27
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): EDID Version: 1.4
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Digital Display Input
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): 8 bits per channel
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Digital interface is DisplayPort
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Max Image Size [cm]: horiz.: 35  vert.: 19
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Gamma: 2.20
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): No DPMS capabilities specified
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Supported color encodings: RGB 4:4:4 YCrCb 4:4:4
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Default color space is primary color space
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): First detailed timing is preferred mode
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Preferred mode is native pixel format and refresh rate
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): redX: 0.640 redY: 0.329   greenX: 0.300 greenY: 0.600
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): blueX: 0.149 blueY: 0.060   whiteX: 0.312 whiteY: 0.328
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Manufacturer's mask: 0
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Supported detailed timing:
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): clock: 373.2 MHz   Image Size:  346 x 194 mm
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): h_active: 3200  h_sync: 3248  h_sync_end 3280 h_blank_end 3360
h_border: 0
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): v_active: 1800  v_sync: 1803  v_sync_end 1808 v_blanking: 1852
v_border: 0
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0):  JJ74H<80>LQ156Z1
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Unknown vendor-specific block 0
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): EDID (in hex):
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #01100ffffffffffff004d10f91300000000
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #0111b170104a52313780ede50a3544c9926
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #0110f505400000001010101010101010101
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #011010101010101cd9180a0c00834703020
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #01135005ac2100000180000001000000000
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #01100000000000000000000000000fe004a
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #0114a373448804c513135365a3100000000
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #0110002410328001200000b010a202000f0
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Printing probed modes for output eDP-1
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline "3200x1800"x60.0  373.25  3200 3248 3280 3360  1800 18=
03
1808 1852 -hsync -vsync (111.1 kHz eP)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline "1920x1200"x59.9  193.25  1920 2056 2256 2592  1200 12=
03
1209 1245 -hsync +vsync (74.6 kHz)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline "1920x1080"x60.0  173.00  1920 2048 2248 2576  1080 10=
83
1088 1120 -hsync +vsync (67.2 kHz)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline "1600x1200"x59.9  161.00  1600 1712 1880 2160  1200 12=
03
1207 1245 -hsync +vsync (74.5 kHz)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline "1680x1050"x60.0  146.25  1680 1784 1960 2240  1050 10=
53
1059 1089 -hsync +vsync (65.3 kHz)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline "1400x1050"x60.0  121.75  1400 1488 1632 1864  1050 10=
53
1057 1089 -hsync +vsync (65.3 kHz)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline "1280x1024"x59.9  109.00  1280 1368 1496 1712  1024 10=
27
1034 1063 -hsync +vsync (63.7 kHz)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline "1280x960"x59.9  101.25  1280 1360 1488 1696  960 963 =
967
996 -hsync +vsync (59.7 kHz)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline "1152x864"x60.0   81.75  1152 1216 1336 1520  864 867 =
871
897 -hsync +vsync (53.8 kHz)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline "1024x768"x59.9   63.50  1024 1072 1176 1328  768 771 =
775
798 -hsync +vsync (47.8 kHz)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline "800x600"x59.9   38.25  800 832 912 1024  600 603 607 =
624
-hsync +vsync (37.4 kHz)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline "640x480"x59.4   23.75  640 664 720 800  480 483 487 5=
00
-hsync +vsync (29.7 kHz)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline "720x400"x59.6   22.25  720 744 808 896  400 403 413 4=
17
-hsync +vsync (24.8 kHz)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline "640x400"x60.0   20.00  640 664 720 800  400 403 409 4=
17
-hsync +vsync (25.0 kHz)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline "640x350"x59.8   17.50  640 664 720 800  350 353 363 3=
66
-hsync +vsync (21.9 kHz)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): EDID for output DP-3
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Manufacturer: DEL  Model: d01c  Serial#: 808470611
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Year: 2010  Week: 22
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): EDID Version: 1.3
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Digital Display Input
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Max Image Size [cm]: horiz.: 51  vert.: 29
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Gamma: 2.20
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): DPMS capabilities: StandBy Suspend Off
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Supported color encodings: RGB 4:4:4 YCrCb 4:4:4
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): First detailed timing is preferred mode
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): redX: 0.660 redY: 0.325   greenX: 0.217 greenY: 0.676
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): blueX: 0.146 blueY: 0.075   whiteX: 0.313 whiteY: 0.329
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Supported established timings:
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): 720x400@70Hz
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): 640x480@60Hz
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): 640x480@75Hz
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): 800x600@60Hz
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): 800x600@75Hz
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): 1024x768@60Hz
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): 1024x768@75Hz
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): 1280x1024@75Hz
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Manufacturer's mask: 0
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Supported standard timings:
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #0: hsize: 1152  vsize 864  refresh: 75  vid: 20337
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #1: hsize: 1280  vsize 1024  refresh: 60  vid: 32897
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #2: hsize: 1680  vsize 1050  refresh: 60  vid: 179
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Supported detailed timing:
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): clock: 156.8 MHz   Image Size:  510 x 290 mm
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): h_active: 2048  h_sync: 2096  h_sync_end 2128 h_blank_end 2208
h_border: 0
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): v_active: 1152  v_sync: 1155  v_sync_end 1160 v_blanking: 1185
v_border: 0
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Serial No: T940F05V00HS
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Ranges: V min: 56 V max: 85 Hz, H min: 30 H max: 92 kHz, PixClo=
ck
max 175 MHz
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Monitor name: DELL SP2309W
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): EDID (in hex):
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #01100ffffffffffff0010ac1cd053483030
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #0111614010380331d78ea1855a95337ad25
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #011135054a54b00714f8180b30001010101
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #0110101010101013b3d00a0808021403020
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #0113500fe221100001a000000ff00543934
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #0113046303556303048530a000000fd0038
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #011551e5c11000a202020202020000000fc
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #0110044454c4c20535032333039570a003f
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Printing probed modes for output DP-3
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline "2048x1152"x59.9  156.75  2048 2096 2128 2208  1152 11=
55
1160 1185 +hsync -vsync (71.0 kHz eP)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline "1680x1050"x59.9  119.00  1680 1728 1760 1840  1050 10=
53
1059 1080 +hsync -vsync (64.7 kHz e)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline "1280x1024"x75.0  135.00  1280 1296 1440 1688  1024 10=
25
1028 1066 +hsync +vsync (80.0 kHz e)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline "1280x1024"x60.0  108.00  1280 1328 1440 1688  1024 10=
25
1028 1066 +hsync +vsync (64.0 kHz e)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline "1152x864"x75.0  108.00  1152 1216 1344 1600  864 865 =
868
900 +hsync +vsync (67.5 kHz e)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline "1024x768"x75.0   78.75  1024 1040 1136 1312  768 769 =
772
800 +hsync +vsync (60.0 kHz e)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184 1344  768 771 =
777
806 -hsync -vsync (48.4 kHz e)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline "800x600"x75.0   49.50  800 816 896 1056  600 601 604 =
625
+hsync +vsync (46.9 kHz e)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 968 1056  600 601 605 =
628
+hsync +vsync (37.9 kHz e)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline "640x480"x75.0   31.50  640 656 720 840  480 481 484 5=
00
-hsync -vsync (37.5 kHz e)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline "640x480"x59.9   25.18  640 656 752 800  480 490 492 5=
25
-hsync -vsync (31.5 kHz e)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline "720x400"x70.1   28.32  720 738 846 900  400 412 414 4=
49
-hsync +vsync (31.5 kHz e)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): EDID for output VGA-1
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Output DP-1 connected
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Output DP-2 disconnected
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Output eDP-1 connected
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Output DP-3 connected
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Output VGA-1 disconnected
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Using spanning desktop for initial modes
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Output DP-1 using initial mode 2048x1152 +0+0
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Output eDP-1 using initial mode 3200x1800 +2048+0
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Output DP-3 using initial mode 2048x1152 +5248+0
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Using default gamma of (1.0, 1.0, 1.0) unless otherwise stated.
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (--)
NOUVEAU(0): Virtual size is 7296x1800 (pitch 0)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (**)
NOUVEAU(0):  Driver mode "2048x1152": 156.8 MHz (scaled from 0.0 MHz), 71.0
kHz, 59.9 Hz
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline "2048x1152"x59.9  156.75  2048 2096 2128 2208  1152 11=
55
1160 1185 +hsync -vsync (71.0 kHz eP)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (**)
NOUVEAU(0):  Driver mode "1680x1050": 119.0 MHz (scaled from 0.0 MHz), 64.7
kHz, 59.9 Hz
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline "1680x1050"x59.9  119.00  1680 1728 1760 1840  1050 10=
53
1059 1080 +hsync -vsync (64.7 kHz e)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (**)
NOUVEAU(0):  Driver mode "1280x1024": 135.0 MHz (scaled from 0.0 MHz), 80.0
kHz, 75.0 Hz
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline "1280x1024"x75.0  135.00  1280 1296 1440 1688  1024 10=
25
1028 1066 +hsync +vsync (80.0 kHz e)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (**)
NOUVEAU(0):  Driver mode "1280x1024": 108.0 MHz (scaled from 0.0 MHz), 64.0
kHz, 60.0 Hz
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline "1280x1024"x60.0  108.00  1280 1328 1440 1688  1024 10=
25
1028 1066 +hsync +vsync (64.0 kHz e)
...

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14775791690.Cb97DEcfD.5930
Date: Thu, 27 Oct 2016 14:39:29 +0000
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
          bz_status_NEW "
   title=3D"NEW - [NVE6] complete system freeze, PGRAPH engine fault on cha=
nnel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93629#c34">Commen=
t # 34</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE6] complete system freeze, PGRAPH engine fault on cha=
nnel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93629">bug 93629<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
martin.assarsson&#64;tiunda.com" title=3D"Martin Assarsson &lt;martin.assar=
sson&#64;tiunda.com&gt;"> <span class=3D"fn">Martin Assarsson</span></a>
</span></b>
        <pre>Some days this lockup occurs multiple times.
I can log in to the machine via ssh but UI is completely locked.
Have tried to forcefully kill gdm and restart it, and successfully got it
running, but not for long.

...
Oct 27 10:56:40 martin-m4800 nm-dispatcher: req:1 'dhcp4-change' [eno1]: new
request (1 scripts)
Oct 27 10:56:40 martin-m4800 nm-dispatcher: req:1 'dhcp4-change' [eno1]: st=
art
running ordered scripts...
Oct 27 10:59:10 martin-m4800 kernel: [12589.373968] nouveau 0000:01:00.0: f=
ifo:
SCHED_ERROR 0a [CTXSW_TIMEOUT]
Oct 27 10:59:10 martin-m4800 kernel: [12589.373974] nouveau 0000:01:00.0: f=
ifo:
gr engine fault on channel 9, recovering...
...
Oct 27 15:48:30 martin-m4800 kernel: [17226.068134] nouveau 0000:01:00.0: g=
r:
TRAP ch 8 [007f5d4000 gnome-shell[1802]]
Oct 27 15:48:30 martin-m4800 kernel: [17226.068145] nouveau 0000:01:00.0: g=
r:
GPC0/PROP trap: 00000080 [ZETA_STORAGE_TYPE_MISMATCH] x =3D 1672, y =3D 56,=
 format
=3D 0, storage type =3D fe
Oct 27 15:48:35 martin-m4800 kernel: [17230.454392] nouveau 0000:01:00.0: f=
ifo:
SCHED_ERROR 0a [CTXSW_TIMEOUT]
Oct 27 15:48:35 martin-m4800 kernel: [17230.454398] nouveau 0000:01:00.0: f=
ifo:
gr engine fault on channel 9, recovering...
...
Oct 27 16:02:48 martin-m4800 wpa_supplicant[1304]: wlp5s0: Reject scan trig=
ger
since one is already pending
Oct 27 16:04:48 martin-m4800 chromium.desktop[2104]: couldn't lock 16384 by=
tes
of memory (secret_session): Cannot allocate memory
Oct 27 16:04:50 martin-m4800 minissdpd[896]: 5 new devices added
Oct 27 16:05:09 martin-m4800 kernel: [  782.928665] nouveau 0000:01:00.0: f=
ifo:
SCHED_ERROR 0a [CTXSW_TIMEOUT]
Oct 27 16:05:09 martin-m4800 kernel: [  782.928671] nouveau 0000:01:00.0: f=
ifo:
gr engine fault on channel 9, recovering...
...

Linux martin-m4800 4.7.0-1-amd64 #1 SMP Debian 4.7.8-1 (2016-10-19) x86_64
GNU/Linux
libdrm-nouveau2/testing,now 2.4.71-1 amd64 [installed,automatic]
xserver-xorg-video-nouveau/testing,now 1:1.0.13-1 amd64 [installed,automati=
c]
libegl1-mesa/testing,now 12.0.3-1 amd64 [installed,automatic]
libgl1-mesa-dev/testing,now 12.0.3-1 amd64 [installed,automatic]
libgl1-mesa-dri/testing,now 12.0.3-1 amd64 [installed,automatic]
libgl1-mesa-glx/testing,now 12.0.3-1 amd64 [installed,automatic]
libglapi-mesa/testing,now 12.0.3-1 amd64 [installed,automatic]
libgles2-mesa/testing,now 12.0.3-1 amd64 [installed,automatic]
libglu1-mesa/testing,now 9.0.0-2.1 amd64 [installed,automatic]
libglu1-mesa-dev/testing,now 9.0.0-2.1 amd64 [installed,automatic]
libwayland-egl1-mesa/testing,now 12.0.3-1 amd64 [installed,automatic]
mesa-common-dev/testing,now 12.0.3-1 amd64 [installed,automatic]
mesa-va-drivers/testing,now 12.0.3-1 amd64 [installed,automatic]
mesa-vdpau-drivers/testing,now 12.0.3-1 amd64 [installed,automatic]
libwayland-client0/testing,now 1.11.0-2 amd64 [installed,automatic]
libwayland-cursor0/testing,now 1.11.0-2 amd64 [installed,automatic]
libwayland-egl1-mesa/testing,now 12.0.3-1 amd64 [installed,automatic]
libwayland-server0/testing,now 1.11.0-2 amd64 [installed,automatic]
xwayland/testing,now 2:1.18.4-2 amd64 [installed,automatic]
gnome-shell/testing,now 3.22.1-1 amd64 [installed,automatic]

Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
LoadModule: &quot;nv&quot;
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (WW) Warnin=
g,
couldn't open module nv
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
UnloadModule: &quot;nv&quot;
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II) Unload=
ing
nv
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (EE) Failed=
 to
load module &quot;nv&quot; (module does not exist, 0)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
LoadModule: &quot;modesetting&quot;
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II) Loading
/usr/lib/xorg/modules/drivers/modesetting_drv.so
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II) Module
modesetting: vendor=3D&quot;X.Org Foundation&quot;
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011compiled
for 1.18.4, module version =3D 1.18.4
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011Module
class: X.Org Video Driver
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011ABI cla=
ss:
X.Org Video Driver, version 20.0
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
LoadModule: &quot;fbdev&quot;
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II) Loading
/usr/lib/xorg/modules/drivers/fbdev_drv.so
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II) Module
fbdev: vendor=3D&quot;X.Org Foundation&quot;
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011compiled
for 1.18.0, module version =3D 0.4.4
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011Module
class: X.Org Video Driver
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011ABI cla=
ss:
X.Org Video Driver, version 20.0
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
LoadModule: &quot;vesa&quot;
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II) Loading
/usr/lib/xorg/modules/drivers/vesa_drv.so
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II) Module
vesa: vendor=3D&quot;X.Org Foundation&quot;
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011compiled
for 1.18.0, module version =3D 2.3.4
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011Module
class: X.Org Video Driver
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011ABI cla=
ss:
X.Org Video Driver, version 20.0
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II) NOUVEAU
driver Date:   Tue Sep 20 00:31:06 2016 -0400
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II) NOUVEAU
driver for NVIDIA chipset families :
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011RIVA TN=
T=20=20=20
    (NV04)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011RIVA TN=
T2=20=20
    (NV05)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011GeForce=
 256
    (NV10)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011GeForce=
 2=20=20
    (NV11, NV15)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011GeForce=
 4MX
    (NV17, NV18)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011GeForce=
 3=20=20
    (NV20)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011GeForce=
 4Ti
    (NV25, NV28)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011GeForce=
 FX=20
    (NV3x)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011GeForce=
 6=20=20
    (NV4x)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011GeForce=
 7=20=20
    (G7x)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011GeForce=
 8=20=20
    (G8x)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011GeForce=
 GTX
200 (NVA0)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011GeForce=
 GTX
400 (NVC0)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
modesetting: Driver for Modesetting Kernel Drivers: kms
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II) FBDEV:
driver for framebuffer: fbdev
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II) VESA:
driver for VESA chipsets: vesa
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]:
xf86EnableIOPorts: failed to set IOPL for I/O (Operation not permitted)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II) [drm]
nouveau interface version: 1.3.1
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (WW) Falling
back to old probe method for modesetting
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (WW) Falling
back to old probe method for fbdev
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II) Loading
sub module &quot;fbdevhw&quot;
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
LoadModule: &quot;fbdevhw&quot;
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II) Loading
/usr/lib/xorg/modules/libfbdevhw.so
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II) Module
fbdevhw: vendor=3D&quot;X.Org Foundation&quot;
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011compiled
for 1.18.4, module version =3D 0.0.2
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011ABI cla=
ss:
X.Org Video Driver, version 20.0
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (WW) Falling
back to old probe method for vesa
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (WW) VGA
arbiter: cannot open kernel arbiter, no multi-card support
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II) Loading
sub module &quot;dri2&quot;
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
LoadModule: &quot;dri2&quot;
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II) Module
&quot;dri2&quot; already built-in
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (--)
NOUVEAU(0): Chipset: &quot;NVIDIA NVE6&quot;
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Creating default Display subsection in Screen section
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: #011&quot;D=
efault
Screen Section&quot; for depth/fbbpp 24/32
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (=3D=3D)
NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (=3D=3D)
NOUVEAU(0): RGB weight 888
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (=3D=3D)
NOUVEAU(0): Default visual is TrueColor
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (=3D=3D)
NOUVEAU(0): Using HW cursor
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (=3D=3D)
NOUVEAU(0): Allowed maximum DRI level 2.
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (=3D=3D)
NOUVEAU(0): GLX sync to VBlank enabled.
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (=3D=3D)
NOUVEAU(0): Page flipping enabled
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (=3D=3D)
NOUVEAU(0): Swap limit set to 1 [Max allowed 2]
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (=3D=3D)
NOUVEAU(0): Page flipping synced to vblank by kernel.
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Initializing outputs ...
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Output DP-1 has no monitor section
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Output DP-2 has no monitor section
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Output eDP-1 has no monitor section
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Output DP-3 has no monitor section
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Output VGA-1 has no monitor section
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): 5 crtcs needed for screen.
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Allocated crtc nr. 0 to this screen.
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Allocated crtc nr. 1 to this screen.
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Allocated crtc nr. 2 to this screen.
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Allocated crtc nr. 3 to this screen.
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): EDID for output DP-1
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Manufacturer: DEL  Model: d01c  Serial#: 808532051
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Year: 2010  Week: 22
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): EDID Version: 1.3
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Digital Display Input
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Max Image Size [cm]: horiz.: 51  vert.: 29
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Gamma: 2.20
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): DPMS capabilities: StandBy Suspend Off
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Supported color encodings: RGB 4:4:4 YCrCb 4:4:4
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): First detailed timing is preferred mode
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): redX: 0.660 redY: 0.325   greenX: 0.217 greenY: 0.676
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): blueX: 0.146 blueY: 0.075   whiteX: 0.313 whiteY: 0.329
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Supported established timings:
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): 720x400&#64;70Hz
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): 640x480&#64;60Hz
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): 640x480&#64;75Hz
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): 800x600&#64;60Hz
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): 800x600&#64;75Hz
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): 1024x768&#64;60Hz
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): 1024x768&#64;75Hz
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): 1280x1024&#64;75Hz
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Manufacturer's mask: 0
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Supported standard timings:
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #0: hsize: 1152  vsize 864  refresh: 75  vid: 20337
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #1: hsize: 1280  vsize 1024  refresh: 60  vid: 32897
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #2: hsize: 1680  vsize 1050  refresh: 60  vid: 179
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Supported detailed timing:
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): clock: 156.8 MHz   Image Size:  510 x 290 mm
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): h_active: 2048  h_sync: 2096  h_sync_end 2128 h_blank_end 2208
h_border: 0
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): v_active: 1152  v_sync: 1155  v_sync_end 1160 v_blanking: 1185
v_border: 0
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Serial No: T940F05V018S
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Ranges: V min: 56 V max: 85 Hz, H min: 30 H max: 92 kHz, PixClo=
ck
max 175 MHz
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Monitor name: DELL SP2309W
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): EDID (in hex):
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #01100ffffffffffff0010ac1cd053383130
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #0111614010380331d78ea1855a95337ad25
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #011135054a54b00714f8180b30001010101
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #0110101010101013b3d00a0808021403020
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #0113500fe221100001a000000ff00543934
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #0113046303556303138530a000000fd0038
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #011551e5c11000a202020202020000000fc
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #0110044454c4c20535032333039570a005d
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Printing probed modes for output DP-1
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline &quot;2048x1152&quot;x59.9  156.75  2048 2096 2128 220=
8  1152 1155
1160 1185 +hsync -vsync (71.0 kHz eP)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline &quot;1680x1050&quot;x59.9  119.00  1680 1728 1760 184=
0  1050 1053
1059 1080 +hsync -vsync (64.7 kHz e)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline &quot;1280x1024&quot;x75.0  135.00  1280 1296 1440 168=
8  1024 1025
1028 1066 +hsync +vsync (80.0 kHz e)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline &quot;1280x1024&quot;x60.0  108.00  1280 1328 1440 168=
8  1024 1025
1028 1066 +hsync +vsync (64.0 kHz e)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline &quot;1152x864&quot;x75.0  108.00  1152 1216 1344 1600=
  864 865 868
900 +hsync +vsync (67.5 kHz e)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline &quot;1024x768&quot;x75.0   78.75  1024 1040 1136 1312=
  768 769 772
800 +hsync +vsync (60.0 kHz e)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline &quot;1024x768&quot;x60.0   65.00  1024 1048 1184 1344=
  768 771 777
806 -hsync -vsync (48.4 kHz e)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline &quot;800x600&quot;x75.0   49.50  800 816 896 1056  60=
0 601 604 625
+hsync +vsync (46.9 kHz e)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline &quot;800x600&quot;x60.3   40.00  800 840 968 1056  60=
0 601 605 628
+hsync +vsync (37.9 kHz e)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline &quot;640x480&quot;x75.0   31.50  640 656 720 840  480=
 481 484 500
-hsync -vsync (37.5 kHz e)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline &quot;640x480&quot;x59.9   25.18  640 656 752 800  480=
 490 492 525
-hsync -vsync (31.5 kHz e)
Oct 27 11:02:00 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline &quot;720x400&quot;x70.1   28.32  720 738 846 900  400=
 412 414 449
-hsync +vsync (31.5 kHz e)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): EDID for output DP-2
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): EDID for output eDP-1
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Manufacturer: SHP  Model: 13f9  Serial#: 0
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Year: 2013  Week: 27
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): EDID Version: 1.4
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Digital Display Input
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): 8 bits per channel
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Digital interface is DisplayPort
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Max Image Size [cm]: horiz.: 35  vert.: 19
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Gamma: 2.20
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): No DPMS capabilities specified
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Supported color encodings: RGB 4:4:4 YCrCb 4:4:4
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Default color space is primary color space
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): First detailed timing is preferred mode
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Preferred mode is native pixel format and refresh rate
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): redX: 0.640 redY: 0.329   greenX: 0.300 greenY: 0.600
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): blueX: 0.149 blueY: 0.060   whiteX: 0.312 whiteY: 0.328
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Manufacturer's mask: 0
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Supported detailed timing:
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): clock: 373.2 MHz   Image Size:  346 x 194 mm
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): h_active: 3200  h_sync: 3248  h_sync_end 3280 h_blank_end 3360
h_border: 0
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): v_active: 1800  v_sync: 1803  v_sync_end 1808 v_blanking: 1852
v_border: 0
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0):  JJ74H&lt;80&gt;LQ156Z1
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Unknown vendor-specific block 0
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): EDID (in hex):
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #01100ffffffffffff004d10f91300000000
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #0111b170104a52313780ede50a3544c9926
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #0110f505400000001010101010101010101
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #011010101010101cd9180a0c00834703020
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #01135005ac2100000180000001000000000
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #01100000000000000000000000000fe004a
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #0114a373448804c513135365a3100000000
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #0110002410328001200000b010a202000f0
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Printing probed modes for output eDP-1
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline &quot;3200x1800&quot;x60.0  373.25  3200 3248 3280 336=
0  1800 1803
1808 1852 -hsync -vsync (111.1 kHz eP)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline &quot;1920x1200&quot;x59.9  193.25  1920 2056 2256 259=
2  1200 1203
1209 1245 -hsync +vsync (74.6 kHz)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline &quot;1920x1080&quot;x60.0  173.00  1920 2048 2248 257=
6  1080 1083
1088 1120 -hsync +vsync (67.2 kHz)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline &quot;1600x1200&quot;x59.9  161.00  1600 1712 1880 216=
0  1200 1203
1207 1245 -hsync +vsync (74.5 kHz)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline &quot;1680x1050&quot;x60.0  146.25  1680 1784 1960 224=
0  1050 1053
1059 1089 -hsync +vsync (65.3 kHz)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline &quot;1400x1050&quot;x60.0  121.75  1400 1488 1632 186=
4  1050 1053
1057 1089 -hsync +vsync (65.3 kHz)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline &quot;1280x1024&quot;x59.9  109.00  1280 1368 1496 171=
2  1024 1027
1034 1063 -hsync +vsync (63.7 kHz)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline &quot;1280x960&quot;x59.9  101.25  1280 1360 1488 1696=
  960 963 967
996 -hsync +vsync (59.7 kHz)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline &quot;1152x864&quot;x60.0   81.75  1152 1216 1336 1520=
  864 867 871
897 -hsync +vsync (53.8 kHz)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline &quot;1024x768&quot;x59.9   63.50  1024 1072 1176 1328=
  768 771 775
798 -hsync +vsync (47.8 kHz)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline &quot;800x600&quot;x59.9   38.25  800 832 912 1024  60=
0 603 607 624
-hsync +vsync (37.4 kHz)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline &quot;640x480&quot;x59.4   23.75  640 664 720 800  480=
 483 487 500
-hsync +vsync (29.7 kHz)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline &quot;720x400&quot;x59.6   22.25  720 744 808 896  400=
 403 413 417
-hsync +vsync (24.8 kHz)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline &quot;640x400&quot;x60.0   20.00  640 664 720 800  400=
 403 409 417
-hsync +vsync (25.0 kHz)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline &quot;640x350&quot;x59.8   17.50  640 664 720 800  350=
 353 363 366
-hsync +vsync (21.9 kHz)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): EDID for output DP-3
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Manufacturer: DEL  Model: d01c  Serial#: 808470611
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Year: 2010  Week: 22
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): EDID Version: 1.3
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Digital Display Input
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Max Image Size [cm]: horiz.: 51  vert.: 29
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Gamma: 2.20
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): DPMS capabilities: StandBy Suspend Off
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Supported color encodings: RGB 4:4:4 YCrCb 4:4:4
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): First detailed timing is preferred mode
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): redX: 0.660 redY: 0.325   greenX: 0.217 greenY: 0.676
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): blueX: 0.146 blueY: 0.075   whiteX: 0.313 whiteY: 0.329
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Supported established timings:
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): 720x400&#64;70Hz
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): 640x480&#64;60Hz
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): 640x480&#64;75Hz
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): 800x600&#64;60Hz
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): 800x600&#64;75Hz
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): 1024x768&#64;60Hz
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): 1024x768&#64;75Hz
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): 1280x1024&#64;75Hz
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Manufacturer's mask: 0
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Supported standard timings:
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #0: hsize: 1152  vsize 864  refresh: 75  vid: 20337
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #1: hsize: 1280  vsize 1024  refresh: 60  vid: 32897
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #2: hsize: 1680  vsize 1050  refresh: 60  vid: 179
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Supported detailed timing:
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): clock: 156.8 MHz   Image Size:  510 x 290 mm
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): h_active: 2048  h_sync: 2096  h_sync_end 2128 h_blank_end 2208
h_border: 0
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): v_active: 1152  v_sync: 1155  v_sync_end 1160 v_blanking: 1185
v_border: 0
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Serial No: T940F05V00HS
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Ranges: V min: 56 V max: 85 Hz, H min: 30 H max: 92 kHz, PixClo=
ck
max 175 MHz
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Monitor name: DELL SP2309W
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): EDID (in hex):
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #01100ffffffffffff0010ac1cd053483030
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #0111614010380331d78ea1855a95337ad25
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #011135054a54b00714f8180b30001010101
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #0110101010101013b3d00a0808021403020
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #0113500fe221100001a000000ff00543934
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #0113046303556303048530a000000fd0038
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #011551e5c11000a202020202020000000fc
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): #0110044454c4c20535032333039570a003f
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Printing probed modes for output DP-3
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline &quot;2048x1152&quot;x59.9  156.75  2048 2096 2128 220=
8  1152 1155
1160 1185 +hsync -vsync (71.0 kHz eP)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline &quot;1680x1050&quot;x59.9  119.00  1680 1728 1760 184=
0  1050 1053
1059 1080 +hsync -vsync (64.7 kHz e)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline &quot;1280x1024&quot;x75.0  135.00  1280 1296 1440 168=
8  1024 1025
1028 1066 +hsync +vsync (80.0 kHz e)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline &quot;1280x1024&quot;x60.0  108.00  1280 1328 1440 168=
8  1024 1025
1028 1066 +hsync +vsync (64.0 kHz e)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline &quot;1152x864&quot;x75.0  108.00  1152 1216 1344 1600=
  864 865 868
900 +hsync +vsync (67.5 kHz e)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline &quot;1024x768&quot;x75.0   78.75  1024 1040 1136 1312=
  768 769 772
800 +hsync +vsync (60.0 kHz e)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline &quot;1024x768&quot;x60.0   65.00  1024 1048 1184 1344=
  768 771 777
806 -hsync -vsync (48.4 kHz e)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline &quot;800x600&quot;x75.0   49.50  800 816 896 1056  60=
0 601 604 625
+hsync +vsync (46.9 kHz e)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline &quot;800x600&quot;x60.3   40.00  800 840 968 1056  60=
0 601 605 628
+hsync +vsync (37.9 kHz e)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline &quot;640x480&quot;x75.0   31.50  640 656 720 840  480=
 481 484 500
-hsync -vsync (37.5 kHz e)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline &quot;640x480&quot;x59.9   25.18  640 656 752 800  480=
 490 492 525
-hsync -vsync (31.5 kHz e)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline &quot;720x400&quot;x70.1   28.32  720 738 846 900  400=
 412 414 449
-hsync +vsync (31.5 kHz e)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): EDID for output VGA-1
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Output DP-1 connected
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Output DP-2 disconnected
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Output eDP-1 connected
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Output DP-3 connected
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Output VGA-1 disconnected
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Using spanning desktop for initial modes
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Output DP-1 using initial mode 2048x1152 +0+0
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Output eDP-1 using initial mode 3200x1800 +2048+0
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Output DP-3 using initial mode 2048x1152 +5248+0
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Using default gamma of (1.0, 1.0, 1.0) unless otherwise stated.
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (--)
NOUVEAU(0): Virtual size is 7296x1800 (pitch 0)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (**)
NOUVEAU(0):  Driver mode &quot;2048x1152&quot;: 156.8 MHz (scaled from 0.0 =
MHz), 71.0
kHz, 59.9 Hz
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline &quot;2048x1152&quot;x59.9  156.75  2048 2096 2128 220=
8  1152 1155
1160 1185 +hsync -vsync (71.0 kHz eP)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (**)
NOUVEAU(0):  Driver mode &quot;1680x1050&quot;: 119.0 MHz (scaled from 0.0 =
MHz), 64.7
kHz, 59.9 Hz
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline &quot;1680x1050&quot;x59.9  119.00  1680 1728 1760 184=
0  1050 1053
1059 1080 +hsync -vsync (64.7 kHz e)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (**)
NOUVEAU(0):  Driver mode &quot;1280x1024&quot;: 135.0 MHz (scaled from 0.0 =
MHz), 80.0
kHz, 75.0 Hz
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline &quot;1280x1024&quot;x75.0  135.00  1280 1296 1440 168=
8  1024 1025
1028 1066 +hsync +vsync (80.0 kHz e)
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (**)
NOUVEAU(0):  Driver mode &quot;1280x1024&quot;: 108.0 MHz (scaled from 0.0 =
MHz), 64.0
kHz, 60.0 Hz
Oct 27 11:02:01 martin-m4800 /usr/lib/gdm3/gdm-x-session[1713]: (II)
NOUVEAU(0): Modeline &quot;1280x1024&quot;x60.0  108.00  1280 1328 1440 168=
8  1024 1025
1028 1066 +hsync +vsync (64.0 kHz e)
...</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14775791690.Cb97DEcfD.5930--

--===============0367090509==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0367090509==--
