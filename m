Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 240A0C531D1
	for <nouveau@archiver.kernel.org>; Thu, 23 Jul 2026 21:22:49 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CDFE510F205;
	Thu, 23 Jul 2026 21:22:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PqDGtK1y";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 01ABA4737F;
	Thu, 23 Jul 2026 21:07:15 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784840834;
 b=S7P/eDpsckiJdqEa7QtGUsq3+0ye0ROZMFMxibF3hM/9+Wk7eR7icoOuo4hcIQy6aGq6b
 IdP4sK6rcn5Xz6KhVYgj/5iKe2DKFFMvKnhtKFOafOoXAgN7YVxUp28ZON6cOHsPwooOZik
 X9RBt7c8VH89kQ/50XIqUR5qQuerDrG5eCKGrL6V2v0W2EnJ1pPMRe6FRVnfYDLmblGMZCj
 sWbEkOhDOElxpvqsxaICiarfbtnd2Sge3/u6lXjs9JHSeKkctzn8PUTlv5Q6Vowy+ZB9h3H
 zk2HtFTcvStShDf0k9Fj8tPASiQRLdgAlrwyzB8yY3t5cuym2ZyP3depqjnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784840834; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=8LsF46xxakxlsARFJxGTWxEVy+kM0PIVoXm+jBklc8Q=;
 b=ZrFf6qeNGGJsMvigUBV95SHSBzxX6wVRcHEewDsy24v3A+3dqKSURBtoDaVmvPZ4O5+Fl
 MsWJJZzcv8Jq6acOnzC9LbUxqWVHNCJrLYYFC6Pyx4al4lJmdTV90w/VaoghNzwCdL7Zz82
 MhzhJ2RPS5InLSF6Emc/V6qOjzeSB3uicW+Xq8BaolLdDKuSibvrS9anXW7C4IFoqmZRrci
 7m3QK/owYbb7nCOrSFHHZKucLQPYeL9gOW8pB9uMOnsTtuglx8NKFJaEbPdGE4M0UV3yBGh
 v5u5wMYgwzYBTQfEpvhmFxWK5U3bIoI1qSO4s/UAgA6OqKj4QAcRDUTXjK6w==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=linux-foundation.org;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=linux-foundation.org;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id A713E472E8
	for <nouveau@lists.freedesktop.org>; Thu, 23 Jul 2026 21:07:11 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E241C10E602;
	Thu, 23 Jul 2026 21:22:44 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 738B8408E9;
	Thu, 23 Jul 2026 21:22:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31E381F000E9;
	Thu, 23 Jul 2026 21:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1784841764;
	bh=8LsF46xxakxlsARFJxGTWxEVy+kM0PIVoXm+jBklc8Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=PqDGtK1ymZc6iwXzb09CtmFYmLViI3ZUzwC4EZJzeq9zwSf91u2vNh/4wCIJIHPWO
	 e15iO8gkDRLbbRBA2tojf2jKWmot7imPS0HbTnDJI9D1VtypOpQwHATciE7rioefeK
	 s0fKBNhwMPvzspt/Hs40GfWyqW0dMZJpQhg7C0tk=
Date: Thu, 23 Jul 2026 14:22:42 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>
Subject: Re: [PATCH v11 0/8] mm/hmm: Add mmap lock-drop support for
 userfaultfd-backed mappings
Message-Id: <20260723142242.5d3f87208d47819d873ae458@linux-foundation.org>
In-Reply-To: <20260723-hmm-v10-v11-0-c55b003a4b61@gmail.com>
References: <20260723-hmm-v10-v11-0-c55b003a4b61@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 6WDCWJXCJCDYE6ECVWIM6QV445O7KKJM
X-Message-ID-Hash: 6WDCWJXCJCDYE6ECVWIM6QV445O7KKJM
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/6WDCWJXCJCDYE6ECVWIM6QV445O7KKJM/>
Archived-At: 
 <https://lore.freedesktop.org/20260723142242.5d3f87208d47819d873ae458@linux-foundation.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, 23 Jul 2026 10:36:32 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:

> This series extends the HMM framework to support userfaultfd-backed memory
> by allowing the mmap read lock to be dropped during hmm_range_fault().
> 

Thanks, I've updated mm.git to this version.

AI review suggests there may be some problems.  Sorry, I don't recall if
these were considered in previous versions of the patchset:

	https://sashiko.dev/#/patchset/20260723-hmm-v10-v11-0-c55b003a4b61@gmail.com

> 
> Changes in v11:
>   - Reject unstable address spaces in hmm_range_fault_unlocked_timeout()
>     after taking mmap_lock and before walking page tables.
>   - Compute the remaining HMM timeout budget before the time_after_eq()
>     check in drm_gpusvm_get_pages() to make sure it can't result in zero
>     and lead to infinite HMM range faulting loop.

Here's how v11 altered mm.git:


 drivers/gpu/drm/drm_gpusvm.c |    4 ++--
 mm/hmm.c                     |    6 ++++++
 2 files changed, 8 insertions(+), 2 deletions(-)

--- a/drivers/gpu/drm/drm_gpusvm.c~b
+++ a/drivers/gpu/drm/drm_gpusvm.c
@@ -1422,11 +1422,11 @@ int drm_gpusvm_get_pages(struct drm_gpus
 	struct dma_iova_state *state = &svm_pages->state;
 
 retry:
+	remaining = timeout - jiffies;
+
 	if (time_after_eq(jiffies, timeout))
 		return -EBUSY;
 
-	remaining = timeout - jiffies;
-
 	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
 	if (drm_gpusvm_pages_valid_unlocked(gpusvm, svm_pages))
 		goto set_seqno;
--- a/mm/hmm.c~b
+++ a/mm/hmm.c
@@ -17,6 +17,7 @@
 #include <linux/slab.h>
 #include <linux/sched.h>
 #include <linux/mmzone.h>
+#include <linux/oom.h>
 #include <linux/pagemap.h>
 #include <linux/leafops.h>
 #include <linux/hugetlb.h>
@@ -806,6 +807,11 @@ int hmm_range_fault_unlocked_timeout(str
 		if (ret)
 			return ret;
 
+		if (check_stable_address_space(mm)) {
+			mmap_read_unlock(mm);
+			return -EFAULT;
+		}
+
 		if (timeout && time_after(jiffies, deadline)) {
 			mmap_read_unlock(mm);
 			return -EBUSY;
_

