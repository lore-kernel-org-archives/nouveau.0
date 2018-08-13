From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH v6 2/5] drm/nouveau: Remove duplicate poll_enable() in pmops_runtime_suspend()
Date: Mon, 13 Aug 2018 15:07:00 -0400
Message-ID: <20180813190706.24172-3-lyude@redhat.com>
References: <20180813190706.24172-1-lyude@redhat.com>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20180813190706.24172-1-lyude@redhat.com>
Sender: stable-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: stable@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, Karol Herbst <karolherbst@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Since actual hotplug notifications don't get disabled until
nouveau_display_fini() is called, all this will do is cause any hotplugs
that happen between this drm_kms_helper_poll_disable() call and the
actual hotplug disablement to potentially be dropped if ACPI isn't
around to help us.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: stable@vger.kernel.org
Cc: Lukas Wunner <lukas@wunner.de>
Cc: Karol Herbst <karolherbst@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index c7ec86d6c3c9..5fdc1fbe2ee5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -835,7 +835,6 @@ nouveau_pmops_runtime_suspend(struct device *dev)
 		return -EBUSY;
 	}
 
-	drm_kms_helper_poll_disable(drm_dev);
 	nouveau_switcheroo_optimus_dsm();
 	ret = nouveau_do_suspend(drm_dev, true);
 	pci_save_state(pdev);
-- 
2.17.1
