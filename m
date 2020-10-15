From: Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH RFC] drm/nouveau: fix memory leak in
 nvkm_iccsense_oneinit
Date: Thu, 15 Oct 2020 18:32:58 +0200
Message-ID: <CACO55ttZCVZM2v1oWRq7mzZy3DVDe3h1fH80D6RNFM3xR4VjuQ@mail.gmail.com>
References: <20201014075419.19974-1-keitasuzuki.park@sslab.ics.keio.ac.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20201014075419.19974-1-keitasuzuki.park-J/W0InCDlBIwdLcovteNB+0/RLrZM5er@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: takafumi-J/W0InCDlBIwdLcovteNB+0/RLrZM5er@public.gmane.org, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Keita Suzuki <keitasuzuki.park-J/W0InCDlBIwdLcovteNB+0/RLrZM5er@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Ben, I think this is like the 5th patch tackling this issue, I think
we should merge one of those.

On Thu, Oct 15, 2020 at 6:23 AM Keita Suzuki
<keitasuzuki.park-J/W0InCDlBIwdLcovteNB+0/RLrZM5er@public.gmane.org> wrote:
>
> struct pw_rail_t is allocated as an array in function nvios_iccsense_parse,
> and stored to a struct member of local variable. However, the array is not
> freed when the local variable becomes invalid, and the reference is not
> passed on, leading to a memory leak.
>
> Fix this by freeing struct pw_rail_t when exiting nvkm_iccsense_oneinit.
>
> Signed-off-by: Keita Suzuki <keitasuzuki.park-J/W0InCDlBIwdLcovteNB+0/RLrZM5er@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
> index fecfa6afcf54..8ba8d8e3f52a 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
> @@ -280,8 +280,10 @@ nvkm_iccsense_oneinit(struct nvkm_subdev *subdev)
>                         }
>
>                         rail = kmalloc(sizeof(*rail), GFP_KERNEL);
> -                       if (!rail)
> +                       if (!rail) {
> +                               kfree(stbl.rail);
>                                 return -ENOMEM;
> +                       }
>
>                         rail->read = read;
>                         rail->sensor = sensor;
> @@ -291,6 +293,7 @@ nvkm_iccsense_oneinit(struct nvkm_subdev *subdev)
>                         list_add_tail(&rail->head, &iccsense->rails);
>                 }
>         }
> +       kfree(stbl.rail);
>         return 0;
>  }
>
> --
> 2.17.1
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>
