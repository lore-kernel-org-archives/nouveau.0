Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458B7C531D1
	for <nouveau@archiver.kernel.org>; Thu, 23 Jul 2026 22:22:34 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 46DD410F240;
	Thu, 23 Jul 2026 22:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Xv1S2EtA";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6618647389;
	Thu, 23 Jul 2026 22:06:59 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784844419;
 b=GecBG3zMYIotuCINdPTHl0UZldf3ySTg2kFdh/5qU5BgwtD28eDeheDqsWrjgLemZ5TOc
 4pvZMd2fRH9Pg0j90HwJoRmqYK1laL01QUZ3FIwIGHfASRAIgYs7bpt5Izgb6YrelrMtbW4
 bZsn2vxA1XZ7P/J8gKVaGTOqiY5mkbTkNPKPKu6TAz23fDzj746uQtk0u1UabuNn0XMeXlk
 0SFKzX/crP4RrEkgAt5BWp4OATn9XHy4TOcZOVwTlU2HeMTLReCCVqsyI/axCVITdgpS/Wp
 OqO1Fyt6v9fahThSNzDpIzEwUuR3GQEgqdbV71nSWOSXMg6C8sycHjCAQrzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784844419; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=vzwHTZR2iosFUiZOe0Oy97LjUFogfrOTmiFLxNsdVTA=;
 b=moSK/c8IJE7VpWAmCc9chs2cmSPx1eU76OKfrlCdoZQvESPyc4UCltjhiVBW+iwQG3+Bw
 etjN98wMqqSAQEuQUJDbMHyoz9Hv6SWdaCONBogXTyezCpOxd4M3PmvFpVKjhQsFWZ7tqlj
 NzyAlLoEc3W+K9v1/kVzQ0AXpkCX3xvsalzc87T8kAIvgvx3bIeugAF0eCWEnd3N3XK3VCC
 Sb4uxNoi1IwBI+f5kkSsAYO7SvHfNe3AklEFH9lTUDW1I8gKJgfM6qeD8twahiUsJ6XbvDx
 47vC5g4Yvtpa/0dSoa1lkBWZ98IeQcM9ACZGp659nXthU63MUa3/ZUf/CKsQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 2203547357
	for <nouveau@lists.freedesktop.org>; Thu, 23 Jul 2026 22:06:56 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C8CBC10E60A
	for <nouveau@lists.freedesktop.org>; Thu, 23 Jul 2026 22:22:29 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2cfbbdfa60bso4655215ad.3
        for <nouveau@lists.freedesktop.org>;
 Thu, 23 Jul 2026 15:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784845349; x=1785450149;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vzwHTZR2iosFUiZOe0Oy97LjUFogfrOTmiFLxNsdVTA=;
        b=Xv1S2EtAItxm/U3QX7taC38vWgi8Yk0p9CzBNUhc/RoEhLZaVvRVHjAfP91DadYK3y
         ibV0pdj9MLRkSk5YE7YU/dT265UbWZC/y1z5WSrqwbyXKd3lrE0gV1Q6c+I25uLWgZ9C
         QjrHhk4xyuP6Yrmph6PhhRfhLMkbnoaQ3YW0DvtzkAIb57300erbGkBuMn8s9sjpllpk
         /COtYtnc6pdc7rVxmZGQzrVlM3Dk5nsKwERY1GHQgnEoGDUqM6CvTyP06QZMhadsqREC
         Oed7EgtIcRpMTomSANKRNWzT73xaQl4SF+vvZ/T7Gsl4jckB+fKXIM0X+soh75fME/Uz
         I69A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784845349; x=1785450149;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vzwHTZR2iosFUiZOe0Oy97LjUFogfrOTmiFLxNsdVTA=;
        b=ktv46n1HzDH/K1y5DLUoSDJuAheGkGjWp7ZZk4SlYZsts8n6mGr6sPmhu78KKg/eG5
         sVth5fOK4x6mMAD7HMqF/6MtFI9ZuEDwgGlkDL5sF48hmslWmfFz2ALie1yPvpc3TI3e
         pS9riGfCgPgSiW+cB2WTvJIt4DoPuGjV+JxXeqJ1t1Sun65/ZRawX0bkMbaKKN6cXHjV
         o+o/HWAFTTrVJcVmXUtWx05opsUMbVAae6AzCsmswp+0d8DWMeRDZFt3OXRLzqtHBfdE
         ohyEY6Non3VS6DOQUunCvdLC4anWMIP8PibtOurVHUP1qNqba72FB6cmWvB+0IJve86h
         jgSA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoWAlDf72I5kXa0ZIn1lsblF4MKi+jmKjjThUjQ1gS1i29T44CzjUyU0ce17hMzke84M/1Ys+nk@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwoHI5epFX5sM1IW0JsIUZqwaAR6gjWskmuZ9hOCNsuMR7RKWsP
	QUaSKH5BELT7Rso1o3WvvvRjEWDfj24E24B2Cq62HnPbMCiuIG8xSnI+
X-Gm-Gg: AR+sD10xpbA9qqL70shMzFJptv2x/d7haTaFFpNOPN5AS8VWOglT4AD1z4+OMbdhXQs
	s8I1UcMw15e9FbVwywtgYNsGEqi5gRb9tPj+6n9TtRyz7FHx3LXU3lbtbLO/FYJ0YBnWs37Y8th
	nuaRjCGuZh3bq2rH5Ox905rb2svNOE1J7oAGntLUpvjRbYvCgWdmKjZx2bd1TefC8PHusCE6P7c
	H828dwCbJjPFsbiqxeDhEEYvBpXxzlP6dIkQDLsWDrhT75shieoXncGVCnKtKG2FgmKrqz8o6md
	reyBgtpr9xYSshDTSGKQeR0t/HvutCfB+qc8tSleWJAwoMEA3rVv3/g2rkt5+MSQSH0dz/9oVPm
	42GHBF6RSv5H3nXXzKktPT0SxczRwKXge//4xft/oeLR71ZVOMbqSlhoIDXYRO/zcHiTjnlswgL
	8NUUlkn6MNPAMaD6je/T1swiRvAIU10s0KcnrHddCo1KZ8
X-Received: by 2002:a17:903:90f:b0:2cb:2b53:559f with SMTP id
 d9443c01a7336-2cfa6c793d3mr60755125ad.35.1784845349134;
        Thu, 23 Jul 2026 15:22:29 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cf8f38757esm40198575ad.75.2026.07.23.15.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 15:22:28 -0700 (PDT)
Date: Thu, 23 Jul 2026 15:22:25 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v11 0/8] mm/hmm: Add mmap lock-drop support for
 userfaultfd-backed mappings
Message-ID: <amKUIWpMfVS6OFkQ@skinsburskii>
References: <20260723-hmm-v10-v11-0-c55b003a4b61@gmail.com>
 <20260723142242.5d3f87208d47819d873ae458@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723142242.5d3f87208d47819d873ae458@linux-foundation.org>
Message-ID-Hash: ZTCKTAJDLII7U6FOSQJV2W6A5RQ67T76
X-Message-ID-Hash: ZTCKTAJDLII7U6FOSQJV2W6A5RQ67T76
X-MailFrom: skinsburskii@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZTCKTAJDLII7U6FOSQJV2W6A5RQ67T76/>
Archived-At: <https://lore.freedesktop.org/amKUIWpMfVS6OFkQ@skinsburskii/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, Jul 23, 2026 at 02:22:42PM -0700, Andrew Morton wrote:
> On Thu, 23 Jul 2026 10:36:32 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:
> 
> > This series extends the HMM framework to support userfaultfd-backed memory
> > by allowing the mmap read lock to be dropped during hmm_range_fault().
> > 
> 
> Thanks, I've updated mm.git to this version.
> 
> AI review suggests there may be some problems.  Sorry, I don't recall if
> these were considered in previous versions of the patchset:
> 
> 	https://sashiko.dev/#/patchset/20260723-hmm-v10-v11-0-c55b003a4b61@gmail.com
> 

These look like new findings, perhaps from a newer model or review prompt.

I do not think they apply here.

The unlockable path sets FAULT_FLAG_ALLOW_RETRY only when HMM provides a
non-NULL lock state pointer. The legacy hmm_range_fault() path passes NULL
and therefore does not opt in to lock-dropping faults. Fault handlers are not
supposed to return VM_FAULT_RETRY/VM_FAULT_COMPLETED with the mmap lock
dropped unless FAULT_FLAG_ALLOW_RETRY allows that, so the NULL locked state is
not expected to be dereferenced on the legacy path.

For the FAULT_FLAG_TRIED concern, HMM is not trying to emulate GUP's exact
single-address retry loop. If a fault drops mmap_lock, HMM has to restart the
range walk because the VMA/page table state may have changed. Resetting the
timeout on that path is intentional: a lock-dropping fault made progress, and
the timeout is meant to bound mmu-notifier retry churn rather than the time
spent servicing faults.

Also, the newly converted HMM users are not using this path for ordinary
file-backed page-cache population, and process-context callers can still be
interrupted by fatal signals. All the existent kernel thread callers are
capped by a timeout.

So I do not think this requires a code change.

Thanks,
Stanislav


> > 
> > Changes in v11:
> >   - Reject unstable address spaces in hmm_range_fault_unlocked_timeout()
> >     after taking mmap_lock and before walking page tables.
> >   - Compute the remaining HMM timeout budget before the time_after_eq()
> >     check in drm_gpusvm_get_pages() to make sure it can't result in zero
> >     and lead to infinite HMM range faulting loop.
> 
> Here's how v11 altered mm.git:
> 
> 
>  drivers/gpu/drm/drm_gpusvm.c |    4 ++--
>  mm/hmm.c                     |    6 ++++++
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> --- a/drivers/gpu/drm/drm_gpusvm.c~b
> +++ a/drivers/gpu/drm/drm_gpusvm.c
> @@ -1422,11 +1422,11 @@ int drm_gpusvm_get_pages(struct drm_gpus
>  	struct dma_iova_state *state = &svm_pages->state;
>  
>  retry:
> +	remaining = timeout - jiffies;
> +
>  	if (time_after_eq(jiffies, timeout))
>  		return -EBUSY;
>  
> -	remaining = timeout - jiffies;
> -
>  	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
>  	if (drm_gpusvm_pages_valid_unlocked(gpusvm, svm_pages))
>  		goto set_seqno;
> --- a/mm/hmm.c~b
> +++ a/mm/hmm.c
> @@ -17,6 +17,7 @@
>  #include <linux/slab.h>
>  #include <linux/sched.h>
>  #include <linux/mmzone.h>
> +#include <linux/oom.h>
>  #include <linux/pagemap.h>
>  #include <linux/leafops.h>
>  #include <linux/hugetlb.h>
> @@ -806,6 +807,11 @@ int hmm_range_fault_unlocked_timeout(str
>  		if (ret)
>  			return ret;
>  
> +		if (check_stable_address_space(mm)) {
> +			mmap_read_unlock(mm);
> +			return -EFAULT;
> +		}
> +
>  		if (timeout && time_after(jiffies, deadline)) {
>  			mmap_read_unlock(mm);
>  			return -EBUSY;
> _
> 
