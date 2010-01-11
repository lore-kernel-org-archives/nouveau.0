From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] drm/nv50: wait for pgraph to idle before
	unloading the context
Date: Mon, 11 Jan 2010 21:20:15 +0100
Message-ID: <6d4bc9fc1001111220q2025bb8h862577a208831a00@mail.gmail.com>
References: <1263241133-13499-1-git-send-email-madman2003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1263241133-13499-1-git-send-email-madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This patch alone, so ignore the 3/3. I think this fixes the channel
unload hang issues in a less obscure way. Feedback appreciated as
usual.

On Mon, Jan 11, 2010 at 9:18 PM, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wr=
ote:
> - This should fix the problem with gpu hangs people have had when closing
> channels.
>
> Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> =A0drivers/gpu/drm/nouveau/nv50_graph.c | =A0 =A01 +
> =A01 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nv50_graph.c b/drivers/gpu/drm/nouve=
au/nv50_graph.c
> index 444a46b..d6897cf 100644
> --- a/drivers/gpu/drm/nouveau/nv50_graph.c
> +++ b/drivers/gpu/drm/nouveau/nv50_graph.c
> @@ -282,6 +282,7 @@ nv50_graph_unload_context(struct drm_device *dev)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 0;
> =A0 =A0 =A0 =A0inst &=3D NV50_PGRAPH_CTXCTL_CUR_INSTANCE;
>
> + =A0 =A0 =A0 nouveau_wait_for_idle(dev);
> =A0 =A0 =A0 =A0nv_wr32(dev, 0x400500, fifo & ~1);
> =A0 =A0 =A0 =A0nv_wr32(dev, 0x400784, inst);
> =A0 =A0 =A0 =A0nv_wr32(dev, 0x400824, nv_rd32(dev, 0x400824) | 0x20);
> --
> 1.6.6
>
>
