From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [envytools PATCH] nv50/pgraph: DATA_ERROR 0x24
Date: Sun, 6 May 2012 20:51:03 +0200
Message-ID: <20120506185103.GA4311@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
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


---
 rnndb/nv50_pgraph.xml |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/rnndb/nv50_pgraph.xml b/rnndb/nv50_pgraph.xml
index 92d69ea..6499631 100644
--- a/rnndb/nv50_pgraph.xml
+++ b/rnndb/nv50_pgraph.xml
@@ -93,6 +93,9 @@
 	<value value="0x23" name="XY_OUT_OF_BOUNDS"> <!-- m2mf at least. 2d too? -->
 		<brief>Your x/y coords exceed the size of your surface.</brief>
 	</value>
+	<value value="0x24" name="VP_NO_INPUT_MASK">
+		<brief>You tried to submit vertices without setting input mask (VP_ATTR_EN).</brief>
+	</value>
 	<value value="0x27" name="CP_MORE_PARAMS_THAN_SHARED">
 		<brief>You tried to launch block with more params than allocated s[] space.</brief>
 	</value>
-- 
1.7.8.5
