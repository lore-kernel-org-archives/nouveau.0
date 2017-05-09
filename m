From: Vincent Vanackere <vincent.vanackere-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: GT 730 freeze : how do diagnose / debug ?
Date: Tue, 9 May 2017 09:50:51 +0200
Message-ID: <CAMpZLrjkOynp1QBedi96MEzROZRSaFBV4ae642yHTv5c_ay5BQ@mail.gmail.com>
References: <CAMpZLrg3G7SYUDzXbzug9y98K_KmkQTwPMc2OWjnuxCicR6Uhw@mail.gmail.com>
 <CAKb7UvhvmcmirvgeJEVw4pdiumgWav7m8ZT4d09k4UMnb4p9fg@mail.gmail.com>
 <126fd102-0eac-5317-edd9-b1ade2524e22@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0524731156=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <126fd102-0eac-5317-edd9-b1ade2524e22-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============0524731156==
Content-Type: multipart/alternative; boundary=001a114054d42ff35e054f129f95

--001a114054d42ff35e054f129f95
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Some additional data:
- putting LIBGL_ALWAYS_SOFTWARE=3D1 in /etc/environment makes indeed the
system work (for my current usage, the slowness is acceptable in exchange
of stabillity)
- I still get lock-up using mesa from git (17.2~git1705081930.25d2 from
this repository
https://launchpad.net/~oibaf/+archive/ubuntu/graphics-drivers)

I have another question (probably Ben Skeggs could also give an advice ?):
I see there are a lot more mesa variables that can be set (
https://www.mesa3d.org/envvars.html). Are there some other variables that I
could set in order to either partially enable hardware acceleration or
(better) to get a diagnostic of what the driver is doing that is causing
the graphic card to hang ?

Thanks for your help !

Vincent

2017-05-08 13:50 GMT+02:00 Vincent Vanackere <vincent.vanackere-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:

> On 07/05/2017 23:50, Ilia Mirkin wrote:
> > You have two issues:
> >
> > (a) nouveau's GL driver messed something up, causing a read fault error
> > (b) nouveau's kernel driver tried to recover. It failed.
> >
> > Solution to #1: None, really. You can try updating mesa, and hope it
> > helps. Not sure what version you're on.
>
> Here's my packages version:
>
> ii  libegl1-mesa:amd64              17.0.3-1ubuntu1                amd64
>       free implementation of the EGL API -- runtime
> ii  libegl1-mesa-dev:amd64          17.0.3-1ubuntu1                amd64
>       free implementation of the EGL API -- development files
> ii  libgl1-mesa-dev:amd64           17.0.3-1ubuntu1                amd64
>       free implementation of the OpenGL API -- GLX development files
> ii  libgl1-mesa-dri:amd64           17.0.3-1ubuntu1                amd64
>       free implementation of the OpenGL API -- DRI modules
> ii  libgl1-mesa-glx:amd64           17.0.3-1ubuntu1                amd64
>       free implementation of the OpenGL API -- GLX runtime
> ii  libglapi-mesa:amd64             17.0.3-1ubuntu1                amd64
>       free implementation of the GL API -- shared library
> ii  libgles2-mesa:amd64             17.0.3-1ubuntu1                amd64
>       free implementation of the OpenGL|ES 2.x API -- runtime
> ii  libglu1-mesa:amd64              9.0.0-2.1build1                amd64
>       Mesa OpenGL utility library (GLU)
> ii  libglu1-mesa-dev:amd64          9.0.0-2.1build1                amd64
>       Mesa OpenGL utility library -- development files
> ii  libwayland-egl1-mesa:amd64      17.0.3-1ubuntu1                amd64
>       implementation of the Wayland EGL platform -- runtime
> ii  mesa-common-dev:amd64           17.0.3-1ubuntu1                amd64
>       Developer documentation for Mesa
> ii  mesa-utils                      8.3.0-4                        amd64
>       Miscellaneous Mesa GL utilities
> ii  mesa-vdpau-drivers:amd64        17.0.3-1ubuntu1                amd64
>       Mesa VDPAU video acceleration drivers
>
>
> I'll try compiling a newer version from git to see if it helps...
>
> > Solution to #2: Ben Skeggs will hopefully have something clever to
> > say. The recovery logic was recently beefed up considerably, so the
> > fact that you even got that far is already a good start.
> >
> > If you're looking for a stable experience with Xorg, I recommend using
> > xf86-video-nouveau -- it's been extensively battle-tested, and is
> > quite simple logic; I also recommend against anything that uses GL on
> > an ongoing basis (which, sadly, everyone thinks is the coolest thing
> > to do these days). If you're looking for a stable experience with a
> > GL-based Wayland compositor, you'll have to wait until either the
> > nouveau GL driver is perfect or nouveau kernel module can properly
> > recover from any screwups the GL driver makes.
>
> I'm not expecting the GL driver to be perfect ;-)
> However it would be nice if the kernel module could recover at least a bi=
t
> better from bad commands from the GL driver (indeed I've had some hard
> lockups too where I could not even connect from ssh).
>
> > You can also remove nouveau_dri.so entirely, which is a big hammer
> > against these types of issues (removes all GL-based acceleration), or
> > you can run certain key pieces of software with
> > LIBGL_ALWAYS_SOFTWARE=3D1, which will force a CPU-based GL
> > implementation.
>
> Thanks for the hint, I'll try this workaround too !
>
> Please let me know if I can do anything to improve the drivers's
> stablility (like dumping the cards's register or enabling some traces ?).
> Alternatively if you know of a fanless graphic card model that would be
> able to drive 2 monitors at 2560x1440 with proper linux support, I'm
> interested ;-)
>
> Regards
>
> > Cheers,
> >
> >   -ilia
> >
> >
> > 2017-05-07 16:03 GMT-04:00 Vincent Vanackere <
> vincent.vanackere-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> >> Hi,
> >>
> >>  I own an Asus GT730-SL-2GD3-BRK, trying to drive two monitors at
> 2560x1440
> >> resolution. Using gnome-shell with either Xorg or wayland I get screen
> >> freezes very frequently. Those freezes usually require a reboot to get
> >> working graphics (below a sample trace that I got yesterday).
> >>  I am running Ubuntu 17.04 with the latest kernels avalable, I also
> tested
> >> various more recent kernels including the latest drm tree at
> >> https://cgit.freedesktop.org/~airlied/linux/log/?h=3Ddrm-next but the
> problem
> >> always occurs.
> >>  When a freeze occurs, the computer is still reachable through ssh but
> the
> >> only action I found so far to get graphics back is to restart the
> computer.
> >>   I am willing to run diagnostics programs or test any patch if it wou=
ld
> >> help. I'm also not excluding the possibility that I may have some faul=
ty
> >> hardware so any hardwae-health-test advice would be welcome...
> >>
> >> Regards,
> >>
> >> Vincent Vanack=C3=A8re
> >>
> >> [    1.199135] nouveau 0000:01:00.0: NVIDIA GK208B (b06070b1)
> >> [    1.319930] nouveau 0000:01:00.0: bios: version 80.28.92.00.10
> >> [    1.322095] nouveau 0000:01:00.0: fb: 2048 MiB DDR3
> >> [    2.620362] nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
> >> [    2.620362] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
> >> [    2.620364] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
> >> [    2.620378] nouveau 0000:01:00.0: DRM: DCB version 4.0
> >> [    2.620379] nouveau 0000:01:00.0: DRM: DCB outp 00: 01000f02 000200=
30
> >> [    2.620380] nouveau 0000:01:00.0: DRM: DCB outp 01: 02011f62 000200=
10
> >> [    2.620380] nouveau 0000:01:00.0: DRM: DCB outp 02: 02022f10 000000=
00
> >> [    2.620381] nouveau 0000:01:00.0: DRM: DCB conn 00: 00001031
> >> [    2.620381] nouveau 0000:01:00.0: DRM: DCB conn 01: 00002161
> >> [    2.620382] nouveau 0000:01:00.0: DRM: DCB conn 02: 00000200
> >> [    2.666199] nouveau 0000:01:00.0: hwmon_device_register() is
> deprecated.
> >> Please convert the driver to use hwmon_device_register_with_info().
> >> [    2.717519] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer
> copies
> >> [    2.992994] nouveau 0000:01:00.0: DRM: allocated 2560x1440 fb:
> 0x60000,
> >> bo ffff8cd1499f8000
> >> [    3.025200] fbcon: nouveaufb (fb0) is primary device
> >> [    3.253561] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer devic=
e
> >> [    3.268163] [drm] Initialized nouveau 1.3.1 20120801 for
> 0000:01:00.0 on
> >> minor 0
> >> [ 2150.225651] nouveau 0000:01:00.0: fifo: read fault at 0006710000
> engine
> >> 00 [GR] client 02 [GPC0/PE_0] reason 02 [PTE] on channel 31 [007e8cb00=
0
> >> Xwayland[3019]]
> >> [ 2150.225662] nouveau 0000:01:00.0: fifo: channel 31: killed
> >> [ 2150.225663] nouveau 0000:01:00.0: fifo: runlist 0: scheduled for
> recovery
> >> [ 2150.225666] nouveau 0000:01:00.0: fifo: engine 0: scheduled for
> recovery
> >> [ 2150.225669] nouveau 0000:01:00.0: Xwayland[3019]: channel 31 killed=
!
> >> [ 2296.863975] Workqueue: events_unbound nv50_disp_atomic_commit_work
> >> [nouveau]
> >> [ 2296.863990]  ? nvkm_ioctl_ntfy_get+0x69/0xb0 [nouveau]
> >> [ 2296.864032]  nv50_disp_atomic_commit_tail+0x55/0x3a00 [nouveau]
> >> [ 2296.864047]  nv50_disp_atomic_commit_work+0x12/0x20 [nouveau]
> >> [ 2296.864118] Workqueue: events_unbound nv50_disp_atomic_commit_work
> >> [nouveau]
> >> [ 2296.864138]  ? nouveau_bo_rd32+0x2a/0x30 [nouveau]
> >> [ 2296.864153]  ? nv84_fence_read+0x2e/0x30 [nouveau]
> >> [ 2296.864175]  nv50_disp_atomic_commit_tail+0x55/0x3a00 [nouveau]
> >> [ 2296.864189]  nv50_disp_atomic_commit_work+0x12/0x20 [nouveau]
> >> [ 2417.699641] Workqueue: events_unbound nv50_disp_atomic_commit_work
> >> [nouveau]
> >> [ 2417.699656]  ? nvkm_ioctl_ntfy_get+0x69/0xb0 [nouveau]
> >> [ 2417.699688]  nv50_disp_atomic_commit_tail+0x55/0x3a00 [nouveau]
> >> [ 2417.699705]  nv50_disp_atomic_commit_work+0x12/0x20 [nouveau]
> >> [ 2417.699785] Workqueue: events_unbound nv50_disp_atomic_commit_work
> >> [nouveau]
> >> [ 2417.699808]  ? nouveau_bo_rd32+0x2a/0x30 [nouveau]
> >> [ 2417.699825]  ? nv84_fence_read+0x2e/0x30 [nouveau]
> >> [ 2417.699851]  nv50_disp_atomic_commit_tail+0x55/0x3a00 [nouveau]
> >> [ 2417.699867]  nv50_disp_atomic_commit_work+0x12/0x20 [nouveau]
> >> [ 2538.535424] Workqueue: events_unbound nv50_disp_atomic_commit_work
> >> [nouveau]
> >> [ 2538.535439]  ? nvkm_ioctl_ntfy_get+0x69/0xb0 [nouveau]
> >> [ 2538.535469]  nv50_disp_atomic_commit_tail+0x55/0x3a00 [nouveau]
> >> [ 2538.535485]  nv50_disp_atomic_commit_work+0x12/0x20 [nouveau]
> >> [ 2538.535555] Workqueue: events_unbound nv50_disp_atomic_commit_work
> >> [nouveau]
> >> [ 2538.535576]  ? nouveau_bo_rd32+0x2a/0x30 [nouveau]
> >> [ 2538.535591]  ? nv84_fence_read+0x2e/0x30 [nouveau]
> >> [ 2538.535614]  nv50_disp_atomic_commit_tail+0x55/0x3a00 [nouveau]
> >> [ 2538.535628]  nv50_disp_atomic_commit_work+0x12/0x20 [nouveau]
> >>
> >>
> >> _______________________________________________
> >> Nouveau mailing list
> >> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> >> https://lists.freedesktop.org/mailman/listinfo/nouveau
> >>
>
>

--001a114054d42ff35e054f129f95
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div>Some additional data:<br></div>- putti=
ng <span class=3D"gmail-">LIBGL_ALWAYS_SOFTWARE=3D1 in /etc/environment mak=
es indeed the system work (for my current usage, the slowness is acceptable=
 in exchange of stabillity)<br></span></div><span class=3D"gmail-">- I stil=
l get lock-up using mesa from git (17.2~git1705081930.25d2 from this reposi=
tory <a href=3D"https://launchpad.net/~oibaf/+archive/ubuntu/graphics-drive=
rs">https://launchpad.net/~oibaf/+archive/ubuntu/graphics-drivers</a>)<br><=
br></span></div><span class=3D"gmail-">I have another question (probably Be=
n Skeggs could also give an advice ?):</span><span class=3D"gmail-"> I see =
there are a lot more mesa variables that can be set (<a href=3D"https://www=
.mesa3d.org/envvars.html">https://www.mesa3d.org/envvars.html</a>). Are the=
re some other variables that I could set in order to either partially enabl=
e hardware acceleration or (better) to get a diagnostic of what the driver =
is doing that is causing the graphic card to hang ?</span><br><span class=
=3D"gmail-"></span></div><span class=3D"gmail-"><br></span><div><div><div><=
div><div><div><div class=3D"gmail_extra">Thanks for your help !<br><br></di=
v><div class=3D"gmail_extra">Vincent<br></div><div class=3D"gmail_extra"><b=
r><div class=3D"gmail_quote">2017-05-08 13:50 GMT+02:00 Vincent Vanackere <=
span dir=3D"ltr">&lt;<a href=3D"mailto:vincent.vanackere-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=
=3D"_blank">vincent.vanackere-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;</span>:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><span class=3D"gmail-">On 07/05/2017 23:5=
0, Ilia Mirkin wrote:<br>
&gt; You have two issues:<br>
&gt;<br>
&gt; (a) nouveau&#39;s GL driver messed something up, causing a read fault =
error<br>
&gt; (b) nouveau&#39;s kernel driver tried to recover. It failed.<br>
&gt;<br>
&gt; Solution to #1: None, really. You can try updating mesa, and hope it<b=
r>
&gt; helps. Not sure what version you&#39;re on.<br>
<br>
</span>Here&#39;s my packages version:<br>
<br>
ii=C2=A0 libegl1-mesa:amd64=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 17.0.3-1ubuntu1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 amd=
64=C2=A0 =C2=A0 =C2=A0 =C2=A0 free implementation of the EGL API -- runtime=
<br>
ii=C2=A0 libegl1-mesa-dev:amd64=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 17.0.3-1u=
buntu1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 amd64=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 free implementation of the EGL API -- development file=
s<br>
ii=C2=A0 libgl1-mesa-dev:amd64=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A017.0=
.3-1ubuntu1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 amd64=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 free implementation of the OpenGL API -- GLX devel=
opment files<br>
ii=C2=A0 libgl1-mesa-dri:amd64=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A017.0=
.3-1ubuntu1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 amd64=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 free implementation of the OpenGL API -- DRI modul=
es<br>
ii=C2=A0 libgl1-mesa-glx:amd64=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A017.0=
.3-1ubuntu1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 amd64=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 free implementation of the OpenGL API -- GLX runti=
me<br>
ii=C2=A0 libglapi-mesa:amd64=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A017.0.3-1ubuntu1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a=
md64=C2=A0 =C2=A0 =C2=A0 =C2=A0 free implementation of the GL API -- shared=
 library<br>
ii=C2=A0 libgles2-mesa:amd64=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A017.0.3-1ubuntu1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a=
md64=C2=A0 =C2=A0 =C2=A0 =C2=A0 free implementation of the OpenGL|ES 2.x AP=
I -- runtime<br>
ii=C2=A0 libglu1-mesa:amd64=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 9.0.0-2.1build1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 amd=
64=C2=A0 =C2=A0 =C2=A0 =C2=A0 Mesa OpenGL utility library (GLU)<br>
ii=C2=A0 libglu1-mesa-dev:amd64=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 9.0.0-2.1=
build1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 amd64=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 Mesa OpenGL utility library -- development files<br>
ii=C2=A0 libwayland-egl1-mesa:amd64=C2=A0 =C2=A0 =C2=A0 17.0.3-1ubuntu1=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 amd64=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 implementation of the Wayland EGL platform -- runtime<br>
ii=C2=A0 mesa-common-dev:amd64=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A017.0=
.3-1ubuntu1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 amd64=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 Developer documentation for Mesa<br>
ii=C2=A0 mesa-utils=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 8.3.0-4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 amd64=C2=A0 =C2=A0 =C2=A0 =C2=A0 Mis=
cellaneous Mesa GL utilities<br>
ii=C2=A0 mesa-vdpau-drivers:amd64=C2=A0 =C2=A0 =C2=A0 =C2=A0 17.0.3-1ubuntu=
1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 amd64=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 Mesa VDPAU video acceleration drivers<br>
<br>
<br>
I&#39;ll try compiling a newer version from git to see if it helps...<br>
<span class=3D"gmail-"><br>
&gt; Solution to #2: Ben Skeggs will hopefully have something clever to<br>
&gt; say. The recovery logic was recently beefed up considerably, so the<br=
>
&gt; fact that you even got that far is already a good start.<br>
&gt;<br>
&gt; If you&#39;re looking for a stable experience with Xorg, I recommend u=
sing<br>
&gt; xf86-video-nouveau -- it&#39;s been extensively battle-tested, and is<=
br>
&gt; quite simple logic; I also recommend against anything that uses GL on<=
br>
&gt; an ongoing basis (which, sadly, everyone thinks is the coolest thing<b=
r>
&gt; to do these days). If you&#39;re looking for a stable experience with =
a<br>
&gt; GL-based Wayland compositor, you&#39;ll have to wait until either the<=
br>
&gt; nouveau GL driver is perfect or nouveau kernel module can properly<br>
&gt; recover from any screwups the GL driver makes.<br>
<br>
</span>I&#39;m not expecting the GL driver to be perfect ;-)<br>
However it would be nice if the kernel module could recover at least a bit =
better from bad commands from the GL driver (indeed I&#39;ve had some hard =
lockups too where I could not even connect from ssh).<br>
<span class=3D"gmail-"><br>
&gt; You can also remove nouveau_dri.so entirely, which is a big hammer<br>
&gt; against these types of issues (removes all GL-based acceleration), or<=
br>
&gt; you can run certain key pieces of software with<br>
&gt; LIBGL_ALWAYS_SOFTWARE=3D1, which will force a CPU-based GL<br>
&gt; implementation.<br>
<br>
</span>Thanks for the hint, I&#39;ll try this workaround too !<br>
<br>
Please let me know if I can do anything to improve the drivers&#39;s stabli=
lity (like dumping the cards&#39;s register or enabling some traces ?).<br>
Alternatively if you know of a fanless graphic card model that would be abl=
e to drive 2 monitors at 2560x1440 with proper linux support, I&#39;m inter=
ested ;-)<br>
<br>
Regards<br>
<div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5"><br>
&gt; Cheers,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0-ilia<br>
&gt;<br>
&gt;<br>
&gt; 2017-05-07 16:03 GMT-04:00 Vincent Vanackere &lt;<a href=3D"mailto:vin=
cent.vanackere-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">vincent.vanackere-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;:<br>
&gt;&gt; Hi,<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 I own an Asus GT730-SL-2GD3-BRK, trying to drive two monitor=
s at 2560x1440<br>
&gt;&gt; resolution. Using gnome-shell with either Xorg or wayland I get sc=
reen<br>
&gt;&gt; freezes very frequently. Those freezes usually require a reboot to=
 get<br>
&gt;&gt; working graphics (below a sample trace that I got yesterday).<br>
&gt;&gt;=C2=A0 I am running Ubuntu 17.04 with the latest kernels avalable, =
I also tested<br>
&gt;&gt; various more recent kernels including the latest drm tree at<br>
&gt;&gt; <a href=3D"https://cgit.freedesktop.org/%7Eairlied/linux/log/?h=3D=
drm-next" rel=3D"noreferrer" target=3D"_blank">https://cgit.freedesktop.org=
/~<wbr>airlied/linux/log/?h=3Ddrm-next</a> but the problem<br>
&gt;&gt; always occurs.<br>
&gt;&gt;=C2=A0 When a freeze occurs, the computer is still reachable throug=
h ssh but the<br>
&gt;&gt; only action I found so far to get graphics back is to restart the =
computer.<br>
&gt;&gt;=C2=A0 =C2=A0I am willing to run diagnostics programs or test any p=
atch if it would<br>
&gt;&gt; help. I&#39;m also not excluding the possibility that I may have s=
ome faulty<br>
&gt;&gt; hardware so any hardwae-health-test advice would be welcome...<br>
&gt;&gt;<br>
&gt;&gt; Regards,<br>
&gt;&gt;<br>
&gt;&gt; Vincent Vanack=C3=A8re<br>
&gt;&gt;<br>
&gt;&gt; [=C2=A0 =C2=A0 1.199135] nouveau 0000:01:00.0: NVIDIA GK208B (b060=
70b1)<br>
&gt;&gt; [=C2=A0 =C2=A0 1.319930] nouveau 0000:01:00.0: bios: version 80.28=
.92.00.10<br>
&gt;&gt; [=C2=A0 =C2=A0 1.322095] nouveau 0000:01:00.0: fb: 2048 MiB DDR3<b=
r>
&gt;&gt; [=C2=A0 =C2=A0 2.620362] nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB=
<br>
&gt;&gt; [=C2=A0 =C2=A0 2.620362] nouveau 0000:01:00.0: DRM: GART: 1048576 =
MiB<br>
&gt;&gt; [=C2=A0 =C2=A0 2.620364] nouveau 0000:01:00.0: DRM: TMDS table ver=
sion 2.0<br>
&gt;&gt; [=C2=A0 =C2=A0 2.620378] nouveau 0000:01:00.0: DRM: DCB version 4.=
0<br>
&gt;&gt; [=C2=A0 =C2=A0 2.620379] nouveau 0000:01:00.0: DRM: DCB outp 00: 0=
1000f02 00020030<br>
&gt;&gt; [=C2=A0 =C2=A0 2.620380] nouveau 0000:01:00.0: DRM: DCB outp 01: 0=
2011f62 00020010<br>
&gt;&gt; [=C2=A0 =C2=A0 2.620380] nouveau 0000:01:00.0: DRM: DCB outp 02: 0=
2022f10 00000000<br>
&gt;&gt; [=C2=A0 =C2=A0 2.620381] nouveau 0000:01:00.0: DRM: DCB conn 00: 0=
0001031<br>
&gt;&gt; [=C2=A0 =C2=A0 2.620381] nouveau 0000:01:00.0: DRM: DCB conn 01: 0=
0002161<br>
&gt;&gt; [=C2=A0 =C2=A0 2.620382] nouveau 0000:01:00.0: DRM: DCB conn 02: 0=
0000200<br>
&gt;&gt; [=C2=A0 =C2=A0 2.666199] nouveau 0000:01:00.0: hwmon_device_regist=
er() is deprecated.<br>
&gt;&gt; Please convert the driver to use hwmon_device_register_with_<wbr>i=
nfo().<br>
&gt;&gt; [=C2=A0 =C2=A0 2.717519] nouveau 0000:01:00.0: DRM: MM: using COPY=
 for buffer copies<br>
&gt;&gt; [=C2=A0 =C2=A0 2.992994] nouveau 0000:01:00.0: DRM: allocated 2560=
x1440 fb: 0x60000,<br>
&gt;&gt; bo ffff8cd1499f8000<br>
&gt;&gt; [=C2=A0 =C2=A0 3.025200] fbcon: nouveaufb (fb0) is primary device<=
br>
&gt;&gt; [=C2=A0 =C2=A0 3.253561] nouveau 0000:01:00.0: fb0: nouveaufb fram=
e buffer device<br>
&gt;&gt; [=C2=A0 =C2=A0 3.268163] [drm] Initialized nouveau 1.3.1 20120801 =
for 0000:01:00.0 on<br>
&gt;&gt; minor 0<br>
&gt;&gt; [ 2150.225651] nouveau 0000:01:00.0: fifo: read fault at 000671000=
0 engine<br>
&gt;&gt; 00 [GR] client 02 [GPC0/PE_0] reason 02 [PTE] on channel 31 [007e8=
cb000<br>
&gt;&gt; Xwayland[3019]]<br>
&gt;&gt; [ 2150.225662] nouveau 0000:01:00.0: fifo: channel 31: killed<br>
&gt;&gt; [ 2150.225663] nouveau 0000:01:00.0: fifo: runlist 0: scheduled fo=
r recovery<br>
&gt;&gt; [ 2150.225666] nouveau 0000:01:00.0: fifo: engine 0: scheduled for=
 recovery<br>
&gt;&gt; [ 2150.225669] nouveau 0000:01:00.0: Xwayland[3019]: channel 31 ki=
lled!<br>
&gt;&gt; [ 2296.863975] Workqueue: events_unbound nv50_disp_atomic_commit_w=
ork<br>
&gt;&gt; [nouveau]<br>
&gt;&gt; [ 2296.863990]=C2=A0 ? nvkm_ioctl_ntfy_get+0x69/0xb0 [nouveau]<br>
&gt;&gt; [ 2296.864032]=C2=A0 nv50_disp_atomic_commit_tail+<wbr>0x55/0x3a00=
 [nouveau]<br>
&gt;&gt; [ 2296.864047]=C2=A0 nv50_disp_atomic_commit_work+<wbr>0x12/0x20 [=
nouveau]<br>
&gt;&gt; [ 2296.864118] Workqueue: events_unbound nv50_disp_atomic_commit_w=
ork<br>
&gt;&gt; [nouveau]<br>
&gt;&gt; [ 2296.864138]=C2=A0 ? nouveau_bo_rd32+0x2a/0x30 [nouveau]<br>
&gt;&gt; [ 2296.864153]=C2=A0 ? nv84_fence_read+0x2e/0x30 [nouveau]<br>
&gt;&gt; [ 2296.864175]=C2=A0 nv50_disp_atomic_commit_tail+<wbr>0x55/0x3a00=
 [nouveau]<br>
&gt;&gt; [ 2296.864189]=C2=A0 nv50_disp_atomic_commit_work+<wbr>0x12/0x20 [=
nouveau]<br>
&gt;&gt; [ 2417.699641] Workqueue: events_unbound nv50_disp_atomic_commit_w=
ork<br>
&gt;&gt; [nouveau]<br>
&gt;&gt; [ 2417.699656]=C2=A0 ? nvkm_ioctl_ntfy_get+0x69/0xb0 [nouveau]<br>
&gt;&gt; [ 2417.699688]=C2=A0 nv50_disp_atomic_commit_tail+<wbr>0x55/0x3a00=
 [nouveau]<br>
&gt;&gt; [ 2417.699705]=C2=A0 nv50_disp_atomic_commit_work+<wbr>0x12/0x20 [=
nouveau]<br>
&gt;&gt; [ 2417.699785] Workqueue: events_unbound nv50_disp_atomic_commit_w=
ork<br>
&gt;&gt; [nouveau]<br>
&gt;&gt; [ 2417.699808]=C2=A0 ? nouveau_bo_rd32+0x2a/0x30 [nouveau]<br>
&gt;&gt; [ 2417.699825]=C2=A0 ? nv84_fence_read+0x2e/0x30 [nouveau]<br>
&gt;&gt; [ 2417.699851]=C2=A0 nv50_disp_atomic_commit_tail+<wbr>0x55/0x3a00=
 [nouveau]<br>
&gt;&gt; [ 2417.699867]=C2=A0 nv50_disp_atomic_commit_work+<wbr>0x12/0x20 [=
nouveau]<br>
&gt;&gt; [ 2538.535424] Workqueue: events_unbound nv50_disp_atomic_commit_w=
ork<br>
&gt;&gt; [nouveau]<br>
&gt;&gt; [ 2538.535439]=C2=A0 ? nvkm_ioctl_ntfy_get+0x69/0xb0 [nouveau]<br>
&gt;&gt; [ 2538.535469]=C2=A0 nv50_disp_atomic_commit_tail+<wbr>0x55/0x3a00=
 [nouveau]<br>
&gt;&gt; [ 2538.535485]=C2=A0 nv50_disp_atomic_commit_work+<wbr>0x12/0x20 [=
nouveau]<br>
&gt;&gt; [ 2538.535555] Workqueue: events_unbound nv50_disp_atomic_commit_w=
ork<br>
&gt;&gt; [nouveau]<br>
&gt;&gt; [ 2538.535576]=C2=A0 ? nouveau_bo_rd32+0x2a/0x30 [nouveau]<br>
&gt;&gt; [ 2538.535591]=C2=A0 ? nv84_fence_read+0x2e/0x30 [nouveau]<br>
&gt;&gt; [ 2538.535614]=C2=A0 nv50_disp_atomic_commit_tail+<wbr>0x55/0x3a00=
 [nouveau]<br>
&gt;&gt; [ 2538.535628]=C2=A0 nv50_disp_atomic_commit_work+<wbr>0x12/0x20 [=
nouveau]<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; ______________________________<wbr>_________________<br>
&gt;&gt; Nouveau mailing list<br>
&gt;&gt; <a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32mzQB+pC5nmwQ@public.gmane.org=
edesktop.org</a><br>
&gt;&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau"=
 rel=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/<wbr>ma=
ilman/listinfo/nouveau</a><br>
&gt;&gt;<br>
<br>
</div></div></blockquote></div><br></div></div></div></div></div></div></di=
v></div>

--001a114054d42ff35e054f129f95--

--===============0524731156==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0524731156==--
