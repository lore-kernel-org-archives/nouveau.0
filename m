Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36378C44507
	for <nouveau@archiver.kernel.org>; Fri, 10 Jul 2026 16:39:14 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9BBA710EDB4;
	Fri, 10 Jul 2026 16:39:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="eGGjoSW7";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1297247020;
	Fri, 10 Jul 2026 16:24:09 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783700648;
 b=JJWxDPfsVDZb6dLqvGYoT0c4dI/RhQcmpE8BDYw1m5MT1zvCgHfcV+7bXJbMHZJPp5ksd
 0rweLBo9xb+/HdmJYd1uPknn42sV+niK2xtLH8drOXn2J/57LvsinRiaOvwc4eDMVLAdKyi
 wqkIO4xW2zBSxkbuWZWzw150LO/bmWrkHUON52anDNDaCIOwijWEvzw5YJA8wylx2z4Tc7v
 PVi2cs7yU3WMSJaf4H3aB1zuHFJ8Db5TfKc5isT1Itd7ZMmpLs7nirysIps+ly0yxgYbNDv
 8bZOTYFsbyq50CHZy+wjAgKgi7+8XepohXoeU1fjM9+5WQGMfHG+6x+2ho6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783700648; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Pz9Az2A5A+eQsiowkEP3oUH5xkba/HyvmJjmLQ4f6yE=;
 b=oD1D1/byRC9Lygp00BltbNvRUgOtG0Fh+tlitC4Vl6LMLycFj2FsJBZhvgUNcwmMLu5bJ
 skmaLwBNOC0w9WC8yyyIBrTFZ+FoZ3lr16YFNoEM8FzUUnTgf4RZZWhzUVIWFj6UvGcEb5q
 ymQEy5d3lSreJI6l2B9kQCdwgKphrt6PDPREF2MXMguvGSugNckzROgPtlLbn7T3aeNORXN
 AueqWIXj/w/cd6gSc0V3z7E+oh8wtDWE10myFY5pWiHmg+UnfU4ZGWo6en8kEkj6ExIXctd
 CZQjr5SnqjQUDYPRbl7u9xF1y4e/UQ9HdvYez9Vzwl5O6maFzhV2BGvB6K5w==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=ziepe.ca;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=ziepe.ca;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 3C38B4701B
	for <nouveau@lists.freedesktop.org>; Fri, 10 Jul 2026 16:24:06 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 967A910E605
	for <nouveau@lists.freedesktop.org>; Fri, 10 Jul 2026 16:39:10 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-92e67555e24so58195085a.3
        for <nouveau@lists.freedesktop.org>;
 Fri, 10 Jul 2026 09:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783701549; x=1784306349;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pz9Az2A5A+eQsiowkEP3oUH5xkba/HyvmJjmLQ4f6yE=;
        b=eGGjoSW7zvSY0xs/Rl9x+y+OpiKSlzZVxhgn38OmVl9vaaiEDy+oKW3pkOi1Id+2S6
         oLVbtEV/sDqqygb4p3M7RmT2Aqcpot6VbZRcbKfyj2hL8pkb1vcWJJRm2S7AnrQCwjLG
         8faGxXpBueYGWMbj6+cJeZmnwrN/6mEDmhvBVTROmJlmFgyQ5TDAeFPjO5aP/X5xEELB
         dDHcdMlTP7/YzhYiJhguJlkMPUQDJZxdM7AfQP8Tpcc+rXRcV/nZ9J/I5CeCUuF4cx28
         DCfzT9gAGjAOXvVNL5Al6mxRYio+ViGKswdXwCAGj0yudMXfi6YdRXmxuEVUnI7YGtv8
         2myQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783701549; x=1784306349;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pz9Az2A5A+eQsiowkEP3oUH5xkba/HyvmJjmLQ4f6yE=;
        b=DW6bFSYZJ3Mi1KDkdQ8moMlbBqmvDtw6xYic2S/fCtGYxTmbHb4hZ0MXxdzjhQ/L5X
         9R+8VdoxvJuVpbKpPaM1ff7fov8PAEcTtZFspoPe/22o1rwQsb7kR/xXCgYWaRa+PMg0
         IKZYPL+RWusCJJ2JNzVG6uBGqkqZpxNzqGerG32yHCU9dG7KtW0hmFeYouXY3BHRMd1r
         eB+Q1bfVK0TuEbk71olM3Z0PrFKxmVbbCNbMju0flJvCC73zAaiKZAlOcZcE791EPGfb
         5eEaa63c0vDBstq6lPArtE7r7Y8fedzxHZ2p+lNYb5QnrKxwW8vRP3cOfRrFPNG/yVbh
         oDBA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqEBdivQxPYKMKvhrffUycN5MFqtBN9GW6Jr9uItdgIVdU5tU13QCeUmrrJWuJmEoiSFCk+W3T/@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyj+D5IN8cA3ZgP4RFnyzc2ZRE0UCo06ilx6p8GUhMFlTFJisMI
	alrzr8dPKb7/lZds4nReTd45yoOI/Hy7UilSZYHdsmK+6RUukEf134kqTkG5oeI5jaU=
X-Gm-Gg: AfdE7cl/4t5/JGNm3bFRUgen0R++WYZ2m3thBGHXNcZ2+06YTDDs1/Xweg+0jm9HLSh
	kv61apfpJW9xAirf5QMEZ6hIstA24XIGb+cf5r5dspkEtjw+sVVZEpC58ln5LNqMAbp9rcYUe5A
	dDlzdyKwbgLgcAr7sqTmmO6lQIXDPwVPR1/ctAq4XQblnhhEppGEd+7627VuB0ah1VmDEdGJ/9R
	NBSB1qr6cE5fufI3y7qj2OTmL6CFGTP8ASqzfAv3suikLSQba5ZsFJZUgXfoFp9c2FnmQoPCoXK
	uoL660Ha1qUVWT24d7qLTes5RWRrDdIw06NeDqaXpFhnmAYcKDcn6UNdijwfl04eNX3gTdgRrx0
	DxooQF99YpbEwjIDWwIuWoSKsEcjw3N/glJxj7r9WpeliQGLLFQntbqIet4eF
X-Received: by 2002:a05:620a:2842:b0:92e:44eb:1e7a with SMTP id
 af79cd13be357-92ecf5f0e37mr1356630085a.29.1783701549520;
        Fri, 10 Jul 2026 09:39:09 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-92ee5bcb074sm235123285a.21.2026.07.10.09.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:39:08 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wiEFo-00000007YRj-1Qzt;
	Fri, 10 Jul 2026 13:39:08 -0300
Date: Fri, 10 Jul 2026 13:39:08 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>
Subject: Re: [PATCH v7 4/8] mshv: Use hmm_range_fault_unlocked_timeout() for
 region faults
Message-ID: <20260710163908.GS118978@ziepe.ca>
References: <178345345668.660027.2952911919681614557.stgit@skinsburskii>
 <178345363584.660027.14063544694872741718.stgit@skinsburskii>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178345363584.660027.14063544694872741718.stgit@skinsburskii>
Message-ID-Hash: ZOGOKPAZZOSAV67PUN5B2K2X6OCGNYYN
X-Message-ID-Hash: ZOGOKPAZZOSAV67PUN5B2K2X6OCGNYYN
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZOGOKPAZZOSAV67PUN5B2K2X6OCGNYYN/>
Archived-At: <https://lore.freedesktop.org/20260710163908.GS118978@ziepe.ca/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, Jul 07, 2026 at 12:47:15PM -0700, Stanislav Kinsburskii wrote:
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
> Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
> ---
>  drivers/hv/mshv_regions.c |   54 ++++++++-------------------------------------
>  1 file changed, 10 insertions(+), 44 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
