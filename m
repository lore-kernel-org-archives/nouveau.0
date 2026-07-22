Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45527C4453C
	for <nouveau@archiver.kernel.org>; Wed, 22 Jul 2026 21:44:55 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4E94F10EEBE;
	Wed, 22 Jul 2026 21:44:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VJTRYFfD";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B05FC47318;
	Wed, 22 Jul 2026 21:29:22 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784755762;
 b=M4WKPHlP2Z3oZK15Yn0q4+vCe0BsfV4+jc1wFpdtCJ9uksOLULcwb/sEyJDT1eOXeyrhj
 2oIv0MgoQBBnIIJvFsjuukWDJfE7HxZhfkFS0OgbpQYYiD5hUwip98H3WCDNkHeanPvqRKr
 Fo/0y79tI1KAPdQNNz/9IaL/VdewOdDef9CrVaaPiDVvt2RG2Hu3lMUedeK+E7UFm0I1oqD
 vo3FTdJ+iETQ9zVgO9o38SPQt7fch+hVigfuRSl5PY6/dwgeVRNUSHzSKENvyizb/qpYUbm
 egsTH0DJ6BaKZ0WKl8nJLgCcFAlJl2OvcA7uL2/YHRZstDFwdswVkPMAgKMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784755762; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=qdx7YDLo+QMjlb8j72PZyp2xuVmsQJocEMpMp1wNFRQ=;
 b=NHMCXwnDK1zflXjjQU3hAbyIfZ6a652kmrsWnXCs0M3ZtNf0a4WzruLrVA0QUDPFlY+KI
 yUndT3tXuwoLPW6srTJAIe57mVryrVJCkhS7RwiqPyv5K2hMX//vC9mHJbevSwItJ9DgP8C
 Zkc6KEvQyIL6fLu1e6lZ+P4iD+kZkHJB7TpFzY1192eo2yuo2JfAnMiw/T6T4kcjhzyljSG
 irLqw56tVxdWypWGep70XKVQRBGXN2V5HaX+e4ZmTWPMqCM6COcQpJjlADO7LKJrZTG3KTQ
 vZeBI5jFWB6qTyvtPMuJ5OpFpIpPDbBHf+Q5Lob9okUZd+Fww6fHNW0YqKkw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 6767B47305
	for <nouveau@lists.freedesktop.org>; Wed, 22 Jul 2026 21:29:19 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 87D4310E4E7
	for <nouveau@lists.freedesktop.org>; Wed, 22 Jul 2026 21:44:50 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-84862b0d5aeso14253710b3a.2
        for <nouveau@lists.freedesktop.org>;
 Wed, 22 Jul 2026 14:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784756690; x=1785361490;
 darn=lists.freedesktop.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qdx7YDLo+QMjlb8j72PZyp2xuVmsQJocEMpMp1wNFRQ=;
        b=VJTRYFfDqKd632VH1kxtQR8uUsuKuWxobsHYgIWBYZ0Cqovt2ZI0N1rz8eAsQfS7kn
         xN8LJG6r59UbFVZV9shNDkyk8ja9ZAA+uyaOvpbYjZax4VL1nlkuBIr0JB6NOxp3UAfM
         dok5DQoWt4G9PO2VJUEZjWb8o/zMrwgcT9wujVfaKzoEm8jHeen84QvCj+Ox6VU8lC2z
         hAT5aLv5m4gVfhIdc/SeBLl+7R1OZVe2PUBn+gFywLAY5RsBZdaXh9yVlcxK7X5P7mec
         EEUpfJc8gcDmkEqH4Z/g/WdXNt5GgAV64WRn0nW//1pdKPeMpTByiK0JsPRPzOtRkjFd
         cYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784756690; x=1785361490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qdx7YDLo+QMjlb8j72PZyp2xuVmsQJocEMpMp1wNFRQ=;
        b=i9uH8vtN567ACleWMiXoVApp0yuXBBTxpZXkBqYxqkc6A26FoZzKndPATYhGK7Oidc
         xuK19zB23nrP/gVi7OrmSDRFc2Bu3Mb/iIJMThQmngpmLojKFZg0OhhbdfKvycfWs8/y
         Vdp5vMGK0MQUrWme1/TrCpj+Rg7gWCUr2IRmNRNe7AcEcinQyCo7iqBHIysImTnA1TYy
         116avaMf+Uumr9Bmc+FUYWv58md9PqBOQR2OLa0tkgaZBR5/Q1CPDdAGHa0tC2wKf2hq
         b6PyRm3MB61HXpjdKved6lwxbezOyfdMdKwc8QTWEfU+dvY1mix5X6HFP0I7v6E1aBJO
         p2hA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqdV0ZdemDycdPdLkHeATwzZlf3XaUnCpA412MtvPvd/FSBVdYbJvhex8cDbR8eHswE/aTKyQnM@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbWJgbiVkMc0rfj75ILUFzQtPXH+7OeKX6SKfltzdKmxbl5XvX
	ppjivDgu4ZRI2ItROzR4fHji4TkIgYGn4RmIdwVbMfHbBPtNMAShotms
X-Gm-Gg: AR+sD116HV4SktgYZw0rk2osbNhCBcOu4OgHCalJ8e4q+xIKXrr40Ahebqrit/CBDGH
	HLGY9TrRN0nCkHNE1Y6DEQe9UzGqQYY4X9aeO7j78Ms1nj2hwce/4UflaS6fsWN2Yjt/jM+a0Sy
	KSYVFETP1PqNJZeMm5RchN+85zyXVOY1hNKS3+ONe0TBdwZJXj88aaQk0MlQPk3OJbRj9KFD4Ju
	qc9/yHxWu3yUOq0FozoTgMCHnWac/1QWBAQtcCiF3inOEvPVId2DfbEcqDtTmU/dZXn2mcCkcyO
	F+fmWQCSaFLDdVy+ZKPi/fIOHIqmo932dQ/YQiGHZCzbICO7gnjbhwi5Id1yBPD1CfXnQNth8rd
	3EtDL56aHZN6miwhB5drKyzI3Ips2bpqJFtR7jNVvR9hv7/tdo8waway6Pqi2t+aKkWWYNA9Kt8
	Fh+GuNvQOYEhRE0VUU8OOdL97WZvZtwAuODPk5MDHY14rHgs/P
X-Received: by 2002:a05:6a00:3d12:b0:847:98ff:4af5 with SMTP id
 d2e1a72fcca58-84e2b8c0da6mr711681b3a.26.1784756689863;
        Wed, 22 Jul 2026 14:44:49 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84e17237c3fsm1946297b3a.9.2026.07.22.14.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 14:44:49 -0700 (PDT)
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
Date: Wed, 22 Jul 2026 14:44:24 -0700
Subject: [PATCH v10 2/8] mm/hmm: add hmm_range_fault_unlocked_timeout() for
 mmap lock-drop support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-hmm-v10-v1-2-606464dd601a@gmail.com>
References: <20260722-hmm-v10-v1-0-606464dd601a@gmail.com>
In-Reply-To: <20260722-hmm-v10-v1-0-606464dd601a@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Min Ma <mamin506@gmail.com>, Lizhi Hou <lizhi.hou@amd.com>,
 Oded Gabbay <ogabbay@kernel.org>, skinsburskii@gmail.com
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784756683; l=17250;
 i=skinsburskii@gmail.com; s=20260722; h=from:subject:message-id;
 bh=phNfi9QTZkEVMxoyJ4Ni2C683NZl0Qp7ozSXMuOXsZc=;
 b=kdDY7nuq9dEb1iZ4WbkS/DHv4ppZRm5lPwJw6yGAjbvELwTl1EY7EymTqTd5YgPoTrv7RCNjb
 88j94dyszYkAJMGpJIEF8Ri3EHQCYEvc2wgoWxeNxsDxqo9XW7LOnwV
X-Developer-Key: i=skinsburskii@gmail.com; a=ed25519;
 pk=bDpriHBYgeTdkIDweZDCemxsU93neJBOCn3YLIuJpnE=
Message-ID-Hash: 6Z2GK7O7BXKFBZV3SNGGSVGQ4SJL6PYI
X-Message-ID-Hash: 6Z2GK7O7BXKFBZV3SNGGSVGQ4SJL6PYI
X-MailFrom: skinsburskii@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-rdma@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/6Z2GK7O7BXKFBZV3SNGGSVGQ4SJL6PYI/>
Archived-At: 
 <https://lore.freedesktop.org/20260722-hmm-v10-v1-2-606464dd601a@gmail.com/>
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
expires. The retry deadline is set before refreshing the notifier sequence
and acquiring mmap_lock, so contended mmap_lock acquisition is included in
the retry budget.

When handle_mm_fault() drops mmap_lock, or when the range is invalidated,
hmm_range_fault_unlocked_timeout() refreshes range->notifier_seq and
retries the walk internally. If the lock was dropped, the retry deadline is
also restarted because a lock-dropping fault handler made progress.
Ordinary -EBUSY retries keep the existing deadline, preserving the caller's
timeout policy for repeated mmu-notifier invalidations.

The caller only needs to perform the usual post-success
mmu_interval_read_retry() check while holding its update lock before
consuming the pfns. If mmap_lock acquisition is interrupted or a fatal
signal is pending during retry handling, -EINTR is returned instead.

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
 Documentation/mm/hmm.rst |  79 ++++++++++++++++-------
 include/linux/hmm.h      |   2 +
 mm/hmm.c                 | 162 ++++++++++++++++++++++++++++++++++++++---------
 3 files changed, 191 insertions(+), 52 deletions(-)

diff --git a/Documentation/mm/hmm.rst b/Documentation/mm/hmm.rst
index 7d61b7a8b65b..e021218ada58 100644
--- a/Documentation/mm/hmm.rst
+++ b/Documentation/mm/hmm.rst
@@ -156,42 +156,57 @@ During the ops->invalidate() callback the device driver must perform the
 update action to the range (mark range read only, or fully unmap, etc.). The
 device must complete the update before the driver callback returns.
 
-When the device driver wants to populate a range of virtual addresses, it can
-use::
+When the device driver wants to populate a range of virtual addresses, the
+normal interface is::
 
-  int hmm_range_fault(struct hmm_range *range);
+  int hmm_range_fault_unlocked_timeout(struct hmm_range *range,
+                                       unsigned long timeout);
 
 It will trigger a page fault on missing or read-only entries if write access is
 requested (see below). Page faults use the generic mm page fault code path just
-like a CPU page fault. The usage pattern is::
+like a CPU page fault.
+
+The caller must not hold ``mmap_read_lock`` before the call.
+``hmm_range_fault_unlocked_timeout()`` takes the mmap read lock internally and
+allows ``handle_mm_fault()`` to drop it during fault handling. This is required
+for VMAs whose fault handlers may release the mmap lock, for example regions
+managed by ``userfaultfd``.
+
+If the mmap lock is dropped or the range is invalidated, the function refreshes
+``range->notifier_seq`` and restarts the walk internally. ``-EINTR`` is returned
+if mmap lock acquisition is interrupted or a fatal signal is pending during
+retry handling.
+
+The timeout is specified in jiffies; passing ``0`` means retry indefinitely. The
+timeout exists to preserve caller policy for repeated mmu-notifier invalidation
+and is checked between retry attempts. HMM does not interrupt page fault
+handling when the timeout expires, but returns ``-EBUSY`` if the retry budget is
+exhausted before a stable range is obtained.
+
+The usage pattern is::
 
  int driver_populate_range(...)
  {
       struct hmm_range range;
+      unsigned long timeout;
       ...
 
+      timeout = msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
       range.notifier = &interval_sub;
       range.start = ...;
       range.end = ...;
       range.hmm_pfns = ...;
 
-      if (!mmget_not_zero(interval_sub->notifier.mm))
+      if (!mmget_not_zero(interval_sub.mm))
           return -EFAULT;
 
  again:
-      range.notifier_seq = mmu_interval_read_begin(&interval_sub);
-      mmap_read_lock(mm);
-      ret = hmm_range_fault(&range);
-      if (ret) {
-          mmap_read_unlock(mm);
-          if (ret == -EBUSY)
-                 goto again;
-          return ret;
-      }
-      mmap_read_unlock(mm);
+      ret = hmm_range_fault_unlocked_timeout(&range, timeout);
+      if (ret)
+          goto out_put;
 
       take_lock(driver->update);
-      if (mmu_interval_read_retry(&ni, range.notifier_seq) {
+      if (mmu_interval_read_retry(range.notifier, range.notifier_seq)) {
           release_lock(driver->update);
           goto again;
       }
@@ -200,13 +215,31 @@ like a CPU page fault. The usage pattern is::
        * under the update lock */
 
       release_lock(driver->update);
-      return 0;
+      ret = 0;
+
+ out_put:
+      mmput(interval_sub.mm);
+      return ret;
  }
 
 The driver->update lock is the same lock that the driver takes inside its
 invalidate() callback. That lock must be held before calling
 mmu_interval_read_retry() to avoid any race with a concurrent CPU page table
-update.
+update. The retry check must use the same notifier and sequence number stored
+in ``range`` by ``hmm_range_fault_unlocked_timeout()``.
+
+Holding the mmap lock across HMM faults
+=======================================
+
+Most callers should use ``hmm_range_fault_unlocked_timeout()``. If a driver
+really needs to hold the mmap lock across work outside HMM, it can use::
+
+  int hmm_range_fault(struct hmm_range *range);
+
+The mmap lock must be held by the caller and will remain held on return. This
+interface cannot support VMAs whose fault handlers need to drop the mmap lock.
+New callers should prefer ``hmm_range_fault_unlocked_timeout()`` unless they
+have a specific requirement to keep the mmap lock held across the call.
 
 Leverage default_flags and pfn_flags_mask
 =========================================
@@ -221,8 +254,8 @@ permission, it sets::
     range->default_flags = HMM_PFN_REQ_FAULT;
     range->pfn_flags_mask = 0;
 
-and calls hmm_range_fault() as described above. This will fill fault all pages
-in the range with at least read permission.
+and calls the HMM range fault helper as described above. This will fault
+all pages in the range with at least read permission.
 
 Now let's say the driver wants to do the same except for one page in the range for
 which it wants to have write permission. Now driver set::
@@ -236,9 +269,9 @@ address == range->start + (index_of_write << PAGE_SHIFT) it will fault with
 write permission i.e., if the CPU pte does not have write permission set then HMM
 will call handle_mm_fault().
 
-After hmm_range_fault completes the flag bits are set to the current state of
-the page tables, ie HMM_PFN_VALID | HMM_PFN_WRITE will be set if the page is
-writable.
+After the HMM range fault helper completes the flag bits are set to the
+current state of the page tables, ie HMM_PFN_VALID | HMM_PFN_WRITE will be
+set if the page is writable.
 
 
 Represent and manage device memory from core kernel point of view
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
index bc9361a715fa..87952c1259c5 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -32,6 +32,7 @@
 
 struct hmm_vma_walk {
 	struct hmm_range	*range;
+	bool			*locked;
 	unsigned long		last;
 	unsigned long		end;
 	unsigned int		required_fault;
@@ -44,6 +45,14 @@ struct hmm_vma_walk {
  */
 #define HMM_FAULT_PENDING	-EAGAIN
 
+/*
+ * Internal sentinel returned by hmm_do_fault() when handle_mm_fault()
+ * completes a page fault with the mmap lock dropped. hmm_do_fault() sets
+ * *locked = false; the outer loop consumes the sentinel and never propagates
+ * it to the caller.
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
@@ -651,37 +663,34 @@ static int hmm_do_fault(struct mm_struct *mm,
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
+			*hmm_vma_walk->locked = false;
+			return HMM_FAULT_UNLOCKED;
+		}
+
+		if (ret & VM_FAULT_ERROR) {
+			int err = vm_fault_to_errno(ret, 0);
+
+			if (WARN_ON(!err))
+				err = -EINVAL;
+
+			return err;
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
+static int hmm_range_fault_locked(struct hmm_range *range, bool *locked)
 {
 	struct hmm_vma_walk hmm_vma_walk = {
 		.range = range,
+		.locked = locked,
 		.last = range->start,
 	};
 	struct mm_struct *mm = range->notifier->mm;
@@ -704,8 +713,14 @@ int hmm_range_fault(struct hmm_range *range)
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
@@ -715,8 +730,97 @@ int hmm_range_fault(struct hmm_range *range)
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
+ * New users should prefer hmm_range_fault_unlocked_timeout() unless they
+ * specifically need to keep the mmap lock held across the call. This helper
+ * cannot support VMAs whose fault handlers need to drop the mmap lock.
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
+ * The caller must not hold the mmap lock. The function takes the mmap read
+ * lock internally and allows handle_mm_fault() to drop it during faults. If
+ * the mmap lock is dropped or the range is invalidated, the function refreshes
+ * range->notifier_seq and restarts the walk internally.
+ *
+ * Passing 0 for @timeout retries indefinitely. A non-zero @timeout is a caller
+ * policy limit for repeated mmu-notifier invalidation retries. HMM does not
+ * interrupt page fault handling when the timeout expires, but returns -EBUSY
+ * if the retry budget is exhausted before a stable range is obtained.
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
+	bool locked = false;
+	int ret;
+
+	do {
+		/*
+		 * If the previous fault dropped mmap_lock, then the fault
+		 * handler made progress. Restart the retry timeout in that
+		 * case, but keep the existing deadline for ordinary -EBUSY
+		 * retries.
+		 */
+		if (timeout && !locked)
+			deadline = jiffies + timeout;
+
+		range->notifier_seq =
+			mmu_interval_read_begin(range->notifier);
+
+		ret = mmap_read_lock_killable(mm);
+		if (ret)
+			return ret;
+
+		if (timeout && time_after(jiffies, deadline)) {
+			mmap_read_unlock(mm);
+			return -EBUSY;
+		}
+
+		locked = true;
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

-- 
2.43.0

