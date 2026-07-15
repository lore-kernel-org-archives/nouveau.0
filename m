Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9161CC44507
	for <nouveau@archiver.kernel.org>; Wed, 15 Jul 2026 21:17:44 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4F7A910F16F;
	Wed, 15 Jul 2026 21:17:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="lw1aE0Rl";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3C0D446D04;
	Wed, 15 Jul 2026 21:02:28 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784149348;
 b=TEHH3WNPbErEm/+bwJTcLMrukQdLwnvcJ1pykIuxZ3/exxhjL75CTCMpn4B2QyZ41SQJv
 P9mrrEpiKgv03L4QMUCLbwOvs9pV3zOQRr6U9VI9ZjQ7cvYb9fF9CR/MU1vb6Jt9wmOCR+G
 bG1BBRHUSwSDRLX2aehYxVB5Wc4qloq8ZAgkhIWuCxMR/vlcEBAC/uWi61O1gURQZQ/B02m
 5lIcXCPaze6uBqQnfsp5stSpWELvsXzRkc5G84AJmwHCxvQuWTYc2ynNao+2paoQvSt0M5H
 8A35r2iQEVoLkpYVByvvYgoA0WaWIng8un7xNMyyutcDQbleNTiGwZIHw+OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784149348; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=UU+zPW9iRvCJbBM3XKZCH/KKzyu8mkExGEFSmL1gNYg=;
 b=MUNqtOBQMNCCluUiJY5uyhkDjgQyc5Fb24PcADISPfEvD+6rVVFNhsA4f56uGRsR4Kct9
 sLxlTkw0kFa6f3D4K8VgKvaA6wKzhkWvK0ku1Lm4NiVjlFEg+VJArFKV1pugC/EEARUNsAv
 eWSHBpcUYPpd+Fk2/LZMtXaPim6aKoVzr8f3qy3WekLX3V9xNfPtsXsXSqZO0NRBv6zHtnr
 CP8nN8UB84D2jU2BSBIFI8F/aoRinvFu9hwiqV4qJPaTVjWaNjXaxtfu1F85f/zOAcbnTn9
 mugcTtXH7zWngfpO6q3nxdjRviwb0+nLBhKvX8T95RCdoTLm5Drf0gb/5aRA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=linux-foundation.org;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=linux-foundation.org;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 1C6FD46D04
	for <nouveau@lists.freedesktop.org>; Wed, 15 Jul 2026 21:02:24 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 796B310E250;
	Wed, 15 Jul 2026 21:17:39 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 19A494028F;
	Wed, 15 Jul 2026 21:17:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C56601F000E9;
	Wed, 15 Jul 2026 21:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1784150259;
	bh=UU+zPW9iRvCJbBM3XKZCH/KKzyu8mkExGEFSmL1gNYg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=lw1aE0RlWxmrVX1SBFRJgy1UyPRTg4K6nP+DEjnY9dlEAsFMk2L2RNTreb0d+vs/k
	 1gYgzd2yzaN3XobC7uyRdh1AW0rjf0Olb3qRLd+W/Q1HYfJhedn8GiXr9Nt0CNftbb
	 PL/NA8rFtyplykMr0XbJ7OZgExm1aHBfS+hm1Ecw=
Date: Wed, 15 Jul 2026 14:17:37 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>
Subject: Re: [PATCH v9 0/8] mm/hmm: Add mmap lock-drop support for
 userfaultfd-backed mappings
Message-Id: <20260715141737.4097a5c7d74953ffd8ed66c9@linux-foundation.org>
In-Reply-To: <178413903133.1155966.3904063656020521607.stgit@skinsburskii>
References: <178413903133.1155966.3904063656020521607.stgit@skinsburskii>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: F3R4PY2SGHLOICMBKIC3E6XFMRZOUAPL
X-Message-ID-Hash: F3R4PY2SGHLOICMBKIC3E6XFMRZOUAPL
X-MailFrom: akpm@linux-foundation.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: akhilesh@ee.iitb.ac.in, corbet@lwn.net, dakr@kernel.org, david@kernel.org,
 decui@microsoft.com, haiyangz@microsoft.com, jgg@ziepe.ca, kees@kernel.org,
 kys@microsoft.com, leon@kernel.org, liam@infradead.org, lizhi.hou@amd.com,
 ljs@kernel.org, longli@microsoft.com, maarten.lankhorst@linux.intel.com,
 mamin506@gmail.com, mhocko@suse.com, mripard@kernel.org,
 nouveau@lists.freedesktop.org, ogabbay@kernel.org, oleg@redhat.com,
 rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
 skhan@linuxfoundation.org, surenb@google.com, vbabka@kernel.org,
 wei.liu@kernel.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-rdma@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/F3R4PY2SGHLOICMBKIC3E6XFMRZOUAPL/>
Archived-At: 
 <https://lore.freedesktop.org/20260715141737.4097a5c7d74953ffd8ed66c9@linux-foundation.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, 15 Jul 2026 11:15:50 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:

> This series extends the HMM framework to support userfaultfd-backed memory
> by allowing the mmap read lock to be dropped during hmm_range_fault().

Thanks, updated.

> Changes in v9:
> 
>   - Folded the fixups into the full 8-patch series instead of sending a
>     separate fixup series.
>   - Clarified that the HMM timeout bounds repeated HMM/mmu-notifier retry
>     attempts, with the helper refreshing range->notifier_seq internally.
>   - Kept nouveau’s explicit outer deadline because its retry loop runs in a GPU
>     fault worker and cannot rely on fatal signals from the faulting process.
>   - Converted amdxdna, and GPU SVM callers to pass the shole timeout budget to
>     hmm_range_fault_unlocked_timeout().

These are all in your fixups for v8, so the v9 series made no
alteration to mm.git.

