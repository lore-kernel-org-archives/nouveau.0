From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: avoid null deref on bad
 arguments to nouveau_vma_getmap
Date: Thu, 22 Aug 2013 09:54:57 +0300
Message-ID: <20130822065457.GN2924@reaktio.net>
References: <1377130214-17522-1-git-send-email-imirkin@alum.mit.edu>
	<CACAvsv4zNrgnBkaJOJyDyDq1bnW37eccjsT=c4yfBJHcNgaaWQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACAvsv4zNrgnBkaJOJyDyDq1bnW37eccjsT=c4yfBJHcNgaaWQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Maarten Lankhorst <maarten.lankhorst-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Thu, Aug 22, 2013 at 04:41:06PM +1000, Ben Skeggs wrote:
> On Thu, Aug 22, 2013 at 10:10 AM, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrot=
e:
> > The code expects non-VRAM mem nodes to have a pages list. If that's not
> > set, it will do a null deref down the line. Warn on that condition and
> > return an error.
> >
> > See https://bugs.freedesktop.org/show_bug.cgi?id=3D64774
> >
> > Reported-by: Pasi K=E4rkk=E4inen <pasik-X3B1VOXEql0@public.gmane.org>
> > Tested-by: Pasi K=E4rkk=E4inen <pasik-X3B1VOXEql0@public.gmane.org>
> > Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
> > Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> # 3.8+
> > ---
> >
> > I don't exactly understand what's going on, but this is just a
> > straightforward way to avoid a null deref that you see happens in the
> > bug. I haven't figured out the root cause of this, but it's getting
> > well into the "I have no idea how TTM works" space. However this seems
> > like a bit of defensive programming -- nouveau_vm_map_sg will pass
> > node->pages as a list down, which will be dereferenced by
> > nvc0_vm_map_sg. Perhaps the other arguments should make that
> > dereferencing not happen, but it definitely was happening here, as you
> > can see in the bug.
> >
> > Ben/Maarten, I'll let you judge whether this check is appropriate,
> > since like I hope I was able to convey above, I'm just not really sure =
:)
> >
> >  drivers/gpu/drm/nouveau/nouveau_bo.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nou=
veau/nouveau_bo.c
> > index cdc3282..191145d 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > @@ -963,6 +963,12 @@ nouveau_vma_getmap(struct nouveau_channel *chan, s=
truct nouveau_bo *nvbo,
> >         struct nouveau_mem *node =3D mem->mm_node;
> >         int ret;
> >
> > +       /* If we ever get here for a non-vram mem node that doesn't
> > +        * have pages, we will end up doing a null deref in
> > +        * nouveau_vm_map_sg. */
> > +       if (WARN_ON(mem->mem_type !=3D TTM_PL_VRAM && !node->pages))
> > +               return -EINVAL;
> My guess here is that this is a mapping that requires the use of
> map_sg_table() (see nouveau_bo_move_ntfy() for the condition).
> =

> I'm not entirely sure this should even be happening to be honest.  I
> guess TTM is trying to move a shared buffer from GART to VRAM for some
> reason (userspace probably asked for it?).. And well, this really
> shouldn't be allowed.. The other device won't be able to touch it
> then.
> =

> If you can confirm this is indeed what's happening, we should find out
> why and fix it (and have the kernel completely reject such attempts).
>

Yes it does happen. I've been experiencing the kernel crash with Linux 3.8.=
x, 3.9.x and 3.10.x.

I'm able to reproduce the crash when having Optimus enabled in BIOS on my =

Lenovo T430 laptop with Intel IGD + Nvidia GF108 GPU, booting to Xorg deskt=
op, =

and when I try to enable external DVI monitor connected to nouveau card, th=
e kernel crashes hard.. =


crash traceback and WARN_ON() tracebacks with this patch applied available =
in the bugzilla entry: =

https://bugs.freedesktop.org/show_bug.cgi?id=3D64774


-- Pasi


> Ben.
> =

> > +
> >         ret =3D nouveau_vm_get(nv_client(chan->cli)->vm, mem->num_pages=
 <<
> >                              PAGE_SHIFT, node->page_shift,
> >                              NV_MEM_ACCESS_RW, vma);
> > --
> > 1.8.1.5
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > http://lists.freedesktop.org/mailman/listinfo/dri-devel
