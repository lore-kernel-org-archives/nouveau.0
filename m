From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 09/19] nv50: properly set the PRIMITIVE_ID enable
	flag when it is a gp input.
Date: Mon, 13 Jan 2014 14:19:25 -0500
Message-ID: <1389640775-25046-10-git-send-email-imirkin@alum.mit.edu>
References: <1389640775-25046-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1389640775-25046-1-git-send-email-imirkin@alum.mit.edu>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces@lists.freedesktop.org
Errors-To: mesa-dev-bounces@lists.freedesktop.org
To: mesa-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---
 src/gallium/drivers/nouveau/nv50/nv50_program.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/src/gallium/drivers/nouveau/nv50/nv50_program.c b/src/gallium/drivers/nouveau/nv50/nv50_program.c
index 78a12e3..f46f240 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_program.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_program.c
@@ -52,6 +52,9 @@ nv50_vertprog_assign_slots(struct nv50_ir_prog_info *info)
       for (c = 0; c < 4; ++c)
          if (info->in[i].mask & (1 << c))
             info->in[i].slot[c] = n++;
+
+      if (info->in[i].sn == TGSI_SEMANTIC_PRIMID)
+         prog->vp.attrs[2] |= NV50_3D_VP_GP_BUILTIN_ATTR_EN_PRIMITIVE_ID;
    }
    prog->in_nr = info->numInputs;
 
-- 
1.8.3.2
