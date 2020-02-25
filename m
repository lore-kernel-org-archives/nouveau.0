From: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH 0/3] Add separate non-KMS state;
 constify struct drm_driver
Date: Tue, 25 Feb 2020 16:58:59 +0100
Message-ID: <20200225155902.9751-1-tzimmermann@suse.de>
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
To: maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, emil.velikov-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, alexander.deucher-5C7GfCeVMHo@public.gmane.org, sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This patchset moves legacy, non-KMS driver state from struct drm_driver
into struct drm_legacy_state. Only non-KMS drivers provide an instance
of the latter structure. One special case is nouveau, which supports
legacy interfaces. It also provides an instance of the legacy state if
the legacy interfaces have been enabled (i.e., defines the config option
CONFIG_NOUVEAU_LEGACY_CTX_SUPPORT)

I reviewed all call sites of legacy state and functions to verify that
DRIVER_LEGACY or DRIVER_KMS_LEGACY_CONTEXT is set on the device; or that
DRIVER_MODESET is not set.

With the mutable KMS state removed, instances of struct drm_driver can
be declared as constant. The patchset modifies the DRM core accordingly.
Individual drivers can follow later on.

Thomas Zimmermann (3):
  drm: Add separate state structure for legacy, non-KMS drivers
  drm: Move non-kms driver state into struct drm_legacy_state
  drm: Constify struct drm_driver in DRM core

 drivers/gpu/drm/drm_bufs.c            | 10 +++++-----
 drivers/gpu/drm/drm_context.c         |  9 +++++----
 drivers/gpu/drm/drm_drv.c             | 12 ++++++++----
 drivers/gpu/drm/drm_file.c            |  4 ++--
 drivers/gpu/drm/drm_legacy_misc.c     |  6 +++---
 drivers/gpu/drm/drm_lock.c            |  7 ++++---
 drivers/gpu/drm/drm_pci.c             | 16 ++++++++++------
 drivers/gpu/drm/drm_vblank.c          | 11 ++++++-----
 drivers/gpu/drm/i810/i810_drv.c       | 10 +++++++---
 drivers/gpu/drm/mga/mga_drv.c         | 16 ++++++++++------
 drivers/gpu/drm/nouveau/nouveau_drm.c |  8 ++++++++
 drivers/gpu/drm/r128/r128_drv.c       | 16 ++++++++++------
 drivers/gpu/drm/savage/savage_drv.c   | 12 ++++++++----
 drivers/gpu/drm/sis/sis_drv.c         |  8 ++++++--
 drivers/gpu/drm/tdfx/tdfx_drv.c       |  6 +++++-
 drivers/gpu/drm/via/via_drv.c         | 16 ++++++++++------
 include/drm/drm_device.h              |  2 +-
 include/drm/drm_drv.h                 | 21 +++++----------------
 include/drm/drm_legacy.h              | 27 +++++++++++++++++++++++----
 include/drm/drm_pci.h                 |  4 ++--
 20 files changed, 138 insertions(+), 83 deletions(-)

--
2.25.0
