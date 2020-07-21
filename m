From: Ralph Campbell <rcampbell@nvidia.com>
Subject: [PATCH v3 2/5] mm/migrate: add a flags parameter to migrate_vma
Date: Tue, 21 Jul 2020 14:31:16 -0700
Message-ID: <20200721213119.32344-3-rcampbell@nvidia.com>
References: <20200721213119.32344-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <kvm-ppc-owner@vger.kernel.org>
In-Reply-To: <20200721213119.32344-1-rcampbell@nvidia.com>
Sender: kvm-ppc-owner@vger.kernel.org
To: linux-rdma@vger.kernel.org, linux-mm@kvack.org, nouveau@lists.freedesktop.org, kvm-ppc@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@mellanox.com>, Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, Ben Skeggs <bskeggs@redhat.com>, Bharata B Rao <bharata@linux.ibm.com>, Ralph Campbell <rcampbell@nvidia.com>
List-Id: nouveau.vger.kernel.org

The src_owner field in struct migrate_vma is being used for two purposes,
it acts as a selection filter for which types of pages are to be migrated
and it identifies device private pages owned by the caller. Split this
into separate parameters so the src_owner field can be used just to
identify device private pages owned by the caller of migrate_vma_setup().
Rename the src_owner field to pgmap_owner to reflect it is now used only
to identify which device private pages to migrate.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
---
 arch/powerpc/kvm/book3s_hv_uvmem.c     |  4 +++-
 drivers/gpu/drm/nouveau/nouveau_dmem.c |  4 +++-
 include/linux/migrate.h                | 13 +++++++++----
 lib/test_hmm.c                         |  6 ++++--
 mm/migrate.c                           |  6 ++++--
 5 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_h=
v_uvmem.c
index 09d8119024db..6850bd04bcb9 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -400,6 +400,7 @@ kvmppc_svm_page_in(struct vm_area_struct *vma, unsigned=
 long start,
 	mig.end =3D end;
 	mig.src =3D &src_pfn;
 	mig.dst =3D &dst_pfn;
+	mig.flags =3D MIGRATE_VMA_SELECT_SYSTEM;
=20
 	/*
 	 * We come here with mmap_lock write lock held just for
@@ -577,7 +578,8 @@ kvmppc_svm_page_out(struct vm_area_struct *vma, unsigne=
d long start,
 	mig.end =3D end;
 	mig.src =3D &src_pfn;
 	mig.dst =3D &dst_pfn;
-	mig.src_owner =3D &kvmppc_uvmem_pgmap;
+	mig.pgmap_owner =3D &kvmppc_uvmem_pgmap;
+	mig.flags =3D MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
=20
 	mutex_lock(&kvm->arch.uvmem_lock);
 	/* The requested page is already paged-out, nothing to do */
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouve=
au/nouveau_dmem.c
index e5c230d9ae24..78b9e3c2a5b3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -182,7 +182,8 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm=
_fault *vmf)
 		.end		=3D vmf->address + PAGE_SIZE,
 		.src		=3D &src,
 		.dst		=3D &dst,
-		.src_owner	=3D drm->dev,
+		.pgmap_owner	=3D drm->dev,
+		.flags		=3D MIGRATE_VMA_SELECT_DEVICE_PRIVATE,
 	};
=20
 	/*
@@ -615,6 +616,7 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 	struct migrate_vma args =3D {
 		.vma		=3D vma,
 		.start		=3D start,
+		.flags		=3D MIGRATE_VMA_SELECT_SYSTEM,
 	};
 	unsigned long i;
 	u64 *pfns;
diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 3e546cbf03dd..aafec0ca7b41 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -180,6 +180,11 @@ static inline unsigned long migrate_pfn(unsigned long =
pfn)
 	return (pfn << MIGRATE_PFN_SHIFT) | MIGRATE_PFN_VALID;
 }
=20
+enum migrate_vma_direction {
+	MIGRATE_VMA_SELECT_SYSTEM         =3D (1UL << 0),
+	MIGRATE_VMA_SELECT_DEVICE_PRIVATE =3D (1UL << 1),
+};
+
 struct migrate_vma {
 	struct vm_area_struct	*vma;
 	/*
@@ -199,11 +204,11 @@ struct migrate_vma {
=20
 	/*
 	 * Set to the owner value also stored in page->pgmap->owner for
-	 * migrating out of device private memory.  If set only device
-	 * private pages with this owner are migrated.  If not set
-	 * device private pages are not migrated at all.
+	 * migrating out of device private memory. The flags also need to
+	 * be set to MIGRATE_VMA_SELECT_DEVICE_PRIVATE.
 	 */
-	void			*src_owner;
+	void			*pgmap_owner;
+	unsigned long		flags;
 };
=20
 int migrate_vma_setup(struct migrate_vma *args);
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 9aa577afc269..74c6ee66ef15 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -702,7 +702,8 @@ static int dmirror_migrate(struct dmirror *dmirror,
 		args.dst =3D dst_pfns;
 		args.start =3D addr;
 		args.end =3D next;
-		args.src_owner =3D NULL;
+		args.pgmap_owner =3D NULL;
+		args.flags =3D MIGRATE_VMA_SELECT_SYSTEM;
 		ret =3D migrate_vma_setup(&args);
 		if (ret)
 			goto out;
@@ -1053,7 +1054,8 @@ static vm_fault_t dmirror_devmem_fault(struct vm_faul=
t *vmf)
 	args.end =3D args.start + PAGE_SIZE;
 	args.src =3D &src_pfns;
 	args.dst =3D &dst_pfns;
-	args.src_owner =3D dmirror->mdevice;
+	args.pgmap_owner =3D dmirror->mdevice;
+	args.flags =3D MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
=20
 	if (migrate_vma_setup(&args))
 		return VM_FAULT_SIGBUS;
diff --git a/mm/migrate.c b/mm/migrate.c
index f37729673558..e3ea68e3a08b 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2287,7 +2287,9 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 				goto next;
=20
 			page =3D device_private_entry_to_page(entry);
-			if (page->pgmap->owner !=3D migrate->src_owner)
+			if (!(migrate->flags &
+				MIGRATE_VMA_SELECT_DEVICE_PRIVATE) ||
+			    page->pgmap->owner !=3D migrate->pgmap_owner)
 				goto next;
=20
 			mpfn =3D migrate_pfn(page_to_pfn(page)) |
@@ -2295,7 +2297,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 			if (is_write_device_private_entry(entry))
 				mpfn |=3D MIGRATE_PFN_WRITE;
 		} else {
-			if (migrate->src_owner)
+			if (!(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM))
 				goto next;
 			pfn =3D pte_pfn(pte);
 			if (is_zero_pfn(pfn)) {
--=20
2.20.1
