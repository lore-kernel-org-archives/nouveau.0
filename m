From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH v8 0/5] Fix connector probing deadlocks from RPM bugs
Date: Wed, 15 Aug 2018 15:00:10 -0400
Message-ID: <20180815190018.15396-1-lyude@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>, Ilia Mirkin <imirkin@alum.mit.edu>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, Lyude Paul <lyude@redhat.com>
List-Id: nouveau.vger.kernel.org

Next version of https://patchwork.freedesktop.org/series/46815/

Same as previous version, but some small changes made to commit messages
and acks/rbs have been added

Lyude Paul (5):
  drm/nouveau: Fix bogus drm_kms_helper_poll_enable() placement
  drm/nouveau: Remove duplicate poll_enable() in pmops_runtime_suspend()
  drm/nouveau: Fix deadlock with fb_helper with async RPM requests
  drm/nouveau: Use pm_runtime_get_noresume() in connector_detect()
  drm/nouveau: Fix deadlocks in nouveau_connector_detect()

 drivers/gpu/drm/nouveau/dispnv50/disp.c     |  2 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c | 42 +++++++++++----
 drivers/gpu/drm/nouveau/nouveau_display.c   |  9 ++--
 drivers/gpu/drm/nouveau/nouveau_drm.c       |  1 -
 drivers/gpu/drm/nouveau/nouveau_fbcon.c     | 57 +++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_fbcon.h     |  5 ++
 6 files changed, 102 insertions(+), 14 deletions(-)

-- 
2.17.1
