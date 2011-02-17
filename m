From: Francesco Marella <francesco.marella-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/3] Page flipping man page update
Date: Thu, 17 Feb 2011 03:47:46 +0100
Message-ID: <1297910872.31321.3.camel@ginzen>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau ML <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Signed-off-by: Francesco Marella <fmarl-XtQPfPCVGG7srOwW+9ziJQ@public.gmane.org>
---
 man/nouveau.man |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/man/nouveau.man b/man/nouveau.man
index 39de690..dd9d938 100644
--- a/man/nouveau.man
+++ b/man/nouveau.man
@@ -90,6 +90,9 @@ For example:
 .B
 Option \*qZaphodHeads\*q \*qLVDS,VGA-0\*q
 will assign xrandr outputs LVDS and VGA-0 to this instance of the driver.
+.TP
+.BI "Option \*qPageFlip\*q \*q" boolean \*q
+Enable DRI2 page flipping. Default: on.
 .SH "SEE ALSO"
 __xservername__(__appmansuffix__), __xconfigfile__(__filemansuffix__), Xserver(__appmansuffix__), X(__miscmansuffix__)
 .SH AUTHORS
-- 
1.7.4
