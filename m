From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 03/12] nv50,
	nvc0: set constbufs dirty on pipe context switch
Date: Tue, 20 May 2014 19:39:57 -0400
Message-ID: <1400629206-4447-4-git-send-email-imirkin@alum.mit.edu>
References: <1400629206-4447-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1400629206-4447-1-git-send-email-imirkin@alum.mit.edu>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: mesa-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: "10.2" <mesa-stable@lists.freedesktop.org>, Christoph Bumiller <christoph.bumiller@speed.at>
List-Id: nouveau.vger.kernel.org

From: Christoph Bumiller <christoph.bumiller@speed.at>

Reviewed-by: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: "10.2" <mesa-stable@lists.freedesktop.org>
---
 src/gallium/drivers/nouveau/nv50/nv50_state_validate.c | 4 ++++
 src/gallium/drivers/nouveau/nvc0/nvc0_state_validate.c | 1 +
 2 files changed, 5 insertions(+)

diff --git a/src/gallium/drivers/nouveau/nv50/nv50_state_validate.c b/src/gallium/drivers/nouveau/nv50/nv50_state_validate.c
index 18451c7..1dcb961 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_state_validate.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_state_validate.c
@@ -400,6 +400,10 @@ nv50_switch_pipe_context(struct nv50_context *ctx_to)
    ctx_to->viewports_dirty = ~0;
    ctx_to->scissors_dirty = ~0;
 
+   ctx_to->constbuf_dirty[0] =
+   ctx_to->constbuf_dirty[1] =
+   ctx_to->constbuf_dirty[2] = (1 << NV50_MAX_PIPE_CONSTBUFS) - 1;
+
    if (!ctx_to->vertex)
       ctx_to->dirty &= ~(NV50_NEW_VERTEX | NV50_NEW_ARRAYS);
 
diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_state_validate.c b/src/gallium/drivers/nouveau/nvc0/nvc0_state_validate.c
index 40016fc..dcec910 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_state_validate.c
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_state_validate.c
@@ -531,6 +531,7 @@ nvc0_switch_pipe_context(struct nvc0_context *ctx_to)
    for (s = 0; s < 5; ++s) {
       ctx_to->samplers_dirty[s] = ~0;
       ctx_to->textures_dirty[s] = ~0;
+      ctx_to->constbuf_dirty[s] = (1 << NVC0_MAX_PIPE_CONSTBUFS) - 1;
    }
 
    if (!ctx_to->vertex)
-- 
1.8.5.5
