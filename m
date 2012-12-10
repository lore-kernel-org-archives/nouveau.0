From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH] drm/nouveau: report channel owner in
 error messages
Date: Mon, 10 Dec 2012 21:16:51 +0100
Message-ID: <20121210201553.GA3130@joi.lan>
References: <20121205225622.GA2301@joi.lan>
	<20121207044653.GA5493@turiel.bne.redhat.com>
	<20121208232642.GA3984@joi.lan>
	<20121209044849.GA9384@turiel.redhat.com>
	<20121209110454.GA3059@joi.lan> <20121210084741.GA7197@turiel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20121210084741.GA7197@turiel>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, Dec 10, 2012 at 06:47:41PM +1000, Ben Skeggs wrote:
> On Sun, Dec 09, 2012 at 12:04:54PM +0100, Marcin Slusarz wrote:
> > On Sun, Dec 09, 2012 at 02:48:49PM +1000, Ben Skeggs wrote:
> > > > > > diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/nv50.c b/drivers/gpu/drm/nouveau/core/subdev/fb/nv50.c
> > > > > > index 487cb8c..d1120fc 100644
> > > > > > --- a/drivers/gpu/drm/nouveau/core/subdev/fb/nv50.c
> > > > > > +++ b/drivers/gpu/drm/nouveau/core/subdev/fb/nv50.c
> > > > > > @@ -22,8 +22,13 @@
> > > > > >   * Authors: Ben Skeggs
> > > > > >   */
> > > > > >  
> > > > > > -#include <core/object.h>
> > > > > > +#include <core/client.h>
> > > > > >  #include <core/enum.h>
> > > > > > +#include <core/engctx.h>
> > > > > > +#include <core/object.h>
> > > > > > +
> > > > > > +#include <engine/fifo.h>
> > > > > > +#include <engine/graph.h>
> > > > > >  
> > > > > >  #include <subdev/fb.h>
> > > > > >  #include <subdev/bios.h>
> > > > > > @@ -317,6 +322,19 @@ static const struct nouveau_enum vm_engine[] = {
> > > > > >  	{}
> > > > > >  };
> > > > > >  
> > > > > > +static const struct nouveau_engine_map {
> > > > > > +	u32 value;
> > > > > > +	int engines[3];
> > > > > > +} nvdev_engine_for_vm_engine[] = {
> > > > > > +	{ 0x00000000, {NVDEV_ENGINE_GR, 0} },
> > > > > > +	{ 0x00000001, {NVDEV_ENGINE_VP, 0} },
> > > > > > +	{ 0x00000005, {NVDEV_ENGINE_FIFO, 0} },
> > > > > > +	{ 0x00000008, {NVDEV_ENGINE_PPP, NVDEV_ENGINE_MPEG, 0} },
> > > > > I think it may actually be a good idea to go (in core/device.h):
> > > > > 
> > > > >   NVDEV_ENGINE_MPEG,
> > > > > + NVDEV_ENGINE_PPP = NVDEV_ENGINE_MPEG,
> > > > >   NVDEV_ENGINE_ME,
> > > > > 
> > > > > PPP got introduced when MPEG disappeared.  There's likely a few other
> > > > > engines we can create as aliases for each other too.  What do you think?
> > > > 
> > > > I'm not sure it's such a good idea. Suddenly nouveau_engctx_get(NVDEV_ENGINE_PPP, chan)
> > > > can return nouveau_mpeg_chan and device->subdev[NVDEV_ENGINE_PPP] can point
> > > > to nouveau_mpeg, etc. So in generic code you can't rely on device->subdev[X]
> > > > being NULL on cards which don't have X engine...
> > > This is true for non-engine subdevs, yes.  But, the engines themselves
> > > should *never* *ever* be accessed from anything other than the object
> > > interface, from which it's impossible for a mix-up to happen.
> > 
> > what does this code (in this patch) do then? For me, it does exactly what you
> > want to be forbidden.
> I probably wasn't very clear on what I meant, sorry about that.  What I
> meant is that there should never be any need to access anything specific
> to a certain engine type from code that doesn't belong to that engine,
> *except* for what's exposed by the object interface.
>
> So, accessing the nouveau_object/subdev/engine data is OK, accessing the
> nouveau_graph/copy/whatever should only be done by that module.

Thanks, I see your point now (and I agree it's valuable goal).

> Really,
> I should probably consider moving all the relevant structure definitions
> to a priv.h within the engine modules themselves.
> 
> > 
> > What are we going to do when we'll need to look up something in engine specific
> > data (e.g. nouveau_mpeg) to improve error reporting? We'll be screwed if
> > NVDEV_ENGINE_PPP == NVDEV_ENGINE_MPEG.
> What will we possibly need to do here?  The error data we get is
> signalled via an interrupt directly to the specific module, which will
> indeed be able to access its own private information.

Here, interrupts triggered by various engines are delivered to fb subdev, so
if we'll ever need to e.g. dump registers related to one of those engines
(or look up something in all contexts of said engine, or...), it will be much
harder. Sure, we can add another function pointer to nouveau_engine (or abuse
one of nouveau_ofuncs ;), but it feels a bit hacky...

For now it's only theoretical problem (we don't need engine specific data here),
but I think it's better to leave it as an option if possible. And I don't see
what can be improved by aliasing PPP to MPEG...

> > 
> > > If we do the aliasing this point should probably be documented in the
> > > enum list, and the nouveau_whatever() accessors removed.
> > 
> > But what's the point of all of this? Removal of one line from above list
> > is pretty weak upside when there are so many downsides. Maybe I'm missing
> > something obvious...
> > 
> > > > 
> > > > > 
> > > > > I can handle the aliasing if you like, but feel free :)
> > > > > 
> > > > > > +	{ 0x00000009, {NVDEV_ENGINE_BSP, 0} },
> > > > > > +	{ 0x0000000a, {NVDEV_ENGINE_CRYPT, 0} },
> > > > > > +	{ 0x0000000d, {NVDEV_ENGINE_COPY0, NVDEV_ENGINE_COPY1, 0} },
> > > > > COPY1 doesn't exist on NV50.  NVC0 has its own VM engine for the
> > > > > additional copy engines.
> > > > 
> > > > OK.
> > > > 
> > > > > > +};
> > > > > > +
> > > > > >  static const struct nouveau_enum vm_fault[] = {
> > > > > >  	{ 0x00000000, "PT_NOT_PRESENT", NULL },
> > > > > >  	{ 0x00000001, "PT_TOO_SHORT", NULL },
> > > > > > @@ -334,8 +352,12 @@ static void
> > > > > >  nv50_fb_intr(struct nouveau_subdev *subdev)
> > > > > >  {
> > > > > >  	struct nouveau_device *device = nv_device(subdev);
> > > > > > +	struct nouveau_engine *engine = NULL;
> > > > > >  	struct nv50_fb_priv *priv = (void *)subdev;
> > > > > >  	const struct nouveau_enum *en, *cl;
> > > > > > +	struct nouveau_object *engctx = NULL;
> > > > > > +	const int *poss_engines = NULL;
> > > > > > +	const char *client_name = "unk";
> > > > > >  	u32 trap[6], idx, chan;
> > > > > >  	u8 st0, st1, st2, st3;
> > > > > >  	int i;
> > > > > > @@ -366,9 +388,34 @@ nv50_fb_intr(struct nouveau_subdev *subdev)
> > > > > >  	}
> > > > > >  	chan = (trap[2] << 16) | trap[1];
> > > > > >  
> > > > > > -	nv_error(priv, "trapped %s at 0x%02x%04x%04x on channel 0x%08x ",
> > > > > > +	for (i = 0; i < ARRAY_SIZE(nvdev_engine_for_vm_engine); ++i) {
> > > > > > +		if (nvdev_engine_for_vm_engine[i].value == st0) {
> > > > > > +			poss_engines = nvdev_engine_for_vm_engine[i].engines;
> > > > > > +			break;
> > > > > > +		}
> > > > > > +	}
> > > > > > +
> > > > > > +	for (i = 0; poss_engines && poss_engines[i]; ++i) {
> > > > > > +		engine = nv_engine(device->subdev[poss_engines[i]]);
> > > > > engine = nouveau_engine(device, poss_engines[i]);
> > > > 
> > > > OK.
> > > > 
> > > > > Perhaps you can even append another field to nouveau_enum to store the
> > > > > subdev index in too, rather than having to look it up?
> > > > 
> > > > Good idea. Thanks.
> > > > 
> > > > > > +		if (engine) {
> > > > > > +			engctx = nouveau_engctx_get(engine, chan);
> > > > > > +			if (engctx)
> > > > > > +				break;
> > > > > > +		}
> > > > > > +	}
> > > > > > +
> > > > > > +	if (engctx) {
> > > > > > +		struct nouveau_client *client = nouveau_client(engctx);
> > > > > > +		if (client)
> > > > > > +			client_name = client->name;
> > > > > > +	}
> > > > > > +
> > > > > > +	nv_error(priv, "trapped %s at 0x%02x%04x%04x on channel 0x%08x [%s] ",
> > > > > >  		 (trap[5] & 0x00000100) ? "read" : "write",
> > > > > > -		 trap[5] & 0xff, trap[4] & 0xffff, trap[3] & 0xffff, chan);
> > > > > > +		 trap[5] & 0xff, trap[4] & 0xffff, trap[3] & 0xffff, chan,
> > > > > > +		 client_name);
> > > > > > +
> > > > > > +	nouveau_engctx_put(engctx);
> > > > > >  
> > > > > >  	en = nouveau_enum_find(vm_engine, st0);
> > > > > >  	if (en)
> > > > > > diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> > > > > > index 38e9a08..a50362e 100644
> > > > > > --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> > > > > > +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> > > > > > @@ -539,10 +539,11 @@ nouveau_drm_open(struct drm_device *dev, struct drm_file *fpriv)
> > > > > >  	struct pci_dev *pdev = dev->pdev;
> > > > > >  	struct nouveau_drm *drm = nouveau_drm(dev);
> > > > > >  	struct nouveau_cli *cli;
> > > > > > -	char name[16];
> > > > > > +	char name[32], tmpname[TASK_COMM_LEN];
> > > > > >  	int ret;
> > > > > >  
> > > > > > -	snprintf(name, sizeof(name), "%d", pid_nr(fpriv->pid));
> > > > > > +	get_task_comm(tmpname, current);
> > > > > > +	snprintf(name, sizeof(name), "%s[%d]", tmpname, pid_nr(fpriv->pid));
> > > > > >  
> > > > > >  	ret = nouveau_cli_create(pdev, name, sizeof(*cli), (void **)&cli);
> > > > > >  	if (ret)
