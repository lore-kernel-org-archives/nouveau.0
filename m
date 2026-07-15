Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037EFC44501
	for <nouveau@archiver.kernel.org>; Wed, 15 Jul 2026 16:39:44 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 79BCF10E6B7;
	Wed, 15 Jul 2026 16:39:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AOsZ5yKF";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D53A046ECD;
	Wed, 15 Jul 2026 16:24:28 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784132668;
 b=dDOwxr2s54oqWJReZ1cMJrcrydJ8puQ5S5E/kqHXKWoa1F0VNMPyAFcp0yfJ1t5ANKXAr
 0Z/oU0832fTaZx5QXqRlPHioZPKTU0Hj98mvAmYediDDB/11l2f0+EpfcD58QWzyUZUjqTl
 6y2gx0xImfBHq8zkIfNO3/QyuiJyOddYS0tbpT6AkY2Y8ysmNCzQ7HnwTU6FY9Ozd28U5nK
 Z9P7nHHyS4A8rM5nWLJ0xfIDuj7UCpbqX7AjwRnvJImxbUwd6DX5GqhYxREmKE1OOppRvgH
 5VNANH1+rawB1oCeBHV8CGxmrpwGf3MqNYmFrohXRcyt3C7+351beezV3vkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784132668; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=or7RxpRNzsjVzPQB5YJNcUrM8L7o9Zk9H3H5s18AhOk=;
 b=wILTg+A/77LXQcyxh1vRM864BaDEIE6dmZwhTp+z58BdsCC5KE7f2NWiQW/yOLENGO/he
 HPYmv0c93d+qD4+xDH7ZIBSnF0J0wolhMtvfRtVOamKoaESz4+A8v9janR1q2efrBoJ77zq
 OS8b38tVsPiod/VYG6muYVUjLfSutmBJRVnsPzj8lfxBHGjXfXl8L7gs0x4nogdxyIAIB30
 55QblY7ST/PUdnAVA1N/R2iUAtY9Vz1jsuwJksA7fsXI5ra/J8x5KZCZeco3CyvPaTq1Dzh
 IXkf2uVMjtTvubQo//HowvKEiXmx7VWlEaN9ldhnO4sTDZZIPsSnvBCqkq/Q==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id D4F8546CB5
	for <nouveau@lists.freedesktop.org>; Wed, 15 Jul 2026 16:24:25 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 46A9410E182
	for <nouveau@lists.freedesktop.org>; Wed, 15 Jul 2026 16:39:41 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-caf707e3a70so652570a12.1
        for <nouveau@lists.freedesktop.org>;
 Wed, 15 Jul 2026 09:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784133581; x=1784738381;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=or7RxpRNzsjVzPQB5YJNcUrM8L7o9Zk9H3H5s18AhOk=;
        b=AOsZ5yKF82h5tlQ2oh/nI/EEvPfcV22mTpTxhjPjDM2AWzNLnqsFtfvg6OhNv5Ln6k
         NDrsiyL8bHZsG/fQn4jy/q4vkJ9sFaiaSKiwRRMAF2na1XZ2+wyGTKb8kd9cyxnFEn2C
         S93GvudLw2RngbCJs2ikVpnN01gBbEwBZNkLLVjP9zcdpj9mJGFo3yv2Qt2bibH1v4Hr
         YRDo0E5Dk+0w+8rR9wd2sd2EZNL82e9rWBRYUkBytew5LczYrh5mk8To8Y6aquxuKFAx
         JmA5wK8+4Ri7bd0whxJoHqbLYRefQ1qeERQ0Gm8JtZnrHh+x0EdFx3tZiTmxJt5k9j52
         J8cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784133581; x=1784738381;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=or7RxpRNzsjVzPQB5YJNcUrM8L7o9Zk9H3H5s18AhOk=;
        b=GAw/yiBzVHQiE6D1Y9N4XUUmwvXTLFnu5uXSNeY2jm5zqAD8wGbp4UYt62hUv/84pU
         Tv41E4348GRorAHkNcrjSD8jyRdJOhpVFpdgzZQwkyevGcjHwI5BaSZBh2GtVOZN24OW
         XdOwk39XTAMEpBus8LZ3HxPU6/1UXnPwvu9bgPHP1NepiyAxfWCvNxxHky/CDz4DxfLJ
         NjfZgOx3N1rmaQGXfZVqIFnejaEJa8c5l9eLE7cDJWJwMUmZQkX6FHQ0O4S9Ov1B81y/
         Q1/77+KUBLYYU4RvK8aEDztStVM2lTKoZRd/revNEabJFNpwdYa2p6KDcdPnltNVDmsg
         0Bpg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqk7Y+2t9aiacyw8BOwbNXi4ydIwdJp6BkqJzFfSDBW+1cI8sKV49Og8RiL/++G4YMVUEyDEF/v@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzo89QXXIyGDsLbKcpBeH/bUEgIA9rPevp9vcPsGXQxXjjKfQCN
	fY0kij2TiV+WWUYSRyhJtfOcMkrgi+lYs0vaElI6/OumI9x3YaoL4gtL
X-Gm-Gg: AfdE7cmBy/Jd4ilv86stwUWnuq6MMTT+jcyCGSPcavDizrUK3xMJfd5xht86cZqD6TO
	VmUEj1ygAWPYNQvj7hqRL//aClpDHUvyG35drBTsAXZva8mu3JuvtFhx3BTRhj/bZLqOsBY5qUd
	Z/qP6GcQCS+p5yRCLDYsLBK1G6N6hO+nNV68cQv/8VSjW9mjY9Yw+85eOJKmJtvqxVsF8cwfcHF
	ZAKv9iSAcrLv09hRi6ge5S/7MxY6psAUFkCeaF3+iqnCk2TOD8V/pQGSCo5Dp3B2I4seCrEaJL4
	XqCdKXDAdio/ePswMYz3acggAqeCAQQnvex43ShjDShCvnLAwME2buY7tnlwJp6rGTBVX9YGYQQ
	/hrBTHHzAbJRl42akOtxJXUdnZa7J54DomM5zuWIruo/x3YsbVqRYkjYIn5pGXdX2DQKackBJGo
	6+SWvUwC9alr77SJA4Ay6k3qvIioKzMyZf81GWbF4NMfZs5Fmhrzjn737cQHwgXmnM2A==
X-Received: by 2002:a05:6a21:7785:b0:3c3:682d:9fbb with SMTP id
 adf61e73a8af0-3c384b91e5amr105261637.21.1784133580580;
        Wed, 15 Jul 2026 09:39:40 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cb258fd10d2sm486006a12.16.2026.07.15.09.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:39:39 -0700 (PDT)
Date: Wed, 15 Jul 2026 09:39:37 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Subject: Re: [PATCH v2 0/4] mm/hmm: Clarify notifier retry state and scope
 HMM timeouts
Message-ID: <ale3ydkx1xt6ruuP@skinsburskii>
References: <178406760622.1106335.2379450382728057793.stgit@skinsburskii>
 <4300f09b-8f93-4605-b072-7c09a82cb16e@kernel.org>
 <alecaJ1FUso39D9k@skinsburskii>
 <alet21wLwM6P_Km2@lucifer>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alet21wLwM6P_Km2@lucifer>
Message-ID-Hash: G6KHAHURU237XI7HDYUL2IUI3MEDUWNO
X-Message-ID-Hash: G6KHAHURU237XI7HDYUL2IUI3MEDUWNO
X-MailFrom: skinsburskii@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: "David Hildenbrand (Arm)" <david@kernel.org>, akhilesh@ee.iitb.ac.in,
 akpm@linux-foundation.org, corbet@lwn.net, dakr@kernel.org, jgg@ziepe.ca,
 kees@kernel.org, leon@kernel.org, liam@infradead.org, lizhi.hou@amd.com,
 maarten.lankhorst@linux.intel.com, mamin506@gmail.com, mhocko@suse.com,
 mripard@kernel.org, nouveau@lists.freedesktop.org, ogabbay@kernel.org,
 oleg@redhat.com, rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
 skhan@linuxfoundation.org, surenb@google.com, vbabka@kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-rdma@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/G6KHAHURU237XI7HDYUL2IUI3MEDUWNO/>
Archived-At: <https://lore.freedesktop.org/ale3ydkx1xt6ruuP@skinsburskii/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Jul 15, 2026 at 05:02:59PM +0100, Lorenzo Stoakes (ARM) wrote:
> To avoid confusion: obviously please don't merge this series Andrew.
> 
> On Wed, Jul 15, 2026 at 07:42:48AM -0700, Stanislav Kinsburskii wrote:
> > On Wed, Jul 15, 2026 at 02:41:43PM +0200, David Hildenbrand (Arm) wrote:
> > > On 7/15/26 00:21, Stanislav Kinsburskii wrote:
> > > > This small fixup series applies on top of:
> > > >
> > > >   [PATCH v8 0/8] mm/hmm: Add mmap lock-drop support for userfaultfd-backed mappings
> > > >
> > > > The first patch updates the HMM documentation example to make the
> > > > mmu_interval_read_retry() state explicit: callers should use the notifier and
> > > > notifier_seq stored in the same hmm_range that was passed to
> > > > hmm_range_fault_unlocked_timeout().
> > > >
> > > > The remaining patches adjust nouveau, amdxdna, and drm_gpusvm users so the
> > > > timeout passed to hmm_range_fault_unlocked_timeout() is treated as a relative
> > > > HMM retry budget. These callers no longer keep an absolute deadline around
> > > > their outer driver retry loops or pass a computed remaining time into HMM.
> > > >
> > > > This keeps the timeout scoped to HMM's internal mmu-notifier retry handling. If
> > > > HMM succeeds and the driver later observes an invalidation through
> > > > mmu_interval_read_retry(), the driver retries the operation with a fresh HMM
> > > > retry budget.
> > > >
> > > > Changes in v2:
> > > >   - Kept the nouveau outer absolute timeout around the
> > > >     mmu_interval_read_retry() loop. hmm_range_fault_unlocked_timeout() only
> > > >     bounds HMM’s internal retries, while nouveau faults are handled from a GPU
> > > >     fault worker, so userspace fatal signals cannot break an endless stream of
> > > >     invalidations there.
> > > >   - Updated nouveau to use time_after_eq() before calling HMM, so the remaining
> > > >     timeout passed to hmm_range_fault_unlocked_timeout() is always positive and
> > > >     never 0, which would mean retry indefinitely.
> > > >   - Updated the nouveau fixup commit message to explain the worker-thread
> > > >     timeout issue and the time_after_eq() boundary behavior.
> > > >   - Fixed the amdxdna fixup commit message. It now describes
> > > >     aie2_populate_range() correctly instead of carrying stale nouveau prose,
> > > >     and notes that command submission still keeps its broader timeout while HMM
> > > >     gets a fresh relative retry budget.
> > > >
> > > >
> > > > ---
> > > >
> > > > Stanislav Kinsburskii (4):
> > > >       fixup! mm/hmm: add hmm_range_fault_unlocked_timeout() for mmap lock-drop support
> > > >       fixup! drm/nouveau: use hmm_range_fault_unlocked_timeout() for SVM faults
> > > >       fixup! accel/amdxdna: use hmm_range_fault_unlocked_timeout() for range population
> > > >       fixup! drm/gpusvm: use hmm_range_fault_unlocked_timeout() for range faults
> > >
> > > Why a fixup series instead of properly resending the full thing?
> > >
> >
> > The goal was to get a Sashiko review, and v8 has already been applied to
> > both `mm-new` and `linux-next`.
> 
> Please don't do this, this is completely impossible to track for review :)
> 
> mm review is currently very difficult based on volumes, it'll become impossible
> to manage if people sound fragments of series.
> 
> Please just resend the whole thing at this point.
> 

Well, I followed the guidance provided by Andrew, and I believe he
applied all of the changes, including these, to the `mm` tree.

Do you still want me to send v9 under these circumstances?

Thanks, Stanislav

> >
> > You can find more details here:
> >
> >   https://sashiko.dev/#/message/alaWmUEeIBeSkmO0%40skinsburskii
> >
> > Thanks, Stanislav
> >
> > > --
> > > Cheers,
> > >
> > > David
> 
> Thanks, Lorenzo
