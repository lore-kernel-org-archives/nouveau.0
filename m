Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D913C43458
	for <nouveau@archiver.kernel.org>; Wed,  8 Jul 2026 23:27:02 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4566210EA13;
	Wed,  8 Jul 2026 23:27:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W+bkMLap";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 872D146F9C;
	Wed,  8 Jul 2026 23:12:01 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783552321;
 b=hvqHgfgJ7nIe8cFwGvf/bGnRRZU0wTJhbk6cL3LdsZ2Ys9CYOa73YmUDCmU+AnYGr3TJj
 q+p67Ssj+dQh6U4iqn5kU8nGy9tJ5wVa/3Wx8R9wfPaAZcHCNhHwQPAnYE11cOW0wXpf+sN
 kwfXZaG0MEZ6k5XWYAnVqGh4u1yfATEl/c7jTzZZLCbe65chKIrN7cRPeNBmfHWiJlKzMVL
 7Yt/BT/RujhNmrUuo1PIYUtihdPh76t2PmmOVaVfhnBjtr+/T/ISp5k1IwoupTex6vUcT6U
 dlBJNkKE23jyt40RE1516XRyXOkoD1lOAnf1UswAzqzh2YQaG369upjVriSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783552321; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=mr3RDiBFqeIYTx2r/qE+kwdslKLjgblCNaiBX5VWqtY=;
 b=Jtf+9xCSoIZczM1jXh2YgLETOuKPl6DFzzwpu5kpW1D8Lce+trTeqEPKsCtRVGm8gEKCU
 YegCFXswsoCgcjo0PEFYxJnhkESUExJpUFDMFdfcOq9AcuYTq3ETtDGWa9RVxBJq9DQQJ2I
 u2ZgHAJ2L/V+WHMklAeAixa7r7umvoxlYWu6zvlXik845eNH9XjmnSCnvI16fMPXaQHLWfR
 e9t0Pq5rjktr1Ncr1TfSNn5TcVff+JnjEarJlqo2jTDb/8wxWBST7Ycz8SeAWZTOQMJPGKX
 0INqtgSK/Z3/lPMd70zbcmVgFk4JcPS31FluBYsltW6KzBA14fKONaI+8eQA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 6EDE246EEF
	for <nouveau@lists.freedesktop.org>; Tue,  7 Jul 2026 19:31:52 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5139B10EEED
	for <nouveau@lists.freedesktop.org>; Tue,  7 Jul 2026 19:46:50 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-2c7cfa17fedso54021815ad.3
        for <nouveau@lists.freedesktop.org>;
 Tue, 07 Jul 2026 12:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783453610; x=1784058410;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :message-id:date:cc:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mr3RDiBFqeIYTx2r/qE+kwdslKLjgblCNaiBX5VWqtY=;
        b=W+bkMLapfUqJY7oo9l3eX24A7Bal+MZ308CbxL01y6laxJoB4zLi9JVk+Dee8uXZAx
         sJB+EJT5bdUqZ/aXMcfr2Q/IrebYK/hgps7BvVIV7Gq0/oNFHp9GdSXYg0yODgjsxTiP
         pulBivtFW2RJcnY124Loc3MXMutqRdIS1C4Qo6A0UwxRBrMgQEBrjhx5I/e1YGf4Hmbb
         goWjAtWYUq3yWDKQXu0KaQ5qW5kVBMQbAd3PFwXGNyLwt+HnEi2MosxaApavPO41UlAl
         Uhez/MBhMTgU4k+6ROuGagJMkZHE+FQ0j36OdPx/+frQ3g5YjXO3tq26HTtmcc5KIes+
         bnEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783453610; x=1784058410;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :message-id:date:cc:to:from:subject:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mr3RDiBFqeIYTx2r/qE+kwdslKLjgblCNaiBX5VWqtY=;
        b=fnyrSnKjJ2tZyvM6sH72KUgQTcZ9/uchFPZDfbk4mkgR031kc8s3F/ka7aIqm9f6xJ
         msB4veoUuaMMFAQ+qUkHNn32AElIC28EWEn0dNa1hPyLWD5oZFH/IyQVFpR9w8Vf9yUv
         MURCtwyjUcgrC9HpQRnSAFIWAPrf6Un4DSHGy4F0yAO0ov5FFI7CuYIkgqoWgSAlsSNP
         Ji9c4+RSXlar9okZmFo2P8FrwOyOWSYBW571AuIeSeA2ISUAbtkYfaMeSKCSJPgJrAu8
         LZxHdIODNu+kU2jl+BKCBg3oGoJ995SsmlzOBFsncFLWZJeAe8keQdxiE2Cy76T/L7Ae
         jkmA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrwfxD0LYG/1j1YZWgPnjotHleaInTAfL3ZBtrkY+R2dAGLq2w/PKTbZq2zRExMpJsHcjhjZW+x@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRwZyXBVBsyCkYXdWOg6O4btR3aO6p3x9JbrYuEav+ZrZoxgmk
	oTtj7MWd3SC3Mdy1BFtWC7cDsOq1ljxpmmjvUHFqwUARIGV+swQ0tgcy2q+2Eg==
X-Gm-Gg: AfdE7clLCT/MFQrvZnJn3UYrGSqD3tPxU7TVsISJTrn+Doip2iWZNwbGUeWV1ALKZpm
	RmGHsejJExDdeWFJGFz92RTgAcGwfeKa4UVi2h1mq1wbusz3Gl6b4bUSuKcWksxMhGuX1D++pg8
	WyJquRX2EtvFkMsc/8P7DZ7y2OExCcQ5cJyi/SKL5t23Nlv8Vbz9YOLb+Z9XlTXvooc5OC5P1hj
	r7ZNX14AAjRDlugAG5lG0du5qqNjrCBiTWmf35CbNRlLN1X8kcnOHd+wMVi4bPF/3jtQSSX6I5j
	Px3gX0v223jDV7vUDWktl43106b9k22YfeRW9ZSQ3E7zgYyoBTiZ/2RZOwgXJML4ybGIFTq+UH2
	6nBWg/FeLnXmVcBSFxpsvQtaZxqFeNUk15959uW4cRV4Y4rs6NPl7r1fdKBrXfIYx5hWEnkp8LE
	TkAFsVudJk2ukqih9In3Jl/ByNaE6PLWqeD3DS/KKBMeijj9cJ4COcJVrIzvY=
X-Received: by 2002:a17:902:d490:b0:2ca:ef4c:e553 with SMTP id
 d9443c01a7336-2ccbe40b1d7mr62952355ad.3.1783453609639;
        Tue, 07 Jul 2026 12:46:49 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9bdb86bsm17316425ad.11.2026.07.07.12.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 12:46:49 -0700 (PDT)
Subject: [PATCH v7 0/8] mm/hmm: Add mmap lock-drop support for
 userfaultfd-backed mappings
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
Date: Tue, 07 Jul 2026 12:46:46 -0700
Message-ID: <178345345668.660027.2952911919681614557.stgit@skinsburskii>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-MailFrom: skinsburskii@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: UA6C2LYQFKMCT35B2M5EQLZB4DCLLK2M
X-Message-ID-Hash: UA6C2LYQFKMCT35B2M5EQLZB4DCLLK2M
X-Mailman-Approved-At: Wed, 08 Jul 2026 23:11:59 +0000
CC: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-rdma@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/UA6C2LYQFKMCT35B2M5EQLZB4DCLLK2M/>
Archived-At: 
 <https://lore.freedesktop.org/178345345668.660027.2952911919681614557.stgit@skinsburskii/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This series extends the HMM framework to support userfaultfd-backed memory
by allowing the mmap read lock to be dropped during hmm_range_fault().

Some page fault handlers — most notably userfaultfd — require the mmap lock
to be released so that userspace can resolve the fault. The current HMM
interface never sets FAULT_FLAG_ALLOW_RETRY, making it impossible to fault
in pages from userfaultfd-registered regions.

This series follows the established int *locked pattern from
get_user_pages_remote() in mm/gup.c. A new helper function,
hmm_range_fault_locked(), accepts an int *locked parameter. When the
mmap lock is dropped during fault resolution (VM_FAULT_RETRY or
VM_FAULT_COMPLETED), the function returns 0 with *locked = 0, signalling
the caller to restart its walk. The existing hmm_range_fault() is
refactored into a thin wrapper that passes NULL, preserving current
behavior for all existing callers.

Possible approaches to lift this limitation are documented in
Documentation/mm/hmm.rst.

Changes in v7:
  - Replaced the unlocked HMM API with
    hmm_range_fault_unlocked_timeout(). The helper now takes a timeout in
    jiffies, with 0 meaning retry indefinitely.
  - Moved -EBUSY retry handling into the HMM helper for the unlocked path.
    The helper refreshes range->notifier_seq internally before each retry.
  - Switched the unlocked path to mmap_read_lock_killable() and return
    -EINTR if mmap lock acquisition is interrupted or a fatal signal is
    pending during retry handling.
  - Removed the redundant non-timeout hmm_range_fault_unlocked() interface.
  - Updated Documentation/mm/hmm.rst and kernel-doc to describe the timeout API
    and the intended caller pattern.
  - Updated the HMM selftests to use hmm_range_fault_unlocked_timeout()
    only, including coverage for the finite-timeout path.
  - Added in-tree users of the new helper:
      - mshv
      - nouveau
      - RDMA/umem
      - amdxdna
      - drm/gpusvm
  - Preserved each converted driver’s existing timeout convention:
      - unbounded retry where the old code retried indefinitely,
      - HMM_RANGE_DEFAULT_TIMEOUT where the old code used that budget,
      - existing driver-specific timeout return values such as -ETIME.
  - Used max_t(long, timeout - jiffies, 1) when passing remaining time from
    absolute jiffies deadlines to avoid unsigned underflow while keeping a
    minimum one-jiffy retry window.
  - Left callers on hmm_range_fault() when they already need to hold
    mmap_lock across surrounding work, such as drm_gpusvm_check_pages().

Changes in v6:
  - Reworked the new API from the external int *locked pattern to
    hmm_range_fault_unlocked(), which owns mmap_read_lock() internally.
  - Changed the dropped-lock contract: hmm_range_fault_unlocked() now returns
    -EBUSY when the mmap lock is dropped, and callers restart with a fresh
    mmu_interval_read_begin() sequence.
  - Kept hmm_range_fault() as the locked variant for existing users, preserving
    its caller-held mmap lock contract.
  - Added an in-tree user by converting the MSHV region fault path to
    hmm_range_fault_unlocked().
  - Updated Documentation/mm/hmm.rst and kernel-doc to describe the unlocked
    helper and retry pattern.
  - Updated commit messages to match the new API and return semantics.
  - Kept the userfaultfd HMM selftest using the test_hmm unlocked read ioctl
    path.

Changes in v5:
 - Rework hmm_range_fault_unlockable() retry handling to retry
   VM_FAULT_RETRY internally with FAULT_FLAG_TRIED set, matching the
   fixup_user_fault() pattern and avoiding repeated first-retry lock drops.
 - Distinguish VM_FAULT_RETRY from VM_FAULT_COMPLETED: retry faults now
   reacquire the mmap lock internally, while completed faults return to the
   caller with *locked = 0 so the caller can restart with a fresh notifier
   sequence.
 - Document the two *locked return states, including the -EINTR case when a
   fatal signal is pending after the mmap lock has already been dropped.
 - Update comments around HMM_FAULT_UNLOCKED and the HMM fault loop to match
   the current hmm_range_fault_unlockable() implementation.

Changes in v4:
 - Rebased on 7.2-rc1

Changes in v3:
 - Return -EFAULT from dmirror_fault_unlockable() when the mirrored mm can
   no longer be pinned.
 - Add an eventfd stop signal for the userfaultfd handler thread to avoid
   waiting for the poll timeout on successful test completion.


Changes in v2:

 - Split into a preparatory refactor (new patch 1) that moves
   handle_mm_fault() out of the walk callbacks, plus a smaller feature
   patch on top.  Suggested by David Hildenbrand.
 - Hugetlb regions are now supported on the unlockable path; the v1
   -EFAULT short-circuit and the hugetlb_vma_lock_read drop/retake
   dance are gone.
 - Distinct internal sentinels for "needs fault" (HMM_FAULT_PENDING)
   and "lock dropped" (HMM_FAULT_UNLOCKED).
 - Outer loop now re-walks after a successful internal fault so the
   faulted pfns end up in range->hmm_pfns.
 - Kernel-doc on hmm_range_fault_unlockable() and the
   Documentation/mm/hmm.rst example match the implementation.
 - Dropped the mshv driver conversion (v1 patch 2); will post
   separately.
 - Selftest converted to drive the path through test_hmm with a
   userfaultfd handler (new HMM_DMIRROR_READ_UNLOCKABLE ioctl).

---

Stanislav Kinsburskii (8):
      mm/hmm: move page fault handling out of walk callbacks
      mm/hmm: add hmm_range_fault_unlocked_timeout() for mmap lock-drop support
      selftests/mm: add HMM tests for mmap lock-dropping faults
      mshv: Use hmm_range_fault_unlocked_timeout() for region faults
      drm/nouveau: Use hmm_range_fault_unlocked_timeout() for SVM faults
      RDMA/umem: Use hmm_range_fault_unlocked_timeout() for ODP faults
      accel/amdxdna: Use hmm_range_fault_unlocked_timeout() for range population
      drm/gpusvm: Use hmm_range_fault_unlocked_timeout() for range faults


 Documentation/mm/hmm.rst               |   63 ++++++++
 drivers/accel/amdxdna/aie2_ctx.c       |   17 --
 drivers/gpu/drm/drm_gpusvm.c           |   52 +------
 drivers/gpu/drm/nouveau/nouveau_svm.c  |   11 -
 drivers/hv/mshv_regions.c              |   54 +------
 drivers/infiniband/core/umem_odp.c     |   18 +-
 include/linux/hmm.h                    |    2 
 lib/test_hmm.c                         |  111 ++++++++++++++
 lib/test_hmm_uapi.h                    |    3 
 mm/hmm.c                               |  246 ++++++++++++++++++++++++--------
 tools/testing/selftests/mm/hmm-tests.c |  220 +++++++++++++++++++++++++++++
 11 files changed, 613 insertions(+), 184 deletions(-)

--
Signature

