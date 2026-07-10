Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D5DC44506
	for <nouveau@archiver.kernel.org>; Fri, 10 Jul 2026 18:03:20 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5467B10F392;
	Fri, 10 Jul 2026 18:03:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="HaxJvCJf";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9CD9B47048;
	Fri, 10 Jul 2026 17:48:13 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783705693;
 b=Mqadi2equHCXokwSjh7i3tVeY838G/EC5VQ7+qRpUO/aE4wIW9JExkpjSOHUz+fsbjNGV
 TtlJ3u82uRPSyzFWAV+MGipTi97ohV9DSv2ykcIImLHleQNE8XRteExUDghSFcJD52Edem8
 K7SCOyiaCfiekvqNCozFbDvmc6uHE21eQ0EHy1PvJ5+yFoulEV3PBWiVWIjr+aUEPsPX4Ko
 91S5vYdymsvceFhgqp6FzXk+iJOfIfSVp6iDrl7X+6PjsgA3CSDam6YpWAefy8cF1bur+dA
 GJQIDqTfzUGdFkXC2kpT5VI+6mm5TLCZG3UYwlyJmHwThKjaSXxQkyBeA85w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783705693; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=pchhQjIZYIsHA+IyTP+kMOXOCiYK49mahPv3eolm7bw=;
 b=maRrXRtXmWp3tkIwmTA1Fj1fm0bO2BkKORrH1yu5cZCk6xb39FyL8tEjsoQfHYHvZhIzL
 yBOPnECN3xJY+tnsKC2IUZjzYJplGFk7+cdVBB92oCjHrSfjSIqZ/XIdFQQPOB2xyxKernT
 59tsqoF//QXwmhFOzXgoiJbWbSM60Y7O75GhK4Yehzi/UEJKOUlHCsTcd9bNgG6ye+ZnqnY
 +4WftcBHbTsJQM3eQeW0ZdMrpy6+X5vR2ARDRB/TjeV8vXtR2WZR+htWNtff8ekm8KtWrCE
 bMUXe7/OV8yOrSNdNusAHdCuF7kpSyNHJBdruK39tBFYYcwSdLSSOlkHKN2w==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=ziepe.ca;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=ziepe.ca;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id DA0D146FDF
	for <nouveau@lists.freedesktop.org>; Fri, 10 Jul 2026 17:48:10 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5A5ED10E207
	for <nouveau@lists.freedesktop.org>; Fri, 10 Jul 2026 18:03:15 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-51c2a449c57so7106861cf.1
        for <nouveau@lists.freedesktop.org>;
 Fri, 10 Jul 2026 11:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783706594; x=1784311394;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pchhQjIZYIsHA+IyTP+kMOXOCiYK49mahPv3eolm7bw=;
        b=HaxJvCJfdQjx6HXwsmRuDWFXUXK3N5YVfskFy1aXMr02tVrW3Q+abEdEr0Ro8rG9Ua
         eGu3wUoho5qi9Y1FhZ07RXmSiirCgtrqkoDjh0utvrD72mkhLFqLd1cQNgV/NBtowtJq
         7YgnXLFVJCwrsGQugpBU0Yphr8YJIkisAxmt+nm2n/v83DromwhCKwAQZGZXy4Wg0qQ5
         UeRDuN/LDcRMhItQoxFcXaUI6crFDZAQZLXVTivK39wwc4qxL+ixt4RizBn1HyvzUQxj
         de7GYYiRKREUEBGk/JRplC2dYTmp9dH0brZhwKTj344TkV20PVMP1g6iqfzBO83s4PTy
         XuaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783706594; x=1784311394;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pchhQjIZYIsHA+IyTP+kMOXOCiYK49mahPv3eolm7bw=;
        b=WHNN5IAwWseJt1m0Jtb4Xukekbh6QnN8HSUwCmGzF8W8e4sLi058F/gr/72qlqK6JO
         NiZ7T4lUkzwbeJCtt+vtVJxTpVavpmAFcmpdoTAQpZBXRLDDEHPeoGXmbiVeYPyGmFpJ
         NsTReUcIcaTYNPE1GUxry0IAP22moIzjmBfhtLg0F7iKZbfe8betrxNAPyvqlheu/ukK
         uWcD9dRCaMHlLGuDe60LUsEd9o4gcV0/fcab+dkNeSrBxPVa20JAwcCedZaTHdzI9cIC
         ZLXFU8VjYjLbePUs0VKbEibmMFViiE/QpKboW81iIsCm43zWKiobmebJG6KMSVep0lI3
         gtWw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpdRLYjsa3k06DJnkxUKAoUuc97/vyVB60xt3CJbtFS/XsjlR39d8LuZO733KxJmFWFqrt9akQE@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJwhvB47JZrBQxAhjMyOtwhWe/qDnUVcVkfewc8NzGCHAYPPsS
	HfxsRMnZr7wCXcsY3SzIz0ye4M/KZQyIRTE0Q8RVDl/dVngWeEh0LcmhH3jOkVrvcjA=
X-Gm-Gg: AfdE7clrFnqWQBN7rysbzI/DRREikbjLg2anm8vgy3DTxMxumRTNDDXHh3nvMb9DmD3
	h+8qx/6fRoZffjWZJkwLcHAJ/W4S+CGwUmjS0yxPRBqndEoWpndN/484rqfy13WIPSU/4W4d46/
	nUqgBRd8cjpbrYmTAsZLrnZrSjc3pD9fm8RtgIQ1+rrBxqCb8dwJKTZ5yZt63+j/okraTEHMxP7
	4BTduKYVMrGkk/RouxR/K332Sz44G41M1oJOzYwV78yUyeYtfsafVKAuWxF4F1sLOSPuKd9v4vF
	xcXxY+0gaVND5Rb7JMwlNKcDNYmtP67yjkpC15AOyaC7/vW60HPOaG1/HzzcJRDqbtrLrd5fBfW
	/+1rAlfz0pndsAtsMHPsHJe+Ux0b3Ec0RA29hHuKngOzjsBavBY3Q25BFaXOv
X-Received: by 2002:ac8:7e8c:0:b0:51c:7b13:62fa with SMTP id
 d75a77b69052e-51c8b438c0dmr129494461cf.80.1783706594020;
        Fri, 10 Jul 2026 11:03:14 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8ffd7c1fd2bsm47060696d6.27.2026.07.10.11.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 11:03:13 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wiFZA-00000007fhc-13JV;
	Fri, 10 Jul 2026 15:03:12 -0300
Date: Fri, 10 Jul 2026 15:03:12 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>
Subject: Re: [PATCH v7 2/8] mm/hmm: add hmm_range_fault_unlocked_timeout()
 for mmap lock-drop support
Message-ID: <20260710180312.GD1803712@ziepe.ca>
References: <178345345668.660027.2952911919681614557.stgit@skinsburskii>
 <178345362182.660027.12809852179204464964.stgit@skinsburskii>
 <20260710162749.GP118978@ziepe.ca>
 <20260710164743.GX118978@ziepe.ca>
 <alElv0EKjLQXMNK8@skinsburskii>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alElv0EKjLQXMNK8@skinsburskii>
Message-ID-Hash: JVWZ2MGCWIARLAOEZ4BFYYF3QHHC5GQE
X-Message-ID-Hash: JVWZ2MGCWIARLAOEZ4BFYYF3QHHC5GQE
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/JVWZ2MGCWIARLAOEZ4BFYYF3QHHC5GQE/>
Archived-At: <https://lore.freedesktop.org/20260710180312.GD1803712@ziepe.ca/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, Jul 10, 2026 at 10:02:55AM -0700, Stanislav Kinsburskii wrote:
> The main customer for this new feature I have in mind is the MSHV driver
> which backs VMs memory with HMM, requires userfaultfd support for
> post-copy live migration and fast restore and it doesn't timeout.
> 
> I agree, that this current timeout value used by the other callers might
> not be enough to repopulate the mappings with userfaultfd, but there
> drivers would get -EFAULT for uderfaultfd-backed mappings without this
> change anyway, so getting -EBUSY with the change instead doesn't look
> like a significant change to the behaviour from my POV.

It sounds like it won't be reliable either then.

> > So, maybe the deadline should be resetting after every handled fault?
> > ie the timeout really is only about the mmu notifier and we don't
> > count the time spent handling faults or walking?
>
> The timeout was inherited from existing HMM users rather than introduced
> as a new HMM policy. Some GPU drivers use HMM_RANGE_DEFAULT_TIMEOUT as a
> budget for the whole range population operation, including HMM retries
> and subsequent driver mapping work.

Yes, because we always had a timeout around the notifier because that
scheme can sort of live lock. The timeout was to protect that only, ie
limit the number of notifier retries.

Expanding the timeout to be outside what is bounded by the notifier
retry is not right, and heavy stuff like mapping should be done after
the hmm side succeeds and the notifiers concluded so they can rely on
normal locking instead.

This is why I'm suggesting to reset the deadline as hmm makes forward
progress, we really only want to bound the notifier retry loop not
anything else.

Jason
