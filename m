From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nv50/disp: prevent false output detection
 on the original nv50
Date: Wed, 4 Sep 2013 11:07:05 +1000
Message-ID: <CACAvsv6o7XECaVQvDeQBS4iacruV6LzTeE8BzQyWjSfhT79Skg@mail.gmail.com>
References: <1377279822-29675-1-git-send-email-emil.l.velikov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1377279822-29675-1-git-send-email-emil.l.velikov@gmail.com>
Sender: stable-owner@vger.kernel.org
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Ben Skeggs <bskeggs@redhat.com>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, stable@vger.kernel.org
List-Id: nouveau.vger.kernel.org

On Sat, Aug 24, 2013 at 3:43 AM, Emil Velikov <emil.l.velikov@gmail.com> wrote:
> Commit ea9197cc323839ef3d5280c0453b2c622caa6bc7 effectively enabled the
> use of an improved DAC detection code, but introduced a regression on
> the original nv50 chipset, causing a ghost monitor to be detected.
Hey Emil,

I've merged this patch, modified (after some experimenting on both
NV50 and GK106) to make this change unconditional for all chipsets.

Thanks :)

Ben.

>
> Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=67382
> Tested-by: Martin Peres <martin.peres@labri.fr>
> Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> Cc: <stable@vger.kernel.org> # 3.9+
> ---
>  drivers/gpu/drm/nouveau/core/engine/disp/dacnv50.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/dacnv50.c b/drivers/gpu/drm/nouveau/core/engine/disp/dacnv50.c
> index f02fd9f..15df527 100644
> --- a/drivers/gpu/drm/nouveau/core/engine/disp/dacnv50.c
> +++ b/drivers/gpu/drm/nouveau/core/engine/disp/dacnv50.c
> @@ -55,7 +55,14 @@ nv50_dac_sense(struct nv50_disp_priv *priv, int or, u32 loadval)
>         nv_wr32(priv, 0x61a00c + doff, 0x00100000 | loadval);
>         mdelay(9);
>         udelay(500);
> -       nv_wr32(priv, 0x61a00c + doff, 0x80000000);
> +
> +       /*
> +        * The original nv50 detects a ghost monitor if we do the following
> +        * write. See fdo#67382 for more information
> +        */
> +       if (nv_device(priv)->chipset != 0x50)
> +               nv_wr32(priv, 0x61a00c + doff, 0x80000000);
> +
>         load = (nv_rd32(priv, 0x61a00c + doff) & 0x38000000) >> 27;
>         nv_wr32(priv, 0x61a00c + doff, 0x00000000);
>         nv_mask(priv, 0x61a004 + doff, 0x807f0000, 0x80550000);
> --
> 1.8.3.4
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
