From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH 0/3] drm/dp_mst: Fix bandwidth checking regressions from DSC patches
Date: Wed,  4 Mar 2020 17:36:10 -0500
Message-ID: <20200304223614.312023-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: Mikita Lipski <mikita.lipski@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Sean Paul <seanpaul@google.com>, Hans de Goede <hdegoede@redhat.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, Lyude Paul <lyude@redhat.com>
List-Id: nouveau.vger.kernel.org

AMD's patch series for adding DSC support to the MST helpers
unfortunately introduced a few regressions into the kernel that I didn't
get around to fixing until just now. I would have reverted the changes
earlier, but seeing as that would have reverted all of amd's DSC support
+ everything that was done on top of that I realllllly wanted to avoid
doing that.

Anyway, this should fix everything as far as I can tell. Note that I
don't have any DSC displays locally yet, so if someone from AMD could
sanity check this I would appreciate it =E2=99=A5.

Cc: Mikita Lipski <mikita.lipski@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Sean Paul <seanpaul@google.com>
Cc: Hans de Goede <hdegoede@redhat.com>

Lyude Paul (3):
  drm/dp_mst: Rename drm_dp_mst_is_dp_mst_end_device() to be less
    redundant
  drm/dp_mst: Don't show connectors as connected before probing
    available PBN
  drm/dp_mst: Rewrite and fix bandwidth limit checks

 drivers/gpu/drm/drm_dp_mst_topology.c | 124 ++++++++++++++++++++------
 1 file changed, 96 insertions(+), 28 deletions(-)

--=20
2.24.1
