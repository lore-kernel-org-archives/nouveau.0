From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH v3 0/5] drm/nouveau: Backlight fixes and cleanup
Date: Wed, 29 Aug 2018 18:26:20 -0400
Message-ID: <20180829222626.15074-1-lyude@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

Next version of https://patchwork.freedesktop.org/series/48596/ . Added
NV_INFO_ONCE and made "Move backlight device into nouveau_connector" use
that instead so we don't print the GMUX warning more then once.

Lyude Paul (5):
  drm/nouveau: Add NV_PRINTK_ONCE and variants
  drm/nouveau: Move backlight device into nouveau_connector
  drm/nouveau: s/nouveau_backlight_exit/nouveau_backlight_fini/
  drm/nouveau: Cleanup indenting in nouveau_backlight.c
  drm/nouveau: Refactor nvXX_backlight_init()

 drivers/gpu/drm/nouveau/nouveau_backlight.c | 220 ++++++++++----------
 drivers/gpu/drm/nouveau/nouveau_connector.c |  20 ++
 drivers/gpu/drm/nouveau/nouveau_connector.h |  33 +++
 drivers/gpu/drm/nouveau/nouveau_display.c   |   2 -
 drivers/gpu/drm/nouveau/nouveau_display.h   |  25 ---
 drivers/gpu/drm/nouveau/nouveau_drv.h       |  10 +-
 6 files changed, 168 insertions(+), 142 deletions(-)

-- 
2.17.1
