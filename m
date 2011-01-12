From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH] Add PFIFO and PGRAPH pausing methods
Date: Wed, 12 Jan 2011 21:27:36 +0100
Message-ID: <87ipxtj29z.fsf@riseup.net>
References: <4D2A4B1C.6050908@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0811271581=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4D2A4B1C.6050908-GANU6spQydw@public.gmane.org> (Martin Peres's message of "Mon, 10
	Jan 2011 00:56:12 +0100")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Cc: nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============0811271581==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Martin Peres <martin.peres-GANU6spQydw@public.gmane.org> writes:

> Hi,
>
> I'm still working on getting the reclocking work done right. There are
> several parts I identify:
> - Pausing PFIFO (with its caches), pause PGRAPH and wait for idle
> - Stop some PLL (I guess it is more, physically disconnect them from
> the engines) using the 0xc040 register.
> - reclock memory
> - reclock the other engines
> - Make sure the display doesn't blow up
> Depending on the cards, I have completed all of the steps or none.
>
> Anyway, pausing PFIFO and PGRAPH works well on all the card I tested
> and so, I would like it to be pushed.
> I have a new theory upon the PLL_SUPERVISOR(0xc040) that I want to
> test. When I'm done with this, I'll put together a patch for it and
> continue on the other steps.
>
> Please provide me with some feedback on the patch or push it if
> nothing bothers you.
>
Thanks, some comments inline.

> Martin
>
> PS: I'm quite busy at the moment, I'll write an in-depth mail when
> I've verified my theories and got proper support on other cards than
> the nv86 ones.
>
> From f7ad98f4a857dd4b1892712d15f93c13eb0669e3 Mon Sep 17 00:00:00 2001
> From: Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
> Date: Mon, 10 Jan 2011 00:44:05 +0100
> Subject: [PATCH] Pause PFIFO and PGRAPH before reclocking
>
> Signed-off-by: Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_drv.h   |   15 +++++++
>  drivers/gpu/drm/nouveau/nouveau_pm.c    |   32 ++++++++++++++-
>  drivers/gpu/drm/nouveau/nouveau_reg.h   |    3 +
>  drivers/gpu/drm/nouveau/nouveau_state.c |   51 +++++++++++++++++++++++-
>  drivers/gpu/drm/nouveau/nv04_fifo.c     |   16 +++++++
>  drivers/gpu/drm/nouveau/nv50_fifo.c     |   20 +++++++++
>  drivers/gpu/drm/nouveau/nv50_graph.c    |   66 +++++++++++++++++++++++++=
++++++
>  7 files changed, 200 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouv=
eau/nouveau_drv.h
> index 6d749b7..b0c52c7 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> @@ -359,6 +359,12 @@ struct nouveau_fifo_engine {
>  	int  (*load_context)(struct nouveau_channel *);
>  	int  (*unload_context)(struct drm_device *);
>  	void (*tlb_flush)(struct drm_device *dev);
> +
> +	int  (*pause)(struct drm_device *);
> +	void  (*unpause)(struct drm_device *);
> +
> +	int  (*cache_pause)(struct drm_device *);
> +	void  (*cache_unpause)(struct drm_device *);

You could fold fifo->cache_pause() into fifo->pause(). I don't see any
reason to have two separate pairs of callbacks here, they're always
going to be called one after the other.

>  };
>=20=20
>  struct nouveau_pgraph_engine {
> @@ -383,6 +389,9 @@ struct nouveau_pgraph_engine {
>  	void (*tlb_flush)(struct drm_device *dev);
>=20=20
>  	void (*set_tile_region)(struct drm_device *dev, int i);
> +
> +	int  (*pause)(struct drm_device *);
> +	void  (*unpause)(struct drm_device *);
>  };
>=20=20
>  struct nouveau_display_engine {
> @@ -1094,6 +1103,8 @@ extern void nv04_fifo_destroy_context(struct nouvea=
u_channel *);
>  extern int  nv04_fifo_load_context(struct nouveau_channel *);
>  extern int  nv04_fifo_unload_context(struct drm_device *);
>  extern void nv04_fifo_isr(struct drm_device *);
> +extern void nv04_fifo_cache_pause(struct drm_device *dev);
> +extern void nv04_fifo_cache_unpause(struct drm_device *dev);
>=20=20
>  /* nv10_fifo.c */
>  extern int  nv10_fifo_init(struct drm_device *);
> @@ -1117,6 +1128,8 @@ extern void nv50_fifo_destroy_context(struct nouvea=
u_channel *);
>  extern int  nv50_fifo_load_context(struct nouveau_channel *);
>  extern int  nv50_fifo_unload_context(struct drm_device *);
>  extern void nv50_fifo_tlb_flush(struct drm_device *dev);
> +extern int  nv50_fifo_pause(struct drm_device *);
> +extern void nv50_fifo_unpause(struct drm_device *);
>=20=20
>  /* nvc0_fifo.c */
>  extern int  nvc0_fifo_init(struct drm_device *);
> @@ -1189,6 +1202,8 @@ extern int  nv50_graph_unload_context(struct drm_de=
vice *);
>  extern int  nv50_grctx_init(struct nouveau_grctx *);
>  extern void nv50_graph_tlb_flush(struct drm_device *dev);
>  extern void nv86_graph_tlb_flush(struct drm_device *dev);
> +extern int  nv50_graph_pause(struct drm_device *dev);
> +extern void nv50_graph_unpause(struct drm_device *dev);
>  extern struct nouveau_enum nv50_data_error_names[];
>=20=20
>  /* nvc0_graph.c */
> diff --git a/drivers/gpu/drm/nouveau/nouveau_pm.c b/drivers/gpu/drm/nouve=
au/nouveau_pm.c
> index fb846a3..233deec 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_pm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_pm.c
> @@ -59,6 +59,7 @@ nouveau_pm_perflvl_set(struct drm_device *dev, struct n=
ouveau_pm_level *perflvl)
>  {
>  	struct drm_nouveau_private *dev_priv =3D dev->dev_private;
>  	struct nouveau_pm_engine *pm =3D &dev_priv->engine.pm;
> +	unsigned long flags;
>  	int ret;
>=20=20
>  	if (perflvl =3D=3D pm->cur)
> @@ -72,13 +73,42 @@ nouveau_pm_perflvl_set(struct drm_device *dev, struct=
 nouveau_pm_level *perflvl)
>  		}
>  	}
>=20=20
> +	/* Do not allow the card to allocate/destroy a
> +	 * new channel while reclocking.
> +	 */
> +	spin_lock_irqsave(&dev_priv->context_switch_lock, flags);
> +
> +	/* Pause the engines, if possible */
> +	if (dev_priv->engine.fifo.pause(dev)) {
> +		ret =3D -EIO;
> +		goto out;
> +	}
> +	dev_priv->engine.fifo.cache_pause(dev);
> +	if (dev_priv->engine.graph.pause(dev)) {
> +		ret =3D -EIO;
> +		goto out;
> +	}

Just nitpicking here, but, if pause() is already returning an errno you
should just pass the same thing on, like:
|         ret =3D dev_priv->engine.fifo.pause(dev);
|         if (ret)
|                 goto out;
|
|         ret =3D dev_priv->engine.graph.pause(dev);
|         if (ret)
|                 goto out;


> +
>  	nouveau_pm_clock_set(dev, perflvl, PLL_CORE, perflvl->core);
>  	nouveau_pm_clock_set(dev, perflvl, PLL_SHADER, perflvl->shader);
>  	nouveau_pm_clock_set(dev, perflvl, PLL_MEMORY, perflvl->memory);
>  	nouveau_pm_clock_set(dev, perflvl, PLL_UNK05, perflvl->unk05);
>=20=20
> +	/* Wait for PLLs to stabilize */
> +	udelay(100);
> +
>  	pm->cur =3D perflvl;
> -	return 0;
> +	ret =3D 0;
> +
> +out:
> +	/* Un-pause the engines */
> +	dev_priv->engine.fifo.cache_unpause(dev);
> +	dev_priv->engine.graph.unpause(dev);
> +	dev_priv->engine.fifo.unpause(dev);
> +
> +	spin_unlock_irqrestore(&dev_priv->context_switch_lock, flags);
> +
> +	return ret;
>  }
>=20=20
>  static int
> diff --git a/drivers/gpu/drm/nouveau/nouveau_reg.h b/drivers/gpu/drm/nouv=
eau/nouveau_reg.h
> index 04e8fb7..1722d13 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_reg.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_reg.h
> @@ -695,8 +695,11 @@
>  #define NV50_PROM__ESIZE                                       0x10000
>=20=20
>  #define NV50_PGRAPH                                         0x00400000
> +#define NV50_PGRAPH_CONTROL                                 0x00400500
> +#define NV50_PGRAPH_STATUS                                  0x00400700
>  #define NV50_PGRAPH__LEN                                           0x1
>  #define NV50_PGRAPH__ESIZE                                     0x10000
> +#define NV50_PFIFO_FREEZE                                       0x2504
>=20=20
>  #define NV50_PDISPLAY                                                0x0=
0610000
>  #define NV50_PDISPLAY_OBJECTS                                        0x0=
0610010
> diff --git a/drivers/gpu/drm/nouveau/nouveau_state.c b/drivers/gpu/drm/no=
uveau/nouveau_state.c
> index d5b17b6..c149cf8 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_state.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_state.c
> @@ -42,6 +42,12 @@
>  static void nouveau_stub_takedown(struct drm_device *dev) {}
>  static int nouveau_stub_init(struct drm_device *dev) { return 0; }
>=20=20
> +int nouveau_fifo_pause_dummy(struct drm_device *dev) { return 0; }
> +void nouveau_fifo_unpause_dummy(struct drm_device *dev) { }
> +
> +int nouveau_graph_pause_dummy(struct drm_device *dev) {	return 0; }
> +void nouveau_graph_unpause_dummy(struct drm_device *dev) {}

This is just the nv04- implementation of graph->(un)pause(), nv04_graph.c
is the best place for it, and I'd call it "nv04_graph_(un)pause" for the
sake of consistency.

> +
>  static int nouveau_init_engine_ptrs(struct drm_device *dev)
>  {
>  	struct drm_nouveau_private *dev_priv =3D dev->dev_private;
> @@ -73,6 +79,8 @@ static int nouveau_init_engine_ptrs(struct drm_device *=
dev)
>  		engine->graph.destroy_context	=3D nv04_graph_destroy_context;
>  		engine->graph.load_context	=3D nv04_graph_load_context;
>  		engine->graph.unload_context	=3D nv04_graph_unload_context;
> +		engine->graph.pause		=3D nouveau_graph_pause_dummy;
> +		engine->graph.unpause	=3D nouveau_graph_unpause_dummy;
>  		engine->fifo.channels		=3D 16;
>  		engine->fifo.init		=3D nv04_fifo_init;
>  		engine->fifo.takedown		=3D nv04_fifo_fini;
> @@ -85,6 +93,10 @@ static int nouveau_init_engine_ptrs(struct drm_device =
*dev)
>  		engine->fifo.destroy_context	=3D nv04_fifo_destroy_context;
>  		engine->fifo.load_context	=3D nv04_fifo_load_context;
>  		engine->fifo.unload_context	=3D nv04_fifo_unload_context;
> +		engine->fifo.pause		=3D nouveau_fifo_pause_dummy;
> +		engine->fifo.unpause	=3D nouveau_fifo_unpause_dummy;
> +		engine->fifo.cache_pause =3D nv04_fifo_cache_pause;
> +		engine->fifo.cache_unpause =3D nv04_fifo_cache_unpause;
>  		engine->display.early_init	=3D nv04_display_early_init;
>  		engine->display.late_takedown	=3D nv04_display_late_takedown;
>  		engine->display.create		=3D nv04_display_create;
> @@ -132,6 +144,8 @@ static int nouveau_init_engine_ptrs(struct drm_device=
 *dev)
>  		engine->graph.load_context	=3D nv10_graph_load_context;
>  		engine->graph.unload_context	=3D nv10_graph_unload_context;
>  		engine->graph.set_tile_region	=3D nv10_graph_set_tile_region;
> +		engine->graph.pause		=3D nouveau_graph_pause_dummy;
> +		engine->graph.unpause	=3D nouveau_graph_unpause_dummy;
>  		engine->fifo.channels		=3D 32;
>  		engine->fifo.init		=3D nv10_fifo_init;
>  		engine->fifo.takedown		=3D nv04_fifo_fini;
> @@ -144,6 +158,10 @@ static int nouveau_init_engine_ptrs(struct drm_devic=
e *dev)
>  		engine->fifo.destroy_context	=3D nv04_fifo_destroy_context;
>  		engine->fifo.load_context	=3D nv10_fifo_load_context;
>  		engine->fifo.unload_context	=3D nv10_fifo_unload_context;
> +		engine->fifo.pause		=3D nouveau_fifo_pause_dummy;
> +		engine->fifo.unpause	=3D nouveau_fifo_unpause_dummy;
> +		engine->fifo.cache_pause =3D nv04_fifo_cache_pause;
> +		engine->fifo.cache_unpause =3D nv04_fifo_cache_unpause;
>  		engine->display.early_init	=3D nv04_display_early_init;
>  		engine->display.late_takedown	=3D nv04_display_late_takedown;
>  		engine->display.create		=3D nv04_display_create;
> @@ -191,6 +209,8 @@ static int nouveau_init_engine_ptrs(struct drm_device=
 *dev)
>  		engine->graph.load_context	=3D nv20_graph_load_context;
>  		engine->graph.unload_context	=3D nv20_graph_unload_context;
>  		engine->graph.set_tile_region	=3D nv20_graph_set_tile_region;
> +		engine->graph.pause		=3D nouveau_graph_pause_dummy;
> +		engine->graph.unpause	=3D nouveau_graph_unpause_dummy;
>  		engine->fifo.channels		=3D 32;
>  		engine->fifo.init		=3D nv10_fifo_init;
>  		engine->fifo.takedown		=3D nv04_fifo_fini;
> @@ -203,6 +223,10 @@ static int nouveau_init_engine_ptrs(struct drm_devic=
e *dev)
>  		engine->fifo.destroy_context	=3D nv04_fifo_destroy_context;
>  		engine->fifo.load_context	=3D nv10_fifo_load_context;
>  		engine->fifo.unload_context	=3D nv10_fifo_unload_context;
> +		engine->fifo.pause		=3D nouveau_fifo_pause_dummy;
> +		engine->fifo.unpause	=3D nouveau_fifo_unpause_dummy;
> +		engine->fifo.cache_pause =3D nv04_fifo_cache_pause;
> +		engine->fifo.cache_unpause =3D nv04_fifo_cache_unpause;
>  		engine->display.early_init	=3D nv04_display_early_init;
>  		engine->display.late_takedown	=3D nv04_display_late_takedown;
>  		engine->display.create		=3D nv04_display_create;
> @@ -250,6 +274,8 @@ static int nouveau_init_engine_ptrs(struct drm_device=
 *dev)
>  		engine->graph.load_context	=3D nv20_graph_load_context;
>  		engine->graph.unload_context	=3D nv20_graph_unload_context;
>  		engine->graph.set_tile_region	=3D nv20_graph_set_tile_region;
> +		engine->graph.pause		=3D nouveau_graph_pause_dummy;
> +		engine->graph.unpause	=3D nouveau_graph_unpause_dummy;
>  		engine->fifo.channels		=3D 32;
>  		engine->fifo.init		=3D nv10_fifo_init;
>  		engine->fifo.takedown		=3D nv04_fifo_fini;
> @@ -262,6 +288,10 @@ static int nouveau_init_engine_ptrs(struct drm_devic=
e *dev)
>  		engine->fifo.destroy_context	=3D nv04_fifo_destroy_context;
>  		engine->fifo.load_context	=3D nv10_fifo_load_context;
>  		engine->fifo.unload_context	=3D nv10_fifo_unload_context;
> +		engine->fifo.pause		=3D nouveau_fifo_pause_dummy;
> +		engine->fifo.unpause	=3D nouveau_fifo_unpause_dummy;
> +		engine->fifo.cache_pause =3D nv04_fifo_cache_pause;
> +		engine->fifo.cache_unpause =3D nv04_fifo_cache_unpause;
>  		engine->display.early_init	=3D nv04_display_early_init;
>  		engine->display.late_takedown	=3D nv04_display_late_takedown;
>  		engine->display.create		=3D nv04_display_create;
> @@ -312,6 +342,8 @@ static int nouveau_init_engine_ptrs(struct drm_device=
 *dev)
>  		engine->graph.load_context	=3D nv40_graph_load_context;
>  		engine->graph.unload_context	=3D nv40_graph_unload_context;
>  		engine->graph.set_tile_region	=3D nv40_graph_set_tile_region;
> +		engine->graph.pause		=3D nouveau_graph_pause_dummy;
> +		engine->graph.unpause	=3D nouveau_graph_unpause_dummy;
>  		engine->fifo.channels		=3D 32;
>  		engine->fifo.init		=3D nv40_fifo_init;
>  		engine->fifo.takedown		=3D nv04_fifo_fini;
> @@ -324,6 +356,10 @@ static int nouveau_init_engine_ptrs(struct drm_devic=
e *dev)
>  		engine->fifo.destroy_context	=3D nv04_fifo_destroy_context;
>  		engine->fifo.load_context	=3D nv40_fifo_load_context;
>  		engine->fifo.unload_context	=3D nv40_fifo_unload_context;
> +		engine->fifo.pause		=3D nouveau_fifo_pause_dummy;
> +		engine->fifo.unpause	=3D nouveau_fifo_unpause_dummy;
> +		engine->fifo.cache_pause =3D nv04_fifo_cache_pause;
> +		engine->fifo.cache_unpause =3D nv04_fifo_cache_unpause;
>  		engine->display.early_init	=3D nv04_display_early_init;
>  		engine->display.late_takedown	=3D nv04_display_late_takedown;
>  		engine->display.create		=3D nv04_display_create;
> @@ -376,6 +412,8 @@ static int nouveau_init_engine_ptrs(struct drm_device=
 *dev)
>  		engine->graph.destroy_context	=3D nv50_graph_destroy_context;
>  		engine->graph.load_context	=3D nv50_graph_load_context;
>  		engine->graph.unload_context	=3D nv50_graph_unload_context;
> +		engine->graph.pause		=3D nv50_graph_pause;
> +		engine->graph.unpause	=3D nv50_graph_unpause;
>  		if (dev_priv->chipset !=3D 0x86)
>  			engine->graph.tlb_flush	=3D nv50_graph_tlb_flush;
>  		else {
> @@ -397,6 +435,10 @@ static int nouveau_init_engine_ptrs(struct drm_devic=
e *dev)
>  		engine->fifo.load_context	=3D nv50_fifo_load_context;
>  		engine->fifo.unload_context	=3D nv50_fifo_unload_context;
>  		engine->fifo.tlb_flush		=3D nv50_fifo_tlb_flush;
> +		engine->fifo.pause			=3D nv50_fifo_pause;
> +		engine->fifo.unpause		=3D nv50_fifo_unpause;
> +		engine->fifo.cache_pause =3D nv04_fifo_cache_pause;
> +		engine->fifo.cache_unpause =3D nv04_fifo_cache_unpause;
>  		engine->display.early_init	=3D nv50_display_early_init;
>  		engine->display.late_takedown	=3D nv50_display_late_takedown;
>  		engine->display.create		=3D nv50_display_create;
> @@ -484,6 +526,8 @@ static int nouveau_init_engine_ptrs(struct drm_device=
 *dev)
>  		engine->graph.destroy_context	=3D nvc0_graph_destroy_context;
>  		engine->graph.load_context	=3D nvc0_graph_load_context;
>  		engine->graph.unload_context	=3D nvc0_graph_unload_context;
> +		engine->graph.pause		=3D nouveau_graph_pause_dummy;
> +		engine->graph.unpause	=3D nouveau_graph_unpause_dummy;
>  		engine->fifo.channels		=3D 128;
>  		engine->fifo.init		=3D nvc0_fifo_init;
>  		engine->fifo.takedown		=3D nvc0_fifo_takedown;
> @@ -495,6 +539,10 @@ static int nouveau_init_engine_ptrs(struct drm_devic=
e *dev)
>  		engine->fifo.destroy_context	=3D nvc0_fifo_destroy_context;
>  		engine->fifo.load_context	=3D nvc0_fifo_load_context;
>  		engine->fifo.unload_context	=3D nvc0_fifo_unload_context;
> +		engine->fifo.pause		=3D nouveau_fifo_pause_dummy;
> +		engine->fifo.unpause	=3D nouveau_fifo_unpause_dummy;
> +		engine->fifo.cache_pause =3D nv04_fifo_cache_pause;
> +		engine->fifo.cache_unpause =3D nv04_fifo_cache_unpause;
>  		engine->display.early_init	=3D nv50_display_early_init;
>  		engine->display.late_takedown	=3D nv50_display_late_takedown;
>  		engine->display.create		=3D nv50_display_create;
> @@ -893,7 +941,7 @@ static int nouveau_remove_conflicting_drivers(struct =
drm_device *dev)
>  #ifdef CONFIG_X86
>  	primary =3D dev->pdev->resource[PCI_ROM_RESOURCE].flags & IORESOURCE_RO=
M_SHADOW;
>  #endif
> -=09
> +
>  	remove_conflicting_framebuffers(dev_priv->apertures, "nouveaufb", prima=
ry);
>  	return 0;
>  }
> @@ -1199,4 +1247,3 @@ bool nouveau_wait_for_idle(struct drm_device *dev)
>=20=20
>  	return true;
>  }
> -

This is unrelated clean-up, please split it into separate patches if you
made them on purpose.

> diff --git a/drivers/gpu/drm/nouveau/nv04_fifo.c b/drivers/gpu/drm/nouvea=
u/nv04_fifo.c
> index f89d104..df84586 100644
> --- a/drivers/gpu/drm/nouveau/nv04_fifo.c
> +++ b/drivers/gpu/drm/nouveau/nv04_fifo.c
> @@ -530,3 +530,19 @@ nv04_fifo_isr(struct drm_device *dev)
>=20=20
>  	nv_wr32(dev, NV03_PMC_INTR_0, NV_PMC_INTR_0_PFIFO_PENDING);
>  }
> +
> +void
> +nv04_fifo_cache_pause(struct drm_device *dev)
> +{
> +	nv04_fifo_reassign(dev, false);
> +	nv04_fifo_cache_pull(dev, false);
> +	nv_mask(dev, NV04_PFIFO_CACHE1_DMA_PUSH, 0x1, 0);
> +}
> +
> +void
> +nv04_fifo_cache_unpause(struct drm_device *dev)
> +{
> +	nv_mask(dev, NV04_PFIFO_CACHE1_DMA_PUSH, 0, 0x1);
> +	nv04_fifo_cache_pull(dev, true);
> +	nv04_fifo_reassign(dev, true);
> +}
> diff --git a/drivers/gpu/drm/nouveau/nv50_fifo.c b/drivers/gpu/drm/nouvea=
u/nv50_fifo.c
> index 8dd04c5..90a3dc1 100644
> --- a/drivers/gpu/drm/nouveau/nv50_fifo.c
> +++ b/drivers/gpu/drm/nouveau/nv50_fifo.c
> @@ -501,3 +501,23 @@ nv50_fifo_tlb_flush(struct drm_device *dev)
>  {
>  	nv50_vm_flush_engine(dev, 5);
>  }
> +
> +int
> +nv50_fifo_pause(struct drm_device *dev)
> +{
> +	nv_wr32(dev, NV50_PFIFO_FREEZE, 1);
> +
> +	/* Wait up to 10ms for PFIFO to freeze */
> +	if (!nouveau_wait_eq(dev, 10000000, NV50_PFIFO_FREEZE,
> +		0x10, 0x10)) {
> +		NV_ERROR(dev, "PFIFO freeze fail!\n");
> +		return -EIO;
> +	}
> +	return 0;
> +}
> +
> +void
> +nv50_fifo_unpause(struct drm_device *dev)
> +{
> +	nv_wr32(dev, NV50_PFIFO_FREEZE, 0);
> +}
> diff --git a/drivers/gpu/drm/nouveau/nv50_graph.c b/drivers/gpu/drm/nouve=
au/nv50_graph.c
> index 2d7ea75..79bc157 100644
> --- a/drivers/gpu/drm/nouveau/nv50_graph.c
> +++ b/drivers/gpu/drm/nouveau/nv50_graph.c
> @@ -1047,3 +1047,69 @@ nv50_graph_isr(struct drm_device *dev)
>  	if (nv_rd32(dev, 0x400824) & (1 << 31))
>  		nv_wr32(dev, 0x400824, nv_rd32(dev, 0x400824) & ~(1 << 31));
>  }
> +
> +int
> +nv50_graph_pause(struct drm_device *dev)
> +{
> +	uint64_t start;
> +	/* initial guess... */
> +	uint32_t mask380 =3D 0xffffffff;
> +	uint32_t mask384 =3D 0xffffffff;
> +	uint32_t mask388 =3D 0xffffffff;
> +	uint32_t mask504 =3D 0x00000001;
> +	uint32_t mask700 =3D 0x00000001;
> +
> +	start =3D nv04_timer_read(dev);
> +
> +	/* Wait for the end of the execution of a ctxprog */
> +	while ((!(nv_rd32(dev, 0x400504) & mask504)) ||
> +		   (nv_rd32(dev, NV50_PGRAPH_STATUS) & 0x100)) {
> +		if (nv04_timer_read(dev) - start >=3D 10000000) {
> +			if (nv_rd32(dev, NV50_PGRAPH_STATUS) & 0x100)
> +				NV_ERROR(dev,
> +						"PGRAPH: PGRAPH paused while running a ctxprog,"
> +						" NV40_PGRAPH_CTXCTL_0310 =3D 0x%x\n",
> +						nv_rd32(dev, NV40_PGRAPH_CTXCTL_0310));

This (and the error messages below) goes over the 80-column limit, and
the indentation is a bit weird.

> +			return -EIO;
> +		}
> +	}
> +
> +	/* Stop PGRAPH */
> +	nv_mask(dev, NV50_PGRAPH_CONTROL, 0x1, 0);
> +
> +	/* Wait for PGRAPH to be really stopped */
> +	while ((nv_rd32(dev, 0x400380) & mask380) ||
> +		   (nv_rd32(dev, 0x400384) & mask384) ||
> +		   (nv_rd32(dev, 0x400388) & mask388) ||
> +		   (!(nv_rd32(dev, 0x400504) & mask504)) ||
> +		   (nv_rd32(dev, NV50_PGRAPH_STATUS) & mask700)) {
> +		if (nv04_timer_read(dev) - start >=3D 10000000) {
> +			/* if you see this message,
> +			 * mask* above probably need to be adjusted
> +			 * to not contain the bits you see failing */
> +			NV_ERROR(dev,
> +					 "PGRAPH: wait for idle fail: %08x %08x %08x %08x %08x!\n",
> +					 nv_rd32(dev, 0x400380),
> +					 nv_rd32(dev, 0x400384),
> +					 nv_rd32(dev, 0x400388),
> +					 nv_rd32(dev, 0x400504),
> +					 nv_rd32(dev, NV50_PGRAPH_STATUS));
> +
> +			if (nv_rd32(dev, NV50_PGRAPH_STATUS) & 0x100)
> +				NV_ERROR(dev,
> +						"PGRAPH: PGRAPH paused while running a ctxprog,"
> +						" NV40_PGRAPH_CTXCTL_0310 =3D 0x%x\n",
> +						nv_rd32(dev, NV40_PGRAPH_CTXCTL_0310));
> +
> +			nv50_graph_unpause(dev);
> +			return -EIO;
> +		}
> +	}
> +	return 0;
> +}

I'm OK with this function but I have a feeling it could be simplified a
lot if you implemented it in terms of "nv_wait(_ne)()" (e.g. all the
loops, maskXXX and timer handling could go away).

> +
> +void
> +nv50_graph_unpause(struct drm_device *dev)
> +{
> +	nv_mask(dev, NV50_PGRAPH_CONTROL, 0, 0x1);
> +}

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iF4EAREIAAYFAk0uDrgACgkQg5k4nX1Sv1sfAwD+Nq5Cq825hWPkuwo6KAOoeVu/
FyQHfpRM1Lm7JcFvOB4A/R8zTR4F05m0BBxQh2lCG2AQRHQ+zsQpXDGQsACm05zV
=zb4o
-----END PGP SIGNATURE-----
--==-=-=--

--===============0811271581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0811271581==--
