From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 2/2] docs: mark ARB_texture_gather as done on nvc0
Date: Fri,  4 Apr 2014 01:35:47 -0400
Message-ID: <1396589747-17988-2-git-send-email-imirkin@alum.mit.edu>
References: <1396589747-17988-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1396589747-17988-1-git-send-email-imirkin@alum.mit.edu>
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
List-Id: nouveau.vger.kernel.org

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---
 docs/GL3.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/GL3.txt b/docs/GL3.txt
index d9cc708..bf51e3a 100644
--- a/docs/GL3.txt
+++ b/docs/GL3.txt
@@ -107,7 +107,7 @@ GL 4.0:
   GL_ARB_tessellation_shader                           not started
   GL_ARB_texture_buffer_object_rgb32                   DONE (i965, nvc0, r600, radeonsi, softpipe)
   GL_ARB_texture_cube_map_array                        DONE (i965, nv50, nvc0, r600, softpipe)
-  GL_ARB_texture_gather                                DONE (i965, nv50)
+  GL_ARB_texture_gather                                DONE (i965, nv50, nvc0)
   GL_ARB_transform_feedback2                           DONE (i965, nv50, nvc0, r600, radeonsi)
   GL_ARB_transform_feedback3                           DONE (i965, nv50, nvc0, r600, radeonsi)
 
-- 
1.8.3.2
