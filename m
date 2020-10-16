From: Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [PATCH] drm/nouveau/bios/init: make two const arrays
 static, makes object smaller
Date: Fri, 16 Oct 2020 23:05:55 +0100
Message-ID: <20201016220555.686446-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: nouveau.vger.kernel.org

From: Colin Ian King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>

Don't populate const arrays on the stack but instead make them
static. Makes the object code smaller by 7 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
 104041	   8284	      0	 112325	  1b6c5	drm/nouveau/nvkm/subdev/bios/init.o

After:
   text	   data	    bss	    dec	    hex	filename
 103874	   8444	      0	 112318	  1b6be	drm/nouveau/nvkm/subdev/bios/init.o

(gcc version 10.2.0)

Signed-off-by: Colin Ian King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
index 9de74f41dcd2..dc8625eff20a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
@@ -546,9 +546,9 @@ init_tmds_reg(struct nvbios_init *init, u8 tmds)
 	 * CR58 for CR57 = 0 to index a table of offsets to the basic
 	 * 0x6808b0 address, and then flip the offset by 8.
 	 */
-	const int pramdac_offset[13] = {
+	static const int pramdac_offset[13] = {
 		0, 0, 0x8, 0, 0x2000, 0, 0, 0, 0x2008, 0, 0, 0, 0x2000 };
-	const u32 pramdac_table[4] = {
+	static const u32 pramdac_table[4] = {
 		0x6808b0, 0x6808b8, 0x6828b0, 0x6828b8 };
 
 	if (tmds >= 0x80) {
-- 
2.27.0
