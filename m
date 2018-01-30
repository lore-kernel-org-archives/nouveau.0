From: Lyude Paul <lyude@redhat.com>
Subject: [RFC v5 0/5] Implement full clockgating for Kepler1 and 2
Date: Tue, 30 Jan 2018 14:49:20 -0500
Message-ID: <20180130195024.18172-1-lyude@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@linux.ie>, Rhys Kidd <rhyskidd@gmail.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Karol Herbst <karolherbst@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Ben Skeggs <bskeggs@redhat.com>, Ilia Mirkin <imirkin@alum.mit.edu>, Martin Peres <martin.peres@free.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lyude Paul <lyude@redhat.com>, Kate Stewart <kstewart@linuxfoundation.org>, Philippe Ombredanne <pombredanne@nexb.com>
List-Id: nouveau.vger.kernel.org

Next version of my patchseries for adding clockgating support for
kepler1 and 2 on nouveau. The first version of this series can be found
here:

https://patchwork.freedesktop.org/series/36504/

One small change:
 - Add Martin's R-B, whoops

Lyude Paul (5):
  drm/nouveau: Add support for basic clockgating on Kepler1
  drm/nouveau: Add support for BLCG on Kepler1
  drm/nouveau: Add support for BLCG on Kepler2
  drm/nouveau: Add support for SLCG for Kepler2
  drm/nouveau: Introduce NvPmEnableGating option

 drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h   |   1 +
 .../gpu/drm/nouveau/include/nvkm/subdev/therm.h    |  17 ++
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c  |  25 +--
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.h     |   1 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gk104.c     | 207 +++++++++++++++++++++
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gk104.h     |  55 ++++++
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gk110.c     | 155 +++++++++++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild      |   1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gf100.c     |   6 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk104.c     |  47 +++++
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk104.h     |  35 ++++
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk110.c     |  71 +++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/priv.h      |   2 +
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/Kbuild   |   2 +
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c   |  70 ++++++-
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf100.c  |  75 ++++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf100.h  |  35 ++++
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf119.c  |   8 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/gk104.c  | 136 ++++++++++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/gk104.h  |  48 +++++
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/gt215.c  |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/priv.h   |  23 ++-
 22 files changed, 996 insertions(+), 26 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/gr/gk104.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk104.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk110.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf100.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/therm/gk104.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/therm/gk104.h

-- 
2.14.3
