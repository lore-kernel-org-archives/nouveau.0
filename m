From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: [PATCH] nv40: add support for ARB_half_float_vertex
Date: Mon, 18 Jan 2010 17:40:45 +0100
Message-ID: <1263832845-31116-1-git-send-email-luca@luca-barbieri.com>
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
To: mesa3d-dev-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This requires the arb_half_float_vertex Mesa branch, plus some unreleased
gallium support work by Dave Airlie.

You may need to fix an assertion in st_pipe_vertex_format too.
---
 src/gallium/drivers/nv40/nv40_vbo.c |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/src/gallium/drivers/nv40/nv40_vbo.c b/src/gallium/drivers/nv40/nv40_vbo.c
index e85d6b4..211f3bd 100644
--- a/src/gallium/drivers/nv40/nv40_vbo.c
+++ b/src/gallium/drivers/nv40/nv40_vbo.c
@@ -11,6 +11,10 @@
 
 #define FORCE_SWTNL 0
 
+#ifndef NV40TCL_VTXFMT_TYPE_HALF
+#define NV40TCL_VTXFMT_TYPE_HALF 3
+#endif
+
 static INLINE int
 nv40_vbo_format_to_hw(enum pipe_format pipe, unsigned *fmt, unsigned *ncomp)
 {
@@ -21,6 +25,12 @@ nv40_vbo_format_to_hw(enum pipe_format pipe, unsigned *fmt, unsigned *ncomp)
 	case PIPE_FORMAT_R32G32B32A32_FLOAT:
 		*fmt = NV40TCL_VTXFMT_TYPE_FLOAT;
 		break;
+	case PIPE_FORMAT_R16X16_FLOAT:
+	case PIPE_FORMAT_R16G16_FLOAT:
+	case PIPE_FORMAT_R16G16B16X16_FLOAT:
+	case PIPE_FORMAT_R16G16B16A16_FLOAT:
+		*fmt = NV40TCL_VTXFMT_TYPE_HALF;
+		break;
 	case PIPE_FORMAT_R8_UNORM:
 	case PIPE_FORMAT_R8G8_UNORM:
 	case PIPE_FORMAT_R8G8B8_UNORM:
@@ -41,21 +51,25 @@ nv40_vbo_format_to_hw(enum pipe_format pipe, unsigned *fmt, unsigned *ncomp)
 	switch (pipe) {
 	case PIPE_FORMAT_R8_UNORM:
 	case PIPE_FORMAT_R32_FLOAT:
+	case PIPE_FORMAT_R16X16_FLOAT:
 	case PIPE_FORMAT_R16_SSCALED:
 		*ncomp = 1;
 		break;
 	case PIPE_FORMAT_R8G8_UNORM:
 	case PIPE_FORMAT_R32G32_FLOAT:
+	case PIPE_FORMAT_R16G16_FLOAT:
 	case PIPE_FORMAT_R16G16_SSCALED:
 		*ncomp = 2;
 		break;
 	case PIPE_FORMAT_R8G8B8_UNORM:
 	case PIPE_FORMAT_R32G32B32_FLOAT:
+	case PIPE_FORMAT_R16G16B16X16_FLOAT:
 	case PIPE_FORMAT_R16G16B16_SSCALED:
 		*ncomp = 3;
 		break;
 	case PIPE_FORMAT_R8G8B8A8_UNORM:
 	case PIPE_FORMAT_R32G32B32A32_FLOAT:
+	case PIPE_FORMAT_R16G16B16A16_FLOAT:
 	case PIPE_FORMAT_R16G16B16A16_SSCALED:
 		*ncomp = 4;
 		break;
-- 
1.6.3.3
