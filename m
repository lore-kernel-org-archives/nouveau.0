From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
Subject: Re: [PATCH] drm/nouveau: avoid null deref on bad arguments to
	nouveau_vma_getmap
Date: Fri, 18 Oct 2013 17:45:56 +0300
Message-ID: <20131018144556.GQ2924@reaktio.net>
References: <1377130214-17522-1-git-send-email-imirkin@alum.mit.edu>
	<5215B9E8.5080108@canonical.com>
	<CACAvsv7ygYoM6ZzFdY-Zov0herPMQDERaw6jzj6VuB+p20FcJQ@mail.gmail.com>
	<5226DA41.5060203@canonical.com>
	<20130925144246.GL2924@reaktio.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20130925144246.GL2924@reaktio.net>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

On Wed, Sep 25, 2013 at 05:42:46PM +0300, Pasi K=E4rkk=E4inen wrote:
> On Wed, Sep 04, 2013 at 08:59:13AM +0200, Maarten Lankhorst wrote:
> > =

> > When looking into this bug I noticed that nouveau_bo_vma_add needs to h=
ave a check for nvbo->page_shift =3D=3D vma->vm->vmm->spg_shift,
> > and only if the check is true it should map the page in TTM_PL_TT. Patc=
h below.
> > Should probably also be cc'd to stable.
> >
> =

> How about this patch? Is it ready to go in? =

>

Ping on this patch aswell..


-- Pasi

 =

> Thanks,
> =

> -- Pasi
> =

>  =

> > ~Maarten
> > =

> > diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nou=
veau/nouveau_bo.c
> > index 89b992e..355a1b7 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > @@ -1560,7 +1560,8 @@ nouveau_bo_vma_add(struct nouveau_bo *nvbo, struc=
t nouveau_vm *vm,
> >  =

> >  	if (nvbo->bo.mem.mem_type =3D=3D TTM_PL_VRAM)
> >  		nouveau_vm_map(vma, nvbo->bo.mem.mm_node);
> > -	else if (nvbo->bo.mem.mem_type =3D=3D TTM_PL_TT) {
> > +	else if (nvbo->bo.mem.mem_type =3D=3D TTM_PL_TT &&
> > +		 nvbo->page_shift =3D=3D vma->vm->vmm->spg_shift) {
> >  		if (node->sg)
> >  			nouveau_vm_map_sg_table(vma, 0, size, node);
> >  		else
> > =
