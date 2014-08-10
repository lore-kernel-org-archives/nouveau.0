From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 2/4] exa/nv10: use color 0 when the pict format
	has no RGB component
Date: Sun, 10 Aug 2014 02:25:13 -0400
Message-ID: <1407651915-7500-2-git-send-email-imirkin@alum.mit.edu>
References: <1407651915-7500-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1407651915-7500-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---
 src/nv10_exa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/nv10_exa.c b/src/nv10_exa.c
index df2f561..47cf0ef 100644
--- a/src/nv10_exa.c
+++ b/src/nv10_exa.c
@@ -520,7 +520,7 @@ setup_picture(NVPtr pNv, PicturePtr pict, PixmapPtr pixmap, int unit,
 	if (pict && PICT_FORMAT_RGB(pict->format))
 		*color = RCSEL_COLOR | source;
 	else
-		*color = RCSEL_ALPHA | RCINP_ZERO;
+		*color = RCSEL_COLOR | RCINP_ZERO;
 
 	if (pict && PICT_FORMAT_A(pict->format))
 		*alpha = RCSEL_ALPHA | source;
-- 
1.8.5.5
