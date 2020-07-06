From: Ralph Campbell <rcampbell@nvidia.com>
Subject: [PATCH 2/5] mm/migrate: add a direction parameter to migrate_vma
Date: Mon, 6 Jul 2020 15:23:44 -0700
Message-ID: <20200706222347.32290-3-rcampbell@nvidia.com>
References: <20200706222347.32290-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200706222347.32290-1-rcampbell@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-rdma@vger.kernel.org, linux-mm@kvack.org, nouveau@lists.freedesktop.org, kvm-ppc@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@mellanox.com>, Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, Ben Skeggs <bskeggs@redhat.com>, Bharata B Rao <bharata@linux.ibm.com>, Ralph Campbell <rcampbell@nvidia.com>
List-Id: nouveau.vger.kernel.org

The src_owner field in struct migrate_vma is being used for two purposes,
it implies the direction of the migration and it identifies device private
pages owned by the caller. Split this into separate parameters so the
src_owner field can be used just to identify device private pages owned
by the caller of migrate_vma_setup().

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
---
 arch/powerpc/kvm/book3s_hv_uvmem.c     |  2 ++
 drivers/gpu/drm/nouveau/nouveau_dmem.c |  2 ++
 include/linux/migrate.h                | 12 +++++++++---
 lib/test_hmm.c                         |  2 ++
 mm/migrate.c                           |  5 +++--
 5 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_h=
v_uvmem.c
index 09d8119024db..acbf14cd2d72 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -400,6 +400,7 @@ kvmppc_svm_page_in(struct vm_area_struct *vma, unsigned=
 long start,
 	mig.end =3D end;
 	mig.src =3D &src_pfn;
 	mig.dst =3D &dst_pfn;
+	mig.dir =3D MIGRATE_VMA_FROM_SYSTEM;
=20
 	/*
 	 * We come here with mmap_lock write lock held just for
@@ -578,6 +579,7 @@ kvmppc_svm_page_out(struct vm_area_struct *vma, unsigne=
d long start,
 	mig.src =3D &src_pfn;
 	mig.dst =3D &dst_pfn;
 	mig.src_owner =3D &kvmppc_uvmem_pgmap;
+	mig.dir =3D MIGRATE_VMA_FROM_DEVICE_PRIVATE;
=20
 	mutex_lock(&kvm->arch.uvmem_lock);
 	/* The requested page is already paged-out, nothing to do */
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouve=
au/nouveau_dmem.c
index cc9993837508..762e0168bc8d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -183,6 +183,7 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm=
_fault *vmf)
 		.src		=3D &src,
 		.dst		=3D &dst,
 		.src_owner	=3D drm->dev,
+		.dir		=3D MIGRATE_VMA_FROM_DEVICE_PRIVATE,
 	};
=20
 	/*
@@ -615,6 +616,7 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 	struct migrate_vma args =3D {
 		.vma		=3D vma,
 		.start		=3D start,
+		.dir		=3D MIGRATE_VMA_FROM_SYSTEM,
 	};
 	unsigned long i;
 	u64 *pfns;
diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 3e546cbf03dd..620f2235d7d4 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -180,6 +180,11 @@ static inline unsigned long migrate_pfn(unsigned long =
pfn)
 	return (pfn << MIGRATE_PFN_SHIFT) | MIGRATE_PFN_VALID;
 }
=20
+enum migrate_vma_direction {
+	MIGRATE_VMA_FROM_SYSTEM,
+	MIGRATE_VMA_FROM_DEVICE_PRIVATE,
+};
+
 struct migrate_vma {
 	struct vm_area_struct	*vma;
 	/*
@@ -199,11 +204,12 @@ struct migrate_vma {
=20
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
=20
 int migrate_vma_setup(struct migrate_vma *args);
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 9aa577afc269..1bd60cfb5a25 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -703,6 +703,7 @@ static int dmirror_migrate(struct dmirror *dmirror,
 		args.start =3D addr;
 		args.end =3D next;
 		args.src_owner =3D NULL;
+		args.dir =3D MIGRATE_VMA_FROM_SYSTEM;
 		ret =3D migrate_vma_setup(&args);
 		if (ret)
 			goto out;
@@ -1054,6 +1055,7 @@ static vm_fault_t dmirror_devmem_fault(struct vm_faul=
t *vmf)
 	args.src =3D &src_pfns;
 	args.dst =3D &dst_pfns;
 	args.src_owner =3D dmirror->mdevice;
+	args.dir =3D MIGRATE_VMA_FROM_DEVICE_PRIVATE;
=20
 	if (migrate_vma_setup(&args))
 		return VM_FAULT_SIGBUS;
diff --git a/mm/migrate.c b/mm/migrate.c
index f37729673558..2bbc5c4c672e 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2287,7 +2287,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 				goto next;
=20
 			page =3D device_private_entry_to_page(entry);
-			if (page->pgmap->owner !=3D migrate->src_owner)
+			if (migrate->dir !=3D MIGRATE_VMA_FROM_DEVICE_PRIVATE ||
+			    page->pgmap->owner !=3D migrate->src_owner)
 				goto next;
=20
 			mpfn =3D migrate_pfn(page_to_pfn(page)) |
@@ -2295,7 +2296,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 			if (is_write_device_private_entry(entry))
 				mpfn |=3D MIGRATE_PFN_WRITE;
 		} else {
-			if (migrate->src_owner)
+			if (migrate->dir !=3D MIGRATE_VMA_FROM_SYSTEM)
 				goto next;
 			pfn =3D pte_pfn(pte);
 			if (is_zero_pfn(pfn)) {
--=20
2.20.1
