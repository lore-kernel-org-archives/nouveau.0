From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: avoid null deref on bad
 arguments to nouveau_vma_getmap
Date: Wed, 28 Aug 2013 09:29:48 +0300
Message-ID: <20130828062948.GE2924@reaktio.net>
References: <1377130214-17522-1-git-send-email-imirkin@alum.mit.edu>
	<5215B9E8.5080108@canonical.com>
	<20130823202042.GS2924@reaktio.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130823202042.GS2924-GxtO3QLqHcLR7s880joybQ@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Maarten Lankhorst <maarten.lankhorst-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, Aug 23, 2013 at 11:20:42PM +0300, Pasi K=E4rkk=E4inen wrote:
> On Thu, Aug 22, 2013 at 09:12:40AM +0200, Maarten Lankhorst wrote:
> > Op 22-08-13 02:10, Ilia Mirkin schreef:
> > > The code expects non-VRAM mem nodes to have a pages list. If that's n=
ot
> > > set, it will do a null deref down the line. Warn on that condition and
> > > return an error.
> > >
> > > See https://bugs.freedesktop.org/show_bug.cgi?id=3D64774
> > >
> > > Reported-by: Pasi K=E4rkk=E4inen <pasik-X3B1VOXEql0@public.gmane.org>
> > > Tested-by: Pasi K=E4rkk=E4inen <pasik-X3B1VOXEql0@public.gmane.org>
> > > Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
> > > Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> # 3.8+
> > > ---
> > >
> > > I don't exactly understand what's going on, but this is just a
> > > straightforward way to avoid a null deref that you see happens in the
> > > bug. I haven't figured out the root cause of this, but it's getting
> > > well into the "I have no idea how TTM works" space. However this seems
> > > like a bit of defensive programming -- nouveau_vm_map_sg will pass
> > > node->pages as a list down, which will be dereferenced by
> > > nvc0_vm_map_sg. Perhaps the other arguments should make that
> > > dereferencing not happen, but it definitely was happening here, as you
> > > can see in the bug.
> > >
> > > Ben/Maarten, I'll let you judge whether this check is appropriate,
> > > since like I hope I was able to convey above, I'm just not really sur=
e :)
> > Not it really isn't appropriate..
> > =

> > You'd have to call call nouveau_vm_map_sg_table instead, the only place=
 that doesn't handle that correctly
> > is where it's not expected to be called.
> > =

> > Here, have a completely untested patch to fix things...
> > =

> =

> Maarten: I've been testing this stuff with Linux 3.10.x, so I had to modi=
fy the patch a bit to make it apply there.. =

> I've attached the modified copy that applies to 3.10.9, hopefully I did t=
he backport correctly.
> =

> With Linux 3.10.9 and the patch applied the kernel doesn't crash anymore,=
 and I get this error in dmesg:
> =

> [   76.105643] nouveau W[     DRM] Trying to create a fb in vram with val=
id_domains=3D00000004
> =

> Does that help? =

>

Any comments? =


Maarten's patch works for me, I get that warning instead of a kernel crash,
but it's also a bigger change that doesn't apply to older kernels as-is. =


Ilia's original patch in this thread can be applied to older kernels as-is,
and it also prevents the kernel crash from happening.

Should we get both applied, so Ilia's patch can be CC'd to stable ? =

 =

-- Pasi


> --- linux-3.10.9-100.fc18.x86_64/drivers/gpu/drm/nouveau/nouveau_display.=
c.orig	2013-07-01 01:13:29.000000000 +0300
> +++ linux-3.10.9-100.fc18.x86_64/drivers/gpu/drm/nouveau/nouveau_display.=
c	2013-08-23 19:56:52.038234281 +0300
> @@ -137,18 +137,31 @@
>  {
>  	struct nouveau_framebuffer *nouveau_fb;
>  	struct drm_gem_object *gem;
> +	struct nouveau_bo *nvbo;
>  	int ret;
>  =

>  	gem =3D drm_gem_object_lookup(dev, file_priv, mode_cmd->handles[0]);
>  	if (!gem)
>  		return ERR_PTR(-ENOENT);
>  =

> +	nvbo =3D nouveau_gem_object(gem);
> +	if (!(nvbo->valid_domains & NOUVEAU_GEM_DOMAIN_VRAM)) {
> +		nv_warn(nouveau_drm(dev), "Trying to create a fb in vram with"
> +			" valid_domains=3D%08x\n", nvbo->valid_domains);
> +		ret =3D -EINVAL;
> +		drm_gem_object_unreference(gem);
> +		return ERR_PTR(ret);
> +	}
> +
>  	nouveau_fb =3D kzalloc(sizeof(struct nouveau_framebuffer), GFP_KERNEL);
> -	if (!nouveau_fb)
> +	if (!nouveau_fb) {
> +		drm_gem_object_unreference(gem);
>  		return ERR_PTR(-ENOMEM);
> +	}
>  =

> -	ret =3D nouveau_framebuffer_init(dev, nouveau_fb, mode_cmd, nouveau_gem=
_object(gem));
> +	ret =3D nouveau_framebuffer_init(dev, nouveau_fb, mode_cmd, nvbo);
>  	if (ret) {
> +		kfree(nouveau_fb);
>  		drm_gem_object_unreference(gem);
>  		return ERR_PTR(ret);
>  	}

> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
