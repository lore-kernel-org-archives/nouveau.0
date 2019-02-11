From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] drm/nouveau/abi16: add missing break in switch statement
Date: Mon, 11 Feb 2019 12:54:04 -0600
Message-ID: <20190211185404.GA3416@embeddedor>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Kees Cook <keescook@chromium.org>
List-Id: nouveau.vger.kernel.org

Fix the following warning by adding a missing break:

drivers/gpu/drm/nouveau/nouveau_abi16.c: In function ‘nouveau_abi16_ioctl_getparam’:
drivers/gpu/drm/nouveau/nouveau_abi16.c:202:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
   switch (device->info.platform) {
   ^~~~~~
drivers/gpu/drm/nouveau/nouveau_abi16.c:217:2: note: here
  case NOUVEAU_GETPARAM_FB_SIZE:
  ^~~~

This patch is part of the ongoing efforts to enable
-Wimplicit-fallthrough.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/gpu/drm/nouveau/nouveau_abi16.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index b06cdac8f3a2..a95ec3783f39 100644
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
