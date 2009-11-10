From: "Peter Hjalmarsson" <xake-ca8b1Tj3MiseIZ0/mPfg9Q@public.gmane.org>
Subject: [PATCH] Add missing include
Date: Tue, 10 Nov 2009 23:00:00 +0100
Message-ID: <1257890400-31344-1-git-send-email-xake@rymdraket.net>
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
Cc: Peter Hjalmarsson <xake-ca8b1Tj3MiseIZ0/mPfg9Q@public.gmane.org>
List-Id: nouveau.vger.kernel.org

fixes the following warning:
nv30_fragprog.c:710: warning: implicit declaration of function 'tgsi_dump'
---
 src/gallium/drivers/nv30/nv30_fragprog.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/src/gallium/drivers/nv30/nv30_fragprog.c b/src/gallium/drivers/nv30/nv30_fragprog.c
index cc03854..b42a7be 100644
--- a/src/gallium/drivers/nv30/nv30_fragprog.c
+++ b/src/gallium/drivers/nv30/nv30_fragprog.c
@@ -4,6 +4,7 @@
 #include "pipe/p_inlines.h"
 
 #include "pipe/p_shader_tokens.h"
+#include "tgsi/tgsi_dump.h"
 #include "tgsi/tgsi_parse.h"
 #include "tgsi/tgsi_util.h"
 
-- 
1.6.5.2
