From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [Nouveau] [PATCH v2] drm/nouveau: declare constants as unsigned
 long long.
Date: Mon, 6 Jan 2020 11:07:08 +1000
Message-ID: <CACAvsv7ESe6r-qK2s7o=fRygumo986J0vySnYFVJYZDkuraGaQ@mail.gmail.com>
References: <20200102122548.25696-1-wambui.karugax@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200102122548.25696-1-wambui.karugax@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wambui Karuga <wambui.karugax@gmail.com>
Cc: Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, ML nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On Fri, 3 Jan 2020 at 05:29, Wambui Karuga <wambui.karugax@gmail.com> wrote:
>
> Explicitly declare constants as unsigned long long to address the
> following sparse warnings:
> warning: constant is so big it is long
>
> v2: convert to unsigned long long for compatibility with 32-bit
> architectures.
>
> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
> Suggested by: lia Mirkin <imirkin@alum.mit.edu>
Thanks!

> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf100.c | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf108.c | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm107.c | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm200.c | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf100.c
> index ac87a3b6b7c9..ba43fe158b22 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf100.c
> @@ -655,7 +655,7 @@ gf100_ram_new_(const struct nvkm_ram_func *func,
>
>  static const struct nvkm_ram_func
>  gf100_ram = {
> -       .upper = 0x0200000000,
> +       .upper = 0x0200000000ULL,
>         .probe_fbp = gf100_ram_probe_fbp,
>         .probe_fbp_amount = gf100_ram_probe_fbp_amount,
>         .probe_fbpa_amount = gf100_ram_probe_fbpa_amount,
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf108.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf108.c
> index 70a06e3cd55a..d97fa43efb91 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf108.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf108.c
> @@ -43,7 +43,7 @@ gf108_ram_probe_fbp_amount(const struct nvkm_ram_func *func, u32 fbpao,
>
>  static const struct nvkm_ram_func
>  gf108_ram = {
> -       .upper = 0x0200000000,
> +       .upper = 0x0200000000ULL,
>         .probe_fbp = gf100_ram_probe_fbp,
>         .probe_fbp_amount = gf108_ram_probe_fbp_amount,
>         .probe_fbpa_amount = gf100_ram_probe_fbpa_amount,
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c
> index 456aed1f2a02..d350d92852d2 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c
> @@ -1698,7 +1698,7 @@ gk104_ram_new_(const struct nvkm_ram_func *func, struct nvkm_fb *fb,
>
>  static const struct nvkm_ram_func
>  gk104_ram = {
> -       .upper = 0x0200000000,
> +       .upper = 0x0200000000ULL,
>         .probe_fbp = gf100_ram_probe_fbp,
>         .probe_fbp_amount = gf108_ram_probe_fbp_amount,
>         .probe_fbpa_amount = gf100_ram_probe_fbpa_amount,
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm107.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm107.c
> index 27c68e3f9772..be91da854dca 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm107.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm107.c
> @@ -33,7 +33,7 @@ gm107_ram_probe_fbp(const struct nvkm_ram_func *func,
>
>  static const struct nvkm_ram_func
>  gm107_ram = {
> -       .upper = 0x1000000000,
> +       .upper = 0x1000000000ULL,
>         .probe_fbp = gm107_ram_probe_fbp,
>         .probe_fbp_amount = gf108_ram_probe_fbp_amount,
>         .probe_fbpa_amount = gf100_ram_probe_fbpa_amount,
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm200.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm200.c
> index 6b0cac1fe7b4..8f91ea91ee25 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm200.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm200.c
> @@ -48,7 +48,7 @@ gm200_ram_probe_fbp_amount(const struct nvkm_ram_func *func, u32 fbpao,
>
>  static const struct nvkm_ram_func
>  gm200_ram = {
> -       .upper = 0x1000000000,
> +       .upper = 0x1000000000ULL,
>         .probe_fbp = gm107_ram_probe_fbp,
>         .probe_fbp_amount = gm200_ram_probe_fbp_amount,
>         .probe_fbpa_amount = gf100_ram_probe_fbpa_amount,
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c
> index adb62a6beb63..378f6fb70990 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c
> @@ -79,7 +79,7 @@ gp100_ram_probe_fbpa(struct nvkm_device *device, int fbpa)
>
>  static const struct nvkm_ram_func
>  gp100_ram = {
> -       .upper = 0x1000000000,
> +       .upper = 0x1000000000ULL,
>         .probe_fbp = gm107_ram_probe_fbp,
>         .probe_fbp_amount = gm200_ram_probe_fbp_amount,
>         .probe_fbpa_amount = gp100_ram_probe_fbpa,
> --
> 2.17.1
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
