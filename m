Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66532C44506
	for <nouveau@archiver.kernel.org>; Fri, 10 Jul 2026 16:38:42 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3D36C10E931;
	Fri, 10 Jul 2026 16:38:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="drtE5KJZ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A4F304701B;
	Fri, 10 Jul 2026 16:23:37 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783700617;
 b=R3fVwC4jvbGiJ7udRY/buGbG9fXalohycY/xaAE5/4em/BQFpxaWH0BEWx4VcU9UiEtXs
 FQNIwI081+nGBcOUv+8fKksqJisbUP8ueL9HgS/go0Qm7nhhO6vJBfGBUn7I80nXQkl4TFf
 +kviG+AvN3u3H9u+l4ds+dfzaG099/6ZsEk+G2381XfAuKcx/jHQ+/yBDRNJFSYp9NuoQz+
 P/MQkqNlwYUxtqc+MTqthWfVRBmfFhJY4y6dNlNnWX4Uso5MYoou6MWEbOB7l3P8WHepmIP
 ZLDM2lLX8BVvt3W21kUk1RIE3paK09B+uaoqV+szrYuVnaRW6xo9x46B4GAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783700617; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=fjPC+dGtl7NWTD2gQsmUUpevrDX1aRJ0R6Q1EEoKDOI=;
 b=DCt/EDEXz0pAeMy1u1m2iNlEXgwZHei4MJv91hAZ+ct3YYap4sBS69SO/dJHn3hXgOqMV
 yiMIaLE6C4ODqEkS/i7UzWCk2cqmFs5N5tR+xNCOawUV+cTRkYKt/GUZLEC9//xpNDhguar
 lec/fSVtiJZ4xQA4JOSnSl4ifmbHU0eZftGomF/1BHeaLxxNM9liHSkvkNqHczJLB3GZjpY
 o78AAWvj9Hxyy0DNr00qwyhCRclOw6KEflwuEwez1XwySOnzMgRRzKcJjqBFYJ5zgFc7R7x
 yde7rlX3b9uWWxjzoXjtj2JYO4TCboSNI78HS4zsYG7ouihA/fA07dZOvcLQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=ziepe.ca;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=ziepe.ca;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 7C8E746F4F
	for <nouveau@lists.freedesktop.org>; Fri, 10 Jul 2026 16:23:33 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D446A10E20C
	for <nouveau@lists.freedesktop.org>; Fri, 10 Jul 2026 16:38:37 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-8eefd0c5f59so8501486d6.3
        for <nouveau@lists.freedesktop.org>;
 Fri, 10 Jul 2026 09:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783701517; x=1784306317;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fjPC+dGtl7NWTD2gQsmUUpevrDX1aRJ0R6Q1EEoKDOI=;
        b=drtE5KJZAKoPAgnLEPFLCTh/1OyiBq6wmdtLmEQNp3Phc34VlQrLTV+M4bqhG4y1M7
         Q2hgcnBxTX7pd75hc3AAd+VwLUgTLHm7lcZSliA9bs9H0KfxqSgH0m6TP29mOeHSXhrb
         bkOxWHzOujDJlIm/ea/hmVVpgX5jO3YOA7Pt33UD/C0tFEjzZIvnf64olwvcgMaC28DM
         E0A0FMGek//+Ogr0s5Tel5nV3nDcFfnMasqWIj4Owq6VnzUGrzevR7GDCUDUlzMxaaiT
         5V7B1yMB2eymeg7aPqKGYNkNd8/gQ+bQo9GRMniIPQjk8NBiC6CaElgLMrOx/tv3D8fs
         vumg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783701517; x=1784306317;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fjPC+dGtl7NWTD2gQsmUUpevrDX1aRJ0R6Q1EEoKDOI=;
        b=c99cpLLNTSD0DmZiqplykr5UJsROvThRaDp9+IPNYhAVg7I3EIUOWQSNh+Ue6YHuzd
         HdFjdj1ZKUa6bqx9POwCfxo1vZuMyMl9tMRhhd3dHI42xnnsWJ9zSGzKrf9OT6rm+dpD
         yJx7nd6m90CIIgKXqdEhSCeLVAE7tJwuEJTn5c324S2esSCxNcMaMQVyYvb+DVsgp7Ne
         XPnQy5CoyGo2y/7eOorc33wlQx/gX/bWiep6NSWbNe4bqx3Rjb4GWCkbZbTfTjjD/+aI
         3OJ2kjPvJCgWX/S/H4GVWgm1LwDObPwmQ0X05wWEOmg/BZvdaGbKL3ThvFyGNXSIt68M
         DDqA==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro6lx47tXxITJGQrM6jShFtZXFDZU4lbp3y83H5dPTo1XtuvMOoQVl7ErzKEDBfMaWGr5lfV1rA@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzB1/AmYxaPZ+pw7o5ttBH+42I8rpTM12PXIVZX8kmc6d7b8P3e
	gxd8oZ56VW8WBgJ+1c/fJzWkR53EOiIbouOqByxohEgr49yItHoeXgZv30RJNVABl84=
X-Gm-Gg: AfdE7cnLWhfdZHnOv2S0aF07CC9KrcClRFxeSm45s7qL+W+q2rjPa29rSnpm7Bzq2kf
	ElE2W+7RlcOZFOA6Pdac4ZVxn74ecgcW34T6O8AnWjv+aUPEa2OORmvH3HViTI+8+UeUhrzfQKg
	X0Qe6Agd5kUqie8eBxy1CPuCOYrqkzNq3tx0+uXWipYbrO9FCqXYi1SyzBDct2DodOYmm9aSlOA
	XYHpHVuQDe5MYKZ/qt+4B8oZ0C6mU/X1kuqqqE/KmxBCyLOPGsuAvz9cYsy/avUBjtx/XFCpEk0
	8fCxNGA0WWg4GeJfjTo5Uyx0GwACTfwSb8yZDLjklBt4tKMvRN6LfEpv0n34nrdHNbUwT+yaFvj
	UQKvStmE9wz0pRocJXmyafHMbDlSn9hnk+SlAphaKoCtuUIAVWD0bQQZwLAg9
X-Received: by 2002:a05:6214:19e7:b0:8f1:36c7:497c with SMTP id
 6a1803df08f44-8fec217aa9emr148367176d6.33.1783701516760;
        Fri, 10 Jul 2026 09:38:36 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8ffd7c1d8fcsm45350946d6.25.2026.07.10.09.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:38:36 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wiEFH-00000007YQp-17rB;
	Fri, 10 Jul 2026 13:38:35 -0300
Date: Fri, 10 Jul 2026 13:38:35 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>
Subject: Re: [PATCH v7 2/8] mm/hmm: add hmm_range_fault_unlocked_timeout()
 for mmap lock-drop support
Message-ID: <20260710163835.GR118978@ziepe.ca>
References: <178345345668.660027.2952911919681614557.stgit@skinsburskii>
 <178345362182.660027.12809852179204464964.stgit@skinsburskii>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178345362182.660027.12809852179204464964.stgit@skinsburskii>
Message-ID-Hash: M4AEKBODOOWCOGERH6J6BYXCJ6M4JZSB
X-Message-ID-Hash: M4AEKBODOOWCOGERH6J6BYXCJ6M4JZSB
X-MailFrom: jgg@ziepe.ca
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: akhilesh@ee.iitb.ac.in, akpm@linux-foundation.org, corbet@lwn.net,
 dakr@kernel.org, david@kernel.org, decui@microsoft.com,
 haiyangz@microsoft.com, kees@kernel.org, kys@microsoft.com, leon@kernel.org,
 liam@infradead.org, lizhi.hou@amd.com, ljs@kernel.org, longli@microsoft.com,
 maarten.lankhorst@linux.intel.com, mamin506@gmail.com, mhocko@suse.com,
 mripard@kernel.org, nouveau@lists.freedesktop.org, ogabbay@kernel.org,
 oleg@redhat.com, rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
 skhan@linuxfoundation.org, surenb@google.com, vbabka@kernel.org,
 wei.liu@kernel.org, dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-rdma@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/M4AEKBODOOWCOGERH6J6BYXCJ6M4JZSB/>
Archived-At: <https://lore.freedesktop.org/20260710163835.GR118978@ziepe.ca/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, Jul 07, 2026 at 12:47:01PM -0700, Stanislav Kinsburskii wrote:
> hmm_range_fault() requires the caller to hold the mmap read lock for the
> duration of the call. This is incompatible with mappings whose fault
> handler may release the mmap lock, notably userfaultfd-managed regions,
> where handle_mm_fault() can return VM_FAULT_RETRY or VM_FAULT_COMPLETED
> after dropping the lock. Drivers that need to populate device page tables
> for such mappings have no way to do so today.

sashiko could not apply v7 for some reason but the remarks on v6
seemed meaningful, did you see them were they delt with?

https://sashiko.dev/#/patchset/178336023903.504354.7500950448226027718.stgit%40skinsburskii

> diff --git a/Documentation/mm/hmm.rst b/Documentation/mm/hmm.rst
> index 7d61b7a8b65b..70885f153d03 100644
> --- a/Documentation/mm/hmm.rst
> +++ b/Documentation/mm/hmm.rst
> @@ -208,6 +208,69 @@ invalidate() callback. That lock must be held before calling
>  mmu_interval_read_retry() to avoid any race with a concurrent CPU page table
>  update.
>  
> +Dropping the mmap lock during page faults
> +=========================================
> +
> +Some VMAs have fault handlers that need to release the mmap lock while
> +servicing a fault (for example, regions managed by ``userfaultfd``).
> +``hmm_range_fault()`` cannot be used on such mappings because it must hold the
> +mmap lock for the duration of the call. Drivers that need to support them
> +should call::

Given the majority of callers use this API it should probably be the
focus of the documentation and example, regulate the existing API to a
'BTW if you really need the mmap lock, and you really shouldn't, this
exists too'

> @@ -32,6 +32,7 @@
>  
>  struct hmm_vma_walk {
>  	struct hmm_range	*range;
> +	int			*locked;

Let's use bool if you have to respin this

> @@ -651,37 +663,33 @@ static int hmm_do_fault(struct mm_struct *mm,
>  		fault_flags |= FAULT_FLAG_WRITE;
>  	}
>  
> -	for (; addr < end; addr += PAGE_SIZE)
> -		if (handle_mm_fault(vma, addr, fault_flags, NULL) &
> -		    VM_FAULT_ERROR)
> -			return -EFAULT;
> +	for (; addr < end; addr += PAGE_SIZE) {
> +		vm_fault_t ret;
> +
> +		ret = handle_mm_fault(vma, addr, fault_flags, NULL);
> +
> +		if (ret & (VM_FAULT_COMPLETED | VM_FAULT_RETRY)) {
> +			*hmm_vma_walk->locked = 0;
> +			return HMM_FAULT_UNLOCKED;
> +		}
> +
> +		if (ret & VM_FAULT_ERROR) {
> +			int err = vm_fault_to_errno(ret, 0);
> +
> +			if (err)
> +				return err;
> +			BUG();

Linux will be upset if he sees this.  

if (WARN_ON(!err))
   err = -EINVAL

> +/**
> + * hmm_range_fault - try to fault some address in a virtual address range
> + * @range:	argument structure
> + *
> + * Returns 0 on success or one of the following error codes:
> + *
> + * -EINVAL:	Invalid arguments or mm or virtual address is in an invalid vma
> + *		(e.g., device file vma).
> + * -ENOMEM:	Out of memory.
> + * -EPERM:	Invalid permission (e.g., asking for write and range is read
> + *		only).
> + * -EBUSY:	The range has been invalidated and the caller needs to wait for
> + *		the invalidation to finish.
> + * -EFAULT:     A page was requested to be valid and could not be made valid
> + *              ie it has no backing VMA or it is illegal to access
> + *
> + * This is similar to get_user_pages(), except that it can read the page tables
> + * without mutating them (ie causing faults).
> + *
> + * The mmap lock must be held by the caller and will remain held on return.
> + * For a variant that allows the mmap lock to be dropped during faults (e.g.,
> + * for userfaultfd support), see hmm_range_fault_unlocked_timeout().
> + */

Add a comment discourging anyone from using this function and prefer
hmm_range_fault_unlocked_timeout()

Other than the concern about the timeout and minor nits this looks
fine

Jason
