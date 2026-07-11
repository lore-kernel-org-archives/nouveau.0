Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A1C3C43458
	for <nouveau@archiver.kernel.org>; Sat, 11 Jul 2026 03:09:26 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E20CC10E6F8;
	Sat, 11 Jul 2026 03:09:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="o/GZOk3a";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 607F04704A;
	Sat, 11 Jul 2026 02:54:20 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783738460;
 b=hTS4HhSQLukMlj6yQkiou9moMLY8/Mth6vDApQkgcsnKlIRnD506CAAFDj20toHHBRl/2
 nUvYJ1B4eN3JdfM1WUO0CmTd1mmIxcpXFcdboR7YgBIdhiXzC+otBYPzgOuDNWIM4vAaNl3
 szJrKHNUmE6PXeYnaro81lkWY6NPvyeHB2fNL3ENmauh304VPCqWFBFB512Q3fnJTK3zE9h
 CRTqVVoF4NoOavF6W2WczfRbJqEVbf7/jYJJFrQ3vI+5FPk6OkXsuO+SC4uLXNvS+RN6rqs
 fm58kmra3X7rLt5Zr4vQqvonQs6CzuzDjAVJlA4GdTku1qSDrMWaQ3urCjwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783738460; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=KBT/pxhbpviyB1eK4ppjTwsrTkYiVk3Lhi/aEEh6q5s=;
 b=znni45Lj4WEp20BvILfGw9S3IotsiuhIrMxWzWayx1mSLqyr8OuxxNax2pgyL8XEesiLw
 zIQcWwp4RuFEGxx6154B9NgNBAhIG80D5waN+6tE7OOXaDWDKacNBr3OjUijrh6qASYzj1V
 hJIDBcYCZeGe7HWj0jd5CVd6FY3eJdd7sZrE2q3gmDbclT1POdjKzkqV9UdNZ7EYw4m2aa2
 ZEiCPSZb2yxVZJHj7+X0AxNJqE/d1lzA3gBV9Tcfz7dcoyGQzPg7Slx6vyRRyqQoEi1TJjj
 S2Gbk9dFQIa8+AKBXTTBo6O5wlk1/KIzPE/VzWCOyTqUBAWO2xz5u6dv/YjA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id D62A246BC7
	for <nouveau@lists.freedesktop.org>; Sat, 11 Jul 2026 02:54:17 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 21CB910E54B
	for <nouveau@lists.freedesktop.org>; Sat, 11 Jul 2026 03:09:23 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-848595b338cso1740598b3a.0
        for <nouveau@lists.freedesktop.org>;
 Fri, 10 Jul 2026 20:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783739362; x=1784344162;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KBT/pxhbpviyB1eK4ppjTwsrTkYiVk3Lhi/aEEh6q5s=;
        b=o/GZOk3aY4ZbdXQMhDJ5o8GibBVP5/Y4qU0MuTHOBmVbvm+lFEVfqReWbdMRdofKbp
         PXXeAPk9Af/Io6nrzhbtzf/Qp0aTDtq/fxiWeHTIpNXTr/01BM4Sl7ncER9v+k1zzice
         bRnzO7MiYeg+YVcQZsV5AtGSsObZ74yY3wi0gziL87zentOEOod26svFWXCpUHGctOIE
         h4bmI7oKJAzVcYoQOvft3/s6y1Q+PE2z3ugi/2yCnvhR5aBkrbSeXXXjwz8rmd9c3dLc
         81eJf6Ip/lGQPJ+gNIjNubQj7IJYg7iVFs1yS2p1DnhCBaEw3X9eIKnGcjRcwWgMd3Jv
         xThQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783739362; x=1784344162;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KBT/pxhbpviyB1eK4ppjTwsrTkYiVk3Lhi/aEEh6q5s=;
        b=gSiMM+sVIdnlw1CQkG2Q9FaG3vwwTfgHyPWApIt30NQadgXuh0WsycsegkXOvoN356
         RZR5cxZKXitL5RxlzbXg0EgJC0BmD8v6E2bW2dKUNBZrcGDu8cS8gdjXvBtWkAizh+Ij
         vGywfBVIeoKmXFk0+ljrf6KE/9EofYiJBKJ4eNYh9+OFbSu4IJS0mjR7MlUpdRPn6dtm
         ZIAOopwSOnUK57NLdUsmWJcZpXBN/gkatzFqEXu+90Laj3bsvI+6lFMBmwkeOKrqHOro
         Dn40Vcq7P4NQi6eFH2skE0yMfOR8Ki9pe0n7f+cVMhuhGhnNVWtEgeUiddp6mDTjgw7i
         xBiQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrru3MbH+kh5ET5vPhMy144vcsbq9nLVd9vvUiR6/Bs49A0PBbCA6aFwckduOzVItaDFmWFEahz@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJ2ebGsN2JGtgPwF3ZWUlwtQvfNN2vIGJt/j4PKJ7D5Xg4ag0Y
	K0orRZxFeTIKMp3ACHHcksPysf/n3D+w9jnIQBZYCXel4oFBOnmnorFu
X-Gm-Gg: AfdE7cn3sHPqwWVH3PBjxO1DJVLop8vFLqYqdRtMA1tGjpThIy6kvVHweqjSWPNRlg/
	57A8Xm/lkCy0CXKwzKHxXwYOjVzvEO98AvFcKBSS8mngg0IFc4NTMyK0ygHRLTw8+a0ZaMflyxz
	/W0FQiV2828+fm4KgE2BrUhXAEyiYxx6pqTU/zUCueQABpXXX1UjDc3yRmGpZeNiJ/GPU0VU34F
	Ao0pcoLo60DHY+QejmmsOGZpch8jOxrrz8/kUL274U2KS1BmQhvqksGd2VoxyOcs+iS88YM8QUA
	9d/gdAstpJxqgi1MfWX7G/6VZ1y/pnAIjfCg7o4I+rZX8Ad91jiW3fHHb0gUw1ArUpAInXwo4e6
	xEIfZWh1CtLV4MOE0/XKhI0UZqFn5guCTeYw4JXVq2OvXNWXqbIv11PYpW8JFeZuHSBv/k4cB+p
	8KfAxf3sD2wMSPMe/217hvEZu6kPDJBSnnANpbDn78p4kFT0D9tgrOlBQ=
X-Received: by 2002:a05:6a00:3404:b0:847:9151:3409 with SMTP id
 d2e1a72fcca58-84889797ad5mr1318139b3a.55.1783739362452;
        Fri, 10 Jul 2026 20:09:22 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6db29d1sm11140358b3a.53.2026.07.10.20.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 20:09:21 -0700 (PDT)
Date: Fri, 10 Jul 2026 20:09:18 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v8 2/8] mm/hmm: add hmm_range_fault_unlocked_timeout()
 for mmap lock-drop support
Message-ID: <alGz3vywc6W5hvso@skinsburskii>
References: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
 <178371879503.900500.7148019929226548795.stgit@skinsburskii>
 <20260710151209.157d7c80b03dc56d73b5884a@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260710151209.157d7c80b03dc56d73b5884a@linux-foundation.org>
Message-ID-Hash: Q3FVBSO3TPKYSLCP2STXATSWF4UI2LAO
X-Message-ID-Hash: Q3FVBSO3TPKYSLCP2STXATSWF4UI2LAO
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/Q3FVBSO3TPKYSLCP2STXATSWF4UI2LAO/>
Archived-At: <https://lore.freedesktop.org/alGz3vywc6W5hvso@skinsburskii/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, Jul 10, 2026 at 03:12:09PM -0700, Andrew Morton wrote:
> On Fri, 10 Jul 2026 14:26:35 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:
> 
> > hmm_range_fault() requires the caller to hold the mmap read lock for the
> > duration of the call. This is incompatible with mappings whose fault
> > handler may release the mmap lock, notably userfaultfd-managed regions,
> > where handle_mm_fault() can return VM_FAULT_RETRY or VM_FAULT_COMPLETED
> > after dropping the lock. Drivers that need to populate device page tables
> > for such mappings have no way to do so today.
> > 
> > Add hmm_range_fault_unlocked_timeout() for callers that do not need to hold
> > mmap_lock across any work outside the HMM fault itself. The helper takes
> > mmap_read_lock_killable() internally, calls the common HMM fault
> > implementation, and releases the lock before returning if it is still held.
> > The timeout is specified in jiffies; passing 0 retries indefinitely, while
> > a non-zero timeout makes the helper return -EBUSY when the retry budget
> > expires.
> > 
> > When handle_mm_fault() drops mmap_lock, or when the range is invalidated,
> > hmm_range_fault_unlocked_timeout() refreshes range->notifier_seq and
> > retries the walk internally. If the lock was dropped, the retry deadline is
> > also restarted because a lock-dropping fault handler made progress.
> > Ordinary -EBUSY retries keep the existing deadline, preserving the caller's
> > timeout policy for repeated mmu-notifier invalidations.
> > 
> > The caller only needs to perform the usual post-success
> > mmu_interval_read_retry() check while holding its update lock before
> > consuming the pfns. If mmap_lock acquisition is interrupted or a fatal
> > signal is pending during retry handling, -EINTR is returned instead.
> > 
> > The common implementation conditionally sets FAULT_FLAG_ALLOW_RETRY and
> > FAULT_FLAG_KILLABLE only for hmm_range_fault_unlocked_timeout(). The
> > existing hmm_range_fault() path still passes no locked state, does not
> > allow handle_mm_fault() to drop mmap_lock, and remains a thin wrapper
> > preserving the existing API contract for current callers.
> > 
> > The previous refactor that moved page fault handling out of the page-table
> > walk callbacks is what makes this change small. Faults now run after
> > walk_page_range() has unwound, with only mmap_lock held, so dropping it
> > does not interact with the walker's pte spinlock or hugetlb_vma_lock.
> > Hugetlb regions therefore participate in the unlocked path uniformly with
> > PTE- and PMD-level mappings; no special case is required.
> > 
> > Documentation/mm/hmm.rst is updated with a description of the new API and
> > the recommended caller pattern.
> > 
> > ...
> >
> 
> A trivial thing:
> 
> > +int hmm_range_fault_unlocked_timeout(struct hmm_range *range,
> > +				     unsigned long timeout)
> > +{
> > +	struct mm_struct *mm = range->notifier->mm;
> > +	unsigned long deadline = 0;
> > +	bool locked = false;
> 
> This could be local to the do loop and it needn't be initialized.
> 

Unfortunately, it can’t, because its state is mutated in
hmm_range_fault_locked() and the resulting state needs to be preserved
across iterations of the loop as deadline reset depends on it.

Thanks,
Stanislav

> > +	int ret;
> > +
> > +	do {
> > +		if (fatal_signal_pending(current))
> > +			return -EINTR;
> > +
> > +		if (timeout) {
> > +			/*
> > +			 * If the previous fault dropped mmap_lock, then the fault
> > +			 * handler made progress. Restart the retry timeout in that
> > +			 * case, but keep the existing deadline for ordinary -EBUSY
> > +			 * retries.
> > +			 */
> > +			if (!locked)
> > +				deadline = jiffies + timeout;
> > +
> > +			if (time_after(jiffies, deadline))
> > +				return -EBUSY;
> > +		}
> > +
> > +		range->notifier_seq =
> > +			mmu_interval_read_begin(range->notifier);
> > +
> > +		ret = mmap_read_lock_killable(mm);
> > +		if (ret)
> > +			return ret;
> > +
> > +		locked = true;
> > +		ret = hmm_range_fault_locked(range, &locked);
> > +		if (locked)
> > +			mmap_read_unlock(mm);
> > +	} while (ret == -EBUSY);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL(hmm_range_fault_unlocked_timeout);
> > +
> 
