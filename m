From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: nouveau_subdev & misc patches
Date: Mon, 21 May 2012 00:14:49 +0100
Message-ID: <1337555703-18925-1-git-send-email-emil.l.velikov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hello all, this series includes a wide range of fixes - from a few
month's old one-liners from Andreas Heider regarding vga_switcheroo, via a
null pointer dereference and double memory allocation, to a buffer overflow.

Please review and comment

---
 drivers/gpu/drm/nouveau/nouveau_acpi.c   |    3 ++-
 drivers/gpu/drm/nouveau/nouveau_device.c |   26 +++++++++++++++-----------
 drivers/gpu/drm/nouveau/nouveau_fb.h     |    1 -
 drivers/gpu/drm/nouveau/nouveau_gpio.h   |    3 ---
 drivers/gpu/drm/nouveau/nouveau_gpuobj.c |   12 ++++--------
 drivers/gpu/drm/nouveau/nouveau_perf.c   |    2 +-
 drivers/gpu/drm/nouveau/nouveau_pm.c     |    6 +++---
 drivers/gpu/drm/nouveau/nouveau_state.c  |    2 ++
 drivers/gpu/drm/nouveau/nouveau_therm.c  |   63 +++++++++++++++++++++++++++++++++++++++++++++++++--------------
 drivers/gpu/drm/nouveau/nv04_instmem.c   |    3 +--
 drivers/gpu/drm/nouveau/nv10_fb.c        |    4 ----
 drivers/gpu/drm/nouveau/nv10_gpio.c      |   16 ++++++++--------
 drivers/gpu/drm/nouveau/nv30_fb.c        |    3 +--
 drivers/gpu/drm/nouveau/nv40_fanpwm.c    |   14 +++++++-------
 drivers/gpu/drm/nouveau/nv40_fb.c        |   11 ++++-------
 drivers/gpu/drm/nouveau/nv50_bar.c       |    2 --
 drivers/gpu/drm/nouveau/nv50_fanpwm.c    |   20 ++++++++++----------
 drivers/gpu/drm/nouveau/nv50_gpio.c      |   16 ++++++++--------
 drivers/gpu/drm/nouveau/nv50_instmem.c   |   10 +++-------
 drivers/gpu/drm/nouveau/nvc0_instmem.c   |   10 +++-------
 drivers/gpu/drm/nouveau/nvd0_gpio.c      |   16 ++++++++--------
 21 files changed, 129 insertions(+), 114 deletions(-)
