From: Maxim Levitsky <maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 04/10] nouveau: hide cursor before suspending.
Date: Sun, 09 Oct 2011 23:03:57 +0200
Message-ID: <1318194237.27225.1.camel@maxim-laptop>
References: <1318193920-27461-1-git-send-email-maximlevitsky@gmail.com>
	<1318193920-27461-5-git-send-email-maximlevitsky@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1318193920-27461-5-git-send-email-maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

On Sun, 2011-10-09 at 22:58 +0200, Maxim Levitsky wrote: 
> Otherwise PDISPLAY might try to access the unmapped and filled with garbage
> cursor on resume. Fixes external output not comping to life after resume.
Forgot to update description here.

From: Maxim Levitsky <maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date: 2011-10-09 13:29:57 +0200

nouveau: restore cursors after restoring modes

PDISPLAY doesn't like when disabled CRTCs are poked.
Fixes external output not coming to life when it has cursor on.
https://bugs.freedesktop.org/show_bug.cgi?id=41608

Signed-off-by: Maxim Levitsky <maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>


> 
> Signed-off-by: Maxim Levitsky <maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_drv.c |   18 +++++++++---------
>  1 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.c b/drivers/gpu/drm/nouveau/nouveau_drv.c
> index b404840..0d6a199 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drv.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drv.c
> @@ -367,15 +367,6 @@ nouveau_pci_resume(struct pci_dev *pdev)
>  
>  	engine->display.init(dev);
>  
> -	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
> -		struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
> -		u32 offset = nv_crtc->cursor.nvbo->bo.offset;
> -
> -		nv_crtc->cursor.set_offset(nv_crtc, offset);
> -		nv_crtc->cursor.set_pos(nv_crtc, nv_crtc->cursor_saved_x,
> -						 nv_crtc->cursor_saved_y);
> -	}
> -
>  	/* Force CLUT to get re-loaded during modeset */
>  	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
>  		struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
> @@ -391,6 +382,15 @@ nouveau_pci_resume(struct pci_dev *pdev)
>  
>  	drm_helper_resume_force_mode(dev);
>  
> +	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
> +		struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
> +		u32 offset = nv_crtc->cursor.nvbo->bo.offset;
> +
> +		nv_crtc->cursor.set_offset(nv_crtc, offset);
> +		nv_crtc->cursor.set_pos(nv_crtc, nv_crtc->cursor_saved_x,
> +						 nv_crtc->cursor_saved_y);
> +	}
> +
>  	nouveau_fbcon_restore_accel(dev);
>  	drm_kms_helper_poll_enable(dev);
>  	return 0;

-- 
Best regards,
        Maxim Levitsky

Visit my blog: http://maximlevitsky.wordpress.com
Warning: Above blog contains rants.
