From: Ralph Campbell <rcampbell@nvidia.com>
Subject: [PATCH] drm/nouveau/dmem: missing mutex_lock in error path
Date: Thu, 13 Jun 2019 17:11:21 -0700
Message-ID: <20190614001121.23950-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Glisse <jglisse@redhat.com>, David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
Cc: nouveau@lists.freedesktop.org, linux-mm@kvack.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Ralph Campbell <rcampbell@nvidia.com>
List-Id: nouveau.vger.kernel.org

In nouveau_dmem_pages_alloc(), the drm->dmem->mutex is unlocked before
calling nouveau_dmem_chunk_alloc().
Reacquire the lock before continuing to the next page.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
---

I found this while testing Jason Gunthorpe's hmm tree but this is
independant of those changes. I guess it could go through
David Airlie's tree for nouveau or Jason's tree.

 drivers/gpu/drm/nouveau/nouveau_dmem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouve=
au/nouveau_dmem.c
index 27aa4e72abe9..00f7236af1b9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -379,9 +379,10 @@ nouveau_dmem_pages_alloc(struct nouveau_drm *drm,
 			ret =3D nouveau_dmem_chunk_alloc(drm);
 			if (ret) {
 				if (c)
-					break;
+					return 0;
 				return ret;
 			}
+			mutex_lock(&drm->dmem->mutex);
 			continue;
 		}
=20
--=20
2.20.1
