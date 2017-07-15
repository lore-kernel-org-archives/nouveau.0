From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH 3/5] drm: nouveau: constify pci_device_id.
Date: Sat, 15 Jul 2017 12:47:16 +0530
Message-ID: <1500103036-23429-1-git-send-email-arvind.yadav.cs@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: airlied@linux.ie, linux-kernel@vger.kernel.org, bskeggs@redhat.com, nouveau@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

pci_device_id are not supposed to change at runtime. All functions
working with pci_device_id provided by <linux/pci.h> work with
const pci_device_id. So mark the non-const structs as const.

File size before:
   text	   data	    bss	    dec	    hex	filename
  12256	    360	    976	  13592	   3518	gpu/drm/nouveau/nouveau_drm.o

File size After adding 'const':
   text	   data	    bss	    dec	    hex	filename
  12360	    256	    976	  13592	   3518	gpu/drm/nouveau/nouveau_drm.o

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 15a13d0..07a1efb 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1019,7 +1019,7 @@ driver_stub = {
 	.patchlevel = DRIVER_PATCHLEVEL,
 };
 
-static struct pci_device_id
+static const struct pci_device_id
 nouveau_drm_pci_table[] = {
 	{
 		PCI_DEVICE(PCI_VENDOR_ID_NVIDIA, PCI_ANY_ID),
-- 
2.7.4
