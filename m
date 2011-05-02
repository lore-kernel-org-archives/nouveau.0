From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [Mesa-dev] [PATCH] gallium/xorg st/nv50/i915: add
	PIPE_BIND_CURSOR
Date: Mon, 2 May 2011 15:11:00 +0200
Message-ID: <BANLkTin7HGY12QcG7vc0aZ7mQ6SnZkrDJQ@mail.gmail.com>
References: <20110501215940.GD6742@joi.lan>
	<BANLkTikex6zKKboJve=n42hUUEmrSJ6Ynw@mail.gmail.com>
	<BANLkTikbYs7y2gCELyyi1OKcuZYYVCfieA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <BANLkTikbYs7y2gCELyyi1OKcuZYYVCfieA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, May 2, 2011 at 2:56 PM, Benjamin Franzke
<benjaminfranzke-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> I think in i915g the CURSOR flag should be used in i9x5_scanout_layout
> for the "special case for cursors" as well, instead of only checking
> only pt->width0 == 64 && pt->height0 == 64.

Oops, so much for actually re-checking the code. On the other hand, that
part is broken, it needs a
   tex->tiling = I915_TILE_NONE;
and perhaps some check that width == height == 64 indeed holds. Then
move it out as the first if clause and it'd start to make sense ...
-Daniel
-- 
Daniel Vetter
daniel.vetter-/w4YWyX8dFk@public.gmane.org - +41 (0) 79 364 57 48 - http://blog.ffwll.ch
