From: Bjorn Helgaas <helgaas@kernel.org>
Subject: [PATCH] drm/nouveau: Remove duplicate ACPI_VIDEO_NOTIFY_PROBE definition
Date: Thu,  4 Apr 2019 08:49:43 -0500
Message-ID: <20190404134943.149428-1-helgaas@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Hans de Goede <hdegoede@redhat.com>
List-Id: nouveau.vger.kernel.org

From: Bjorn Helgaas <bhelgaas@google.com>

Commit 3a6536c51d5d ("drm/nouveau: Intercept ACPI_VIDEO_NOTIFY_PROBE")
added a definition of ACPI_VIDEO_NOTIFY_PROBE because <acpi/video.h> didn't
supply one.  Later, commit eff4a751cce5 ("ACPI / video: Move
ACPI_VIDEO_NOTIFY_* defines to acpi/video.h") moved ACPI_VIDEO_NOTIFY_PROBE
and other definitions to <acpi/video.h>, so the copy in nouveau_display.c
is now unnecessary.

Remove the unnecessary definition from nouveau_display.c.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
CC: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_display.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 55c0fa451163..832da8e0020d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -358,15 +358,6 @@ nouveau_display_hpd_work(struct work_struct *work)
 
 #ifdef CONFIG_ACPI
 
-/*
- * Hans de Goede: This define belongs in acpi/video.h, I've submitted a patch
- * to the acpi subsys to move it there from drivers/acpi/acpi_video.c .
- * This should be dropped once that is merged.
- */
-#ifndef ACPI_VIDEO_NOTIFY_PROBE
-#define ACPI_VIDEO_NOTIFY_PROBE			0x81
-#endif
-
 static int
 nouveau_display_acpi_ntfy(struct notifier_block *nb, unsigned long val,
 			  void *data)
-- 
2.21.0.392.gf8f6787159e-goog
