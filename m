Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16340C531FC
	for <nouveau@archiver.kernel.org>; Fri, 24 Jul 2026 19:48:31 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B832010E0B8;
	Fri, 24 Jul 2026 19:48:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MvOC8ODP";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D1E01473AD;
	Fri, 24 Jul 2026 19:32:53 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784921573;
 b=eTBNCDJkoOaoHxM86iEv+TzLM8hC/wL7UcIO5N0CZ1zdSwsYmyP+9loHEfFmhmjCMMeTK
 RKq4duZMkgcEyLjBKqI3L1bp3J2itu3AIu/Hg+WXO5H45Eyj5USCIvrqVBV9aIQ5wtEVOuD
 QdLEhXvjMWSS+UEN++iRnZ0MLUjnK7nW0LifiqoAV63+xf5xtzHZS6AkYmDS0IpFnmB51+L
 zQyZMmLbWv26VuTwgx60nj+Hn608r6EtvBSEZfXJRrkW+Nx+MhWD+Y6ZB/h5xVQAxn3uxxK
 +nFqogu32aVnsqF+Is7+qVaPoW5T3GnRFRPCdh6RO1mtLjVmhW+4M0kdJUmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784921573; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Ioc+vYD1TGm3PkR61xqfpxrMbvRpPmr2378lUazgynQ=;
 b=rI4Qm6UbIYisxGcw2ZaNBoLj4IMd/VFuqbyPJEllaH72Ppul6vHOfgZRSqBTYGqm6MclP
 ORGLU3/Y+1UvXvGj2Oe0XYTUIHLGIapz+gtoVu10vyu+L783iFxb2F29/Hg7UpOlaFlkr/W
 9DByrXIkzgstyTXvLuR/ytbsMsy/jgxJhulj3NOh5B+keJLlcYS4wMtv8+sRGn/L9U7ej/0
 0pAqKDQB5Lj3PKZzDrPO2eA21y8MjE9IUQuuV8GDaQQsDZbxv3dk8kSqrZAiAmyKt0LoKsg
 wOD9kNLY9tX4PuqslnIclMkkx5tu9qu8uDYLS6rS0mFy1EsAPvnEDxTNwYnw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 2419F4732F
	for <nouveau@lists.freedesktop.org>; Fri, 24 Jul 2026 19:32:51 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B07AF10E0A2
	for <nouveau@lists.freedesktop.org>; Fri, 24 Jul 2026 19:48:26 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-38759bcd877so614558a91.2
        for <nouveau@lists.freedesktop.org>;
 Fri, 24 Jul 2026 12:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784922506; x=1785527306;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ioc+vYD1TGm3PkR61xqfpxrMbvRpPmr2378lUazgynQ=;
        b=MvOC8ODPdv3lughusDWqx10uwUd9yvCZYS60D8fQyhiWI4KHoNa+AFT2hFqXx1X9FZ
         P5/MGFff30HB2vdxaCGiOdTLY4EA9ifxC+v541mwed0XGfJo+g4GXlwUfHMsrxsRfxuE
         WsaODQ3L2SmgQHGEFSj+7GS6HywoEyqQWfhSu8uNvOdhj3P4BjDnMQ9NqHzSuUd92J0X
         2qJEBkhZ9nhpr0kTz29GIcVpUDnSQ8UTFiumWnrmH7ftZvYSe4ul1GGXwRSObrtDNOeA
         neDqZTsiu7nXJsWGN8svOhGHmkP+47NkzOyvKFjjSHdxc7RIacPw5knpYPmmxKSbfHgV
         QjWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784922506; x=1785527306;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ioc+vYD1TGm3PkR61xqfpxrMbvRpPmr2378lUazgynQ=;
        b=gn20iOVaES4lyVRuvUePetDiOK+Y7K83oZfr2iPyKUSEB4Ar2dp+ltLHhPi/XI9gNg
         PL/fdHsd1nmAiMp1EHyDb7R3V8QKDXJkAT6gqIolgf2gSRIm9dpLboXZ9SlnwGxEkJVo
         ub9ElI3X90G2Xi+maFINf39G3A4gLi8RMUr9DogUo7Aa/3Bbd/25fwdIlFDHbopuNTPt
         DTYjE9G64mAczFBnbvo1WWy/qfmDSjCNeGa3kvOcgBI6gA15nxz29I5FtavyYZ/F3Kih
         sdZQ+5sBy1/HHhbR4Kuzbc0V3FhbgPeS3Y0Vl0+8zUY8cg0y59mIhK6kRnhUpaLiRV5/
         TdyQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Robw0G3nsvEZ2EInlrM/+l3TeZGFDXOQmBl0e8IdQJDGom3/ywZUlv9YwcA+sBmnYrvfzlqD47v@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymUw0q1iIGTp5ikvoAPBZSu/XgC6DNHoshJROQFzSIDZ/P1la8
	0RR/RPuFNfxa5DhOB+x5eCBKLM73CypAiYa6AyAJGfRIowlUhlcOvy1w
X-Gm-Gg: AR+sD13KIm2BFAlzPa7QN+AwjVmU5oGHCdwhD9KyUoqTARwdjlUvM33/JwCmkG+n7ce
	C9pggGDuUKN4fMIrekefw0W4lXTIfnAmfImc//SPb0mL3gFYKPy6FQ3F6MohHysB8H0L4t6eqjE
	btnjX+wnZH7vE1mJ65rOIUOV9SdLi43aGy7DLaDg9SZf7L05TBr1mCR86oRO9uJM5N5ISNV1rlO
	c5fonB3fXPSHmdZG3Bic+YyO7ODoOjxru8SEs/e0pjkYdtGloiG//aB1G1hfthjj3xFQE2kw9e0
	VE/evfbUi6SO/VZxBdiCrhSs0jqhcYw8PrwLQz8JC1xvdntM8ub+6T0vwoNAu0PwNcgz0lNX67C
	LrGWdbkpi08LS3kgASmV2vl32McHJs2+XiPLDcjWCuet8pccXgk2UWF+KoZGR/3mvM9E8/ImTye
	bxpXHaYR8WQUFUxddDmFoiSXceWjPKkzjKFyNpE4QLdMae
X-Received: by 2002:a17:90b:3904:b0:38e:584f:2515 with SMTP id
 98e67ed59e1d1-38ec6aae88emr8486005a91.37.1784922506003;
        Fri, 24 Jul 2026 12:48:26 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38f0417599csm2037544a91.9.2026.07.24.12.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 12:48:25 -0700 (PDT)
Date: Fri, 24 Jul 2026 12:48:22 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Subject: Re: [PATCH v11 1/8] mm/hmm: move page fault handling out of walk
 callbacks
Message-ID: <amPBhhqIbdUQdlPf@skinsburskii>
References: <20260723-hmm-v10-v11-0-c55b003a4b61@gmail.com>
 <20260723-hmm-v10-v11-1-c55b003a4b61@gmail.com>
 <7655eaad-dcbf-4275-93f6-1f92ffedfa76@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7655eaad-dcbf-4275-93f6-1f92ffedfa76@kernel.org>
Message-ID-Hash: TJRFC5RQOM3LUVSBTAHI5PPGNEHZSJFZ
X-Message-ID-Hash: TJRFC5RQOM3LUVSBTAHI5PPGNEHZSJFZ
X-MailFrom: skinsburskii@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/TJRFC5RQOM3LUVSBTAHI5PPGNEHZSJFZ/>
Archived-At: <https://lore.freedesktop.org/amPBhhqIbdUQdlPf@skinsburskii/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, Jul 24, 2026 at 09:00:24PM +0200, David Hildenbrand (Arm) wrote:
> On 7/23/26 19:36, Stanislav Kinsburskii wrote:
> > hmm_range_fault() currently triggers page faults from inside the page-table
> > walk callbacks: hmm_vma_walk_pmd(), hmm_vma_walk_pud(),
> > hmm_vma_walk_hugetlb_entry() and the pte-level helper all call
> > hmm_vma_fault(), which in turn calls handle_mm_fault() while the walker
> > still holds nested locks.  The pte spinlock is dropped explicitly by each
> > caller, and the hugetlb path manually drops and retakes
> > hugetlb_vma_lock_read around the fault to dodge a deadlock against the walk
> > framework's unconditional unlock.
> > 
> > This layering does not extend cleanly to fault handlers that may release
> > mmap_lock (VM_FAULT_RETRY, VM_FAULT_COMPLETED). If the lock is dropped
> > while walk_page_range() is mid-traversal, the VMA can be freed before the
> > walk framework's matching hugetlb_vma_unlock_read(), turning that unlock
> > into a use-after-free.
> > 
> > Split the responsibilities the way get_user_pages() does. Walk callbacks
> > become inspect-only: when they detect a range that needs to be faulted in,
> > they record it in struct hmm_vma_walk and return a private sentinel
> > (HMM_FAULT_PENDING). The outer loop in hmm_range_fault() then drops out of
> > walk_page_range(), invokes a new helper hmm_do_fault() that calls
> > handle_mm_fault() with only mmap_lock held, and restarts the walk so the
> > now-present entries are collected into hmm_pfns.
> > 
> > No functional change for existing callers. As a side effect the hugetlb
> > callback no longer needs the hugetlb_vma_{un}lock_read dance, and every
> > fault-path exit from the callbacks now releases the pte spinlock on a
> > single, common path. This refactor is also a precursor for adding an
> > unlockable variant of hmm_range_fault() in a follow-up patch.
> > 
> > Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> > Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
> > ---
> 
> Any reason my RB got dropped?
> 
> https://lore.kernel.org/all/0b9be5b3-93aa-407f-b83d-409bec4b55e1@kernel.org/
> 

No reason, just an omission on my side.

Andrew, could you add David's RB to this patch, please?

Thanks,
Stanislav

> -- 
> Cheers,
> 
> David
