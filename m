From: Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH v2] drm/nouveau/nvif: remove const attribute from nvif_mclass
Date: Fri, 15 Jun 2018 16:00:42 -0700
Message-ID: <20180615230044.189899-1-ndesaulniers@google.com>
References: <CAKwvOd=ntzV5x+rDSH6VEoS2ONZacnqeemewNgv3Aotm3Hd-hA@mail.gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKwvOd=ntzV5x+rDSH6VEoS2ONZacnqeemewNgv3Aotm3Hd-hA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bskeggs@redhat.com, airlied@linux.ie
Cc: mka@chromium.org, jeyu@kernel.org, Nick Desaulniers <ndesaulniers@google.com>, Thomas Gleixner <tglx@linutronix.de>, Philippe Ombredanne <pombredanne@nexb.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kate Stewart <kstewart@linuxfoundation.org>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Similar to commit 0bf8bf50eddc ("module: Remove
const attribute from alias for MODULE_DEVICE_TABLE")

Fixes many -Wduplicate-decl-specifier warnings due to the combination of
const typeof() of already const variables.

Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes since v1: added additional space after statements.

 drivers/gpu/drm/nouveau/include/nvif/object.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/object.h b/drivers/gpu/drm/nouveau/include/nvif/object.h
index a2d5244ff2b7..3d7e485a9043 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/object.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/object.h
@@ -78,7 +78,7 @@ struct nvif_mclass {
 #define nvif_mclass(o,m) ({                                                    \
 	struct nvif_object *object = (o);                                      \
 	struct nvif_sclass *sclass;                                            \
-	const typeof(m[0]) *mclass = (m);                                      \
+	typeof(m[0]) *mclass = (m);                                            \
 	int ret = -ENODEV;                                                     \
 	int cnt, i, j;                                                         \
                                                                                \
-- 
2.18.0.rc1.244.gcf134e6275-goog
