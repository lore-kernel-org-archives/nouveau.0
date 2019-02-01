From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH v2 0/4] drm/dp_mst: Fix regressions from new atomic VCPI helpers
Date: Thu, 31 Jan 2019 20:14:47 -0500
Message-ID: <20190201011506.21055-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Maxime Ripard <maxime.ripard@bootlin.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, linux-kernel@vger.kernel.org, Sean Paul <sean@poorly.run>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Ben Skeggs <bskeggs@redhat.com>, Jani Nikula <jani.nikula@linux.intel.com>, Ilia Mirkin <imirkin@alum.mit.edu>, intel-gfx@lists.freedesktop.org, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Lyude Paul <lyude@redhat.com>
List-Id: nouveau.vger.kernel.org

This fixes the extra issues I discovered upstream after the introduction
of my rework of the atomic VCPI helpers that occur during
suspend/resume.

This time around, we use a slightly different but much less complicated
approach for fixing said issues.

Cc: Daniel Vetter <daniel@ffwll.ch>

Lyude Paul (4):
  drm/dp_mst: Fix unbalanced malloc ref in drm_dp_mst_deallocate_vcpi()
  drm/dp_mst: Remove port validation in drm_dp_atomic_find_vcpi_slots()
  drm/atomic: Add drm_atomic_state->duplicated
  drm/nouveau: Move PBN and VCPI allocation into nv50_head_atom

 drivers/gpu/drm/drm_atomic_helper.c     | 10 ++++-
 drivers/gpu/drm/drm_dp_mst_topology.c   | 51 +++++++++++++++++--------
 drivers/gpu/drm/i915/intel_dp_mst.c     | 17 +++------
 drivers/gpu/drm/nouveau/dispnv50/atom.h |  6 +++
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 31 ++++++++-------
 drivers/gpu/drm/nouveau/dispnv50/head.c |  1 +
 include/drm/drm_atomic.h                |  9 +++++
 7 files changed, 85 insertions(+), 40 deletions(-)

-- 
2.20.1
