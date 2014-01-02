From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nve4: fix size of POLY2ESETUP buffer
	(s/gpc_nr/tpc_total)
Date: Thu, 2 Jan 2014 21:37:59 +1000
Message-ID: <CACAvsv6ZBmLOWiuWxALbjc9-J+RQ2S7qMxGaBTQ9P6xzeDkMxQ@mail.gmail.com>
References: <1387990920-15919-1-git-send-email-e0425955@student.tuwien.ac.at>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1387990920-15919-1-git-send-email-e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Thu, Dec 26, 2013 at 3:02 AM, Christoph Bumiller
<e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org> wrote:
> This fixes write faults from GPCCLIENT 5 in geometry shader tests.
>
> For now this is just a guess from a single mmio trace, it looks
> like 8 large pages are being used, i.e. one per TPC.
>
> Can we just ask NV for the correct sizes ?
https://android.googlesource.com/kernel/tegra/+/android-tegra-3.10/drivers/video/tegra/host/gk20a/gr_gk20a.c
might be of some help here.

The buffer in question is the "attribute buffer"


> ---
>  drivers/gpu/drm/nouveau/core/engine/graph/ctxnve4.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/ctxnve4.c b/drivers/gpu/drm/nouveau/core/engine/graph/ctxnve4.c
> index e2de73e..fc1cc32 100644
> --- a/drivers/gpu/drm/nouveau/core/engine/graph/ctxnve4.c
> +++ b/drivers/gpu/drm/nouveau/core/engine/graph/ctxnve4.c
> @@ -813,7 +813,7 @@ nve4_grctx_generate_mods(struct nvc0_graph_priv *priv, struct nvc0_grctx *info)
>
>         mmio_data(0x003000, 0x0100, NV_MEM_ACCESS_RW | NV_MEM_ACCESS_SYS);
>         mmio_data(0x008000, 0x0100, NV_MEM_ACCESS_RW | NV_MEM_ACCESS_SYS);
> -       mmio_data(0x060000, 0x1000, NV_MEM_ACCESS_RW);
> +       mmio_data(priv->tpc_total << 17, 0x1000, NV_MEM_ACCESS_RW);
>         mmio_list(0x40800c, 0x00000000,  8, 1);
>         mmio_list(0x408010, 0x80000000,  0, 0);
>         mmio_list(0x419004, 0x00000000,  8, 1);
> --
> 1.8.1.5
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
