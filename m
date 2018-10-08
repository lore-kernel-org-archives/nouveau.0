From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH v7 0/5] Fix legacy DPMS changes with MST
Date: Mon,  8 Oct 2018 19:24:29 -0400
Message-ID: <20181008232437.5571-1-lyude@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, linux-kernel@vger.kernel.org, Sean Paul <sean@poorly.run>, Gustavo Padovan <gustavo@padovan.org>, Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Ben Skeggs <bskeggs@redhat.com>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, Lyude Paul <lyude@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
List-Id: nouveau.vger.kernel.org

Next version of https://patchwork.freedesktop.org/series/49878/

Still no functional changes, just removing a duplicate s-b to make CI
happy.

Lyude Paul (5):
  drm/atomic_helper: Disallow new modesets on unregistered connectors
  drm/nouveau: Fix nv50_mstc->best_encoder()
  drm/i915: Don't unset intel_connector->mst_port
  drm/i915: Skip vcpi allocation for MSTB ports that are gone
  drm/i915: Fix intel_dp_mst_best_encoder()

 drivers/gpu/drm/drm_atomic_helper.c     | 21 ++++++++++++-
 drivers/gpu/drm/i915/intel_dp_mst.c     | 41 ++++++++++++-------------
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 14 +++------
 3 files changed, 44 insertions(+), 32 deletions(-)

-- 
2.17.1
