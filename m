From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.4 38/52] drm/nouveau/kms/nv50-: fix panel scaling
Date: Fri, 20 Dec 2019 09:29:40 -0500
Message-ID: <20191220142954.9500-38-sashal@kernel.org>
References: <20191220142954.9500-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20191220142954.9500-1-sashal@kernel.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Sasha Levin <sashal@kernel.org>, nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

From: Ben Skeggs <bskeggs@redhat.com>

[ Upstream commit 3d1890ef8023e61934e070021b06cc9f417260c0 ]

Under certain circumstances, encoder atomic_check() can be entered
without adjusted_mode having been reset to the same as mode, which
confuses the scaling logic and can lead to a misprogrammed display.

Fix this by checking against the user-provided mode directly.

Link: https://bugs.freedesktop.org/show_bug.cgi?id=108615
Link: https://gitlab.freedesktop.org/xorg/driver/xf86-video-nouveau/issues/464
Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index b46be8a091e99..8f4675c28c6f9 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -326,9 +326,9 @@ nv50_outp_atomic_check_view(struct drm_encoder *encoder,
 			 * same size as the native one (e.g. different
 			 * refresh rate)
 			 */
-			if (adjusted_mode->hdisplay == native_mode->hdisplay &&
-			    adjusted_mode->vdisplay == native_mode->vdisplay &&
-			    adjusted_mode->type & DRM_MODE_TYPE_DRIVER)
+			if (mode->hdisplay == native_mode->hdisplay &&
+			    mode->vdisplay == native_mode->vdisplay &&
+			    mode->type & DRM_MODE_TYPE_DRIVER)
 				break;
 			mode = native_mode;
 			asyc->scaler.full = true;
-- 
2.20.1
