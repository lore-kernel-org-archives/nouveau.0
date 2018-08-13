From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH 1/3] drm/nouveau: Remove useless poll_enable() call in switcheroo_set_state()
Date: Mon, 13 Aug 2018 15:22:29 -0400
Message-ID: <20180813192231.28861-2-lyude@redhat.com>
References: <20180813192231.28861-1-lyude@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180813192231.28861-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: Lukas Wunner <lukas@wunner.de>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

This doesn't do anything, drm_kms_helper_poll_enable() gets called in
nouveau_pmops_resume()->nouveau_display_resume()->nouveau_display_init()
already.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Karol Herbst <karolherbst@gmail.com>
Cc: Lukas Wunner <lukas@wunner.de>
---
 drivers/gpu/drm/nouveau/nouveau_vga.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_vga.c b/drivers/gpu/drm/nouveau/nouveau_vga.c
index 3da5a4305aa4..09b1d8151881 100644
--- a/drivers/gpu/drm/nouveau/nouveau_vga.c
+++ b/drivers/gpu/drm/nouveau/nouveau_vga.c
@@ -46,7 +46,6 @@ nouveau_switcheroo_set_state(struct pci_dev *pdev,
 		pr_err("VGA switcheroo: switched nouveau on\n");
 		dev->switch_power_state = DRM_SWITCH_POWER_CHANGING;
 		nouveau_pmops_resume(&pdev->dev);
-		drm_kms_helper_poll_enable(dev);
 		dev->switch_power_state = DRM_SWITCH_POWER_ON;
 	} else {
 		pr_err("VGA switcheroo: switched nouveau off\n");
-- 
2.17.1
