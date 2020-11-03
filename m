From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.8 28/29] drm/nouveau/gem: fix "refcount_t: underflow; use-after-free"
Date: Mon,  2 Nov 2020 20:19:27 -0500
Message-ID: <20201103011928.183145-28-sashal@kernel.org>
References: <20201103011928.183145-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20201103011928.183145-1-sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Karol Herbst <kherbst@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

From: Karol Herbst <kherbst@redhat.com>

[ Upstream commit 925681454d7b557d404b5d28ef4469fac1b2e105 ]

we can't use nouveau_bo_ref here as no ttm object was allocated and
nouveau_bo_ref mainly deals with that. Simply deallocate the object.

Signed-off-by: Karol Herbst <kherbst@redhat.com>
Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_gem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index c5ee5b7364a09..ee5fec1ad9a46 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -197,7 +197,8 @@ nouveau_gem_new(struct nouveau_cli *cli, u64 size, int align, uint32_t domain,
 	 * to the caller, instead of a normal nouveau_bo ttm reference. */
 	ret = drm_gem_object_init(drm->dev, &nvbo->bo.base, size);
 	if (ret) {
-		nouveau_bo_ref(NULL, &nvbo);
+		drm_gem_object_release(&nvbo->bo.base);
+		kfree(nvbo);
 		return ret;
 	}
 
-- 
2.27.0
