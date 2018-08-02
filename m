From: Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v4 8/8] drm/nouveau: Call pm_runtime_get_noresume() from
 hpd handlers
Date: Thu, 2 Aug 2018 21:40:41 +0200
Message-ID: <20180802194041.GC6180@wunner.de>
References: <20180801211459.7731-1-lyude@redhat.com>
 <20180801211459.7731-9-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180801211459.7731-9-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lyude Paul <lyude@redhat.com>
Cc: nouveau@lists.freedesktop.org, Karol Herbst <karolherbst@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

On Wed, Aug 01, 2018 at 05:14:58PM -0400, Lyude Paul wrote:
> We can't and don't need to try resuming the device from our hotplug
> handlers, but hotplug events are generally something we'd like to keep
> the device awake for whenever possible. So, grab a PM ref safely in our
> hotplug handlers using pm_runtime_get_noresume() and mark the device as
> busy once we're finished.

Patch looks fine in principle, but doesn't seem to be sufficient to fix
the following race:

1. runtime_suspend commences
2. user plugs in a display before the runtime_suspend worker disables
   hotplug interrupts in nouveau_display_fini()
3. hotplug is handled, display is lit up
4. runtime_suspend worker waits for hotplug handler to finish
5. GPU is runtime suspended and the newly plugged in display goes black

The call to pm_runtime_mark_last_busy() has no effect in this situation
because rpm_suspend() doesn't look at the last_busy variable after the
call to rpm_callback().  What's necessary here is that runtime_suspend is
aborted and -EBUSY returned.

Thanks,

Lukas

> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: stable@vger.kernel.org
> Cc: Lukas Wunner <lukas@wunner.de>
> Cc: Karol Herbst <karolherbst@gmail.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_connector.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
> index 8409c3f2c3a1..5a8e8c1ad647 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> @@ -1152,6 +1152,11 @@ nouveau_connector_hotplug(struct nvif_notify *notify)
>  	const char *name = connector->name;
>  	struct nouveau_encoder *nv_encoder;
>  
> +	/* Resuming the device here isn't possible; but the suspend PM ops
> +	 * will wait for us to finish our work before disabling us so this
> +	 * should be enough
> +	 */
> +	pm_runtime_get_noresume(drm->dev->dev);
>  	nv_connector->hpd_task = current;
>  
>  	if (rep->mask & NVIF_NOTIFY_CONN_V0_IRQ) {
> @@ -1171,6 +1176,9 @@ nouveau_connector_hotplug(struct nvif_notify *notify)
>  	}
>  
>  	nv_connector->hpd_task = NULL;
> +
> +	pm_runtime_mark_last_busy(drm->dev->dev);
> +	pm_runtime_put_autosuspend(drm->dev->dev);
>  	return NVIF_NOTIFY_KEEP;
>  }
>  
> -- 
> 2.17.1
> 
