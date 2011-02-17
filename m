From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: Fix pageflip event
Date: Thu, 17 Feb 2011 15:43:13 +1000
Message-ID: <AANLkTik6cywedWQXjzj6_xPqy5=4_Uy2dETvA0NTTxrR@mail.gmail.com>
References: <1297847088-5824-1-git-send-email-benjaminfranzke@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1297847088-5824-1-git-send-email-benjaminfranzke-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Benjamin Franzke <benjaminfranzke-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, Feb 16, 2011 at 7:04 PM, Benjamin Franzke
<benjaminfranzke-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> Assign correct event when initializing nouveau_page_flip_state.
Ah yes, I though that was an oddity when I was getting nv50/nvc0 page
flipping done.

Pushed to nouveau git,
Thanks!

> ---
> =A0drivers/gpu/drm/nouveau/nouveau_display.c | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/=
nouveau/nouveau_display.c
> index c42d84e..764c15d 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> @@ -290,7 +290,7 @@ nouveau_crtc_page_flip(struct drm_crtc *crtc, struct =
drm_framebuffer *fb,
>
> =A0 =A0 =A0 =A0/* Initialize a page flip struct */
> =A0 =A0 =A0 =A0*s =3D (struct nouveau_page_flip_state)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 { { }, s->event, nouveau_crtc(crtc)->index,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 { { }, event, nouveau_crtc(crtc)->index,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fb->bits_per_pixel, fb->pitch, crtc->x=
, crtc->y,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0new_bo->bo.offset };
>
> --
> 1.7.3.4
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>
