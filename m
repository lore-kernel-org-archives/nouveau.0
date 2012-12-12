From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 00/37] [RFC] revamped modeset locking
Date: Wed, 12 Dec 2012 15:18:37 +0100
Message-ID: <20121212141837.GU11556@phenom.ffwll.local>
References: <1355317637-16742-1-git-send-email-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <intel-gfx-bounces+gcfxdi-intel-gfx=m.gmane.org@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1355317637-16742-1-git-send-email-daniel.vetter@ffwll.ch>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/intel-gfx>,
	<mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
	<mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: intel-gfx-bounces+gcfxdi-intel-gfx=m.gmane.org@lists.freedesktop.org
Errors-To: intel-gfx-bounces+gcfxdi-intel-gfx=m.gmane.org@lists.freedesktop.org
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Nouveau Dev <nouveau@lists.freedesktop.org>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Radeon Dev <xorg-driver-ati@lists.x.org>, Daniel Vetter <daniel.vetter@ffwll.ch>
List-Id: nouveau.vger.kernel.org

On Wed, Dec 12, 2012 at 02:06:40PM +0100, Daniel Vetter wrote:
> Hi all,
> 
> First thing first: It works, I now no longer have a few dropped frames every 10s
> on my testbox here with the pageflip i-g-t tests.
> 
> Random notes:
> 
> - New design has per-crtc locks to protect the crtc input-side (pageflip,
>   cursor) for r/w and the output state of the crtc (mode, dpms) as read-only. It
>   also required completely revamped fb lifecycle management, those are now
>   refcounted for real (which is a nice cleanup). Imo the proposed rwsem hack
>   from Dave/Ajax is too ugly to life in comparison.
> 
> - Smoke tested on i915, compile tested for x86 drivers, probably all arm drivers
>   trivially broken. I plan add tons of i-g-t testscases to exercise all the
>   cornercases with i915 (so that lockdep has full coverage among other things)
>   and at least run radeon/nouveau a bit. I also need to set up an arm
>   crosscompiler. Generally testing feedback on !i915 highly welcome.
> 
> - Driver audit: I've tried to not break anything more than it already is, and
>   for the big three desktop drivers fixup any related breakage I've noticed. Big
>   unknown is vmwgfx since that driver is over my head. Generally review from
>   driver devs is required to check all corner-cases.
> 
> - Merging, presuming people like this idea here: I think it'd be good to slurp
>   in the driver changes as early as possible. The big rework probably has to go
>   in with a separate pull directly to drm-next for all drivers - there are
>   simply too many sync-points in this rework where all drivers need to follow
>   the new rules before core drm changes can be applied.
> 
> - Having a global lock which synchronizing object destruction is a royal pain,
>   since it reliably results in that locking getting in the way almost everywhere
>   when trying to implement refcounting.  It's fixed now for fb & the mode_config
>   mutex, but I'm already eagerly looking forward to simplifying dev->struct_mutex
>   gem_bo cleanup rules.
> 
> - drm teardown/setup synchronization and locking is terminally broken. Insane
>   volunteers welcome, I don't want to do this.
> 
> - I've mentioned that reading too much driver code causes nightmares, right?
>   vmwgfx ...
> 
> Please bring on the flames.

I've forgotten to add: Patch series pushed out to the drm-kms-locking
branch in my personal fdo repo:

http://cgit.freedesktop.org/~danvet/drm/log/?h=drm-kms-locking

-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
