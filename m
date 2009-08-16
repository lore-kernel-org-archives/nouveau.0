From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/4] gallium: do not rely on the automatic values
	of an enum for bitmask purposes
Date: Sun, 16 Aug 2009 04:14:19 +0200
Message-ID: <1250388860-11109-3-git-send-email-madman2003@gmail.com>
References: <1250388860-11109-1-git-send-email-madman2003@gmail.com>
	<1250388860-11109-2-git-send-email-madman2003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1250388860-11109-2-git-send-email-madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

- PIPE_TRANSFER_READ ended up being defined as 0, which is obviously fail.
---
 src/gallium/include/pipe/p_defines.h |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/src/gallium/include/pipe/p_defines.h b/src/gallium/include/pipe/p_defines.h
index bc4bc70..9d47584 100644
--- a/src/gallium/include/pipe/p_defines.h
+++ b/src/gallium/include/pipe/p_defines.h
@@ -191,9 +191,9 @@ enum pipe_texture_target {
  * Transfer object usage flags
  */
 enum pipe_transfer_usage {
-   PIPE_TRANSFER_READ,
-   PIPE_TRANSFER_WRITE,
-   PIPE_TRANSFER_READ_WRITE  /**< Read/modify/write */
+   PIPE_TRANSFER_READ = 1,
+   PIPE_TRANSFER_WRITE = 2,
+   PIPE_TRANSFER_READ_WRITE = 3  /**< Read/modify/write */
 };
 
 
-- 
1.6.4
