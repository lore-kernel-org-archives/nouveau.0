From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH 0/3] MST BPC fixes for nouveau
Date: Fri, 15 Nov 2019 16:07:17 -0500
Message-ID: <20191115210728.3467-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: Daniel Vetter <daniel@ffwll.ch>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, Sam Ravnborg <sam@ravnborg.org>, Lyude Paul <lyude@redhat.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Sean Paul <seanpaul@chromium.org>, Ilia Mirkin <imirkin@alum.mit.edu>, Peteris Rudzusiks <peteris.rudzusiks@gmail.com>
List-Id: nouveau.vger.kernel.org

Realized when I moved nouveau over to using the atomic DP MST VCPI
helpers that I forgot to ensure that we clamp the BPC to 8 to make us
less likely to run out of bandwidth on a topology when enabling multiple
displays that support >8 BPC - something we want to do until we have
support for dynamically selecting the bpc based on the topology's
available bandwidth, since userspace isn't really using HDR yet anyway.
This matches the behavior that i915 has, along with the behavior of
amdgpu and should fix some people's displays not turning on.

Lyude Paul (3):
  drm/nouveau/kms/nv50-: Call outp_atomic_check_view() before handling
    PBN
  drm/nouveau/kms/nv50-: Store the bpc we're using in nv50_head_atom
  drm/nouveau/kms/nv50-: Limit MST BPC to 8

 drivers/gpu/drm/nouveau/dispnv50/atom.h |   1 +
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 102 ++++++++++++++----------
 drivers/gpu/drm/nouveau/dispnv50/head.c |   5 +-
 3 files changed, 64 insertions(+), 44 deletions(-)

--=20
2.21.0
