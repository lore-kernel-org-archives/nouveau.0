From: Sean Paul <seanpaul@google.com>
Subject: Re: [PATCH v2] drm/nouveau/gr: mark gm107_grctx_generate_tpcid() static
Date: Mon, 29 Aug 2016 12:01:58 -0400
Message-ID: <CAOw6vbL9C1o+-1w1=cuwazhS6CqhofsiBbBZjYvBsDT+_dcQ6A@mail.gmail.com>
References: <1472475747-30296-1-git-send-email-baoyou.xie@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1472475747-30296-1-git-send-email-baoyou.xie@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Baoyou Xie <baoyou.xie@linaro.org>
Cc: bskeggs@redhat.com, Dave Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>, nouveau@lists.freedesktop.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, xie.baoyou@zte.com.cn
List-Id: nouveau.vger.kernel.org

On Mon, Aug 29, 2016 at 9:02 AM, Baoyou Xie <baoyou.xie@linaro.org> wrote:
> We get 1 warning when build kernel with W=1:
> drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm107.c:937:1: warning: no previous prototype for 'gm107_grctx_generate_tpcid' [-Wmissing-prototypes]
>
> In fact, this function is only used in the file in which it is
> declared and don't need a declaration, but can be made static.
> so this patch marks this function with 'static'.
>

It would make things a lot easier if you either consolidated all of
these static changes into one patch, or released them as a series.

Sean


> Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm107.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm107.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm107.c
> index 6d3c501..4c4b5ab 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm107.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm107.c
> @@ -933,7 +933,7 @@ gm107_grctx_generate_attrib(struct gf100_grctx *info)
>         }
>  }
>
> -void
> +static void
>  gm107_grctx_generate_tpcid(struct gf100_gr *gr)
>  {
>         struct nvkm_device *device = gr->base.engine.subdev.device;
> --
> 2.7.4
>
