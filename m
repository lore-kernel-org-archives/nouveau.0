Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B69C44501
	for <nouveau@archiver.kernel.org>; Fri, 10 Jul 2026 16:44:32 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2585B10EFBA;
	Fri, 10 Jul 2026 16:44:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="bBRztYXn";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9CFCF4702F;
	Fri, 10 Jul 2026 16:29:27 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783700967;
 b=ZVvf1DP99JZxiRivve0P5B7JFkjWqcIQP8WWn4JeSy7vztBwEE/7sRn05/V8urRG4HLh4
 u92ZQaM6pWy0IUPO8cCvA1SQB6ESnUXPJUbDwWwKTi4S2AYCGcQH3v7ZP+7B1Ye7gxgaEvh
 mWChd65q+zXqKr9a7oDMA2Sa4OoxA3i1rzxQP3Ou9MJ5Yn3FpXlzg3rhI/ao9iwZvaEapCh
 E1hNWMUrpQY377Ql6Nibxx6WgvSaw7lhrk+KHsn/CDwoMsMO62ssEZCqu0swzLPZ37BqswG
 FT02D+LOD56Ck2ew/AJmjaMQW8WCojTWg+sAysQk/btzz77vb/0Nzj/wt+1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783700967; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=f7jwDOcuUIXFwEJ3t6jZRtuRC5qCtLyV1KSZwcqARY0=;
 b=OvD0pT8rzibWO7kj5h5YdlUhNC6tGYTj5HstytWCTPUgpx7ywyk6AlGvSvdNq7SNm+800
 KU2gMBI5NdTglkweHzqKvcu7v71w+ed+lXWOWLD76e10CJhOT6divLLeJfI63EImE/BcShQ
 cm1nbjVmP/2Diks510ATqcNrKWNicdA5MUx3veN9OedJirClJCeSC93L/HK8aiV9f4pYNZ3
 4jfuXDve02S8ARO/frjPmN7sVbdKTQWhdOmRwnxDYU4sC9xKh5cYg2b1NvBNxSVZqYYon+e
 utX+0SgIrV+YBbqaNKahWODI0UX3Poh087pkttPwqBOBcc3jEVnEdfWu99FQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=ziepe.ca;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=ziepe.ca;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id EAEDB4022C
	for <nouveau@lists.freedesktop.org>; Fri, 10 Jul 2026 16:29:25 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 53DCB10EB08
	for <nouveau@lists.freedesktop.org>; Fri, 10 Jul 2026 16:44:30 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-51c0c68aa31so7532881cf.3
        for <nouveau@lists.freedesktop.org>;
 Fri, 10 Jul 2026 09:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783701869; x=1784306669;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f7jwDOcuUIXFwEJ3t6jZRtuRC5qCtLyV1KSZwcqARY0=;
        b=bBRztYXnhgZn5YtgZ6yG55WVXbwDbgdpcGrzcFRtc0OZgnzEjXz8ubtQ7gkXODsXKR
         SYnmW2gdO6QQ3REQEo2O2V9Tz82tG8PYIIB58meOw4+67NnywYclnNqn3KRvitHT+BdN
         OUFq/SWZVGx5gdtmeF7stOrJ+Q2/tsaLx2HPey4u75om6eHcnKe0PTXT303zdPmN0SdG
         kpQmVJFmZQ4Nb/C5UWdXBh+QvhB75VzgoQZFxO57HLgqOY/pVIBX0YwmtiG49wnLlyjz
         yznrzd6BxvbI6SJtmALZ4vD8WyyhoGzC4MHBmgwo6tXWTqcSXyyaKUvDNNrniX9zueDF
         6JIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783701869; x=1784306669;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f7jwDOcuUIXFwEJ3t6jZRtuRC5qCtLyV1KSZwcqARY0=;
        b=bvKe3VbTZs/+lvCCrW9UrBSgARmrLGWqyJJFAZ1xOgqHkV/ammvaTuYiHdj/wwYUOv
         niSXkfSxp/D8TX9Z6gSrO8psuwajxRuEDa5KKKGSqCAci6TnkHVpeRa/lYJxHzxsIrpR
         a1/r7kjDLFxzPN+ZGC+BPyr/MOBQeSn7Ll5KCtZmIwWDYhyEjMI4QWnDMNvocAdIG4xD
         WPHODwlICdVXj9kib/jS8nBNyySskk60rTTREDIQcT1nnKJPvoE9iOmSlil2rda0u5pF
         PQGNRyGQQF+JMA/YSLprwYY0piQlSSALn8xqOh5TdZL7HreQW4NRV1lrPZ9QnAnfT36b
         7hVg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqM/13ENSRQuxVJkLBWOW7cRIyh6si4fk//uUd1W16C1FjCrf/jXPxR1ha1iGfO+23fuoWr0SKn@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIAJnYUr4fwGBYh2DBgqgkNYImOV4HOaN8QXm0TM7p/Mvzp1EW
	bT/bcZfEpoud3QPeLZSTDdZIbyBIBkeG29N1pwrKpCf8iMardUtkGKIBg4Kdr8kjGyk=
X-Gm-Gg: AfdE7clmVlj5Cr//ewqPKAFcVpiTAwyGSQYldBmxgM4iOnhI+A8NSPi5+EvdQ3qxc+U
	nTc395KQdtpOnMY7cQSJBRe+qVuJy+r+a8zvU6jcNFl4/McZIAxdmQUF8bGd4VtfrEvuJfxcfNe
	WECZ1zpUw/wxOaGqG0brLA4W5aavwDMvE+elhSbSI81SeVe7901q8adAPso9SOQpxAC+HQQglP8
	ov9PKLUBkezeo78J7ty4h8S22mh5bpJb3pZDD4yhg5JAUNpJmc8tEWjVMVB2OCXnEVOn+gDx3A0
	4kfFS1n1tXOVsRKh5ZKmL4sWmI/7nmawNwtGF3/tu17Cg1f0ZcjMb8m8ZXOTrS4pG+WZOAQzXwh
	jmhxtjTkEu2ihFw6GYJyMcaKmU6KWX7p8UCrLi5DfKU7PDZPtkGiA9dWIXHki
X-Received: by 2002:a05:622a:96:b0:51c:7b12:5ff5 with SMTP id
 d75a77b69052e-51c8b43fec2mr132124531cf.81.1783701869227;
        Fri, 10 Jul 2026 09:44:29 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8ffd56c4b91sm45168766d6.19.2026.07.10.09.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:44:28 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wiEKx-00000007Yxj-3wpY;
	Fri, 10 Jul 2026 13:44:27 -0300
Date: Fri, 10 Jul 2026 13:44:27 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>
Subject: Re: [PATCH v7 8/8] drm/gpusvm: Use
 hmm_range_fault_unlocked_timeout() for range faults
Message-ID: <20260710164427.GW118978@ziepe.ca>
References: <178345345668.660027.2952911919681614557.stgit@skinsburskii>
 <178345366389.660027.12986386801605494596.stgit@skinsburskii>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178345366389.660027.12986386801605494596.stgit@skinsburskii>
Message-ID-Hash: D6ZEJHWYB2ST2EACQOMH6CI6KK7RZ2RH
X-Message-ID-Hash: D6ZEJHWYB2ST2EACQOMH6CI6KK7RZ2RH
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/D6ZEJHWYB2ST2EACQOMH6CI6KK7RZ2RH/>
Archived-At: <https://lore.freedesktop.org/20260710164427.GW118978@ziepe.ca/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, Jul 07, 2026 at 12:47:43PM -0700, Stanislav Kinsburskii wrote:
> Several GPU SVM paths take mmap_read_lock() only to call hmm_range_fault(),
> then retry -EBUSY until HMM_RANGE_DEFAULT_TIMEOUT expires. Those paths use
> MMU interval notifiers whose mm matches the mm that was locked for the HMM
> fault.
> 
> Use hmm_range_fault_unlocked_timeout() for those faults and pass the
> remaining retry budget to HMM. The helper owns mmap_lock acquisition and
> refreshes range->notifier_seq internally for each retry, while GPU SVM
> keeps its existing driver-lock validation with mmu_interval_read_retry()
> after a successful fault.
> 
> Leave drm_gpusvm_check_pages() on hmm_range_fault() because that path is
> called with the mmap lock already held by its caller.
> 
> Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
> ---
>  drivers/gpu/drm/drm_gpusvm.c |   52 ++++++------------------------------------
>  1 file changed, 7 insertions(+), 45 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

> -	mmap_read_unlock(range->gpusvm->mm);
> +	err = hmm_range_fault_unlocked_timeout(&hmm_range,
> +				max_t(long, timeout - jiffies, 1));

Same remark about max_t

Jason
