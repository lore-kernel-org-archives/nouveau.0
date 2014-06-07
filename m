From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH] drm/gk208/gr: add missing registers to grctx init
Date: Sat,  7 Jun 2014 15:39:45 -0400
Message-ID: <1402169985-32242-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This fixes hangs on GK208 which happen instantaneously on trying to use a
geometry shader.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org # v3.14+
---

ctxnvf0 also writes to these registers (although slightly diff values), so I
think this is right. So I guess trap 4 is whatever this 406 subengine is...

 drivers/gpu/drm/nouveau/core/engine/graph/ctxnv108.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/ctxnv108.c b/drivers/gpu/drm/nouveau/core/engine/graph/ctxnv108.c
index 48351b4..8de4a42 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/ctxnv108.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/ctxnv108.c
@@ -545,10 +545,12 @@ nv108_grctx_generate_mods(struct nvc0_graph_priv *priv, struct nvc0_grctx *info)
 	mmio_list(0x408010, 0x80000000,  0, 0);
 	mmio_list(0x419004, 0x00000000,  8, 1);
 	mmio_list(0x419008, 0x00000000,  0, 0);
+	mmio_list(0x4064cc, 0x80000000,  0, 0);
 	mmio_list(0x408004, 0x00000000,  8, 0);
 	mmio_list(0x408008, 0x80000030,  0, 0);
 	mmio_list(0x418808, 0x00000000,  8, 0);
 	mmio_list(0x41880c, 0x80000030,  0, 0);
+	mmio_list(0x4064c8, 0x00c20200,  0, 0);
 	mmio_list(0x418810, 0x80000000, 12, 2);
 	mmio_list(0x419848, 0x10000000, 12, 2);
 
-- 
1.8.5.5
