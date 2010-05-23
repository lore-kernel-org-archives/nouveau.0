From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] nv: improve KMS detection
Date: Mon, 24 May 2010 08:37:03 +1000
Message-ID: <1274654223.7344.0.camel@nisroch>
References: <20100523194645.GA15846@joi.lan>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100523194645.GA15846-OI9uyE9O0yo@public.gmane.org>
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
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Christopher James Halse Rogers <raof-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>, Aaron Plattner <aplattner-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Sun, 2010-05-23 at 21:46 +0200, Marcin Slusarz wrote:
> 1) DRICreatePCIBusID belongs to xserver dri module, so when it's
>    unavailable we can't format string for drmCheckModesettingSupported.
>    (This situation happened to me with KMS enabled and dri module moved
>    somewhere else by Gentoo's "eselect opengl set nvidia" switcher)
>    Open code DRICreatePCIBusID to drop dri dependency.
> 2) Once we dropped dependency on dri module (which linked to libdrm),
>    we have to link directly to libdrm.
An alternative, which we use in Fedora for nv/vesa is to use
pci_device_has_kernel_driver() from libpciaccess.

Ben.

> 
> Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  src/Makefile.am |    2 +-
>  src/nv_driver.c |   11 +++--------
>  2 files changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/src/Makefile.am b/src/Makefile.am
> index 5d57010..8b23e21 100644
> --- a/src/Makefile.am
> +++ b/src/Makefile.am
> @@ -25,7 +25,7 @@
>  # TODO: -nostdlib/-Bstatic/-lgcc platform magic, not installing the .a, etc.
>  AM_CFLAGS = @XMODES_CFLAGS@ @XORG_CFLAGS@ $(LIBDRM_CFLAGS)
>  nv_drv_la_LTLIBRARIES = nv_drv.la
> -nv_drv_la_LDFLAGS = -module -avoid-version
> +nv_drv_la_LDFLAGS = -module -avoid-version $(LIBDRM_LIBS)
>  nv_drv_ladir = @moduledir@/drivers
>  
>  nv_drv_la_SOURCES = $(nv_sources) $(riva_sources) $(g80_sources)
> diff --git a/src/nv_driver.c b/src/nv_driver.c
> index e10ae0c..6651cd4 100644
> --- a/src/nv_driver.c
> +++ b/src/nv_driver.c
> @@ -836,18 +836,13 @@ NVIsSupported(CARD32 id)
>  }
>  
>  #ifdef HAVE_KMS
> -static Bool NVKernelModesettingEnabled(struct pci_device *device)
> +static Bool NVKernelModesettingEnabled(struct pci_device *dev)
>  {
> -    char *busIdString;
> +    char busIdString[20];
>      int ret;
>  
> -    if (!xf86LoaderCheckSymbol("DRICreatePCIBusID"))
> -        return FALSE;
> -
> -    busIdString = DRICreatePCIBusID(device);
> -
> +    snprintf(busIdString, 20, "pci:%04x:%02x:%02x.%d", dev->domain, dev->bus, dev->dev, dev->func);
>      ret = drmCheckModesettingSupported(busIdString);
> -    xfree(busIdString);
>  
>      return (ret == 0);
>  }
