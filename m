From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH] drm/nouveau: Fix some sparse warnings.
Date: Tue, 24 Nov 2009 15:58:13 +0100
Message-ID: <1259074693-4598-1-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_bios.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
index 1f472ff..7e54142 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
@@ -2646,7 +2646,7 @@ init_gpio(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 }
 
 /* hack to avoid moving the itbl_entry array before this function */
-int init_ram_restrict_zm_reg_group_blocklen;
+static int init_ram_restrict_zm_reg_group_blocklen;
 
 static bool
 init_ram_restrict_zm_reg_group(struct nvbios *bios, uint16_t offset,
@@ -5062,7 +5062,7 @@ parse_dcb_gpio_table(struct drm_device *dev, struct nvbios *bios)
 	int header_len = gpio_table[1],
 	    entries = gpio_table[2],
 	    entry_len = gpio_table[3];
-	void (*parse_entry)(struct nvbios *, uint16_t);
+	void (*parse_entry)(struct nvbios *, uint16_t) = NULL;
 	int i;
 
 	if (bios->bdcb.version >= 0x40) {
-- 
1.6.4.4
