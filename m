From: Daniel Dadap <ddadap-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/4] drm: add support for retrieving EDID via ACPI _DDC
Date: Mon, 27 Jul 2020 15:53:53 -0500
Message-ID: <20200727205357.27839-1-ddadap@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

Some notebook systems provide the EDID for the internal panel via the
_DDC method in ACPI, instead of or in addition to providing the EDID via
DDC on LVDS/eDP. Add a DRM helper to search for an ACP _DDC method under
the ACPI namespace for each VGA/3D controller, and return the first EDID
successfully retrieved via _DDC. Update the i915, nouveau, and radeon
DRM-KMS drivers to fall back to retrieving the EDID via ACPI _DDC on
notebook internal display panels after failing to retrieve an EDID via
other means.

This is useful for retrieving an internal panel's EDID both on hybrid
graphics systems with muxed display output, when the display is muxed
away, as well as on a small number of non-muxed and/or non-hybrid
systems where ACPI _DDC is the only means of accessing the EDID for
the internal panel.

Daniel Dadap (4):
  drm: retrieve EDID via ACPI _DDC method
  i915: fall back to ACPI EDID retrieval
  nouveau: fall back to ACPI EDID retrieval
  radeon: fall back to ACPI EDID retrieval

 drivers/gpu/drm/drm_edid.c                  | 161 ++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.c     |   8 +-
 drivers/gpu/drm/i915/display/intel_lvds.c   |   4 +
 drivers/gpu/drm/nouveau/nouveau_connector.c |   6 +
 drivers/gpu/drm/radeon/radeon_combios.c     |   6 +-
 include/drm/drm_edid.h                      |   1 +
 6 files changed, 182 insertions(+), 4 deletions(-)

-- 
2.18.4
