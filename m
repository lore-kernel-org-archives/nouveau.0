From: Vincent Vanackere <vincent.vanackere-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: GT 730 freeze : how do diagnose / debug ?
Date: Sun, 7 May 2017 22:03:36 +0200
Message-ID: <CAMpZLrg3G7SYUDzXbzug9y98K_KmkQTwPMc2OWjnuxCicR6Uhw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0554010713=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============0554010713==
Content-Type: multipart/alternative; boundary=001a11405f20fde410054ef49fee

--001a11405f20fde410054ef49fee
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

 I own an Asus GT730-SL-2GD3-BRK, trying to drive two monitors at 2560x1440
resolution. Using gnome-shell with either Xorg or wayland I get screen
freezes very frequently. Those freezes usually require a reboot to get
working graphics (below a sample trace that I got yesterday).
 I am running Ubuntu 17.04 with the latest kernels avalable, I also tested
various more recent kernels including the latest drm tree at
https://cgit.freedesktop.org/~airlied/linux/log/?h=3Ddrm-next but the probl=
em
always occurs.
 When a freeze occurs, the computer is still reachable through ssh but the
only action I found so far to get graphics back is to restart the computer.
  I am willing to run diagnostics programs or test any patch if it would
help. I'm also not excluding the possibility that I may have some faulty
hardware so any hardwae-health-test advice would be welcome...

Regards,

Vincent Vanack=C3=A8re

[    1.199135] nouveau 0000:01:00.0: NVIDIA GK208B (b06070b1)
[    1.319930] nouveau 0000:01:00.0: bios: version 80.28.92.00.10
[    1.322095] nouveau 0000:01:00.0: fb: 2048 MiB DDR3
[    2.620362] nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
[    2.620362] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    2.620364] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[    2.620378] nouveau 0000:01:00.0: DRM: DCB version 4.0
[    2.620379] nouveau 0000:01:00.0: DRM: DCB outp 00: 01000f02 00020030
[    2.620380] nouveau 0000:01:00.0: DRM: DCB outp 01: 02011f62 00020010
[    2.620380] nouveau 0000:01:00.0: DRM: DCB outp 02: 02022f10 00000000
[    2.620381] nouveau 0000:01:00.0: DRM: DCB conn 00: 00001031
[    2.620381] nouveau 0000:01:00.0: DRM: DCB conn 01: 00002161
[    2.620382] nouveau 0000:01:00.0: DRM: DCB conn 02: 00000200
[    2.666199] nouveau 0000:01:00.0: hwmon_device_register() is deprecated.
Please convert the driver to use hwmon_device_register_with_info().
[    2.717519] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[    2.992994] nouveau 0000:01:00.0: DRM: allocated 2560x1440 fb: 0x60000,
bo ffff8cd1499f8000
[    3.025200] fbcon: nouveaufb (fb0) is primary device
[    3.253561] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    3.268163] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 0
[ 2150.225651] nouveau 0000:01:00.0: fifo: read fault at 0006710000 engine
00 [GR] client 02 [GPC0/PE_0] reason 02 [PTE] on channel 31 [007e8cb000
Xwayland[3019]]
[ 2150.225662] nouveau 0000:01:00.0: fifo: channel 31: killed
[ 2150.225663] nouveau 0000:01:00.0: fifo: runlist 0: scheduled for recover=
y
[ 2150.225666] nouveau 0000:01:00.0: fifo: engine 0: scheduled for recovery
[ 2150.225669] nouveau 0000:01:00.0: Xwayland[3019]: channel 31 killed!
[ 2296.863975] Workqueue: events_unbound nv50_disp_atomic_commit_work
[nouveau]
[ 2296.863990]  ? nvkm_ioctl_ntfy_get+0x69/0xb0 [nouveau]
[ 2296.864032]  nv50_disp_atomic_commit_tail+0x55/0x3a00 [nouveau]
[ 2296.864047]  nv50_disp_atomic_commit_work+0x12/0x20 [nouveau]
[ 2296.864118] Workqueue: events_unbound nv50_disp_atomic_commit_work
[nouveau]
[ 2296.864138]  ? nouveau_bo_rd32+0x2a/0x30 [nouveau]
[ 2296.864153]  ? nv84_fence_read+0x2e/0x30 [nouveau]
[ 2296.864175]  nv50_disp_atomic_commit_tail+0x55/0x3a00 [nouveau]
[ 2296.864189]  nv50_disp_atomic_commit_work+0x12/0x20 [nouveau]
[ 2417.699641] Workqueue: events_unbound nv50_disp_atomic_commit_work
[nouveau]
[ 2417.699656]  ? nvkm_ioctl_ntfy_get+0x69/0xb0 [nouveau]
[ 2417.699688]  nv50_disp_atomic_commit_tail+0x55/0x3a00 [nouveau]
[ 2417.699705]  nv50_disp_atomic_commit_work+0x12/0x20 [nouveau]
[ 2417.699785] Workqueue: events_unbound nv50_disp_atomic_commit_work
[nouveau]
[ 2417.699808]  ? nouveau_bo_rd32+0x2a/0x30 [nouveau]
[ 2417.699825]  ? nv84_fence_read+0x2e/0x30 [nouveau]
[ 2417.699851]  nv50_disp_atomic_commit_tail+0x55/0x3a00 [nouveau]
[ 2417.699867]  nv50_disp_atomic_commit_work+0x12/0x20 [nouveau]
[ 2538.535424] Workqueue: events_unbound nv50_disp_atomic_commit_work
[nouveau]
[ 2538.535439]  ? nvkm_ioctl_ntfy_get+0x69/0xb0 [nouveau]
[ 2538.535469]  nv50_disp_atomic_commit_tail+0x55/0x3a00 [nouveau]
[ 2538.535485]  nv50_disp_atomic_commit_work+0x12/0x20 [nouveau]
[ 2538.535555] Workqueue: events_unbound nv50_disp_atomic_commit_work
[nouveau]
[ 2538.535576]  ? nouveau_bo_rd32+0x2a/0x30 [nouveau]
[ 2538.535591]  ? nv84_fence_read+0x2e/0x30 [nouveau]
[ 2538.535614]  nv50_disp_atomic_commit_tail+0x55/0x3a00 [nouveau]
[ 2538.535628]  nv50_disp_atomic_commit_work+0x12/0x20 [nouveau]

--001a11405f20fde410054ef49fee
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi,<br><br></div>=C2=A0I own an Asus GT730-SL-2G=
D3-BRK, trying to drive two monitors at 2560x1440 resolution. Using gnome-s=
hell with either Xorg or wayland I get screen freezes very frequently. Thos=
e freezes usually require a reboot to get working graphics (below a sample =
trace that I got yesterday). <br>=C2=A0I am running Ubuntu 17.04 with the l=
atest kernels avalable, I also tested various more recent kernels including=
 the latest drm tree at <a href=3D"https://cgit.freedesktop.org/~airlied/li=
nux/log/?h=3Ddrm-next" target=3D"_blank">https://cgit.freedesktop.org/~<wbr=
>airlied/linux/log/?h=3Ddrm-next</a> but the problem always occurs.<br>=C2=
=A0When a freeze occurs, the computer is still reachable through ssh but th=
e only action I found so far to get graphics back is to restart the compute=
r. <br>=C2=A0 I am willing to run diagnostics programs or test any patch if=
 it would help. I&#39;m also not excluding the possibility that I may have =
some faulty hardware so any hardwae-health-test advice would be welcome...<=
br>=C2=A0<br></div><div>Regards,<br><br></div><div>Vincent Vanack=C3=A8re<b=
r></div><div><div><br>[=C2=A0=C2=A0=C2=A0 1.199135] nouveau 0000:01:00.0: N=
VIDIA GK208B (b06070b1)<br>[=C2=A0=C2=A0=C2=A0 1.319930] nouveau 0000:01:00=
.0: bios: version 80.28.92.00.10<br>[=C2=A0=C2=A0=C2=A0 1.322095] nouveau 0=
000:01:00.0: fb: 2048 MiB DDR3<br>[=C2=A0=C2=A0=C2=A0 2.620362] nouveau 000=
0:01:00.0: DRM: VRAM: 2048 MiB<br>[=C2=A0=C2=A0=C2=A0 2.620362] nouveau 000=
0:01:00.0: DRM: GART: 1048576 MiB<br>[=C2=A0=C2=A0=C2=A0 2.620364] nouveau =
0000:01:00.0: DRM: TMDS table version 2.0<br>[=C2=A0=C2=A0=C2=A0 2.620378] =
nouveau 0000:01:00.0: DRM: DCB version 4.0<br>[=C2=A0=C2=A0=C2=A0 2.620379]=
 nouveau 0000:01:00.0: DRM: DCB outp 00: 01000f02 00020030<br>[=C2=A0=C2=A0=
=C2=A0 2.620380] nouveau 0000:01:00.0: DRM: DCB outp 01: 02011f62 00020010<=
br>[=C2=A0=C2=A0=C2=A0 2.620380] nouveau 0000:01:00.0: DRM: DCB outp 02: 02=
022f10 00000000<br>[=C2=A0=C2=A0=C2=A0 2.620381] nouveau 0000:01:00.0: DRM:=
 DCB conn 00: 00001031<br>[=C2=A0=C2=A0=C2=A0 2.620381] nouveau 0000:01:00.=
0: DRM: DCB conn 01: 00002161<br>[=C2=A0=C2=A0=C2=A0 2.620382] nouveau 0000=
:01:00.0: DRM: DCB conn 02: 00000200<br>[=C2=A0=C2=A0=C2=A0 2.666199] nouve=
au 0000:01:00.0: hwmon_device_register() is deprecated. Please convert the =
driver to use hwmon_device_register_with_<wbr>info().<br>[=C2=A0=C2=A0=C2=
=A0 2.717519] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies<b=
r>[=C2=A0=C2=A0=C2=A0 2.992994] nouveau 0000:01:00.0: DRM: allocated 2560x1=
440 fb: 0x60000, bo ffff8cd1499f8000<br>[=C2=A0=C2=A0=C2=A0 3.025200] fbcon=
: nouveaufb (fb0) is primary device<br>[=C2=A0=C2=A0=C2=A0 3.253561] nouvea=
u 0000:01:00.0: fb0: nouveaufb frame buffer device<br>[=C2=A0=C2=A0=C2=A0 3=
.268163] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on minor=
 0<br>[ 2150.225651] nouveau 0000:01:00.0: fifo: read fault at 0006710000 e=
ngine 00 [GR] client 02 [GPC0/PE_0] reason 02 [PTE] on channel 31 [007e8cb0=
00 Xwayland[3019]]<br>[ 2150.225662] nouveau 0000:01:00.0: fifo: channel 31=
: killed<br>[ 2150.225663] nouveau 0000:01:00.0: fifo: runlist 0: scheduled=
 for recovery<br>[ 2150.225666] nouveau 0000:01:00.0: fifo: engine 0: sched=
uled for recovery<br>[ 2150.225669] nouveau 0000:01:00.0: Xwayland[3019]: c=
hannel 31 killed!<br>[ 2296.863975] Workqueue: events_unbound nv50_disp_ato=
mic_commit_work [nouveau]<br>[ 2296.863990]=C2=A0 ? nvkm_ioctl_ntfy_get+0x6=
9/0xb0 [nouveau]<br>[ 2296.864032]=C2=A0 nv50_disp_atomic_commit_tail+<wbr>=
0x55/0x3a00 [nouveau]<br>[ 2296.864047]=C2=A0 nv50_disp_atomic_commit_work+=
<wbr>0x12/0x20 [nouveau]<br>[ 2296.864118] Workqueue: events_unbound nv50_d=
isp_atomic_commit_work [nouveau]<br>[ 2296.864138]=C2=A0 ? nouveau_bo_rd32+=
0x2a/0x30 [nouveau]<br>[ 2296.864153]=C2=A0 ? nv84_fence_read+0x2e/0x30 [no=
uveau]<br>[ 2296.864175]=C2=A0 nv50_disp_atomic_commit_tail+<wbr>0x55/0x3a0=
0 [nouveau]<br>[ 2296.864189]=C2=A0 nv50_disp_atomic_commit_work+<wbr>0x12/=
0x20 [nouveau]<br>[ 2417.699641] Workqueue: events_unbound nv50_disp_atomic=
_commit_work [nouveau]<br>[ 2417.699656]=C2=A0 ? nvkm_ioctl_ntfy_get+0x69/0=
xb0 [nouveau]<br>[ 2417.699688]=C2=A0 nv50_disp_atomic_commit_tail+<wbr>0x5=
5/0x3a00 [nouveau]<br>[ 2417.699705]=C2=A0 nv50_disp_atomic_commit_work+<wb=
r>0x12/0x20 [nouveau]<br>[ 2417.699785] Workqueue: events_unbound nv50_disp=
_atomic_commit_work [nouveau]<br>[ 2417.699808]=C2=A0 ? nouveau_bo_rd32+0x2=
a/0x30 [nouveau]<br>[ 2417.699825]=C2=A0 ? nv84_fence_read+0x2e/0x30 [nouve=
au]<br>[ 2417.699851]=C2=A0 nv50_disp_atomic_commit_tail+<wbr>0x55/0x3a00 [=
nouveau]<br>[ 2417.699867]=C2=A0 nv50_disp_atomic_commit_work+<wbr>0x12/0x2=
0 [nouveau]<br>[ 2538.535424] Workqueue: events_unbound nv50_disp_atomic_co=
mmit_work [nouveau]<br>[ 2538.535439]=C2=A0 ? nvkm_ioctl_ntfy_get+0x69/0xb0=
 [nouveau]<br>[ 2538.535469]=C2=A0 nv50_disp_atomic_commit_tail+<wbr>0x55/0=
x3a00 [nouveau]<br>[ 2538.535485]=C2=A0 nv50_disp_atomic_commit_work+<wbr>0=
x12/0x20 [nouveau]<br>[ 2538.535555] Workqueue: events_unbound nv50_disp_at=
omic_commit_work [nouveau]<br>[ 2538.535576]=C2=A0 ? nouveau_bo_rd32+0x2a/0=
x30 [nouveau]<br>[ 2538.535591]=C2=A0 ? nv84_fence_read+0x2e/0x30 [nouveau]=
<br>[ 2538.535614]=C2=A0 nv50_disp_atomic_commit_tail+<wbr>0x55/0x3a00 [nou=
veau]<br>[ 2538.535628]=C2=A0 nv50_disp_atomic_commit_work+<wbr>0x12/0x20 [=
nouveau]<br><br></div></div></div>

--001a11405f20fde410054ef49fee--

--===============0554010713==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0554010713==--
