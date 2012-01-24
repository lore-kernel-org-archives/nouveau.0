From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: [PATCH] nvfx: fix nv3x fallout from state validation
	changes
Date: Tue, 24 Jan 2012 09:54:31 +0100
Message-ID: <1327395271.4520.2.camel@antimon>
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
To: Patrice Mandin <mandin.patrice-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org>, Marek =?UTF-8?Q?Ol=C5=A1=C3=A1k?= <maraeo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Nouveau Dev List <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

From c998f732d42da5e962fe5da294493132c3e8dc5f Mon Sep 17 00:00:00 2001
From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Date: Tue, 24 Jan 2012 09:46:32 +0100
Subject: [PATCH] nvfx: fix nv3x fallout from state validation changes

Apparently nv3x needs some curde hacks to work properly. This
is clearly not the right fix, but it's the behaviour of the old
code and fixes regressions seen by users.
---
 src/gallium/drivers/nvfx/nvfx_state_emit.c |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/src/gallium/drivers/nvfx/nvfx_state_emit.c b/src/gallium/drivers/nvfx/nvfx_state_emit.c
index a959015..60ed2d0 100644
--- a/src/gallium/drivers/nvfx/nvfx_state_emit.c
+++ b/src/gallium/drivers/nvfx/nvfx_state_emit.c
@@ -244,6 +244,9 @@ nvfx_state_validate_common(struct nvfx_context *nvfx)
 	}
 
 	if(dirty & NVFX_NEW_SAMPLER) {
+		/* XXX: we take the big hammer here, I have no idea why this is needed
+		   to make this work properly */
+		nvfx->dirty &= ~NVFX_NEW_SAMPLER;
 		nvfx_fragtex_validate(nvfx);
 
 		// TODO: only set this if really necessary
@@ -303,7 +306,8 @@ nvfx_state_validate_common(struct nvfx_context *nvfx)
 	if(dirty & NVFX_NEW_SR)
 		nvfx_state_sr_validate(nvfx);
 
-	if(dirty & NVFX_NEW_VIEWPORT)
+	/* XXX: nv3x needs viewport revalidation after RAST or ZSA change */
+	if(dirty & (NVFX_NEW_VIEWPORT | NVFX_NEW_RAST | NVFX_NEW_ZSA))
 	{
 		nvfx_state_viewport_validate(nvfx);
 	}
-- 
1.7.7.6
