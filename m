From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH 0/2] drm/nouveau: i2c over DP AUX fixes
Date: Thu, 25 Jul 2019 15:39:59 -0400
Message-ID: <20190725194005.16572-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, Lyude Paul <lyude@redhat.com>
List-Id: nouveau.vger.kernel.org

This is another attempt at fixing an issue with

yes | sensors-detect

Causing some machines with nouveau loaded to hang if certain kinds of
displays are attached. I've also included one minor fix that I found
along the way of troubleshooting this issue.

Lyude Paul (2):
  drm/nouveau: Fix missing elses in g94_i2c_aux_xfer
  drm/nouveau: Don't retry infinitely when receiving no data on i2c over
    AUX

 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c | 24 +++++++++++++------
 .../gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c  |  4 ++--
 2 files changed, 19 insertions(+), 9 deletions(-)

-- 
2.21.0
