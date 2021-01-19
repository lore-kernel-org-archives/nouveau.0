From: Simon Ser <contact-sV0wSBM+kKVWj0EZb7rXcA@public.gmane.org>
Subject: Re: [PATCH 2/3] drm/nouveau/kms/nv50-: Report max cursor
 size to userspace
Date: Tue, 19 Jan 2021 10:22:15 +0000
Message-ID: <iyiRYoTlFNd1Crgc673rDXnfqahsfhKFP89rA0kKYEFUpLGwsFtYL-x-Jwh1ZAo7vJerbikydEDSUFtAoewsGkh3WSYeykScJdKC2PVrKQs=@emersion.fr>
References: <20210119015415.2511028-1-lyude@redhat.com>
 <20210119015415.2511028-2-lyude@redhat.com>
Reply-To: Simon Ser <contact-sV0wSBM+kKVWj0EZb7rXcA@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20210119015415.2511028-2-lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Pankaj Bharadiya <pankaj.laxminarayan.bharadiya-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tuesday, January 19th, 2021 at 2:54 AM, Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:

> Cc: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
> Cc: Jeremy Cline <jcline-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Cc: Simon Ser <contact-sV0wSBM+kKVWj0EZb7rXcA@public.gmane.org>
> Signed-off-by: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/disp.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index c6367035970e..5f4f09a601d4 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -2663,6 +2663,14 @@ nv50_display_create(struct drm_device *dev)
>  	else
>  		nouveau_display(dev)->format_modifiers = disp50xx_modifiers;
>
> +	if (disp->disp->object.oclass >= GK104_DISP) {

I can confirm this works fine on GK208B. Tested with wlroots. I don't
have older cards to test, though.

Tested-by: Simon Ser <contact-sV0wSBM+kKVWj0EZb7rXcA@public.gmane.org>

> +		dev->mode_config.cursor_width = 256;
> +		dev->mode_config.cursor_height = 256;
> +	} else {
> +		dev->mode_config.cursor_width = 64;
> +		dev->mode_config.cursor_height = 64;
> +	}
> +
>  	/* create crtc objects to represent the hw heads */
>  	if (disp->disp->object.oclass >= GV100_DISP)
>  		crtcs = nvif_rd32(&device->object, 0x610060) & 0xff;
> --
> 2.29.2
