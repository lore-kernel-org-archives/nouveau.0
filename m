From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 2/3] drm/nv30-nv31: Don't use GPIO_EXT to switch
	the DACs between TV and VGA.
Date: Mon,  5 Oct 2009 04:37:05 +0200
Message-ID: <1254710226-26139-2-git-send-email-currojerez@riseup.net>
References: <1254710226-26139-1-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1254710226-26139-1-git-send-email-currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
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

It locks the system up (bug 23212).

Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nv04_dac.c |    4 ++--
 drivers/gpu/drm/nouveau/nv17_tv.c  |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv04_dac.c b/drivers/gpu/drm/nouveau/nv04_dac.c
index 6a1db41..587b6f5 100644
--- a/drivers/gpu/drm/nouveau/nv04_dac.c
+++ b/drivers/gpu/drm/nouveau/nv04_dac.c
@@ -248,7 +248,7 @@ enum drm_connector_status nv17_dac_detect(struct drm_encoder *encoder,
 		nvWriteMC(dev, NV_PBUS_POWERCTRL_4, saved_powerctrl_4 & 0xffffffcf);
 	}
 
-	if (nv_arch(dev) >= NV_30) {
+	if (dev_priv->chipset >= 0x34) {
 		saved_gpio_ext = NVReadCRTC(dev, 0, NV_PCRTC_GPIO_EXT);
 
 		NVWriteCRTC(dev, 0, NV_PCRTC_GPIO_EXT, (saved_gpio_ext & ~(3 << 20)) |
@@ -308,7 +308,7 @@ enum drm_connector_status nv17_dac_detect(struct drm_encoder *encoder,
 		nvWriteMC(dev, NV_PBUS_POWERCTRL_4, saved_powerctrl_4);
 	nvWriteMC(dev, NV_PBUS_POWERCTRL_2, saved_powerctrl_2);
 
-	if (nv_arch(dev) >= NV_30)
+	if (dev_priv->chipset >= 0x34)
 		NVWriteRAMDAC(dev, 0, NV_PCRTC_GPIO_EXT, saved_gpio_ext);
 
 	if (present) {
diff --git a/drivers/gpu/drm/nouveau/nv17_tv.c b/drivers/gpu/drm/nouveau/nv17_tv.c
index a9a33e9..3856342 100644
--- a/drivers/gpu/drm/nouveau/nv17_tv.c
+++ b/drivers/gpu/drm/nouveau/nv17_tv.c
@@ -237,7 +237,7 @@ static void  nv17_tv_dpms(struct drm_encoder *encoder, int mode)
 
 	nv_load_ptv(dev, regs, 200);
 
-	if (nv_arch(dev) >= NV_30) {
+	if (dev_priv->chipset >= 0x34) {
 		uint32_t *gpio_ext = &dev_priv->mode_reg.crtc_reg[0].gpio_ext;
 
 		*gpio_ext &= ~(3 << 20);
-- 
1.6.3.3
