From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [libdrm PATCH] nouveau: disable flush_notify on
	channel_free
Date: Tue, 12 Jan 2010 15:38:29 +0100
Message-ID: <20100112143829.GD2984@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
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

From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [libdrm PATCH] nouveau: disable flush_notify on channel_free

We don't want do call flush_notify when we will FIRE the RING
a couple of lines later, because grobj bound to this channel
might be already freed.
---
 nouveau/nouveau_channel.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/nouveau/nouveau_channel.c b/nouveau/nouveau_channel.c
index 14cf4c6..01d6681 100644
--- a/nouveau/nouveau_channel.c
+++ b/nouveau/nouveau_channel.c
@@ -107,6 +107,7 @@ nouveau_channel_free(struct nouveau_channel **chan)
 	if (!chan || !*chan)
 		return;
 	nvchan = nouveau_channel(*chan);
+	(*chan)->flush_notify = NULL;
 	*chan = NULL;
 	nvdev = nouveau_device(nvchan->base.device);
 
-- 
1.6.6.rc3
