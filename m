From: Lyude Paul <lyude@redhat.com>
Subject: [RFC v4 00/12] drm/nouveau: Introduce CRC support for gf119+
Date: Fri,  8 May 2020 16:46:50 -0400
Message-ID: <20200508204751.155488-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Liang Chen <cl@rock-chips.com>, Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ben Dooks <ben.dooks@codethink.co.uk>, Tejun Heo <tj@kernel.org>, Petr Mladek <pmladek@suse.com>, Suren Baghdasaryan <surenb@google.com>, Lyude Paul <lyude@redhat.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Johannes Weiner <hannes@cmpxchg.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, Ben Skeggs <bskeggs@redhat.com>, Ilia Mirkin <imirkin@alum.mit.edu>, Peteris Rudzusiks <peteris.rudzusiks@gmail.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <chris>
List-Id: nouveau.vger.kernel.org

Nvidia released some documentation on how CRC support works on their
GPUs, hooray!

So: this patch series implements said CRC support in nouveau, along with
adding some special debugfs interfaces for some relevant igt-gpu-tools
tests (already on the ML).

First - we add some new functionality to kthread_work in the kernel, and
then use this to add a new feature to DRM that Ville Syrjälä came up
with: vblank workers. Basically, this is just a generic DRM interface
that allows for scheduling high-priority workers that start on a given
vblank interrupt. Note that while we're currently only using this in
nouveau, Intel has plans to use this for i915 as well (hence why they
came up with it!).

And finally: in order to implement the last feature, we expose some new
functions in the kernel's kthread_worker infrastructure so that we can
de-complicate our implementation of this.

Anyway-welcome to the future! :)

Major changes since v3:
* Style fixes on nouveau patches from checkpatch, no functional changes
* Don't integrate so tightly with kthread_work (and use our own lock),
  instead introduce some new functions for doing simple async flushing
  and cancelling. I think this interface looks a lot more acceptable
  then what I was previously trying.
* Apply some changes requested by danvet
Major changes since v2:
* Use kthread_worker instead of kthreadd for vblank workers
* Don't check debugfs return values

Lyude Paul (12):
  kthread: Add kthread_queue_flush_work()
  kthread: Add kthread_(un)block_work_queuing() and
    kthread_work_queuable()
  drm/vblank: Register drmm cleanup action once per drm_vblank_crtc
  drm/vblank: Add vblank works
  drm/nouveau/kms/nv50-: Unroll error cleanup in nv50_head_create()
  drm/nouveau/kms/nv140-: Don't modify depth in state during atomic
    commit
  drm/nouveau/kms/nv50-: Fix disabling dithering
  drm/nouveau/kms/nv50-: s/harm/armh/g
  drm/nouveau/kms/nv140-: Track wndw mappings in nv50_head_atom
  drm/nouveau/kms/nv50-: Expose nv50_outp_atom in disp.h
  drm/nouveau/kms/nv50-: Move hard-coded object handles into header
  drm/nouveau/kms/nvd9-: Add CRC support

 drivers/gpu/drm/drm_vblank.c                | 280 +++++++-
 drivers/gpu/drm/nouveau/dispnv04/crtc.c     |  25 +-
 drivers/gpu/drm/nouveau/dispnv50/Kbuild     |   4 +
 drivers/gpu/drm/nouveau/dispnv50/atom.h     |  21 +
 drivers/gpu/drm/nouveau/dispnv50/core.h     |   4 +
 drivers/gpu/drm/nouveau/dispnv50/core907d.c |   3 +
 drivers/gpu/drm/nouveau/dispnv50/core917d.c |   3 +
 drivers/gpu/drm/nouveau/dispnv50/corec37d.c |   3 +
 drivers/gpu/drm/nouveau/dispnv50/corec57d.c |   3 +
 drivers/gpu/drm/nouveau/dispnv50/crc.c      | 715 ++++++++++++++++++++
 drivers/gpu/drm/nouveau/dispnv50/crc.h      | 125 ++++
 drivers/gpu/drm/nouveau/dispnv50/crc907d.c  | 139 ++++
 drivers/gpu/drm/nouveau/dispnv50/crcc37d.c  | 153 +++++
 drivers/gpu/drm/nouveau/dispnv50/disp.c     |  65 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.h     |  24 +
 drivers/gpu/drm/nouveau/dispnv50/handles.h  |  16 +
 drivers/gpu/drm/nouveau/dispnv50/head.c     | 142 +++-
 drivers/gpu/drm/nouveau/dispnv50/head.h     |  13 +-
 drivers/gpu/drm/nouveau/dispnv50/head907d.c |  14 +-
 drivers/gpu/drm/nouveau/dispnv50/headc37d.c |  27 +-
 drivers/gpu/drm/nouveau/dispnv50/headc57d.c |  20 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.c     |  15 +-
 drivers/gpu/drm/nouveau/nouveau_display.c   |  60 +-
 include/drm/drm_vblank.h                    |  35 +
 include/linux/kthread.h                     |  35 +
 kernel/kthread.c                            | 133 +++-
 26 files changed, 1903 insertions(+), 174 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/dispnv50/crc.c
 create mode 100644 drivers/gpu/drm/nouveau/dispnv50/crc.h
 create mode 100644 drivers/gpu/drm/nouveau/dispnv50/crc907d.c
 create mode 100644 drivers/gpu/drm/nouveau/dispnv50/crcc37d.c
 create mode 100644 drivers/gpu/drm/nouveau/dispnv50/handles.h

-- 
2.25.4
