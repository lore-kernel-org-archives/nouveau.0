From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH 0/2] Fix display detection issues with P50-P52 docks
Date: Thu,  9 Aug 2018 18:22:04 -0400
Message-ID: <20180809222209.26226-1-lyude@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, Ilia Mirkin <imirkin@alum.mit.edu>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, Lyude Paul <lyude@redhat.com>
List-Id: nouveau.vger.kernel.org

This fixes some annoying issues on the P50-P52 with displays not being
detected if they aren't plugged in at boot, and sometimes even when they
are plugged in at boot.

See: https://bugzilla.redhat.com/show_bug.cgi?id=1477182

Lyude Paul (2):
  drm/nouveau: Only write DP_MSTM_CTRL when needed
  drm/nouveau: Reset MST branching unit before enabling

 drivers/gpu/drm/nouveau/dispnv50/disp.c | 65 ++++++++++++++++++-------
 1 file changed, 48 insertions(+), 17 deletions(-)

-- 
2.17.1
