From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH v2 0/5] drm/nouveau: Backlight fixes and cleanup
Date: Wed, 29 Aug 2018 17:36:45 -0400
Message-ID: <20180829213651.20874-1-lyude@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

Next version of https://patchwork.freedesktop.org/series/48596/ . Made
some important changes to the refactoring patch, but everything else is
the same.

Lyude Paul (5):
  drm/nouveau: Check backlight IDs are >= 0, not > 0
  drm/nouveau: Move backlight device into nouveau_connector
  drm/nouveau: s/nouveau_backlight_exit/nouveau_backlight_fini/
  drm/nouveau: Cleanup indenting in nouveau_backlight.c
  drm/nouveau: Refactor nvXX_backlight_init()

 drivers/gpu/drm/nouveau/nouveau_backlight.c | 218 ++++++++++----------
 drivers/gpu/drm/nouveau/nouveau_connector.c |  20 ++
 drivers/gpu/drm/nouveau/nouveau_connector.h |  33 +++
 drivers/gpu/drm/nouveau/nouveau_display.c   |   2 -
 drivers/gpu/drm/nouveau/nouveau_display.h   |  25 ---
 drivers/gpu/drm/nouveau/nouveau_drv.h       |   2 -
 6 files changed, 159 insertions(+), 141 deletions(-)

-- 
2.17.1
