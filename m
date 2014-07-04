From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm: default scaling to NONE for external
	connectors
Date: Fri, 4 Jul 2014 10:27:20 +1000
Message-ID: <CACAvsv7iLKLENQbq0UAb39AjV-fg7o4TXLHbO2Bs_JjKoj9gYw@mail.gmail.com>
References: <1404415623-7198-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1404415623-7198-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Fri, Jul 4, 2014 at 5:27 AM, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:
> Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
> ---
>
> Based on a recent discussion in #radeon, and also my own observation that the
> 'full' scaling causes no end of confusion among users.
>
> See https://bugs.freedesktop.org/show_bug.cgi?id=80868 for some more details,
> although it is more radeon-specific.
>
> Side-note: the scaling mode update handler disallows setting the mode to none
> for LVDS... should it be the same for eDP as well? Or perhaps relax the
> restriction and let people do whatever they want?
We do need some improvement here, for sure.  What we do currently is
confusing for a lot of cases, like where people select a
(non-preferred) 24Hz mode or something and still get 60 because we
always use the preferred mode on the backend (except for the 'None'
scaling mode).

I somewhat think we should probably default to something like "if mode
came from edid (or the user?), no scaling" and "if it's from the
random list of modes we add to fixed panels to keep old games happy,
scale to closest edid mode / preferred mode / something".. I'm not
entirely sure what the best choices are to be honest.

Ben.

>
>  drm/nouveau_connector.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drm/nouveau_connector.c b/drm/nouveau_connector.c
> index 1fa222e..295e222 100644
> --- a/drm/nouveau_connector.c
> +++ b/drm/nouveau_connector.c
> @@ -1192,6 +1192,8 @@ nouveau_connector_create(struct drm_device *dev, int index)
>                                               disp->color_vibrance_property,
>                                               150);
>
> +       nv_connector->scaling_mode = DRM_MODE_SCALE_NONE;
> +
>         switch (nv_connector->type) {
>         case DCB_CONNECTOR_VGA:
>                 if (nv_device(drm->device)->card_type >= NV_50) {
> @@ -1203,10 +1205,11 @@ nouveau_connector_create(struct drm_device *dev, int index)
>         case DCB_CONNECTOR_TV_0:
>         case DCB_CONNECTOR_TV_1:
>         case DCB_CONNECTOR_TV_3:
> -               nv_connector->scaling_mode = DRM_MODE_SCALE_NONE;
>                 break;
>         default:
> -               nv_connector->scaling_mode = DRM_MODE_SCALE_FULLSCREEN;
> +               if (type == DRM_MODE_CONNECTOR_LVDS ||
> +                   type == DRM_MODE_CONNECTOR_eDP)
> +                       nv_connector->scaling_mode = DRM_MODE_SCALE_FULLSCREEN;
>
>                 drm_object_attach_property(&connector->base,
>                                 dev->mode_config.scaling_mode_property,
> --
> 1.8.5.5
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
