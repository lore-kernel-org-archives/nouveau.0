From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/2] drm/nouveau: Small CRC fixes for 5.9
Date: Tue, 11 Aug 2020 09:23:51 +1000
Message-ID: <CACAvsv5WW=gZ0HjMg1GWz6Y59rUzE0qmrr2FSPcES33tx81iKw@mail.gmail.com>
References: <20200810211838.37862-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200810211838.37862-1-lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
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
Cc: ML nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, 11 Aug 2020 at 07:18, Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>
> Just two CRC related fixes for the new CRC functionality in 5.9. One of
> these unbreaks CRC reporting on volta+, which accidentally got broken
> when converting over to nvidia's class headers. The other simply removes
> an unneeded CRC method call that's been hiding in head907d_mode() for
> quite a while now.
>
> Lyude Paul (2):
>   drm/nouveau/kms/nv140-: Include correct push header in crcc37d.c
Got them both.  I already had this first one in my tree, but your
description was better, so I took yours.

Thanks,
Ben.

>   drm/nouveau/kms/nv50-: Don't call HEAD_SET_CRC_CONTROL in
>     head907d_mode()
>
>  drivers/gpu/drm/nouveau/dispnv50/crcc37d.c  |  2 +-
>  drivers/gpu/drm/nouveau/dispnv50/head907d.c | 11 ++---------
>  2 files changed, 3 insertions(+), 10 deletions(-)
>
> --
> 2.26.2
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
