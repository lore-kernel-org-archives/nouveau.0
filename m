Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B9BCC44501
	for <nouveau@archiver.kernel.org>; Fri, 10 Jul 2026 16:41:05 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2058810EDB4;
	Fri, 10 Jul 2026 16:41:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="gr3hXuLv";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8E56E47023;
	Fri, 10 Jul 2026 16:26:00 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783700760;
 b=WLiTVvcDreFHIa/rqxe2pY3/nZ0gUDEPZwvvPTHPpHoPAnlg+ul+7vRP5okiaUdLuGw58
 CxZpHsnzcn/9DuyC23hPEC5p30djLtQ3AR1eas9NTlrxSD/EhDMBsbEnj0xqDNnMB7KlYWx
 VXa0X4wKJFsdApFEP+ia8+jfdo0mnWTv8MVRnbNPaPPSzgOGnDHzsTLke2/ht+OO57Upr3V
 A+ezC/64Vov5Qar+88+J7TdSLyzDoZ2m9y4VkuGS7VIxsNFJq3ZWFjilLlPGLc6HCAsoXwa
 jGaHYbKUOybHYKd1oXHHOA32G4t3nn6PoNpfoHEvyzOXymexDgZWWZf2+KiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783700760; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=z7U3THTZDjx6I8tSiQ91l//DDsukKiO5Egsu4KIAjvc=;
 b=TfmfzGAY0xbsYGVOPzajNzoA3yaJ9Nf2NQLyCZIpSSlL6VzOTxCWlNo77iy1RKzrV5wQE
 YEdGYoLOwxT0W1xZnGc9i3yaRnmA++6S7yNe/7GADYbUUE0cZZ5UVTXRAFpK1LZ/ZheRpwg
 HJriApUzfOc138F11iLVSw5qSI95TI+KIvz3kLo81fJEjDMrKom/ZfOVGDTlbKRnNxRiU+k
 kiC7Modk1CjKmhB7zAMXLvA+XSzFSldy2umJAg+qrRykDsJrAjhFkwbH3FU4L1wdD//d58a
 w3tomc2YC7BcPsrL5oL5Bi12czqE7LB65riFp88m6cjvKIA99kT1urwXPV2g==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=ziepe.ca;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=ziepe.ca;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 4A0844022C
	for <nouveau@lists.freedesktop.org>; Fri, 10 Jul 2026 16:25:57 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A43FD10E605
	for <nouveau@lists.freedesktop.org>; Fri, 10 Jul 2026 16:41:01 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-8eeadbc5e21so8909826d6.3
        for <nouveau@lists.freedesktop.org>;
 Fri, 10 Jul 2026 09:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783701660; x=1784306460;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z7U3THTZDjx6I8tSiQ91l//DDsukKiO5Egsu4KIAjvc=;
        b=gr3hXuLvo5TxktPTMlhBYWJ12iZauTvNQ0oDNahGbx20f9DNPGiKzlM4KA2YiEIGOR
         q7dsY7GfXKYSewtIkYcTv8zSCaLVIrFc0vqQnFxMzQlWwuzzpaiUhPYCZW5A/xNOtQYb
         0exmxT926FFYOqR3ESZOYVqBdMtu59WMYelF3X5lzC58AV4unAM2kzB638YbQ8rA0lO1
         fsDmolAthjURcdZuE4r1hZyR9AC4dhvtffr0YO6/etX1Byv5fd1eMIzID0XFPWo/shKs
         DjFwHKlblQ4A2uo0b804uKFR2GRXcDiC4GPu8r3Fw52yNOSoajyVrTK9yk5UlCv2WaGj
         3/7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783701660; x=1784306460;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z7U3THTZDjx6I8tSiQ91l//DDsukKiO5Egsu4KIAjvc=;
        b=azhiDaMtKR8e+/Jnvb2Ywxo8WjwPJxXXLMxPfrOdmfM3zUvVRdZWtmyL9XXF4NPaE/
         k/2ukMMK4Jli+K30zVvWGAXbgnp/BIHXWjM62KbfZXAOHvMgtx6RfiFKYw5DrUl5trgE
         DLl+4NXKz2WZDfg1iq3ROZIqrkbP+NxezXh5gExqs8CzhgytyR2J9Wa45CojRN5zG+CX
         Dgqp3ReS60R05/ectULcbtKZ5WYPYx+x50Psdx6wV/vuUj4B6JgZUucuJAhG6n0ZoEt2
         dctlw8jFI7XlwS5bZk4MV1VIyLoRvULtUEYjmNqCpwkaolTEH7J9DcmWtQKMkPFRn8dr
         oLzg==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro8fOp3Eu2/s0ZHgzDu0FlrSNH8ATcyBc9hKjNobMikBkmq/CNMhVUlhRIEed/14CBQvDBL9Bgf@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6IBL6VoSpcC0sG6sNtslWT8WnKADgoAuPWii4S3eyn+5zVQzG
	9MDLVXeUC/R0a9HxvtiFKeg66l1RK2dYZx6WhX6z39uFUyHz+kvU/X0oh1EfhbTnV+4=
X-Gm-Gg: AfdE7cnqmXiUE9v+Z16TZ+fcvqg8ZMM5hCS66gAGad9cTK/2lm0GdRVCYu4i9uADvKL
	VvUlMxVz+twLT+d3P8XPUIP6NxZ+jgQneb1BvECEmAwfRd/rFX+ns2rJrbUGEBzeel8OCnglcOC
	gT922u48d+Uy31l4ay1XXRfTySML4ARKuTX+Edka9xiy85qD7X1bLFQaRrPkRzGqdjP3MYfvQpT
	OJq8M2V0hMOWlqS+vcwx/gINdROFfiYCf1Tg2HNMvbNrWl5UStyRnANdd1NnBDxtm/kF02rSqql
	KGUyidmpD9gTCHxc5ak75V+lerpixeIXNe9Tq/vBqqvu1u7hmp7zkmZmMDHG2FzTiEUryPUEnGv
	WjZg8UB7oalRv+po0NCrQ84nnW/98J7pxoBpDSfWECHZIsJ9eeZFH4uNMyCtLzT+165suTH4=
X-Received: by 2002:a05:622a:558d:b0:51c:164b:b241 with SMTP id
 d75a77b69052e-51c8b2d5582mr133755821cf.13.1783701660503;
        Fri, 10 Jul 2026 09:41:00 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8ffd50e0347sm45334476d6.2.2026.07.10.09.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:40:59 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wiEHb-00000007Yc5-1TXt;
	Fri, 10 Jul 2026 13:40:59 -0300
Date: Fri, 10 Jul 2026 13:40:59 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>
Subject: Re: [PATCH v7 5/8] drm/nouveau: Use
 hmm_range_fault_unlocked_timeout() for SVM faults
Message-ID: <20260710164059.GT118978@ziepe.ca>
References: <178345345668.660027.2952911919681614557.stgit@skinsburskii>
 <178345364273.660027.15274510603185163961.stgit@skinsburskii>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178345364273.660027.15274510603185163961.stgit@skinsburskii>
Message-ID-Hash: M6LVWIZNQ2WVUVLLFODO5KGMEPXHACUB
X-Message-ID-Hash: M6LVWIZNQ2WVUVLLFODO5KGMEPXHACUB
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/M6LVWIZNQ2WVUVLLFODO5KGMEPXHACUB/>
Archived-At: <https://lore.freedesktop.org/20260710164059.GT118978@ziepe.ca/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, Jul 07, 2026 at 12:47:22PM -0700, Stanislav Kinsburskii wrote:
> nouveau_range_fault() takes mmap_read_lock() only to call
> hmm_range_fault(). It also keeps a single HMM_RANGE_DEFAULT_TIMEOUT
> deadline across both HMM -EBUSY retries and post-fault
> mmu_interval_read_retry() retries.
> 
> Use hmm_range_fault_unlocked_timeout() instead. The HMM helper now owns
> the mmap lock and refreshes range->notifier_seq for its internal retries.
> Nouveau keeps its existing absolute deadline in the outer loop and passes
> the remaining jiffies to the helper for each fault attempt, so retries
> caused by mmu_interval_read_retry() do not reset the overall retry budget.
> 
> Nouveau still validates the interval notifier sequence while holding
> svmm->mutex before programming the GPU mapping.
> 
> Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_svm.c |   11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

> -		range.notifier_seq = mmu_interval_read_begin(range.notifier);
> -		mmap_read_lock(mm);
> -		ret = hmm_range_fault(&range);
> -		mmap_read_unlock(mm);
> -		if (ret) {
> -			if (ret == -EBUSY)
> -				continue;
> +		ret = hmm_range_fault_unlocked_timeout(&range,
> +				       max_t(long, timeout - jiffies, 1UL));

Avoid max_t, 1L should be a signed long.

Though I'm even more concerned about the timeout if drivers are now
wrapping the whole thing in a timeout... That's not sensible at all

Jason
