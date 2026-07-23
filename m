Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC99C531F7
	for <nouveau@archiver.kernel.org>; Thu, 23 Jul 2026 17:36:49 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0E1C910F197;
	Thu, 23 Jul 2026 17:36:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FhO2f5+J";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8D1D447360;
	Thu, 23 Jul 2026 17:21:15 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784827275;
 b=WKf/08e9SlkJgOafGm00iM5Cz/4HApnZONnkRgu9wqL8Kfqpo5TStha8b3NUpFmsMS3Lg
 Yql8EirKqU0F0q6IvLtcURagfdObD11ie2W0p1MlCKwKpuhK0hCbEU+CYLal7BzGkaRLtw2
 mPtV5tzXoAK4zRtqMVUP2ayp6sfQui4dK9Ix3GZWmSMl/aMjK2YztNsMQJjCBBpn1kB9jAu
 03QBX6sPmJIPKhZe9E9UJXG4fcbyxHDv1Li5RdV8FhZ/oi6+7je+rGdFm6dfp6R5FigPhcH
 vFUQIDGbZq2USkUqsum6fobkAaYsaJy7PGOcvbxPAYtAXz69emD2txsJml1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784827275; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=hxuraTQgEZqYbQmSAqLAHqtM6r0YcdQGYrnF3lC7WW4=;
 b=qpcmMGIzMu3Eih/3y+ZGB97pxuHvuEf+AJCHlDoShAI4o2D1YVn+rqoBf6cq7K6Bl+f1/
 cnls6zLzHA1yUUWgPVBp1lBU5zFF3GA2qSpv9XR/xscZkHOsbFtFRrD1G8J3asmr/70rMMa
 xYXroDs06xtzQpTICM0s0YxgTaAx7G9uqQLfZtm71qA9mNuJgJFkmPjSHoJt7fvJTpIgB9T
 vpnX5fFxemuQtas5yUrf+POC6nsqxKFc7RVyoMcPI0UlBO7vrvc4TIXIPveMB4BhrQ4+20j
 0uQCCydk5ehvTAC3pzzuMS/Qb3cTa6MKC+a70AeDpgi+svwVvVH0MuO5ampA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id E8AA14730E
	for <nouveau@lists.freedesktop.org>; Thu, 23 Jul 2026 17:21:11 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3032510E315
	for <nouveau@lists.freedesktop.org>; Thu, 23 Jul 2026 17:36:45 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-845c92bc464so736836b3a.2
        for <nouveau@lists.freedesktop.org>;
 Thu, 23 Jul 2026 10:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784828205; x=1785433005;
 darn=lists.freedesktop.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hxuraTQgEZqYbQmSAqLAHqtM6r0YcdQGYrnF3lC7WW4=;
        b=FhO2f5+Jo0ZBDg94tRTOriADwK1r3sx0dKkotIMYgvUKa1IWsOE0UsWIcwn5kblIKu
         5g/Wig+bsRJ8A2knE79MgJozaH8VOXaNAOX2IwJNlTWBUan93qRxGzebP9jUu1AO+OCn
         p4D0V3Q8bYyW3Q5V5XBb1DzSIzUwf+Ph/9dEroM16tj9qy8Zbsss0pYCx2IpIYIIAhUx
         knzGqQP52c/dDX2HnKC29U6SYlsA3v+N5DuzQu8LNnGbDq4+rz9A+b6Kjq3K68vhaiN1
         lmFesXm+azD0jqUmeTuud6n3rodP04Tv2XQWFRvdAZW6wyD8tfs3yYU6+6hu8pO5/1Gl
         s1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784828205; x=1785433005;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hxuraTQgEZqYbQmSAqLAHqtM6r0YcdQGYrnF3lC7WW4=;
        b=CJvTcFMwpYreUGdnSGuvzgYxX1N3xJxWXC4C2h/hpqzOI8lRQ70Ctqw8p8kIM3eJC9
         05iqF3J2nVYYCcg0igqYSbUKzKPYId1NyrDQvE6h7/XhrfcyQew6una2U9r2jPlIpgJS
         q+CeoJpUBgAW9LIBnRQVmNSVwnDtsQAApcoXLoEN6U+GoYM846+KPLI8nS00HFHa10zk
         i6n5sOjoRNXZvF1W2KaPQ8IgWl6n47DjKT0eeg0yclrxjIhzx9nHS7AeYuNYQbUoiiuT
         8qRIT4CltJwtDnd05KVpIzryCuTcRN/yYyXvoVAowhr+xd9+ILqEXfs6zOdpMx0Ha0T1
         iWlQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp48sZOFm0FAYc0krXtbWWaGAgkC1D/ykgMff7lw//COKS/90OO4A8hKNrQdroZiheK7XvH5+J5@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwcOjE3JmsLuXY75d5pvOUJWN1Wi+qHQC+kX6ZKhqNsIYCAKLsS
	JHQchZfUtdvCBdsT2/qFIsPp3VzguBRKPTk9mFjxdV60dWQv1XyM6IVA
X-Gm-Gg: AR+sD10aVxZCSX2IafPtHEKcLzTy4pIQYdC+B2K5A8ztZB4HB8tPQJ0/zgvq49Mpj9T
	kZtsMRULkKz+115s43dOjXnFZahdbmepnRO5k94eK3DcklSi0V8dCpZ8TcDJBoe3kkTuFNXLc/8
	GL5GXwq4ihM3sZRPquUzDoqrW1GbdP+gZjxgMqI5bd9NpgXKGcTYDW3v8XJ+FQCqUt8kzcJMtIm
	K+pEJV4gJFlNVdIG0ONaIFkCZtcY2qnem9QXV9ceNLR2Tknej/7nH6CrWfTFi+kW4kuVX3kcQNw
	Lebbug3p9P8yo6Kvd1IBzBTF5qRydsU9y9Fkb6tWF4eLAHBzyHjkzneJIq3D2WIhy65yGTs6Gpo
	L2zemPcAbm0z9T2PiM0iBvDQvdXlL7K6Agva/DnLeOudUW+CgaM3Pikvn1FKlHWXBQZ06yLmJfi
	gaX9hk1MhNg9mwcDr8HuArTxNyKDZ/3lwSTMFBJJObMgiiSRzU
X-Received: by 2002:a05:6a00:c81:b0:847:7a61:e68e with SMTP id
 d2e1a72fcca58-84e2b8da6e7mr4786213b3a.31.1784828204458;
        Thu, 23 Jul 2026 10:36:44 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84e20622dedsm2691612b3a.11.2026.07.23.10.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:36:43 -0700 (PDT)
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
Subject: [PATCH v11 0/8] mm/hmm: Add mmap lock-drop support for
 userfaultfd-backed mappings
Date: Thu, 23 Jul 2026 10:36:32 -0700
Message-Id: <20260723-hmm-v10-v11-0-c55b003a4b61@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACFRYmoC/2WMQQ7CIBAAv9Ls2TUsEoie/IfpAQqWTaQ1YIim4
 e9irx5nMpkNSsgcClyGDXKoXHhdOhAdBpiiXeaA7LsAKaQWRkqMKWElgUYa76RzZ39S0OtnDnd
 +76vb2Dlyea35s58r/ez/oxIK1EIrrbzXgux1TpYfx2lNMLbWvmvz8dafAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784828202; l=9167;
 i=skinsburskii@gmail.com; s=20260722; h=from:subject:message-id;
 bh=5RWy4Wkr5bgViXPrkI5IwkEQLLeakvDDFGFaJWM2Tgc=;
 b=DsSTuR1DRqaS/DIFjBB8yCQcyfhxOja730tI0RS6QEUOq4R2IPDJiPT3gyE6F9ZISrvwMWuad
 bA2XAbxJW9GACTx9F8w3yQ1BguR31nmSesivxAsNeNCUTR7S8vF+PaT
X-Developer-Key: i=skinsburskii@gmail.com; a=ed25519;
 pk=bDpriHBYgeTdkIDweZDCemxsU93neJBOCn3YLIuJpnE=
Message-ID-Hash: OJXO5QZMBDN2USD5C7C2ZIVHMO6R3URP
X-Message-ID-Hash: OJXO5QZMBDN2USD5C7C2ZIVHMO6R3URP
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/OJXO5QZMBDN2USD5C7C2ZIVHMO6R3URP/>
Archived-At: 
 <https://lore.freedesktop.org/20260723-hmm-v10-v11-0-c55b003a4b61@gmail.com/>
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

Changes in v11:
  - Reject unstable address spaces in hmm_range_fault_unlocked_timeout()
    after taking mmap_lock and before walking page tables.
  - Compute the remaining HMM timeout budget before the time_after_eq()
    check in drm_gpusvm_get_pages() to make sure it can't result in zero
    and lead to infinite HMM range faulting loop.

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
 mm/hmm.c                               | 262 +++++++++++++++++++++++++--------
 tools/testing/selftests/mm/hmm-tests.c | 150 +++++++++++++++++++
 11 files changed, 557 insertions(+), 219 deletions(-)
---
base-commit: a4271215228d2bd2a50eea03ab0a948b36036948
change-id: 20260722-hmm-v10-727db2bb9d34

Best regards,
-- 
Stanislav Kinsburskii <skinsburskii@gmail.com>

