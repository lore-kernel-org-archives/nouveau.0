Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2084BC44501
	for <nouveau@archiver.kernel.org>; Wed, 15 Jul 2026 18:15:56 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E8D1510F10E;
	Wed, 15 Jul 2026 18:15:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ClBLgFqb";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2817C470D7;
	Wed, 15 Jul 2026 18:00:40 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784138439;
 b=MnSvFyPR3T6LWstRFvaJKeXkG5PrJrKns/1ZabUbB3Nprdh53Mb8FDDqrj2CIOVHGi1vG
 rVZXI38+HJm0XGWYDQagHVKSlQ/BIvmiGsOEd8rqwtmdFsYjHQkoGHovN0V0UWx6eDuA2W5
 q2gGLbA2nxVTvb3RrFAtLhxOdLZSqfrPFio7U+RAjpi/A7bahd0s2omDRlSgz514nMSMDyB
 V8xu3MvdkcJoigxKo4TIhTTBDP1CTi9pMdQtfH6nOi00cxsMjXjylhI2iIbhQf5VpCqoYhk
 0Ig0Z/cBHt1+dlrSCT9Pmq9gViY9A/pRZnWn2eXSAuKKFP0l7prZI3yc53tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784138439; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=o8cXs1v6rCZCT506ix1H6vuS6eKjBp0nDmZrJvk5ap0=;
 b=FhQW2Df42YIVsK56btENOf2RebdyiOoSC+cnqf0rtyCowEFdQqHZ6SEmqsoE+wnf7NCtS
 dWXkZyFhrgSuIYh7JbkBNlnPxALLR6HkDYVOsR2I4+/1r5VOVjWycoD3xXgHFOD/YkisSen
 AJH7HdodGpyDNaAvrxun4dhRONqaQnD5AaM4GjTBS48nHv4CwoZ6MNzFaC0Bia44wxFa0nT
 eV9ZkJZzmHmQlnzJcWtBY9aTDI94ZBUOkwhIBcUylJHbfMluh9aXiltsmaMdVrlN+5/J6+B
 Mr+V+V+3KJwUQLOMvojvuY357/GFOgGkO3EwiotDXt9RtrJZ9AbDqtH/0YKQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id E5D8546CB5
	for <nouveau@lists.freedesktop.org>; Wed, 15 Jul 2026 18:00:37 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7A38B10F105
	for <nouveau@lists.freedesktop.org>; Wed, 15 Jul 2026 18:15:53 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2c7c61b5292so34899735ad.0
        for <nouveau@lists.freedesktop.org>;
 Wed, 15 Jul 2026 11:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784139353; x=1784744153;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :message-id:date:cc:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o8cXs1v6rCZCT506ix1H6vuS6eKjBp0nDmZrJvk5ap0=;
        b=ClBLgFqbEfTe/wA960uuF9GmdfRjLt8aZSdP3S3KQckPKbeM5XxcktGb2lmjnNurU1
         JvArYu/o/cdhXNBAOUwVMD/fixDiHzDaelf68QbOWXIg9DY88v8r69uMeR2UWcsnqMDU
         vJ5mLg1/dcpKoAgNmxMHSYtYyRCaOXQetSWI68cuqjBeQxBPlkO7/JhsMrYXcgCBTccW
         /5kocoSYgH4PnUfXZ097KlyJHdk5QcSgsQnsMBKSl8GmRHoxxbInfevtexj8t3lB2dto
         IMq8G79WDQGn165YVibIaKLLf+9fxGtpdHrEopy0HrNe203PdoHzg2+Q852HY6048jQR
         sqpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784139353; x=1784744153;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :message-id:date:cc:to:from:subject:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o8cXs1v6rCZCT506ix1H6vuS6eKjBp0nDmZrJvk5ap0=;
        b=NHvHX0S87MofaqwwOVBHzQgv5eaasBg1FlPL4GOcplNjbBFUWl9g6jR8vxdsPw/cyO
         D3Ih/uS1n3xEplwDZQoInMLPT+92/2E2Q0EpCsl+ReqjGgBsjIUbZmf/T9JhlWGooFtn
         MBmWBjjRHFm3RKBrio0DTFFfWPnzX32wBJfH3WQFzjX3OUNOryqQG2bKp/IV44IdAzmn
         idx08x1ZBVE2qdG4foggFmMAY0sX0Rgk0ef2jud4QGCsIDGUsMW6HY2itRL6xERmXXIZ
         RNnEZU/W2XOgE5v604ZR3t2AAn/jY/k1NVlW/fKXPndBwHtUHqvcyhRE6ICnTC1yqDmu
         bblA==
X-Forwarded-Encrypted: i=1;
 AHgh+RplHV/HKPUzfnAi8TI6UYA3xjj5ISTVRGIjBJSY6xktnfCSOaiLMYY6L5yRUPfVxbtMzx5EftZj@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEYp969MH+sEvEbxkzmobQwQBp2B/tvFjcHw6agw7Ij8I+qsrQ
	786kUiXSHSMgdrMesIoEwt1wogAU2eSeWk49m9olsNNUObBKVdkKIvA1
X-Gm-Gg: AfdE7cn2KytlKP0oI4ZRR/m8ASvvxr4Yosz1/fcCjFeejZM/Qb0oeeS03ehpMM2nYj9
	amZnfHXiDuwfqxIHg34YA17e8RgUQvB5CohhBHwA920bxT/+FY6bCtB6LSZGITO7EekpqgNXzcE
	aTmjRILVdXwAFpqW2odf7Ga4LOTixEkYXW4qVm6PQMZAzxGdFWdtR62mwn+u6FCTURv9Xx71SYX
	OWTpIrYMi3HQ8GHtAr1pU2qYC0gToEbjglrPYE+W3UAU3Bc2Di5E+q36A29rdCU5FS23NWeY4RM
	9KdNrBNGkfXFWLOg1MpLoys/2n03zs/fQCfJy3kv4EWhWYYeo1f/Ib3EIV4k7zyDdkZMGqLnK8Q
	LN3dgLkRCyOWW4mCexoH39rxeA1yPhml9QmHJA5+/TdiqsVl5iF+ZhDcXF8pHCXuijeVyGczmS6
	SKAJiZawzN1j1/I3FXx8DlmdhofADiTBLuIbnOY7HBVg31GyIWTjKRnF2li05i/amguvmqew==
X-Received: by 2002:a17:903:19c3:b0:2c9:97a9:2096 with SMTP id
 d9443c01a7336-2ce9f05981emr195144115ad.42.1784139352792;
        Wed, 15 Jul 2026 11:15:52 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cf1055cde6sm6969345ad.52.2026.07.15.11.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 11:15:51 -0700 (PDT)
Subject: [PATCH v9 0/8] mm/hmm: Add mmap lock-drop support for
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
Date: Wed, 15 Jul 2026 11:15:50 -0700
Message-ID: <178413903133.1155966.3904063656020521607.stgit@skinsburskii>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MF2M6NXJVRYP2PYJQM2SBSGLYXL6HX5M
X-Message-ID-Hash: MF2M6NXJVRYP2PYJQM2SBSGLYXL6HX5M
X-MailFrom: skinsburskii@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-rdma@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MF2M6NXJVRYP2PYJQM2SBSGLYXL6HX5M/>
Archived-At: 
 <https://lore.freedesktop.org/178413903133.1155966.3904063656020521607.stgit@skinsburskii/>
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

Changes in v9:

  - Folded the fixups into the full 8-patch series instead of sending a
    separate fixup series.
  - Clarified that the HMM timeout bounds repeated HMM/mmu-notifier retry
    attempts, with the helper refreshing range->notifier_seq internally.
  - Kept nouveau’s explicit outer deadline because its retry loop runs in a GPU
    fault worker and cannot rely on fatal signals from the faulting process.
  - Converted amdxdna, and GPU SVM callers to pass the shole timeout budget to
    hmm_range_fault_unlocked_timeout().

Changes in v8:

  - Make hmm_range_fault_unlocked_timeout() the primary documented HMM
    range-fault API, and move hmm_range_fault() into the “use only if the
    caller really must hold mmap_lock” category.
  - Clarify that the timeout is a retry budget for repeated mmu-notifier
    invalidation retries. HMM does not interrupt an in-progress page fault
    when the timeout expires.
  - Restart the retry timeout only when handle_mm_fault() dropped
    mmap_lock, because that indicates a lock-dropping fault handler such as
    userfaultfd made progress. Ordinary -EBUSY retries keep the existing
    deadline.
  - Remove the attempted timeout selftest. The remaining selftest covers the
    intended userfaultfd path by resolving missing-page faults through
    HMM_DMIRROR_READ_UNLOCKED and hmm_range_fault_unlocked_timeout(..., 0).

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
      selftests/mm: add HMM test for mmap lock-dropping faults
      mshv: Use hmm_range_fault_unlocked_timeout() for region faults
      drm/nouveau: Use hmm_range_fault_unlocked_timeout() for SVM faults
      RDMA/umem: Use hmm_range_fault_unlocked_timeout() for ODP faults
      accel/amdxdna: Use hmm_range_fault_unlocked_timeout() for range population
      drm/gpusvm: Use hmm_range_fault_unlocked_timeout() for range faults


 Documentation/mm/hmm.rst               |   79 +++++++---
 drivers/accel/amdxdna/aie2_ctx.c       |   23 ---
 drivers/gpu/drm/drm_gpusvm.c           |   61 +-------
 drivers/gpu/drm/nouveau/nouveau_svm.c  |   20 +-
 drivers/hv/mshv_regions.c              |   54 +------
 drivers/infiniband/core/umem_odp.c     |   18 +-
 include/linux/hmm.h                    |    2 
 lib/test_hmm.c                         |  107 +++++++++++++
 lib/test_hmm_uapi.h                    |    1 
 mm/hmm.c                               |  259 +++++++++++++++++++++++++-------
 tools/testing/selftests/mm/hmm-tests.c |  150 +++++++++++++++++++
 11 files changed, 551 insertions(+), 223 deletions(-)

