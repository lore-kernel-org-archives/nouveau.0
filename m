Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D1A2C4453A
	for <nouveau@archiver.kernel.org>; Wed, 22 Jul 2026 21:44:51 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A401410E4DF;
	Wed, 22 Jul 2026 21:44:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TbNelF2k";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 07B2747310;
	Wed, 22 Jul 2026 21:29:18 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784755757;
 b=V56V8gS5Q8TExSQmb0F1H8/6fuJ56VRy9EWSIBVxNBsQ7aYAfXrot+CKvq54903Z0rrNO
 ugibaRjvAoiTxEgTbBNNK+cON65LN7WdzsvgCQ3HHhIWEquArKO+ahfbFvZQtoxZ4kGCEyu
 Uz+wzaQaYlrhK8zgp/A7ulDdcqBjDneCswxpTPfzxAlkIZDGr6cgtHqMzlzPnPTng/OeGlM
 ppqsqa+Y6X4doejmImM9te9M+/InJcUgSENoEBkYAARNxXcxi2p9zfAnyFb4erNWOF441L8
 ihzzRvlVLFaCE/nALtDjXI+kDC+TOJdJZ7sVcDp2ibaqYZ2Dfg3MVGBA39Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784755757; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=aLLCLDIkaVkTiiSr3am1nl8JfcuH2IYbuxdGPPNwyW8=;
 b=chw8y+TJxnIKiBHs0rjvSsK6iX83mpGP5eoxRVtM9zxbm3H0jDeToOQ35Gpfl9DSoFdUQ
 5lyK0VJK2wpUVG2RW+kUE5NNFGxQzigaRZbU4WRd8BKUu4i8cv+l/zex5qYys2HNasF1rvp
 9RpJOc53hMgKSkTjdCtIU6ePkk2SVwapM5U4DnRegwxd5EjGOyPnxanH1F/SlvwET1V/6Y4
 ssZDCUE4BOZff+rZixNLnrTA5MHsqoQixnNJlee2NzmhmJ9/HPHsopWpVDPWeT9FR0SRni5
 fQmiZw0xO/1DunG8giP9Z4O0TKS9InA6Y/2hKthLaC9zCcAmpbz0RUVlVzTw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 022CE472CC
	for <nouveau@lists.freedesktop.org>; Wed, 22 Jul 2026 21:29:15 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 66DB3892AA
	for <nouveau@lists.freedesktop.org>; Wed, 22 Jul 2026 21:44:46 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-8487214ad2bso12675764b3a.1
        for <nouveau@lists.freedesktop.org>;
 Wed, 22 Jul 2026 14:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784756686; x=1785361486;
 darn=lists.freedesktop.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aLLCLDIkaVkTiiSr3am1nl8JfcuH2IYbuxdGPPNwyW8=;
        b=TbNelF2kXUuUG+evsapeLFB9M7thPFmm9H7B3hOxtghyG7E2yW84R9VK7D6pLSD2c6
         I/1WADEK6RduK2l/TMQYwYPgpN1r9XPaCPN7X7cKiwnb34AOIjOJLGhXVKLE/6P9YsvF
         ieDsrSGRVKobz5zhzjjkumVRR5luW/xhrEUiOJ4t3gizhNI+pnJEExAUNakL7C/LRp7y
         lchC9rLkd8eqWJX4NaNYXIf1/CZeQm4v74H1QxVt3QqoCEle+7LtFxyFDwKPHa/Vea5p
         J7m2iyz3ewgR2VHbdfUV5OBDawoGe1QbAHhoC7NwqeoIaKnsUookz2uO41SspK6fYiUH
         1NRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784756686; x=1785361486;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aLLCLDIkaVkTiiSr3am1nl8JfcuH2IYbuxdGPPNwyW8=;
        b=cQMm8B+/YJ08Jc5ymZD8dYJrkkKXyLVActCjBhkAn5EoaV0V1lhfLzSvIFsnVJMweX
         liyK/xSqZvIwk06P0/7zMA390pWHakh4YrrlXA/LNonhfICjY3N6dO2qCl5c9hXk5IAk
         3MEzvnUYIEbcBxKUxV8GqgK3hNtDCYIDl75eAIGbNxo4UlzjNubLFyOaKDlnbbCPbGR1
         F1mKeyiONecR8o5AM6WGiHB7ZJVek/oz2zLYOI93rPln6pS/Vat/QpIlbhvIFRhPzmHf
         EbVfqxAJVMxR/LVuhH7gfsH/esGB4ReIED6JxWkiDroH4bo9S9gzoR8BZNkl5TH0bn9b
         6DmA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq5rJnojR03NgWzPideuQm+4wRcsaMdaLmpA3e7zfa+bN1n8CJ05jPjohmvqzHgOMsUB9yIt3c3@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJlkU3HWoLTL50YLU8vrV90Us/YfU6OXcALPKHtyOajkurgvut
	otKRE6FgB+Xv6fYwQ5BIi32qgzPjX7gbny8pTZQsO4ZfAs3clnGZW+Pr
X-Gm-Gg: AR+sD12RVgmB6uKMdb0DvDmGrQTOa2UB1+5WTFipXO1840bpF/Uor7FqgSpcsHdVtMX
	O6b8hOFYswozA8fOa85uz0SScitMli4yGcQz/pCb4k4cTqw4bAb2kXiWSHBArGiQgz6l51dzd4h
	LIwWDjuHON9iEQDV1qlZPQ+b9KUBpx0liwnRzITTOrHH2NYoShlGWY9/UFui8Ni1/RVX/MI2Hz3
	65vYMq4gtFKn/TvPjprt8eaeJoF7heuGezErM9hpYMviIUv+8Jxo71+ljhuhbjPlPg0+ZAdueRv
	874PoI/TYbA6ifsa3QhaSxa5wiKH8DvFokva3VAGLmBppQBYo6eHd/e30yGZ9VI3AzC4H+MD6M1
	ib27xfg7fPhdvwqkgWcnAfzRJHNM5g94tNus8gaB8ex36wCo15OoTreXqiLXnpuZl3nVN6IeYjp
	GbmxEIYwJxr+1yBgaNhM5M8tCBr8soC1QjBdjrgArVCQwoiaXI
X-Received: by 2002:a05:6a00:b82:b0:848:4424:2b8e with SMTP id
 d2e1a72fcca58-84e2bbecf09mr656348b3a.3.1784756685757;
        Wed, 22 Jul 2026 14:44:45 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84e17237c3fsm1946297b3a.9.2026.07.22.14.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 14:44:45 -0700 (PDT)
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
Subject: [PATCH v10 0/8] mm/hmm: Add mmap lock-drop support for
 userfaultfd-backed mappings
Date: Wed, 22 Jul 2026 14:44:22 -0700
Message-Id: <20260722-hmm-v10-v1-0-606464dd601a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALY5YWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcyMj3YzcXN0yQwNdcyPzlCSjpCTLFGMTJaDqgqLUtMwKsEnRSkAFSrG
 1tQBIaEitXgAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784756683; l=8816;
 i=skinsburskii@gmail.com; s=20260722; h=from:subject:message-id;
 bh=GYHNo/XGeE9xtQ1NfZoCvPIFOUdd9M9aSo+hbXMqC0E=;
 b=+/kQG1iX/yRHeUfcwg6WZMiVcO3TSQDq9pOkpGr0vDEFgbY5Bydw04mNJ9njGp2oykHM0oS2i
 VmnQAUaI/jpCI1GH6nJe6/niHsBdn0yt1UpO4W6lecLt6cy2N4FM3XS
X-Developer-Key: i=skinsburskii@gmail.com; a=ed25519;
 pk=bDpriHBYgeTdkIDweZDCemxsU93neJBOCn3YLIuJpnE=
Message-ID-Hash: C6UCT5RQFQG4TFJG4QKKD2XXGC2SOWII
X-Message-ID-Hash: C6UCT5RQFQG4TFJG4QKKD2XXGC2SOWII
X-MailFrom: skinsburskii@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/C6UCT5RQFQG4TFJG4QKKD2XXGC2SOWII/>
Archived-At: 
 <https://lore.freedesktop.org/20260722-hmm-v10-v1-0-606464dd601a@gmail.com/>
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

Changes in v10:
  - Included contended mmap_lock acquisition in the
    hmm_range_fault_unlocked_timeout() retry budget.
  - Dropped the redundant top-level fatal_signal_pending() check in the HMM
    unlocked retry loop; mmap_read_lock_killable() now covers that path.
  - Restored the absolute outer timeout in drm_gpusvm_get_pages(), since it can
    run from GPU page-fault workers and must not rely on the worker task’s fatal
    signal state to stop invalidation retries.
 
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

 Documentation/mm/hmm.rst               |  79 +++++++---
 drivers/accel/amdxdna/aie2_ctx.c       |  23 +--
 drivers/gpu/drm/drm_gpusvm.c           |  60 ++------
 drivers/gpu/drm/nouveau/nouveau_svm.c  |  20 +--
 drivers/hv/mshv_regions.c              |  54 ++-----
 drivers/infiniband/core/umem_odp.c     |  18 +--
 include/linux/hmm.h                    |   2 +
 lib/test_hmm.c                         | 107 +++++++++++++-
 lib/test_hmm_uapi.h                    |   1 +
 mm/hmm.c                               | 256 +++++++++++++++++++++++++--------
 tools/testing/selftests/mm/hmm-tests.c | 150 +++++++++++++++++++
 11 files changed, 551 insertions(+), 219 deletions(-)
---
base-commit: a4271215228d2bd2a50eea03ab0a948b36036948
change-id: 20260722-hmm-v10-727db2bb9d34

Best regards,
-- 
Stanislav Kinsburskii <skinsburskii@gmail.com>

