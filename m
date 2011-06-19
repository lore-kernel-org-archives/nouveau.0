From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/2] xorg/nouveau: blacklist all pre NV30
	cards
Date: Mon, 20 Jun 2011 00:28:36 +0200
Message-ID: <20110619222836.GK4771@joi.lan>
References: <20110516195110.GB5456@joi.lan> <20110516222014.GH5456@joi.lan>
	<20110605190626.GE22091@joi.lan>
	<BANLkTi=rs=TD44LirzwGjR8hWg4Miq4_Hg@mail.gmail.com>
	<BANLkTik4GSV2EQ1ry0K-b-PwbhsuHdZsAw@mail.gmail.com>
	<20110605194652.GA22358@joi.lan>
	<BANLkTimr-TiQ7HKY4hteCvu=f66OSkxYgg@mail.gmail.com>
	<20110605203159.GA26259@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110605203159.GA26259-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sun, Jun 05, 2011 at 10:31:59PM +0200, Marcin Slusarz wrote:
> From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Subject: [PATCH] xorg/nouveau: blacklist all pre NV30 cards
> 
> Bail out early in probe, so other driver (xf86-video-nouveau) can take control
> of the card. Doing it in screen_create would be too late.
> ---
>  src/gallium/targets/xorg-nouveau/Makefile       |    3 +
>  src/gallium/targets/xorg-nouveau/nouveau_xorg.c |   63 +++++++++++++++++++---
>  2 files changed, 57 insertions(+), 9 deletions(-)
> 
> diff --git a/src/gallium/targets/xorg-nouveau/Makefile b/src/gallium/targets/xorg-nouveau/Makefile
> index 16ac954..755969c 100644
> --- a/src/gallium/targets/xorg-nouveau/Makefile
> +++ b/src/gallium/targets/xorg-nouveau/Makefile
> @@ -23,4 +23,7 @@ DRIVER_PIPES = \
>  DRIVER_LINKS = \
>  	$(shell pkg-config --libs libdrm libdrm_nouveau)
>  
> +DRIVER_INCLUDES = \
> +	$(shell pkg-config --cflags-only-I libdrm libdrm_nouveau xf86driproto)
> +
>  include ../Makefile.xorg
> diff --git a/src/gallium/targets/xorg-nouveau/nouveau_xorg.c b/src/gallium/targets/xorg-nouveau/nouveau_xorg.c
> index a25254a..43470a1 100644
> --- a/src/gallium/targets/xorg-nouveau/nouveau_xorg.c
> +++ b/src/gallium/targets/xorg-nouveau/nouveau_xorg.c
> @@ -29,6 +29,9 @@
>   */
>  
>  #include "../../state_trackers/xorg/xorg_winsys.h"
> +#include <nouveau_drmif.h>
> +#include <xorg/dri.h>
> +#include <xf86drmMode.h>
>  
>  static void nouveau_xorg_identify(int flags);
>  static Bool nouveau_xorg_pci_probe(DriverPtr driver, int entity_num,
> @@ -38,16 +41,9 @@ static Bool nouveau_xorg_pci_probe(DriverPtr driver, int entity_num,
>  static const struct pci_id_match nouveau_xorg_device_match[] = {
>      { 0x10de, PCI_MATCH_ANY, PCI_MATCH_ANY, PCI_MATCH_ANY,
>        0x00030000, 0x00ffffff, 0 },
> -    { 0x12d2, PCI_MATCH_ANY, PCI_MATCH_ANY, PCI_MATCH_ANY,
> -      0x00030000, 0x00ffffff, 0 },
>      {0, 0, 0},
>  };
>  
> -static SymTabRec nouveau_xorg_chipsets[] = {
> -    {PCI_MATCH_ANY, "NVIDIA Graphics Device"},
> -    {-1, NULL}
> -};
> -
>  static PciChipsets nouveau_xorg_pci_devices[] = {
>      {PCI_MATCH_ANY, PCI_MATCH_ANY, NULL},
>      {-1, -1, NULL}
> @@ -121,8 +117,7 @@ nouveau_xorg_setup(pointer module, pointer opts, int *errmaj, int *errmin)
>  static void
>  nouveau_xorg_identify(int flags)
>  {
> -    xf86PrintChipsets("nouveau2", "Driver for Modesetting Kernel Drivers",
> -		      nouveau_xorg_chipsets);
> +    xf86DrvMsg(0, X_INFO, "nouveau2: Gallium3D based 2D driver for NV30+ NVIDIA chipsets\n");
>  }
>  
>  static Bool
> @@ -131,6 +126,56 @@ nouveau_xorg_pci_probe(DriverPtr driver,
>  {
>      ScrnInfoPtr scrn = NULL;
>      EntityInfoPtr entity;
> +    struct nouveau_device *dev = NULL;
> +    char *busid;
> +    int chipset, ret;
> +
> +    if (device->vendor_id != 0x10DE)
> +	return FALSE;
> +
> +    if (!xf86LoaderCheckSymbol("DRICreatePCIBusID")) {
> +	xf86DrvMsg(-1, X_ERROR, "[drm] No DRICreatePCIBusID symbol\n");
> +	return FALSE;
> +    }
> +    busid = DRICreatePCIBusID(device);
> +
> +    ret = nouveau_device_open(&dev, busid);
> +    if (ret) {
> +	xf86DrvMsg(-1, X_ERROR, "[drm] failed to open device\n");
> +	free(busid);
> +	return FALSE;
> +    }
> +
> +    chipset = dev->chipset;
> +    nouveau_device_close(&dev);
> +
> +    ret = drmCheckModesettingSupported(busid);
> +    free(busid);
> +    if (ret) {
> +	xf86DrvMsg(-1, X_ERROR, "[drm] KMS not enabled\n");
> +	return FALSE;
> +    }
> +
> +    switch (chipset & 0xf0) {
> +    case 0x00:
> +    case 0x10:
> +    case 0x20:
> +	xf86DrvMsg(-1, X_NOTICE, "Too old chipset: NV%02x\n", chipset);
> +	return FALSE;
> +    case 0x30:
> +    case 0x40:
> +    case 0x60:
> +    case 0x50:
> +    case 0x80:
> +    case 0x90:
> +    case 0xa0:
> +    case 0xc0:
> +	xf86DrvMsg(-1, X_INFO, "Detected chipset: NV%02x\n", chipset);
> +	break;
> +    default:
> +	xf86DrvMsg(-1, X_ERROR, "Unknown chipset: NV%02x\n", chipset);
> +	return FALSE;
> +    }
>  
>      scrn = xf86ConfigPciEntity(scrn, 0, entity_num, nouveau_xorg_pci_devices,
>  			       NULL, NULL, NULL, NULL, NULL);
> -- 


Can someone commit this patch?
 
Marcin
