From: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
Subject: [PATCH 4/4] nv30: Avoid swizzle|linear FB
Date: Thu, 10 May 2012 00:06:33 +0200
Message-ID: <1336601193-19147-5-git-send-email-r.spliet@student.tudelft.nl>
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
 src/gallium/drivers/nv30/nv30_state_validate.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/src/gallium/drivers/nv30/nv30_state_validate.c b/src/gallium/drivers/nv30/nv30_state_validate.c
index ae7955b..87c1978 100644
--- a/src/gallium/drivers/nv30/nv30_state_validate.c
+++ b/src/gallium/drivers/nv30/nv30_state_validate.c
@@ -95,6 +95,7 @@ nv30_validate_fb(struct nv30_context *nv30)
    if (rt_format & NV30_3D_RT_FORMAT_TYPE_SWIZZLED) {
       rt_format |= util_logbase2(w) << 16;
       rt_format |= util_logbase2(h) << 24;
+      rt_format &= ~NV30_3D_RT_FORMAT_TYPE_LINEAR;
    }
 
    if (!PUSH_SPACE(push, 64))
-- 
1.7.7.6
