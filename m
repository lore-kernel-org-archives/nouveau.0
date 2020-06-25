From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [Nouveau] [RESEND PATCH 1/3] nouveau: fix migrate page regression
Date: Thu, 25 Jun 2020 15:25:04 +1000
Message-ID: <CACAvsv6x5PPjFcpz0VD1e6PcXhJ9ENkOr1p=X4dFarJ-OF-Wvw@mail.gmail.com>
References: <20200622233854.10889-1-rcampbell@nvidia.com> <20200622233854.10889-2-rcampbell@nvidia.com>
 <53751f8e-d901-df2e-a2e0-1b1484b31b81@nvidia.com> <CACAvsv5NqqF704HyvTd6DH43-one06OO7Z=uENUS5RSOJzP8Jg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACAvsv5NqqF704HyvTd6DH43-one06OO7Z=uENUS5RSOJzP8Jg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: John Hubbard <jhubbard@nvidia.com>
Cc: Ralph Campbell <rcampbell@nvidia.com>, ML nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, Jason Gunthorpe <jgg@mellanox.com>, Christoph Hellwig <hch@lst.de>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

On Thu, 25 Jun 2020 at 15:23, Ben Skeggs <skeggsb@gmail.com> wrote:
>
> On Tue, 23 Jun 2020 at 10:51, John Hubbard <jhubbard@nvidia.com> wrote:
> >
> > On 2020-06-22 16:38, Ralph Campbell wrote:
> > > The patch to add zero page migration to GPU memory inadvertantly included
> >
> > inadvertently
> >
> > > part of a future change which broke normal page migration to GPU memory
> > > by copying too much data and corrupting GPU memory.
> > > Fix this by only copying one page instead of a byte count.
> > >
> > > Fixes: 9d4296a7d4b3 ("drm/nouveau/nouveau/hmm: fix migrate zero page to GPU")
> > > Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
> > > ---
> > >   drivers/gpu/drm/nouveau/nouveau_dmem.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > > index e5c230d9ae24..cc9993837508 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > > @@ -550,7 +550,7 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
> > >                                        DMA_BIDIRECTIONAL);
> > >               if (dma_mapping_error(dev, *dma_addr))
> > >                       goto out_free_page;
> > > -             if (drm->dmem->migrate.copy_func(drm, page_size(spage),
> > > +             if (drm->dmem->migrate.copy_func(drm, 1,
> > >                       NOUVEAU_APER_VRAM, paddr, NOUVEAU_APER_HOST, *dma_addr))
> > >                       goto out_dma_unmap;
> > >       } else {
> > >
> >
> >
> > I Am Not A Nouveau Expert, nor is it really clear to me how
> > page_size(spage) came to contain something other than a page's worth of
> > byte count, but this fix looks accurate to me. It's better for
> > maintenance, too, because the function never intends to migrate "some
> > number of bytes". It intends to migrate exactly one page.
> >
> > Hope I'm not missing something fundamental, but:
> I'm actually a bit confused here too.  Because, it *looks* like the
> function takes a byte count, not a page count, and unless I'm missing
> something too, it's setup the copy class for a byte count also.
No, nevermind.. I was looking at nvc0b5_migrate_clear() :)

>
> >
> > Reviewed-by: John Hubbard <jhubbard@nvidia.com
> >
> >
> > thanks,
> > --
> > John Hubbard
> > NVIDIA
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau
