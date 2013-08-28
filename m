From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [PATCH 0/9] drm/nouveau: Cleanup event/handler design
Date: Wed, 28 Aug 2013 17:15:34 +1000
Message-ID: <CACAvsv6atUc=QO2gHEbHK4-+uCh=GUtCqtVKVkZxmS-S8EQppg@mail.gmail.com>
References: <1377634382-13872-1-git-send-email-peter@hurleysoftware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1377634382-13872-1-git-send-email-peter@hurleysoftware.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Peter Hurley <peter@hurleysoftware.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On Wed, Aug 28, 2013 at 6:12 AM, Peter Hurley <peter@hurleysoftware.com> wrote:
> This series was originally motivated by a deadlock, introduced in
> commit 1d7c71a3e2f77336df536855b0efd2dc5bdeb41b
> 'drm/nouveau/disp: port vblank handling to event interface',
> due to inverted lock order between nouveau_drm_vblank_enable()
> and nouveau_drm_vblank_handler() (the complete
> lockdep report is included in the patch 4/5 changelog).
Hey Peter,

Thanks for the patch series.  I've only taken a cursory glance through
the patches thus far, as they're definitely too intrusive for -fixes
at this point.  I will take a proper look through the series within
the next week or so, I have some work pending which may possibly make
some of these changes unnecessary, though from what I can tell,
there's other good bits here we'll want.

In a previous mail on the locking issue, you mentioned the drm core
doing the "wrong thing" here too, did you have any further thoughts on
correcting that issue too?

Ben.

>
> Because this series fixes the vblank event deadlock, it is
> a competing solution to Maarten Lankhorst's 'drm/nouveau:
> fix vblank deadlock'.
>
> This series fixes the vblank event deadlock by converting the
> event handler list to RCU. This solution allows the event trigger
> to be lockless, and thus avoiding the lock inversion.
>
> Typical hurdles to RCU conversion include: 1) ensuring the
> object lifetime exceeds the lockless access; 2) preventing
> premature object reuse; and 3) verifying that stale object
> use not present logical errors.
>
> Because object reuse is not safe in RCU-based operations,
> the nouveau_event_get/_put interface is migrated from
> add/remove semantics to enable/disable semantics with a separate
> install/remove step (which also serves to document the
> handler lifetime). This also corrects an unsafe interface design
> where handlers can mistakenly be reused while in use.
>
> The nouveau driver currently supports 4 events -- gpio, uevent, cevent,
> and vblank. Every event is created by and stored within its
> respective subdev/engine object -- gpio in the GPIO subdev, uevent
> and cevent in the FIFO engine, and vblank in the DISP engine.
> Thus event lifetime extends until the subdev is destructed during
> devobj teardown.
>
> Event handler lifetime varies and is detailed in the table below
> (apologies for the wide-format):
>
> Event  Handler function                   Container                     Until
> -----  ----------------                   ---------------               ------------------
> gpio   nouveau_connector_hotplug          struct nouveau_connector      nouveau_connector_destroy
> uevent nouveau_fence_wait_uevent_handler  local stack object            nouveau_fence_wait_uevent returns
> cevent none                               n/a                           n/a
> vblank nouveau_drm_vblank_handler         struct nouveau_drm            nouveau_drm_remove
> vblank nv50_software_vblsem_release       struct nouveau_software_chan  _nouveau_engctx_dtor
>                                                                           (call stack originates with
>                                                                            nouveau_abi16_chan_free ioctl)
> vblank nvc0_software_vblsem_release       struct nouveau_software_chan  same as above
>
>
> RCU lifetime considerations for handlers:
>
> Event  Handler                            Lifetime
> -----  ----------------                   ---------------------------------
> gpio   nouveau_connector_hotplug          kfree_rcu(nv_connector)
> uevent nouveau_fence_wait_uevent_handler  explicit use of nouveau_event_hander_create/_destroy
> cevent none                               n/a
> vblank nouveau_drm_vblank_handler         synchronize_rcu() in nouveau_drm_unload
> vblank nv50_software_vblsem_release       synchronize_rcu() in container dtor
> vblank nvc0_software_vblsem_release       synchronize_rcu() in container dtor
>
> synchronize_rcu() is used for nouveau_object-based containers for which
> kfree_rcu() is not suitable/possible.
>
> Stale event handler execution is not a concern for the existing handlers
> because either: 1) the handler is responsible for disabling itself (via
> returning NVKM_EVENT_DROP), or 2) the existing handler can already be stale,
> as is the case with nouveau_connector_hotplug, which only schedules a work
> item, and nouveau_drm_vblank_handler, which the drm core expects may be stale.
>
>
> Peter Hurley (9):
>   drm/nouveau: Add priv field for event handlers
>   drm/nouveau: Move event index check from critical section
>   drm/nouveau: Allocate local event handlers
>   drm/nouveau: Allow asymmetric nouveau_event_get/_put
>   drm/nouveau: Add install/remove semantics for event handlers
>   drm/nouveau: Convert event handler list to RCU
>   drm/nouveau: Fold nouveau_event_put_locked into caller
>   drm/nouveau: Simplify event interface
>   drm/nouveau: Simplify event handler interface
>
>  drivers/gpu/drm/nouveau/core/core/event.c          | 121 +++++++++++++++++----
>  .../gpu/drm/nouveau/core/engine/software/nv50.c    |  32 ++++--
>  .../gpu/drm/nouveau/core/engine/software/nvc0.c    |  32 ++++--
>  drivers/gpu/drm/nouveau/core/include/core/event.h  |  27 ++++-
>  .../gpu/drm/nouveau/core/include/engine/software.h |   2 +-
>  drivers/gpu/drm/nouveau/nouveau_connector.c        |  16 ++-
>  drivers/gpu/drm/nouveau/nouveau_display.c          |  16 +--
>  drivers/gpu/drm/nouveau/nouveau_drm.c              |  35 +++---
>  drivers/gpu/drm/nouveau/nouveau_fence.c            |  27 ++---
>  9 files changed, 220 insertions(+), 88 deletions(-)
>
> --
> 1.8.1.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
