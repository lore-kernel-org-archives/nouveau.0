From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 1/4] exa/nv10: use same clip settings as mesa
	driver
Date: Sun, 10 Aug 2014 02:25:12 -0400
Message-ID: <1407651915-7500-1-git-send-email-imirkin@alum.mit.edu>
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
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

The higher 0x800 was getting overwritten by the 0x7ff anyways, so it
wasn't doing any good. The mesa driver just uses 0x800 for the low
portion and doesn't set the 8 bit in the higher portion, so do the same
thing here.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---
 src/nv10_exa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/nv10_exa.c b/src/nv10_exa.c
index cb9eb7c..df2f561 100644
--- a/src/nv10_exa.c
+++ b/src/nv10_exa.c
@@ -686,9 +686,9 @@ NVAccelInitNV10TCL(ScrnInfoPtr pScrn)
 	PUSH_DATA (push, 0);
 
 	BEGIN_NV04(push, NV10_3D(VIEWPORT_CLIP_HORIZ(0)), 1);
-	PUSH_DATA (push, 0x7ff << 16 | 0x800800);
+	PUSH_DATA (push, 0x7ff << 16 | 0x800);
 	BEGIN_NV04(push, NV10_3D(VIEWPORT_CLIP_VERT(0)), 1);
-	PUSH_DATA (push, 0x7ff << 16 | 0x800800);
+	PUSH_DATA (push, 0x7ff << 16 | 0x800);
 
 	for (i = 1; i < 8; i++) {
 		BEGIN_NV04(push, NV10_3D(VIEWPORT_CLIP_HORIZ(i)), 1);
-- 
1.8.5.5
