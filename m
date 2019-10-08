From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH 2/5] drm/nouveau/fifo/tu102: make tu102_fifo_runlist static
Date: Tue,  8 Oct 2019 12:35:56 +0100
Message-ID: <20191008113559.29569-2-ben.dooks@codethink.co.uk>
References: <20191008113559.29569-1-ben.dooks@codethink.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191008113559.29569-1-ben.dooks@codethink.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Ben Dooks <ben.dooks@codethink.co.uk>
List-Id: nouveau.vger.kernel.org

The tu102_fifo_runlist is not exorted, so make it static
to avoid the following warning:

drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c:47:1: warning: symbol 'tu102_fifo_runlist' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c
index 005f3e1729b9..3e78f5b6accb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c
@@ -43,7 +43,7 @@ tu102_fifo_runlist_commit(struct gk104_fifo *fifo, int runl,
 	/*XXX: how to wait? can you even wait? */
 }
 
-const struct gk104_fifo_runlist_func
+static const struct gk104_fifo_runlist_func
 tu102_fifo_runlist = {
 	.size = 16,
 	.cgrp = gv100_fifo_runlist_cgrp,
-- 
2.23.0
