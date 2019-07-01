From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: [PATCH 01/22] mm/hmm.c: suppress compilation warnings when
 CONFIG_HUGETLB_PAGE is not set
Date: Mon,  1 Jul 2019 08:19:59 +0200
Message-ID: <20190701062020.19239-2-hch@lst.de>
References: <20190701062020.19239-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
In-Reply-To: <20190701062020.19239-1-hch-jcswGhMUV9g@public.gmane.org>
List-Unsubscribe: <https://lists.01.org/mailman/options/linux-nvdimm>,
 <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.01.org/pipermail/linux-nvdimm/>
List-Post: <mailto:linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
List-Help: <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=help>
List-Subscribe: <https://lists.01.org/mailman/listinfo/linux-nvdimm>,
 <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=subscribe>
Errors-To: linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org
Sender: "Linux-nvdimm" <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
To: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
List-Id: nouveau.vger.kernel.org

From: Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>

gcc reports that several variables are defined but not used.

For the first hunk CONFIG_HUGETLB_PAGE the entire if block is already
protected by pud_huge() which is forced to 0.  None of the stuff under the
ifdef causes compilation problems as it is already stubbed out in the
header files.

For the second hunk the dummy huge_page_shift macro doesn't touch the
argument, so just inline the argument.

Link: http://lkml.kernel.org/r/20190522195151.GA23955-uk2M96/98Pc@public.gmane.org
Signed-off-by: Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Reviewed-by: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Reviewed-by: Ira Weiny <ira.weiny-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Signed-off-by: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
---
 mm/hmm.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index c5d840e34b28..c62ae414a3a2 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -788,7 +788,6 @@ static int hmm_vma_walk_pud(pud_t *pudp,
 			return hmm_vma_walk_hole_(addr, end, fault,
 						write_fault, walk);
 
-#ifdef CONFIG_HUGETLB_PAGE
 		pfn = pud_pfn(pud) + ((addr & ~PUD_MASK) >> PAGE_SHIFT);
 		for (i = 0; i < npages; ++i, ++pfn) {
 			hmm_vma_walk->pgmap = get_dev_pagemap(pfn,
@@ -804,9 +803,6 @@ static int hmm_vma_walk_pud(pud_t *pudp,
 		}
 		hmm_vma_walk->last = end;
 		return 0;
-#else
-		return -EINVAL;
-#endif
 	}
 
 	split_huge_pud(walk->vma, pudp, addr);
@@ -1015,9 +1011,8 @@ long hmm_range_snapshot(struct hmm_range *range)
 			return -EFAULT;
 
 		if (is_vm_hugetlb_page(vma)) {
-			struct hstate *h = hstate_vma(vma);
-
-			if (huge_page_shift(h) != range->page_shift &&
+			if (huge_page_shift(hstate_vma(vma)) !=
+				    range->page_shift &&
 			    range->page_shift != PAGE_SHIFT)
 				return -EINVAL;
 		} else {
-- 
2.20.1
