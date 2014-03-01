From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH] nv50,nvc0: add 11f_11f_10f vertex support
Date: Fri, 28 Feb 2014 22:33:58 -0500
Message-ID: <1393644838-15959-1-git-send-email-imirkin@alum.mit.edu>
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
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---

Tested on nv96 with Chris Forbes's piglit tests (on list, but not checked in
yet)... only assuming about nvc0, but it seems reasonable since all the other
attributes are the same.

 docs/GL3.txt                                    | 2 +-
 src/gallium/drivers/nouveau/nv50/nv50_3d.xml.h  | 1 +
 src/gallium/drivers/nouveau/nv50/nv50_formats.c | 2 +-
 src/gallium/drivers/nouveau/nvc0/nvc0_3d.xml.h  | 1 +
 4 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/docs/GL3.txt b/docs/GL3.txt
index 755a89c..9738ffc 100644
--- a/docs/GL3.txt
+++ b/docs/GL3.txt
@@ -177,7 +177,7 @@ GL 4.4:
   GL_ARB_query_buffer_object                           not started
   GL_ARB_texture_mirror_clamp_to_edge                  DONE (i965, nv30, nv50, nvc0, r300, r600, radeonsi, swrast)
   GL_ARB_texture_stencil8                              not started
-  GL_ARB_vertex_type_10f_11f_11f_rev                   DONE (i965, r600)
+  GL_ARB_vertex_type_10f_11f_11f_rev                   DONE (i965, nv50, nvc0, r600)
 
 
 More info about these features and the work involved can be found at
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_3d.xml.h b/src/gallium/drivers/nouveau/nv50/nv50_3d.xml.h
index 9dff8b2..cc3a382 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_3d.xml.h
+++ b/src/gallium/drivers/nouveau/nv50/nv50_3d.xml.h
@@ -1962,6 +1962,7 @@ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 #define NV50_3D_VERTEX_ARRAY_ATTRIB_FORMAT_16			0x00d80000
 #define NV50_3D_VERTEX_ARRAY_ATTRIB_FORMAT_8			0x00e80000
 #define NV50_3D_VERTEX_ARRAY_ATTRIB_FORMAT_10_10_10_2		0x01800000
+#define NV50_3D_VERTEX_ARRAY_ATTRIB_FORMAT_11_11_10		0x01880000
 #define NV50_3D_VERTEX_ARRAY_ATTRIB_TYPE__MASK			0x7e000000
 #define NV50_3D_VERTEX_ARRAY_ATTRIB_TYPE__SHIFT			25
 #define NV50_3D_VERTEX_ARRAY_ATTRIB_TYPE_FLOAT			0x7e000000
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_formats.c b/src/gallium/drivers/nouveau/nv50/nv50_formats.c
index c7c5975..fa93ce8 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_formats.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_formats.c
@@ -204,7 +204,7 @@ const struct nv50_format nv50_format_table[PIPE_FORMAT_COUNT] =
    C4A(R10G10B10A2_UINT, RGB10_A2_UINT, C0, C1, C2, C3, UINT, 10_10_10_2, TRV, 0),
    C4A(B10G10R10A2_UINT, RGB10_A2_UINT, C2, C1, C0, C3, UINT, 10_10_10_2, TV, 0),
 
-   F3B(R11G11B10_FLOAT, R11G11B10_FLOAT, C0, C1, C2, xx, FLOAT, 11_11_10, IB),
+   F3A(R11G11B10_FLOAT, R11G11B10_FLOAT, C0, C1, C2, xx, FLOAT, 11_11_10, IBV),
 
    F3B(L8_UNORM, R8_UNORM, C0, C0, C0, xx, UNORM, 8, TB),
    F3B(L8_SRGB, R8_UNORM, C0, C0, C0, xx, UNORM, 8, TB),
diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_3d.xml.h b/src/gallium/drivers/nouveau/nvc0/nvc0_3d.xml.h
index d3f719d..1862e70 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_3d.xml.h
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_3d.xml.h
@@ -467,6 +467,7 @@ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 #define NVC0_3D_VERTEX_ATTRIB_FORMAT_SIZE_16			0x03600000
 #define NVC0_3D_VERTEX_ATTRIB_FORMAT_SIZE_8			0x03a00000
 #define NVC0_3D_VERTEX_ATTRIB_FORMAT_SIZE_10_10_10_2		0x06000000
+#define NVC0_3D_VERTEX_ATTRIB_FORMAT_SIZE_11_11_10   		0x06200000
 #define NVC0_3D_VERTEX_ATTRIB_FORMAT_TYPE__MASK			0x38000000
 #define NVC0_3D_VERTEX_ATTRIB_FORMAT_TYPE__SHIFT		27
 #define NVC0_3D_VERTEX_ATTRIB_FORMAT_TYPE_SNORM			0x08000000
-- 
1.8.3.2
