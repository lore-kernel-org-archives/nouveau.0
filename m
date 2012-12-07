From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH] drm/nouveau: report channel owner in
 error messages
Date: Fri, 7 Dec 2012 14:46:53 +1000
Message-ID: <20121207044653.GA5493@turiel.bne.redhat.com>
References: <20121205225622.GA2301@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20121205225622.GA2301-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, Dec 05, 2012 at 11:56:22PM +0100, Marcin Slusarz wrote:
> Full piglit run with this patch:
> http://people.freedesktop.org/~mslusarz/chan_owners.txt
> 
> This patch covers only a small subset of all error messages, so:
> Not-yet-signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> Comments? Ideas?
Very nice idea.  I'll put a little bit of thought into it, but I think
it's looking good.  More comments where appropriate inline.

> 
> (This commit depends on this one:
> http://people.freedesktop.org/~mslusarz/0001-drm-nouveau-split-fifo-interrupt-handler.patch )
> ---
>  core/engine/fifo/nv04.c    |   43 +++++++++++++++++++++++++++++-------
>  core/engine/graph/nv50.c   |   14 +++++++++--
>  core/include/core/client.h |    2 -
>  core/subdev/fb/nv50.c      |   53 ++++++++++++++++++++++++++++++++++++++++++---
>  nouveau_drm.c              |    5 ++--
>  5 files changed, 100 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/core/engine/fifo/nv04.c b/drivers/gpu/drm/nouveau/core/engine/fifo/nv04.c
> index 76944c4..f5d4d28 100644
> --- a/drivers/gpu/drm/nouveau/core/engine/fifo/nv04.c
> +++ b/drivers/gpu/drm/nouveau/core/engine/fifo/nv04.c
> @@ -24,6 +24,7 @@
>  
>  #include <core/os.h>
>  #include <core/class.h>
> +#include <core/client.h>
>  #include <core/engctx.h>
>  #include <core/namedb.h>
>  #include <core/handle.h>
> @@ -398,10 +399,29 @@ out:
>  	return handled;
>  }
>  
> +static struct nouveau_client *
> +nv04_fifo_client_for_chid(struct nv04_fifo_priv *priv, u32 chid)
> +{
> +	struct nouveau_fifo_chan *chan;
> +	struct nouveau_client *client = NULL;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&priv->base.lock, flags);
> +	if (chid >= priv->base.min &&
> +			chid <= priv->base.max) {
> +		chan = (void *)priv->base.channel[chid];
> +		client = nouveau_client(chan);
> +	}
> +	spin_unlock_irqrestore(&priv->base.lock, flags);
> +
> +	return client;
> +}
> +
>  static void
>  nv04_fifo_cache_error(struct nouveau_device *device,
>  		struct nv04_fifo_priv *priv, u32 chid, u32 get)
>  {
> +	struct nouveau_client *client;
>  	u32 mthd, data;
>  	int ptr;
>  
> @@ -421,9 +441,12 @@ nv04_fifo_cache_error(struct nouveau_device *device,
>  	}
>  
>  	if (!nv04_fifo_swmthd(priv, chid, mthd, data)) {
> +		client = nv04_fifo_client_for_chid(priv, chid);
> +
>  		nv_error(priv,
> -			 "CACHE_ERROR - Ch %d/%d Mthd 0x%04x Data 0x%08x\n",
> -			 chid, (mthd >> 13) & 7, mthd & 0x1ffc, data);
> +			 "CACHE_ERROR - Ch %d/%d [%s] Mthd 0x%04x Data 0x%08x\n",
> +			 chid, (mthd >> 13) & 7, client ? client->name : "unk",
> +			 mthd & 0x1ffc, data);
>  	}
>  
>  	nv_wr32(priv, NV04_PFIFO_CACHE1_DMA_PUSH, 0);
> @@ -445,11 +468,14 @@ static void
>  nv04_fifo_dma_pusher(struct nouveau_device *device, struct nv04_fifo_priv *priv,
>  		u32 chid)
>  {
> +	struct nouveau_client *client;
>  	u32 dma_get = nv_rd32(priv, 0x003244);
>  	u32 dma_put = nv_rd32(priv, 0x003240);
>  	u32 push = nv_rd32(priv, 0x003220);
>  	u32 state = nv_rd32(priv, 0x003228);
>  
> +	client = nv04_fifo_client_for_chid(priv, chid);
> +
>  	if (device->card_type == NV_50) {
>  		u32 ho_get = nv_rd32(priv, 0x003328);
>  		u32 ho_put = nv_rd32(priv, 0x003320);
> @@ -457,9 +483,10 @@ nv04_fifo_dma_pusher(struct nouveau_device *device, struct nv04_fifo_priv *priv,
>  		u32 ib_put = nv_rd32(priv, 0x003330);
>  
>  		nv_error(priv,
> -			 "DMA_PUSHER - Ch %d Get 0x%02x%08x Put 0x%02x%08x IbGet 0x%08x IbPut 0x%08x State 0x%08x (err: %s) Push 0x%08x\n",
> -			 chid, ho_get, dma_get, ho_put, dma_put, ib_get, ib_put,
> -			 state, nv_dma_state_err(state), push);
> +			 "DMA_PUSHER - Ch %d [%s] Get 0x%02x%08x Put 0x%02x%08x IbGet 0x%08x IbPut 0x%08x State 0x%08x (err: %s) Push 0x%08x\n",
> +			 chid, client ? client->name : "unk", ho_get, dma_get,
> +			 ho_put, dma_put, ib_get, ib_put, state,
> +			 nv_dma_state_err(state), push);
>  
>  		/* METHOD_COUNT, in DMA_STATE on earlier chipsets */
>  		nv_wr32(priv, 0x003364, 0x00000000);
> @@ -471,9 +498,9 @@ nv04_fifo_dma_pusher(struct nouveau_device *device, struct nv04_fifo_priv *priv,
>  			nv_wr32(priv, 0x003334, ib_put);
>  	} else {
>  		nv_error(priv,
> -			 "DMA_PUSHER - Ch %d Get 0x%08x Put 0x%08x State 0x%08x (err: %s) Push 0x%08x\n",
> -			 chid, dma_get, dma_put, state, nv_dma_state_err(state),
> -			 push);
> +			 "DMA_PUSHER - Ch %d [%s] Get 0x%08x Put 0x%08x State 0x%08x (err: %s) Push 0x%08x\n",
> +			 chid, client ? client->name : "unk", dma_get, dma_put,
> +			 state, nv_dma_state_err(state), push);
>  
>  		if (dma_get != dma_put)
>  			nv_wr32(priv, 0x003244, dma_put);
> diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c b/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
> index b1c3d83..f2935ed 100644
> --- a/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
> +++ b/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
> @@ -24,6 +24,7 @@
>  
>  #include <core/os.h>
>  #include <core/class.h>
> +#include <core/client.h>
>  #include <core/handle.h>
>  #include <core/engctx.h>
>  #include <core/enum.h>
> @@ -786,12 +787,19 @@ nv50_graph_intr(struct nouveau_subdev *subdev)
>  	nv_wr32(priv, 0x400500, 0x00010001);
>  
>  	if (show) {
> +		const char *client_name = "unk";
> +		if (engctx) {
> +			struct nouveau_client *client = nouveau_client(engctx);
> +			if (client)
> +				client_name = client->name;
> +		}
>  		nv_error(priv, "");
>  		nouveau_bitfield_print(nv50_graph_intr_name, show);
>  		printk("\n");
> -		nv_error(priv, "ch %d [0x%010llx] subc %d class 0x%04x "
> -			       "mthd 0x%04x data 0x%08x\n",
> -			 chid, (u64)inst << 12, subc, class, mthd, data);
> +		nv_error(priv,
> +			 "ch %d [0x%010llx %s] subc %d class 0x%04x mthd 0x%04x data 0x%08x\n",
> +			 chid, (u64)inst << 12, client_name, subc, class, mthd,
> +			 data);
>  	}
>  
>  	if (nv_rd32(priv, 0x400824) & (1 << 31))
> diff --git a/drivers/gpu/drm/nouveau/core/include/core/client.h b/drivers/gpu/drm/nouveau/core/include/core/client.h
> index 0193532..8feba2f 100644
> --- a/drivers/gpu/drm/nouveau/core/include/core/client.h
> +++ b/drivers/gpu/drm/nouveau/core/include/core/client.h
> @@ -7,7 +7,7 @@ struct nouveau_client {
>  	struct nouveau_namedb base;
>  	struct nouveau_handle *root;
>  	struct nouveau_object *device;
> -	char name[16];
> +	char name[32];
>  	u32 debug;
>  	struct nouveau_vm *vm;
>  };
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/nv50.c b/drivers/gpu/drm/nouveau/core/subdev/fb/nv50.c
> index 487cb8c..d1120fc 100644
> --- a/drivers/gpu/drm/nouveau/core/subdev/fb/nv50.c
> +++ b/drivers/gpu/drm/nouveau/core/subdev/fb/nv50.c
> @@ -22,8 +22,13 @@
>   * Authors: Ben Skeggs
>   */
>  
> -#include <core/object.h>
> +#include <core/client.h>
>  #include <core/enum.h>
> +#include <core/engctx.h>
> +#include <core/object.h>
> +
> +#include <engine/fifo.h>
> +#include <engine/graph.h>
>  
>  #include <subdev/fb.h>
>  #include <subdev/bios.h>
> @@ -317,6 +322,19 @@ static const struct nouveau_enum vm_engine[] = {
>  	{}
>  };
>  
> +static const struct nouveau_engine_map {
> +	u32 value;
> +	int engines[3];
> +} nvdev_engine_for_vm_engine[] = {
> +	{ 0x00000000, {NVDEV_ENGINE_GR, 0} },
> +	{ 0x00000001, {NVDEV_ENGINE_VP, 0} },
> +	{ 0x00000005, {NVDEV_ENGINE_FIFO, 0} },
> +	{ 0x00000008, {NVDEV_ENGINE_PPP, NVDEV_ENGINE_MPEG, 0} },
I think it may actually be a good idea to go (in core/device.h):

  NVDEV_ENGINE_MPEG,
+ NVDEV_ENGINE_PPP = NVDEV_ENGINE_MPEG,
  NVDEV_ENGINE_ME,

PPP got introduced when MPEG disappeared.  There's likely a few other
engines we can create as aliases for each other too.  What do you think?

I can handle the aliasing if you like, but feel free :)

> +	{ 0x00000009, {NVDEV_ENGINE_BSP, 0} },
> +	{ 0x0000000a, {NVDEV_ENGINE_CRYPT, 0} },
> +	{ 0x0000000d, {NVDEV_ENGINE_COPY0, NVDEV_ENGINE_COPY1, 0} },
COPY1 doesn't exist on NV50.  NVC0 has its own VM engine for the
additional copy engines.

> +};
> +
>  static const struct nouveau_enum vm_fault[] = {
>  	{ 0x00000000, "PT_NOT_PRESENT", NULL },
>  	{ 0x00000001, "PT_TOO_SHORT", NULL },
> @@ -334,8 +352,12 @@ static void
>  nv50_fb_intr(struct nouveau_subdev *subdev)
>  {
>  	struct nouveau_device *device = nv_device(subdev);
> +	struct nouveau_engine *engine = NULL;
>  	struct nv50_fb_priv *priv = (void *)subdev;
>  	const struct nouveau_enum *en, *cl;
> +	struct nouveau_object *engctx = NULL;
> +	const int *poss_engines = NULL;
> +	const char *client_name = "unk";
>  	u32 trap[6], idx, chan;
>  	u8 st0, st1, st2, st3;
>  	int i;
> @@ -366,9 +388,34 @@ nv50_fb_intr(struct nouveau_subdev *subdev)
>  	}
>  	chan = (trap[2] << 16) | trap[1];
>  
> -	nv_error(priv, "trapped %s at 0x%02x%04x%04x on channel 0x%08x ",
> +	for (i = 0; i < ARRAY_SIZE(nvdev_engine_for_vm_engine); ++i) {
> +		if (nvdev_engine_for_vm_engine[i].value == st0) {
> +			poss_engines = nvdev_engine_for_vm_engine[i].engines;
> +			break;
> +		}
> +	}
> +
> +	for (i = 0; poss_engines && poss_engines[i]; ++i) {
> +		engine = nv_engine(device->subdev[poss_engines[i]]);
engine = nouveau_engine(device, poss_engines[i]);

Perhaps you can even append another field to nouveau_enum to store the
subdev index in too, rather than having to look it up?

> +		if (engine) {
> +			engctx = nouveau_engctx_get(engine, chan);
> +			if (engctx)
> +				break;
> +		}
> +	}
> +
> +	if (engctx) {
> +		struct nouveau_client *client = nouveau_client(engctx);
> +		if (client)
> +			client_name = client->name;
> +	}
> +
> +	nv_error(priv, "trapped %s at 0x%02x%04x%04x on channel 0x%08x [%s] ",
>  		 (trap[5] & 0x00000100) ? "read" : "write",
> -		 trap[5] & 0xff, trap[4] & 0xffff, trap[3] & 0xffff, chan);
> +		 trap[5] & 0xff, trap[4] & 0xffff, trap[3] & 0xffff, chan,
> +		 client_name);
> +
> +	nouveau_engctx_put(engctx);
>  
>  	en = nouveau_enum_find(vm_engine, st0);
>  	if (en)
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index 38e9a08..a50362e 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -539,10 +539,11 @@ nouveau_drm_open(struct drm_device *dev, struct drm_file *fpriv)
>  	struct pci_dev *pdev = dev->pdev;
>  	struct nouveau_drm *drm = nouveau_drm(dev);
>  	struct nouveau_cli *cli;
> -	char name[16];
> +	char name[32], tmpname[TASK_COMM_LEN];
>  	int ret;
>  
> -	snprintf(name, sizeof(name), "%d", pid_nr(fpriv->pid));
> +	get_task_comm(tmpname, current);
> +	snprintf(name, sizeof(name), "%s[%d]", tmpname, pid_nr(fpriv->pid));
>  
>  	ret = nouveau_cli_create(pdev, name, sizeof(*cli), (void **)&cli);
>  	if (ret)
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
