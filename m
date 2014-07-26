From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/3] drm/gk20a: support for reclocking
Date: Sat, 26 Jul 2014 18:41:38 +0900
Message-ID: <1406367701-9155-1-git-send-email-gnurou@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Second version of the gk20a clock patches. I have tried to keep the therm and
volt devices mandatory in the clock driver, but unfortunately they are too tied
to bios to allow this, at least for the moment. Consequently this version is
mostly a port of the first version to Ben's tree.

Ben, please let me know what I have done wrong in terms of integration to your
tree, as the main purpose of writing patches against it instead of the kernel
is to make your life easier. :)

Alexandre Courbot (3):
  clk: make therm and volt devices optional
  clk: support for non-BIOS pstates
  gk20a: reclocking support

 drm/Kbuild                      |   1 +
 drm/core/os.h                   |   1 +
 drm/core/subdev/clock/gk20a.c   |   1 +
 drm/core/subdev/fb/ramgk20a.h   |   1 +
 drm/core/subdev/instmem/gk20a.c |   1 +
 lib/core/os.h                   |  10 +
 nvkm/engine/device/nve0.c       |   1 +
 nvkm/include/subdev/clock.h     |   9 +-
 nvkm/subdev/clock/Makefile.am   |   1 +
 nvkm/subdev/clock/base.c        |  52 ++--
 nvkm/subdev/clock/gk20a.c       | 665 ++++++++++++++++++++++++++++++++++++++++
 nvkm/subdev/clock/nv04.c        |   4 +-
 nvkm/subdev/clock/nv40.c        |   4 +-
 nvkm/subdev/clock/nv50.c        |   2 +-
 nvkm/subdev/clock/nva3.c        |   4 +-
 nvkm/subdev/clock/nvaa.c        |   4 +-
 nvkm/subdev/clock/nvc0.c        |   4 +-
 nvkm/subdev/clock/nve0.c        |   4 +-
 18 files changed, 735 insertions(+), 34 deletions(-)
 create mode 120000 drm/core/subdev/clock/gk20a.c
 create mode 120000 drm/core/subdev/fb/ramgk20a.h
 create mode 120000 drm/core/subdev/instmem/gk20a.c
 create mode 100644 nvkm/subdev/clock/gk20a.c

-- 
2.0.2
