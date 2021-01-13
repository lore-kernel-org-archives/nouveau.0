From: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 00/30] [Set 13] Finally rid W=1 warnings from GPU
Date: Wed, 13 Jan 2021 08:07:22 +0000
Message-ID: <20210113080752.1003793-1-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-media-owner@vger.kernel.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org, Anthony Koo <Anthony.Koo@amd.com>, Ben Skeggs <bskeggs@redhat.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>, Jeremy Kolb <jkolb@brandeis.edu>, Leo Li <sunpeng.li@amd.com>, linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org, Lyude Paul <lyude@redhat.com>, Mauro Rossi <issor.oruam@gmail.com>, Noah Abradjian <noah.abradjian@amd.com>, nouveau@lists.freedesktop.org, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Sumit Semwal <sumit.semwal@lin>
List-Id: nouveau.vger.kernel.org

This set is part of a larger effort attempting to clean-up W=1
kernel builds, which are currently overwhelmingly riddled with
niggly little warnings.

0 out of 5000 left!

LAST SET!  You're all clean.  Can you believe it!?

Lee Jones (30):
  drm/amd/display/dc/dc_helper: Include our own header, containing
    prototypes
  drm/amd/include/renoir_ip_offset: Mark top-level IP_BASE as
    __maybe_unused
  drm/amd/display/dmub/src/dmub_dcn30: Include our own header containing
    prototypes
  drm/amd/display/modules/power/power_helpers: Staticify local functions
  drm/amd/display/modules/info_packet/info_packet: Correct kernel-doc
    formatting
  drm/amd/display/dc/core/dc_resource: Staticify local functions
  drm/amd/display/dc/core/dc_link: Remove unused variable 'status'
  drm/amd/display/dc/core/dc_link_dp: Staticify local function
    'linkRateInKHzToLinkRateMultiplier'
  drm/amd/display/dc/dce112/dce112_resource: Include our own header file
    containing prototypes
  drm/amd/display/dc/core/dc: Staticise local function
    'apply_ctx_interdependent_lock'
  drm/amd/display/dc/dce100/Makefile: Ignore -Woverride-init warning
  drm/amd/display/dc/dce100/dce100_resource: Include our own header
    containing prototypes
  drm/amd/display/dc/dce60/Makefile: Ignore -Woverride-init warning
  drm/amd/display/dc/dce80/Makefile: Ignore -Woverride-init warning
  drm/amd/display/dc/dce80/dce80_resource: Include our own header
    containing prototypes
  fixup! drm/amd/display/dc/dce60/Makefile: Ignore -Woverride-init
    warning
  drm/amd/display/dc/dce60/dce60_resource: Include our own header
    containing prototypes
  drm/amd/display/dc/core/dc_link: Move some local data from the stack
    to the heap
  drm/amd/display/dc/core/dc_link_dp: Mark 'result_write_min_hblank' as
    __maybe_unused
  drm/amd/display/dc/core/dc: Fix a bunch of documentation misdemeanours
  drm/amd/display/dc/core/dc_resource: Demote some kernel-doc abuses
  drm/amd/display/dc/core/dc_link: Fix a couple of function
    documentation issues
  drm/nouveau/nvkm/engine/gr/gf100: Demote non-conformant kernel-doc
    header
  drm/nouveau/nouveau_bo: Remove unused variables 'dev'
  drm/nouveau/nouveau_display: Remove set but unused variable 'width'
  drm/nouveau/dispnv04/crtc: Demote non-conforming kernel-doc headers
  drm/nouveau/dispnv50/disp: Remove unused variable 'ret' from function
    returning void
  drm/nouveau/dispnv50/headc57d: Make local function 'headc57d_olut'
    static
  drm/nouveau/nv50_display: Remove superfluous prototype for local
    static functions
  drm/nouveau/dispnv50/disp: Include header containing our prototypes

 drivers/gpu/drm/amd/display/dc/core/dc.c      | 36 +++++++++----------
 drivers/gpu/drm/amd/display/dc/core/dc_link.c | 31 ++++++++--------
 .../gpu/drm/amd/display/dc/core/dc_link_dp.c  |  4 +--
 .../gpu/drm/amd/display/dc/core/dc_resource.c | 14 ++++----
 drivers/gpu/drm/amd/display/dc/dc_helper.c    |  1 +
 .../gpu/drm/amd/display/dc/dce100/Makefile    |  2 ++
 .../amd/display/dc/dce100/dce100_resource.c   |  2 ++
 .../amd/display/dc/dce112/dce112_resource.c   |  4 ++-
 drivers/gpu/drm/amd/display/dc/dce60/Makefile |  2 ++
 .../drm/amd/display/dc/dce60/dce60_resource.c |  2 ++
 drivers/gpu/drm/amd/display/dc/dce80/Makefile |  2 ++
 .../drm/amd/display/dc/dce80/dce80_resource.c |  2 ++
 .../gpu/drm/amd/display/dmub/src/dmub_dcn30.c |  1 +
 .../display/modules/info_packet/info_packet.c | 13 +++----
 .../amd/display/modules/power/power_helpers.c |  6 ++--
 .../gpu/drm/amd/include/renoir_ip_offset.h    |  2 +-
 drivers/gpu/drm/nouveau/dispnv04/crtc.c       |  4 +--
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  7 ++--
 drivers/gpu/drm/nouveau/dispnv50/headc57d.c   |  2 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c          |  4 ---
 drivers/gpu/drm/nouveau/nouveau_display.c     |  8 ++---
 drivers/gpu/drm/nouveau/nv50_display.h        |  3 --
 .../gpu/drm/nouveau/nvkm/engine/gr/gf100.c    |  2 +-
 23 files changed, 80 insertions(+), 74 deletions(-)

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: Anthony Koo <Anthony.Koo@amd.com>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Jeremy Kolb <jkolb@brandeis.edu>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-media@vger.kernel.org
Cc: Lyude Paul <lyude@redhat.com>
Cc: Mauro Rossi <issor.oruam@gmail.com>
Cc: Noah Abradjian <noah.abradjian@amd.com>
Cc: nouveau@lists.freedesktop.org
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
-- 
2.25.1
