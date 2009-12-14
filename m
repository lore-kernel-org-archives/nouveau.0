From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH] nouveau: Update some nv1x/nv2x tcl
	nouveau_class.h definitions.
Date: Mon, 14 Dec 2009 19:14:19 +0100
Message-ID: <1260814459-12560-1-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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
 nouveau/nouveau_class.h |   16 ++++++++++++++--
 1 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/nouveau/nouveau_class.h b/nouveau/nouveau_class.h
index 0b8a6f0..c5fe5d7 100644
--- a/nouveau/nouveau_class.h
+++ b/nouveau/nouveau_class.h
@@ -1845,6 +1845,11 @@ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 #define    NV10TCL_TX_FORMAT_WRAP_T_CLAMP						0x50000000
 #define  NV10TCL_TX_ENABLE(x)								(0x00000228+((x)*4))
 #define  NV10TCL_TX_ENABLE__SIZE							0x00000002
+#define   NV10TCL_TX_ENABLE_CULL_SHIFT							0
+#define   NV10TCL_TX_ENABLE_CULL_MASK							0x0000000f
+#define    NV10TCL_TX_ENABLE_CULL_DISABLED						0x00000000
+#define    NV10TCL_TX_ENABLE_CULL_TEST_ALL						0x00000003
+#define    NV10TCL_TX_ENABLE_CULL_TEST_ALPHA						0x00000004
 #define   NV10TCL_TX_ENABLE_ANISOTROPY_SHIFT						4
 #define   NV10TCL_TX_ENABLE_ANISOTROPY_MASK						0x00000030
 #define   NV10TCL_TX_ENABLE_MIPMAP_MAX_LOD_SHIFT					14
@@ -2896,11 +2901,13 @@ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 #define  NV10TCL_VTXBUF_ADDRESS__SIZE							0x00000008
 #define  NV10TCL_VTXFMT(x)								(0x00000d04+((x)*8))
 #define  NV10TCL_VTXFMT__SIZE								0x00000008
+#define   NV10TCL_VTXFMT_POS_HOMOGENEOUS						(1 << 24)
 #define   NV10TCL_VTXFMT_TYPE_SHIFT							0
 #define   NV10TCL_VTXFMT_TYPE_MASK							0x0000000f
-#define    NV10TCL_VTXFMT_TYPE_UBYTE							0x00000000
-#define    NV10TCL_VTXFMT_TYPE_USHORT							0x00000001
+#define    NV10TCL_VTXFMT_TYPE_BYTE_BGRA						0x00000000
+#define    NV10TCL_VTXFMT_TYPE_SHORT							0x00000001
 #define    NV10TCL_VTXFMT_TYPE_FLOAT							0x00000002
+#define    NV10TCL_VTXFMT_TYPE_BYTE_RGBA						0x00000004
 #define   NV10TCL_VTXFMT_FIELDS_SHIFT							4
 #define   NV10TCL_VTXFMT_FIELDS_MASK							0x000000f0
 #define   NV10TCL_VTXFMT_STRIDE_SHIFT							8
@@ -4501,6 +4508,7 @@ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 #define   NV20TCL_VB_ELEMENT_U16_I0_MASK						0x0000ffff
 #define   NV20TCL_VB_ELEMENT_U16_I1_SHIFT						16
 #define   NV20TCL_VB_ELEMENT_U16_I1_MASK						0xffff0000
+#define  NV20TCL_VB_ELEMENT_U32								0x00001808
 #define  NV20TCL_VB_VERTEX_BATCH							0x00001810
 #define   NV20TCL_VB_VERTEX_BATCH_OFFSET_SHIFT						0
 #define   NV20TCL_VB_VERTEX_BATCH_OFFSET_MASK						0x00ffffff
@@ -4846,6 +4854,10 @@ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 #define  NV17TCL_LMA_DEPTH_BUFFER_OFFSET						0x00000d60
 #define  NV17TCL_LMA_DEPTH_FILL_VALUE							0x00000d68
 #define  NV17TCL_LMA_DEPTH_BUFFER_CLEAR							0x00000d6c
+#define  NV17TCL_LMA_DEPTH_WINDOW_X							0x00001638
+#define  NV17TCL_LMA_DEPTH_WINDOW_Y							0x0000163c
+#define  NV17TCL_LMA_DEPTH_WINDOW_Z							0x00001640
+#define  NV17TCL_LMA_DEPTH_WINDOW_W							0x00001644
 #define  NV17TCL_LMA_DEPTH_ENABLE							0x00001658
 
 
-- 
1.6.4.4
