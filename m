From: Karol Herbst <kherbst@redhat.com>
Subject: Re: [Nouveau] [PATCH RFC] drm/nouveau: fix memory leak in nvkm_iccsense_oneinit
Date: Thu, 15 Oct 2020 19:03:14 +0200
Message-ID: <CACO55ttfu1xbQ6e1rk0KZkNdJ7Jik91u0vp=e046hf6D7g1Z9Q@mail.gmail.com>
References: <20201014075419.19974-1-keitasuzuki.park@sslab.ics.keio.ac.jp> <CACO55ttZCVZM2v1oWRq7mzZy3DVDe3h1fH80D6RNFM3xR4VjuQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACO55ttZCVZM2v1oWRq7mzZy3DVDe3h1fH80D6RNFM3xR4VjuQ@mail.gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: takafumi@sslab.ics.keio.ac.jp, David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, Keita Suzuki <keitasuzuki.park@sslab.ics.keio.ac.jp>
List-Id: nouveau.vger.kernel.org

On Thu, Oct 15, 2020 at 6:32 PM Karol Herbst <kherbst@redhat.com> wrote:
>
> Ben, I think this is like the 5th patch tackling this issue, I think
> we should merge one of those.
>

maybe I just confused that with reports, but it seems to turn up quite
a bit and maybe I should have pushed more of it as well...

Anyway, the patch itself looks good.

Reviewed-by: Karol Herbst <kherbst@redhat.com>

> On Thu, Oct 15, 2020 at 6:23 AM Keita Suzuki
> <keitasuzuki.park@sslab.ics.keio.ac.jp> wrote:
> >
> > struct pw_rail_t is allocated as an array in function nvios_iccsense_parse,
> > and stored to a struct member of local variable. However, the array is not
> > freed when the local variable becomes invalid, and the reference is not
> > passed on, leading to a memory leak.
> >
> > Fix this by freeing struct pw_rail_t when exiting nvkm_iccsense_oneinit.
> >
> > Signed-off-by: Keita Suzuki <keitasuzuki.park@sslab.ics.keio.ac.jp>
> > ---
> >  drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
> > index fecfa6afcf54..8ba8d8e3f52a 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
> > @@ -280,8 +280,10 @@ nvkm_iccsense_oneinit(struct nvkm_subdev *subdev)
> >                         }
> >
> >                         rail = kmalloc(sizeof(*rail), GFP_KERNEL);
> > -                       if (!rail)
> > +                       if (!rail) {
> > +                               kfree(stbl.rail);
> >                                 return -ENOMEM;
> > +                       }
> >
> >                         rail->read = read;
> >                         rail->sensor = sensor;
> > @@ -291,6 +293,7 @@ nvkm_iccsense_oneinit(struct nvkm_subdev *subdev)
> >                         list_add_tail(&rail->head, &iccsense->rails);
> >                 }
> >         }
> > +       kfree(stbl.rail);
> >         return 0;
> >  }
> >
> > --
> > 2.17.1
> >
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau
> >
