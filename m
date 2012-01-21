From: Maxim Levitsky <maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/4] nv50: major bits of power saving
Date: Sun, 22 Jan 2012 00:14:24 +0200
Message-ID: <1327184067-25936-2-git-send-email-maximlevitsky@gmail.com>
References: <1327184067-25936-1-git-send-email-maximlevitsky@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1327184067-25936-1-git-send-email-maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

Enable PCIE power savings and PGRAPH's clock
gating.

This should be fairy safe to do on NV50 class cards,
but should be tested on more that NV86.

Also its possible to enable clock gating and otherwice
reduce power usage of VDEC, but for now I choose just to
turn it off.
To be honest, since its usually not used and when it is.
it will be probably loaded, these powe saving bits don't matter much

Signed-off-by: Maxim Levitsky <maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nv50_mc.c |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv50_mc.c b/drivers/gpu/drm/nouveau/nv50_mc.c
index e0a9c3f..fd4ef43 100644
--- a/drivers/gpu/drm/nouveau/nv50_mc.c
+++ b/drivers/gpu/drm/nouveau/nv50_mc.c
@@ -32,6 +32,14 @@ int
 nv50_mc_init(struct drm_device *dev)
 {
 	nv_wr32(dev, NV03_PMC_ENABLE, 0xFFFFFFFF);
+
+	/* PPCI+0x150 - some PCIE powersave bit*/
+	nv_mask(dev, 0x088150, 0x00000100, 0x00000000);
+
+	/* Enable TP automatic clock gating*/
+	nv_mask(dev, 0x001098, 0x00000020, 0x00000020);
+	nv_mask(dev, 0x001588, 0x00000003, 0x00000001);
+
 	return 0;
 }
 
-- 
1.7.5.4
