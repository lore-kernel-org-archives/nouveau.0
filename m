From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH] nouveau: Update some nouveau_class.h definitions
	from renouveau.xml.
Date: Thu,  5 Nov 2009 19:05:42 +0100
Message-ID: <1257444342-21549-1-git-send-email-currojerez@riseup.net>
References: <87y6mkrguh.fsf@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <87y6mkrguh.fsf-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
---
 libdrm/nouveau/nouveau_class.h |   39 +++++++++++++++++++--------------------
 1 files changed, 19 insertions(+), 20 deletions(-)

diff --git a/libdrm/nouveau/nouveau_class.h b/libdrm/nouveau/nouveau_class.h
index c7dda02..fdc3b04 100644
--- a/libdrm/nouveau/nouveau_class.h
+++ b/libdrm/nouveau/nouveau_class.h
@@ -1740,10 +1740,6 @@ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 #define   NV04_DX6_MULTITEX_TRIANGLE_TLMTVERTEX_DRAWPRIMITIVE_I5_MASK			0x00f00000
 
 
-#define NV10_DX5_TEXTURED_TRIANGLE							0x00000094
-
-
-
 #define NV10TCL										0x00000056
 
 #define  NV10TCL_NOP									0x00000100
@@ -2702,10 +2698,10 @@ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 #define  NV10TCL_LIGHT_MODEL_FRONT_SIDE_PRODUCT_AMBIENT_PLUS_EMISSION_R			0x000006c4
 #define  NV10TCL_LIGHT_MODEL_FRONT_SIDE_PRODUCT_AMBIENT_PLUS_EMISSION_G			0x000006c8
 #define  NV10TCL_LIGHT_MODEL_FRONT_SIDE_PRODUCT_AMBIENT_PLUS_EMISSION_B			0x000006cc
-#define  NV10TCL_VIEWPORT_SCALE_X							0x000006e8
-#define  NV10TCL_VIEWPORT_SCALE_Y							0x000006ec
-#define  NV10TCL_VIEWPORT_SCALE_Z							0x000006f0
-#define  NV10TCL_VIEWPORT_SCALE_W							0x000006f4
+#define  NV10TCL_VIEWPORT_TRANSLATE_X							0x000006e8
+#define  NV10TCL_VIEWPORT_TRANSLATE_Y							0x000006ec
+#define  NV10TCL_VIEWPORT_TRANSLATE_Z							0x000006f0
+#define  NV10TCL_VIEWPORT_TRANSLATE_W							0x000006f4
 #define  NV10TCL_POINT_PARAMETER(x)							(0x000006f8+((x)*4))
 #define  NV10TCL_POINT_PARAMETER__SIZE							0x00000008
 #define  NV10TCL_LIGHT_FRONT_SIDE_PRODUCT_AMBIENT_R(x)					(0x00000800+((x)*128))
@@ -2854,16 +2850,19 @@ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 #define  NV10TCL_VERTEX_WGH_1F								0x00000ce4
 #define  NV10TCL_EDGEFLAG_ENABLE							0x00000cec
 #define  NV10TCL_VERTEX_ARRAY_VALIDATE							0x00000cf0
-#define  NV10TCL_VERTEX_ARRAY_ATTRIB_OFFSET(x)						(0x00000d00+((x)*8))
-#define  NV10TCL_VERTEX_ARRAY_ATTRIB_OFFSET__SIZE					0x00000008
-#define  NV10TCL_VERTEX_ARRAY_ATTRIB_FORMAT(x)						(0x00000d04+((x)*8))
-#define  NV10TCL_VERTEX_ARRAY_ATTRIB_FORMAT__SIZE					0x00000008
-#define   NV10TCL_VERTEX_ARRAY_ATTRIB_FORMAT_TYPE_SHIFT					0
-#define   NV10TCL_VERTEX_ARRAY_ATTRIB_FORMAT_TYPE_MASK					0x0000000f
-#define   NV10TCL_VERTEX_ARRAY_ATTRIB_FORMAT_FIELDS_SHIFT				4
-#define   NV10TCL_VERTEX_ARRAY_ATTRIB_FORMAT_FIELDS_MASK				0x000000f0
-#define   NV10TCL_VERTEX_ARRAY_ATTRIB_FORMAT_STRIDE_SHIFT				8
-#define   NV10TCL_VERTEX_ARRAY_ATTRIB_FORMAT_STRIDE_MASK				0x0000ff00
+#define  NV10TCL_VTXBUF_ADDRESS(x)							(0x00000d00+((x)*8))
+#define  NV10TCL_VTXBUF_ADDRESS__SIZE							0x00000008
+#define  NV10TCL_VTXFMT(x)								(0x00000d04+((x)*8))
+#define  NV10TCL_VTXFMT__SIZE								0x00000008
+#define   NV10TCL_VTXFMT_TYPE_SHIFT							0
+#define   NV10TCL_VTXFMT_TYPE_MASK							0x0000000f
+#define    NV10TCL_VTXFMT_TYPE_UBYTE							0x00000000
+#define    NV10TCL_VTXFMT_TYPE_USHORT							0x00000001
+#define    NV10TCL_VTXFMT_TYPE_FLOAT							0x00000002
+#define   NV10TCL_VTXFMT_FIELDS_SHIFT							4
+#define   NV10TCL_VTXFMT_FIELDS_MASK							0x000000f0
+#define   NV10TCL_VTXFMT_STRIDE_SHIFT							8
+#define   NV10TCL_VTXFMT_STRIDE_MASK							0x0000ff00
 #define  NV10TCL_VERTEX_ARRAY_OFFSET_POS						0x00000d00
 #define  NV10TCL_VERTEX_ARRAY_FORMAT_POS						0x00000d04
 #define   NV10TCL_VERTEX_ARRAY_FORMAT_POS_TYPE_SHIFT					0
@@ -3263,11 +3262,11 @@ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 
 
-#define NV10_DX5_TEXTURE_TRIANGLE							0x00000094
+#define NV10_DX5_TEXTURED_TRIANGLE							0x00000094
 
 
 
-#define NV10_DX6_MULTI_TEXTURE_TRIANGLE							0x00000095
+#define NV10_DX6_MULTITEX_TRIANGLE							0x00000095
 
 
 
-- 
1.6.4.4
