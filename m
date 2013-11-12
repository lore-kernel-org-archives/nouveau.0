From: maarten.lankhorst@canonical.com
Subject: [PATCH 4/7] drm/nvc0-/gr: shift wrapping bug in
	nvc0_grctx_generate_r406800
Date: Tue, 12 Nov 2013 13:34:11 +0100
Message-ID: <1384259656-29483-4-git-send-email-maarten.lankhorst@canonical.com>
References: <1384259656-29483-1-git-send-email-maarten.lankhorst@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1384259656-29483-1-git-send-email-maarten.lankhorst@canonical.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: bskeggs@redhat.com
Cc: nouveau@lists.freedesktop.org, Dan Carpenter <dan.carpenter@oracle.com>, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>

We care about the upper 32 bits here so we have to use 1ULL instead of 1
to avoid a shift wrapping bug.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>
---
 drivers/gpu/drm/nouveau/core/engine/graph/ctxnvc0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/ctxnvc0.c b/drivers/gpu/drm/nouveau/core/engine/graph/ctxnvc0.c
index 64dca26..fe67415 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/ctxnvc0.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/ctxnvc0.c
@@ -1039,7 +1039,7 @@ nvc0_grctx_generate_r406800(struct nvc0_graph_priv *priv)
 			} while (!tpcnr[gpc]);
 			tpc = priv->tpc_nr[gpc] - tpcnr[gpc]--;
 
-			tpc_set |= 1 << ((gpc * 8) + tpc);
+			tpc_set |= 1ULL << ((gpc * 8) + tpc);
 		}
 
 		nv_wr32(priv, 0x406800 + (i * 0x20), lower_32_bits(tpc_set));
-- 
1.8.4
