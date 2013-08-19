From: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: fix vblank deadlock
Date: Mon, 19 Aug 2013 14:12:29 -0400
Message-ID: <5212600D.7000203@hurleysoftware.com>
References: <5208CC15.8080403@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <5208CC15.8080403-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On 08/12/2013 07:50 AM, Maarten Lankhorst wrote:
> This fixes a deadlock inversion when vblank is enabled/disabled by drm.
> &dev->vblank_time_lock is always taken when the vblank state is toggled,
> which caused a deadlock when &event->lock was also taken during
> event_get/put.
>
> Solve the race by requiring that lock to change enable/disable state,
> and always keeping vblank on the event list. Core drm ignores unwanted
> vblanks, so extra calls to drm_handle_vblank are harmless.

I don't feel this is the appropriate solution to the lock inversion
between vblank_time_lock and event->lock.

Preferably drm core should correct the interface layer bug; ie., calling
into a sub-driver holding a lock _and_ requiring the sub-driver to call a
drm helper function which claims the same lock is bad design. The console
lock suffers from the same design flaw and is a constant problem.

Alternatively, the event trigger could be lockless; ie., the event list
could be an RCU list instead. In this way, the event->lock does not need
to be claimed, and thus no lock inversion is possible. The main drawback
here is that currently the event->lock enforces non-overlapping lifetimes
between the event handler and the event. Untangling object lifetimes in
nouveau is a non-trivial exercise.

Regards,
Peter Hurley

> Signed-off-by: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
> ---
> diff --git a/drivers/gpu/drm/nouveau/core/core/event.c b/drivers/gpu/drm/nouveau/core/core/event.c
> index 7eb81c1..78bff7c 100644
> --- a/drivers/gpu/drm/nouveau/core/core/event.c
> +++ b/drivers/gpu/drm/nouveau/core/core/event.c
> @@ -23,43 +23,64 @@
>   #include <core/os.h>
>   #include <core/event.h>
>
> -static void
> -nouveau_event_put_locked(struct nouveau_event *event, int index,
> -			 struct nouveau_eventh *handler)
> -{
> -	if (!--event->index[index].refs) {
> -		if (event->disable)
> -			event->disable(event, index);
> -	}
> -	list_del(&handler->head);
> -}
> -
>   void
>   nouveau_event_put(struct nouveau_event *event, int index,
>   		  struct nouveau_eventh *handler)
>   {
>   	unsigned long flags;
>
> +	if (index >= event->index_nr)
> +		return;
> +
>   	spin_lock_irqsave(&event->lock, flags);
> -	if (index < event->index_nr)
> -		nouveau_event_put_locked(event, index, handler);
> +	list_del(&handler->head);
> +
> +	if (event->toggle_lock)
> +		spin_lock(event->toggle_lock);
> +	nouveau_event_disable_locked(event, index, 1);
> +	if (event->toggle_lock)
> +		spin_unlock(event->toggle_lock);
> +
>   	spin_unlock_irqrestore(&event->lock, flags);
>   }
>
>   void
> +nouveau_event_enable_locked(struct nouveau_event *event, int index)
> +{
> +	if (index >= event->index_nr)
> +		return;
> +
> +	if (!event->index[index].refs++ && event->enable)
> +		event->enable(event, index);
> +}
> +
> +void
> +nouveau_event_disable_locked(struct nouveau_event *event, int index, int refs)
> +{
> +	if (index >= event->index_nr)
> +		return;
> +
> +	event->index[index].refs -= refs;
> +	if (!event->index[index].refs && event->disable)
> +		event->disable(event, index);
> +}
> +
> +void
>   nouveau_event_get(struct nouveau_event *event, int index,
>   		  struct nouveau_eventh *handler)
>   {
>   	unsigned long flags;
>
> +	if (index >= event->index_nr)
> +		return;
> +
>   	spin_lock_irqsave(&event->lock, flags);
> -	if (index < event->index_nr) {
> -		list_add(&handler->head, &event->index[index].list);
> -		if (!event->index[index].refs++) {
> -			if (event->enable)
> -				event->enable(event, index);
> -		}
> -	}
> +	list_add(&handler->head, &event->index[index].list);
> +	if (event->toggle_lock)
> +		spin_lock(event->toggle_lock);
> +	nouveau_event_enable_locked(event, index);
> +	if (event->toggle_lock)
> +		spin_unlock(event->toggle_lock);
>   	spin_unlock_irqrestore(&event->lock, flags);
>   }
>
> @@ -68,6 +89,7 @@ nouveau_event_trigger(struct nouveau_event *event, int index)
>   {
>   	struct nouveau_eventh *handler, *temp;
>   	unsigned long flags;
> +	int refs = 0;
>
>   	if (index >= event->index_nr)
>   		return;
> @@ -75,9 +97,17 @@ nouveau_event_trigger(struct nouveau_event *event, int index)
>   	spin_lock_irqsave(&event->lock, flags);
>   	list_for_each_entry_safe(handler, temp, &event->index[index].list, head) {
>   		if (handler->func(handler, index) == NVKM_EVENT_DROP) {
> -			nouveau_event_put_locked(event, index, handler);
> +			list_del(&handler->head);
> +			refs++;
>   		}
>   	}
> +	if (refs) {
> +		if (event->toggle_lock)
> +			spin_lock(event->toggle_lock);
> +		nouveau_event_disable_locked(event, index, refs);
> +		if (event->toggle_lock)
> +			spin_unlock(event->toggle_lock);
> +	}
>   	spin_unlock_irqrestore(&event->lock, flags);
>   }
>
> diff --git a/drivers/gpu/drm/nouveau/core/include/core/event.h b/drivers/gpu/drm/nouveau/core/include/core/event.h
> index 9e09440..b1a6c91 100644
> --- a/drivers/gpu/drm/nouveau/core/include/core/event.h
> +++ b/drivers/gpu/drm/nouveau/core/include/core/event.h
> @@ -12,6 +12,7 @@ struct nouveau_eventh {
>
>   struct nouveau_event {
>   	spinlock_t lock;
> +	spinlock_t *toggle_lock;
>
>   	void *priv;
>   	void (*enable)(struct nouveau_event *, int index);
> @@ -33,4 +34,8 @@ void nouveau_event_get(struct nouveau_event *, int index,
>   void nouveau_event_put(struct nouveau_event *, int index,
>   		       struct nouveau_eventh *);
>
> +void nouveau_event_enable_locked(struct nouveau_event *event, int index);
> +void nouveau_event_disable_locked(struct nouveau_event *event, int index,
> +				  int refs);
> +
>   #endif
> diff --git a/drivers/gpu/drm/nouveau/nouveau_crtc.h b/drivers/gpu/drm/nouveau/nouveau_crtc.h
> index d1e5890..398baa3 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_crtc.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_crtc.h
> @@ -29,6 +29,7 @@
>
>   struct nouveau_crtc {
>   	struct drm_crtc base;
> +	struct nouveau_eventh vblank;
>
>   	int index;
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.h b/drivers/gpu/drm/nouveau/nouveau_display.h
> index 1ea3e47..4ba8cb5 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.h
> @@ -72,6 +72,7 @@ int  nouveau_display_dumb_destroy(struct drm_file *, struct drm_device *,
>   				  u32 handle);
>
>   void nouveau_hdmi_mode_set(struct drm_encoder *, struct drm_display_mode *);
> +int nouveau_drm_vblank_handler(struct nouveau_eventh *event, int head);
>
>   #ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
>   extern int nouveau_backlight_init(struct drm_device *);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index 4bf8dc3..bd301f4 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -46,6 +46,7 @@
>   #include "nouveau_pm.h"
>   #include "nouveau_acpi.h"
>   #include "nouveau_bios.h"
> +#include "nouveau_crtc.h"
>   #include "nouveau_ioctl.h"
>   #include "nouveau_abi16.h"
>   #include "nouveau_fbcon.h"
> @@ -71,12 +72,13 @@ module_param_named(modeset, nouveau_modeset, int, 0400);
>
>   static struct drm_driver driver;
>
> -static int
> +int
>   nouveau_drm_vblank_handler(struct nouveau_eventh *event, int head)
>   {
> -	struct nouveau_drm *drm =
> -		container_of(event, struct nouveau_drm, vblank[head]);
> -	drm_handle_vblank(drm->dev, head);
> +	struct nouveau_crtc *nv_crtc =
> +		container_of(event, struct nouveau_crtc, vblank);
> +
> +	drm_handle_vblank(nv_crtc->base.dev, head);
>   	return NVKM_EVENT_KEEP;
>   }
>
> @@ -86,11 +88,9 @@ nouveau_drm_vblank_enable(struct drm_device *dev, int head)
>   	struct nouveau_drm *drm = nouveau_drm(dev);
>   	struct nouveau_disp *pdisp = nouveau_disp(drm->device);
>
> -	if (WARN_ON_ONCE(head > ARRAY_SIZE(drm->vblank)))
> +	if (head >= pdisp->vblank->index_nr)
>   		return -EIO;
> -	WARN_ON_ONCE(drm->vblank[head].func);
> -	drm->vblank[head].func = nouveau_drm_vblank_handler;
> -	nouveau_event_get(pdisp->vblank, head, &drm->vblank[head]);
> +	nouveau_event_enable_locked(pdisp->vblank, head);
>   	return 0;
>   }
>
> @@ -99,11 +99,9 @@ nouveau_drm_vblank_disable(struct drm_device *dev, int head)
>   {
>   	struct nouveau_drm *drm = nouveau_drm(dev);
>   	struct nouveau_disp *pdisp = nouveau_disp(drm->device);
> -	if (drm->vblank[head].func)
> -		nouveau_event_put(pdisp->vblank, head, &drm->vblank[head]);
> -	else
> -		WARN_ON_ONCE(1);
> -	drm->vblank[head].func = NULL;
> +
> +	if (head < pdisp->vblank->index_nr)
> +		nouveau_event_disable_locked(pdisp->vblank, head, 1);
>   }
>
>   static u64
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.h b/drivers/gpu/drm/nouveau/nouveau_drm.h
> index 41ff7e0..0d0ba3b 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.h
> @@ -125,7 +125,6 @@ struct nouveau_drm {
>   	struct nvbios vbios;
>   	struct nouveau_display *display;
>   	struct backlight_device *backlight;
> -	struct nouveau_eventh vblank[4];
>
>   	/* power management */
>   	struct nouveau_pm *pm;
> diff --git a/drivers/gpu/drm/nouveau/nv50_display.c b/drivers/gpu/drm/nouveau/nv50_display.c
> index 007731d..738d7a2 100644
> --- a/drivers/gpu/drm/nouveau/nv50_display.c
> +++ b/drivers/gpu/drm/nouveau/nv50_display.c
> @@ -39,6 +39,7 @@
>   #include <core/client.h>
>   #include <core/gpuobj.h>
>   #include <core/class.h>
> +#include <engine/disp.h>
>
>   #include <subdev/timer.h>
>   #include <subdev/bar.h>
> @@ -1280,15 +1281,21 @@ nv50_crtc_gamma_set(struct drm_crtc *crtc, u16 *r, u16 *g, u16 *b,
>   static void
>   nv50_crtc_destroy(struct drm_crtc *crtc)
>   {
> +	struct nouveau_event *event = nouveau_disp(nouveau_dev(crtc->dev))->vblank;
>   	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
>   	struct nv50_disp *disp = nv50_disp(crtc->dev);
>   	struct nv50_head *head = nv50_head(crtc);
> +	unsigned long flags;
>
>   	nv50_dmac_destroy(disp->core, &head->ovly.base);
>   	nv50_pioc_destroy(disp->core, &head->oimm.base);
>   	nv50_dmac_destroy(disp->core, &head->sync.base);
>   	nv50_pioc_destroy(disp->core, &head->curs.base);
>
> +	spin_lock_irqsave(&event->lock, flags);
> +	list_del(&nv_crtc->vblank.head);
> +	spin_unlock_irqrestore(&event->lock, flags);
> +
>   	/*XXX: this shouldn't be necessary, but the core doesn't call
>   	 *     disconnect() during the cleanup paths
>   	 */
> @@ -1344,10 +1351,12 @@ nv50_cursor_set_offset(struct nouveau_crtc *nv_crtc, uint32_t offset)
>   static int
>   nv50_crtc_create(struct drm_device *dev, struct nouveau_object *core, int index)
>   {
> +	struct nouveau_event *event = nouveau_disp(nouveau_dev(dev))->vblank;
>   	struct nv50_disp *disp = nv50_disp(dev);
>   	struct nv50_head *head;
>   	struct drm_crtc *crtc;
>   	int ret, i;
> +	unsigned long flags;
>
>   	head = kzalloc(sizeof(*head), GFP_KERNEL);
>   	if (!head)
> @@ -1372,6 +1381,12 @@ nv50_crtc_create(struct drm_device *dev, struct nouveau_object *core, int index)
>   	drm_crtc_helper_add(crtc, &nv50_crtc_hfunc);
>   	drm_mode_crtc_set_gamma_size(crtc, 256);
>
> +	spin_lock_irqsave(&event->lock, flags);
> +	event->toggle_lock = &dev->vblank_time_lock;
> +	head->base.vblank.func = nouveau_drm_vblank_handler;
> +	list_add(&head->base.vblank.head, &event->index[index].list);
> +	spin_unlock_irqrestore(&event->lock, flags);
> +
>   	ret = nouveau_bo_new(dev, 8192, 0x100, TTM_PL_FLAG_VRAM,
>   			     0, 0x0000, NULL, NULL, &head->base.lut.nvbo);
>   	if (!ret) {
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>
