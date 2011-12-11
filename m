From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] nouveau: get rid of winsys object
Date: Sun, 11 Dec 2011 21:12:07 +0100
Message-ID: <20111211201207.GC12385@joi.lan>
References: <20111202184659.GA3302@joi.lan>
 <20111202220850.GE3302@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20111202220850.GE3302-OI9uyE9O0yo@public.gmane.org>
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

On Fri, Dec 02, 2011 at 11:08:50PM +0100, Marcin Slusarz wrote:
> Its only purpose was to destroy itself.
> ---
>  src/gallium/drivers/nouveau/Android.mk             |    4 ++-
>  src/gallium/drivers/nouveau/Makefile               |    3 ++
>  src/gallium/drivers/nouveau/nouveau_screen.c       |    7 ++--
>  src/gallium/drivers/nouveau/nouveau_winsys.h       |    6 ++--
>  src/gallium/drivers/nv50/nv50_context.c            |    2 -
>  src/gallium/drivers/nv50/nv50_screen.c             |    3 +-
>  src/gallium/drivers/nv50/nv50_screen.h             |    1 -
>  src/gallium/drivers/nvc0/nvc0_context.c            |    2 -
>  src/gallium/drivers/nvc0/nvc0_screen.c             |    3 +-
>  src/gallium/drivers/nvc0/nvc0_screen.h             |    1 -
>  src/gallium/drivers/nvfx/nvfx_context.c            |    5 ---
>  src/gallium/drivers/nvfx/nvfx_context.h            |    1 -
>  src/gallium/drivers/nvfx/nvfx_screen.c             |    3 +-
>  src/gallium/drivers/nvfx/nvfx_screen.h             |    1 -
>  src/gallium/winsys/nouveau/drm/nouveau_dri.h       |   28 -----------------
>  .../winsys/nouveau/drm/nouveau_drm_winsys.c        |   32 +------------------
>  .../winsys/nouveau/drm/nouveau_drm_winsys.h        |   28 -----------------
>  17 files changed, 17 insertions(+), 113 deletions(-)

I'm going to push this patch tomorrow if noone objects.

Marcin
