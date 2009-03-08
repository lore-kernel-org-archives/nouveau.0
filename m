From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 5/5] nv50: inline linear wfb functions
Date: Sun,  8 Mar 2009 15:31:54 +0100
Message-ID: <1236522714-11553-5-git-send-email-madman2003@gmail.com>
References: <1236522714-11553-1-git-send-email-madman2003@gmail.com>
	<1236522714-11553-2-git-send-email-madman2003@gmail.com>
	<1236522714-11553-3-git-send-email-madman2003@gmail.com>
	<1236522714-11553-4-git-send-email-madman2003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1236522714-11553-4-git-send-email-madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

---
 src/nouveau_exa.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/nouveau_exa.c b/src/nouveau_exa.c
index 2d748e1..4b82d21 100644
--- a/src/nouveau_exa.c
+++ b/src/nouveau_exa.c
@@ -687,7 +687,7 @@ nouveau_exa_init(ScreenPtr pScreen)
 
 /* WFB functions. */
 
-static FbBits
+static inline FbBits
 nouveau_exa_wfb_read_memory_linear(const void *src, int size)
 {
 	FbBits bits = 0;
@@ -697,7 +697,7 @@ nouveau_exa_wfb_read_memory_linear(const void *src, int size)
 	return bits;
 }
 
-static void
+static inline void
 nouveau_exa_wfb_write_memory_linear(void *dst, FbBits value, int size)
 {
 	memcpy(dst, &value, size);
-- 
1.6.2
