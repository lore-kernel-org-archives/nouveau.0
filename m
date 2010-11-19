From: Jesse Adkins <jesserayadkins-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH nouveau] Don't install libtool .la files (#4898)
Date: Fri, 19 Nov 2010 15:03:10 -0800
Message-ID: <1290207790-7814-1-git-send-email-jesserayadkins@gmail.com>
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Jesse Adkins <jesserayadkins-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Makefile.am |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/Makefile.am b/Makefile.am
index 011c574..85600ff 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -28,3 +28,7 @@ CLEANFILES = ChangeLog
 ChangeLog: FORCE
 	git log > ChangeLog
 FORCE:
+
+# We don't want libtool's .la, so remove it.
+install-data-hook:
+	rm -f $(moduledir)/nouveau_drv.la
-- 
1.7.1
