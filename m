From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH] nv30: report the correct max varying limit
Date: Wed, 29 Jan 2014 12:41:27 -0500
Message-ID: <1391017287-22678-1-git-send-email-imirkin@alum.mit.edu>
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
To: Ben Skeggs <bskeggs@redhat.com>, mesa-dev@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org, "9.1 9.2 10.0" <mesa-stable@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

nvfx_fragprog_assign_generic only allows for up to 10/8 texcoords for
nv40/nv30. This fixes compilation of the varying-packing tests (although
they still fail).

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: 9.1 9.2 10.0 <mesa-stable@lists.freedesktop.org>
---
 src/gallium/drivers/nouveau/nv30/nv30_screen.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/gallium/drivers/nouveau/nv30/nv30_screen.c b/src/gallium/drivers/nouveau/nv30/nv30_screen.c
index 26ad33d..9ce10a4 100644
--- a/src/gallium/drivers/nouveau/nv30/nv30_screen.c
+++ b/src/gallium/drivers/nouveau/nv30/nv30_screen.c
@@ -219,7 +219,7 @@ nv30_screen_get_shader_param(struct pipe_screen *pscreen, unsigned shader,
       case PIPE_SHADER_CAP_MAX_CONTROL_FLOW_DEPTH:
          return 0;
       case PIPE_SHADER_CAP_MAX_INPUTS:
-         return (eng3d->oclass >= NV40_3D_CLASS) ? 12 : 10;
+         return (eng3d->oclass >= NV40_3D_CLASS) ? 10 : 8;
       case PIPE_SHADER_CAP_MAX_CONSTS:
          return (eng3d->oclass >= NV40_3D_CLASS) ? 224 : 32;
       case PIPE_SHADER_CAP_MAX_CONST_BUFFERS:
-- 
1.8.3.2
