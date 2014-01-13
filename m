From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 10/19] nv50: VP_RESULT_MAP_SIZE has to be positive
Date: Mon, 13 Jan 2014 14:19:26 -0500
Message-ID: <1389640775-25046-11-git-send-email-imirkin@alum.mit.edu>
References: <1389640775-25046-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org>
In-Reply-To: <1389640775-25046-1-git-send-email-imirkin@alum.mit.edu>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
Errors-To: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
To: mesa-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Make sure that we never try to use a 0-sized map. This can happen when
using a gp, so add a dummy mapping when computing vp_gp_mapping in that
case.

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---
 src/gallium/drivers/nouveau/nv50/nv50_shader_state.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/src/gallium/drivers/nouveau/nv50/nv50_shader_state.c b/src/gallium/drivers/nouveau/nv50/nv50_shader_state.c
index ba4f592..265ef20 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_shader_state.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_shader_state.c
@@ -457,6 +457,7 @@ nv50_fp_linkage_validate(struct nv50_context *nv50)
       BEGIN_NV04(push, NV50_3D(SEMANTIC_PRIM_ID), 1);
       PUSH_DATA (push, primid);
 
+      assert(m > 0);
       BEGIN_NV04(push, NV50_3D(VP_RESULT_MAP_SIZE), 1);
       PUSH_DATA (push, m);
       BEGIN_NV04(push, NV50_3D(VP_RESULT_MAP(0)), n);
@@ -516,6 +517,8 @@ nv50_vp_gp_mapping(uint8_t *map, int m,
          oid += mv & 1;
       }
    }
+   if (!m)
+      map[m++] = 0;
    return m;
 }
 
@@ -540,6 +543,7 @@ nv50_gp_linkage_validate(struct nv50_context *nv50)
    BEGIN_NV04(push, NV50_3D(VP_GP_BUILTIN_ATTR_EN), 1);
    PUSH_DATA (push, vp->vp.attrs[2] | gp->vp.attrs[2]);
 
+   assert(m > 0);
    BEGIN_NV04(push, NV50_3D(VP_RESULT_MAP_SIZE), 1);
    PUSH_DATA (push, m);
    BEGIN_NV04(push, NV50_3D(VP_RESULT_MAP(0)), n);
-- 
1.8.3.2
