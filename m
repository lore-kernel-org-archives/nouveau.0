From: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 09/15] drm/nouveau: Remove references to
 struct drm_device.pdev
Date: Tue, 24 Nov 2020 22:42:08 +0100
Message-ID: <20201124214208.GB93095@ravnborg.org>
References: <20201124113824.19994-1-tzimmermann@suse.de>
 <20201124113824.19994-10-tzimmermann@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20201124113824.19994-10-tzimmermann-l3A5Bk7waGM@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
Cc: airlied-cv59FeDIM0c@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, virtualization-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, spice-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, intel-gvt-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Hi Thomas.

On Tue, Nov 24, 2020 at 12:38:18PM +0100, Thomas Zimmermann wrote:
> Using struct drm_device.pdev is deprecated. Convert nouveau to struct
> drm_device.dev. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
> Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Suggestion to an alternative implmentation below.

> ---
>  drivers/gpu/drm/nouveau/dispnv04/arb.c      | 12 +++++++-----
>  drivers/gpu/drm/nouveau/dispnv04/disp.h     | 14 ++++++++------
>  drivers/gpu/drm/nouveau/dispnv04/hw.c       | 10 ++++++----
>  drivers/gpu/drm/nouveau/nouveau_abi16.c     |  7 ++++---
>  drivers/gpu/drm/nouveau/nouveau_acpi.c      |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_bios.c      | 11 ++++++++---
>  drivers/gpu/drm/nouveau/nouveau_connector.c | 10 ++++++----
>  drivers/gpu/drm/nouveau/nouveau_drm.c       |  5 ++---
>  drivers/gpu/drm/nouveau/nouveau_fbcon.c     |  6 ++++--
>  drivers/gpu/drm/nouveau/nouveau_vga.c       | 20 ++++++++++++--------
>  10 files changed, 58 insertions(+), 39 deletions(-)
> 

> diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
> index d204ea8a5618..7cc683b8dc7a 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bios.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
> @@ -110,6 +110,9 @@ static int call_lvds_manufacturer_script(struct drm_device *dev, struct dcb_outp
>  	struct nvbios *bios = &drm->vbios;
>  	uint8_t sub = bios->data[bios->fp.xlated_entry + script] + (bios->fp.link_c_increment && dcbent->or & DCB_OUTPUT_C ? 1 : 0);
>  	uint16_t scriptofs = ROM16(bios->data[bios->init_script_tbls_ptr + sub * 2]);
> +#ifdef __powerpc__
> +	struct pci_dev *pdev = to_pci_dev(dev->dev);
> +#endif
Or
	int device = 0;
>  
>  	if (!bios->fp.xlated_entry || !sub || !scriptofs)
>  		return -EINVAL;
> @@ -123,8 +126,8 @@ static int call_lvds_manufacturer_script(struct drm_device *dev, struct dcb_outp
>  #ifdef __powerpc__
>  	/* Powerbook specific quirks */
	device = to_pci_dev(dev->dev)->device;
	if (script == LVDS_RESET && (device == 0x0179 || device == 0x0189 || device == 0x0329))

>  	if (script == LVDS_RESET &&
> -	    (dev->pdev->device == 0x0179 || dev->pdev->device == 0x0189 ||
> -	     dev->pdev->device == 0x0329))
> +	    (pdev->device == 0x0179 || pdev->device == 0x0189 ||
> +	     pdev->device == 0x0329))
>  		nv_write_tmds(dev, dcbent->or, 0, 0x02, 0x72);
>  #endif
>  


> diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
> index 24ec5339efb4..4fc0fa696461 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
> @@ -396,7 +396,9 @@ nouveau_fbcon_create(struct drm_fb_helper *helper,
>  	NV_INFO(drm, "allocated %dx%d fb: 0x%llx, bo %p\n",
>  		fb->width, fb->height, nvbo->offset, nvbo);
>  
> -	vga_switcheroo_client_fb_set(dev->pdev, info);
> +	if (dev_is_pci(dev->dev))
> +		vga_switcheroo_client_fb_set(to_pci_dev(dev->dev), info);
> +
I cannot see why dev_is_pci() is needed here.
So I am obviously missing something :-(

>  	return 0;
>  
>  out_unlock:
> @@ -548,7 +550,7 @@ nouveau_fbcon_init(struct drm_device *dev)
>  	int ret;
>  
>  	if (!dev->mode_config.num_crtc ||
> -	    (dev->pdev->class >> 8) != PCI_CLASS_DISPLAY_VGA)
> +	    (to_pci_dev(dev->dev)->class >> 8) != PCI_CLASS_DISPLAY_VGA)
>  		return 0;
>  
>  	fbcon = kzalloc(sizeof(struct nouveau_fbdev), GFP_KERNEL);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_vga.c b/drivers/gpu/drm/nouveau/nouveau_vga.c
> index c85dd8afa3c3..7c4b374b3eca 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_vga.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_vga.c
> @@ -87,18 +87,20 @@ nouveau_vga_init(struct nouveau_drm *drm)
>  {
>  	struct drm_device *dev = drm->dev;
>  	bool runtime = nouveau_pmops_runtime();
> +	struct pci_dev *pdev;
>  
>  	/* only relevant for PCI devices */
> -	if (!dev->pdev)
> +	if (!dev_is_pci(dev->dev))
>  		return;
> +	pdev = to_pci_dev(dev->dev);
>  
> -	vga_client_register(dev->pdev, dev, NULL, nouveau_vga_set_decode);
> +	vga_client_register(pdev, dev, NULL, nouveau_vga_set_decode);
>  
>  	/* don't register Thunderbolt eGPU with vga_switcheroo */
> -	if (pci_is_thunderbolt_attached(dev->pdev))
> +	if (pci_is_thunderbolt_attached(pdev))
>  		return;
>  
> -	vga_switcheroo_register_client(dev->pdev, &nouveau_switcheroo_ops, runtime);
> +	vga_switcheroo_register_client(pdev, &nouveau_switcheroo_ops, runtime);
>  
>  	if (runtime && nouveau_is_v1_dsm() && !nouveau_is_optimus())
>  		vga_switcheroo_init_domain_pm_ops(drm->dev->dev, &drm->vga_pm_domain);
> @@ -109,17 +111,19 @@ nouveau_vga_fini(struct nouveau_drm *drm)
>  {
>  	struct drm_device *dev = drm->dev;
>  	bool runtime = nouveau_pmops_runtime();
> +	struct pci_dev *pdev;
>  
>  	/* only relevant for PCI devices */
> -	if (!dev->pdev)
> +	if (!dev_is_pci(dev->dev))
>  		return;
> +	pdev = to_pci_dev(dev->dev);
>  
> -	vga_client_register(dev->pdev, NULL, NULL, NULL);
> +	vga_client_register(pdev, NULL, NULL, NULL);
>  
> -	if (pci_is_thunderbolt_attached(dev->pdev))
> +	if (pci_is_thunderbolt_attached(pdev))
>  		return;
>  
> -	vga_switcheroo_unregister_client(dev->pdev);
> +	vga_switcheroo_unregister_client(pdev);
>  	if (runtime && nouveau_is_v1_dsm() && !nouveau_is_optimus())
>  		vga_switcheroo_fini_domain_pm_ops(drm->dev->dev);
>  }
> -- 
> 2.29.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
