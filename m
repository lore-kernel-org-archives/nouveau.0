Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125CBC44503
	for <nouveau@archiver.kernel.org>; Wed,  8 Jul 2026 23:27:19 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E5D0610EE5C;
	Wed,  8 Jul 2026 23:27:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="rqlGxpVM";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 38F7D46F9E;
	Wed,  8 Jul 2026 23:12:18 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783552338;
 b=InmNH/2pr2393rd8lltjYDZp/icydYydtmrr3dTmi+TjmybKUqxUWa5JJ8fmgdG7yHRID
 YZHM4D6xhFLECR/ScL85+fQVtQna1SjzVMhVkwItPeqqdw+31UzGCTeNkODTdSPiMyEMMuy
 Vr0730NhHvaKeJiHqHrDkrE8KEWwPxYPmSV7w/L0Y0L2qltBFJML5NmQZXtlR/UUqdSLRuh
 lwBFk5zSZpBsLjvw2XQEPnEtkXPB9mSw+Vypc32Fx1qABDgXGD2i1042bT1UyPBn0SuOwAQ
 bMv7GxgwR7BlKFIDhTuFBgvaEx3pREjB7ay6X9jT4SGeB7/4cb+KDaFFjoQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783552338; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=X+CVN3h9eUUn5cnhwzVU69Wvf2wjPvEZWVRD1j6vs7c=;
 b=BEpldW8iZqRaaolaNLzQnIOu/PRMsyAKSvilYXPu9rk83yCY5m/lw7Tot0xaq6jz2WpBi
 oYfp1j2Npq+meFQ18sqHnlvY95LkTEIIvHR+Bixj937tTmfqXheY+6fVOESHUo+Ks8kHOMy
 pAhIlvqRu0DMnn6jiuIxjV5seROrZP6Z0jltaUAIxPZy1OPSBe5PjigwKYtJ1B/iQ7PzvW2
 Pz+HHZP1R3d1nxXKJHR915EKeL15H1vJsaTXVNnV6xazUT+dKBtq0nBuM7TbRUPeOGHhUQe
 tTXoDHh8MFHQt3Eb1b08ErepygkKOZIiXNkDAISSooigtdLeUHnxmtU5Mq1A==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 66C6B46F61
	for <nouveau@lists.freedesktop.org>; Tue,  7 Jul 2026 19:32:06 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 69CD710E29A
	for <nouveau@lists.freedesktop.org>; Tue,  7 Jul 2026 19:47:04 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2cace7da66eso44341825ad.0
        for <nouveau@lists.freedesktop.org>;
 Tue, 07 Jul 2026 12:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783453624; x=1784058424;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=X+CVN3h9eUUn5cnhwzVU69Wvf2wjPvEZWVRD1j6vs7c=;
        b=rqlGxpVMjXMPUgQ/CRnfVFN0AKMl/8rTFiQAt6bcMxdddq79XlomKv9jDL0NTEJzGF
         r5SB/kxx+ZSo8fRqxCQX0//6qTQ/tub6DjPVDaezxs1m4sSNnxe0AEM5DvnzsJDnZ0XR
         07zjO99opsqG+YhiINWMfYj9Y9UF8x+gOvlH9ZECOAG4ag6CA/1OkVHQgM8o1ejEBdxL
         AbU1IoWMeU9FNUblvI4dqrfw85T49fFIDnfVtV9rqH252xQted2iMkvr6ySAc1DiyjWy
         7JPyJsTr8Ztb9tqj8d781svZy/SPy7x4Cj1yacskeL8pqc3XGicLpMBL2a+JmP+/v1z5
         APKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783453624; x=1784058424;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X+CVN3h9eUUn5cnhwzVU69Wvf2wjPvEZWVRD1j6vs7c=;
        b=JUy3bpBamdlaMrmBNv0NZ/jPFimnAFfN3EyCoFDb7XsIxDQjgjtWAibkF2nASHZcit
         IgCoP9q6eY34pIaGr72qFRPFl0hZ4Ea8sRi8eouQq/6nTCYYH1donOI0hyKHiw9dRbxz
         4MRSJGFnPNZXKDMShNd//tnaR8IkxYlVgscDHcE97S4Xkl4MB+uy+E8/ERF5kU23pjOc
         LCcU0P88zqMaq5j320tTQJ3CsI0j6ErU1hw/0sinwU+F4FXCCQJVR5fCflUFIrtSiSC8
         ghPrIBIA5J0l1xzC7tJEYvGF/800wpvmTdALA6PMKQAombNN9fKtayhDH9gWzVdsuLnL
         EXfg==
X-Forwarded-Encrypted: i=1;
 AHgh+RoZ0KzKP6fNchbDoCQxQ2p1OIFzSt8a0EE/XmkJGAOphTvBbY0Aa+p/KAnL/79hudqH5dGsp7xc@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+d5Nc9mukooRy6IBMvoHavQXEzaFp70pMOHh4D44rO+h/aU6v
	cegtKcf1zTRkWIkIGpU9SWYDtVpqDMNw9T5w/0ofdilaC3w1tTxpy6MivzJ5xw==
X-Gm-Gg: AfdE7cmN5eV/hwF5Zx3hQA/bH7Tyj5Bu3C+kZOKjXhWs+JNKn/AI3ldtjdj1iv7Ezsg
	a/LrBqAVvgTaikx0gJOV4a+UEgWWl4utHTlMhIK3EZNXmHujJjV+1cpI1P5FJcuiMr5AFYJhnvq
	C9E5AtPwzy/Stmb1AwmhQTUaknpbxCBm6Q2pv+gPnkmNUCE4x5s62w6hrIaECamrsKdzj2SJWoF
	Axe59znAjhrzDDE6W+CoWs0rhtdYQggVD+/C066CI9ydo/eBFKQjVuTY4j/xecxa5oe9fHxo9pi
	mOtVW8tPUO+vMWVwcVqxOY+6jJVqDFbLmzVkoPfSD0Gyvy1aTaeSzTsO+3PcWySEYvx6BgHABLv
	NEsABph3O4XTeLp/pRDWxtk9qgsu9ysGP0GwZyfc6YzexSLs72v2C0mz5bwuX2hMUT3vJ47ce9L
	Z0UPLJ7dCfURnAPHGkSZ/GmOj5T/2EijIRZIB3Uu5dDe6gadt24YvkR3F/vMU=
X-Received: by 2002:a17:903:37c3:b0:2cc:9473:97c8 with SMTP id
 d9443c01a7336-2ccbe722810mr68422355ad.15.1783453623691;
        Tue, 07 Jul 2026 12:47:03 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9d1ea7fsm17010495ad.38.2026.07.07.12.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 12:47:03 -0700 (PDT)
Subject: [PATCH v7 2/8] mm/hmm: add hmm_range_fault_unlocked_timeout() for
 mmap lock-drop support
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: airlied@gmail.com, akhilesh@ee.iitb.ac.in, akpm@linux-foundation.org,
 corbet@lwn.net, dakr@kernel.org, david@kernel.org, decui@microsoft.com,
 haiyangz@microsoft.com, jgg@ziepe.ca, kees@kernel.org, kys@microsoft.com,
 leon@kernel.org, liam@infradead.org, lizhi.hou@amd.com, ljs@kernel.org,
 longli@microsoft.com, lyude@redhat.com, maarten.lankhorst@linux.intel.com,
 mamin506@gmail.com, mhocko@suse.com, mripard@kernel.org,
 nouveau@lists.freedesktop.org, ogabbay@kernel.org, oleg@redhat.com,
 rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
 skhan@linuxfoundation.org, skinsburskii@gmail.com, surenb@google.com,
 tzimmermann@suse.de, vbabka@kernel.org, wei.liu@kernel.org,
 skinsburskii@gmail.com
Date: Tue, 07 Jul 2026 12:47:01 -0700
Message-ID: <178345362182.660027.12809852179204464964.stgit@skinsburskii>
In-Reply-To: <178345345668.660027.2952911919681614557.stgit@skinsburskii>
References: <178345345668.660027.2952911919681614557.stgit@skinsburskii>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-MailFrom: skinsburskii@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: 6PWFD4YDSDST45DMDYK2HIVXL34RCFYF
X-Message-ID-Hash: 6PWFD4YDSDST45DMDYK2HIVXL34RCFYF
X-Mailman-Approved-At: Wed, 08 Jul 2026 23:12:15 +0000
CC: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-rdma@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/6PWFD4YDSDST45DMDYK2HIVXL34RCFYF/>
Archived-At: 
 <https://lore.freedesktop.org/178345362182.660027.12809852179204464964.stgit@skinsburskii/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

hmm_range_fault() requires the caller to hold the mmap read lock for the
duration of the call. This is incompatible with mappings whose fault
handler may release the mmap lock, notably userfaultfd-managed regions,
where handle_mm_fault() can return VM_FAULT_RETRY or VM_FAULT_COMPLETED
after dropping the lock. Drivers that need to populate device page tables
for such mappings have no way to do so today.

Add hmm_range_fault_unlocked_timeout() for callers that do not need to hold
mmap_lock across any work outside the HMM fault itself. The helper takes
mmap_read_lock_killable() internally, calls the common HMM fault
implementation, and releases the lock before returning if it is still held.
The timeout is specified in jiffies; passing 0 retries indefinitely, while
a non-zero timeout makes the helper return -EBUSY when the retry budget
expires.

When handle_mm_fault() drops mmap_lock, or when the range is invalidated,
hmm_range_fault_unlocked_timeout() refreshes range->notifier_seq and
retries the walk internally. The caller only needs to perform the usual
post-success mmu_interval_read_retry() check while holding its update lock
before consuming the pfns. If mmap_lock acquisition is interrupted or a
fatal signal is pending during retry handling, -EINTR is returned instead.

The common implementation conditionally sets FAULT_FLAG_ALLOW_RETRY and
FAULT_FLAG_KILLABLE only for hmm_range_fault_unlocked_timeout(). The
existing hmm_range_fault() path still passes no locked state, does not
allow handle_mm_fault() to drop mmap_lock, and remains a thin wrapper
preserving the existing API contract for current callers.

The previous refactor that moved page fault handling out of the page-table
walk callbacks is what makes this change small. Faults now run after
walk_page_range() has unwound, with only mmap_lock held, so dropping it
does not interact with the walker's pte spinlock or hugetlb_vma_lock.
Hugetlb regions therefore participate in the unlocked path uniformly with
PTE- and PMD-level mappings; no special case is required.

Documentation/mm/hmm.rst is updated with a description of the new API and
the recommended caller pattern.

Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 Documentation/mm/hmm.rst |   63 +++++++++++++++++++
 include/linux/hmm.h      |    2 +
 mm/hmm.c                 |  152 +++++++++++++++++++++++++++++++++++++---------
 3 files changed, 188 insertions(+), 29 deletions(-)

diff --git a/Documentation/mm/hmm.rst b/Documentation/mm/hmm.rst
index 7d61b7a8b65b..70885f153d03 100644
--- a/Documentation/mm/hmm.rst
+++ b/Documentation/mm/hmm.rst
@@ -208,6 +208,69 @@ invalidate() callback. That lock must be held before calling
 mmu_interval_read_retry() to avoid any race with a concurrent CPU page table
 update.
 
+Dropping the mmap lock during page faults
+=========================================
+
+Some VMAs have fault handlers that need to release the mmap lock while
+servicing a fault (for example, regions managed by ``userfaultfd``).
+``hmm_range_fault()`` cannot be used on such mappings because it must hold the
+mmap lock for the duration of the call. Drivers that need to support them
+should call::
+
+  int hmm_range_fault_unlocked_timeout(struct hmm_range *range,
+                                       unsigned long timeout);
+
+The caller must not hold ``mmap_read_lock`` before the call.
+``hmm_range_fault_unlocked_timeout()`` takes the mmap read lock internally and
+allows ``handle_mm_fault()`` to drop it during fault handling. If the mmap lock
+is dropped or the range is invalidated, the function refreshes
+``range->notifier_seq`` and restarts the walk internally. ``-EINTR`` is
+returned if mmap lock acquisition is interrupted or a fatal signal is pending
+during retry handling.
+
+The timeout is specified in jiffies; passing ``0`` means retry indefinitely. If
+the timeout expires while the function is retrying after ``-EBUSY``,
+``-EBUSY`` is returned to the caller.
+
+A typical caller looks like this::
+
+ int driver_populate_range_unlocked(...)
+ {
+      struct hmm_range range;
+      unsigned long timeout;
+      ...
+
+      timeout = msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+      range.notifier = &interval_sub;
+      range.start = ...;
+      range.end = ...;
+      range.hmm_pfns = ...;
+
+      if (!mmget_not_zero(interval_sub.mm))
+          return -EFAULT;
+
+ again:
+      ret = hmm_range_fault_unlocked_timeout(&range, timeout);
+      if (ret)
+          goto out_put;
+
+      take_lock(driver->update);
+      if (mmu_interval_read_retry(&interval_sub, range.notifier_seq)) {
+          release_lock(driver->update);
+          goto again;
+      }
+
+      /* Use pfns array content to update device page table,
+       * under the update lock */
+
+      release_lock(driver->update);
+      ret = 0;
+
+ out_put:
+      mmput(interval_sub.mm);
+      return ret;
+ }
+
 Leverage default_flags and pfn_flags_mask
 =========================================
 
diff --git a/include/linux/hmm.h b/include/linux/hmm.h
index db75ffc949a7..6f04e3932f5b 100644
--- a/include/linux/hmm.h
+++ b/include/linux/hmm.h
@@ -123,6 +123,8 @@ struct hmm_range {
  * Please see Documentation/mm/hmm.rst for how to use the range API.
  */
 int hmm_range_fault(struct hmm_range *range);
+int hmm_range_fault_unlocked_timeout(struct hmm_range *range,
+				     unsigned long timeout);
 
 /*
  * HMM_RANGE_DEFAULT_TIMEOUT - default timeout (ms) when waiting for a range
diff --git a/mm/hmm.c b/mm/hmm.c
index 2129b1ee4c35..15110409be00 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -32,6 +32,7 @@
 
 struct hmm_vma_walk {
 	struct hmm_range	*range;
+	int			*locked;
 	unsigned long		last;
 	unsigned long		end;
 	unsigned int		required_fault;
@@ -44,6 +45,14 @@ struct hmm_vma_walk {
  */
 #define HMM_FAULT_PENDING	-EAGAIN
 
+/*
+ * Internal sentinel returned by hmm_do_fault() when handle_mm_fault()
+ * completes a page fault with the mmap lock dropped. hmm_do_fault() sets
+ * *locked = 0; the outer loop consumes the sentinel and never propagates it
+ * to the caller.
+ */
+#define HMM_FAULT_UNLOCKED	-ENOLCK
+
 enum {
 	HMM_NEED_FAULT = 1 << 0,
 	HMM_NEED_WRITE_FAULT = 1 << 1,
@@ -73,9 +82,9 @@ static int hmm_pfns_fill(unsigned long addr, unsigned long end,
  *
  * Called by the walk callbacks when they discover that part of the range
  * needs a page fault.  The callback records what to fault and returns
- * HMM_FAULT_PENDING; the outer loop in hmm_range_fault() drops back out of
- * walk_page_range() and invokes handle_mm_fault() from a context where no
- * page-table or hugetlb_vma_lock is held.
+ * HMM_FAULT_PENDING; the outer loop in hmm_range_fault_locked() drops
+ * back out of walk_page_range() and invokes handle_mm_fault() from a context
+ * where no page-table or hugetlb_vma_lock is held.
  */
 static int hmm_record_fault(unsigned long addr, unsigned long end,
 			    unsigned int required_fault,
@@ -624,7 +633,7 @@ static const struct mm_walk_ops hmm_walk_ops = {
 /*
  * hmm_do_fault - fault in a range recorded by a walk callback
  *
- * Called from the outer loop in hmm_range_fault() after a callback
+ * Called from the outer loop in hmm_range_fault_locked() after a callback
  * returned HMM_FAULT_PENDING.  At this point we hold only mmap_lock;
  * the page-table spinlock and any hugetlb_vma_lock acquired by the walk
  * framework have already been released by the unwind.
@@ -641,6 +650,9 @@ static int hmm_do_fault(struct mm_struct *mm,
 	unsigned int fault_flags = FAULT_FLAG_REMOTE;
 	struct vm_area_struct *vma;
 
+	if (hmm_vma_walk->locked)
+		fault_flags |= FAULT_FLAG_ALLOW_RETRY | FAULT_FLAG_KILLABLE;
+
 	vma = vma_lookup(mm, addr);
 	if (!vma)
 		return -EFAULT;
@@ -651,37 +663,33 @@ static int hmm_do_fault(struct mm_struct *mm,
 		fault_flags |= FAULT_FLAG_WRITE;
 	}
 
-	for (; addr < end; addr += PAGE_SIZE)
-		if (handle_mm_fault(vma, addr, fault_flags, NULL) &
-		    VM_FAULT_ERROR)
-			return -EFAULT;
+	for (; addr < end; addr += PAGE_SIZE) {
+		vm_fault_t ret;
+
+		ret = handle_mm_fault(vma, addr, fault_flags, NULL);
+
+		if (ret & (VM_FAULT_COMPLETED | VM_FAULT_RETRY)) {
+			*hmm_vma_walk->locked = 0;
+			return HMM_FAULT_UNLOCKED;
+		}
+
+		if (ret & VM_FAULT_ERROR) {
+			int err = vm_fault_to_errno(ret, 0);
+
+			if (err)
+				return err;
+			BUG();
+		}
+	}
 
 	return -EBUSY;
 }
 
-/**
- * hmm_range_fault - try to fault some address in a virtual address range
- * @range:	argument structure
- *
- * Returns 0 on success or one of the following error codes:
- *
- * -EINVAL:	Invalid arguments or mm or virtual address is in an invalid vma
- *		(e.g., device file vma).
- * -ENOMEM:	Out of memory.
- * -EPERM:	Invalid permission (e.g., asking for write and range is read
- *		only).
- * -EBUSY:	The range has been invalidated and the caller needs to wait for
- *		the invalidation to finish.
- * -EFAULT:     A page was requested to be valid and could not be made valid
- *              ie it has no backing VMA or it is illegal to access
- *
- * This is similar to get_user_pages(), except that it can read the page tables
- * without mutating them (ie causing faults).
- */
-int hmm_range_fault(struct hmm_range *range)
+static int hmm_range_fault_locked(struct hmm_range *range, int *locked)
 {
 	struct hmm_vma_walk hmm_vma_walk = {
 		.range = range,
+		.locked = locked,
 		.last = range->start,
 	};
 	struct mm_struct *mm = range->notifier->mm;
@@ -704,8 +712,14 @@ int hmm_range_fault(struct hmm_range *range)
 		 * returns -EBUSY so the loop re-walks and picks up the
 		 * now-present entries.
 		 */
-		if (ret == HMM_FAULT_PENDING)
+		if (ret == HMM_FAULT_PENDING) {
 			ret = hmm_do_fault(mm, &hmm_vma_walk);
+			if (ret == HMM_FAULT_UNLOCKED) {
+				if (fatal_signal_pending(current))
+					return -EINTR;
+				return -EBUSY;
+			}
+		}
 		/*
 		 * When -EBUSY is returned the loop restarts with
 		 * hmm_vma_walk.last set to an address that has not been stored
@@ -715,8 +729,88 @@ int hmm_range_fault(struct hmm_range *range)
 	} while (ret == -EBUSY);
 	return ret;
 }
+
+/**
+ * hmm_range_fault - try to fault some address in a virtual address range
+ * @range:	argument structure
+ *
+ * Returns 0 on success or one of the following error codes:
+ *
+ * -EINVAL:	Invalid arguments or mm or virtual address is in an invalid vma
+ *		(e.g., device file vma).
+ * -ENOMEM:	Out of memory.
+ * -EPERM:	Invalid permission (e.g., asking for write and range is read
+ *		only).
+ * -EBUSY:	The range has been invalidated and the caller needs to wait for
+ *		the invalidation to finish.
+ * -EFAULT:     A page was requested to be valid and could not be made valid
+ *              ie it has no backing VMA or it is illegal to access
+ *
+ * This is similar to get_user_pages(), except that it can read the page tables
+ * without mutating them (ie causing faults).
+ *
+ * The mmap lock must be held by the caller and will remain held on return.
+ * For a variant that allows the mmap lock to be dropped during faults (e.g.,
+ * for userfaultfd support), see hmm_range_fault_unlocked_timeout().
+ */
+int hmm_range_fault(struct hmm_range *range)
+{
+	return hmm_range_fault_locked(range, NULL);
+}
 EXPORT_SYMBOL(hmm_range_fault);
 
+/**
+ * hmm_range_fault_unlocked_timeout - fault in a range with a retry timeout
+ * @range:	argument structure
+ * @timeout:	timeout in jiffies for internal -EBUSY retries, or 0 to retry
+ *		indefinitely
+ *
+ * This is similar to hmm_range_fault(), except the caller must not hold the
+ * mmap lock. The function takes the mmap read lock internally and allows
+ * handle_mm_fault() to drop it during faults. If the mmap lock is dropped or
+ * the range is invalidated, the function refreshes range->notifier_seq and
+ * restarts the walk internally. Passing 0 for @timeout retries indefinitely;
+ * otherwise, if @timeout expires while retrying -EBUSY, -EBUSY is returned to
+ * the caller.
+ *
+ * Returns 0 on success or one of the error codes documented for
+ * hmm_range_fault(). -EINTR is returned if mmap_lock acquisition is
+ * interrupted or a fatal signal is pending during retry handling.
+ */
+int hmm_range_fault_unlocked_timeout(struct hmm_range *range,
+				     unsigned long timeout)
+{
+	struct mm_struct *mm = range->notifier->mm;
+	unsigned long deadline = 0;
+	int locked, ret;
+
+	if (timeout)
+		deadline = jiffies + timeout;
+
+	do {
+		if (fatal_signal_pending(current))
+			return -EINTR;
+
+		if (timeout && time_after(jiffies, deadline))
+			return -EBUSY;
+
+		range->notifier_seq =
+			mmu_interval_read_begin(range->notifier);
+
+		ret = mmap_read_lock_killable(mm);
+		if (ret)
+			return ret;
+
+		locked = 1;
+		ret = hmm_range_fault_locked(range, &locked);
+		if (locked)
+			mmap_read_unlock(mm);
+	} while (ret == -EBUSY);
+
+	return ret;
+}
+EXPORT_SYMBOL(hmm_range_fault_unlocked_timeout);
+
 /**
  * hmm_dma_map_alloc - Allocate HMM map structure
  * @dev: device to allocate structure for


