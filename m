From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.4 048/174] drm/nouveau/bios/ramcfg: fix missing parentheses when calculating RON
Date: Thu, 16 Jan 2020 12:40:45 -0500
Message-ID: <20200116174251.24326-48-sashal@kernel.org>
References: <20200116174251.24326-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200116174251.24326-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Colin Ian King <colin.king@canonical.com>, Ben Skeggs <bskeggs@redhat.com>, Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

[ Upstream commit 13649101a25c53c87f4ab98a076dfe61f3636ab1 ]

Currently, the expression for calculating RON is always going to result
in zero no matter the value of ram->mr[1] because the ! operator has
higher precedence than the shift >> operator.  I believe the missing
parentheses around the expression before appying the ! operator will
result in the desired result.

[ Note, not tested ]

Detected by CoveritScan, CID#1324005 ("Operands don't affect result")

Fixes: c25bf7b6155c ("drm/nouveau/bios/ramcfg: Separate out RON pull value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gddr3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gddr3.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gddr3.c
index 60ece0a8a2e1..1d2d6bae73cd 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gddr3.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gddr3.c
@@ -87,7 +87,7 @@ nvkm_gddr3_calc(struct nvkm_ram *ram)
 		WR  = (ram->next->bios.timing[2] & 0x007f0000) >> 16;
 		/* XXX: Get these values from the VBIOS instead */
 		DLL = !(ram->mr[1] & 0x1);
-		RON = !(ram->mr[1] & 0x300) >> 8;
+		RON = !((ram->mr[1] & 0x300) >> 8);
 		break;
 	default:
 		return -ENOSYS;
-- 
2.20.1
