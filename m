From: Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH v2] drm/nouveau/dispnv50: add missed nv50_outp_release in nv50_msto_disable
Date: Thu, 12 Dec 2019 18:03:56 +0800
Message-ID: <20191212100356.11309-1-hslester96@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, Chuhong Yuan <hslester96@gmail.com>
List-Id: nouveau.vger.kernel.org

nv50_msto_disable() does not call nv50_outp_release() to match
nv50_outp_acquire() like other disable().
Add the missed call to fix it.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
Changes in v2:
  - Fix the subject prefix.

 drivers/gpu/drm/nouveau/dispnv50/disp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 549486f1d937..84e1417355cc 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -862,8 +862,10 @@ nv50_msto_disable(struct drm_encoder *encoder)
 
 	mstm->outp->update(mstm->outp, msto->head->base.index, NULL, 0, 0);
 	mstm->modified = true;
-	if (!--mstm->links)
+	if (!--mstm->links) {
 		mstm->disabled = true;
+		nv50_outp_release(mstm->outp);
+	}
 	msto->disabled = true;
 }
 
-- 
2.24.0
