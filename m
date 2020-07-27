From: Daniel Dadap <ddadap-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 4/4] radeon: fall back to ACPI EDID retrieval
Date: Mon, 27 Jul 2020 15:53:57 -0500
Message-ID: <20200727205357.27839-5-ddadap@nvidia.com>
References: <20200727205357.27839-1-ddadap@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200727205357.27839-1-ddadap-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "amd-gfx" <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: dri-devel-PD4FTy7X32lNgt0PjOBp9/egYHeGw8Jk@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9/egYHeGw8Jk@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, joonas.lahtinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, rodrigo.vivi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, alexander.deucher-5C7GfCeVMHo@public.gmane.org, christian.koenig-5C7GfCeVMHo@public.gmane.org, david1.zhou-5C7GfCeVMHo@public.gmane.org
Cc: Daniel Dadap <ddadap-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Fall back to retrieving the EDID via the ACPI _DDC method, when present
for notebook internal panels, when retrieving BIOS-embedded EDIDs.

Signed-off-by: Daniel Dadap <ddadap-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/radeon/radeon_combios.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_combios.c b/drivers/gpu/drm/radeon/radeon_combios.c
index c3e49c973812..de801d9fca54 100644
--- a/drivers/gpu/drm/radeon/radeon_combios.c
+++ b/drivers/gpu/drm/radeon/radeon_combios.c
@@ -401,9 +401,8 @@ bool radeon_combios_check_hardcoded_edid(struct radeon_device *rdev)
 struct edid *
 radeon_bios_get_hardcoded_edid(struct radeon_device *rdev)
 {
-	struct edid *edid;
-
 	if (rdev->mode_info.bios_hardcoded_edid) {
+		struct edid *edid;
 		edid = kmalloc(rdev->mode_info.bios_hardcoded_edid_size, GFP_KERNEL);
 		if (edid) {
 			memcpy((unsigned char *)edid,
@@ -412,7 +411,8 @@ radeon_bios_get_hardcoded_edid(struct radeon_device *rdev)
 			return edid;
 		}
 	}
-	return NULL;
+
+	return drm_get_edid_acpi();
 }
 
 static struct radeon_i2c_bus_rec combios_setup_i2c_bus(struct radeon_device *rdev,
-- 
2.18.4
