From: Arvind R <arvino55-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: nouveau on xen, almost there
Date: Mon, 22 Feb 2010 23:41:39 +0530
Message-ID: <d799c4761002221011k6256c128ree5e81c10040708e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0594972101=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0594972101==
Content-Type: multipart/alternative; boundary=001636e0a7f452d9e70480345da5

--001636e0a7f452d9e70480345da5
Content-Type: text/plain; charset=ISO-8859-1

Hi all,
I backported nouveau-git20100222 to pv_ops 2.6.31.6 by replacing the whole
drm-tree and includes. Just needed a minor fix in drm_sysfs.c to compile.

nouveau works fine with 2D acceleration enabled when booted without xen.
Even nouveau-dri works!

But when booted on Xen, X hangs if Accel enabled
Works fine with Option NoAccel True in xorg.conf.
Found to be stuck in nv_accel_common_init.

Call traced in xf86-nouveau:
in nv_accel_common.c;
  NVAccelInit2D_NV50(ScrnInfoPtr pScrn)
    nouveau_grobj_alloc(chan, Nv2D, NV50_2D,&pNv->Nv2D) finishes.
    BEGIN_RING(chan, eng2d, NV50_2D_DMA_NOTIFY, 3) hangs.

system with blank screen. Can connect with ssh. Card is GeForce 9400 GT
with 1Gb vram.

debug trace tail from syslog:
kernel: [drm] nouveau 0000:06:00.0: nouveau_ramht_insert:141 - insert ch2
0x000000c0: h=0xd8000003, c=0x00000e0a
kernel: [drm:drm_ioctl], pid=6225, cmd=0x400c6444, nr=0x44, dev 0xe200,
auth=1
kernel: [drm] nouveau 0000:06:00.0: nouveau_gpuobj_gr_new:840 - ch2
class=0x502d
kernel: [drm] nouveau 0000:06:00.0: nouveau_gpuobj_new:216 - ch2 size=24
align=16 flags=0x00000006
kernel: [drm] nouveau 0000:06:00.0: nouveau_gpuobj_new:224 - gpuobj
ffff880006a90140
kernel: [drm] nouveau 0000:06:00.0: nouveau_gpuobj_new:237 - private heap
kernel: [drm] nouveau 0000:06:00.0: nouveau_gpuobj_ref_add:457 - ch2
h=0x80000020 gpuobj=ffff880006a90140
kernel: [drm] nouveau 0000:06:00.0: nouveau_ramht_hash_handle:75 - ch2
handle=0x80000020
kernel: [drm] nouveau 0000:06:00.0: nouveau_ramht_hash_handle:86 -
hash=0x00000180
kernel: [drm] nouveau 0000:06:00.0: nouveau_ramht_insert:141 - insert ch2
0x00000180: h=0x80000020, c=0x00100e0c

Am game to try to fix - need help.

Arvind R.

--001636e0a7f452d9e70480345da5
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi all,<br>I backported nouveau-git20100222 to pv_ops 2.6.31.6 by replacing=
 the whole drm-tree and includes. Just needed a minor fix in drm_sysfs.c to=
 compile.<br><br>nouveau works fine with 2D acceleration enabled when boote=
d without xen.<br>
Even nouveau-dri works!<br><br>But when booted on Xen, X hangs if Accel ena=
bled<br>Works fine with Option NoAccel True in xorg.conf.<br>Found to be st=
uck in nv_accel_common_init.<br><br>Call traced in xf86-nouveau:<br>in nv_a=
ccel_common.c;<br>
=A0 NVAccelInit2D_NV50(ScrnInfoPtr pScrn)<br>=A0=A0=A0 nouveau_grobj_alloc(=
chan, Nv2D, NV50_2D,&amp;pNv-&gt;Nv2D) finishes.<br>=A0=A0=A0 BEGIN_RING(ch=
an, eng2d, NV50_2D_DMA_NOTIFY, 3) hangs.<br><br>system with blank screen. C=
an connect with ssh. Card is GeForce 9400 GT<br>
with 1Gb vram. <br><br>debug trace tail from syslog:<br>kernel: [drm] nouve=
au 0000:06:00.0: nouveau_ramht_insert:141 - insert ch2 0x000000c0: h=3D0xd8=
000003, c=3D0x00000e0a<br>kernel: [drm:drm_ioctl], pid=3D6225, cmd=3D0x400c=
6444, nr=3D0x44, dev 0xe200, auth=3D1<br>
kernel: [drm] nouveau 0000:06:00.0: nouveau_gpuobj_gr_new:840 - ch2 class=
=3D0x502d<br>kernel: [drm] nouveau 0000:06:00.0: nouveau_gpuobj_new:216 - c=
h2 size=3D24 align=3D16 flags=3D0x00000006<br>kernel: [drm] nouveau 0000:06=
:00.0: nouveau_gpuobj_new:224 - gpuobj ffff880006a90140<br>
kernel: [drm] nouveau 0000:06:00.0: nouveau_gpuobj_new:237 - private heap<b=
r>kernel: [drm] nouveau 0000:06:00.0: nouveau_gpuobj_ref_add:457 - ch2 h=3D=
0x80000020 gpuobj=3Dffff880006a90140<br>kernel: [drm] nouveau 0000:06:00.0:=
 nouveau_ramht_hash_handle:75 - ch2 handle=3D0x80000020<br>
kernel: [drm] nouveau 0000:06:00.0: nouveau_ramht_hash_handle:86 - hash=3D0=
x00000180<br>kernel: [drm] nouveau 0000:06:00.0: nouveau_ramht_insert:141 -=
 insert ch2 0x00000180: h=3D0x80000020, c=3D0x00100e0c<br><br>Am game to tr=
y to fix - need help.<br>
<br>Arvind R.<br><br>

--001636e0a7f452d9e70480345da5--

--===============0594972101==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0594972101==--
