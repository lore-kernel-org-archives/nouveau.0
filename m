From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH 0/2] drm/nouveau: Fix DP AUX RPM issues
Date: Fri, 16 Nov 2018 20:50:21 -0500
Message-ID: <20181117015024.5771-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, Maxime Ripard <maxime.ripard@bootlin.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, linux-kernel@vger.kernel.org, Sean Paul <sean@poorly.run>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

Here's some fixes for the less important DP AUX issues I mentioned a
while back.

Lyude Paul (2):
  drm/dp: Add ->pre/post_transfer() hooks for drm_dp_aux
  drm/nouveau: Grab an rpm reference before/after DP AUX transactions

 drivers/gpu/drm/drm_dp_helper.c             |  5 ++
 drivers/gpu/drm/nouveau/nouveau_connector.c | 36 ++++++++
 drivers/gpu/drm/nouveau/nouveau_drm.c       | 12 ++-
 drivers/gpu/drm/nouveau/nouveau_drv.h       |  8 ++
 include/drm/drm_dp_helper.h                 | 91 +++++++++++++++++++++
 5 files changed, 151 insertions(+), 1 deletion(-)

-- 
2.19.1
