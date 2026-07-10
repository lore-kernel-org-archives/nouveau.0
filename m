Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34852C44506
	for <nouveau@archiver.kernel.org>; Fri, 10 Jul 2026 16:31:44 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B3FDF10F32B;
	Fri, 10 Jul 2026 16:31:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="CSj7DX0h";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2D00547017;
	Fri, 10 Jul 2026 16:16:38 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783700198;
 b=OVt0O0KIJtiQmQZavBfVm09uD31p9epdnTttVShse5YuD0OJpaDHwmfMWwkAc472Dy3l1
 c8L84Xost2hqObOuXYhe5ZUYeTd0rr4TiyYHdTgvsP8K4LiZIZmpmARYelBlNZtPE/PFCcX
 br8N9OPgkGZGOsjccei4FC3sUE2NOF+QHk7cATrdSivI66/EoIuLM75heq++KO57l6A12Md
 latXUIipqT2HPt3B1vYds5o7gT5Kr48y4xOe7LseHe/wK7jmTRpuy25nVbO9c90YEDznYSw
 sx1+ZYokaTtgU2uihdBT2BH0Qozm9YrwRdRNXKQ42kuDRRAKq6rMVMnXJs5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783700198; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ihr9TBqVvOWsgDH+NpkUYsK2K2fCkLkiaNuX2IHUYwY=;
 b=cLQ+JAg8OjaiArJvgSIpjRxKWaqdb5q9tAFbuIcbMxtpkMeLVRcvnl/+AcT3CRYjp54ku
 oZZjtWUlCmjcPSEhSnE+/UBtaKHROM0Jo3CErTy1kjpg9vCiE42UAc+DvMo60fRudRRX95c
 2sb5ogDnwdfVuyIvntxrLg9bSG9D5FftS5hqrsU0EcjgCaaFCHMPHPc6oj+jgxiFFmpLc3v
 C6m7EbWEYzwvYGi/AP7M1eK8N3wHQoOooOJPShdDXs+OkR7HfgITnGHg7trqC/IhvQ7xJ2M
 HD1Zr/9hGF9nCUxWd068I2LfWwzbuiQpj3OjEdIHZcYAsFUntH++aZHjJO1g==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=ziepe.ca;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=ziepe.ca;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id E303A4022C
	for <nouveau@lists.freedesktop.org>; Fri, 10 Jul 2026 16:16:35 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4438910E20D
	for <nouveau@lists.freedesktop.org>; Fri, 10 Jul 2026 16:31:40 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id
 6a1803df08f44-8ee88fce476so11973726d6.0
        for <nouveau@lists.freedesktop.org>;
 Fri, 10 Jul 2026 09:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783701099; x=1784305899;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ihr9TBqVvOWsgDH+NpkUYsK2K2fCkLkiaNuX2IHUYwY=;
        b=CSj7DX0hWeyE/eTX5n7PkKRobWSRqtVerqD6Y5bwmFmB/QbegtCboewFL/+nvRwShE
         2gxTBp8FRuvzK++bDdZhiD6+kJqtkGcdex9/kP0mKJvG7Z0TTjbGJYUZH8eyRzFIQOMK
         ydtV/pG5tuKA3kZSa1mljp+A4NjWT8XRCzOkrkKsZZ6ANDnIiB87ZtUskFohVY9BCF+i
         BXA7Gq6JQTMFjbgsLQTBAn1eiNPqEPPgxFY/xDN2Pen3VT6zH6+uHUA2wqR/KvXz2CA4
         kQKGRC4m3hBZce6+TpesSx3seJvvzALCLeS0UjHj24L44ZYRUpr8TUH+YqNa8CwysqFh
         33kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783701099; x=1784305899;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ihr9TBqVvOWsgDH+NpkUYsK2K2fCkLkiaNuX2IHUYwY=;
        b=RNxig2X/Y9y/nVO7LhX/txN0BcyJ5Lzigz2H7Nj8Q21KMkX+A4CWaNJk77Wna9U783
         rnA9uv4qWfScHOyJ3WFH4d4m03cF2GVt8zjxE+IL/Z4BjZicymBkzn5F9b5AbC4x/Pmy
         DqTWs0xBhsmuRwCx5frx6RZqDrpWBR+RtE3ZdK0V7he+BgjooJsNDXIPrwz+ZuQ1Brqw
         9THyDyz654hzQHn+oM1vSVlGhKJWyQJt/zIv+MHBU+YgOMsn6R2FspnF+Rl4/0k7OEMQ
         6/e7gi1fjtpHlUgZC5FAVPoMgdvujNucP5cWhWGyqSnttG7H55HpYWw0hXXlY0rLA3Dz
         t/4w==
X-Forwarded-Encrypted: i=1;
 AHgh+RqXPush6SkUuOhieXFil9/MtQpyEuVKJ2ZU3Wn1ItuJsc/6tlptUQz8izjigN9JlgmpDyCES0XY@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyvi0h2D8h3UiI3MMXVDG15tra62jgGrQlZS5O46P63RuALcN4W
	omcl2wnvhL976vIU09ShnlKVSYBBMTIQd5vHoMFc3CXAoM8MCXlURvGTWfGCn7B1l84=
X-Gm-Gg: AfdE7cn7vaJVmaRPXt0tDnrjfsyRjh1cFcAfVLAoqFb7qYNTGdjPpXo3NLNMNA7/iBF
	Jl2KRkX9i12m75z8dAnUQZfXqPB0GorvVFrLutuHbBko+gyqB0j/sXBcCCDb/Z5cexH//S6lG9i
	h/j+EE8kX+hg1XX1p0EU7lrSoD87F4Y+XZYhggCFM8bsD4+VF5xeAqRq0svS4t3HdHUxhqjfmWc
	AsALxF+OCrWYcG0PV4e3VukenzlxiOZkpNNhyoj7EiK3TXaheeu125SsQG0RNVPVgmQppG5enoq
	b5WzwVyqJbWH6+rhLRUQKiZ1u6Gue0U3imNlWkPLHowHTOIpwX1A9t5PlgfRBj9rI8hBwm86nKI
	sUZD3Gn16WLUrqXHSGxTzIzYZIVu3EnKLQ7TlULC8wWJ2sBgikzSQA7jeKPCniRxG6ZEEP0U=
X-Received: by 2002:a05:6214:4710:b0:903:12c9:cba6 with SMTP id
 6a1803df08f44-90312c9dcb8mr32500716d6.47.1783701099176;
        Fri, 10 Jul 2026 09:31:39 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8ffd56c4cd1sm44753226d6.16.2026.07.10.09.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:31:38 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wiE8X-00000007Xks-3Vyo;
	Fri, 10 Jul 2026 13:31:37 -0300
Date: Fri, 10 Jul 2026 13:31:37 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>
Subject: Re: [PATCH v7 1/8] mm/hmm: move page fault handling out of walk
 callbacks
Message-ID: <20260710163137.GQ118978@ziepe.ca>
References: <178345345668.660027.2952911919681614557.stgit@skinsburskii>
 <178345361483.660027.16455119612963295072.stgit@skinsburskii>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178345361483.660027.16455119612963295072.stgit@skinsburskii>
Message-ID-Hash: MPN4JY6A6OFDEVG5BNS3R7SJHRZCYAOW
X-Message-ID-Hash: MPN4JY6A6OFDEVG5BNS3R7SJHRZCYAOW
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MPN4JY6A6OFDEVG5BNS3R7SJHRZCYAOW/>
Archived-At: <https://lore.freedesktop.org/20260710163137.GQ118978@ziepe.ca/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, Jul 07, 2026 at 12:46:54PM -0700, Stanislav Kinsburskii wrote:
> hmm_range_fault() currently triggers page faults from inside the page-table
> walk callbacks: hmm_vma_walk_pmd(), hmm_vma_walk_pud(),
> hmm_vma_walk_hugetlb_entry() and the pte-level helper all call
> hmm_vma_fault(), which in turn calls handle_mm_fault() while the walker
> still holds nested locks.  The pte spinlock is dropped explicitly by each
> caller, and the hugetlb path manually drops and retakes
> hugetlb_vma_lock_read around the fault to dodge a deadlock against the walk
> framework's unconditional unlock.
> 
> This layering does not extend cleanly to fault handlers that may release
> mmap_lock (VM_FAULT_RETRY, VM_FAULT_COMPLETED). If the lock is dropped
> while walk_page_range() is mid-traversal, the VMA can be freed before the
> walk framework's matching hugetlb_vma_unlock_read(), turning that unlock
> into a use-after-free.
> 
> Split the responsibilities the way get_user_pages() does. Walk callbacks
> become inspect-only: when they detect a range that needs to be faulted in,
> they record it in struct hmm_vma_walk and return a private sentinel
> (HMM_FAULT_PENDING). The outer loop in hmm_range_fault() then drops out of
> walk_page_range(), invokes a new helper hmm_do_fault() that calls
> handle_mm_fault() with only mmap_lock held, and restarts the walk so the
> now-present entries are collected into hmm_pfns.
> 
> No functional change for existing callers. As a side effect the hugetlb
> callback no longer needs the hugetlb_vma_{un}lock_read dance, and every
> fault-path exit from the callbacks now releases the pte spinlock on a
> single, common path. This refactor is also a precursor for adding an
> unlockable variant of hmm_range_fault() in a follow-up patch.
> 
> Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
> ---
>  mm/hmm.c |  118 +++++++++++++++++++++++++++++++++++++++-----------------------
>  1 file changed, 75 insertions(+), 43 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
