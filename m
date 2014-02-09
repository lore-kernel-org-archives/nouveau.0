From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 1/2] drm/nouveau: replace ffsll with __ffs64
Date: Sun,  9 Feb 2014 15:51:24 -0500
Message-ID: <1391979085-8012-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

The ffsll function is a lot slower than the __ffs64 built-in which
compiles to a single instruction on 64-bit. It's also nice to avoid
custom versions of standard functions. Note that __ffs == ffs - 1.

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---

I wrote a user-space program to test these out and make sure that the
functions behaved as expected. The logic in abi16 had to be flipped around a
bit since __ffs doesn't distinguish between 0 and 1. There's a minor
difference in that init->channel is going to get returned as 0 for ENOSPC vs
 -1, but I can't imagine that'd matter.

 drivers/gpu/drm/nouveau/core/core/parent.c |  2 +-
 drivers/gpu/drm/nouveau/core/os.h          | 11 -----------
 drivers/gpu/drm/nouveau/nouveau_abi16.c    |  4 ++--
 3 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/core/parent.c b/drivers/gpu/drm/nouveau/core/core/parent.c
index 313380c..dee5d12 100644
--- a/drivers/gpu/drm/nouveau/core/core/parent.c
+++ b/drivers/gpu/drm/nouveau/core/core/parent.c
@@ -49,7 +49,7 @@ nouveau_parent_sclass(struct nouveau_object *parent, u16 handle,
 
 	mask = nv_parent(parent)->engine;
 	while (mask) {
-		int i = ffsll(mask) - 1;
+		int i = __ffs64(mask);
 
 		if (nv_iclass(parent, NV_CLIENT_CLASS))
 			engine = nv_engine(nv_client(parent)->device);
diff --git a/drivers/gpu/drm/nouveau/core/os.h b/drivers/gpu/drm/nouveau/core/os.h
index 191e739..3cd6120 100644
--- a/drivers/gpu/drm/nouveau/core/os.h
+++ b/drivers/gpu/drm/nouveau/core/os.h
@@ -23,17 +23,6 @@
 
 #include <asm/unaligned.h>
 
-static inline int
-ffsll(u64 mask)
-{
-	int i;
-	for (i = 0; i < 64; i++) {
-		if (mask & (1ULL << i))
-			return i + 1;
-	}
-	return 0;
-}
-
 #ifndef ioread32_native
 #ifdef __BIG_ENDIAN
 #define ioread16_native ioread16be
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index 900fae0..b701117 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -270,8 +270,8 @@ nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
 		return nouveau_abi16_put(abi16, -EINVAL);
 
 	/* allocate "abi16 channel" data and make up a handle for it */
-	init->channel = ffsll(~abi16->handles);
-	if (!init->channel--)
+	init->channel = __ffs64(~abi16->handles);
+	if (~abi16->handles == 0)
 		return nouveau_abi16_put(abi16, -ENOSPC);
 
 	chan = kzalloc(sizeof(*chan), GFP_KERNEL);
-- 
1.8.3.2
