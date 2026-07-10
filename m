Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C142C44506
	for <nouveau@archiver.kernel.org>; Fri, 10 Jul 2026 22:12:28 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E6B2E10F998;
	Fri, 10 Jul 2026 22:12:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="VJe81GYb";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E1A4547082;
	Fri, 10 Jul 2026 21:57:22 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783720642;
 b=RGvI1I0Uc+wdxJ2/X/btu9e7CgcqBMmkhOauwctzXN8y9Mg3xmirxG5q4FuGGvyChz64W
 Gj4q8SgiSw4A/a9R/671TmQaXZkYQeQT5uHIFUBNBZe8ZmzT8bBme+0ziUE6udpkMvQdJND
 X41XNHHfSlI2ANhN/RtVSXKPKTEHda/b/6wNJs1nXTVr8QzcWCg5Cesg9aPeHcVHOHtxn29
 5JYLrvPG10ACEWGTFUVAu/UOTVy+1QSfwQ4Vc8bihaNzOPIRWbjL7hpxhHvQwzdeE8o6t1e
 OvfLFc9xGvBx56gFX6ETJhgqY0RotOfJJQjzJUr852Sy/k26wlbuihDQHhEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783720642; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=2wQB/oFYBFS3GQeSmu/3oRAdk1WgygnNAOd7kwV5jaQ=;
 b=okiV+xoDA6EA/X5dJ31ycK82ddxiVEg721Z4+YoVgtAC+DDOSwvOW3pZGWTzGL+pNoegy
 CRcqga4gFyqBHendInG8t6tkcmKD3BpvNGzKeRYvKdTWwIMjBL8TWnM+8PP2r5pKSlQ1LzV
 Grb9T+DO6TIVvx20CYHoNhxFOwc3Xy/GBedbmezFKqG472HALJCe0IGfUmsTjZDUATnZSpD
 jmiBguKxeM1AQAO5iqw7UQ5kavUsF1XeFMrzUpcViQglIRQmiXwOFAs55zzrZfJOEbjj4Jl
 uHHGyiu+2Zlz8t/LiASC67tMJKUeXCtkJ37DmDU9wxbJ7fYEyr7ugggm9lLQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=linux-foundation.org;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=linux-foundation.org;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 4037B46FDF
	for <nouveau@lists.freedesktop.org>; Fri, 10 Jul 2026 21:57:20 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 15CF610F953;
	Fri, 10 Jul 2026 22:12:25 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 454966111A;
	Fri, 10 Jul 2026 22:12:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D32471F000E9;
	Fri, 10 Jul 2026 22:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1783721544;
	bh=2wQB/oFYBFS3GQeSmu/3oRAdk1WgygnNAOd7kwV5jaQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=VJe81GYbWd6zLU/0Oy3lq6fNYK/xvVwqq20qidN2/oL2icncQaYqK1Fe+uvqBiFrT
	 IBcwSe/+HNIab8r7fGPOpavS+7+qhyYVJipwSJrqT9iWJDM6ku4YDxNdGO4WQA2ORB
	 9VskKFPVtZ6W0Ang1vDmufbj4+l2UBAJGLgWU3LE=
Date: Fri, 10 Jul 2026 15:12:22 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>
Subject: Re: [PATCH v8 5/8] drm/nouveau: Use
 hmm_range_fault_unlocked_timeout() for SVM faults
Message-Id: <20260710151222.ddb35eab9c81a8720491464a@linux-foundation.org>
In-Reply-To: <178371881847.900500.8789369230260725500.stgit@skinsburskii>
References: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
	<178371881847.900500.8789369230260725500.stgit@skinsburskii>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: TE4ZGBZL7IAMLP5OCLO63MI5HDAAAMWX
X-Message-ID-Hash: TE4ZGBZL7IAMLP5OCLO63MI5HDAAAMWX
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/TE4ZGBZL7IAMLP5OCLO63MI5HDAAAMWX/>
Archived-At: 
 <https://lore.freedesktop.org/20260710151222.ddb35eab9c81a8720491464a@linux-foundation.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, 10 Jul 2026 14:26:58 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:

> @@ -683,15 +683,11 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
>  			goto out;
>  		}
>  
> -		range.notifier_seq = mmu_interval_read_begin(range.notifier);
> -		mmap_read_lock(mm);
> -		ret = hmm_range_fault(&range);
> -		mmap_read_unlock(mm);
> -		if (ret) {
> -			if (ret == -EBUSY)
> -				continue;
> +		ret = hmm_range_fault_unlocked_timeout(&range,
> +						       max(timeout - jiffies,
> +							   1L));

"1UL" here?  I'd have expected min() to warn, as it likes to do.
