Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D07C43458
	for <nouveau@archiver.kernel.org>; Fri, 10 Jul 2026 21:26:27 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1C16E10E242;
	Fri, 10 Jul 2026 21:26:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z1ZYKoNP";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 18A3B47051;
	Fri, 10 Jul 2026 21:11:21 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783717880;
 b=OK/mHZ6BT9PewOvh7MznOJlYQUK+9gISIWLXsnvrc8oz0bENeaOacGXfJMPh684fmdOEc
 hA/jiZzh9mRqKMmBYqiyA5yy+E6Xq9A1xFs0sZ1+VrqT0mFUtrWENvHh3QAWGaBnbu3ng3N
 /Q8oDcFguRry3A99fKqmddQSx1Bh5VWyROBDokRIFODYR8qy8pKUStbBUJbGHTcU+YdhOdH
 223tXEoeEba+MDmQT+HKM4CeFGSp98OnEQwxfXsYE/Rr6W/s9X9tfIsY80oDZ4JAbjGMcx1
 MD+Irm5xJF91DUEcWAkIbLxwmPp3svAg7p9BJfzuHO86fyphocA+k5IstCdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783717880; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=wQ4/e++dwiJ2hODy08BO64CkfLW5GsFjzHevL1ATi0c=;
 b=qYgtqzYFp9RX2sbe+7coR8PUmEzvkGg/PAVkoNdMmIDqAqyFXmmWfJ14D5KJfVu5S8Cyt
 9TH0NeybejIpvDivdBfbWTVtuSRS3ifu8dWiGVDiverONJ0SDoKK62CcMStSJ0uRbxd+Ua/
 4oh0sc7C5VUAOkn7ARPmZ6Ul16y5xoXkYePiF8K0hymO4CeIgB4X3hKya/p9qI7tEAWVHyQ
 gs5MbxQYO62p5PKVle7r/nmZQtNJm7v7K6b4xPOagwt1nleyHZye9K8sSbl3FbwsKmp2lnc
 YBsWMzB4wdGFt+DS1uedolEb2LVOqxb64CvUk8Vt/5VrXCSYf5YSIB1/AIbw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C99E946FDF
	for <nouveau@lists.freedesktop.org>; Fri, 10 Jul 2026 21:11:18 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9A81310E203
	for <nouveau@lists.freedesktop.org>; Fri, 10 Jul 2026 21:26:23 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2cc891373e0so13354815ad.2
        for <nouveau@lists.freedesktop.org>;
 Fri, 10 Jul 2026 14:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783718783; x=1784323583;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :message-id:date:cc:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wQ4/e++dwiJ2hODy08BO64CkfLW5GsFjzHevL1ATi0c=;
        b=Z1ZYKoNPQZxq5LqZQPIB6X4bEd69bRDOgg2exXO9gBnPmCFhRS47pC7IhaxejLHPEY
         34CDBq39cQYnUpK+Dl6qqYGRWTqtuKz5aH8UBRW4xo8D/ezY1nTtnOvJPt2M4/SUtpqz
         5Ak4ms4iV7E9wZ/GTm+BdYsnuSjtDJHxL0TQr2bFUza0SCK9RN2zYcD+CQe5H/UP9NT5
         NvNkOIjsKX68iN1yG+DxguuqSN3IJjFPvc6WQWcuqw6aBHLrbDB9FLJI6TurYsUauV/0
         LsqruhdsYcHTDiuFSzWMRsAHbyN7iRP8+4XErPJnrMpGinmLtOPwA2flo1bnhvok5WLK
         01tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783718783; x=1784323583;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :message-id:date:cc:to:from:subject:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wQ4/e++dwiJ2hODy08BO64CkfLW5GsFjzHevL1ATi0c=;
        b=XV1WqEwlg159VLPTH7bE39r2q34v+/+v1vHcB4OuLcv3RGuoSQ2MQ3gylvDzJdy9tA
         tO3/FrojjoCkARMAoCdaUbGtFKyqhWs55yryyelkgI2X6wxgWGNvg2tO7iuVoZ0lC02V
         crii/uLiKiIDzVRidHTYgmtwEHkhx4QDBKH5azkYzpKfKsy7d+cWuWAtWMRZ4UiQFOu3
         yssuGVSHIYOZTJgOf1slWttyYRhBS4EE0lKTfbdKvjRsn4z8noOKidkx1yPKWJ2B6bbX
         4hVzCnbdxdkZgwW62+O85BHPvSOSiA16Dl1WqesHswjHRYYBvZ/OELXLlrdtWO2B0MPW
         ZMoQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqQjZmoLDgtI631hxhleoRHMRJjMd7P17sVv/AMN46qdOnb2qreP+zQFwaqalAY84v6C2Ob8t7I@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEmwyb8TKTmWiu40DVPrbhjHy6w6SPuFD4hK7GbCcHJzoEvQbN
	ARXWdmiBUyEj3pizseXq8uPQBDGQ3vY//Fr5Rh6X6/8djCnibqNLAMS3
X-Gm-Gg: AfdE7clP9ZlNyHKRVnnslNPt6onOOalWP1VcAiZGWgjSKX2uY91FVcel6ZDJ4La91Fa
	QHmxo5RtT5i2kMDWO44C1JmLjxJBe3p8bcUXPtPwjmm/qur3zQBLmHZuH0ChvxOD6CSlQtLsyxS
	Psr9OYmlzMddfze+NVLOeP+grf8/9yxaTqz29FxyMw9e0wWeL73UsAOXmKUewMRRsC534wPWw0m
	5KGlvW3D0MR9cqQeYAh0WikD4ruExMuG9UCNTpJUo7nyjqc7s0si+EV/16ezl5N/J7FwtMhqm5f
	op2ZlA6iSoNKMCQrYmXb9bOqnrhNKHIGhL+W+KYgcekDeXpPmlm8d5UnmuawE862Gq0RjVJ0qSX
	za+sfGl0i7uj8X4OnQG1H/vhr6NG+udrSKC2gqcoGk4KlqhNI81Ox5ap6ReMs6iF423YhucHXe+
	rSDnAZjuPnkg/0clTA/uxb2qZLl6+XCgnIfvIiX9PE5Tv0lzGp9IYw/DQpD5A=
X-Received: by 2002:a17:903:1a0c:b0:2ca:6c8:abde with SMTP id
 d9443c01a7336-2ce9eacd763mr7143275ad.18.1783718782878;
        Fri, 10 Jul 2026 14:26:22 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9d1e28fsm67098765ad.43.2026.07.10.14.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 14:26:22 -0700 (PDT)
Subject: [PATCH v8 0/8] mm/hmm: Add mmap lock-drop support for
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
Date: Fri, 10 Jul 2026 14:26:20 -0700
Message-ID: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6CBXAV2ZZQXADPSICETZ753IMMG4JNUD
X-Message-ID-Hash: 6CBXAV2ZZQXADPSICETZ753IMMG4JNUD
X-MailFrom: skinsburskii@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-rdma@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/6CBXAV2ZZQXADPSICETZ753IMMG4JNUD/>
Archived-At: 
 <https://lore.freedesktop.org/178371866223.900500.12312667138651735591.stgit@skinsburskii/>
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


 Documentation/mm/hmm.rst               |   76 +++++++--
 drivers/accel/amdxdna/aie2_ctx.c       |   17 --
 drivers/gpu/drm/drm_gpusvm.c           |   52 +-----
 drivers/gpu/drm/nouveau/nouveau_svm.c  |   12 -
 drivers/hv/mshv_regions.c              |   54 +------
 drivers/infiniband/core/umem_odp.c     |   18 +-
 include/linux/hmm.h                    |    2 
 lib/test_hmm.c                         |  107 +++++++++++++
 lib/test_hmm_uapi.h                    |    1 
 mm/hmm.c                               |  259 +++++++++++++++++++++++++-------
 tools/testing/selftests/mm/hmm-tests.c |  150 +++++++++++++++++++
 11 files changed, 541 insertions(+), 207 deletions(-)

