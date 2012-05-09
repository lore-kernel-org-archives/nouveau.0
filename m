From: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
Subject: [PATCH 3/4] nv30: Silence pipe_cap warnings
Date: Thu, 10 May 2012 00:06:32 +0200
Message-ID: <1336601193-19147-4-git-send-email-r.spliet@student.tudelft.nl>
References: <1336601193-19147-1-git-send-email-r.spliet@student.tudelft.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1336601193-19147-1-git-send-email-r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Nouveau mailinglist <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Signed-off-by: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
---
 src/gallium/drivers/nv30/nv30_screen.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/src/gallium/drivers/nv30/nv30_screen.c b/src/gallium/drivers/nv30/nv30_screen.c
index d355f74..26e41c2 100644
--- a/src/gallium/drivers/nv30/nv30_screen.c
+++ b/src/gallium/drivers/nv30/nv30_screen.c
@@ -111,6 +111,10 @@ nv30_screen_get_param(struct pipe_screen *pscreen, enum pipe_cap param)
    case PIPE_CAP_QUADS_FOLLOW_PROVOKING_VERTEX_CONVENTION:
    case PIPE_CAP_MIXED_COLORBUFFER_FORMATS:
       return 0;
+   case PIPE_CAP_VERTEX_BUFFER_OFFSET_4BYTE_ALIGNED_ONLY:
+   case PIPE_CAP_VERTEX_BUFFER_STRIDE_4BYTE_ALIGNED_ONLY:
+   case PIPE_CAP_VERTEX_ELEMENT_SRC_OFFSET_4BYTE_ALIGNED_ONLY:
+      return 1;
    default:
       debug_printf("unknown param %d\n", param);
       return 0;
-- 
1.7.7.6
