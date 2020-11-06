From: Jeremy Cline <jcline@redhat.com>
Subject: [PATCH 0/3] drm/nouveau: extend the lifetime of nouveau_drm
Date: Thu,  5 Nov 2020 21:16:53 -0500
Message-ID: <20201106021656.40743-1-jcline@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, Jeremy Cline <jcline@redhat.com>
List-Id: nouveau.vger.kernel.org

Hi folks,

Currently, when the device is removed (or the driver is unbound) the
nouveau_drm structure de-allocated. However, it's still accessible from
and used by some DRM layer callbacks. For example, file handles can be
closed after the device has been removed (physically or otherwise). This
series converts the Nouveau device structure to be allocated and
de-allocated with the devm_drm_dev_alloc() API.

In the future, additional resources that should be bound to the lifetime
of the drm_device can be added, and the drmm_add_action() APIs offer a
nice hook for arbitrary cleanup actions before the drm_device is
destroyed, so I suspect much of the current cleanup code in Nouveau
would benefit from some refactoring to use this.

Finally, although not *strictly* necessary for this series, I included
some documentation for structures I investigated for this work.

Jeremy Cline (3):
  drm/nouveau: Use helper to convert nouveau_drm to drm_device
  drm/nouveau: manage nouveau_drm lifetime with devres
  drm/nouveau: begin documenting core nouveau structures

 drivers/gpu/drm/nouveau/dispnv04/crtc.c     |  10 +-
 drivers/gpu/drm/nouveau/dispnv50/base.c     |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/base507c.c |   7 +-
 drivers/gpu/drm/nouveau/dispnv50/core.c     |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/core507d.c |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/curs.c     |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/curs507a.c |   5 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c     |  17 +--
 drivers/gpu/drm/nouveau/dispnv50/oimm.c     |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/oimm507b.c |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/ovly.c     |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/ovly507e.c |   5 +-
 drivers/gpu/drm/nouveau/dispnv50/wimm.c     |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.c     |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c |   5 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c        |  16 ++-
 drivers/gpu/drm/nouveau/nouveau_debugfs.c   |   9 +-
 drivers/gpu/drm/nouveau/nouveau_display.c   |  16 +--
 drivers/gpu/drm/nouveau/nouveau_dmem.c      |  17 +--
 drivers/gpu/drm/nouveau/nouveau_drm.c       |  41 ++++----
 drivers/gpu/drm/nouveau/nouveau_drv.h       | 111 +++++++++++++++++++-
 drivers/gpu/drm/nouveau/nouveau_fbcon.c     |  19 ++--
 drivers/gpu/drm/nouveau/nouveau_gem.c       |   8 +-
 drivers/gpu/drm/nouveau/nouveau_svm.c       |   4 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c       |   4 +-
 drivers/gpu/drm/nouveau/nouveau_vga.c       |   8 +-
 27 files changed, 216 insertions(+), 106 deletions(-)

-- 
2.28.0
