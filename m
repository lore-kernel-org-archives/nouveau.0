From: Karol Herbst <kherbst@redhat.com>
Subject: [PATCH 1/7] Revert "ACPI / OSI: Add OEM _OSI string to enable dGPU direct output"
Date: Wed, 14 Aug 2019 23:31:12 +0200
Message-ID: <20190814213118.28473-2-kherbst@redhat.com>
References: <20190814213118.28473-1-kherbst@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190814213118.28473-1-kherbst@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: Karol Herbst <kherbst@redhat.com>, Alex Hung <alex.hung@canonical.com>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Dave Airlie <airlied@redhat.com>, Lyude Paul <lyude@redhat.com>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

This reverts commit 28586a51eea666d5531bcaef2f68e4abbd87242c.

The original commit message didn't even make sense. AMD _does_ support it and
it works with Nouveau as well.

Also what was the issue being solved here? No references to any bugs and not
even explaining any issue at all isn't the way we do things.

And even if it means a muxed design, then the fix is to make it work inside the
driver, not adding some hacky workaround through ACPI tricks.

And what out of tree drivers do or do not support we don't care one bit anyway.

Signed-off-by: Karol Herbst <kherbst@redhat.com>
CC: Alex Hung <alex.hung@canonical.com>
CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
CC: Dave Airlie <airlied@redhat.com>
CC: Lyude Paul <lyude@redhat.com>
CC: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/acpi/osi.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/acpi/osi.c b/drivers/acpi/osi.c
index bec0bebc7f52..9b20ac4d79a0 100644
--- a/drivers/acpi/osi.c
+++ b/drivers/acpi/osi.c
@@ -61,13 +61,6 @@ osi_setup_entries[OSI_STRING_ENTRIES_MAX] __initdata = {
 	 * a BIOS workaround.
 	 */
 	{"Linux-Lenovo-NV-HDMI-Audio", true},
-	/*
-	 * Linux-HPI-Hybrid-Graphics is used by BIOS to enable dGPU to
-	 * output video directly to external monitors on HP Inc. mobile
-	 * workstations as Nvidia and AMD VGA drivers provide limited
-	 * hybrid graphics supports.
-	 */
-	{"Linux-HPI-Hybrid-Graphics", true},
 };
 
 static u32 acpi_osi_handler(acpi_string interface, u32 supported)
-- 
2.21.0
