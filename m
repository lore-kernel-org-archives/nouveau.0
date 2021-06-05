Return-Path: <SRS0=r3Qd=LA=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 711A1C47096
	for <nouveau@archiver.kernel.org>; Sun,  6 Jun 2021 17:34:24 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C96D61364
	for <nouveau@archiver.kernel.org>; Sun,  6 Jun 2021 17:34:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C96D61364
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=nouveau-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD28D6E046;
	Sun,  6 Jun 2021 17:34:23 +0000 (UTC)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A11266E466
 for <nouveau@lists.freedesktop.org>; Sat,  5 Jun 2021 04:20:08 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id n12so10061889lft.10
 for <nouveau@lists.freedesktop.org>; Fri, 04 Jun 2021 21:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MHI92OzbTRuOfSGogKDicdkw31a8xsuWOtLJPqvNx58=;
 b=hMgR5HN4yLicvtzTkSenR0cUmaDMZ2bwQfTgqhAeBKkYQcwNCoeTgDZnEobu//usT8
 Ay/dOOX+J6E7bJRr1XvMPGgkoPiBmdX/2xqSg4Vo/W4VrAXO8PjhbgR9yQwpkcG6nlLc
 fbSbfa7bfIC6dmEr9rWwGKtkDi8RmjSZPBvphT0Cy+BprGCLoZauID7MlPnWzO2oeVnj
 W6ncU98HPZzq8jlGTu5Jn0PazLejKzS6xdoK7HomnNLR4CDiAtYCpS9t6mX+ejA6rgCS
 MiqK8pSbDacX5XdtYXY4wYvzqcnyf+9CXm5yqWHtv880W6cgl7d+qF4GLWNLYoWwX9z8
 t2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MHI92OzbTRuOfSGogKDicdkw31a8xsuWOtLJPqvNx58=;
 b=LdrglnQVmtTOTDL3seXA9r9BOgp61tvj+GE8obXpYJTxfVymfCdmNChBNIcVztfJph
 vovzd8UcSIkEhrAC8pRDUhca5SmogIrQGCp8k+Tje3ke7pn42h32qFgUQgBlhn7uSmVN
 b77+cK4/isx0CMibr8RVSmwQKLEZEVMfT0LsbqYGaVwpIaCWzXJzINHUBXtboZxgeKzV
 dqj/5YLaivFlq81zlGdOjzrO/tV8jTEgksZ1FGEU+QL7JYUQQDAhIQutBw8rf79D5+We
 fzTs3en2kwloQld46jcLYJ7Ssa5suGHRC0lvdm8k7KPRC/+Zi8msMninu56TseO5STEj
 bMyw==
X-Gm-Message-State: AOAM532mU5w9WNBfyE7dUAM7hQV5NodocMYngWSUJDEq3UcVRp03KBQY
 P2jG1mpTScOKTZ9x1GLVgfjCWDR2hRBq1kPgRMShwQ==
X-Google-Smtp-Source: ABdhPJzxYihxXg8hJVDo1Cgn/BkB4ckK/wPvPVxczOItEciBDrO1zlGB84+NZGpQvumQ3vq3TiIiFzC4d9tPVTCKElo=
X-Received: by 2002:a19:da12:: with SMTP id r18mr4769335lfg.549.1622866806719; 
 Fri, 04 Jun 2021 21:20:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210524132725.12697-1-apopple@nvidia.com>
 <20210524132725.12697-4-apopple@nvidia.com>
 <20210525183710.fa2m2sbfixnhz7g5@revolver>
 <CALvZod5T1yjOk48Q_efppvP6iQWnSUwdOQL=G9TadrB6nS-s4Q@mail.gmail.com>
 <20210604204934.sbspsmwdqdtmz73d@revolver>
 <CALvZod6myLUu0j13=nn2vCbH7kQJ4yXs06=0+pZYie2ZN13Mxw@mail.gmail.com>
 <20210605033926.pkeq2saomieebrqa@revolver>
In-Reply-To: <20210605033926.pkeq2saomieebrqa@revolver>
From: Shakeel Butt <shakeelb@google.com>
Date: Fri, 4 Jun 2021 21:19:55 -0700
Message-ID: <CALvZod5EWuUu7MfJ12_+QTY2MUinmShoS+0hoRGVcn5Q1G6eHw@mail.gmail.com>
To: Liam Howlett <liam.howlett@oracle.com>
X-Mailman-Approved-At: Sun, 06 Jun 2021 17:34:23 +0000
Subject: Re: [Nouveau] [PATCH v9 03/10] mm/rmap: Split try_to_munlock from
 try_to_unmap
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: "rcampbell@nvidia.com" <rcampbell@nvidia.com>,
 "willy@infradead.org" <willy@infradead.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "bsingharora@gmail.com" <bsingharora@gmail.com>,
 Alistair Popple <apopple@nvidia.com>, "hughd@google.com" <hughd@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "bskeggs@redhat.com" <bskeggs@redhat.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Jun 4, 2021 at 8:39 PM Liam Howlett <liam.howlett@oracle.com> wrote:
>
> > Particularly the following paragraph:
> > ...
> >     Vlastimil Babka points out another race which this patch protects against.
> >      try_to_unmap_one() might reach its mlock_vma_page() TestSetPageMlocked a
> >     moment after munlock_vma_pages_all() did its Phase 1 TestClearPageMlocked:
> >     leaving PageMlocked and unevictable when it should be evictable.  mmap_sem
> >     is ineffective because exit_mmap() does not hold it; page lock ineffective
> >     because __munlock_pagevec() only takes it afterwards, in Phase 2; pte lock
> >     is effective because __munlock_pagevec_fill() takes it to get the page,
> >     after VM_LOCKED was cleared from vm_flags, so visible to try_to_unmap_one.
> > ...
>
> So this is saying the race with exit_mmap() isn't benign after all?
>

Yes, not benign at all.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
