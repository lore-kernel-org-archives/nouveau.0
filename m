From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] gallium/xorg st/nv50/i915: add
	PIPE_BIND_CURSOR
Date: Mon, 2 May 2011 14:44:08 +0200
Message-ID: <BANLkTikex6zKKboJve=n42hUUEmrSJ6Ynw@mail.gmail.com>
References: <20110501215940.GD6742@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org>
In-Reply-To: <20110501215940.GD6742@joi.lan>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
Errors-To: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
To: Marcin Slusarz <marcin.slusarz@gmail.com>
Cc: mesa-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On Sun, May 1, 2011 at 11:59 PM, Marcin Slusarz
<marcin.slusarz@gmail.com> wrote:
> We need to distinguish surfaces for mouse cursors from scanouts, because nv50
> hardware display engine ignores tiling flags.
> i915 seems to have similar needs, so fix it too.

For the i915g part:
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
-- 
Daniel Vetter
daniel.vetter@ffwll.ch - +41 (0) 79 364 57 48 - http://blog.ffwll.ch
