Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 737CBC4453A
	for <nouveau@archiver.kernel.org>; Wed, 22 Jul 2026 22:48:26 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 98E4510EEBF;
	Wed, 22 Jul 2026 22:48:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ey11rnFQ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E38B647337;
	Wed, 22 Jul 2026 22:32:52 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784759572;
 b=eqi0Z5WRvJnMoERBZ1b6CXSnp3hIWsf5ucR2pGlsZzMOQ1OjzAvD5FQ3TEe5RCC8Tpbkm
 QN+IipMv8jgPG8MpBOda1HQ75gkDOHj4JOu6tLZO9f3aIZP/MrvrK0ND5yjg6IXE008ACvl
 tC6stseyowhwovSv0tYIk3HEt9VeTwH7nu5XqQee72YRFAOkU5PJwLKUpWB/vLsJTnijXkO
 ha5TVMsThGGaqX/RZiCnvxgY5v7F20qn94Les5HC0JL70hztRtcjX7sWPYfNlqcTq8iqOKJ
 zyX9BLsI6ULxBJj45PdQEMvxt4OaomgfwQFkUaCtI0lpO+PjdF19AFwc8leA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784759572; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=PNgL8SYp9VI1NhjQT8Ovt6BfZV4gAJBoTR6QXW/SnYQ=;
 b=hU8dVdeM2XKbMMVns5AI4TNhtqjLe5GnxitDyZWaEV4i1oIeyLLfpy0IAu16otIWEwco7
 G//KpC7V5t9NRnYLFeEf3UnJq1Ch5Zb4FPFTKThL4HosgNTvBuSkRJhrOFjEFLJG1veFZJl
 Oq1bqbfMHGpdF06B2huw1qgt6a4+V+1f+pXNVJjuJkDDDif3KlqDxTKQh6UGbApq1jvZ13C
 ec1wMUftXlEWhNJ/BECMbUr14opmPcF4zssJXogQBxrSqm/Z/54n6m/YXHaWvzupSh1F44w
 Jld7z7qAgE9CKxT4L9KpSgIvcRh/WxQ/+/AeQ6/sUbhWR4m84LV7MIYLFwBQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=linux-foundation.org;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=linux-foundation.org;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 066ED47304
	for <nouveau@lists.freedesktop.org>; Wed, 22 Jul 2026 22:32:49 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C28D210E4F4;
	Wed, 22 Jul 2026 22:48:19 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F298742DC4;
	Wed, 22 Jul 2026 22:48:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2A931F000E9;
	Wed, 22 Jul 2026 22:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1784760498;
	bh=PNgL8SYp9VI1NhjQT8Ovt6BfZV4gAJBoTR6QXW/SnYQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ey11rnFQSaKacaNArWVfr0eeKP+Coih9IwasoSNFGEWkgFxEAp6Gj30weTETOSTMu
	 Kb3glBybuhz+H4qunDZQxS9olJTmLRVgjyXlAi+i+JjF52ZA7V5vh6IJduz1xNJhqy
	 6T2KvTOpUyORKJL9JJtXt564uLU4rprlu8gbdCNE=
Date: Wed, 22 Jul 2026 15:48:17 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>
Subject: Re: [PATCH v10 0/8] mm/hmm: Add mmap lock-drop support for
 userfaultfd-backed mappings
Message-Id: <20260722154817.8c036f2d007edccbd7ab84c7@linux-foundation.org>
In-Reply-To: <20260722-hmm-v10-v1-0-606464dd601a@gmail.com>
References: <20260722-hmm-v10-v1-0-606464dd601a@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TFEKPNVLHJMWMJJSPFYDN5D37DN52PBN
X-Message-ID-Hash: TFEKPNVLHJMWMJJSPFYDN5D37DN52PBN
X-MailFrom: akpm@linux-foundation.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Min Ma <mamin506@gmail.com>, Lizhi Hou <lizhi.hou@amd.com>,
 Oded Gabbay <ogabbay@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-hyperv@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-rdma@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/TFEKPNVLHJMWMJJSPFYDN5D37DN52PBN/>
Archived-At: 
 <https://lore.freedesktop.org/20260722154817.8c036f2d007edccbd7ab84c7@linux-foundation.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, 22 Jul 2026 14:44:22 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:

> This series extends the HMM framework to support userfaultfd-backed memory
> by allowing the mmap read lock to be dropped during hmm_range_fault().

Thanks, I've updated mm.git's mm-unstable branch to this version.

Sashiko pointed at a few things, some pre-existing.  The jiffies race
in [8/8] looks legit.

	https://sashiko.dev/#/patchset/20260722-hmm-v10-v1-0-606464dd601a@gmail.com

> Changes in v10:
>   - Included contended mmap_lock acquisition in the
>     hmm_range_fault_unlocked_timeout() retry budget.
>   - Dropped the redundant top-level fatal_signal_pending() check in the HMM
>     unlocked retry loop; mmap_read_lock_killable() now covers that path.
>   - Restored the absolute outer timeout in drm_gpusvm_get_pages(), since it can
>     run from GPU page-fault workers and must not rely on the worker task’s fatal
>     signal state to stop invalidation retries.

Here's how v10 altered mm.git:


 drivers/gpu/drm/drm_gpusvm.c |   11 +++++++++--
 mm/hmm.c                     |   29 +++++++++++++----------------
 2 files changed, 22 insertions(+), 18 deletions(-)

--- a/drivers/gpu/drm/drm_gpusvm.c~b
+++ a/drivers/gpu/drm/drm_gpusvm.c
@@ -1405,7 +1405,9 @@ int drm_gpusvm_get_pages(struct drm_gpus
 		.dev_private_owner = ctx->device_private_page_owner,
 	};
 	void *zdd;
-	unsigned long timeout = msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	unsigned long timeout =
+		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	unsigned long remaining;
 	unsigned long i, j;
 	unsigned long npages = npages_in_range(pages_start, pages_end);
 	unsigned long num_dma_mapped;
@@ -1420,6 +1422,11 @@ int drm_gpusvm_get_pages(struct drm_gpus
 	struct dma_iova_state *state = &svm_pages->state;
 
 retry:
+	if (time_after_eq(jiffies, timeout))
+		return -EBUSY;
+
+	remaining = timeout - jiffies;
+
 	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
 	if (drm_gpusvm_pages_valid_unlocked(gpusvm, svm_pages))
 		goto set_seqno;
@@ -1434,7 +1441,7 @@ retry:
 	}
 
 	hmm_range.hmm_pfns = pfns;
-	err = hmm_range_fault_unlocked_timeout(&hmm_range, timeout);
+	err = hmm_range_fault_unlocked_timeout(&hmm_range, remaining);
 	mmput(mm);
 	if (err)
 		goto err_free;
--- a/mm/hmm.c~b
+++ a/mm/hmm.c
@@ -790,22 +790,14 @@ int hmm_range_fault_unlocked_timeout(str
 	int ret;
 
 	do {
-		if (fatal_signal_pending(current))
-			return -EINTR;
-
-		if (timeout) {
-			/*
-			 * If the previous fault dropped mmap_lock, then the fault
-			 * handler made progress. Restart the retry timeout in that
-			 * case, but keep the existing deadline for ordinary -EBUSY
-			 * retries.
-			 */
-			if (!locked)
-				deadline = jiffies + timeout;
-
-			if (time_after(jiffies, deadline))
-				return -EBUSY;
-		}
+		/*
+		 * If the previous fault dropped mmap_lock, then the fault
+		 * handler made progress. Restart the retry timeout in that
+		 * case, but keep the existing deadline for ordinary -EBUSY
+		 * retries.
+		 */
+		if (timeout && !locked)
+			deadline = jiffies + timeout;
 
 		range->notifier_seq =
 			mmu_interval_read_begin(range->notifier);
@@ -814,6 +806,11 @@ int hmm_range_fault_unlocked_timeout(str
 		if (ret)
 			return ret;
 
+		if (timeout && time_after(jiffies, deadline)) {
+			mmap_read_unlock(mm);
+			return -EBUSY;
+		}
+
 		locked = true;
 		ret = hmm_range_fault_locked(range, &locked);
 		if (locked)
_

