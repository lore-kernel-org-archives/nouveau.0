From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] drm/nouveau/secboot/acr: fix memory leak
Date: Tue, 24 Jul 2018 08:27:19 -0500
Message-ID: <20180724132719.GA32237@embeddedor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Kees Cook <keescook@chromium.org>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
List-Id: nouveau.vger.kernel.org

In case memory resources for *bl_desc* were allocated, release
them before return.

Addresses-Coverity-ID: 1472021 ("Resource leak")
Fixes: 0d466901552a ("drm/nouveau/secboot/acr: Remove VLA usage")
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/secboot/acr_r352.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/acr_r352.c b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/acr_r352.c
index d02e183..5c14d6a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/acr_r352.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/acr_r352.c
@@ -801,6 +801,7 @@ acr_r352_load(struct nvkm_acr *_acr, struct nvkm_falcon *falcon,
 		bl = acr->hsbl_unload_blob;
 	} else {
 		nvkm_error(_acr->subdev, "invalid secure boot blob!\n");
+		kfree(bl_desc);
 		return -EINVAL;
 	}
 
-- 
2.7.4
