From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 00/12] TV-out modesetting kernel patches.
Date: Wed, 12 Aug 2009 02:14:56 +0200
Message-ID: <1250036108-28655-1-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This patch series adds TV-out modesetting support to the KMS
implementation. 

I've tried to test it on all the hardware I've got at hand (that is
nv11, nv17, nv34, nv35, nv40, nv4b) with every possible output
combination; I believe it has reached a mergeable state, however it
depends on some commits from drm-next that haven't got into Linus'
tree yet, if you agree to merge this they could be cherry-picked, they
are:

d782c3f95c9263dc0b98e7115f75f1e18b9600b3 drm/mode: add the CVT algorithm in kernel space
2066facca4c7dfe9f5068ece0200a4dbf10f49e1 drm/kms: slave encoder interface.
74bd3c26b90f39b9dcc05c471333da8998572b5d drm: Define DRM_MODE_CONNECTOR_TV
aeaa1ad3ff32be833680e484d99ec29d892da1ff drm: Define DRM_MODE_SUBCONNECTOR_SCART
b6b7902e54c7e8abbc213d8bdc290350c00ccfe5 drm: Define some new standard TV properties.

OTOH, I think merging drm-next would do no harm. PATCH1-2 haven't been
pushed there yet, I will forward them to dri-devel@ shortly. 

So, this should make TV-out work on all the pre-nv50 GPUs with an
integrated encoder (that is, nv17-nv4x, nv2x excluded). Only Chrontel
ch7006 and similar external encoders will work for now, implementing
more should be straightforward as they seem to be all documented.

Another patchset follows with some DDX modifications needed to make
use of this.

[PATCH 01/12] drm: Fix drm_cvt_mode() for interlaced modes.
[PATCH 02/12] drm: Add more standard TV properties.
[PATCH 03/12] drm/nouveau: Fix a lock up at NVSetOwner with nv11.
[PATCH 04/12] drm/nouveau: Fix fbcon with multiple outputs connected.
[PATCH 05/12] drm/nouveau: Use drm_encoder_slave instead of drm_encoder.
[PATCH 06/12] drm/nouveau: Prepare the connector code for TV-out.
[PATCH 07/12] drm/nouveau: Restructure the nv04 modesetting code.
[PATCH 08/12] drm/nouveau: Parse some more BIOS parameters needed for TV-out.
[PATCH 09/12] drm/nouveau: Add some new register defines needed for TV-out.
[PATCH 10/12] drm: Import driver for the ch7006 I2C TV encoder chip.
[PATCH 11/12] drm/nouveau: Import <nv17 TV-out support.
[PATCH 12/12] drm/nouveau: Import >=nv17 TV-out support.

 drivers/gpu/drm/Kconfig                     |   14 +
 drivers/gpu/drm/Makefile                    |    1 +
 drivers/gpu/drm/drm_crtc.c                  |   18 +
 drivers/gpu/drm/drm_modes.c                 |    2 +-
 drivers/gpu/drm/i2c/Makefile                |    3 +
 drivers/gpu/drm/i2c/ch7006_drv.c            |  479 ++++++++++++++++
 drivers/gpu/drm/i2c/ch7006_mode.c           |  470 ++++++++++++++++
 drivers/gpu/drm/i2c/ch7006_priv.h           |  332 +++++++++++
 drivers/gpu/drm/nouveau/Makefile            |    4 +-
 drivers/gpu/drm/nouveau/nouveau_bios.c      |   80 ++-
 drivers/gpu/drm/nouveau/nouveau_bios.h      |    4 +
 drivers/gpu/drm/nouveau/nouveau_connector.c |  200 ++++----
 drivers/gpu/drm/nouveau/nouveau_drv.h       |   52 ++-
 drivers/gpu/drm/nouveau/nouveau_encoder.h   |   11 +-
 drivers/gpu/drm/nouveau/nouveau_fbcon.c     |   18 +-
 drivers/gpu/drm/nouveau/nouveau_hw.c        |   73 +++-
 drivers/gpu/drm/nouveau/nouveau_i2c.c       |    6 +-
 drivers/gpu/drm/nouveau/nouveau_i2c.h       |    1 +
 drivers/gpu/drm/nouveau/nv04_crtc.c         |  266 ++-------
 drivers/gpu/drm/nouveau/nv04_dac.c          |  525 ++++++++++++++++++
 drivers/gpu/drm/nouveau/nv04_dfp.c          |  611 ++++++++++++++++++++
 drivers/gpu/drm/nouveau/nv04_display.c      |   35 +-
 drivers/gpu/drm/nouveau/nv04_output.c       |  797 ---------------------------
 drivers/gpu/drm/nouveau/nv04_tv.c           |  306 ++++++++++
 drivers/gpu/drm/nouveau/nv17_tv.c           |  623 +++++++++++++++++++++
 drivers/gpu/drm/nouveau/nv17_tv.h           |  151 +++++
 drivers/gpu/drm/nouveau/nv17_tv_modes.c     |  580 +++++++++++++++++++
 drivers/gpu/drm/nouveau/nv50_crtc.c         |    2 +-
 drivers/gpu/drm/nouveau/nv50_dac.c          |   18 +-
 drivers/gpu/drm/nouveau/nv50_sor.c          |   28 +-
 drivers/gpu/drm/nouveau/nvreg.h             |   38 ++-
 include/drm/drm_crtc.h                      |    3 +
 include/drm/i2c/ch7006.h                    |   86 +++
 33 files changed, 4627 insertions(+), 1210 deletions(-)
