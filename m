From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 8/9] mm: remove the unused MIGRATE_PFN_ERROR flag
Date: Thu,  8 Aug 2019 18:33:45 +0300
Message-ID: <20190808153346.9061-9-hch@lst.de>
References: <20190808153346.9061-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190808153346.9061-1-hch@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Cc: Ralph Campbell <rcampbell@nvidia.com>, Bharata B Rao <bharata@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Now that we can rely errors in the normal control flow there is no
need for this flag, remove it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>
---
 include/linux/migrate.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 18156d379ebf..1e67dcfd318f 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -167,7 +167,6 @@ static inline int migrate_misplaced_transhuge_page(struct mm_struct *mm,
 #define MIGRATE_PFN_LOCKED	(1UL << 2)
 #define MIGRATE_PFN_WRITE	(1UL << 3)
 #define MIGRATE_PFN_DEVICE	(1UL << 4)
-#define MIGRATE_PFN_ERROR	(1UL << 5)
 #define MIGRATE_PFN_SHIFT	6
 
 static inline struct page *migrate_pfn_to_page(unsigned long mpfn)
-- 
2.20.1
