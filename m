From: Karol Herbst <karolherbst@gmail.com>
Subject: Re: [Nouveau] [PATCH] [RESEND] drm/nouveau/clk: fix gcc-7
 -Wint-in-bool-context warning
Date: Wed, 6 Sep 2017 16:20:59 +0200
Message-ID: <CAEXux-YvOeosEpZ9jCUsyLG2PUY=97KHcWDZJHxbZpo_paDu9w@mail.gmail.com>
References: <20170906135628.3513172-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170906135628.3513172-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, ML nouveau <nouveau@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On Wed, Sep 6, 2017 at 3:56 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> gcc thinks that interpreting a multiplication result as a bool
> is confusing:
>
> drivers/gpu/drm/nouveau/nvkm/subdev/clk/gt215.c: In function 'read_pll':
> drivers/gpu/drm/nouveau/nvkm/subdev/clk/gt215.c:133:8: error: '*' in boolean context, suggest '&&' instead [-Werror=int-in-bool-context]
>
> In this instance, I think using multiplication is more intuitive
> than '&&', so I'm adding a comparison to zero instead to shut up
> the warning. To further improve readability, I also make the
> error case indented and leave the normal case as the final 'return'
> statement.
>

I think to make perfectly clear why this check is done, we simply
should precompute the denominator and do something like this:

int denominator = M * P
if (denominator == 0)
   return 0;
return sclk * N / denominator;

but with a better name for "denominator". I even imagine, that there
are some macros in the kernel for dealing with something like this
already, so that we could do instead:

return AWESOME_DIV_MACRO(sclk * N, M * P)

> Fixes: 7632b30e4b8b ("drm/nouveau/clk: namespace + nvidia gpu names (no binary change)")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> Originally submitted on July 14, but no reply. This is the same
> patch again. The warning is currently disabled in mainline, but
> I think we can turn it back on in the future, and this change here
> seems harmless.
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/clk/gt215.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gt215.c b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gt215.c
> index 96e0941c8edd..04b4f4ccf186 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gt215.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gt215.c
> @@ -130,10 +130,10 @@ read_pll(struct gt215_clk *clk, int idx, u32 pll)
>                 sclk = read_clk(clk, 0x10 + idx, false);
>         }
>
> -       if (M * P)
> -               return sclk * N / (M * P);
> +       if (M * P == 0)
> +               return 0;
>
> -       return 0;
> +       return sclk * N / (M * P);
>  }
>
>  static int
> --
> 2.9.0
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
