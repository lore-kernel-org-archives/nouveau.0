Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE12EC44501
	for <nouveau@archiver.kernel.org>; Mon, 13 Jul 2026 14:55:10 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E8E0310EA26;
	Mon, 13 Jul 2026 14:55:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="AvSbfpD6";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id DD1D046DC3;
	Mon, 13 Jul 2026 14:39:58 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783953598;
 b=lm3PYidG02QEv48xoHxHXiNueba4YqpHWUHrXvGNlVGmEtE53JNlCW0l/OC9Xtc4EANjn
 g30OdqgUzCsAiWflUv4oXKwczveudHCIOSLPzXivotlRj5MAq2mX8Sb0UY7iLDh3UWSpOTV
 rxwmmKRlLr4e/QmmKQazQAo4kmu/qG2Hx8wFh92KCV/jJdfng+YfZFx8ejiSSnKxwNuBuTJ
 WrqsHE9DmGVDHKCUpFrTBxRodsNeopO/mO2n0IWP4QZDcMyYU0j5WCi3bo84jSHX/P6/R7c
 p+837C0i6LrXGehWZ69RB9M5uWvIXw49xnrF3PuX3f7oN+/4oFr53MWt5mSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783953598; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=IZhqR4JgKFkSLvdz8vThCe3gL1K7igiBUDMCwA8QSjs=;
 b=Pd2idfCIKOrJ5qY8uoVxyQy5Nlsk4YBU9BMEd7e8//nP386umfn52beQ6lZK5nsHjqxEt
 fz8XYbcDBHWP5LOi2FY3ga8jekGTR3RXUtAND9BlNdV3uATIddnBQYcngRYO3o5P7ibfmsv
 f9nVzT9S4YP74GsXPQDqNK5Z8c8u3SscelTC0B/K6UVHTCDPtLayuQJxzUkD/HZ/Wqnulxq
 RnZQktRgrIf6urQSJjismghwh6NhDxbtsqEm0IPK2NAw+Bi0ZsJQWGHtKYH3pWMdC+Hhc7w
 NbKLqHO/aJ/3Xi7LHDtbakdwet7rqjJ42hIUdw5Na7OCtukYLDvTxjbQbV9A==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=ziepe.ca;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=ziepe.ca;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id B521344C61
	for <nouveau@lists.freedesktop.org>; Mon, 13 Jul 2026 14:39:55 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 362B710E5EA
	for <nouveau@lists.freedesktop.org>; Mon, 13 Jul 2026 14:55:06 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-51c21495722so18739591cf.3
        for <nouveau@lists.freedesktop.org>;
 Mon, 13 Jul 2026 07:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783954505; x=1784559305;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IZhqR4JgKFkSLvdz8vThCe3gL1K7igiBUDMCwA8QSjs=;
        b=AvSbfpD6jIRj+KUZKP81+8XL2fltvzoIzPPoHWTNPRnx3RTDeKqLpGVHHvQSgl59z7
         gF4s4Hc6dyP6J0kaBMABJC1CkhNuoojiukKhS0TQiTotnQGDWUPXu+8tp6Sxo5/3M6h0
         Wptj8uTAR9VauxnIqBYvoEvfze4V/7AAJ/Wa7A0sXpne1ebIMaiTFJRL75J4dx2EJjzK
         ojBxeT/vRF9YhC7eEU9EWfOlw7ELhiyQwx0kihZO52BxyU1W8OaVRmKB2Qu9rBEAmYz/
         VjikekBolZhtJ9VB/FE0ZSGoduSto0qn9blOGX8/1aPKIcBO9TmTWzOv0HmHWCcnUVir
         gk9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783954505; x=1784559305;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IZhqR4JgKFkSLvdz8vThCe3gL1K7igiBUDMCwA8QSjs=;
        b=ETgO7tTQ1Ww6dIoZnOx8OdX5Rxw0A1rSMxQTDDnkMNjXt1OivGApFA7E+CMuki4sdv
         O3ucIXCr89oJM9dk6s5+uUt3aKKyrKWUt7kHBfikyuhklFTk0prY4Lg3KceX0ADB1Z+f
         AdYEnhZyxPVzmOH667A/VG0ZgQLlZM/nsNx3f2JmQuX1tcRcjuXYaGKKdfXaTzuIylX4
         D+Bc1VSbHQ4sRBV4T6REB92B6DL22eo7XmCeSlm2QPxW7cP3Cx9Mq4mPkS/DgECeH3y1
         Zi1ZgtAIu+IPE+NeXf5yLoRaQGddxwXAB0mEHWzEcDq/PalfKgw4N7xGg5zCNQlPnhco
         ++HQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoPQgkxTVOmTmabUp//kXcyWZ7paGWbN6mxcK2P60uJgJYJIu5NvOdNx+kDnVpztHqnGbZqijQ5@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytL1RfdvQs5/0u5vFOxvLFr2qMSWV1jXY34Ri7riM7ddkUZ3zh
	5p/s7teiU4chAL3Qs4Sse88n3chgOsNbZuhqo3zIx6b2o3Stl85BBxoA83JdWa22yjk=
X-Gm-Gg: AfdE7cmiB9mFCYnJc628S7GyXwZ81x1EJhMN3dX+MBuNR9IWPJyeSqFp3H/3oOYPYrr
	taE4KI2hFQiUA2VD7YJmnzhBVRiv90RfIs8VXFBqzSgek/oCg5kHU9wD+5QuWC7GYHnaCK/xdrY
	vPRpQjHE1QMfLGkg0xPxnkn8/E/AYijZB10m6KPGFu+qSupCTvB37exePnr7k67XxyfYWkkPmh6
	Jz6SswBzH8mZqwTCdvxPvPclROwCGmG1hEQLSC3HAV8LQzixX1Tg8C/XjuVDo09I3VNG+ptQJwm
	oNalgZX/FG/yQu5c3L+t2BEe9R4eC42B+i0ePJaaKwyehLJj8WqPaG9XOzTbIC84GLbnh7WFFrB
	kMU/B9yVOClPmwKpTqTRqD9jRJkWdY6ISKgJdygVwrYdxWWpclTalgdCi/MFmQ84subu8eKM=
X-Received: by 2002:a05:622a:1911:b0:51c:504:2ef7 with SMTP id
 d75a77b69052e-51cbf305510mr90471451cf.67.1783954504822;
        Mon, 13 Jul 2026 07:55:04 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51caab6d574sm84876451cf.3.2026.07.13.07.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 07:55:04 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjI3j-0000000DQQj-2xH1;
	Mon, 13 Jul 2026 11:55:03 -0300
Date: Mon, 13 Jul 2026 11:55:03 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v8 4/8] mshv: Use hmm_range_fault_unlocked_timeout() for
 region faults
Message-ID: <20260713145503.GC3133966@ziepe.ca>
References: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
 <178371881034.900500.5214601525971121683.stgit@skinsburskii>
 <20260710151216.0397a6f9ac5c7b4ccd274cc1@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710151216.0397a6f9ac5c7b4ccd274cc1@linux-foundation.org>
Message-ID-Hash: JSJNJ6UPEJMGWIWM747OEWMZTRZJXP66
X-Message-ID-Hash: JSJNJ6UPEJMGWIWM747OEWMZTRZJXP66
X-MailFrom: jgg@ziepe.ca
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Stanislav Kinsburskii <skinsburskii@gmail.com>, akhilesh@ee.iitb.ac.in,
 corbet@lwn.net, dakr@kernel.org, david@kernel.org, decui@microsoft.com,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/JSJNJ6UPEJMGWIWM747OEWMZTRZJXP66/>
Archived-At: <https://lore.freedesktop.org/20260713145503.GC3133966@ziepe.ca/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, Jul 10, 2026 at 03:12:16PM -0700, Andrew Morton wrote:
> > +	mutex_lock(&region->mreg_mutex);
> > +
> > +	if (mmu_interval_read_retry(range.notifier, range.notifier_seq)) {
> > +		mutex_unlock(&region->mreg_mutex);
> > +		cond_resched();
> > +		goto again;
> > +	}
> > +
> 
> If the calling process has realtime scheduling policy and either a)
> we're uniprocessor or b) this process and the holder of
> interval_sub->invalidate_seq are both pinned to the same CPU then
> cond_resched() won't do anything, and this might be an infinite loop?

I think hmm and kvm have had this issue for a long time? I don't see
anything in the mmu notifier locking scheme that would alleviate it at
least

So.. In terms of this series I'd leave it, it is no worse than before?

Jason
