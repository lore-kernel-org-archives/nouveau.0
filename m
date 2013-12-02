From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH] nv50: Fix GPU_READING/WRITING bit removal
Date: Sun,  1 Dec 2013 23:13:56 -0500
Message-ID: <1385957636-6780-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces@lists.freedesktop.org
Errors-To: mesa-dev-bounces@lists.freedesktop.org
To: Christoph Bumiller <e0425955@student.tuwien.ac.at>
Cc: mesa-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---

These look like pretty obvious typos. The x |= read; x &= ~write; (or
vice-versa) pattern occurs in nvc0, so I'm guessing that this is what was
intended here as well. Not sure if this fixes anything in particular though.

 src/gallium/drivers/nouveau/nv50/nv50_state_validate.c | 4 ++--
 src/gallium/drivers/nouveau/nv50/nv50_tex.c            | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nv50/nv50_state_validate.c b/src/gallium/drivers/nouveau/nv50/nv50_state_validate.c
index 866829c..86b9a23 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_state_validate.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_state_validate.c
@@ -61,7 +61,7 @@ nv50_validate_fb(struct nv50_context *nv50)
       if (mt->base.status & NOUVEAU_BUFFER_STATUS_GPU_READING)
          nv50->state.rt_serialize = TRUE;
       mt->base.status |= NOUVEAU_BUFFER_STATUS_GPU_WRITING;
-      mt->base.status &= NOUVEAU_BUFFER_STATUS_GPU_READING;
+      mt->base.status &= ~NOUVEAU_BUFFER_STATUS_GPU_READING;
 
       /* only register for writing, otherwise we'd always serialize here */
       BCTX_REFN(nv50->bufctx_3d, FB, &mt->base, WR);
@@ -91,7 +91,7 @@ nv50_validate_fb(struct nv50_context *nv50)
       if (mt->base.status & NOUVEAU_BUFFER_STATUS_GPU_READING)
          nv50->state.rt_serialize = TRUE;
       mt->base.status |= NOUVEAU_BUFFER_STATUS_GPU_WRITING;
-      mt->base.status &= NOUVEAU_BUFFER_STATUS_GPU_READING;
+      mt->base.status &= ~NOUVEAU_BUFFER_STATUS_GPU_READING;
 
       BCTX_REFN(nv50->bufctx_3d, FB, &mt->base, WR);
    } else {
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_tex.c b/src/gallium/drivers/nouveau/nv50/nv50_tex.c
index 9e51292..f7284fa 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_tex.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_tex.c
@@ -271,7 +271,7 @@ nv50_validate_tic(struct nv50_context *nv50, int s)
 
       nv50->screen->tic.lock[tic->id / 32] |= 1 << (tic->id % 32);
 
-      res->status &= NOUVEAU_BUFFER_STATUS_GPU_WRITING;
+      res->status &= ~NOUVEAU_BUFFER_STATUS_GPU_WRITING;
       res->status |= NOUVEAU_BUFFER_STATUS_GPU_READING;
 
       BCTX_REFN(nv50->bufctx_3d, TEXTURES, res, RD);
-- 
1.8.3.2
