From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH] nv30: add forgotten PIPE_CAP_CUBE_MAP_ARRAY cap
	to list
Date: Mon, 19 Aug 2013 07:16:25 -0400
Message-ID: <1376910985-3675-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
Errors-To: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
To: mesa-dev@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---

Silences a warning about unrecognized param when in debug mode.

 src/gallium/drivers/nv30/nv30_screen.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/src/gallium/drivers/nv30/nv30_screen.c b/src/gallium/drivers/nv30/nv30_screen.c
index 40e8b5f..39e64ce 100644
--- a/src/gallium/drivers/nv30/nv30_screen.c
+++ b/src/gallium/drivers/nv30/nv30_screen.c
@@ -113,6 +113,7 @@ nv30_screen_get_param(struct pipe_screen *pscreen, enum pipe_cap param)
    case PIPE_CAP_TEXTURE_BARRIER:
    case PIPE_CAP_SEAMLESS_CUBE_MAP:
    case PIPE_CAP_SEAMLESS_CUBE_MAP_PER_TEXTURE:
+   case PIPE_CAP_CUBE_MAP_ARRAY:
    case PIPE_CAP_VERTEX_COLOR_UNCLAMPED:
    case PIPE_CAP_QUADS_FOLLOW_PROVOKING_VERTEX_CONVENTION:
    case PIPE_CAP_MIXED_COLORBUFFER_FORMATS:
-- 
1.8.1.5
