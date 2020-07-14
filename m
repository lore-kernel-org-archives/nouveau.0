From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.7 15/19] drm/nouveau/i2c/g94-: increase NV_PMGR_DP_AUXCTL_TRANSACTREQ timeout
Date: Tue, 14 Jul 2020 10:38:45 -0400
Message-ID: <20200714143849.4035283-15-sashal@kernel.org>
References: <20200714143849.4035283-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20200714143849.4035283-1-sashal@kernel.org>
Sender: stable-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Ben Skeggs <bskeggs@redhat.com>, Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

From: Ben Skeggs <bskeggs@redhat.com>

[ Upstream commit 0156e76d388310a490aeb0f2fbb5b284ded3aecc ]

Tegra TRM says worst-case reply time is 1216us, and this should fix some
spurious timeouts that have been popping up.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c   | 4 ++--
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c
index c8ab1b5741a3e..db7769cb33eba 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c
@@ -118,10 +118,10 @@ g94_i2c_aux_xfer(struct nvkm_i2c_aux *obj, bool retry,
 		if (retries)
 			udelay(400);
 
-		/* transaction request, wait up to 1ms for it to complete */
+		/* transaction request, wait up to 2ms for it to complete */
 		nvkm_wr32(device, 0x00e4e4 + base, 0x00010000 | ctrl);
 
-		timeout = 1000;
+		timeout = 2000;
 		do {
 			ctrl = nvkm_rd32(device, 0x00e4e4 + base);
 			udelay(1);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c
index 7ef60895f43a7..edb6148cbca04 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c
@@ -118,10 +118,10 @@ gm200_i2c_aux_xfer(struct nvkm_i2c_aux *obj, bool retry,
 		if (retries)
 			udelay(400);
 
-		/* transaction request, wait up to 1ms for it to complete */
+		/* transaction request, wait up to 2ms for it to complete */
 		nvkm_wr32(device, 0x00d954 + base, 0x00010000 | ctrl);
 
-		timeout = 1000;
+		timeout = 2000;
 		do {
 			ctrl = nvkm_rd32(device, 0x00d954 + base);
 			udelay(1);
-- 
2.25.1
