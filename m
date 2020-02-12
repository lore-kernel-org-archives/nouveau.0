From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH 0/4] drm/nouveau: DP interlace fixes
Date: Wed, 12 Feb 2020 18:00:34 -0500
Message-ID: <20200212230043.170477-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: Daniel Vetter <daniel@ffwll.ch>, Mikita Lipski <mikita.lipski@amd.com>, David Airlie <airlied@linux.ie>, Takashi Iwai <tiwai@suse.de>, Manasi Navare <manasi.d.navare@intel.com>, Sean Paul <seanpaul@chromium.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, Lyude Paul <lyude@redhat.com>, Ilia Mirkin <imirkin@alum.mit.edu>, Dave Airlie <airlied@redhat.com>, Alex Deucher <alexander.deucher@amd.com>
List-Id: nouveau.vger.kernel.org

Currently, nouveau doesn't actually bother to try probing whether or not
it can actually handle interlaced modes over DisplayPort. As a result,
on volta and later we'll end up trying to set an interlaced mode even
when it's not supported and cause the front end for the display engine
to hang.

So, let's teach nouveau to reject interlaced modes on hardware that
can't actually handle it. Additionally for MST, since we accomplish this
by simply reusing more of the SST mode validation we also get (some)
basic bw validation for modes we detect on MST connectors completely for
free.

Lyude Paul (4):
  drm/nouveau/kms/nv50-: Probe SOR caps for DP interlacing support
  drm/nouveau/kms/gv100-: Add support for interlaced modes
  drm/nouveau/kms/nv50-: Move 8BPC limit for MST into
    nv50_mstc_get_modes()
  drm/nouveau/kms/nv50-: Share DP SST mode_valid() handling with MST

 drivers/gpu/drm/nouveau/dispnv50/disp.c     | 55 ++++++++++++++-------
 drivers/gpu/drm/nouveau/dispnv50/headc37d.c |  5 +-
 drivers/gpu/drm/nouveau/dispnv50/headc57d.c |  5 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c | 43 ++++++++++------
 drivers/gpu/drm/nouveau/nouveau_connector.h |  5 ++
 drivers/gpu/drm/nouveau/nouveau_dp.c        | 27 ++++++++++
 drivers/gpu/drm/nouveau/nouveau_encoder.h   |  7 +++
 7 files changed, 108 insertions(+), 39 deletions(-)

--=20
2.24.1
