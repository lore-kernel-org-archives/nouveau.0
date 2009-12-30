From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] nouveau: kill nouveau_push.h and use
 libdrm versions of BEGIN_RINGs, etc
Date: Wed, 30 Dec 2009 22:51:00 +0100
Message-ID: <20091230215100.GA21688@joi.lan>
References: <1262209002-10778-1-git-send-email-madman2003@gmail.com>
	<1262209002-10778-2-git-send-email-madman2003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1262209002-10778-2-git-send-email-madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, Dec 30, 2009 at 10:36:41PM +0100, Maarten Maathuis wrote:
> From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> ---
>  src/gallium/drivers/nouveau/nouveau_push.h |   93 -----
>  src/gallium/drivers/nv04/nv04_context.c    |   44 ++-
>  src/gallium/drivers/nv04/nv04_context.h    |    4 -
>  src/gallium/drivers/nv04/nv04_prim_vbuf.c  |   84 +++--
>  src/gallium/drivers/nv04/nv04_state_emit.c |   72 +++--
>  src/gallium/drivers/nv10/nv10_context.c    |  367 ++++++++++----------
>  src/gallium/drivers/nv10/nv10_context.h    |    4 -
>  src/gallium/drivers/nv10/nv10_fragtex.c    |   28 +-
>  src/gallium/drivers/nv10/nv10_prim_vbuf.c  |   34 +-
>  src/gallium/drivers/nv10/nv10_state_emit.c |  166 +++++----
>  src/gallium/drivers/nv20/nv20_context.c    |  530 ++++++++++++++--------------
>  src/gallium/drivers/nv20/nv20_context.h    |    4 -
>  src/gallium/drivers/nv20/nv20_fragtex.c    |   28 +-
>  src/gallium/drivers/nv20/nv20_prim_vbuf.c  |   56 ++--
>  src/gallium/drivers/nv20/nv20_state_emit.c |  181 ++++++----
>  src/gallium/drivers/nv30/nv30_context.c    |   15 +-
>  src/gallium/drivers/nv30/nv30_context.h    |    4 -
>  src/gallium/drivers/nv30/nv30_query.c      |   20 +-
>  src/gallium/drivers/nv30/nv30_vbo.c        |  106 +++---
>  src/gallium/drivers/nv30/nv30_vertprog.c   |   18 +-
>  src/gallium/drivers/nv40/nv40_context.c    |   15 +-
>  src/gallium/drivers/nv40/nv40_context.h    |    4 -
>  src/gallium/drivers/nv40/nv40_draw.c       |   62 ++--
>  src/gallium/drivers/nv40/nv40_query.c      |   20 +-
>  src/gallium/drivers/nv40/nv40_state_emit.c |   11 +-
>  src/gallium/drivers/nv40/nv40_vbo.c        |  106 +++---
>  src/gallium/drivers/nv40/nv40_vertprog.c   |   18 +-
>  27 files changed, 1089 insertions(+), 1005 deletions(-)
>  delete mode 100644 src/gallium/drivers/nouveau/nouveau_push.h

you can see this patch here:
http://alan.umcs.lublin.pl/~mslusarz/kill-pushbuf.h/0003-nouveau-kill-nouveau_push.h-and-use-libdrm-versions-.patch
