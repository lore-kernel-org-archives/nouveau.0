From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH 00/37] [RFC] revamped modeset locking
Date: Wed, 12 Dec 2012 14:06:40 +0100
Message-ID: <1355317637-16742-1-git-send-email-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <intel-gfx-bounces+gcfxdi-intel-gfx=m.gmane.org@lists.freedesktop.org>
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

Hi all,

First thing first: It works, I now no longer have a few dropped frames every 10s
on my testbox here with the pageflip i-g-t tests.

Random notes:

- New design has per-crtc locks to protect the crtc input-side (pageflip,
  cursor) for r/w and the output state of the crtc (mode, dpms) as read-only. It
  also required completely revamped fb lifecycle management, those are now
  refcounted for real (which is a nice cleanup). Imo the proposed rwsem hack
  from Dave/Ajax is too ugly to life in comparison.

- Smoke tested on i915, compile tested for x86 drivers, probably all arm drivers
  trivially broken. I plan add tons of i-g-t testscases to exercise all the
  cornercases with i915 (so that lockdep has full coverage among other things)
  and at least run radeon/nouveau a bit. I also need to set up an arm
  crosscompiler. Generally testing feedback on !i915 highly welcome.

- Driver audit: I've tried to not break anything more than it already is, and
  for the big three desktop drivers fixup any related breakage I've noticed. Big
  unknown is vmwgfx since that driver is over my head. Generally review from
  driver devs is required to check all corner-cases.

- Merging, presuming people like this idea here: I think it'd be good to slurp
  in the driver changes as early as possible. The big rework probably has to go
  in with a separate pull directly to drm-next for all drivers - there are
  simply too many sync-points in this rework where all drivers need to follow
  the new rules before core drm changes can be applied.

- Having a global lock which synchronizing object destruction is a royal pain,
  since it reliably results in that locking getting in the way almost everywhere
  when trying to implement refcounting.  It's fixed now for fb & the mode_config
  mutex, but I'm already eagerly looking forward to simplifying dev->struct_mutex
  gem_bo cleanup rules.

- drm teardown/setup synchronization and locking is terminally broken. Insane
  volunteers welcome, I don't want to do this.

- I've mentioned that reading too much driver code causes nightmares, right?
  vmwgfx ...

Please bring on the flames.

Cheers, Daniel

Daniel Vetter (37):
  drm: review locking rules in drm_crtc.c
  drm/doc: integrate drm_crtc.c kerneldoc
  drm: add drm_modeset_lock|unlock_all
  drm/i915: rework locking for intel_dpio|sbi_read|write
  drm/i915: use drm_modeset_lock_all
  drm/gma500: use drm_modeset_lock_all
  drm/ast: use drm_modeset_lock_all
  drm/shmobile: use drm_modeset_lock_all
  drm/vmgfx: use drm_modeset_lock_all
  drm: add per-crtc locks
  drm/radeon: add W|RREG32_IDX for MM_INDEX|DATA based mmio accesss
  drm/radeon: make indirect register access concurrency-safe
  drm/nouveau: protect evo_wait/evo_kick sections with a channel mutex
  drm: only take the crtc lock for ->cursor_set
  drm: only take the crtc lock for ->cursor_move
  drm/<drivers>: reorder framebuffer init sequence
  drm: revamp locking around fb creation/destruction
  drm: create drm_framebuffer_lookup
  drm/gma500: move fbcon restore to lastclose
  drm: revamp framebuffer cleanup interfaces
  drm: reference framebuffers which are on the idr
  drm: nest modeset locks within fpriv->fbs_lock
  drm/i915: fixup overlay stolen memory leak
  drm: push modeset_lock_all into ->fb_create driver callbacks
  drm: don't take modeset locks in getfb ioctl
  drm: fb refcounting for dirtyfb_ioctl
  drm: refcounting for sprite framebuffers
  drm: encapsulate crtc->set_config calls
  drm: refcounting for crtc framebuffers
  drm/i915: dump refcount into framebuffer debugfs file
  drm/vmwgfx: add proper framebuffer refcounting
  drm: optimize drm_framebuffer_remove
  drm/nouveau: try to protect nbo->pin_refcount
  drm/ttm: fix fence locking in ttm_buffer_object_transfer
  drm/radeon: fix fence locking in the pageflip callback
  drm: only grab the crtc lock for pageflips
  drm: don't hold crtc mutexes for connector ->detect callbacks

 Documentation/DocBook/drm.tmpl            |    4 +
 drivers/gpu/drm/ast/ast_drv.c             |    4 +-
 drivers/gpu/drm/ast/ast_drv.h             |    2 +
 drivers/gpu/drm/ast/ast_fb.c              |    1 +
 drivers/gpu/drm/ast/ast_main.c            |    6 +-
 drivers/gpu/drm/cirrus/cirrus_fbdev.c     |    1 +
 drivers/gpu/drm/cirrus/cirrus_main.c      |   11 +-
 drivers/gpu/drm/drm_crtc.c                |  782 +++++++++++++++++------------
 drivers/gpu/drm/drm_fb_cma_helper.c       |   15 +-
 drivers/gpu/drm/drm_fb_helper.c           |   26 +-
 drivers/gpu/drm/drm_fops.c                |    1 +
 drivers/gpu/drm/exynos/exynos_drm_fb.c    |   20 +-
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c |    4 +-
 drivers/gpu/drm/gma500/framebuffer.c      |   29 +-
 drivers/gpu/drm/gma500/psb_drv.c          |   15 +-
 drivers/gpu/drm/i2c/ch7006_drv.c          |    2 +-
 drivers/gpu/drm/i915/i915_debugfs.c       |   19 +-
 drivers/gpu/drm/i915/i915_dma.c           |    4 +-
 drivers/gpu/drm/i915/i915_drv.h           |    2 +-
 drivers/gpu/drm/i915/intel_display.c      |   74 ++-
 drivers/gpu/drm/i915/intel_dp.c           |    2 +
 drivers/gpu/drm/i915/intel_fb.c           |    5 +-
 drivers/gpu/drm/i915/intel_lvds.c         |    4 +-
 drivers/gpu/drm/i915/intel_overlay.c      |   14 +-
 drivers/gpu/drm/i915/intel_sprite.c       |    8 +-
 drivers/gpu/drm/mgag200/mgag200_fb.c      |    1 +
 drivers/gpu/drm/mgag200/mgag200_main.c    |   10 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c      |   22 +-
 drivers/gpu/drm/nouveau/nouveau_bo.h      |    2 +
 drivers/gpu/drm/nouveau/nouveau_display.c |   10 +-
 drivers/gpu/drm/nouveau/nouveau_fbcon.c   |    1 +
 drivers/gpu/drm/nouveau/nv04_display.c    |    2 +-
 drivers/gpu/drm/nouveau/nv17_tv.c         |    2 +-
 drivers/gpu/drm/nouveau/nv50_display.c    |    8 +
 drivers/gpu/drm/radeon/r100.c             |   23 +-
 drivers/gpu/drm/radeon/radeon.h           |   18 +-
 drivers/gpu/drm/radeon/radeon_combios.c   |    6 +-
 drivers/gpu/drm/radeon/radeon_cp.c        |   14 -
 drivers/gpu/drm/radeon/radeon_cursor.c    |   25 +-
 drivers/gpu/drm/radeon/radeon_device.c    |    1 +
 drivers/gpu/drm/radeon/radeon_display.c   |    6 +-
 drivers/gpu/drm/radeon/radeon_drv.h       |    1 -
 drivers/gpu/drm/radeon/radeon_fb.c        |    2 +
 drivers/gpu/drm/shmobile/shmob_drm_drv.c  |    4 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c         |    2 +
 drivers/gpu/drm/udl/udl_fb.c              |   12 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c       |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c     |   38 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c       |   73 ++-
 drivers/staging/omapdrm/omap_debugfs.c    |    2 +
 drivers/staging/omapdrm/omap_fb.c         |   16 +-
 drivers/staging/omapdrm/omap_fbdev.c      |    8 +-
 include/drm/drmP.h                        |   13 +
 include/drm/drm_crtc.h                    |   30 ++
 54 files changed, 843 insertions(+), 566 deletions(-)

-- 
1.7.10.4
