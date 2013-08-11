From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 00/10] Add support for MPEG2 and VC-1 on VP3/VP4
	for NV98-NVAF
Date: Sun, 11 Aug 2013 03:19:08 -0400
Message-ID: <1376205558-23540-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
Errors-To: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
To: Maarten Lankhorst <maarten.lankhorst@ubuntu.com>
Cc: mesa-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

As it turns out, with the proprietary firmware, the VP3 and VP4 interfaces are
identical. Furthermore, this is all already implemented for nvc0. So these
patches (a) move the easily sharable bits of the nvc0 implementation into the
nouveau directory, and then (b) implement the other parts in nv50. The
non-shared parts are still largely copies, but there are some differences, not
the least of which is the BEGIN_NV04 vs BEGIN_NVC0 stuff. Probably more
refactoring is possible, but right now there is ~1k lines of code in nouveau,
and ~1k lines of code in each of nvc0/nvc0_video* and nv50/nv98_video*.

For whatever reason, h264 and mpeg4 don't work "out of the box". With h264,
the decoder hangs after decoding a few frames, and I think reports are that
mpeg4 just doesn't work at all. (I also seem to remember hearing that mpeg4
didn't work on nvc0+ either, so that's likely related.) I played with it a
bunch, but I couldn't figure out what was wrong. Getting h264 to work will be
a larger effort, and will be able to build on this patchset. For now h264 and
mpeg4 are not reported in the capabilities of pre-nvc0 cards.

This patchset has received limited testing on VP3, pre-nvc0 VP4, post-nvc0
VP4, and VP5. It's worth noting that the mpeg1 decoding looks all weird and
blocky, but it's the exact same issue as when using the blob. And the same bug
exists on VP2 (although not with mesa/xvmc). They probably are missing some
detail about difference of mpeg2 vs mpeg1 (oddification maybe? who
knows... same bug exists with mesa/vdpau on top of VP2, so it's something
subtle that mplayer/ffmpeg gets right but mesa's and nvidia's mpeg parsers
don't).

For people who aren't already intimately familiar with the video decoding
acceleration situation on nvidia cards, take a look at
http://nouveau.freedesktop.org/wiki/VideoAcceleration/ for information on how
to obtain firmware, what kernels to use, what cards support what, etc.

You can also find these patches at https://github.com/imirkin/mesa.git vp4-2

For reviewing purposes, you might prefer to look at the patches with diff -M
 -C although I didn't think that would be appropriate for sending to the ML.

Ilia Mirkin (10):
  nvc0: refactor video buffer management logic into nouveau_vp3
  nvc0: standardize on using #if for NVC0_DEBUG_FENCE
  nvc0: move nvc0_decoder into nouveau, rename to nouveau_vp3_decoder
  nvc0: move bsp param-filling logic into nouveau
  nvc0: move vp param filling logic into nouveau
  nvc0: move some of the simpler decoder functions into nouveau
  nvc0: move firmware loading functions to nouveau
  nvc0: move video param and format support functions to nouveau
  nv50: separate video logic from noalloc
  nv50: add vp3/vp4 support for mpeg2/vc1

 src/gallium/drivers/nouveau/Makefile.sources       |   5 +-
 src/gallium/drivers/nouveau/nouveau_vp3_video.c    | 399 ++++++++++++++++
 src/gallium/drivers/nouveau/nouveau_vp3_video.h    | 228 ++++++++++
 .../drivers/nouveau/nouveau_vp3_video_bsp.c        | 310 +++++++++++++
 src/gallium/drivers/nouveau/nouveau_vp3_video_vp.c | 485 ++++++++++++++++++++
 src/gallium/drivers/nv50/Makefile.sources          |   6 +-
 src/gallium/drivers/nv50/nv50_context.c            |   5 +-
 src/gallium/drivers/nv50/nv50_context.h            |  14 +
 src/gallium/drivers/nv50/nv50_miptree.c            |   6 +-
 src/gallium/drivers/nv50/nv50_resource.h           |   1 +
 src/gallium/drivers/nv50/nv50_screen.c             |   7 +-
 src/gallium/drivers/nv50/nv50_winsys.h             |   4 -
 src/gallium/drivers/nv50/nv84_video.c              |   2 +-
 src/gallium/drivers/nv50/nv84_video.h              |   4 +
 src/gallium/drivers/nv50/nv98_video.c              | 308 +++++++++++++
 src/gallium/drivers/nv50/nv98_video.h              |  48 ++
 src/gallium/drivers/nv50/nv98_video_bsp.c          | 159 +++++++
 src/gallium/drivers/nv50/nv98_video_ppp.c          | 143 ++++++
 src/gallium/drivers/nv50/nv98_video_vp.c           | 202 +++++++++
 src/gallium/drivers/nvc0/nvc0_context.h            |   5 -
 src/gallium/drivers/nvc0/nvc0_screen.c             |  18 +-
 src/gallium/drivers/nvc0/nvc0_video.c              | 332 +-------------
 src/gallium/drivers/nvc0/nvc0_video.h              | 191 +-------
 src/gallium/drivers/nvc0/nvc0_video_bsp.c          | 301 +-----------
 src/gallium/drivers/nvc0/nvc0_video_ppp.c          |  16 +-
 src/gallium/drivers/nvc0/nvc0_video_vp.c           | 502 +--------------------
 26 files changed, 2396 insertions(+), 1305 deletions(-)
 create mode 100644 src/gallium/drivers/nouveau/nouveau_vp3_video.c
 create mode 100644 src/gallium/drivers/nouveau/nouveau_vp3_video.h
 create mode 100644 src/gallium/drivers/nouveau/nouveau_vp3_video_bsp.c
 create mode 100644 src/gallium/drivers/nouveau/nouveau_vp3_video_vp.c
 create mode 100644 src/gallium/drivers/nv50/nv98_video.c
 create mode 100644 src/gallium/drivers/nv50/nv98_video.h
 create mode 100644 src/gallium/drivers/nv50/nv98_video_bsp.c
 create mode 100644 src/gallium/drivers/nv50/nv98_video_ppp.c
 create mode 100644 src/gallium/drivers/nv50/nv98_video_vp.c

-- 
1.8.1.5
