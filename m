From: Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 04/20] drm/bochs: Remove references to struct
 drm_device.pdev
Date: Wed, 2 Dec 2020 09:10:31 +0100
Message-ID: <20201202081031.o63hddrz3gccbzvt@sirius.home.kraxel.org>
References: <20201201103542.2182-1-tzimmermann@suse.de>
 <20201201103542.2182-5-tzimmermann@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20201201103542.2182-5-tzimmermann-l3A5Bk7waGM@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "amd-gfx" <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
Cc: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, airlied-cv59FeDIM0c@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, virtualization-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, spice-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, intel-gvt-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, Dec 01, 2020 at 11:35:26AM +0100, Thomas Zimmermann wrote:
> Using struct drm_device.pdev is deprecated. Convert bochs to struct
> drm_device.dev. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
> Acked-by: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
> Cc: Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Acked-by: Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

> ---
>  drivers/gpu/drm/bochs/bochs_drv.c | 1 -
>  drivers/gpu/drm/bochs/bochs_hw.c  | 4 ++--
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bochs/bochs_drv.c b/drivers/gpu/drm/bochs/bochs_drv.c
> index fd454225fd19..b469624fe40d 100644
> --- a/drivers/gpu/drm/bochs/bochs_drv.c
> +++ b/drivers/gpu/drm/bochs/bochs_drv.c
> @@ -121,7 +121,6 @@ static int bochs_pci_probe(struct pci_dev *pdev,
>  	if (ret)
>  		goto err_free_dev;
>  
> -	dev->pdev = pdev;
>  	pci_set_drvdata(pdev, dev);
>  
>  	ret = bochs_load(dev);
> diff --git a/drivers/gpu/drm/bochs/bochs_hw.c b/drivers/gpu/drm/bochs/bochs_hw.c
> index dce4672e3fc8..2d7380a9890e 100644
> --- a/drivers/gpu/drm/bochs/bochs_hw.c
> +++ b/drivers/gpu/drm/bochs/bochs_hw.c
> @@ -110,7 +110,7 @@ int bochs_hw_load_edid(struct bochs_device *bochs)
>  int bochs_hw_init(struct drm_device *dev)
>  {
>  	struct bochs_device *bochs = dev->dev_private;
> -	struct pci_dev *pdev = dev->pdev;
> +	struct pci_dev *pdev = to_pci_dev(dev->dev);
>  	unsigned long addr, size, mem, ioaddr, iosize;
>  	u16 id;
>  
> @@ -201,7 +201,7 @@ void bochs_hw_fini(struct drm_device *dev)
>  		release_region(VBE_DISPI_IOPORT_INDEX, 2);
>  	if (bochs->fb_map)
>  		iounmap(bochs->fb_map);
> -	pci_release_regions(dev->pdev);
> +	pci_release_regions(to_pci_dev(dev->dev));
>  	kfree(bochs->edid);
>  }
>  
> -- 
> 2.29.2
> 
