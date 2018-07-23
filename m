From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH] drm/nouveau/drm/nouveau: Fix runtime PM leak in nv50_disp_atomic_commit()
Date: Mon, 23 Jul 2018 13:06:04 -0400
Message-ID: <20180723170604.7223-1-lyude@redhat.com>
References: <153227750090101@kroah.com>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <153227750090101@kroah.com>
Sender: stable-owner@vger.kernel.org
To: gregkh@linuxfoundation.org
Cc: stable@vger.kernel.org, bskeggs@redhat.com, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

commit e5d54f1935722f83df7619f3978f774c2b802cd8 upstream

A CRTC being enabled doesn't mean it's on! It doesn't even necessarily
mean it's being used. This fixes runtime PM leaks on the P50 I've got
next to me.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: stable@vger.kernel.org
Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nv50_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nv50_display.c b/drivers/gpu/drm/nouveau/nv50_display.c
index 2b3ccd850750..bc5c4f2402b4 100644
--- a/drivers/gpu/drm/nouveau/nv50_display.c
+++ b/drivers/gpu/drm/nouveau/nv50_display.c
@@ -4198,7 +4198,7 @@ nv50_disp_atomic_commit(struct drm_device *dev,
 		nv50_disp_atomic_commit_tail(state);
 
 	drm_for_each_crtc(crtc, dev) {
-		if (crtc->state->enable) {
+		if (crtc->state->active) {
 			if (!drm->have_disp_power_ref) {
 				drm->have_disp_power_ref = true;
 				return 0;
-- 
2.17.1
