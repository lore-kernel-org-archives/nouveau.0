From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH v2 04/21] drm/exynos: Introduce GEM object functions
Date: Wed, 16 Sep 2020 13:24:24 +0200
Message-ID: <20200916112424.GH438822@phenom.ffwll.local>
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-5-tzimmermann@suse.de>
 <20200916100318.GF438822@phenom.ffwll.local>
 <fb1f5992-1642-5751-5672-486b89442e1c@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <fb1f5992-1642-5751-5672-486b89442e1c-l3A5Bk7waGM@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "amd-gfx" <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
Cc: hamohammed.sa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org, emil.velikov-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, oleksandr_andrushchenko-uRwfk40T5oI@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, miaoqinglang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, tomi.valkeinen-l0cyMroinI0@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org, marek.olsak-5C7GfCeVMHo@public.gmane.org, matthew.auld-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, chunkuang.hu-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, andi.shyti-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, tianci.yin-5C7GfCeVMHo@public.gmane.org, etnaviv-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rodrigo.vivi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, evan.quan-5C7GfCeVMHo@public.gmane.org, sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.orglinux-arm-
List-Id: nouveau.vger.kernel.org

On Wed, Sep 16, 2020 at 12:36:28PM +0200, Thomas Zimmermann wrote:
> Hi
> =

> Am 16.09.20 um 12:03 schrieb Daniel Vetter:
> > On Tue, Sep 15, 2020 at 04:59:41PM +0200, Thomas Zimmermann wrote:
> >> GEM object functions deprecate several similar callback interfaces in
> >> struct drm_driver. This patch replaces the per-driver callbacks with
> >> per-instance callbacks in exynos. The only exception is gem_prime_mmap,
> >> which is non-trivial to convert.
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
> >> ---
> >>  drivers/gpu/drm/exynos/exynos_drm_drv.c | 10 ----------
> >>  drivers/gpu/drm/exynos/exynos_drm_gem.c | 15 +++++++++++++++
> >>  2 files changed, 15 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm=
/exynos/exynos_drm_drv.c
> >> index dbd80f1e4c78..fe46680ca208 100644
> >> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> >> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> >> @@ -75,11 +75,6 @@ static void exynos_drm_postclose(struct drm_device =
*dev, struct drm_file *file)
> >>  	file->driver_priv =3D NULL;
> >>  }
> >>  =

> >> -static const struct vm_operations_struct exynos_drm_gem_vm_ops =3D {
> >> -	.open =3D drm_gem_vm_open,
> >> -	.close =3D drm_gem_vm_close,
> >> -};
> >> -
> >>  static const struct drm_ioctl_desc exynos_ioctls[] =3D {
> >>  	DRM_IOCTL_DEF_DRV(EXYNOS_GEM_CREATE, exynos_drm_gem_create_ioctl,
> >>  			DRM_RENDER_ALLOW),
> >> @@ -124,16 +119,11 @@ static struct drm_driver exynos_drm_driver =3D {
> >>  	.open			=3D exynos_drm_open,
> >>  	.lastclose		=3D drm_fb_helper_lastclose,
> >>  	.postclose		=3D exynos_drm_postclose,
> >> -	.gem_free_object_unlocked =3D exynos_drm_gem_free_object,
> >> -	.gem_vm_ops		=3D &exynos_drm_gem_vm_ops,
> >>  	.dumb_create		=3D exynos_drm_gem_dumb_create,
> >>  	.prime_handle_to_fd	=3D drm_gem_prime_handle_to_fd,
> >>  	.prime_fd_to_handle	=3D drm_gem_prime_fd_to_handle,
> >>  	.gem_prime_import	=3D exynos_drm_gem_prime_import,
> >> -	.gem_prime_get_sg_table	=3D exynos_drm_gem_prime_get_sg_table,
> >>  	.gem_prime_import_sg_table	=3D exynos_drm_gem_prime_import_sg_table,
> >> -	.gem_prime_vmap		=3D exynos_drm_gem_prime_vmap,
> >> -	.gem_prime_vunmap	=3D exynos_drm_gem_prime_vunmap,
> >>  	.gem_prime_mmap		=3D exynos_drm_gem_prime_mmap,
> >>  	.ioctls			=3D exynos_ioctls,
> >>  	.num_ioctls		=3D ARRAY_SIZE(exynos_ioctls),
> >> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm=
/exynos/exynos_drm_gem.c
> >> index efa476858db5..69a5cf28b4ae 100644
> >> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
> >> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> >> @@ -129,6 +129,19 @@ void exynos_drm_gem_destroy(struct exynos_drm_gem=
 *exynos_gem)
> >>  	kfree(exynos_gem);
> >>  }
> >>  =

> >> +static const struct vm_operations_struct exynos_drm_gem_vm_ops =3D {
> >> +	.open =3D drm_gem_vm_open,
> >> +	.close =3D drm_gem_vm_close,
> >> +};
> > =

> > Hm moving the drm_gem_cma_vm_ops into drm_gem.h or so and maybe calling
> > them drm_gem_simple_ops or so would remove a pile of these. But perhaps=
 a
> > quick follow up series.
> =

> Good idea. Several interfaces use the term 'default' in their name, so
> something like drm_gem_default_vm_ops seems appropriate.

Default sounds like a fine naming choice too.

> BTW is there a reason why we have file operations like
> DEFINE_DRM_GEM_CMA_FOPS() in each module? It seems like this could also
> be provided by the rsp memory-manager library.

It's for the module reference counting of the underlying file. So
file_operations need this.
-Daniel


> =

> Best regards
> Thomas
> =

> > =

> > Reviewed-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
> > =

> >> +
> >> +static const struct drm_gem_object_funcs exynos_drm_gem_object_funcs =
=3D {
> >> +	.free =3D exynos_drm_gem_free_object,
> >> +	.get_sg_table =3D exynos_drm_gem_prime_get_sg_table,
> >> +	.vmap =3D exynos_drm_gem_prime_vmap,
> >> +	.vunmap	=3D exynos_drm_gem_prime_vunmap,
> >> +	.vm_ops =3D &exynos_drm_gem_vm_ops,
> >> +};
> >> +
> >>  static struct exynos_drm_gem *exynos_drm_gem_init(struct drm_device *=
dev,
> >>  						  unsigned long size)
> >>  {
> >> @@ -143,6 +156,8 @@ static struct exynos_drm_gem *exynos_drm_gem_init(=
struct drm_device *dev,
> >>  	exynos_gem->size =3D size;
> >>  	obj =3D &exynos_gem->base;
> >>  =

> >> +	obj->funcs =3D &exynos_drm_gem_object_funcs;
> >> +
> >>  	ret =3D drm_gem_object_init(dev, obj, size);
> >>  	if (ret < 0) {
> >>  		DRM_DEV_ERROR(dev->dev, "failed to initialize gem object\n");
> >> -- =

> >> 2.28.0
> >>
> > =

> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> =





-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
