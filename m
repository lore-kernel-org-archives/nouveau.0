From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH v3 0/3] Cleanup drm_kms_helper_poll_enable/disable() calls
Date: Wed, 15 Aug 2018 15:15:10 -0400
Message-ID: <20180815191513.6266-1-lyude@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

Next version of https://patchwork.freedesktop.org/series/48131/

Only changes are new A-Bs and R-Bs

Lyude Paul (3):
  drm/nouveau: Remove useless poll_enable() call in
    switcheroo_set_state()
  drm/nouveau: Remove useless poll_disable() call in
    switcheroo_set_state()
  drm/nouveau: Remove useless poll_enable() call in drm_load()

 drivers/gpu/drm/nouveau/nouveau_drm.c | 4 +---
 drivers/gpu/drm/nouveau/nouveau_vga.c | 2 --
 2 files changed, 1 insertion(+), 5 deletions(-)

-- 
2.17.1
