From: Jeremy Cline <jcline@redhat.com>
Subject: [PATCH 0/3] drm/nouveau: fix a use-after-free in postclose()
Date: Tue,  3 Nov 2020 14:49:09 -0500
Message-ID: <20201103194912.184413-1-jcline@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>, Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Jeremy Cline <jcline@redhat.com>
List-Id: nouveau.vger.kernel.org

This series fixes a number of use-after-frees in nouveau's postclose()
handler. It was discovered by pointing IGT's core_hotunplug tests at a
nouveau device, but the steps to reproduce it are simple:

1. Open the device file
2. Unbind the driver or remove the device
3. Close the file opened in step 1.

During the device removal, the nouveau_drm structure is de-allocated,
but is dereferenced in the postclose() handler.

One obvious solution is to ensure all the operations in the postclose()
handler are valid by extending the lifetime of the nouveau_drm
structure. This is possible with the new devm_drm_dev_alloc() interface,
but the change is somewhat invasive so I thought it best to submit that
work separately.

Instead, we make use of the drm_dev_unplug() API, clean up all clients
in the device removal call, and check to make sure the device has not
been unplugged in the postclose() handler. While this does not enable
hot-unplug support for nouveau, it's enough to avoid crashing the kernel
and leads to all the core_hotunplug tests to pass.

Jeremy Cline (3):
  drm/nouveau: use drm_dev_unplug() during device removal
  drm/nouveau: Add a dedicated mutex for the clients list
  drm/nouveau: clean up all clients on device removal

 drivers/gpu/drm/nouveau/nouveau_drm.c | 39 +++++++++++++++++++++++----
 drivers/gpu/drm/nouveau/nouveau_drv.h |  5 ++++
 2 files changed, 39 insertions(+), 5 deletions(-)

-- 
2.28.0
