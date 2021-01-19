From: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/5] drm/nouveau: CRC fixes
Date: Mon, 18 Jan 2021 20:48:44 -0500
Message-ID: <20210119014849.2509965-1-lyude@redhat.com>
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Over vacation I did a bunch of work on getting igt working for evo GPUs.
Note though some of these fixes are for nvdisplay GPUs, as I noticed a
couple of things along the way (like the fact that you CAN use the core
channel for tag updating on turing+, hooray!).

Lyude Paul (5):
  drm/nouveau/kms/nv50-: Use drm_dbg_kms() in crc.c
  drm/nouveau/kms/nv50-: Check vbl count after CRC context flip
  drm/nouveau/kms/nv140-: Use hard-coded wndws or core channel for CRC
    channel
  drm/nouveau/kms/nvd9-nv138: Fix CRC calculation for the cursor channel
  drm/nouveau/kms/nv140-: Add CRC methods to gv100_disp_core_mthd_head

 drivers/gpu/drm/nouveau/dispnv50/Kbuild       |  1 +
 drivers/gpu/drm/nouveau/dispnv50/corec57d.c   |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/crc.c        | 64 ++++++-----------
 drivers/gpu/drm/nouveau/dispnv50/crc.h        |  7 +-
 drivers/gpu/drm/nouveau/dispnv50/crc907d.c    |  8 +--
 drivers/gpu/drm/nouveau/dispnv50/crcc37d.c    | 45 +++---------
 drivers/gpu/drm/nouveau/dispnv50/crcc37d.h    | 40 +++++++++++
 drivers/gpu/drm/nouveau/dispnv50/crcc57d.c    | 58 ++++++++++++++++
 .../drm/nouveau/include/nvhw/class/clc57d.h   | 69 +++++++++++++++++++
 .../drm/nouveau/nvkm/engine/disp/coregv100.c  |  2 +
 10 files changed, 208 insertions(+), 88 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/dispnv50/crcc37d.h
 create mode 100644 drivers/gpu/drm/nouveau/dispnv50/crcc57d.c

-- 
2.29.2
