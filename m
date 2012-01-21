From: Maxim Levitsky <maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 4/4] nv50 - unknown and untested bits of memory
	controller that save around 0.1W
Date: Sun, 22 Jan 2012 00:14:27 +0200
Message-ID: <1327184067-25936-5-git-send-email-maximlevitsky@gmail.com>
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

Not-signed-off-by: Maxim Levitsky <maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nv50_fb.c |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv50_fb.c b/drivers/gpu/drm/nouveau/nv50_fb.c
index bdd2afe..ed0b5f2 100644
--- a/drivers/gpu/drm/nouveau/nv50_fb.c
+++ b/drivers/gpu/drm/nouveau/nv50_fb.c
@@ -86,6 +86,17 @@ nv50_fb_init(struct drm_device *dev)
 	 */
 	nv_wr32(dev, 0x100c08, priv->r100c08 >> 8);
 
+	/* Power usage magic - 0.1W - verified many times*/
+
+	nv_wr32(dev, 0x100000, 0x0000c042);
+	nv_wr32(dev, 0x100004, 0x0000c042);
+	nv_wr32(dev, 0x100008, 0x0000c042);
+	nv_wr32(dev, 0x100b78, 0x0000c042);
+	nv_wr32(dev, 0x100c0c, 0x0000c042);
+	nv_wr32(dev, 0x100d04, 0x0000c042);
+	nv_wr32(dev, 0x100e0c, 0x0000c042);
+
+
 	/* This is needed to get meaningful information from 100c90
 	 * on traps. No idea what these values mean exactly. */
 	switch (dev_priv->chipset) {
-- 
1.7.5.4
