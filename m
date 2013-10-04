From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 2/2] mesa/st: disable ARB_framebuffer_object when
	no driver support.
Date: Fri,  4 Oct 2013 04:32:16 -0400
Message-ID: <1380875536-7271-2-git-send-email-imirkin@alum.mit.edu>
References: <1380875536-7271-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org>
In-Reply-To: <1380875536-7271-1-git-send-email-imirkin@alum.mit.edu>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
Errors-To: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
To: Christoph Bumiller <e0425955@student.tuwien.ac.at>, Ben Skeggs <bskeggs@redhat.com>
Cc: mesa-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

When PIPE_CAP_MIXED_FRAMEBUFFER_SIZES is not provided, parts of
ARB_framebuffer_object can't be supported, such as on NV30.

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---
 src/mesa/state_tracker/st_extensions.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/src/mesa/state_tracker/st_extensions.c b/src/mesa/state_tracker/st_extensions.c
index 97dd732..0df914d 100644
--- a/src/mesa/state_tracker/st_extensions.c
+++ b/src/mesa/state_tracker/st_extensions.c
@@ -444,8 +444,7 @@ void st_init_extensions(struct st_context *st)
         { PIPE_FORMAT_Z32_FLOAT,
           PIPE_FORMAT_Z32_FLOAT_S8X24_UINT } },
 
-      { { o(ARB_framebuffer_object),
-          o(EXT_packed_depth_stencil) },
+      { { o(EXT_packed_depth_stencil) },
         { PIPE_FORMAT_S8_UINT_Z24_UNORM,
           PIPE_FORMAT_Z24_UNORM_S8_UINT },
         GL_TRUE }, /* at least one format must be supported */
@@ -759,6 +758,10 @@ void st_init_extensions(struct st_context *st)
                              PIPE_BUFFER, PIPE_BIND_SAMPLER_VIEW);
    }
 
+   if (screen->get_param(screen, PIPE_CAP_MIXED_FRAMEBUFFER_SIZES) &&
+       ctx->Extensions.EXT_packed_depth_stencil) {
+      ctx->Extensions.ARB_framebuffer_object = GL_TRUE;
+   }
 
    /* Unpacking a varying in the fragment shader costs 1 texture indirection.
     * If the number of available texture indirections is very limited, then we
-- 
1.8.1.5
