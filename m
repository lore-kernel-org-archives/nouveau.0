From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH 0/2] drm/nouveau: CRTC Runtime PM ref tracking fixes
Date: Wed,  7 Aug 2019 17:32:59 -0400
Message-ID: <20190807213304.9255-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, Lyude Paul <lyude@redhat.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Karol Herbst <karolherbst@gmail.com>, Ilia Mirkin <imirkin@alum.mit.edu>
List-Id: nouveau.vger.kernel.org

Just some runtime PM fixes for some much less noticeable runtime PM ref
tracking issues that I got reminded of when fixing some unrelated issues
with nouveau.

Lyude Paul (2):
  drm/nouveau/dispnv04: Grab/put runtime PM refs on DPMS on/off
  drm/nouveau/dispnv50: Fix runtime PM ref tracking for non-blocking
    modesets

 drivers/gpu/drm/nouveau/dispnv04/crtc.c | 18 +++---------
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 38 +++++++++++--------------
 drivers/gpu/drm/nouveau/nouveau_drv.h   |  3 --
 3 files changed, 21 insertions(+), 38 deletions(-)

-- 
2.21.0
