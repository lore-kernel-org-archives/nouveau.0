From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/2] drm/msm: Use struct dma_buf_map in GEM vmap ops
Date: Mon,  9 Nov 2020 11:32:41 +0100
Message-ID: <20201109103242.19544-2-tzimmermann@suse.de>
References: <20201109103242.19544-1-tzimmermann@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20201109103242.19544-1-tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, robdclark@gmail.com, sean@poorly.run
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Dave Airlie <airlied@redhat.com>, Lucas Stach <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner <christian.gmeiner@gmail.com>, Qiang Yu <yuq825@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Steven Price <steven.price@arm.com>, Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, Gerd Hoffmann <kraxel@redhat.com>, Alex Deucher <alexander.deucher@amd.com>
List-Id: nouveau.vger.kernel.org

Fixes a build failure with msm.

This change was supposed to be part of commit 49a3f51dfeee ("drm/gem:
Use struct dma_buf_map in GEM vmap ops and convert GEM backends"), but
msm was forgotten.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 49a3f51dfeee ("drm/gem: Use struct dma_buf_map in GEM vmap ops and convert GEM backends")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Christian König <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Qiang Yu <yuq825@gmail.com>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Sandy Huang <hjc@rock-chips.com>
Cc: "Heiko Stübner" <heiko@sntech.de>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Eric Anholt <eric@anholt.net>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc: Melissa Wen <melissa.srw@gmail.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Emil Velikov <emil.velikov@collabora.com>
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Arunpravin <apaneers@amd.com>
Cc: Huang Rui <ray.huang@amd.com>
Cc: Madhav Chauhan <madhav.chauhan@amd.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Qinglang Miao <miaoqinglang@huawei.com>
Cc: dri-devel@lists.freedesktop.org
Cc: etnaviv@lists.freedesktop.org
Cc: lima@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: virtualization@lists.linux-foundation.org
Cc: spice-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: xen-devel@lists.xenproject.org
---
 drivers/gpu/drm/msm/msm_drv.h       |  4 ++--
 drivers/gpu/drm/msm/msm_gem_prime.c | 13 ++++++++++---
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index c45789f36e48..a6aef687bc6e 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -295,8 +295,8 @@ int msm_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
 int msm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
 		uint32_t handle, uint64_t *offset);
 struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object *obj);
-void *msm_gem_prime_vmap(struct drm_gem_object *obj);
-void msm_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr);
+int msm_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
+void msm_gem_prime_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map);
 int msm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
 struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
 		struct dma_buf_attachment *attach, struct sg_table *sg);
diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
index 515ef80816a0..9880348a4dc7 100644
--- a/drivers/gpu/drm/msm/msm_gem_prime.c
+++ b/drivers/gpu/drm/msm/msm_gem_prime.c
@@ -22,12 +22,19 @@ struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object *obj)
 	return drm_prime_pages_to_sg(obj->dev, msm_obj->pages, npages);
 }
 
-void *msm_gem_prime_vmap(struct drm_gem_object *obj)
+int msm_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
 {
-	return msm_gem_get_vaddr(obj);
+	void *vaddr;
+
+	vaddr = msm_gem_get_vaddr(obj);
+	if (IS_ERR(vaddr))
+		return PTR_ERR(vaddr);
+	dma_buf_map_set_vaddr(map, vaddr);
+
+	return 0;
 }
 
-void msm_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr)
+void msm_gem_prime_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map)
 {
 	msm_gem_put_vaddr(obj);
 }
-- 
2.29.2
