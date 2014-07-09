From: Mike Lothian <mike@fireburn.co.uk>
Subject: Re: [PATCH 00/17] Convert TTM to the new fence interface.
Date: Wed, 9 Jul 2014 14:09:07 +0100
Message-ID: <CAHbf0-HaFi0px7QGfBErKenH7wDU08B5mxo_QhFJdDPC4WBDrQ@mail.gmail.com>
References: <20140709093124.11354.3774.stgit@patser>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1062897209=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20140709093124.11354.3774.stgit@patser>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Cc: thellstrom@vmware.com, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, bskeggs@redhat.com, alexander.deucher@amd.com, christian.koenig@amd.com
List-Id: nouveau.vger.kernel.org

--===============1062897209==
Content-Type: multipart/alternative; boundary=089e0149d350d382ee04fdc269d5

--089e0149d350d382ee04fdc269d5
Content-Type: text/plain; charset=UTF-8

Hi Maarten

Will this stop the stuttering I've been seeing with DRI3 and PRIME? Or will
other patches / plumbing be required

Cheers

Mike
On 9 Jul 2014 13:29, "Maarten Lankhorst" <maarten.lankhorst@canonical.com>
wrote:

> This series applies on top of the driver-core-next branch of
> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git
>
> Before converting ttm to the new fence interface I had to fix some
> drivers to require a reservation before poking with fence_obj.
> After flipping the switch RCU becomes available instead, and
> the extra reservations can be dropped again. :-)
>
> I've done at least basic testing on all the drivers I've converted
> at some point, but more testing is definitely welcomed!
>
> ---
>
> Maarten Lankhorst (17):
>       drm/ttm: add interruptible parameter to ttm_eu_reserve_buffers
>       drm/ttm: kill off some members to ttm_validate_buffer
>       drm/nouveau: add reservation to nouveau_gem_ioctl_cpu_prep
>       drm/nouveau: require reservations for nouveau_fence_sync and
> nouveau_bo_fence
>       drm/ttm: call ttm_bo_wait while inside a reservation
>       drm/ttm: kill fence_lock
>       drm/nouveau: rework to new fence interface
>       drm/radeon: add timeout argument to radeon_fence_wait_seq
>       drm/radeon: use common fence implementation for fences
>       drm/qxl: rework to new fence interface
>       drm/vmwgfx: get rid of different types of fence_flags entirely
>       drm/vmwgfx: rework to new fence interface
>       drm/ttm: flip the switch, and convert to dma_fence
>       drm/nouveau: use rcu in nouveau_gem_ioctl_cpu_prep
>       drm/radeon: use rcu waits in some ioctls
>       drm/vmwgfx: use rcu in vmw_user_dmabuf_synccpu_grab
>       drm/ttm: use rcu in core ttm
>
>  drivers/gpu/drm/nouveau/core/core/event.c |    4
>  drivers/gpu/drm/nouveau/nouveau_bo.c      |   59 +---
>  drivers/gpu/drm/nouveau/nouveau_display.c |   25 +-
>  drivers/gpu/drm/nouveau/nouveau_fence.c   |  431
> +++++++++++++++++++----------
>  drivers/gpu/drm/nouveau/nouveau_fence.h   |   22 +
>  drivers/gpu/drm/nouveau/nouveau_gem.c     |   55 +---
>  drivers/gpu/drm/nouveau/nv04_fence.c      |    4
>  drivers/gpu/drm/nouveau/nv10_fence.c      |    4
>  drivers/gpu/drm/nouveau/nv17_fence.c      |    2
>  drivers/gpu/drm/nouveau/nv50_fence.c      |    2
>  drivers/gpu/drm/nouveau/nv84_fence.c      |   11 -
>  drivers/gpu/drm/qxl/Makefile              |    2
>  drivers/gpu/drm/qxl/qxl_cmd.c             |    7
>  drivers/gpu/drm/qxl/qxl_debugfs.c         |   16 +
>  drivers/gpu/drm/qxl/qxl_drv.h             |   20 -
>  drivers/gpu/drm/qxl/qxl_fence.c           |   91 ------
>  drivers/gpu/drm/qxl/qxl_kms.c             |    1
>  drivers/gpu/drm/qxl/qxl_object.c          |    2
>  drivers/gpu/drm/qxl/qxl_object.h          |    6
>  drivers/gpu/drm/qxl/qxl_release.c         |  172 ++++++++++--
>  drivers/gpu/drm/qxl/qxl_ttm.c             |   93 ------
>  drivers/gpu/drm/radeon/radeon.h           |   15 -
>  drivers/gpu/drm/radeon/radeon_cs.c        |   10 +
>  drivers/gpu/drm/radeon/radeon_device.c    |   60 ++++
>  drivers/gpu/drm/radeon/radeon_display.c   |   21 +
>  drivers/gpu/drm/radeon/radeon_fence.c     |  283 +++++++++++++++----
>  drivers/gpu/drm/radeon/radeon_gem.c       |   19 +
>  drivers/gpu/drm/radeon/radeon_object.c    |    8 -
>  drivers/gpu/drm/radeon/radeon_ttm.c       |   34 --
>  drivers/gpu/drm/radeon/radeon_uvd.c       |   10 -
>  drivers/gpu/drm/radeon/radeon_vm.c        |   16 +
>  drivers/gpu/drm/ttm/ttm_bo.c              |  187 ++++++-------
>  drivers/gpu/drm/ttm/ttm_bo_util.c         |   28 --
>  drivers/gpu/drm/ttm/ttm_bo_vm.c           |    3
>  drivers/gpu/drm/ttm/ttm_execbuf_util.c    |  146 +++-------
>  drivers/gpu/drm/vmwgfx/vmwgfx_buffer.c    |   47 ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h       |    1
>  drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c   |   24 --
>  drivers/gpu/drm/vmwgfx/vmwgfx_fence.c     |  329 ++++++++++++----------
>  drivers/gpu/drm/vmwgfx/vmwgfx_fence.h     |   35 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_resource.c  |   43 +--
>  include/drm/ttm/ttm_bo_api.h              |    7
>  include/drm/ttm/ttm_bo_driver.h           |   29 --
>  include/drm/ttm/ttm_execbuf_util.h        |   22 +
>  44 files changed, 1256 insertions(+), 1150 deletions(-)
>  delete mode 100644 drivers/gpu/drm/qxl/qxl_fence.c
>
> --
> Signature
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--089e0149d350d382ee04fdc269d5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Hi Maarten</p>
<p dir=3D"ltr">Will this stop the stuttering I&#39;ve been seeing with DRI3=
 and PRIME? Or will other patches / plumbing be required</p>
<p dir=3D"ltr">Cheers</p>
<p dir=3D"ltr">Mike</p>
<div class=3D"gmail_quote">On 9 Jul 2014 13:29, &quot;Maarten Lankhorst&quo=
t; &lt;<a href=3D"mailto:maarten.lankhorst@canonical.com">maarten.lankhorst=
@canonical.com</a>&gt; wrote:<br type=3D"attribution"><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">
This series applies on top of the driver-core-next branch of<br>
git://<a href=3D"http://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driv=
er-core.git" target=3D"_blank">git.kernel.org/pub/scm/linux/kernel/git/greg=
kh/driver-core.git</a><br>
<br>
Before converting ttm to the new fence interface I had to fix some<br>
drivers to require a reservation before poking with fence_obj.<br>
After flipping the switch RCU becomes available instead, and<br>
the extra reservations can be dropped again. :-)<br>
<br>
I&#39;ve done at least basic testing on all the drivers I&#39;ve converted<=
br>
at some point, but more testing is definitely welcomed!<br>
<br>
---<br>
<br>
Maarten Lankhorst (17):<br>
=C2=A0 =C2=A0 =C2=A0 drm/ttm: add interruptible parameter to ttm_eu_reserve=
_buffers<br>
=C2=A0 =C2=A0 =C2=A0 drm/ttm: kill off some members to ttm_validate_buffer<=
br>
=C2=A0 =C2=A0 =C2=A0 drm/nouveau: add reservation to nouveau_gem_ioctl_cpu_=
prep<br>
=C2=A0 =C2=A0 =C2=A0 drm/nouveau: require reservations for nouveau_fence_sy=
nc and nouveau_bo_fence<br>
=C2=A0 =C2=A0 =C2=A0 drm/ttm: call ttm_bo_wait while inside a reservation<b=
r>
=C2=A0 =C2=A0 =C2=A0 drm/ttm: kill fence_lock<br>
=C2=A0 =C2=A0 =C2=A0 drm/nouveau: rework to new fence interface<br>
=C2=A0 =C2=A0 =C2=A0 drm/radeon: add timeout argument to radeon_fence_wait_=
seq<br>
=C2=A0 =C2=A0 =C2=A0 drm/radeon: use common fence implementation for fences=
<br>
=C2=A0 =C2=A0 =C2=A0 drm/qxl: rework to new fence interface<br>
=C2=A0 =C2=A0 =C2=A0 drm/vmwgfx: get rid of different types of fence_flags =
entirely<br>
=C2=A0 =C2=A0 =C2=A0 drm/vmwgfx: rework to new fence interface<br>
=C2=A0 =C2=A0 =C2=A0 drm/ttm: flip the switch, and convert to dma_fence<br>
=C2=A0 =C2=A0 =C2=A0 drm/nouveau: use rcu in nouveau_gem_ioctl_cpu_prep<br>
=C2=A0 =C2=A0 =C2=A0 drm/radeon: use rcu waits in some ioctls<br>
=C2=A0 =C2=A0 =C2=A0 drm/vmwgfx: use rcu in vmw_user_dmabuf_synccpu_grab<br=
>
=C2=A0 =C2=A0 =C2=A0 drm/ttm: use rcu in core ttm<br>
<br>
=C2=A0drivers/gpu/drm/nouveau/core/core/event.c | =C2=A0 =C2=A04<br>
=C2=A0drivers/gpu/drm/nouveau/nouveau_bo.c =C2=A0 =C2=A0 =C2=A0| =C2=A0 59 =
+---<br>
=C2=A0drivers/gpu/drm/nouveau/nouveau_display.c | =C2=A0 25 +-<br>
=C2=A0drivers/gpu/drm/nouveau/nouveau_fence.c =C2=A0 | =C2=A0431 ++++++++++=
+++++++++----------<br>
=C2=A0drivers/gpu/drm/nouveau/nouveau_fence.h =C2=A0 | =C2=A0 22 +<br>
=C2=A0drivers/gpu/drm/nouveau/nouveau_gem.c =C2=A0 =C2=A0 | =C2=A0 55 +---<=
br>
=C2=A0drivers/gpu/drm/nouveau/nv04_fence.c =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=
=A04<br>
=C2=A0drivers/gpu/drm/nouveau/nv10_fence.c =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=
=A04<br>
=C2=A0drivers/gpu/drm/nouveau/nv17_fence.c =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=
=A02<br>
=C2=A0drivers/gpu/drm/nouveau/nv50_fence.c =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=
=A02<br>
=C2=A0drivers/gpu/drm/nouveau/nv84_fence.c =C2=A0 =C2=A0 =C2=A0| =C2=A0 11 =
-<br>
=C2=A0drivers/gpu/drm/qxl/Makefile =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A02<br>
=C2=A0drivers/gpu/drm/qxl/qxl_cmd.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A07<br>
=C2=A0drivers/gpu/drm/qxl/qxl_debugfs.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=
=A0 16 +<br>
=C2=A0drivers/gpu/drm/qxl/qxl_drv.h =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 20 -<br>
=C2=A0drivers/gpu/drm/qxl/qxl_fence.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
=C2=A0 91 ------<br>
=C2=A0drivers/gpu/drm/qxl/qxl_kms.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A01<br>
=C2=A0drivers/gpu/drm/qxl/qxl_object.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
=C2=A0 =C2=A02<br>
=C2=A0drivers/gpu/drm/qxl/qxl_object.h =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
=C2=A0 =C2=A06<br>
=C2=A0drivers/gpu/drm/qxl/qxl_release.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=
=A0172 ++++++++++--<br>
=C2=A0drivers/gpu/drm/qxl/qxl_ttm.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 93 ------<br>
=C2=A0drivers/gpu/drm/radeon/radeon.h =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
=C2=A0 15 -<br>
=C2=A0drivers/gpu/drm/radeon/radeon_cs.c =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=
=A0 10 +<br>
=C2=A0drivers/gpu/drm/radeon/radeon_device.c =C2=A0 =C2=A0| =C2=A0 60 ++++<=
br>
=C2=A0drivers/gpu/drm/radeon/radeon_display.c =C2=A0 | =C2=A0 21 +<br>
=C2=A0drivers/gpu/drm/radeon/radeon_fence.c =C2=A0 =C2=A0 | =C2=A0283 +++++=
++++++++++----<br>
=C2=A0drivers/gpu/drm/radeon/radeon_gem.c =C2=A0 =C2=A0 =C2=A0 | =C2=A0 19 =
+<br>
=C2=A0drivers/gpu/drm/radeon/radeon_object.c =C2=A0 =C2=A0| =C2=A0 =C2=A08 =
-<br>
=C2=A0drivers/gpu/drm/radeon/radeon_ttm.c =C2=A0 =C2=A0 =C2=A0 | =C2=A0 34 =
--<br>
=C2=A0drivers/gpu/drm/radeon/radeon_uvd.c =C2=A0 =C2=A0 =C2=A0 | =C2=A0 10 =
-<br>
=C2=A0drivers/gpu/drm/radeon/radeon_vm.c =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=
=A0 16 +<br>
=C2=A0drivers/gpu/drm/ttm/ttm_bo.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0187 ++++++-------<br>
=C2=A0drivers/gpu/drm/ttm/ttm_bo_util.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=
=A0 28 --<br>
=C2=A0drivers/gpu/drm/ttm/ttm_bo_vm.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
=C2=A0 =C2=A03<br>
=C2=A0drivers/gpu/drm/ttm/ttm_execbuf_util.c =C2=A0 =C2=A0| =C2=A0146 +++--=
-----<br>
=C2=A0drivers/gpu/drm/vmwgfx/vmwgfx_buffer.c =C2=A0 =C2=A0| =C2=A0 47 ---<b=
r>
=C2=A0drivers/gpu/drm/vmwgfx/vmwgfx_drv.h =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=
=A01<br>
=C2=A0drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c =C2=A0 | =C2=A0 24 --<br>
=C2=A0drivers/gpu/drm/vmwgfx/vmwgfx_fence.c =C2=A0 =C2=A0 | =C2=A0329 +++++=
+++++++----------<br>
=C2=A0drivers/gpu/drm/vmwgfx/vmwgfx_fence.h =C2=A0 =C2=A0 | =C2=A0 35 +-<br=
>
=C2=A0drivers/gpu/drm/vmwgfx/vmwgfx_resource.c =C2=A0| =C2=A0 43 +--<br>
=C2=A0include/drm/ttm/ttm_bo_api.h =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A07<br>
=C2=A0include/drm/ttm/ttm_bo_driver.h =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
=C2=A0 29 --<br>
=C2=A0include/drm/ttm/ttm_execbuf_util.h =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=
=A0 22 +<br>
=C2=A044 files changed, 1256 insertions(+), 1150 deletions(-)<br>
=C2=A0delete mode 100644 drivers/gpu/drm/qxl/qxl_fence.c<br>
<br>
--<br>
Signature<br>
_______________________________________________<br>
dri-devel mailing list<br>
<a href=3D"mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesk=
top.org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/dri-devel" target=
=3D"_blank">http://lists.freedesktop.org/mailman/listinfo/dri-devel</a><br>
</blockquote></div>

--089e0149d350d382ee04fdc269d5--

--===============1062897209==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1062897209==--
