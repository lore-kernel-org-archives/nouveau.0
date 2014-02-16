From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH] drm/nouveau/bios: fix INDEX_ADDRESS_LATCHED trace
	printout
Date: Sun, 16 Feb 2014 03:53:55 -0500
Message-ID: <1392540835-11012-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

Having a \n in the middle of a format string means that the next line
doesn't get the prefixes unlike every other line printed by the trace.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/subdev/bios/init.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/bios/init.c b/drivers/gpu/drm/nouveau/core/subdev/bios/init.c
index de201ba..126651b 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/bios/init.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/bios/init.c
@@ -845,9 +845,8 @@ init_idx_addr_latched(struct nvbios_init *init)
 	u32 data = nv_ro32(bios, init->offset + 13);
 	u8 count = nv_ro08(bios, init->offset + 17);
 
-	trace("INDEX_ADDRESS_LATCHED\t"
-	      "R[0x%06x] : R[0x%06x]\n\tCTRL &= 0x%08x |= 0x%08x\n",
-	      creg, dreg, mask, data);
+	trace("INDEX_ADDRESS_LATCHED\tR[0x%06x] : R[0x%06x]\n", creg, dreg);
+	trace("\tCTRL &= 0x%08x |= 0x%08x\n", mask, data);
 	init->offset += 18;
 
 	while (count--) {
-- 
1.8.3.2
