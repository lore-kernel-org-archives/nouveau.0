From: Wambui Karuga <wambui.karugax@gmail.com>
Subject: Re: [PATCH] drm/nouveau: declare constants as unsigned long.
Date: Wed, 1 Jan 2020 12:40:03 +0300
Message-ID: <20200101094003.GA5673@wambui>
References: <20191231205345.32615-1-wambui.karugax@gmail.com>
 <CAKb7Uvii6RTp3FsX6z+4VuX6xcS9_SQ+CMC-UBOHVJY5BeWgew@mail.gmail.com>
Reply-To: CAKb7Uvii6RTp3FsX6z+4VuX6xcS9_SQ+CMC-UBOHVJY5BeWgew@mail.gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAKb7Uvii6RTp3FsX6z+4VuX6xcS9_SQ+CMC-UBOHVJY5BeWgew@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On Tue, Dec 31, 2019 at 06:53:55PM -0500, Ilia Mirkin wrote:
> Probably want ULL for 32-bit arches to be correct here too.
> 
Okay, I can convert them to ULL and send a v2.

Thanks,
wambui.

> On Tue, Dec 31, 2019 at 3:53 PM Wambui Karuga <wambui.karugax@gmail.com> wrote:
> >
> > Explicitly declare constants are unsigned long to address the following
> > sparse warnings:
> > warning: constant is so big it is long
> >
> > Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
> > ---
> >  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf100.c | 2 +-
> >  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf108.c | 2 +-
> >  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c | 2 +-
> >  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm107.c | 2 +-
> >  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm200.c | 2 +-
> >  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c | 2 +-
> >  6 files changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf100.c
> > index ac87a3b6b7c9..506b358fcdb6 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf100.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf100.c
> > @@ -655,7 +655,7 @@ gf100_ram_new_(const struct nvkm_ram_func *func,
> >
> >  static const struct nvkm_ram_func
> >  gf100_ram = {
> > -       .upper = 0x0200000000,
> > +       .upper = 0x0200000000UL,
> >         .probe_fbp = gf100_ram_probe_fbp,
> >         .probe_fbp_amount = gf100_ram_probe_fbp_amount,
> >         .probe_fbpa_amount = gf100_ram_probe_fbpa_amount,
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf108.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf108.c
> > index 70a06e3cd55a..3bc39895bbce 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf108.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf108.c
> > @@ -43,7 +43,7 @@ gf108_ram_probe_fbp_amount(const struct nvkm_ram_func *func, u32 fbpao,
> >
> >  static const struct nvkm_ram_func
> >  gf108_ram = {
> > -       .upper = 0x0200000000,
> > +       .upper = 0x0200000000UL,
> >         .probe_fbp = gf100_ram_probe_fbp,
> >         .probe_fbp_amount = gf108_ram_probe_fbp_amount,
> >         .probe_fbpa_amount = gf100_ram_probe_fbpa_amount,
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c
> > index 456aed1f2a02..d01f32c0956a 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c
> > @@ -1698,7 +1698,7 @@ gk104_ram_new_(const struct nvkm_ram_func *func, struct nvkm_fb *fb,
> >
> >  static const struct nvkm_ram_func
> >  gk104_ram = {
> > -       .upper = 0x0200000000,
> > +       .upper = 0x0200000000UL,
> >         .probe_fbp = gf100_ram_probe_fbp,
> >         .probe_fbp_amount = gf108_ram_probe_fbp_amount,
> >         .probe_fbpa_amount = gf100_ram_probe_fbpa_amount,
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm107.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm107.c
> > index 27c68e3f9772..e24ac664eb15 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm107.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm107.c
> > @@ -33,7 +33,7 @@ gm107_ram_probe_fbp(const struct nvkm_ram_func *func,
> >
> >  static const struct nvkm_ram_func
> >  gm107_ram = {
> > -       .upper = 0x1000000000,
> > +       .upper = 0x1000000000UL,
> >         .probe_fbp = gm107_ram_probe_fbp,
> >         .probe_fbp_amount = gf108_ram_probe_fbp_amount,
> >         .probe_fbpa_amount = gf100_ram_probe_fbpa_amount,
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm200.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm200.c
> > index 6b0cac1fe7b4..17994cbda54b 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm200.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm200.c
> > @@ -48,7 +48,7 @@ gm200_ram_probe_fbp_amount(const struct nvkm_ram_func *func, u32 fbpao,
> >
> >  static const struct nvkm_ram_func
> >  gm200_ram = {
> > -       .upper = 0x1000000000,
> > +       .upper = 0x1000000000UL,
> >         .probe_fbp = gm107_ram_probe_fbp,
> >         .probe_fbp_amount = gm200_ram_probe_fbp_amount,
> >         .probe_fbpa_amount = gf100_ram_probe_fbpa_amount,
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c
> > index adb62a6beb63..7a07a6ed4578 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c
> > @@ -79,7 +79,7 @@ gp100_ram_probe_fbpa(struct nvkm_device *device, int fbpa)
> >
> >  static const struct nvkm_ram_func
> >  gp100_ram = {
> > -       .upper = 0x1000000000,
> > +       .upper = 0x1000000000UL,
> >         .probe_fbp = gm107_ram_probe_fbp,
> >         .probe_fbp_amount = gm200_ram_probe_fbp_amount,
> >         .probe_fbpa_amount = gp100_ram_probe_fbpa,
> > --
> > 2.17.1
> >
