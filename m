From: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: Re: [PATCH] [RFC] drm/nouveau: bring back hdmi audio
 device after switcheroo power down
Date: Wed, 24 Jul 2013 15:38:35 +0200
Message-ID: <51EFD8DB.10206@canonical.com>
References: <1374650022-17865-1-git-send-email-airlied@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1374650022-17865-1-git-send-email-airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Op 24-07-13 09:13, Dave Airlie schreef:
> After a full device powerdown via the optimus power switch, we seem
> to lose the HDMI device completely on power on, this keep track of
> whether we had a hdmi audio sub function device at power on, and
> pokes a magic register to make it reappear after the optimus power
> switch is thrown.
>
> This at least works on my NVC4 machine, probably needs testing on
> a few other laptops with other nvidia GPUs.
>
> Signed-off-by: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_drm.c | 32 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/nouveau/nouveau_drm.h |  2 ++
>  drivers/gpu/drm/nouveau/nouveau_vga.c | 17 +++++++++++++++++
>  3 files changed, 51 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index 6197266..12a6240 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -296,6 +296,31 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
>  	return 0;
>  }
>  
> +#define PCI_CLASS_MULTIMEDIA_HD_AUDIO 0x0403
> +
> +static void
> +nouveau_get_hdmi_dev(struct drm_device *dev)
> +{
> +	struct nouveau_drm *drm = dev->dev_private;
> +	struct pci_dev *pdev = dev->pdev;
> +
> +	/* subfunction one is a hdmi audio device? */
> +	drm->hdmi_device = pci_get_bus_and_slot((unsigned int)pdev->bus->number,
> +						PCI_DEVFN(PCI_SLOT(pdev->devfn), 1));
> +
> +	if (!drm->hdmi_device) {
> +		DRM_INFO("hdmi device  not found %d %d %d\n", pdev->bus->number, PCI_SLOT(pdev->devfn), 1);
> +		return;
> +	}
> +
> +	if ((drm->hdmi_device->class >> 8) != PCI_CLASS_MULTIMEDIA_HD_AUDIO) {
> +		DRM_INFO("possible hdmi device  not audio %d\n", drm->hdmi_device->class);
> +		pci_dev_put(drm->hdmi_device);
> +		drm->hdmi_device = NULL;
> +		return;
> +	}
> +}
> +
>  static int
>  nouveau_drm_load(struct drm_device *dev, unsigned long flags)
>  {
> @@ -314,6 +339,8 @@ nouveau_drm_load(struct drm_device *dev, unsigned long flags)
>  	INIT_LIST_HEAD(&drm->clients);
>  	spin_lock_init(&drm->tile.lock);
>  
> +	nouveau_get_hdmi_dev(dev);
> +
>  	/* make sure AGP controller is in a consistent state before we
>  	 * (possibly) execute vbios init tables (see nouveau_agp.h)
>  	 */
> @@ -400,6 +427,9 @@ fail_ttm:
>  	nouveau_agp_fini(drm);
>  	nouveau_vga_fini(drm);
>  fail_device:
> +	if (drm->hdmi_device)
> +		pci_dev_put(drm->hdmi_device);
> +
>  	nouveau_cli_destroy(&drm->client);
>  	return ret;
>  }
> @@ -424,6 +454,8 @@ nouveau_drm_unload(struct drm_device *dev)
>  	nouveau_agp_fini(drm);
>  	nouveau_vga_fini(drm);
>  
> +	if (drm->hdmi_device)
> +		pci_dev_put(drm->hdmi_device);
>  	nouveau_cli_destroy(&drm->client);
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.h b/drivers/gpu/drm/nouveau/nouveau_drm.h
> index 41ff7e0..f276e37 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.h
> @@ -129,6 +129,8 @@ struct nouveau_drm {
>  
>  	/* power management */
>  	struct nouveau_pm *pm;
> +
> +	struct pci_dev *hdmi_device;
>  };
>  
>  static inline struct nouveau_drm *
> diff --git a/drivers/gpu/drm/nouveau/nouveau_vga.c b/drivers/gpu/drm/nouveau/nouveau_vga.c
> index 25d3495..d8af49c 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_vga.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_vga.c
> @@ -27,6 +27,22 @@ nouveau_vga_set_decode(void *priv, bool state)
>  }
>  
>  static void
> +nouveau_reenable_hdmi_device(struct drm_device *dev)
> +{
> +	struct nouveau_drm *drm = nouveau_drm(dev);
> +	struct nouveau_device *device = nv_device(drm->device);
> +	uint32_t val;
> +
> +	if (!drm->hdmi_device)
> +		return;
> +
> +	/* write magic value into magic place */
> +	val = nv_rd32(device, 0x88488);
> +	val |= (1 << 25);
> +	nv_wr32(device, 0x88488, val);
> +}
use nv_mask(dev, 0x88488, 0x02000000, 0x02000000);

Could this be added in core/engine/disp/hdminv84.c nv84_hdmi_ctrl to get the same effect?

~Maarten
