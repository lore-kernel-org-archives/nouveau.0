From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 10/37] drm: add per-crtc locks
Date: Thu, 13 Dec 2012 13:38:12 +0200
Message-ID: <20121213113812.GF29018@intel.com>
References: <1355317637-16742-1-git-send-email-daniel.vetter@ffwll.ch>
	<1355317637-16742-11-git-send-email-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1355317637-16742-11-git-send-email-daniel.vetter@ffwll.ch>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Nouveau Dev <nouveau@lists.freedesktop.org>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Radeon Dev <xorg-driver-ati@lists.x.org>, DRI Development <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On Wed, Dec 12, 2012 at 02:06:50PM +0100, Daniel Vetter wrote:
> *drumroll*
> =

> The basic idea is to protect per-crtc state which can change without
> touching the output configuration with separate mutexes, i.e.  all the
> input side state to a crtc like framebuffers, cursor settings or plane
> configuration. Holding such a crtc lock gives a read-lock on all the
> other crtc state which can be changed by e.g. a modeset.
> =

> All non-crtc state is still protected by the mode_config mutex.
> Callers that need to change modeset state of a crtc (e.g. dpms or
> set_mode) need to grab both the mode_config lock and nested within any
> crtc locks.
> =

> Note that since there can only ever be one holder of the mode_config
> lock we can grab the subordinate crtc locks in any order (if we need
> to grab more than one of them). Lockdep can handle such nesting with
> the mutex_lock_nest_lock call correctly.
> =

> With this functions that only touch connectors/encoders but not crtcs
> only need to take the mode_config lock. The biggest such case is the
> output probing, which means that we can now pageflip and move cursors
> while the output probe code is reading an edid.
> =

> Most cases neatly fall into the three buckets:
> - Only touches connectors and similar output state and so only needs
>   the mode_config lock.
> - Touches the global configuration and so needs all locks.
> - Only touches the crtc input side and so only needs the crtc lock.
> =

> But a few cases that need special consideration:
> =

> - Load detection which requires a crtc. The mode_config lock already
>   prevents a modeset change, so we can use any unused crtc as we like
>   to do load detection. The only thing to consider is that such
>   temporary state changes don't leak out to userspace through ioctls
>   that only take the crtc look (like a pageflip). Hence the load
>   detect code needs to grab the crtc of any output pipes it touches
>   (but only if it touches state used by the pageflip or cursor
>   ioctls).
> =

> - Atomic pageflip when moving planes. The first case is sane hw, where
>   planes have a fixed association with crtcs - nothing needs to be
>   done there. More insane^Wflexible hw needs to have plane->crtc
>   mapping which is separately protect with a lock that nests within
>   the crtc lock. If the plane is unused we can just assign it to the
>   current crtc and continue. But if a plane is already in use by
>   another crtc we can't just reassign it.
> =

>   Two solution present themselves: Either go back to a slow-path which
>   takes all modeset locks, potentially incure quite a hefty delay. Or
>   simply disallowing such changes in one atomic pageflip - in general
>   the vblanks of two crtcs are not synced, so there's no sane way to
>   atomically flip such plane changes accross more than one crtc. I'd
>   heavily favour the later approach, going as far as mandating it as
>   part of the ABI of such a new a nuclear pageflip.

Agreed. Just disallow moving an enabled plane between CRTCs. First
disable on the old CRTC, then enable on the new one. Two ioctls
required to complete the operation. I think everyone should be able to
live with that restriction.

>   And if we _really_ want such semantics, we can always get them by
>   introducing another pageflip mutex between the mode_config.mutex and
>   the individual crtc locks. Pageflips crossing more than one crtc
>   would then need to take that lock first, to lock out concurrent
>   multi-crtc pageflips.

I'm actually concerned with multi CRTC page flips, not for moving planes
between CRTCs, but mainly for updating content on genlocked displays
atomically. We need to avoid deadlocks between multiple CRTC locks. Trying
to take the CRTC locks in the same order would be a solution, but since
user space can send the props in any order, it's going to require extra
of work.

Another lock as you suggest could work. But I suppose the atomic ioctl
would need another flag to signal that the kernel needs to grab the multi
CRTC lock in the beginning. The downside is that modeset would need to take
that lock too, and then you end up in the same situation where a modeset
operation on one display will disturb animations on other displays.

> - Optimized global modeset operations: We could just take the
>   mode_config lock and then lazily lock all crtc which are affected by
>   a modeset operation. This has the advantage that pageflip could
>   continue unhampered on unaffected crtc. But if e.g. global resources
>   like plls need to be reassigned and so affect unrelated crtcs we can
>   still do that - nested locking works in any order.

Right. In my atomic ioctl this could be done in the beginning by
checking the non-block flag. If the flag is not set, then grab the
global lock, and you can lock each CRTC when you see that you need to
touch them.

I would need to change my code to refuse any change to modeset state
when the non-block flag is set. Currently I'm doing that check as late
as possible, so that that user space can still send modeset related
props, but if they don't end up changing anything in the modeset state,
I can continue with the non-blocking operation. But you can argue that
userspace is being silly if it sends such things, and we can just refuse
it early on.

-- =

Ville Syrj=E4l=E4
Intel OTC
