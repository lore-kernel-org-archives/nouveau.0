From: wuxu.wu <wuxu.wu@huawei.com>
Subject: [PATCH] drm/nouveau/bios: fix incorrect kfree in platform_init
Date: Fri, 20 Dec 2019 22:05:26 +0800
Message-ID: <1576850726-5684-1-git-send-email-wuxu.wu@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, bskeggs@redhat.com
Cc: hushiyuan@huawei.com, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, wuxu.wu@huawei.com
List-Id: nouveau.vger.kernel.org

priv porinter could be free only when priv != null and priv->rom is null.
---
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.c
index 9b91da0..d776e01 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.c
@@ -70,8 +70,9 @@ pcirom_init(struct nvkm_bios *bios, const char *name)
 			    (priv->rom = pci_map_rom(pdev, &priv->size))) {
 				priv->pdev = pdev;
 				return priv;
+			} else {
+			    kfree(priv);
 			}
-			kfree(priv);
 		}
 		pci_disable_rom(pdev);
 	}
-- 
2.7.4
