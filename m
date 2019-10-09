From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] drm/nouveau/falcon: make unexported objects static
Date: Wed,  9 Oct 2019 14:15:25 +0100
Message-ID: <20191009131525.4352-1-ben.dooks@codethink.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@lists.codethink.co.uk
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Make the msgqueue_0148cdec_acr_func and msgqueue_0148cdec_func
static to avoid the following sparse warnings:

drivers/gpu/drm/nouveau/nvkm/falcon/msgqueue_0148cdec.c:230:1: warning: symbol 'msgqueue_0148cdec_acr_func' was not declared. Should it be static?
drivers/gpu/drm/nouveau/nvkm/falcon/msgqueue_0148cdec.c:241:1: warning: symbol 'msgqueue_0148cdec_func' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/gpu/drm/nouveau/nvkm/falcon/msgqueue_0148cdec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/falcon/msgqueue_0148cdec.c b/drivers/gpu/drm/nouveau/nvkm/falcon/msgqueue_0148cdec.c
index 9424803b9ef4..dfc0d50f080b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/falcon/msgqueue_0148cdec.c
+++ b/drivers/gpu/drm/nouveau/nvkm/falcon/msgqueue_0148cdec.c
@@ -226,7 +226,7 @@ acr_boot_falcon(struct nvkm_msgqueue *priv, enum nvkm_secboot_falcon falcon)
 	return 0;
 }
 
-const struct nvkm_msgqueue_acr_func
+static const struct nvkm_msgqueue_acr_func
 msgqueue_0148cdec_acr_func = {
 	.boot_falcon = acr_boot_falcon,
 };
@@ -237,7 +237,7 @@ msgqueue_0148cdec_dtor(struct nvkm_msgqueue *queue)
 	kfree(msgqueue_0148cdec(queue));
 }
 
-const struct nvkm_msgqueue_func
+static const struct nvkm_msgqueue_func
 msgqueue_0148cdec_func = {
 	.init_func = &msgqueue_0148cdec_init_func,
 	.acr_func = &msgqueue_0148cdec_acr_func,
-- 
2.23.0
