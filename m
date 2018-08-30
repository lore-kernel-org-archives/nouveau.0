From: Joe Perches <joe@perches.com>
Subject: [PATCH 0/2] drm/nouveau: Use more standard logging styles
Date: Thu, 30 Aug 2018 11:36:25 -0700
Message-ID: <cover.1535654026.git.joe@perches.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: Lyude Paul <lyude@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Reduces object size ~4kb

Joe Perches (2):
  drm/nouveau: Add new logging function nv_cli_printk
  drm/nouveau: Convert NV_PRINTK macros and uses to new nv_cli_<level> macros

 drivers/gpu/drm/nouveau/nouveau_abi16.c |  2 +-
 drivers/gpu/drm/nouveau/nouveau_chan.c  | 12 +++----
 drivers/gpu/drm/nouveau/nouveau_drm.c   | 21 +++++++++++
 drivers/gpu/drm/nouveau/nouveau_drv.h   | 44 ++++++++++++++---------
 drivers/gpu/drm/nouveau/nouveau_gem.c   | 62 ++++++++++++++++-----------------
 5 files changed, 87 insertions(+), 54 deletions(-)

-- 
2.15.0
