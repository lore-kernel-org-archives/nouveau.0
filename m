From: "Kirill A. Shutemov" <kirill-oKw7cIdHH8eLwutG50LtGA@public.gmane.org>
Subject: Re: [PATCH v3] drm/nouveau: Accept 'legacy' format
 modifiers
Date: Fri, 31 Jul 2020 01:19:37 +0300
Message-ID: <20200730221937.kcy7synseuedn6qf@box>
References: <20200730172617.4158-1-jajones@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200730172617.4158-1-jajones-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: James Jones <jajones-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Thu, Jul 30, 2020 at 10:26:17AM -0700, James Jones wrote:
> Accept the DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK()
> family of modifiers to handle broken userspace
> Xorg modesetting and Mesa drivers. Existing Mesa
> drivers are still aware of only these older
> format modifiers which do not differentiate
> between different variations of the block linear
> layout. When the format modifier support flag was
> flipped in the nouveau kernel driver, the X.org
> modesetting driver began attempting to use its
> format modifier-enabled framebuffer path. Because
> the set of format modifiers advertised by the
> kernel prior to this change do not intersect with
> the set of format modifiers advertised by Mesa,
> allocating GBM buffers using format modifiers
> fails and the modesetting driver falls back to
> non-modifier allocation. However, it still later
> queries the modifier of the GBM buffer when
> creating its DRM-KMS framebuffer object, receives
> the old-format modifier from Mesa, and attempts
> to create a framebuffer with it. Since the kernel
> is still not aware of these formats, this fails.
> 
> Userspace should not be attempting to query format
> modifiers of GBM buffers allocated with a non-
> format-modifier-aware allocation path, but to
> avoid breaking existing userspace behavior, this
> change accepts the old-style format modifiers when
> creating framebuffers and applying them to planes
> by translating them to the equivalent new-style
> modifier. To accomplish this, some layout
> parameters must be assumed to match properties of
> the device targeted by the relevant ioctls. To
> avoid perpetuating misuse of the old-style
> modifiers, this change does not advertise support
> for them. Doing so would imply compatibility
> between devices with incompatible memory layouts.
> 
> Tested with Xorg 1.20 modesetting driver,
> weston@c46c70dac84a4b3030cd05b380f9f410536690fc,
> gnome & KDE wayland desktops from Ubuntu 18.04,
> kmscube hacked to use linear mod, and sway 1.5
> 
> Reported-by: Kirill A. Shutemov <kirill-oKw7cIdHH8eLwutG50LtGA@public.gmane.org>
> Fixes: fa4f4c213f5f ("drm/nouveau/kms: Support NVIDIA format modifiers")
> Link: https://lkml.org/lkml/2020/6/30/1251
> Signed-off-by: James Jones <jajones-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_display.c | 26 +++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
> index 496c4621cc78..31543086254b 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> @@ -191,8 +191,14 @@ nouveau_decode_mod(struct nouveau_drm *drm,
>  		   uint32_t *tile_mode,
>  		   uint8_t *kind)
>  {
> +	struct nouveau_display *disp = nouveau_display(drm->dev);
>  	BUG_ON(!tile_mode || !kind);
>  
> +	if ((modifier & (0xffull << 12)) == 0ull) {
> +		/* Legacy modifier.  Translate to this device's 'kind.' */
> +		modifier |= disp->format_modifiers[0] & (0xffull << 12);
> +	}
> +
>  	if (modifier == DRM_FORMAT_MOD_LINEAR) {
>  		/* tile_mode will not be used in this case */
>  		*tile_mode = 0;

Em. I thought Ben's suggestion was to move it under != MOD_LINEAR. I don't
see it here.


-- 
 Kirill A. Shutemov
