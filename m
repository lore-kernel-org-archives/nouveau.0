From: Martin Peres <martin.peres@free.fr>
Subject: [PATCH] nouveau/led: prevent compiling the led-code if nouveau=y and leds=m
Date: Wed,  7 Dec 2016 06:30:15 +0200
Message-ID: <20161207043016.24805-1-martin.peres@free.fr>
References: <20161207033226.10802-1-martin.peres@free.fr>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20161207033226.10802-1-martin.peres@free.fr>
Sender: stable-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: Martin Peres <martin.peres@free.fr>, "# 4 . 9 . x-" <stable@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

The proper fix would have been to select LEDS_CLASS but this can lead
to a circular dependency, as found out by Arnd.

This patch implements Arnd's suggestion instead, at the cost of some
auto-magic for a fringe feature.

Cc: <stable@vger.kernel.org> # 4.9.x-
Reported-by: Arnd Bergmann <arnd@arndb.de>
Reported-by: Intel's 0-DAY
Fixes: 8d021d71b324 ("drm/nouveau/drm/nouveau: add a LED driver for the NVIDIA logo")
Signed-off-by: Martin Peres <martin.peres@free.fr>
---
 drivers/gpu/drm/nouveau/nouveau_led.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_led.h b/drivers/gpu/drm/nouveau/nouveau_led.h
index 187ecdb..21a5775 100644
--- a/drivers/gpu/drm/nouveau/nouveau_led.h
+++ b/drivers/gpu/drm/nouveau/nouveau_led.h
@@ -42,7 +42,7 @@ nouveau_led(struct drm_device *dev)
 }
 
 /* nouveau_led.c */
-#if IS_ENABLED(CONFIG_LEDS_CLASS)
+#if IS_REACHABLE(CONFIG_LEDS_CLASS)
 int  nouveau_led_init(struct drm_device *dev);
 void nouveau_led_suspend(struct drm_device *dev);
 void nouveau_led_resume(struct drm_device *dev);
-- 
2.10.2
