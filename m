From: Lucas Stach <dev@lynxeye.de>
Subject: [PATCH 0/6] Nouveau on ARM fixes
Date: Wed, 28 Aug 2013 02:00:44 +0200
Message-ID: <1377648050-6649-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: nouveau@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

This is the first set of patches to make Nouveau work
on Tegra. Those are only the obvious correctness fixes,
a lot of optimization work remains to be done, but at least
it's enough to get accel working and let the machine survive
a piglit run.

A new BO flag is introduced to allow userspace to hint the
kernel about possible optimizations.

Lucas Stach (6):
  drm/ttm: recognize ARM arch in ioprot handler
  drm/ttm: introduce dma cache sync helpers
  drm/nouveau: hook up cache sync functions
  drm/nouveau: introduce NOUVEAU_GEM_TILE_WCUS
  drm/nouveau: map IB write-combined
  drm/nouveau: use MSI interrupts

 drivers/gpu/drm/nouveau/core/include/subdev/mc.h |  1 +
 drivers/gpu/drm/nouveau/core/subdev/mc/base.c    | 17 ++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_bo.c             | 15 ++++++++++++-
 drivers/gpu/drm/nouveau/nouveau_bo.h             |  1 +
 drivers/gpu/drm/nouveau/nouveau_chan.c           |  3 ++-
 drivers/gpu/drm/nouveau/nouveau_gem.c            |  5 +++++
 drivers/gpu/drm/ttm/ttm_bo_util.c                |  2 +-
 drivers/gpu/drm/ttm/ttm_tt.c                     | 25 +++++++++++++++++++++
 include/drm/ttm/ttm_bo_driver.h                  | 28 ++++++++++++++++++++++++
 include/uapi/drm/nouveau_drm.h                   |  1 +
 10 files changed, 95 insertions(+), 3 deletions(-)

-- 
1.8.3.1
