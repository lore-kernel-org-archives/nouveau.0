From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 03/15] drm/bochs: Remove references to struct drm_device.pdev
Date: Tue, 24 Nov 2020 12:38:12 +0100
Message-ID: <20201124113824.19994-4-tzimmermann@suse.de>
References: <20201124113824.19994-1-tzimmermann@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <virtualization-bounces@lists.linux-foundation.org>
In-Reply-To: <20201124113824.19994-1-tzimmermann@suse.de>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>,
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>,
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>
To: airlied@linux.ie, daniel@ffwll.ch
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org, amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>, spice-devel@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Using struct drm_device.pdev is deprecated. Convert bochs to struct
drm_device.dev. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/bochs/bochs_drv.c | 1 -
 drivers/gpu/drm/bochs/bochs_hw.c  | 4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bochs/bochs_drv.c b/drivers/gpu/drm/bochs/bochs_drv.c
index fd454225fd19..b469624fe40d 100644
--- a/drivers/gpu/drm/bochs/bochs_drv.c
+++ b/drivers/gpu/drm/bochs/bochs_drv.c
@@ -121,7 +121,6 @@ static int bochs_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		goto err_free_dev;
 
-	dev->pdev = pdev;
 	pci_set_drvdata(pdev, dev);
 
 	ret = bochs_load(dev);
diff --git a/drivers/gpu/drm/bochs/bochs_hw.c b/drivers/gpu/drm/bochs/bochs_hw.c
index dce4672e3fc8..2d7380a9890e 100644
--- a/drivers/gpu/drm/bochs/bochs_hw.c
+++ b/drivers/gpu/drm/bochs/bochs_hw.c
@@ -110,7 +110,7 @@ int bochs_hw_load_edid(struct bochs_device *bochs)
 int bochs_hw_init(struct drm_device *dev)
 {
 	struct bochs_device *bochs = dev->dev_private;
-	struct pci_dev *pdev = dev->pdev;
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	unsigned long addr, size, mem, ioaddr, iosize;
 	u16 id;
 
@@ -201,7 +201,7 @@ void bochs_hw_fini(struct drm_device *dev)
 		release_region(VBE_DISPI_IOPORT_INDEX, 2);
 	if (bochs->fb_map)
 		iounmap(bochs->fb_map);
-	pci_release_regions(dev->pdev);
+	pci_release_regions(to_pci_dev(dev->dev));
 	kfree(bochs->edid);
 }
 
-- 
2.29.2
