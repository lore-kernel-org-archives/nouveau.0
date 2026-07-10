Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E97C44501
	for <nouveau@archiver.kernel.org>; Fri, 10 Jul 2026 17:03:03 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 81E2310EF83;
	Fri, 10 Jul 2026 17:03:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="I2qDyMK0";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E59F147039;
	Fri, 10 Jul 2026 16:47:58 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783702078;
 b=i1XO1G3qIR48a4bn+GGYw3njYii0/R46JE1h+xXLOZSYX1YIWo2u1FE5D3bh8Lsv8Cy/y
 Hy58IN6KQfLGV7fhXGeO/zFKrPUDoI7Kfda3ZTCCloTpFcf4rFZiGloqV6/AqRw0fecT8ij
 CdpBJ1+FcZjKXEoaXjtgAwS3Vu24YOUmPzw2D2+hB/n8o2Nbw1KICsgsdrQ3oNP+h+ST7BL
 nJgtd/0I/FxBx9mNX8CtQQOTQK9X7n8v1YkHiLrfOTOQquAJOe8n9niPS0xHALhzJckLxcK
 buM4sAzAKm779qhJfDKIuFju8NcF889YJc5qxaNFApOrHACdEK4i+HwEUSfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783702078; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=eJt4dduVMLAOIcmpuYMBgvu3eT4RLvOgifRZbg/Z4kQ=;
 b=PvrtgFWG9VulnTq+3d62lGFz2yRCiGrauCttjws7WERzvt4aZ1wt103znX6SRPaAtpAXB
 rRTdVGpMeCf353QCFbQoAWxG4MfkUvI15BsxI/60y78m0sxWt3RWQZvy7yFGQygDm+OAj9m
 3j3hnEg261Xvn2+jUpbhEOdMFNtmTDAfM/XPhGY4+e0pKkOQsJ5aohaLTKcAa4VP2JalKuZ
 1LtBC70ArJz+KaT+RdIsXAtaUq5u7rtyau7ysbt9Q6D+SDPGOUUoowyAGeZ5wmDi53n6F8q
 NeK8wTAEhK7sLskACpD8RYNlzhZuh9W5dvTi6VZ6YgLNWkmdcf7g2SYl12Og==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C116A4022C
	for <nouveau@lists.freedesktop.org>; Fri, 10 Jul 2026 16:47:55 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3000310E201
	for <nouveau@lists.freedesktop.org>; Fri, 10 Jul 2026 17:03:00 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-84864b41100so975273b3a.3
        for <nouveau@lists.freedesktop.org>;
 Fri, 10 Jul 2026 10:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783702980; x=1784307780;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eJt4dduVMLAOIcmpuYMBgvu3eT4RLvOgifRZbg/Z4kQ=;
        b=I2qDyMK07/a63AHzdyr5V5NWsIck/Va9/GjWFWTPvQoA32YN8m2jMv8jCED70SFemL
         CL6vPCTGJpzd7gn8wOnb7o/ICv92O8MI89LorrdI27T7Io4MZDYy6B0MzFjb6lcg/LgY
         8uSA6zECxTd/SWcnpjFTiucpQ3cZDkkk/mPSNWRzIFQQBSfqqi8Nq32UtpAiFSo1ERDO
         KbWIdnRyfMBO0FxvEMoCMgqJdcoeT7216nXV5rLat3JgEW/kmIF45M09cXvItsF32Hgu
         ah/YATBWC/tESgXS20sub0e3xEw5OLTG+7uk4AZRLbl6dt27j6gChT4vGcVNnO0NQHEX
         1BFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783702980; x=1784307780;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eJt4dduVMLAOIcmpuYMBgvu3eT4RLvOgifRZbg/Z4kQ=;
        b=RQqtuyGZoC7hpYzzr2cmgWcHh9GWv+klFT8cuSXTC9zw0vC/lqHZJR37/mM3NVtkom
         y+b2X5hrCTJVHwouGpoTYf80j9n8S0uGYA5J+q1cMNADQsKaJp+P0ADCbg53dElt534N
         alzhkuCUE1cl0PmeARHJYG2A/gLWW2NOHdoHvRIQzZqIrjhy1dykaXGTXRzKC+MqJRYs
         oQkkG+hzMEs+TFXXeXzpyy09QyV/XVehH0ZELmH9kJAGOkqk0fVq65CAH9BcgtvkePQb
         Y5R2c82p0orcv7gUZ3Os/mSAM8WmRtqddi7xoi+xMn+Q5WOlNfG1QQEpnlpTBXSpb7M2
         +MXg==
X-Forwarded-Encrypted: i=1;
 AHgh+RoLGaZRGRjH+bHVap+bnOaynctkI0Z03PG2EsM//qH+gDgumwyLWHGbrvJO9IOjwUUTLwrpj4ok@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGRqo3fVaTxFGjp0jCG4ydMMgPSx60H0csPXpMVwyDj9xk+RKP
	aYR6tVh+YD4M6d5zmGB7n+mvvn/Fl5RTBYAktKLbnCHLaRM5cAEVRDXG
X-Gm-Gg: AfdE7ckLSVlH3R+VyEREctly0kSJsP9oix12l8Y62QYep8XUtKehlc5Fs1YBk/VIjhc
	87tjQOki6L/k4NVezvnxvbZbTe+qg5qHowQwExTTUs9haN9iFCozGPbQP0+Y50z28SayIohMekH
	y/77omCjPlrBkOjqggqTjTPJWS/XwGVB7jwcZaxq1nURByuGpEm+qErbH+5xD9nr5OPzM/UmfeK
	/bbtjXwJsoEVJ6Bne78ef/6dYlBNp+UUJxHE7pRESwXJ1TjMv9wyJ0zZZ/eoyalcJJGIxcaReaZ
	QcqqOyfc4/mpZkP14VpwIlAcLuboNIh8rLmJK9lrmxNviaxDqU+zPNmGFlAUwMykJBGI0ADafiA
	T1S+Iq5XJcKa7rP2rXXZ0SFtcgVLUd8ac6KfWVX4J8qSvEhawsQW7YDRKh1PP70x8x6s6r9vDBM
	M3zME5D+IGEtwpr5MEVhG05PeCLB/s1AZpTsR0t3Z2/7jT/kpxPlp5bvY=
X-Received: by 2002:a05:6a00:1f13:b0:848:6ba2:4139 with SMTP id
 d2e1a72fcca58-8486ba24522mr4844235b3a.36.1783702979579;
        Fri, 10 Jul 2026 10:02:59 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8484519580csm4394040b3a.32.2026.07.10.10.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 10:02:58 -0700 (PDT)
Date: Fri, 10 Jul 2026 10:02:55 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v7 2/8] mm/hmm: add hmm_range_fault_unlocked_timeout()
 for mmap lock-drop support
Message-ID: <alElv0EKjLQXMNK8@skinsburskii>
References: <178345345668.660027.2952911919681614557.stgit@skinsburskii>
 <178345362182.660027.12809852179204464964.stgit@skinsburskii>
 <20260710162749.GP118978@ziepe.ca>
 <20260710164743.GX118978@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710164743.GX118978@ziepe.ca>
Message-ID-Hash: AH4BR65JW3VFY4FUDOJYUS52OGNULQHA
X-Message-ID-Hash: AH4BR65JW3VFY4FUDOJYUS52OGNULQHA
X-MailFrom: skinsburskii@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/AH4BR65JW3VFY4FUDOJYUS52OGNULQHA/>
Archived-At: <https://lore.freedesktop.org/alElv0EKjLQXMNK8@skinsburskii/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, Jul 10, 2026 at 01:47:43PM -0300, Jason Gunthorpe wrote:
> On Fri, Jul 10, 2026 at 01:27:49PM -0300, Jason Gunthorpe wrote:
> > On Tue, Jul 07, 2026 at 12:47:01PM -0700, Stanislav Kinsburskii wrote:
> > 
> > > +int hmm_range_fault_unlocked_timeout(struct hmm_range *range,
> > > +				     unsigned long timeout)
> > > +{
> > > +	struct mm_struct *mm = range->notifier->mm;
> > > +	unsigned long deadline = 0;
> > > +	int locked, ret;
> > > +
> > > +	if (timeout)
> > > +		deadline = jiffies + timeout;
> > > +
> > > +	do {
> > > +		if (fatal_signal_pending(current))
> > > +			return -EINTR;
> > > +
> > > +		if (timeout && time_after(jiffies, deadline))
> > > +			return -EBUSY;
> > 
> > I really dislike there is a timeout here, HMM is supposed to be more
> > deterministic. GUP doesn't have a timeout, what is this about?
> 
> It looks like you've moved the timeout processing related to the mmnu
> notifier sequence from the callers into this helper. I'm fine with
> that, but maybe add some comments that this timeout is helping
> implement the mmu notifiers, and we do expect that the HMM part will
> not timeout.
> 
> Though it is a little hard to see how your stated purpose of enabling
> userfaultfd is going to work, aren't you pretty much guarenteed to hit
> a timeout if the userfaultfd process is adversly scheduled? That's
> going to end up broken.
> 

The main customer for this new feature I have in mind is the MSHV driver
which backs VMs memory with HMM, requires userfaultfd support for
post-copy live migration and fast restore and it doesn't timeout.

I agree, that this current timeout value used by the other callers might
not be enough to repopulate the mappings with userfaultfd, but there
drivers would get -EFAULT for uderfaultfd-backed mappings without this
change anyway, so getting -EBUSY with the change instead doesn't look
like a significant change to the behaviour from my POV.

> So, maybe the deadline should be resetting after every handled fault?
> ie the timeout really is only about the mmu notifier and we don't
> count the time spent handling faults or walking?
> 

The timeout was inherited from existing HMM users rather than introduced
as a new HMM policy. Some GPU drivers use HMM_RANGE_DEFAULT_TIMEOUT as a
budget for the whole range population operation, including HMM retries
and subsequent driver mapping work.

Moving retry handling into the unlocked helper would otherwise hide
repeated -EBUSY returns from those callers and silently turn their
bounded operation into an unbounded one. So the timeout argument is
there to preserve existing caller semantics during conversion.

I'd say it's up to the caller to provide big enough timeout for
userfaultfd to succeed.

Thanks,
Stanislav

> Jason
