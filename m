From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 0/3] drm/gk20a: support for reclocking
Date: Tue, 5 Aug 2014 09:55:10 +1000
Message-ID: <CACAvsv7mLcaWmZsaQz95GBktxcCf22Nkh9y+UyeHTcY78TPY2w@mail.gmail.com>
References: <1406367701-9155-1-git-send-email-gnurou@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1406367701-9155-1-git-send-email-gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Sat, Jul 26, 2014 at 7:41 PM, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Second version of the gk20a clock patches. I have tried to keep the therm and
> volt devices mandatory in the clock driver, but unfortunately they are too tied
> to bios to allow this, at least for the moment. Consequently this version is
> mostly a port of the first version to Ben's tree.
I've merged the series, thanks Alex.

>
> Ben, please let me know what I have done wrong in terms of integration to your
> tree, as the main purpose of writing patches against it instead of the kernel
> is to make your life easier. :)
I honestly don't mind at all if you completely ignore the non-DRM
build and leave it to me to fix up.  I personally use the userspace
build quite a lot for dev/testing, but don't at all expect others to,
or to maintain it.  But thank you for bothering :)

In any case, it was *almost* (clk_get_rate() was missing) fine.  I
left a patch in the tree of what I changed, and I'll squash it before
it goes to -staging.

Thanks again,
Ben.

>
> Alexandre Courbot (3):
>   clk: make therm and volt devices optional
>   clk: support for non-BIOS pstates
>   gk20a: reclocking support
>
>  drm/Kbuild                      |   1 +
>  drm/core/os.h                   |   1 +
>  drm/core/subdev/clock/gk20a.c   |   1 +
>  drm/core/subdev/fb/ramgk20a.h   |   1 +
>  drm/core/subdev/instmem/gk20a.c |   1 +
>  lib/core/os.h                   |  10 +
>  nvkm/engine/device/nve0.c       |   1 +
>  nvkm/include/subdev/clock.h     |   9 +-
>  nvkm/subdev/clock/Makefile.am   |   1 +
>  nvkm/subdev/clock/base.c        |  52 ++--
>  nvkm/subdev/clock/gk20a.c       | 665 ++++++++++++++++++++++++++++++++++++++++
>  nvkm/subdev/clock/nv04.c        |   4 +-
>  nvkm/subdev/clock/nv40.c        |   4 +-
>  nvkm/subdev/clock/nv50.c        |   2 +-
>  nvkm/subdev/clock/nva3.c        |   4 +-
>  nvkm/subdev/clock/nvaa.c        |   4 +-
>  nvkm/subdev/clock/nvc0.c        |   4 +-
>  nvkm/subdev/clock/nve0.c        |   4 +-
>  18 files changed, 735 insertions(+), 34 deletions(-)
>  create mode 120000 drm/core/subdev/clock/gk20a.c
>  create mode 120000 drm/core/subdev/fb/ramgk20a.h
>  create mode 120000 drm/core/subdev/instmem/gk20a.c
>  create mode 100644 nvkm/subdev/clock/gk20a.c
>
> --
> 2.0.2
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
