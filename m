From: Jeremy Cline <jcline@redhat.com>
Subject: [PATCH 3/3] drm/nouveau: begin documenting core nouveau structures
Date: Thu,  5 Nov 2020 21:16:56 -0500
Message-ID: <20201106021656.40743-4-jcline@redhat.com>
References: <20201106021656.40743-1-jcline@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20201106021656.40743-1-jcline@redhat.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, Jeremy Cline <jcline@redhat.com>
List-Id: nouveau.vger.kernel.org

Start on documentation for the Nouveau device structure and the NVIF
client structure it uses. This documentation is not complete as the
structures are non-trivial and I am not familiar with large portions of
them.

Signed-off-by: Jeremy Cline <jcline@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h | 67 +++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index cf6c33e52a5c..cf83d4bf3c6c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -90,8 +90,20 @@ enum nouveau_drm_handle {
 	NVDRM_NVSW    = 0x55550000,
 };
 
+/**
+ * struct nouveau_cli - A DRM-specific NVIF client.
+ *
+ * This encapsulates a NVIF client and is intended to be the sole interface
+ * between the DRM APIs and NVKM. An instance of this structure is allocated
+ * for each userspace client when they open the device file. Additionally,
+ * there are several allocated strictly for the kernel's use.
+ */
 struct nouveau_cli {
 	struct nvif_client base;
+
+	/**
+	 * @drm: A reference to the device that the client is associated with.
+	 */
 	struct nouveau_drm *drm;
 	struct mutex mutex;
 
@@ -101,6 +113,9 @@ struct nouveau_cli {
 	struct nouveau_vmm svm;
 	const struct nvif_mclass *mem;
 
+	/**
+	 * @head: The list entry for this client in the @drm device's list of clients.
+	 */
 	struct list_head head;
 	void *abi16;
 	struct list_head objects;
@@ -108,13 +123,36 @@ struct nouveau_cli {
 	char name[32];
 
 	struct work_struct work;
+
+	/**
+	 * @worker: List of pending &struct nouveau_cli_work associated with this client.
+	 */
 	struct list_head worker;
+
+	/**
+	 * @lock: Protects the @worker list. Additionally, this lock on the
+	 * @drm.master instance is used to serialize destruction of the @base
+	 * member in this structure, as well as the destruction of the &struct
+	 * nvif_mem embedded in &struct nouveau_mem instances.
+	 */
 	struct mutex lock;
 };
 
+/**
+ * struct nouveau_cli_work - A pending work item for an NVIF client.
+ */
 struct nouveau_cli_work {
 	void (*func)(struct nouveau_cli_work *);
+
+	/**
+	 * @cli: Reference to the NVIF client this work belongs to.
+	 */
 	struct nouveau_cli *cli;
+
+	/**
+	 * @head: The list entry for this work item in the &struct nouveau_cli
+	 * worker list.
+	 */
 	struct list_head head;
 
 	struct dma_fence *fence;
@@ -133,9 +171,32 @@ nouveau_cli(struct drm_file *fpriv)
 #include <nvif/object.h>
 #include <nvif/parent.h>
 
+/**
+ * struct nouveau_drm - The nouveau-specific device structure.
+ *
+ * This structure is allocated for a device when it is probed and keeps track
+ * of all the nouveau-specific device details. The lifetime of this structure
+ * is the same as the lifetime of a &struct drm_device and is managed by the
+ * DRM layer.
+ */
 struct nouveau_drm {
+	/**
+	 * @parent: Implementation of the interface required to use the NVIF_DEBUG
+	 * and NVIF_ERROR macros
+	 */
 	struct nvif_parent parent;
+
+	/**
+	 * @master: This NVIF client is used to initialize the NVIF driver and used
+	 * for TTM memory allocations. It is the root of the NVIF object tree.
+	 */
 	struct nouveau_cli master;
+
+	/**
+	 * @client: This NVIF client is used by the DRM layer to interact with
+	 * the NVKM layer for everything except TTM memory allocations. It, and
+	 * all other clients, are children of the primary (@master) client.
+	 */
 	struct nouveau_cli client;
 
 	/**
@@ -143,6 +204,12 @@ struct nouveau_drm {
 	 */
 	struct drm_device drm_dev;
 
+	/**
+	 * @clients: List of all &struct nouveau_cli allocated for userspace
+	 * associated with this DRM device. Clients are allocated when the DRM
+	 * file is opened and deallocated when the file is closed. This list is
+	 * protected by the mutex in @client.
+	 */
 	struct list_head clients;
 
 	u8 old_pm_cap;
-- 
2.28.0
