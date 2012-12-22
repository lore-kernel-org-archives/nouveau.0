From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: G4 Snowball DPMS 1 fix
Date: Sat, 22 Dec 2012 18:46:42 +0100
Message-ID: <20121222174642.GA3109@joi.lan>
References: <50D5ED01.2030206@konink.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50D5ED01.2030206-01bSGNrlLMOzQB+pC5nmwQ@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Stefan de Konink <stefan-01bSGNrlLMOzQB+pC5nmwQ@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sat, Dec 22, 2012 at 06:25:21PM +0100, Stefan de Konink wrote:
> Hi,
> 
> Since I am a proud owner of a G4 Snowball, and the screen did some
> strange things in DPMS 1 (blanking), I thought it was a good idea to fix
> it. With some help from IRC I made the attached patch.
> 
> Stefan

> commit 4e2b7e05ceb5afb2f1a0b9e5bfd405bbef11a723
> Author: Stefan de Konink <stefan-01bSGNrlLMOzQB+pC5nmwQ@public.gmane.org>
> Date:   Sat Dec 22 18:04:37 2012 +0100
> 
>     drm/nouveau: Fix DPMS 1 on G4 Snowball, from snow white to coal black.
>     
>     This fixes bug <https://bugs.freedesktop.org/show_bug.cgi?id=40275>
>     
>     Signed-off-by: Stefan de Konink <stefan-01bSGNrlLMOzQB+pC5nmwQ@public.gmane.org>
> 
> diff --git a/drivers/gpu/drm/nouveau/nv04_dfp.c b/drivers/gpu/drm/nouveau/nv04_dfp.c
> index 184cdf8..eb76b69 100644
> --- a/drivers/gpu/drm/nouveau/nv04_dfp.c
> +++ b/drivers/gpu/drm/nouveau/nv04_dfp.c
> @@ -490,8 +490,8 @@ static void nv04_dfp_update_backlight(struct drm_encoder *encoder, int mode)
>  	/* BIOS scripts usually take care of the backlight, thanks
>  	 * Apple for your consistency.
>  	 */
> -	if (dev->pci_device == 0x0179 || dev->pci_device == 0x0189 ||
> -	    dev->pci_device == 0x0329) {
> +	if (dev->pci_device == 0x0174 || dev->pci_device == 0x0179 ||
> +	    dev->pci_device == 0x0189 || dev->pci_device == 0x0329) {
>  		if (mode == DRM_MODE_DPMS_ON) {
>  			nv_mask(device, NV_PBUS_DEBUG_DUALHEAD_CTL, 0, 1 << 31);
>  			nv_mask(device, NV_PCRTC_GPIO_EXT, 3, 1);

Reviewed-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
