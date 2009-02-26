From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] exa: turn WaitMarker into a NOP.
Date: Thu, 26 Feb 2009 21:55:22 +0100
Message-ID: <1235681723-11180-1-git-send-email-madman2003@gmail.com>
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

- map should handle this.
---
 src/nouveau_exa.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/src/nouveau_exa.c b/src/nouveau_exa.c
index b656ca7..20ad380 100644
--- a/src/nouveau_exa.c
+++ b/src/nouveau_exa.c
@@ -259,7 +259,7 @@ nouveau_exa_mark_sync(ScreenPtr pScreen)
 static void
 nouveau_exa_wait_marker(ScreenPtr pScreen, int marker)
 {
-	NVSync(xf86Screens[pScreen->myNum]);
+	return;
 }
 
 static Bool
-- 
1.6.1.3
