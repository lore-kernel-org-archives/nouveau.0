From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: [PATCH] drm/nouveau/imem/nv50: fix incorrect use of refcount API
Date: Mon, 18 Dec 2017 09:27:19 +0100
Message-ID: <CAKv+Gu-2xLOZjvDM7-PtxsQJKPdO1H5DgBL7zA91HSMa23=zPg@mail.gmail.com>
References: <20171208183034.9027-1-ard.biesheuvel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171208183034.9027-1-ard.biesheuvel@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>, nouveau@lists.freedesktop.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>
List-Id: nouveau.vger.kernel.org

On 8 December 2017 at 19:30, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
> Commit be55287aa5b ("drm/nouveau/imem/nv50: embed nvkm_instobj directly
> into nv04_instobj") introduced some new calls to the refcount api to
> the nv50 mapping code. In one particular instance, it does the
> following:
>
>     if (!refcount_inc_not_zero(&iobj->maps)) {
>             ...
>             refcount_inc(&iobj->maps);
>     }
>
> i.e., it calls refcount_inc() to increment the refcount when it is known
> to be zero, which is explicitly forbidden by the API. Instead, use
> refcount_set() to set it to 1.
>
> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> ---
>
> Apologies if this was already found and fixed. I don't usually follow
> the DRM or nouveau mailing lists.
>
>  drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
> index 1ba7289684aa..db48a1daca0c 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
> @@ -249,7 +249,7 @@ nv50_instobj_acquire(struct nvkm_memory *memory)
>                         iobj->base.memory.ptrs = &nv50_instobj_fast;
>                 else
>                         iobj->base.memory.ptrs = &nv50_instobj_slow;
> -               refcount_inc(&iobj->maps);
> +               refcount_set(&iobj->maps, 1);
>         }
>
>         mutex_unlock(&imem->subdev.mutex);
> --
> 2.11.0
>

Ping?
