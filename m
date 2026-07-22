Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91723C4453C
	for <nouveau@archiver.kernel.org>; Wed, 22 Jul 2026 18:52:47 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DE12110EE80;
	Wed, 22 Jul 2026 18:52:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gCYoa8gH";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 845B647307;
	Wed, 22 Jul 2026 18:37:14 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784745434;
 b=U+8IpNXmcUQyW9QJL5AbHC/rHX4lFB86ucXVwyIxA+0W+MT/r38Tgo6BT9Wmc2xLYE05T
 u9dzIUHtaTVwgHPYllg/tz7CKip+MGm3w32GofCAfUYa5ZXvpYYSTcV1qU2OGseZ5fyGoby
 rs0Venpau6oRye2w7r5HL5eIMe7nMe+nWOrNYD+A6b3plMqADGuS3nzPciV3og+Gysv98Kp
 anATBQAuCkz+FNyHiLz9N4O+03o1X6IfR1GBb76um/yyZBqEivBuUWSwk7vx7QmXmersavV
 n/7C0XfzUYglhMCrbfVfbQpvmS2cq2Zr4HAxV1eA/2KjBdGyfh96eAh1NWdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784745434; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Uym772qkEh9LOk/iL6aKk1xWDH0j1Tlr0rPbsmQanS4=;
 b=xXVIrNtYrAk2dI6PSDzIIpRO5X1P6Tp5EQCeSM11/5+FKnCnlO0t378hWVihf5d6S4Jgk
 EIVyvK2Ge9789B+HVU94YPDAtbmXPzyR2SsFY8y8Ig2YWUDFLYcV+6Ax0gFXJUY6bQr9Va/
 R8xL3ZdYQN0UccbbH1S1l4dTM9wGPyiuwoUQoqKH9Is3qGk1834jWPXG7EdR2wDqSIArNN8
 ylZgzwgwONP1qfn3kRU1xjXFmRLTVBKXJHNFYDRPkflynBghyAckvvPmoeCjaIhuz1k09e7
 s5NLsZ4DBDlKPHb9XZJkg+C9r/IE/a2SOavc1qxfY4RBW9ZyUpbE8VHDvhdg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 37A4F47304
	for <nouveau@lists.freedesktop.org>; Wed, 22 Jul 2026 18:37:11 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5B03010EE7B
	for <nouveau@lists.freedesktop.org>; Wed, 22 Jul 2026 18:52:42 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-2ca64c3ce5fso147336275ad.3
        for <nouveau@lists.freedesktop.org>;
 Wed, 22 Jul 2026 11:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784746362; x=1785351162;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Uym772qkEh9LOk/iL6aKk1xWDH0j1Tlr0rPbsmQanS4=;
        b=gCYoa8gHD1X8/BL1iIeCacjQVpJSpz4ZmWnoIvX6Y4m/OODxwJwDcPD1Q8ZO8KbRYq
         dn0mKMq8oPGYE5dAK3pbJ4N59Rrw0l6zhJQue8kvbwcniLGSy25XKCEdMa33AGcSDi6H
         JZMyDWejwMqlzgwnnl00tzof+1TM4kI1kQ+TD0HPLZPD/Up3FzF5ToEPzZr7Is9aiCEV
         VmXTA4N6uR+XyH2ThiyIAKxy/US3GXSTRLJGtc6IGy6LFKZ2//4bxnDlxMDlUtCLpp5l
         nw4lfZDwxjGEuv2JDhqvN5+sfiQm09eKP8fWj6UrpCCNoaQpAswErT+7GrVBt5pHGr6i
         z0HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784746362; x=1785351162;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uym772qkEh9LOk/iL6aKk1xWDH0j1Tlr0rPbsmQanS4=;
        b=K5dwll5JXqySjXT866g0emt4kkxTfJ0T2r7RY6a2P6SMVENXSMscSaIendwDeekvfa
         rlXUA7t+nQZuxCPZN586K1ptunHwwu6qa9cxPgg5g2i7jXc1kKunyj4VO4Ar0xySS/VZ
         /dpImwpMxxYUaO2NZ2WiOdD9Tf9d1s5TlxACRWsnFW2t6b96VU4dmANh9HlIz5vTSaJb
         nQRAQtalKAU2su7sCseodaR+I+IXJ2R+gzXdbcsAUsTOoex4hFXRVJ4NtnmKXqTSwAX1
         z3/O9ecjzSZqb+rn6CLDytsLG+iKNaM0wh7Xo1lDFFUx0p0LbSOGw/yR14zxYMmhRBzU
         XfVQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoMOBh+GcerB10ijZsreDDtujeR+n5N53KqoexqRyrATaiwxW5YMmCofT47uYzg9Ni19b9Nw6mK@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyblnbELT37w5V8/j2f1D5dz036MEkkGiPDxGCOW1UYWv6CcWlw
	lrdZBWW6m+9OSuhDcjkx8boQq4q/acnLL2w2QoxYvnBZvNT6JRZhi/6q
X-Gm-Gg: AR+sD13IG75wqBH9RB/LhtfpPaRTOaockFA/BbRsbV6mz5DgQCO/jHIxLOe2oe5KWjy
	mMbQ8g1tCXBQajyCeV2RifXnBgVZnpSthyqjgWI7ZON/zIUek8C4EdmDORXwRKpgcX6l6XGeBUf
	rfzLjk3cweaIbH1/DvihQaDWqveiarnJOz5DKr+00SvA5SnUWnpTeV2e2BvCJiPFGO0HQzqiccH
	m4vFJXWCIyiRk/ZglsMA0cT9/2kEb/Cj+G0qpQGoTrOPYFXmGGp4P8vBzYKMWjOKYKWc7L9BWe4
	cU3xRFrX7PopODncD5sJG7Y/AD3A9X+uQkTWNPm5qJrd+p9wr7C3TKqML00MnyB66l0LLN61ucR
	7dwFAbizxDB0qK+7WKnvMGCFir+XaDIgjKuh58F6/dG4RApfNRSJcyLUX2WZYWJuoo6Y+RcfNVI
	kQFSL9q92FPBlPrRfaCYMKwPvyl06+tpEYj5JstYUH6q5paCVnH27wbtI=
X-Received: by 2002:a17:902:da8b:b0:2cc:7e4a:bcc5 with SMTP id
 d9443c01a7336-2cfa71aa7demr1018275ad.32.1784746361700;
        Wed, 22 Jul 2026 11:52:41 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cf8efde5cfsm19378335ad.31.2026.07.22.11.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 11:52:41 -0700 (PDT)
Date: Wed, 22 Jul 2026 11:52:38 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v9 8/8] drm/gpusvm: Use
 hmm_range_fault_unlocked_timeout() for range faults
Message-ID: <amERdq2X5l5vHfJo@skinsburskii>
References: <178413903133.1155966.3904063656020521607.stgit@skinsburskii>
 <178413941236.1155966.14485211391150425997.stgit@skinsburskii>
 <al7CGPdJGM+asOFK@gsse-cloud1.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <al7CGPdJGM+asOFK@gsse-cloud1.jf.intel.com>
Message-ID-Hash: HC3TWNGQK7RVQ4UVKTI52G5LJ2YZ33EO
X-Message-ID-Hash: HC3TWNGQK7RVQ4UVKTI52G5LJ2YZ33EO
X-MailFrom: skinsburskii@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: akhilesh@ee.iitb.ac.in, akpm@linux-foundation.org, corbet@lwn.net,
 dakr@kernel.org, david@kernel.org, decui@microsoft.com,
 haiyangz@microsoft.com, jgg@ziepe.ca, kees@kernel.org, kys@microsoft.com,
 leon@kernel.org, liam@infradead.org, lizhi.hou@amd.com, ljs@kernel.org,
 longli@microsoft.com, maarten.lankhorst@linux.intel.com, mamin506@gmail.com,
 mhocko@suse.com, mripard@kernel.org, nouveau@lists.freedesktop.org,
 ogabbay@kernel.org, oleg@redhat.com, rppt@kernel.org, shuah@kernel.org,
 simona@ffwll.ch, skhan@linuxfoundation.org, surenb@google.com,
 vbabka@kernel.org, wei.liu@kernel.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-rdma@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HC3TWNGQK7RVQ4UVKTI52G5LJ2YZ33EO/>
Archived-At: <https://lore.freedesktop.org/amERdq2X5l5vHfJo@skinsburskii/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon, Jul 20, 2026 at 05:49:28PM -0700, Matthew Brost wrote:
> On Wed, Jul 15, 2026 at 11:16:52AM -0700, Stanislav Kinsburskii wrote:
> > Several GPU SVM paths take mmap_read_lock() only to call hmm_range_fault()
> > and open-code mmu interval sequence setup before each HMM walk. They also
> > retry -EBUSY until HMM_RANGE_DEFAULT_TIMEOUT expires.
> > 
> > Use hmm_range_fault_unlocked_timeout() for those faults. The HMM helper now
> > owns mmap_lock acquisition and refreshes range->notifier_seq for its
> > internal retries, while GPU SVM keeps its existing driver-lock validation
> > with mmu_interval_read_retry() after a successful fault.
> > 
> > Pass HMM_RANGE_DEFAULT_TIMEOUT as the helper retry budget for each HMM
> > fault attempt. This scopes the timeout to repeated HMM notifier retries
> > while preserving the outer retry loops that restart when the interval is
> > invalidated before GPU SVM updates or consumes the mapping state.
> > 
> 
> This part doesn't seem right for get_pages(), see below.
> 
> > Leave drm_gpusvm_check_pages() on hmm_range_fault() because that path is
> > called with the mmap lock already held by its caller.
> > 
> > Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> > Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
> > ---
> >  drivers/gpu/drm/drm_gpusvm.c |   61 +++++-------------------------------------
> >  1 file changed, 7 insertions(+), 54 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> > index 958cb605aedd..de5bbfe58ee9 100644
> > --- a/drivers/gpu/drm/drm_gpusvm.c
> > +++ b/drivers/gpu/drm/drm_gpusvm.c
> > @@ -773,8 +773,7 @@ enum drm_gpusvm_scan_result drm_gpusvm_scan_mm(struct drm_gpusvm_range *range,
> >  		.end = end,
> >  		.dev_private_owner = dev_private_owner,
> >  	};
> > -	unsigned long timeout =
> > -		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> > +	unsigned long timeout = msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> >  	enum drm_gpusvm_scan_result state = DRM_GPUSVM_SCAN_UNPOPULATED, new_state;
> >  	unsigned long *pfns;
> >  	unsigned long npages = npages_in_range(start, end);
> > @@ -788,22 +787,7 @@ enum drm_gpusvm_scan_result drm_gpusvm_scan_mm(struct drm_gpusvm_range *range,
> >  	hmm_range.hmm_pfns = pfns;
> >  
> >  retry:
> > -	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
> > -	mmap_read_lock(range->gpusvm->mm);
> > -
> > -	while (true) {
> > -		err = hmm_range_fault(&hmm_range);
> > -		if (err == -EBUSY) {
> > -			if (time_after(jiffies, timeout))
> > -				break;
> > -
> > -			hmm_range.notifier_seq =
> > -				mmu_interval_read_begin(notifier);
> > -			continue;
> > -		}
> > -		break;
> > -	}
> > -	mmap_read_unlock(range->gpusvm->mm);
> > +	err = hmm_range_fault_unlocked_timeout(&hmm_range, timeout);
> >  	if (err)
> >  		goto err_free;
> >  
> > @@ -1406,8 +1390,7 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
> >  		.dev_private_owner = ctx->device_private_page_owner,
> >  	};
> >  	void *zdd;
> > -	unsigned long timeout =
> > -		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> > +	unsigned long timeout = msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> >  	unsigned long i, j;
> >  	unsigned long npages = npages_in_range(pages_start, pages_end);
> >  	unsigned long num_dma_mapped;
> > @@ -1422,9 +1405,6 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
> >  	struct dma_iova_state *state = &svm_pages->state;
> >  
> >  retry:
> > -	if (time_after(jiffies, timeout))
> > -		return -EBUSY;
> > -
> 
> I think that by deleting the code above, you have changed this function's
> semantics by removing the hard cap of HMM_RANGE_DEFAULT_TIMEOUT. This
> code was added because, on some non-production platforms, the timing in
> this function could cause it to livelock.
> 
> Is there any reason this was remove aside from timeout variable not
> being a deadline now? You likely should add the deadline back in.
> 

Indeed, this one can be called from a kernel thread context as well.
I'll revert the change in the next revision.

Thanks,
Stanislav


> Matt
> 
> >  	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
> >  	if (drm_gpusvm_pages_valid_unlocked(gpusvm, svm_pages))
> >  		goto set_seqno;
> > @@ -1439,21 +1419,7 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
> >  	}
> >  
> >  	hmm_range.hmm_pfns = pfns;
> > -	while (true) {
> > -		mmap_read_lock(mm);
> > -		err = hmm_range_fault(&hmm_range);
> > -		mmap_read_unlock(mm);
> > -
> > -		if (err == -EBUSY) {
> > -			if (time_after(jiffies, timeout))
> > -				break;
> > -
> > -			hmm_range.notifier_seq =
> > -				mmu_interval_read_begin(notifier);
> > -			continue;
> > -		}
> > -		break;
> > -	}
> > +	err = hmm_range_fault_unlocked_timeout(&hmm_range, timeout);
> >  	mmput(mm);
> >  	if (err)
> >  		goto err_free;
> > @@ -1720,8 +1686,7 @@ int drm_gpusvm_range_evict(struct drm_gpusvm *gpusvm,
> >  		.end = drm_gpusvm_range_end(range),
> >  		.dev_private_owner = NULL,
> >  	};
> > -	unsigned long timeout =
> > -		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> > +	unsigned long timeout = msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> >  	unsigned long *pfns;
> >  	unsigned long npages = npages_in_range(drm_gpusvm_range_start(range),
> >  					       drm_gpusvm_range_end(range));
> > @@ -1736,24 +1701,12 @@ int drm_gpusvm_range_evict(struct drm_gpusvm *gpusvm,
> >  		return -ENOMEM;
> >  
> >  	hmm_range.hmm_pfns = pfns;
> > -	while (!time_after(jiffies, timeout)) {
> > -		hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
> > -		if (time_after(jiffies, timeout)) {
> > -			err = -ETIME;
> > -			break;
> > -		}
> > -
> > -		mmap_read_lock(mm);
> > -		err = hmm_range_fault(&hmm_range);
> > -		mmap_read_unlock(mm);
> > -		if (err != -EBUSY)
> > -			break;
> > -	}
> > +	err = hmm_range_fault_unlocked_timeout(&hmm_range, timeout);
> >  
> >  	kvfree(pfns);
> >  	mmput(mm);
> >  
> > -	return err;
> > +	return err == -EBUSY ? -ETIME : err;
> >  }
> >  EXPORT_SYMBOL_GPL(drm_gpusvm_range_evict);
> >  
> > 
> > 
