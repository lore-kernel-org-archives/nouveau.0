From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.19 204/671] drm/nouveau: fix missing break in switch statement
Date: Thu, 16 Jan 2020 11:51:53 -0500
Message-ID: <20200116165940.10720-87-sashal@kernel.org>
References: <20200116165940.10720-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200116165940.10720-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Colin Ian King <colin.king@canonical.com>, "Gustavo A . R . Silva" <gustavo@embeddedor.com>, Ben Skeggs <bskeggs@redhat.com>, Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

[ Upstream commit 785cf1eeafa23ec63f426d322401054d13abe2a3 ]

The NOUVEAU_GETPARAM_PCI_DEVICE case is missing a break statement and falls
through to the following NOUVEAU_GETPARAM_BUS_TYPE case and may end up
re-assigning the getparam->value to an undesired value. Fix this by adding
in the missing break.

Detected by CoverityScan, CID#1460507 ("Missing break in switch")

Fixes: 359088d5b8ec ("drm/nouveau: remove trivial cases of nvxx_device() usage")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
Reviewed-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_abi16.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index e67a471331b5..6ec745873bc5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -214,6 +214,7 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
 			WARN_ON(1);
 			break;
 		}
+		break;
 	case NOUVEAU_GETPARAM_FB_SIZE:
 		getparam->value = drm->gem.vram_available;
 		break;
-- 
2.20.1
