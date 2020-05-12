From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 3/5] drm/nouveau/kms/gv100-: Add support
 for interlaced modes
Date: Tue, 12 May 2020 12:10:03 +1000
Message-ID: <CACAvsv7V4wHhCKVaA7F-GiF-cN21E-z82JBp=pnePgWj-Kcq0A@mail.gmail.com>
References: <20200511224148.598468-1-lyude@redhat.com>
 <20200511224148.598468-4-lyude@redhat.com>
 <CAKb7UvjQfw9UvxCdcu1k3t0dnq7PdQJrw5CtWhB42=uiW9-4dA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvjQfw9UvxCdcu1k3t0dnq7PdQJrw5CtWhB42=uiW9-4dA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, 12 May 2020 at 09:06, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:
>
> On Mon, May 11, 2020 at 6:42 PM Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
> > index 43bcbb6d73c4..6dae00da5d7e 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> > @@ -1065,7 +1065,7 @@ nouveau_connector_mode_valid(struct drm_connector *connector,
> >                 return get_slave_funcs(encoder)->mode_valid(encoder, mode);
> >         case DCB_OUTPUT_DP:
> >                 if (mode->flags & DRM_MODE_FLAG_INTERLACE &&
> > -                   !nv_encoder->dp.caps.interlace)
> > +                   !nv_encoder->caps.dp_interlace)
> >                         return MODE_NO_INTERLACE;
> >
> >                 max_clock  = nv_encoder->dp.link_nr;
>
> You probably meant for this hunk to go into an earlier patch.
I fixed this and merged the series.

Ben.
>
>   -ilia
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
