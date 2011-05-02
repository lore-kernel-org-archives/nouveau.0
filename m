From: Marcin Slusarz <marcin.slusarz@gmail.com>
Subject: Re: [PATCH] gallium/xorg st/nv50/i915: add
 PIPE_BIND_CURSOR
Date: Mon, 2 May 2011 20:40:56 +0200
Message-ID: <20110502184056.GD3461@joi.lan>
References: <20110501215940.GD6742@joi.lan>
	<BANLkTikex6zKKboJve=n42hUUEmrSJ6Ynw@mail.gmail.com>
	<BANLkTikbYs7y2gCELyyi1OKcuZYYVCfieA@mail.gmail.com>
	<BANLkTin7HGY12QcG7vc0aZ7mQ6SnZkrDJQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <BANLkTin7HGY12QcG7vc0aZ7mQ6SnZkrDJQ@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
Errors-To: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
To: Daniel Vetter <daniel@ffwll.ch>
Cc: mesa-dev@lists.freedesktop.org, Benjamin Franzke <benjaminfranzke@googlemail.com>, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On Mon, May 02, 2011 at 03:11:00PM +0200, Daniel Vetter wrote:
> On Mon, May 2, 2011 at 2:56 PM, Benjamin Franzke
> <benjaminfranzke@googlemail.com> wrote:
> > I think in i915g the CURSOR flag should be used in i9x5_scanout_layout
> > for the "special case for cursors" as well, instead of only checking
> > only pt->width0 == 64 && pt->height0 == 64.
> 
> Oops, so much for actually re-checking the code. On the other hand, that
> part is broken, it needs a
>    tex->tiling = I915_TILE_NONE;
> and perhaps some check that width == height == 64 indeed holds. Then
> move it out as the first if clause and it'd start to make sense ...

Could you fix it in separate patch?

I couldn't even test it...

Marcin
