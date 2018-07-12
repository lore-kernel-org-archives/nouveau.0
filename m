From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH v2 0/3] drm/nouveau: Fix runtime PM leaks
Date: Thu, 12 Jul 2018 13:02:51 -0400
Message-ID: <20180712170256.13018-1-lyude@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, Archit Taneja <architt@codeaurora.org>, Lyude Paul <lyude@redhat.com>
List-Id: nouveau.vger.kernel.org

This is the latest version of
https://patchwork.freedesktop.org/series/45862/ . One new patch has been
added that also addresses some additional issues I found with
pmops_runtime_idle that would stop nouveau from suspending the GPU when
running under X.

Additionally,
"drm/nouveau: Fix runtime PM leak in nv50_disp_atomic_commit()" has had
it's CC to stable removed.

Lyude Paul (3):
  drm/nouveau: Fix runtime PM leak in drm_open()
  drm/nouveau: Fix runtime PM leak in nv50_disp_atomic_commit()
  drm/nouveau: Remove bogus crtc check in pmops_runtime_idle

 drivers/gpu/drm/nouveau/dispnv50/disp.c |  2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c   | 17 ++++-------------
 2 files changed, 5 insertions(+), 14 deletions(-)

-- 
2.17.1
