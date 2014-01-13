From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [RFC PATCH 19/19] nv50: enable seamless cube maps on all
	hw for OpenGL 3.2
Date: Mon, 13 Jan 2014 14:19:35 -0500
Message-ID: <1389640775-25046-20-git-send-email-imirkin@alum.mit.edu>
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

Some of the hardware support is missing. The NVIDIA-provided driver,
which claims 3.3 support fails a slew of the relevant tests as well.
This allows us to expose geometry shaders without doing the additional
work involved in supporting ARB_geometry_shader4.

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---

 src/gallium/drivers/nouveau/nv50/nv50_screen.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/gallium/drivers/nouveau/nv50/nv50_screen.c b/src/gallium/drivers/nouveau/nv50/nv50_screen.c
index 123bdab..a108ece 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_screen.c
@@ -111,7 +111,7 @@ nv50_screen_get_param(struct pipe_screen *pscreen, enum pipe_cap param)
    case PIPE_CAP_MAX_TEXTURE_BUFFER_SIZE:
       return 65536;
    case PIPE_CAP_SEAMLESS_CUBE_MAP:
-      return nv50_screen(pscreen)->tesla->oclass >= NVA0_3D_CLASS;
+      return 1; //nv50_screen(pscreen)->tesla->oclass >= NVA0_3D_CLASS;
    case PIPE_CAP_SEAMLESS_CUBE_MAP_PER_TEXTURE:
       return 0;
    case PIPE_CAP_CUBE_MAP_ARRAY:
-- 
1.8.3.2
