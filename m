From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/4] drm/nv50: avoid unloading pgraph context
	when ctxprog is running
Date: Mon, 1 Feb 2010 19:40:46 +0100
Message-ID: <6d4bc9fc1002011040i538bda6o7f4eb24ac4a4579a@mail.gmail.com>
References: <1265049275-7680-1-git-send-email-madman2003@gmail.com>
	<1265049275-7680-2-git-send-email-madman2003@gmail.com>
	<1265049275-7680-3-git-send-email-madman2003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1265049275-7680-3-git-send-email-madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

Someone should probably check this out on earlier cards as well.

On Mon, Feb 1, 2010 at 7:34 PM, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wro=
te:
> - We need to disable pgraph fifo access before checking the current chann=
el,
> otherwise we could still hit a running ctxprog.
> - The writes to 0x400500 are already handled by pgraph->fifo_access and a=
re
> therefore redundant, moreover pgraph fifo access should not be reenabled =
before
> current context is set as invalid. So remove them altogether.
>
> Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> =A0drivers/gpu/drm/nouveau/nouveau_channel.c | =A0 =A07 +++----
> =A0drivers/gpu/drm/nouveau/nv50_graph.c =A0 =A0 =A0| =A0 10 +++++++---
> =A02 files changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_channel.c b/drivers/gpu/drm/=
nouveau/nouveau_channel.c
> index 343d718..2281f99 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_channel.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_channel.c
> @@ -278,12 +278,11 @@ nouveau_channel_free(struct nouveau_channel *chan)
> =A0 =A0 =A0 =A0/* Ensure the channel is no longer active on the GPU */
> =A0 =A0 =A0 =A0pfifo->reassign(dev, false);
>
> - =A0 =A0 =A0 if (pgraph->channel(dev) =3D=3D chan) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 pgraph->fifo_access(dev, false);
> + =A0 =A0 =A0 pgraph->fifo_access(dev, false);
> + =A0 =A0 =A0 if (pgraph->channel(dev) =3D=3D chan)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pgraph->unload_context(dev);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 pgraph->fifo_access(dev, true);
> - =A0 =A0 =A0 }
> =A0 =A0 =A0 =A0pgraph->destroy_context(chan);
> + =A0 =A0 =A0 pgraph->fifo_access(dev, true);
>
> =A0 =A0 =A0 =A0if (pfifo->channel_id(dev) =3D=3D chan->id) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pfifo->disable(dev);
> diff --git a/drivers/gpu/drm/nouveau/nv50_graph.c b/drivers/gpu/drm/nouve=
au/nv50_graph.c
> index 20319e5..6d50480 100644
> --- a/drivers/gpu/drm/nouveau/nv50_graph.c
> +++ b/drivers/gpu/drm/nouveau/nv50_graph.c
> @@ -165,6 +165,12 @@ nv50_graph_channel(struct drm_device *dev)
> =A0 =A0 =A0 =A0uint32_t inst;
> =A0 =A0 =A0 =A0int i;
>
> + =A0 =A0 =A0 /* Be sure we're not in the middle of a context switch or b=
ad things
> + =A0 =A0 =A0 =A0* will happen, such as unloading the wrong pgraph contex=
t.
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 if (!nv_wait(0x400300, 0x00000001, 0x00000000))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_ERROR(dev, "Ctxprog is still running\n");
> +
> =A0 =A0 =A0 =A0inst =3D nv_rd32(dev, NV50_PGRAPH_CTXCTL_CUR);
> =A0 =A0 =A0 =A0if (!(inst & NV50_PGRAPH_CTXCTL_CUR_LOADED))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return NULL;
> @@ -275,7 +281,7 @@ nv50_graph_load_context(struct nouveau_channel *chan)
> =A0int
> =A0nv50_graph_unload_context(struct drm_device *dev)
> =A0{
> - =A0 =A0 =A0 uint32_t inst, fifo =3D nv_rd32(dev, 0x400500);
> + =A0 =A0 =A0 uint32_t inst;
>
> =A0 =A0 =A0 =A0inst =A0=3D nv_rd32(dev, NV50_PGRAPH_CTXCTL_CUR);
> =A0 =A0 =A0 =A0if (!(inst & NV50_PGRAPH_CTXCTL_CUR_LOADED))
> @@ -283,12 +289,10 @@ nv50_graph_unload_context(struct drm_device *dev)
> =A0 =A0 =A0 =A0inst &=3D NV50_PGRAPH_CTXCTL_CUR_INSTANCE;
>
> =A0 =A0 =A0 =A0nouveau_wait_for_idle(dev);
> - =A0 =A0 =A0 nv_wr32(dev, 0x400500, fifo & ~1);
> =A0 =A0 =A0 =A0nv_wr32(dev, 0x400784, inst);
> =A0 =A0 =A0 =A0nv_wr32(dev, 0x400824, nv_rd32(dev, 0x400824) | 0x20);
> =A0 =A0 =A0 =A0nv_wr32(dev, 0x400304, nv_rd32(dev, 0x400304) | 0x01);
> =A0 =A0 =A0 =A0nouveau_wait_for_idle(dev);
> - =A0 =A0 =A0 nv_wr32(dev, 0x400500, fifo);
>
> =A0 =A0 =A0 =A0nv_wr32(dev, NV50_PGRAPH_CTXCTL_CUR, inst);
> =A0 =A0 =A0 =A0return 0;
> --
> 1.6.6.1
>
>
