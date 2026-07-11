Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B2A3C43458
	for <nouveau@archiver.kernel.org>; Sat, 11 Jul 2026 03:15:01 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4235810E70E;
	Sat, 11 Jul 2026 03:15:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OstrPz6A";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B431447092;
	Sat, 11 Jul 2026 02:59:55 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783738795;
 b=n9U938t42vyrG05E710JYK1PdORo+oYJlDB7pMlLdekWASG6wNjM1s5NdkZaTqrIEXf/H
 +nf318kJJH8oqpuLj5BALUzfVsMDYfT06zeCdt9+1BVkLnqVizcxJrnIUAUWchzjVMpYng/
 4HQqgmwQxgl6zD8s8CsLzPJZ+uYfuCa3edvBq1+FQS6jgaZgqtCjfSSIuzWnUy2+cndgOjO
 vjQg22gJ4Uf3yK91bkCt0RgpBPgnjKTzEB6GOCaPKc/CpDC/+yYWAd4KdPU+cIP0Wn9SF4b
 bFJt3iO5rfZfdF8UmC5QyroUal5COyUuruAo0SuTlgRzsOenlX5K8UfDvX5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783738795; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=xrd/oJTRX2Uc0zxJ+R9Qjxy6xmTV66E4ZoYglWTlGgs=;
 b=GRc0HE4C+I0atAr+u3o0EmJYj3fzNprb4pV3wl+Y3y9PGpMAN2VdY1IOlc5BdJLjjQkxS
 pcZ/tL9uNGmJkk/IVaqNEyTn4mogONV2khLHgZPYQUzR92tPQz0ik+C7xo6+zOQVn8OsrfN
 LgQdNbZg42rKO+Vub2eXcVslSaFJl4diwS0anjo21GkzqofcuvKdxxCb4Tlx0DgE5qU0dhE
 MON9pQeqvwL1sj9FpAa3UX6RDkGVzuQ+CDRldj6fFK/WyXarBl1kFZvG/TkplmF2I8ozKq8
 ac/v87dMkkBN/bn665YxhaqMdMz0wn9uRMKHC1Jci1vvNpolHyd/QcYXt9AQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 94C8B46BA9
	for <nouveau@lists.freedesktop.org>; Sat, 11 Jul 2026 02:59:52 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E7B1610E707
	for <nouveau@lists.freedesktop.org>; Sat, 11 Jul 2026 03:14:57 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-38125cebfdaso2159750a91.1
        for <nouveau@lists.freedesktop.org>;
 Fri, 10 Jul 2026 20:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783739697; x=1784344497;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xrd/oJTRX2Uc0zxJ+R9Qjxy6xmTV66E4ZoYglWTlGgs=;
        b=OstrPz6AeKvRyr2DhgvuNlfKE2EUzV7MwKQH0Q7iVKOd8dqmwEL8hjVrixOM+CVWyd
         ND9ZqesyhtAWyuONW0zThqM0Iu6O5q1cTy+MP7j/8gNy8WtAXk7juzUxflw+fdAqpCkb
         Y0ZAexnCAi7LVxEwiX8xGA8WDuoh8n95r+v0D8DnAWlaw9Sl5wZN7gWEil1qJs/SXluN
         hZgWlAQLssTiVj51V8FmxETiz4HzGszcelcDYG4kIMeOJXoA7pc5K/oTlqlHl5P1z/iV
         DwW2jtVrLYBVyv6tZQ3FXfnmUR/XxnaiDy5qS+qmRMtoCaXuzDggHwopMSe1UG0KZxDU
         rzXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783739697; x=1784344497;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xrd/oJTRX2Uc0zxJ+R9Qjxy6xmTV66E4ZoYglWTlGgs=;
        b=Sk44hFsM8tFuNiPP9cYJieSTkZh/D+p6cUnQFgAr0Gg5fHq95TCRYnecMrZyrnB9v9
         aA4/c+vpOjx0QSoyq+pqKyEQa5UzqzrulZasxH4ElFa8btpXhIuXjpLQegDAkM9c2eIb
         5l+grWbmGckbD5HhpgBGpLb5VVObz5xFPtgip+lbAPse+DYMlpdXwKP5JxiZFJX8GwPd
         4gdsBqDY6yAa9sXd1pzuzuZRWzGa7ZJ560uwgyu4bQJFpxL5eEy0tifzcTaLb8HYQDK0
         41gYX09PkrkVoN9ohZylaHYqeiQTCtI/2RUGd8O2gVjsoOs3VvXbOQfFAbPV/L7HGngV
         F47Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RogAVnDCwekmhGTSAPmSG0/2aQdBALapVx3kk8VwiybPF0b5NZQwJouwJAQ0+pgrSuRdnGwKlKe@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFn6lEgOv7qSXvW4QxYz0W0YlKGTULrK4PVMjHMKnhnohekYMh
	XvqjZ7SH7/zuImA+DSH3r/RRica8x2rSpSK+wpRz1tGgFc9Eoazx6gOp
X-Gm-Gg: AfdE7clEbIcHXHsoVKxkg8GhuhZmxaZaPmMyAMOeuPofZd8kH5+4fIESPamUWVgZQpr
	8iQQrSc5i2FkavPmTByUxIeizawVixOgif5IfvhuPFIHzgfPamz7Mm5uAA52I0CHfgbG3rDiGac
	B79SuRmmFLA2yW2Dy/uORHsWNPU3++3JmTNjo6W61pe6nSU2NvpbvRzDEGnUW7Sg4RcMZSdMY6z
	d4s7m3ctRpID3lvTBB50G44kw4pNY6xve3uL13YErssq5/EKSfPvNqdnhzeNDiSt1msMwr5FTM2
	5iS3+pJcP2mFLOvLLytP6As5F8uGTQGkV1PMpDYRbQx3q4qBKMWRbdYgnYF6WeSZpzYOnev2lAP
	F/9Qh01lkvRoDc6OO3okpzj2BoT6stDMTb3n3AlnrIjKnNFkWLRptP6XUcE740vO2k02h9AelHW
	wrOt0cvyocOvntUCEyEDoAeqguh+VWzDcqlDC1n/lO+ddIafBay837+LI=
X-Received: by 2002:a17:90b:5688:b0:381:29f2:481b with SMTP id
 98e67ed59e1d1-38dc74cbe73mr1405854a91.11.1783739697430;
        Fri, 10 Jul 2026 20:14:57 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38a55a47286sm3463061a91.10.2026.07.10.20.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 20:14:56 -0700 (PDT)
Date: Fri, 10 Jul 2026 20:14:47 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v8 4/8] mshv: Use hmm_range_fault_unlocked_timeout() for
 region faults
Message-ID: <alG1JwgUK44dCiN4@skinsburskii>
References: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
 <178371881034.900500.5214601525971121683.stgit@skinsburskii>
 <20260710151216.0397a6f9ac5c7b4ccd274cc1@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710151216.0397a6f9ac5c7b4ccd274cc1@linux-foundation.org>
Message-ID-Hash: MAXINPXLCVQLW5YMANDHFZUIISR6PONH
X-Message-ID-Hash: MAXINPXLCVQLW5YMANDHFZUIISR6PONH
X-MailFrom: skinsburskii@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MAXINPXLCVQLW5YMANDHFZUIISR6PONH/>
Archived-At: <https://lore.freedesktop.org/alG1JwgUK44dCiN4@skinsburskii/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, Jul 10, 2026 at 03:12:16PM -0700, Andrew Morton wrote:
> On Fri, 10 Jul 2026 14:26:50 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:
> 
> > MSHV currently faults movable memory regions by taking mmap_read_lock()
> > around hmm_range_fault(). That prevents the fault path from handling VMAs
> > whose fault handlers need to drop mmap_lock, such as userfaultfd-backed
> > mappings.
> > 
> > Use hmm_range_fault_unlocked_timeout() instead. Passing a timeout of 0
> > preserves MSHV's existing unbounded retry behavior while letting the HMM
> > helper own mmap_lock acquisition and refresh range->notifier_seq internally
> > before walking the range. After the fault succeeds, MSHV still takes
> > mreg_mutex and checks mmu_interval_read_retry() before installing the pages
> > into the region, so the existing invalidation synchronization is preserved.
> > 
> > Fold the small fault-and-lock helper into mshv_region_range_fault(), since
> > the remaining retry path is just the standard "fault, take the driver lock,
> > check the interval notifier sequence" pattern.
> > 
> > ...
> >
> > @@ -452,13 +412,19 @@ static int mshv_region_range_fault(struct mshv_mem_region *region,
> >  	range.start = region->start_uaddr + page_offset * HV_HYP_PAGE_SIZE;
> >  	range.end = range.start + page_count * HV_HYP_PAGE_SIZE;
> >  
> > -	do {
> > -		ret = mshv_region_hmm_fault_and_lock(region, &range);
> > -	} while (ret == -EBUSY);
> > -
> > +again:
> > +	ret = hmm_range_fault_unlocked_timeout(&range, 0);
> >  	if (ret)
> >  		goto out;
> >  
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

Yes, looks like it might.
What can be done to prevent this?

Thanks,
Stanislav

