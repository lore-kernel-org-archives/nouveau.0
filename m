From: James Jones <jajones-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 0/3] drm/nouveau: Support NVIDIA format
 modifiers
Date: Mon, 16 Dec 2019 16:45:17 -0800
Message-ID: <20191217004520.2404-1-jajones@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This series modifies the NV5x+ nouveau display backends to advertise
appropriate format modifiers on their display planes in atomic mode
setting blobs.

Corresponding modifications to Mesa/userspace are available here:

https://gitlab.freedesktop.org/cubanismo/mesa/tree/nouveau_work

But those need a bit of cleanup before they're ready to submit.

I've tested this on Tesla, Kepler, Pascal, and Turing-class hardware
using various formats and all the exposed format modifiers, plus some
negative testing with invalid ones.

NOTE: this series depends on the "[PATCH v3] drm: Generalized NV Block
Linear DRM format mod" patch submitted to dri-devel.

v2: Used Tesla family instead of NV50 chipset compare to avoid treating
    oddly numbered NV4x-class chipsets as NV50+ GPUs.  Other instances
    of compares with chipset number in the series were audited, deemed
    safe, and left as-is for consistency with existing code.

James Jones (3):
  drm/nouveau: Add format mod prop to base/ovly/nvdisp
  drm/nouveau: Check framebuffer size against bo
  drm/nouveau: Support NVIDIA format modifiers

 drivers/gpu/drm/nouveau/dispnv50/base507c.c |   7 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c     |  59 ++++++++
 drivers/gpu/drm/nouveau/dispnv50/disp.h     |   4 +
 drivers/gpu/drm/nouveau/dispnv50/wndw.c     |  35 ++++-
 drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c |  17 +++
 drivers/gpu/drm/nouveau/nouveau_display.c   | 154 ++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_display.h   |   4 +
 7 files changed, 272 insertions(+), 8 deletions(-)

-- 
2.17.1
