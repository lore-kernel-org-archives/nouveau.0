From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [Nouveau] [PATCH] nv50_disp_chan_mthd: ensure mthd is not NULL
Date: Thu, 20 Feb 2020 12:32:45 -0500
Message-ID: <CAKb7Uvh8Ob592LOizH9FGZz5ag=VJ3R=dh0G5iZSg2-JzWZFMQ@mail.gmail.com>
References: <dac89843-5258-5bed-ee86-7038e94e56da@qubes-os.org> <c94ce223-56d5-e31a-2a2c-59defb988b28@qubes-os.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c94ce223-56d5-e31a-2a2c-59defb988b28@qubes-os.org>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret@qubes-os.org>
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

Hi Frédéric,

It appears Ben made his own version of this patch (probably based on
the one you added to the kernel bz), and it's already upstream:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.6-rc2&id=0e6176c6d286316e9431b4f695940cfac4ffe6c2

Cheers,

  -ilia

On Thu, Feb 20, 2020 at 12:19 PM Frédéric Pierret
<frederic.pierret@qubes-os.org> wrote:
>
> Hi,
> Is anything missing here? How can I get this merged?
>
> Best regards,
> Frédéric Pierret
>
> On 2020-02-08 20:43, Frédéric Pierret wrote:
> > Pointer to structure array is assumed not NULL by default. It has
> > the consequence to raise a kernel panic when it's not the case.
> >
> > Basically, running at least a RTX2080TI on Xen makes a bad mmio error
> > which causes having 'mthd' pointer to be NULL in 'channv50.c'. From the
> > code, it's assumed to be not NULL by accessing directly 'mthd->data[0]'
> > which is the reason of the kernel panic. Simply check if the pointer
> > is not NULL before continuing.
> >
> > BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=206299
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Frédéric Pierret (fepitre) <frederic.pierret@qubes-os.org>
> > ---
> >  drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c
> > index bcf32d92ee5a..50e3539f33d2 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c
> > @@ -74,6 +74,8 @@ nv50_disp_chan_mthd(struct nv50_disp_chan *chan, int debug)
> >
> >       if (debug > subdev->debug)
> >               return;
> > +     if (!mthd)
> > +             return;
> >
> >       for (i = 0; (list = mthd->data[i].mthd) != NULL; i++) {
> >               u32 base = chan->head * mthd->addr;
> >
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
