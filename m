From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 2/2] xv: speed up YV12 -> NV12 conversion using
	SSE2 if available
Date: Mon, 29 Jul 2013 02:40:39 -0400
Message-ID: <1375080039-22607-2-git-send-email-imirkin@alum.mit.edu>
References: <1375080039-22607-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1375080039-22607-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

memcpy() goes from taking 45% to 66% of total function time, which
translates to a 30% decrease in NVPutImage runtime.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---
 src/nouveau_xv.c | 33 ++++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/src/nouveau_xv.c b/src/nouveau_xv.c
index 567e30c..5569b7c 100644
--- a/src/nouveau_xv.c
+++ b/src/nouveau_xv.c
@@ -25,6 +25,8 @@
 #include "config.h"
 #endif
 
+#include <immintrin.h>
+
 #include "xf86xv.h"
 #include <X11/extensions/Xv.h>
 #include "exa.h"
@@ -532,30 +534,47 @@ NVCopyNV12ColorPlanes(unsigned char *src1, unsigned char *src2,
 
 	w >>= 1;
 	h >>= 1;
+#ifdef __SSE2__
+	l = w >> 3;
+	e = w & 7;
+#else
 	l = w >> 1;
 	e = w & 1;
+#endif
 
 	for (j = 0; j < h; j++) {
 		unsigned char *us = src1;
 		unsigned char *vs = src2;
 		unsigned int *vuvud = (unsigned int *) dst;
+		unsigned short *vud;
 
 		for (i = 0; i < l; i++) {
-#if X_BYTE_ORDER == X_BIG_ENDIAN
+#ifdef __SSE2__
+			_mm_storeu_si128(
+				(void*)vuvud,
+				_mm_unpacklo_epi8(
+					_mm_loadl_epi64((void*)vs),
+					_mm_loadl_epi64((void*)us)));
+			vuvud+=4;
+			us+=8;
+			vs+=8;
+#else /* __SSE2__ */
+#  if X_BYTE_ORDER == X_BIG_ENDIAN
 			*vuvud++ = (vs[0]<<24) | (us[0]<<16) | (vs[1]<<8) | us[1];
-#else
+#  else
 			*vuvud++ = vs[0] | (us[0]<<8) | (vs[1]<<16) | (us[1]<<24);
-#endif
+#  endif
 			us+=2;
 			vs+=2;
+#endif /* __SSE2__ */
 		}
 
-		if (e) {
-			unsigned short *vud = (unsigned short *) vuvud;
+		vud = (unsigned short *)vuvud;
+		for (i = 0; i < e; i++) {
 #if X_BYTE_ORDER == X_BIG_ENDIAN
-			*vud = us[0] | (vs[0]<<8);
+			vud[i] = us[i] | (vs[i]<<8);
 #else
-			*vud = vs[0] | (us[0]<<8);
+			vud[i] = vs[i] | (us[i]<<8);
 #endif
 		}
 
-- 
1.8.1.5
