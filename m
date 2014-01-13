From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [RFC PATCH 18/19] nv50: report glsl 1.50 now that gp
	tests pass
Date: Mon, 13 Jan 2014 14:19:34 -0500
Message-ID: <1389640775-25046-19-git-send-email-imirkin@alum.mit.edu>
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

There are still some things that fail -- mostly gl_Layer stuff, and also using
gl_PositionID without a gp.

 src/gallium/drivers/nouveau/nv50/nv50_screen.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/gallium/drivers/nouveau/nv50/nv50_screen.c b/src/gallium/drivers/nouveau/nv50/nv50_screen.c
index 5732b21..123bdab 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_screen.c
@@ -126,7 +126,7 @@ nv50_screen_get_param(struct pipe_screen *pscreen, enum pipe_cap param)
    case PIPE_CAP_SM3:
       return 1;
    case PIPE_CAP_GLSL_FEATURE_LEVEL:
-      return 140;
+      return 150;
    case PIPE_CAP_MAX_RENDER_TARGETS:
       return 8;
    case PIPE_CAP_MAX_DUAL_SOURCE_RENDER_TARGETS:
-- 
1.8.3.2
