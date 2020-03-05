From: Mikel Rychliski <mikel@mikelr.com>
Subject: [PATCH v2 1/2] drm/radeon: Stop directly referencing iomem
Date: Wed,  4 Mar 2020 22:41:25 -0500
Message-ID: <20200305034126.6989-2-mikel@mikelr.com>
References: <20200305034126.6989-1-mikel@mikelr.com>
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20200305034126.6989-1-mikel@mikelr.com>
Sender: linux-pci-owner@vger.kernel.org
To: amd-gfx@lists.freedesktop.org, linux-pci@vger.kernel.org, nouveau@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "David (ChunMing) Zhou" <David1.Zhou@amd.com>, Bjorn Helgaas <bhelgaas@google.com>, Matthew Garrett <matthewgarrett@google.com>, Ben Skeggs <bskeggs@redhat.com>, Mikel Rychliski <mikel@mikelr.com>
List-Id: nouveau.vger.kernel.org

pci_platform_rom() returns an __iomem pointer which should not be
accessed directly. Change radeon_read_platform_bios() to use
memcpy_fromio() instead of calling kmemdup() on the __iomem pointer.

Signed-off-by: Mikel Rychliski <mikel@mikelr.com>
---
 drivers/gpu/drm/radeon/radeon_bios.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_bios.c b/drivers/gpu/drm/radeon/radeon_bios.c
index c42f73fad3e3..c3ae4c92a115 100644
--- a/drivers/gpu/drm/radeon/radeon_bios.c
+++ b/drivers/gpu/drm/radeon/radeon_bios.c
@@ -118,11 +118,14 @@ static bool radeon_read_platform_bios(struct radeon_device *rdev)
 		return false;
 	}
 
-	if (size == 0 || bios[0] != 0x55 || bios[1] != 0xaa) {
+	rdev->bios = kzalloc(size, GFP_KERNEL);
+	if (!rdev->bios)
 		return false;
-	}
-	rdev->bios = kmemdup(bios, size, GFP_KERNEL);
-	if (rdev->bios == NULL) {
+
+	memcpy_fromio(rdev->bios, bios, size);
+
+	if (size == 0 || rdev->bios[0] != 0x55 || rdev->bios[1] != 0xaa) {
+		kfree(rdev->bios);
 		return false;
 	}
 
-- 
2.13.7
