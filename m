From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH 8/8] drm/ttm: do not keep GPU dependent
 addresses
Date: Tue, 18 Feb 2020 20:06:39 +0100
Message-ID: <20200218190639.GM2363188@phenom.ffwll.local>
References: <20200217150427.49994-1-nirmoy.das@amd.com>
 <20200217150427.49994-9-nirmoy.das@amd.com>
 <c3a20c1b-0520-1995-7445-9e3f3ea77394@suse.de>
 <9db59846-90b4-2b9a-8200-69297112693a@amd.com>
 <edc985f1-8856-4d1a-8960-efe4d21b960d@amd.com>
 <5b8db944-5a55-8161-6ab6-98490cfb0562@suse.de>
 <f8534965-ea14-bbac-bd34-06b951766a7c@amd.com>
 <48a5e3e2-cb9d-8328-1529-3558601ba860@suse.de>
 <31b0cac7-82c7-60ad-830b-66f7838a1047@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <31b0cac7-82c7-60ad-830b-66f7838a1047-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: christian.koenig-5C7GfCeVMHo@public.gmane.org
Cc: thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org, kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, kenny.ho-5C7GfCeVMHo@public.gmane.org, Nirmoy <nirmodas-5C7GfCeVMHo@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, nirmoy.das-5C7GfCeVMHo@public.gmane.org, linux-graphics-maintainer-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, alexander.deucher-5C7GfCeVMHo@public.gmane.org, sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org, Nirmoy Das <nirmoy.aiemd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, Feb 18, 2020 at 07:37:44PM +0100, Christian K=F6nig wrote:
> Am 18.02.20 um 19:28 schrieb Thomas Zimmermann:
> > Hi
> > =

> > Am 18.02.20 um 19:23 schrieb Christian K=F6nig:
> > > Am 18.02.20 um 19:16 schrieb Thomas Zimmermann:
> > > > Hi
> > > > =

> > > > Am 18.02.20 um 18:13 schrieb Nirmoy:
> > > > > On 2/18/20 1:44 PM, Christian K=F6nig wrote:
> > > > > > Am 18.02.20 um 13:40 schrieb Thomas Zimmermann:
> > > > > > > Hi
> > > > > > > =

> > > > > > > Am 17.02.20 um 16:04 schrieb Nirmoy Das:
> > > > > > > > GPU address handling is device specific and should be handl=
e by its
> > > > > > > > device
> > > > > > > > driver.
> > > > > > > > =

> > > > > > > > Signed-off-by: Nirmoy Das <nirmoy.das-5C7GfCeVMHo@public.gmane.org>
> > > > > > > > ---
> > > > > > > >  =A0=A0 drivers/gpu/drm/ttm/ttm_bo.c=A0=A0=A0 | 7 -------
> > > > > > > >  =A0=A0 include/drm/ttm/ttm_bo_api.h=A0=A0=A0 | 2 --
> > > > > > > >  =A0=A0 include/drm/ttm/ttm_bo_driver.h | 1 -
> > > > > > > >  =A0=A0 3 files changed, 10 deletions(-)
> > > > > > > > =

> > > > > > > > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
> > > > > > > > b/drivers/gpu/drm/ttm/ttm_bo.c
> > > > > > > > index 151edfd8de77..d5885cd609a3 100644
> > > > > > > > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > > > > > > > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > > > > > > > @@ -85,7 +85,6 @@ static void ttm_mem_type_debug(struct
> > > > > > > > ttm_bo_device *bdev, struct drm_printer *p
> > > > > > > >  =A0=A0=A0=A0=A0=A0 drm_printf(p, "=A0=A0=A0 has_type: %d\n=
", man->has_type);
> > > > > > > >  =A0=A0=A0=A0=A0=A0 drm_printf(p, "=A0=A0=A0 use_type: %d\n=
", man->use_type);
> > > > > > > >  =A0=A0=A0=A0=A0=A0 drm_printf(p, "=A0=A0=A0 flags: 0x%08X\=
n", man->flags);
> > > > > > > > -=A0=A0=A0 drm_printf(p, "=A0=A0=A0 gpu_offset: 0x%08llX\n"=
, man->gpu_offset);
> > > > > > > >  =A0=A0=A0=A0=A0=A0 drm_printf(p, "=A0=A0=A0 size: %llu\n",=
 man->size);
> > > > > > > >  =A0=A0=A0=A0=A0=A0 drm_printf(p, "=A0=A0=A0 available_cach=
ing: 0x%08X\n",
> > > > > > > > man->available_caching);
> > > > > > > >  =A0=A0=A0=A0=A0=A0 drm_printf(p, "=A0=A0=A0 default_cachin=
g: 0x%08X\n",
> > > > > > > > man->default_caching);
> > > > > > > > @@ -345,12 +344,6 @@ static int ttm_bo_handle_move_mem(stru=
ct
> > > > > > > > ttm_buffer_object *bo,
> > > > > > > >  =A0=A0 moved:
> > > > > > > >  =A0=A0=A0=A0=A0=A0 bo->evicted =3D false;
> > > > > > > >  =A0=A0 -=A0=A0=A0 if (bo->mem.mm_node)
> > > > > > > > -=A0=A0=A0=A0=A0=A0=A0 bo->offset =3D (bo->mem.start << PAG=
E_SHIFT) +
> > > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 bdev->man[bo->mem.mem_ty=
pe].gpu_offset;
> > > > > > > > -=A0=A0=A0 else
> > > > > > > > -=A0=A0=A0=A0=A0=A0=A0 bo->offset =3D 0;
> > > > > > > > -
> > > > > > > After moving this into users, the else branch has been lost. =
Is
> > > > > > > 'bo->mem.mm_node' always true?
> > > > > > At least for the amdgpu and radeon use cases, yes.
> > > > > > =

> > > > > > But that is a rather good question I mean for it is illegal to =
get the
> > > > > > GPU BO address if it is inaccessible (e.g. in the system domain=
).
> > > > > > =

> > > > > > Could be that some driver relied on the behavior to get 0 for t=
he
> > > > > > system domain here.
> > > > > I wonder how to verify that ?
> > > > > =

> > > > > If I understand correctly:
> > > > > =

> > > > > 1 qxl uses bo->offset only in qxl_bo_physical_address() which is =
not in
> > > > > system domain.
> > > > > =

> > > > > 2 unfortunately I can't say the same for bochs but it works with =
this
> > > > > patch series so I think bochs is fine as well.
> > > > > =

> > > > > 3 vmwgfx uses bo->offset only when bo->mem.mem_type =3D=3D TTM_PL=
_VRAM so
> > > > > vmwgfx should be fine.
> > > > > =

> > > > > 4 amdgpu and radeon runs with 'bo->mem.mm_node' always true
> > > > > =

> > > > > I am not sure about=A0 nouveau as bo->offset is being used in man=
y places.
> > > > > =

> > > > > I could probably mirror the removed logic to nouveau as
> > > > I suggest to introduce a ttm helper that contains the original bran=
ching
> > > > and use it everywhere. Something like
> > > > =

> > > >  =A0=A0 s64 ttm_bo_offset(struct ttm_buffer_object *bo)
> > > >  =A0=A0 {
> > > >  =A0=A0=A0=A0=A0 if (WARN_ON_ONCE(!bo->mem.mm_node))
> > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 return 0;
> > > >  =A0=A0=A0=A0=A0 return bo->mem.start << PAGE_SHIFT;
> > > >  =A0=A0 }
> > > > =

> > > > Could be static inline. The warning should point to broken drivers.=
 This
> > > > also gets rid of the ugly shift in the drivers.
> > > Big NAK on this. That is exactly what we should NOT do.
> > > =

> > > See the shift belongs into the driver, because it is driver dependent=
 if
> > > we work with page or byte offsets.
> > > =

> > > For amdgpu we for example want to work with byte offsets and TTM shou=
ld
> > > not make any assumption about what bo->mem.start actually contains.
> > OK. What about something like ttm_bo_pg_offset()? Same code without the
> > shift. Would also make it clear that it's a page offset.
> =

> That is a rather good idea. We could name that ttm_bo_man_offset() and put
> it into ttm_bo_manager.c next to the manager which allocates them.
> =

> It's just that this manager is not used by everybody, so amdgpu, radeon a=
nd
> nouveau would still need a separate function.

Let me pile on with my bikeshed color choice :-)

I'd do this a wrapper, but for drivers individually. And only for those we
haven't audited yet, or where we think the WARN_ON actually provides
value. So maybe in vram helpers, since that might be used by some drivers
that get stuff wrong. Or maybe noveau isn't audited yet.

That also sidesteps the "what should we call this, drivers are different?"
problem.

Anyway feel free to ignore me, really just a bikeshed at this point.

Cheers, Daniel

> =

> Christian.
> =

> > =

> > Best regards
> > Thomas
> > =

> > > Regards,
> > > Christian.
> > > =

> > > > Best regards
> > > > Thomas
> > > > =

> > > > =

> > > > > diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c
> > > > > b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > > > > index f8015e0318d7..5a6a2af91318 100644
> > > > > --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> > > > > +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > > > > @@ -1317,6 +1317,10 @@ nouveau_bo_move_ntfy(struct ttm_buffer_obj=
ect
> > > > > *bo, bool evict,
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 list_for_each_e=
ntry(vma, &nvbo->vma_list, head) {
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 nouveau_vma_map(vma, mem);
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (bo->mem.mm_node)
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 nvbo->offset =3D (new_reg->start << PAGE_SHIFT);
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 else
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 nvbo->offset =3D 0;
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0 } else {
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 list_for_each_e=
ntry(vma, &nvbo->vma_list, head) {
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 WARN_ON(ttm_bo_wait(bo, false, false));
> > > > > =

> > > > > Regards,
> > > > > =

> > > > > Nirmoy
> > > > > =

> > > > > =

> > > > > > Regards,
> > > > > > Christian.
> > > > > > =

> > > > > > > Best regards
> > > > > > > Thomas
> > > > > > > =

> > > > > > > >  =A0=A0=A0=A0=A0=A0 ctx->bytes_moved +=3D bo->num_pages << =
PAGE_SHIFT;
> > > > > > > >  =A0=A0=A0=A0=A0=A0 return 0;
> > > > > > > >  =A0=A0 diff --git a/include/drm/ttm/ttm_bo_api.h
> > > > > > > > b/include/drm/ttm/ttm_bo_api.h
> > > > > > > > index b9bc1b00142e..d6f39ee5bf5d 100644
> > > > > > > > --- a/include/drm/ttm/ttm_bo_api.h
> > > > > > > > +++ b/include/drm/ttm/ttm_bo_api.h
> > > > > > > > @@ -213,8 +213,6 @@ struct ttm_buffer_object {
> > > > > > > >  =A0=A0=A0=A0=A0=A0=A0 * either of these locks held.
> > > > > > > >  =A0=A0=A0=A0=A0=A0=A0 */
> > > > > > > >  =A0=A0 -=A0=A0=A0 uint64_t offset; /* GPU address space is=
 independent of CPU
> > > > > > > > word size */
> > > > > > > > -
> > > > > > > >  =A0=A0=A0=A0=A0=A0 struct sg_table *sg;
> > > > > > > >  =A0=A0 };
> > > > > > > >  =A0=A0 diff --git a/include/drm/ttm/ttm_bo_driver.h
> > > > > > > > b/include/drm/ttm/ttm_bo_driver.h
> > > > > > > > index c9e0fd09f4b2..c8ce6c181abe 100644
> > > > > > > > --- a/include/drm/ttm/ttm_bo_driver.h
> > > > > > > > +++ b/include/drm/ttm/ttm_bo_driver.h
> > > > > > > > @@ -177,7 +177,6 @@ struct ttm_mem_type_manager {
> > > > > > > >  =A0=A0=A0=A0=A0=A0 bool has_type;
> > > > > > > >  =A0=A0=A0=A0=A0=A0 bool use_type;
> > > > > > > >  =A0=A0=A0=A0=A0=A0 uint32_t flags;
> > > > > > > > -=A0=A0=A0 uint64_t gpu_offset; /* GPU address space is ind=
ependent of CPU
> > > > > > > > word size */
> > > > > > > >  =A0=A0=A0=A0=A0=A0 uint64_t size;
> > > > > > > >  =A0=A0=A0=A0=A0=A0 uint32_t available_caching;
> > > > > > > >  =A0=A0=A0=A0=A0=A0 uint32_t default_caching;
> > > > > > > > =

> > > > > _______________________________________________
> > > > > dri-devel mailing list
> > > > > dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > =

> > _______________________________________________
> > amd-gfx mailing list
> > amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > https://lists.freedesktop.org/mailman/listinfo/amd-gfx
> =


> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
