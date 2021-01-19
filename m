From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 1/3] drivers/nouveau/kms/nv50-: Reject format
 modifiers for cursor planes
Date: Tue, 19 Jan 2021 17:50:42 +0200
Message-ID: <YAb/0urUmEg5kd3C@intel.com>
References: <20210119015415.2511028-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20210119015415.2511028-1-lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nirmoy Das <nirmoy.aiemd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Mon, Jan 18, 2021 at 08:54:12PM -0500, Lyude Paul wrote:
> Nvidia hardware doesn't actually support using tiling formats with the
> cursor plane, only linear is allowed. In the future, we should write a
> testcase for this.

There are a couple of old modifier/format sanity tests here:
https://patchwork.freedesktop.org/series/46876/

Couple of things missing that now came to my mind:
- test setplane/etc. rejects unsupported formats/modifiers even if
  addfb allowed them, exactly for the case where only a subset of
  planes support something
- validate the IN_FORMATS blob harder, eg. make sure each modifier
  listed there supports at least one format. IIRC this was busted on
  a few drivers last year, dunno if they got fixed or not. Hmm,
  actually since this is now using the pre-parsed stuff I guess we
  should just stick an assert into igt_fill_plane_format_mod() where
  the blob gets parsed

> =

> Fixes: c586f30bf74c ("drm/nouveau/kms: Add format mod prop to base/ovly/n=
vdisp")
> Cc: James Jones <jajones-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
> Cc: Jeremy Cline <jcline-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Cc: Simon Ser <contact-sV0wSBM+kKVWj0EZb7rXcA@public.gmane.org>
> Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> # v5.8+
> Signed-off-by: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/wndw.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> =

> diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/no=
uveau/dispnv50/wndw.c
> index ce451242f79e..271de3a63f21 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> @@ -702,6 +702,11 @@ nv50_wndw_init(struct nv50_wndw *wndw)
>  	nvif_notify_get(&wndw->notify);
>  }
>  =

> +static const u64 nv50_cursor_format_modifiers[] =3D {
> +	DRM_FORMAT_MOD_LINEAR,
> +	DRM_FORMAT_MOD_INVALID,
> +};
> +
>  int
>  nv50_wndw_new_(const struct nv50_wndw_func *func, struct drm_device *dev,
>  	       enum drm_plane_type type, const char *name, int index,
> @@ -713,6 +718,7 @@ nv50_wndw_new_(const struct nv50_wndw_func *func, str=
uct drm_device *dev,
>  	struct nvif_mmu *mmu =3D &drm->client.mmu;
>  	struct nv50_disp *disp =3D nv50_disp(dev);
>  	struct nv50_wndw *wndw;
> +	const u64 *format_modifiers;
>  	int nformat;
>  	int ret;
>  =

> @@ -728,10 +734,13 @@ nv50_wndw_new_(const struct nv50_wndw_func *func, s=
truct drm_device *dev,
>  =

>  	for (nformat =3D 0; format[nformat]; nformat++);
>  =

> -	ret =3D drm_universal_plane_init(dev, &wndw->plane, heads, &nv50_wndw,
> -				       format, nformat,
> -				       nouveau_display(dev)->format_modifiers,
> -				       type, "%s-%d", name, index);
> +	if (type =3D=3D DRM_PLANE_TYPE_CURSOR)
> +		format_modifiers =3D nv50_cursor_format_modifiers;
> +	else
> +		format_modifiers =3D nouveau_display(dev)->format_modifiers;
> +
> +	ret =3D drm_universal_plane_init(dev, &wndw->plane, heads, &nv50_wndw, =
format, nformat,
> +				       format_modifiers, type, "%s-%d", name, index);
>  	if (ret) {
>  		kfree(*pwndw);
>  		*pwndw =3D NULL;
> -- =

> 2.29.2
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Ville Syrj=E4l=E4
Intel
