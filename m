From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 1/2] man page: Fix the supported fb depths.
Date: Mon, 24 Aug 2009 16:03:57 +0200
Message-ID: <1251122638-17936-1-git-send-email-currojerez@riseup.net>
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
 man/nouveau.man |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/man/nouveau.man b/man/nouveau.man
index 87f645a..5c4e4ae 100644
--- a/man/nouveau.man
+++ b/man/nouveau.man
@@ -13,9 +13,10 @@ nouveau \- NVIDIA video driver
 .fi
 .SH DESCRIPTION
 .B nouveau
-is an __xservername__ driver for NVIDIA video cards.  The driver supports 2D 
-acceleration and provides support for the following framebuffer depths:
-(15,) 16  and 24.  TrueColor visuals are supported for these depths.
+is an __xservername__ driver for NVIDIA video cards.  The driver
+supports 2D acceleration and provides support for the following
+framebuffer depths: 16, 24 and 30.  TrueColor visuals are supported
+for these depths.
 
 .SH SUPPORTED HARDWARE
 The
-- 
1.6.3.3
