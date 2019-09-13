From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH v2] drm/nouveau: dispnv50: Remove nv50_mstc_best_encoder()
Date: Fri, 13 Sep 2019 18:37:20 -0400
Message-ID: <20190913223721.10185-1-lyude@redhat.com>
References: <20190913220355.6883-2-lyude@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190913220355.6883-2-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Ilia Mirkin <imirkin@alum.mit.edu>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

When drm_connector_helper_funcs->atomic_best_encoder is defined,
->best_encoder is ignored by the atomic modesetting helpers. That being
said, this hook is completely broken anyway - it always returns the
first msto for a given mstc, despite the fact it might already be in
use.

So, just get rid of it. We'll need this in a moment anyway, when we make
mstos per-head as opposed to per-connector.

Changes since v1:
* Fix typo in documentation - imirkin

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index b46be8a091e9..a3f350fdfa8c 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -920,14 +920,6 @@ nv50_mstc_atomic_best_encoder(struct drm_connector *connector,
 	return &mstc->mstm->msto[head->base.index]->encoder;
 }
 
-static struct drm_encoder *
-nv50_mstc_best_encoder(struct drm_connector *connector)
-{
-	struct nv50_mstc *mstc = nv50_mstc(connector);
-
-	return &mstc->mstm->msto[0]->encoder;
-}
-
 static enum drm_mode_status
 nv50_mstc_mode_valid(struct drm_connector *connector,
 		     struct drm_display_mode *mode)
@@ -990,7 +982,6 @@ static const struct drm_connector_helper_funcs
 nv50_mstc_help = {
 	.get_modes = nv50_mstc_get_modes,
 	.mode_valid = nv50_mstc_mode_valid,
-	.best_encoder = nv50_mstc_best_encoder,
 	.atomic_best_encoder = nv50_mstc_atomic_best_encoder,
 	.atomic_check = nv50_mstc_atomic_check,
 };
-- 
2.21.0
