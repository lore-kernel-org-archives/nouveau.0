Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D71FC43458
	for <nouveau@archiver.kernel.org>; Tue, 14 Jul 2026 22:21:27 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C3DFB10E0F5;
	Tue, 14 Jul 2026 22:21:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aO16qDtT";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CE65C471C5;
	Tue, 14 Jul 2026 22:06:12 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784066772;
 b=o4x+/UU51MyJKz4U+H5YbGxwOG7T7SaGMyNtSVMRcznfeNzKy/fYv5iWMJ8deu8aJKtiC
 3nLMq4XUSYXZxv2nYsCrYaXvONl0o3iUcbQrXAEQyyzfqGdBn1CkuE3Spy1cDwrp4wGuk4J
 jnsiLV5N4WfWk6OUqw+a3VvVDsTl8HoIU2SFB1b2m6k3bvC0apmIRAiZpZbwFelf3BOK0G3
 YZWf6gr94HMmpAGjg/U1j5Ez+AimN5Xf9C8cgq/nqjEq9dq/72Ws8+0pfmcK5TP3jZ44J2c
 nLBUPncjG7pWXjbbVqbafstuev/Bl8qChoPB+FI7iLUaWHEgv0St+8KPsczg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784066772; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Vv0t/+7auxcbtGWpvakmJ0ritrqSQFOQmC0jKQCZU2I=;
 b=FWVBz9uDg4HQNJpCGfUSdC3bOBo4fgjqfDWZNuzptddZkkdlutadMJjtRNdqXwjzsOou3
 gqwJXFyD+jO4GKkORcS6F0uWCSqCVutJ7DRAM5gjxERPZFhCm2TCTBAVpd9IiJgRr7tjWI1
 jksfyfaILkpG6uDxEkkmr7+oMG7Tu2IryKGqZUX0hZ+ZFnY7Ee+eyUxROKYiYtFCBrF9BaV
 dfin7Ku0/YSc+uC2VpCxasaQys/5vGQy6e6WkdAJqysf9iWc2wktURgjIprIGMGmCffztZM
 r+U1Khk9pkmOmsIPQUx1wedcwsK6i2ZkgcTJljBjWuKZT+sVtcizBpgun0Lw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 72B8D47123
	for <nouveau@lists.freedesktop.org>; Tue, 14 Jul 2026 22:06:10 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2F87B10E0DF
	for <nouveau@lists.freedesktop.org>; Tue, 14 Jul 2026 22:21:24 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-c966b9ee9cbso2734743a12.1
        for <nouveau@lists.freedesktop.org>;
 Tue, 14 Jul 2026 15:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784067684; x=1784672484;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :message-id:date:cc:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vv0t/+7auxcbtGWpvakmJ0ritrqSQFOQmC0jKQCZU2I=;
        b=aO16qDtT8i/HS2KXG0ZlqTI7Q/ewa2MiOpfqFMmxW6PIa/7cMpkIIsI28aKvDiaDi1
         vRnc7jpMctCQRhbqw+WYkd/UGtir6XS8d1AEVpccTUAgCMblTKORpGjJCPrp58H0tQro
         K0NMPgeabTOnsPIgmZW1OEvDa9yhME7S3AmKbjYxFC9RpmL7zjQE7AoWpp/J62rEymtx
         8wqzxeqDF8O2UCHxC56v2BVJ019sQIsUan1KmOEhwtzodurIY5/aN+KKro+aHV02bZ24
         qWHBSkGoGrMREBlZ1cvnLJL4C0FOmSXFHsXYt8pb4ecwsV6duiFdWIw6fyG072xYggFb
         Bjlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784067684; x=1784672484;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :message-id:date:cc:to:from:subject:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vv0t/+7auxcbtGWpvakmJ0ritrqSQFOQmC0jKQCZU2I=;
        b=sY5ZCU8H0mWtI9SmzpjRdmlZYqik90hJkpCdWoCLs4ZOyd4RDcGKOjRBwNxrqMOhfA
         qitlMnTrXVEbvWn0FwohPVFHeNs4BDWKX/pX/1uXuthRaRrfuEqlJd38V9HIEvvz7Lor
         WmBI+BsVpMZOqbVUb7+HpgkMpMrv+DpnrnnU5Fw9yzqKRnZdrHpVxC09mpLqodvs1W69
         05C18rVFgJ0r7pLUiRTBj+LZ3h41ai9mGbH9UozHrK2K1HFooIrQZvfcXbA3YVEz6Nf3
         RR/TtJela2slRlP7YI+yoqzdMwXzZQuKifOHvfY6DVTL6yaWET+cjQRyNtSGRKmbx9Lo
         +VhQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrg5s+pS3fFqvwYa0PxnTBPEvbi6OpC/3LY9wHXVv4c0k/VDUWi8aGjxZoJooYkDXU7Yu7RrWSl@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyR+QLLLSO3p3RuTK6UKrim5EhiL394lk4CHOp7+MrtRmlnnZ2A
	nDj3xb5YrzcdnDQYY7GNIess1WwlI14t0eVg+1xMFuaLaTuF0ZBfAa9Z
X-Gm-Gg: AfdE7clP8gP2oT9NWTXGXXuCYpawEq7mXbqdHWSh5Z10ks3MdE+fBmjp3Ap48Op+p9d
	X9n5VF/sBwMFNN+ai2HXODn8/dfeBh43N2l8Xazx6fHTGUG6rulS/5UkIzmCF3Ufq+/8NSNglAt
	pmbWEQaZmJqNqbZcsvHumHkITC31hx5XS+G+YOMzeSMbBrmKLZpXJRK7EEwEy+Ru4+2diKv0CQy
	lp0NkqhsY7KJvbajAaU8c8ShgfWJ+VLb4khyXMkZ4tNwCvJm4yCKGa+QKAe3EoZap0jOGPR8Qsn
	u67OWDIzgNoUmSNruPtbYScEPeaW5j76yDTNerlgVh5QkHjn+QDAvgrYW4q5HeuECdZaM4Sk7cL
	iSEkJYFQiug9O5rpaycf/TRw867hDY9X8VVCgXTW7HMWjSBhLYH3p8wTUGNejVQrpMPHt9idQVb
	xoHljqWsif6eiIhHqLhct/LfE+D5RfKRHVowLZrkPg9UgEH0LgcCsM6yDR/Qc=
X-Received: by 2002:a05:6a00:b4c:b0:848:6895:b763 with SMTP id
 d2e1a72fcca58-84a6735881cmr262012b3a.40.1784067683556;
        Tue, 14 Jul 2026 15:21:23 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ca5b3643cd6sm10622134a12.26.2026.07.14.15.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 15:21:23 -0700 (PDT)
Subject: [PATCH v2 0/4] mm/hmm: Clarify notifier retry state and scope HMM
 timeouts
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: airlied@gmail.com, akhilesh@ee.iitb.ac.in, akpm@linux-foundation.org,
 corbet@lwn.net, dakr@kernel.org, david@kernel.org, jgg@ziepe.ca,
 kees@kernel.org, leon@kernel.org, liam@infradead.org, lizhi.hou@amd.com,
 ljs@kernel.org, lyude@redhat.com, maarten.lankhorst@linux.intel.com,
 mamin506@gmail.com, mhocko@suse.com, mripard@kernel.org,
 nouveau@lists.freedesktop.org, ogabbay@kernel.org, oleg@redhat.com,
 rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
 skhan@linuxfoundation.org, skinsburskii@gmail.com, surenb@google.com,
 tzimmermann@suse.de, vbabka@kernel.org
Date: Tue, 14 Jul 2026 15:21:21 -0700
Message-ID: <178406760622.1106335.2379450382728057793.stgit@skinsburskii>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TNFPM3C7QE2IYNCE6BAK2H6PAFLEQ4ZB
X-Message-ID-Hash: TNFPM3C7QE2IYNCE6BAK2H6PAFLEQ4ZB
X-MailFrom: skinsburskii@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-rdma@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/TNFPM3C7QE2IYNCE6BAK2H6PAFLEQ4ZB/>
Archived-At: 
 <https://lore.freedesktop.org/178406760622.1106335.2379450382728057793.stgit@skinsburskii/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This small fixup series applies on top of:

  [PATCH v8 0/8] mm/hmm: Add mmap lock-drop support for userfaultfd-backed mappings

The first patch updates the HMM documentation example to make the
mmu_interval_read_retry() state explicit: callers should use the notifier and
notifier_seq stored in the same hmm_range that was passed to
hmm_range_fault_unlocked_timeout().

The remaining patches adjust nouveau, amdxdna, and drm_gpusvm users so the
timeout passed to hmm_range_fault_unlocked_timeout() is treated as a relative
HMM retry budget. These callers no longer keep an absolute deadline around
their outer driver retry loops or pass a computed remaining time into HMM.

This keeps the timeout scoped to HMM's internal mmu-notifier retry handling. If
HMM succeeds and the driver later observes an invalidation through
mmu_interval_read_retry(), the driver retries the operation with a fresh HMM
retry budget.

Changes in v2:
  - Kept the nouveau outer absolute timeout around the
    mmu_interval_read_retry() loop. hmm_range_fault_unlocked_timeout() only
    bounds HMM’s internal retries, while nouveau faults are handled from a GPU
    fault worker, so userspace fatal signals cannot break an endless stream of
    invalidations there.
  - Updated nouveau to use time_after_eq() before calling HMM, so the remaining
    timeout passed to hmm_range_fault_unlocked_timeout() is always positive and
    never 0, which would mean retry indefinitely.
  - Updated the nouveau fixup commit message to explain the worker-thread
    timeout issue and the time_after_eq() boundary behavior.
  - Fixed the amdxdna fixup commit message. It now describes
    aie2_populate_range() correctly instead of carrying stale nouveau prose,
    and notes that command submission still keeps its broader timeout while HMM
    gets a fresh relative retry budget.


---

Stanislav Kinsburskii (4):
      fixup! mm/hmm: add hmm_range_fault_unlocked_timeout() for mmap lock-drop support
      fixup! drm/nouveau: use hmm_range_fault_unlocked_timeout() for SVM faults
      fixup! accel/amdxdna: use hmm_range_fault_unlocked_timeout() for range population
      fixup! drm/gpusvm: use hmm_range_fault_unlocked_timeout() for range faults


 Documentation/mm/hmm.rst              |    5 +++--
 drivers/accel/amdxdna/aie2_ctx.c      |   12 ++++--------
 drivers/gpu/drm/drm_gpusvm.c          |   21 ++++++---------------
 drivers/gpu/drm/nouveau/nouveau_svm.c |   14 ++++++++++----
 4 files changed, 23 insertions(+), 29 deletions(-)

