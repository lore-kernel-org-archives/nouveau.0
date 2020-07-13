From: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 2/5] mm/migrate: add a direction parameter to
 migrate_vma
Date: Mon, 13 Jul 2020 10:21:46 -0700
Message-ID: <20200713172149.2310-3-rcampbell@nvidia.com>
References: <20200713172149.2310-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200713172149.2310-1-rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, kvm-ppc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Bharata B Rao <bharata-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>, Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Shuah Khan <shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
List-Id: nouveau.vger.kernel.org

The src_owner field in struct migrate_vma is being used for two purposes,
it implies the direction of the migration and it identifies device private
pages owned by the caller. Split this into separate parameters so the
src_owner field can be used just to identify device private pages owned
by the caller of migrate_vma_setup().

Signed-off-by: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Reviewed-by: Bharata B Rao <bharata-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>
---
 arch/powerpc/kvm/book3s_hv_uvmem.c     |  2 ++
 drivers/gpu/drm/nouveau/nouveau_dmem.c |  2 ++
 include/linux/migrate.h                | 12 +++++++++---
 lib/test_hmm.c                         |  2 ++
 mm/migrate.c                           |  5 +++--
 5 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index 09d8119024db..acbf14cd2d72 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -400,6 +400,7 @@ kvmppc_svm_page_in(struct vm_area_struct *vma, unsigned long start,
 	mig.end = end;
 	mig.src = &src_pfn;
 	mig.dst = &dst_pfn;
+	mig.dir = MIGRATE_VMA_FROM_SYSTEM;
 
 	/*
 	 * We come here with mmap_lock write lock held just for
@@ -578,6 +579,7 @@ kvmppc_svm_page_out(struct vm_area_struct *vma, unsigned long start,
 	mig.src = &src_pfn;
 	mig.dst = &dst_pfn;
 	mig.src_owner = &kvmppc_uvmem_pgmap;
+	mig.dir = MIGRATE_VMA_FROM_DEVICE_PRIVATE;
 
 	mutex_lock(&kvm->arch.uvmem_lock);
 	/* The requested page is already paged-out, nothing to do */
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index e5c230d9ae24..e5c83b8ee82e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -183,6 +183,7 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 		.src		= &src,
 		.dst		= &dst,
 		.src_owner	= drm->dev,
+		.dir		= MIGRATE_VMA_FROM_DEVICE_PRIVATE,
 	};
 
 	/*
@@ -615,6 +616,7 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 	struct migrate_vma args = {
 		.vma		= vma,
 		.start		= start,
+		.dir		= MIGRATE_VMA_FROM_SYSTEM,
 	};
 	unsigned long i;
 	u64 *pfns;
diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 3e546cbf03dd..620f2235d7d4 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -180,6 +180,11 @@ static inline unsigned long migrate_pfn(unsigned long pfn)
 	return (pfn << MIGRATE_PFN_SHIFT) | MIGRATE_PFN_VALID;
 }
 
+enum migrate_vma_direction {
+	MIGRATE_VMA_FROM_SYSTEM,
+	MIGRATE_VMA_FROM_DEVICE_PRIVATE,
+};
+
 struct migrate_vma {
 	struct vm_area_struct	*vma;
 	/*
@@ -199,11 +204,12 @@ struct migrate_vma {
 
 	/*
 	 * Set to the owner value also stored in page->pgmap->owner for
-	 * migrating out of device private memory.  If set only device
-	 * private pages with this owner are migrated.  If not set
-	 * device private pages are not migrated at all.
+	 * migrating device private memory. The direction also needs to
+	 * be set to MIGRATE_VMA_FROM_DEVICE_PRIVATE.
 	 */
 	void			*src_owner;
+
+	enum migrate_vma_direction dir;
 };
 
 int migrate_vma_setup(struct migrate_vma *args);
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 9aa577afc269..1bd60cfb5a25 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -703,6 +703,7 @@ static int dmirror_migrate(struct dmirror *dmirror,
 		args.start = addr;
 		args.end = next;
 		args.src_owner = NULL;
+		args.dir = MIGRATE_VMA_FROM_SYSTEM;
 		ret = migrate_vma_setup(&args);
 		if (ret)
 			goto out;
@@ -1054,6 +1055,7 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
 	args.src = &src_pfns;
 	args.dst = &dst_pfns;
 	args.src_owner = dmirror->mdevice;
+	args.dir = MIGRATE_VMA_FROM_DEVICE_PRIVATE;
 
 	if (migrate_vma_setup(&args))
 		return VM_FAULT_SIGBUS;
diff --git a/mm/migrate.c b/mm/migrate.c
index f37729673558..2bbc5c4c672e 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2287,7 +2287,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 				goto next;
 
 			page = device_private_entry_to_page(entry);
-			if (page->pgmap->owner != migrate->src_owner)
+			if (migrate->dir != MIGRATE_VMA_FROM_DEVICE_PRIVATE ||
+			    page->pgmap->owner != migrate->src_owner)
 				goto next;
 
 			mpfn = migrate_pfn(page_to_pfn(page)) |
@@ -2295,7 +2296,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 			if (is_write_device_private_entry(entry))
 				mpfn |= MIGRATE_PFN_WRITE;
 		} else {
-			if (migrate->src_owner)
+			if (migrate->dir != MIGRATE_VMA_FROM_SYSTEM)
 				goto next;
 			pfn = pte_pfn(pte);
 			if (is_zero_pfn(pfn)) {
-- 
2.20.1
