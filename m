From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 2/2] drm/nouveau/abi16: fix handles past the 32nd
	one
Date: Sun,  9 Feb 2014 15:51:25 -0500
Message-ID: <1391979085-8012-2-git-send-email-imirkin@alum.mit.edu>
References: <1391979085-8012-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1391979085-8012-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

abi16->handles is a u64, so make sure to use 1ULL << val when modifying.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---

Noticed this when doing the previous patch. I'm not sure whether this affects
64-bit builds or not, didn't care to look at the assembly or check the
standard.

 drivers/gpu/drm/nouveau/nouveau_abi16.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index b701117..66abf4d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -139,7 +139,7 @@ nouveau_abi16_chan_fini(struct nouveau_abi16 *abi16,
 
 	/* destroy channel object, all children will be killed too */
 	if (chan->chan) {
-		abi16->handles &= ~(1 << (chan->chan->handle & 0xffff));
+		abi16->handles &= ~(1ULL << (chan->chan->handle & 0xffff));
 		nouveau_channel_del(&chan->chan);
 	}
 
@@ -280,7 +280,7 @@ nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
 
 	INIT_LIST_HEAD(&chan->notifiers);
 	list_add(&chan->head, &abi16->channels);
-	abi16->handles |= (1 << init->channel);
+	abi16->handles |= (1ULL << init->channel);
 
 	/* create channel object and initialise dma and fence management */
 	ret = nouveau_channel_new(drm, cli, NVDRM_DEVICE, NVDRM_CHAN |
-- 
1.8.3.2
