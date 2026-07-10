Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB8BAC43458
	for <nouveau@archiver.kernel.org>; Fri, 10 Jul 2026 22:12:21 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AB0E110F983;
	Fri, 10 Jul 2026 22:12:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="vrKNqD/R";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A5A1F4707E;
	Fri, 10 Jul 2026 21:57:16 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783720636;
 b=F7o75vUsflvBUXslq5Fsjy1ETzFo3Bs6y2Vt4abvsysL8v9+V6+/jg/VK3Hg5Vqa0JVz8
 Qkp2BAeed65mhiTZFxbmfFghM/QghfoykBvlTqTd8BPywrkyb6Qrs48d5LxRFOIlTvRjB3g
 r6TU3DykBcpRspTMQgUcJD+Ne9IedonwJm/R6HlMMlwW32zlXH4UjqDJ4UApT+nbsXWu9Gk
 cokavhUq1awVeBWiza3IXkOIFeBpO0N4tFZKvCQLJxjVj2QkG+OKd4ieuVm6VaMaF/aKGLi
 SrQkW2gNDmL6FZ1Wgr/y6Rsg2EF2iaguQm5UjG/mnDpeJlZTyE+bh5YfYfLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783720636; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=vZPCZ7vPd1NuY/NOvoRK1wg4DzJ9OfLHTV03rmwvPpc=;
 b=bubqS2Na3UM2neDQ4d/aigfgGEsGGSLsht7fEdXMxhBa6MsADFyEPpXAu1Gn/o4Ppk8ti
 dTGR0RpqDU2PWST8dAa3HNbOO5tljvpRuh2bIvtCFUZeOFQtBuAYFcdI0Tlet2m3uEjpXUJ
 9W122eprspF7blhfRK2FwxDQBHdgRlPbOh1y5RzV0Y8+S0GpH0fearnUDjqevBBKeUZfAv/
 z/GCAU3vxL8kiG3AZLMtvXJYVmKZJuT0gxM8c1ej5xgvdyKhkTQybUPuzEThjJrERVKOEqh
 sol6YJS9j4rMvcuiGg4YdsqEdG5fg5Yl5E/822YjZ7IE+1B4I/DV4L+jFWPw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=linux-foundation.org;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=linux-foundation.org;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id CC60747078
	for <nouveau@lists.freedesktop.org>; Fri, 10 Jul 2026 21:57:13 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AD5EA10F968;
	Fri, 10 Jul 2026 22:12:18 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 15A9C41A63;
	Fri, 10 Jul 2026 22:12:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C384A1F00A3E;
	Fri, 10 Jul 2026 22:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1783721538;
	bh=vZPCZ7vPd1NuY/NOvoRK1wg4DzJ9OfLHTV03rmwvPpc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=vrKNqD/RSYZafjQOwVndW01m5aLwswfnuVAfqI5wWJJiUGxMunb7KBRBbR+vIavWm
	 Jwjm7GTEqUP54kAGt2vK1og8+S0X4K5USi4sGzpjMkFtbq+y8rgsLvuLfwWeKzYqds
	 EILDdi2jW5IYL94/XhZxUobGPOo9gvao6LZmzPYg=
Date: Fri, 10 Jul 2026 15:12:16 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>
Subject: Re: [PATCH v8 4/8] mshv: Use hmm_range_fault_unlocked_timeout() for
 region faults
Message-Id: <20260710151216.0397a6f9ac5c7b4ccd274cc1@linux-foundation.org>
In-Reply-To: <178371881034.900500.5214601525971121683.stgit@skinsburskii>
References: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
	<178371881034.900500.5214601525971121683.stgit@skinsburskii>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: Z5GD2BC32Q34SYMYZSLXP4K5CSTRAOBV
X-Message-ID-Hash: Z5GD2BC32Q34SYMYZSLXP4K5CSTRAOBV
X-MailFrom: akpm@linux-foundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: akhilesh@ee.iitb.ac.in, corbet@lwn.net, dakr@kernel.org, david@kernel.org,
 decui@microsoft.com, haiyangz@microsoft.com, jgg@ziepe.ca, kees@kernel.org,
 kys@microsoft.com, leon@kernel.org, liam@infradead.org, lizhi.hou@amd.com,
 ljs@kernel.org, longli@microsoft.com, maarten.lankhorst@linux.intel.com,
 mamin506@gmail.com, mhocko@suse.com, mripard@kernel.org,
 nouveau@lists.freedesktop.org, ogabbay@kernel.org, oleg@redhat.com,
 rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
 skhan@linuxfoundation.org, surenb@google.com, vbabka@kernel.org,
 wei.liu@kernel.org, dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-rdma@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/Z5GD2BC32Q34SYMYZSLXP4K5CSTRAOBV/>
Archived-At: 
 <https://lore.freedesktop.org/20260710151216.0397a6f9ac5c7b4ccd274cc1@linux-foundation.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, 10 Jul 2026 14:26:50 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:

> MSHV currently faults movable memory regions by taking mmap_read_lock()
> around hmm_range_fault(). That prevents the fault path from handling VMAs
> whose fault handlers need to drop mmap_lock, such as userfaultfd-backed
> mappings.
> 
> Use hmm_range_fault_unlocked_timeout() instead. Passing a timeout of 0
> preserves MSHV's existing unbounded retry behavior while letting the HMM
> helper own mmap_lock acquisition and refresh range->notifier_seq internally
> before walking the range. After the fault succeeds, MSHV still takes
> mreg_mutex and checks mmu_interval_read_retry() before installing the pages
> into the region, so the existing invalidation synchronization is preserved.
> 
> Fold the small fault-and-lock helper into mshv_region_range_fault(), since
> the remaining retry path is just the standard "fault, take the driver lock,
> check the interval notifier sequence" pattern.
> 
> ...
>
> @@ -452,13 +412,19 @@ static int mshv_region_range_fault(struct mshv_mem_region *region,
>  	range.start = region->start_uaddr + page_offset * HV_HYP_PAGE_SIZE;
>  	range.end = range.start + page_count * HV_HYP_PAGE_SIZE;
>  
> -	do {
> -		ret = mshv_region_hmm_fault_and_lock(region, &range);
> -	} while (ret == -EBUSY);
> -
> +again:
> +	ret = hmm_range_fault_unlocked_timeout(&range, 0);
>  	if (ret)
>  		goto out;
>  
> +	mutex_lock(&region->mreg_mutex);
> +
> +	if (mmu_interval_read_retry(range.notifier, range.notifier_seq)) {
> +		mutex_unlock(&region->mreg_mutex);
> +		cond_resched();
> +		goto again;
> +	}
> +

If the calling process has realtime scheduling policy and either a)
we're uniprocessor or b) this process and the holder of
interval_sub->invalidate_seq are both pinned to the same CPU then
cond_resched() won't do anything, and this might be an infinite loop?
