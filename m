From: Marcin Slusarz <marcin.slusarz@gmail.com>
Subject: Re: [PATCH 1/2] xorg/nouveau: rename to nouveau2
Date: Mon, 20 Jun 2011 00:28:13 +0200
Message-ID: <20110619222813.GJ4771@joi.lan>
References: <20110516195029.GA5456@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20110516195029.GA5456@joi.lan>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
Errors-To: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
To: nouveau@lists.freedesktop.org
Cc: mesa-dev@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On Mon, May 16, 2011 at 09:50:29PM +0200, Marcin Slusarz wrote:
> 
> ---
>  src/gallium/targets/xorg-nouveau/Makefile       |    2 +-
>  src/gallium/targets/xorg-nouveau/nouveau_xorg.c |   14 +++++++-------
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/src/gallium/targets/xorg-nouveau/Makefile b/src/gallium/targets/xorg-nouveau/Makefile
> index 5a2cdb1..16ac954 100644
> --- a/src/gallium/targets/xorg-nouveau/Makefile
> +++ b/src/gallium/targets/xorg-nouveau/Makefile
> @@ -1,7 +1,7 @@
>  TOP = ../../../..
>  include $(TOP)/configs/current
>  
> -LIBNAME = modesetting_drv.so
> +LIBNAME = nouveau2_drv.so
>  
>  C_SOURCES = \
>  	nouveau_target.c \
> diff --git a/src/gallium/targets/xorg-nouveau/nouveau_xorg.c b/src/gallium/targets/xorg-nouveau/nouveau_xorg.c
> index f0d6492..a25254a 100644
> --- a/src/gallium/targets/xorg-nouveau/nouveau_xorg.c
> +++ b/src/gallium/targets/xorg-nouveau/nouveau_xorg.c
> @@ -54,7 +54,7 @@ static PciChipsets nouveau_xorg_pci_devices[] = {
>  };
>  
>  static XF86ModuleVersionInfo nouveau_xorg_version = {
> -    "modesetting",
> +    "nouveau2",
>      MODULEVENDORSTRING,
>      MODINFOSTRING1,
>      MODINFOSTRING2,
> @@ -70,9 +70,9 @@ static XF86ModuleVersionInfo nouveau_xorg_version = {
>   * Xorg driver exported structures
>   */
>  
> -_X_EXPORT DriverRec modesetting = {
> +_X_EXPORT DriverRec nouveau2 = {
>      1,
> -    "modesetting",
> +    "nouveau2",
>      nouveau_xorg_identify,
>      NULL,
>      xorg_tracker_available_options,
> @@ -85,7 +85,7 @@ _X_EXPORT DriverRec modesetting = {
>  
>  static MODULESETUPPROTO(nouveau_xorg_setup);
>  
> -_X_EXPORT XF86ModuleData modesettingModuleData = {
> +_X_EXPORT XF86ModuleData nouveau2ModuleData = {
>      &nouveau_xorg_version,
>      nouveau_xorg_setup,
>      NULL
> @@ -104,7 +104,7 @@ nouveau_xorg_setup(pointer module, pointer opts, int *errmaj, int *errmin)
>       */
>      if (!setupDone) {
>  	setupDone = 1;
> -	xf86AddDriver(&modesetting, module, HaveDriverFuncs);
> +	xf86AddDriver(&nouveau2, module, HaveDriverFuncs);
>  
>  	/*
>  	 * The return value must be non-NULL on success even though there
> @@ -121,7 +121,7 @@ nouveau_xorg_setup(pointer module, pointer opts, int *errmaj, int *errmin)
>  static void
>  nouveau_xorg_identify(int flags)
>  {
> -    xf86PrintChipsets("modesetting", "Driver for Modesetting Kernel Drivers",
> +    xf86PrintChipsets("nouveau2", "Driver for Modesetting Kernel Drivers",
>  		      nouveau_xorg_chipsets);
>  }
>  
> @@ -137,7 +137,7 @@ nouveau_xorg_pci_probe(DriverPtr driver,
>      if (scrn != NULL) {
>  	scrn->driverVersion = 1;
>  	scrn->driverName = "nouveau";
> -	scrn->name = "modesetting";
> +	scrn->name = "nouveau2";
>  	scrn->Probe = NULL;
>  
>  	entity = xf86GetEntityInfo(entity_num);
> -- 

Can someone commit this patch?
 
Marcin
