Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95FD0C4451C
	for <nouveau@archiver.kernel.org>; Tue, 21 Jul 2026 16:49:40 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB5610EAB9;
	Tue, 21 Jul 2026 16:49:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="djiFLKal";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2389E46E2D;
	Tue, 21 Jul 2026 16:34:09 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784651649;
 b=UbNXFQq6hfz2KE/g2EO2M0iJdyYvcBWB8n1/fgzIapuwkV8YpGsw/FpUYFnuxoJx9blAF
 hGwLqVpSL5/4uo5ht6ARdq1GHsC2YAyd3c+JqxAfnBvTRQbWEg06HaADuZJ5lvwbbZLIP++
 ZdAypucPoa8S5jXjsu1dNmB4QtsU5qSNAt8BC93vsiKmDcjpRLaEulb+LA2ZBmGa6WQ7+lN
 pZeUBymQ5zDAZJ8DoHTdkXmzEvALMRGX+3m5ywtDxRcxpKnH1pRuGk6vbgRVqhyrSFH062w
 eMrvw3oOD2NAlFptQPIitcgHiOt52h7BjvK8IJl6pOtC0UuAb8EkAqUAm16w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784651649; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=jz3tCmNLomhxeSHRRM/RsgqxQHXL6/1WUZFNVLX32Kw=;
 b=rUL/s24y6/7JeAb97wyR33YRmICYFJyDkKtp2vy0Et+WjlLNyHBUAtmSMOP09ipDTAIGk
 XiheBEDwlczNG4JhzkFOVBsKIKvhPNkbAHEeybmp9EpKDZ32hwsSkI/eqJwXY3IWwJJ0oYM
 6zTdRJjdX6H7tuELQvIL076mcTBJ+RlCuKa/8Bws6q6rbcD+09Ff6zhnvoK4xAKN11XYXEz
 opuhDWDTXM9wuBWbo8gNse6kZajXNdEUA8Wmg8+1FZtLJfUdijipSpS8krc2jbRtXnZ8nIX
 FM3An55BUn3KoKGafgZ2EKF5GLw1mvJLcVmwIPh2wbxVZp/IOIs7vIYV2zSQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 58570466F6
	for <nouveau@lists.freedesktop.org>; Tue, 21 Jul 2026 16:34:06 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 16A4310EA8B
	for <nouveau@lists.freedesktop.org>; Tue, 21 Jul 2026 16:49:35 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-84874b52eabso10900714b3a.0
        for <nouveau@lists.freedesktop.org>;
 Tue, 21 Jul 2026 09:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784652574; x=1785257374;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jz3tCmNLomhxeSHRRM/RsgqxQHXL6/1WUZFNVLX32Kw=;
        b=djiFLKalkVvzaWWn/0V76JWmADXCfWmqevccQ0rDxLctFwjSzHHFOkvXHyrmnDhWi3
         nySzmwr8yE7rklc/zxVNJ0S5GfijSjNc27CkgVIT3wdfaP4WilGLN/boMV51NuscU2Mv
         T6Nloe/NerNtzQufBDYNr9Y0fZ51SxpM4owgBCLcJVdNGH/+BDPNVbWLOJz3sBshBUv2
         azjNURKJoPxrD5TRzeqWG9M203AXUOyqY7Zw6vEnF+Djutd0EP2w+n2gAS7ixEzKfsc2
         H9AIC3FtLX2+MTRyjKP/4p/qM5ByBC33laUppKTT1VeIBlEAMDzvAMM6VbfAZXF/UFvC
         qJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784652574; x=1785257374;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jz3tCmNLomhxeSHRRM/RsgqxQHXL6/1WUZFNVLX32Kw=;
        b=Tg6gx3OPQqQWU7kK8EMztCRYE3XFC8HCsBv0gJ4a2F5LqR3dDcuJn49LzrXjgfyr0D
         Lw6DETm77XYaRTSKEUjD7r14PA0jMu7/nbVqMXogITL1VLe6v9M1pMA8/Iq4EKRQbNFP
         PDiv+lZ3NFFzM07LqxCAMt5/E1Ff18RA9r3YYuidvUDIZZl6D/N22hBDqRimoGtlK6Gy
         xh+o+8P2e/QIxj9rxDjXTYF1CakivkXDrJQIy6naVNbw9iMqQLg8L7DFASoog21W3tAZ
         7zgjiRPDNBf1RLYdetCQkaWO5UiNpH9Y1PhAh5JJHU30CRBGYxk9iZYiHCkhS4YpUMji
         KJ3Q==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp8PHTAFLUfa9hBuZs7ZSQaOnjGAhnlfBT4yoxBZKUocIFWQOvNuW9Vixo9lyQb+5rF3hHQdJX4@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTRLYxbN/WSp9QW9kclu/ysF/3v7BWBR5npyCdzdn/rLMKZyZk
	XKstlC691mQzx+FMhilCfDPSf42ptOZCJvXHWdxEdbnJf66hiruCqewi
X-Gm-Gg: AR+sD12WvMhqCKP75UeIcGi3q1YQVzMFYrlXpUsnhlLWDwMw1I03PMTq9MPB0UYF1wr
	pvz+fcAAPasBu0/rLlEHYyeaBx3zAnIYtqNVmPDsydm03hhGHSXSvlUpCbQXycEDKoOIkV8AivS
	Dt4loMSfGWGut6LSUINhL6rRXxRRgtuA8tJ0PUMp7i5sP6l47+eatNnC691npxuxTNGEakn9GgQ
	CzWIPuFkJdUAA4IO0ylAyGsiZHI7PZI297h4JMu2V7K+9djnLXLwZ9dBAJdfm3vzWEn7BBwmcNX
	hjGX8UmWBbp3jbdI5M6n3DR02+A5qEzOhY9tmZcm9MGL1zAm/Ix0awgvPmFXADEfwUm4ZDOKfDR
	belFrLLklmHde89bhxoj0VsPNfmLZjui03WJzCcnDF/3RKPklFHwnPEhi5mRk4IWNlZ7elkySzb
	4n6qxJA8bqHnT4Qx1CmANGG39vB5EfPrPujV0zHELniUmt
X-Received: by 2002:a05:6a00:cc7:b0:848:6f5c:a327 with SMTP id
 d2e1a72fcca58-84c29270ea2mr18663190b3a.15.1784652574553;
        Tue, 21 Jul 2026 09:49:34 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84e175aad1asm5186b3a.44.2026.07.21.09.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 09:49:34 -0700 (PDT)
Date: Tue, 21 Jul 2026 09:49:31 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Subject: Re: [PATCH v9 2/8] mm/hmm: add hmm_range_fault_unlocked_timeout()
 for mmap lock-drop support
Message-ID: <al-jG2fROgMWUq_T@skinsburskii>
References: <178413903133.1155966.3904063656020521607.stgit@skinsburskii>
 <178413936536.1155966.8918127042760531802.stgit@skinsburskii>
 <3ed2043b-88e7-4a86-9efb-fe788191e8e8@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ed2043b-88e7-4a86-9efb-fe788191e8e8@kernel.org>
Message-ID-Hash: HEFRJT5Z3W4VTYSC7XVGHTOCQVRL53FN
X-Message-ID-Hash: HEFRJT5Z3W4VTYSC7XVGHTOCQVRL53FN
X-MailFrom: skinsburskii@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: akhilesh@ee.iitb.ac.in, akpm@linux-foundation.org, corbet@lwn.net,
 dakr@kernel.org, decui@microsoft.com, haiyangz@microsoft.com, jgg@ziepe.ca,
 kees@kernel.org, kys@microsoft.com, leon@kernel.org, liam@infradead.org,
 lizhi.hou@amd.com, ljs@kernel.org, longli@microsoft.com,
 maarten.lankhorst@linux.intel.com, mamin506@gmail.com, mhocko@suse.com,
 mripard@kernel.org, nouveau@lists.freedesktop.org, ogabbay@kernel.org,
 oleg@redhat.com, rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
 skhan@linuxfoundation.org, surenb@google.com, vbabka@kernel.org,
 wei.liu@kernel.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-rdma@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HEFRJT5Z3W4VTYSC7XVGHTOCQVRL53FN/>
Archived-At: <https://lore.freedesktop.org/al-jG2fROgMWUq_T@skinsburskii/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, Jul 21, 2026 at 05:42:53PM +0200, David Hildenbrand (Arm) wrote:
> On 7/15/26 20:16, Stanislav Kinsburskii wrote:
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
> 
> The timeout does not / cannot affect how long we might be stuck without the mmap
> lock in e.g., the userfaultfd handler. And also not how long it would take to
> actually grab the mmap lock.
> 
> That's expected with the timeout, right?
> 
> [...]
> 

You are right. Ideally, the timeout should account for the time needed
to acquire the lock.

However, this timeout is not strict, especially with userfaultfd. It is
more of a sentinel to make sure the kernel does not get stuck for too
long and that progress is being made.

The default value used by most callers is 1000 ms, so accounting for the
time needed to acquire the mmap_lock does not really make much sense to
me yet, given the sentinel goal.

Thanks,
Stanislav

> 
> Nothing else jumped at me.
> 
> -- 
> Cheers,
> 
> David
