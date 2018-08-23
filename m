From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH 0/3] drm/nouveau: Fixup module probe to add ->shutdown()
Date: Wed, 22 Aug 2018 21:40:05 -0400
Message-ID: <20180823014009.21532-1-lyude@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

This series is intended to add support for shutting down the GPU on
kernel shutdown/reboot using the ->shutdown() hook, similar to what
amdgpu does. This is mainly intended to workaround a bios issue on the
P50 that was preventing nouveau from initializing the dedicated GM107
GPU on that system properly. You can find more details on this issue in
the patch labeled "Shut down GPU on kernel shutdown".

Doing this so that it wouldn't race with userspace took a
little bit of work (and uncovered one small bug in the process). Mainly,
I had to convert nouveau to use the new drm_dev_alloc() and
drm_dev_register() helpers to ensure that there isn't any chance that we
can race with userspace during shutdown. This also involved removing
->load() and ->unload() and moving their work into nouveau_drm_probe().

============================== IMPORTANT ===============================
This patch series WILL NOT WORK PROPERLY unless you also apply the
following patches which fix some leftover device removal issues:

https://patchwork.freedesktop.org/series/48596/
This fixes kernel panics on removal on systems with nvidia controlled
backlights

https://patchwork.freedesktop.org/series/47843/
This fixes issues with DRM connectors getting leaked on device removal,
due to hpd_work still being active when unloading nouveau.

============================== IMPORTANT ===============================

This also uncovered one small bug in nouveau_drm_load().

Lyude Paul (3):
  drm/nouveau: Fix potential memory leak in nouveau_drm_load()
  drm/nouveau: Start using new drm_dev initialization helpers
  drm/nouveau: Shut down GPU on kernel shutdown

 drivers/gpu/drm/nouveau/nouveau_drm.c | 180 +++++++++++++++-----------
 1 file changed, 106 insertions(+), 74 deletions(-)

-- 
2.17.1
