From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/6] drm/nouveau: Support sync FDs and sync objects
Date: Fri, 28 Aug 2020 12:40:10 +0200
Message-ID: <20200828104016.1672195-1-thierry.reding@gmail.com>
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

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Hi,

This series implements a new IOCTL to submit push buffers that can
optionally return a sync FD or sync object to userspace. This is useful
in cases where userspace wants to synchronize operations between the GPU
and another driver (such as KMS for display). Among other things this
allows extensions such as eglDupNativeFenceFDANDROID to be implemented.

Note that patch 4 modifies the ABI introduced in patch 3 by allowing DRM
sync objects to be passed rather than only sync FDs. It also allows any
number of sync FDs/objects to be passed in or emitted. I think those are
useful features, but I left them in a separate patch in case everybody
else thinks that this won't be needed. If we decide to merge the new ABI
then patch 4 should be squashed into patch 3.

The corresponding userspace changes can be found here:

  libdrm: https://gitlab.freedesktop.org/tagr/drm/-/commits/nouveau-sync-fd-v2/
  mesa: https://gitlab.freedesktop.org/tagr/mesa/-/commits/nouveau-sync-fd/

I've verified that this works with kmscube's --atomic mode and Weston.

Thierry

Thierry Reding (6):
  drm/nouveau: Split nouveau_fence_sync()
  drm/nouveau: Add nouveau_fence_ref()
  drm/nouveau: Support fence FDs at kickoff
  drm/nouveau: Support sync FDs and syncobjs
  drm/nouveau: Support DMA fence arrays
  drm/nouveau: Allow zero pushbuffer submits

 drivers/gpu/drm/nouveau/dispnv04/crtc.c |   4 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c    |  38 ++-
 drivers/gpu/drm/nouveau/nouveau_bo.h    |   2 +
 drivers/gpu/drm/nouveau/nouveau_drm.c   |   1 +
 drivers/gpu/drm/nouveau/nouveau_fence.c |  90 +++---
 drivers/gpu/drm/nouveau/nouveau_fence.h |   3 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c   | 402 ++++++++++++++++++------
 drivers/gpu/drm/nouveau/nouveau_gem.h   |   2 +
 include/uapi/drm/nouveau_drm.h          |  23 ++
 9 files changed, 410 insertions(+), 155 deletions(-)

-- 
2.28.0
