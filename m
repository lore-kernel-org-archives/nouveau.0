Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B57C43458
	for <nouveau@archiver.kernel.org>; Fri, 10 Jul 2026 16:48:51 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E226C10F154;
	Fri, 10 Jul 2026 16:48:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fjj8Z7j7";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 66FDB47033;
	Fri, 10 Jul 2026 16:33:46 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783701226;
 b=BivvU+FF+SphlNx6aun5tALs8PhyPFgBVaKTjd3TwQbX5nA+NPZeyCECJdfWL5RCAidJS
 JVdefwvdS/CnOWN1t6T7BVrPrklnQ+TRGHnb1VOvHBv5Wmd7J5Y5FJYaneAoM9S+3DCsOTQ
 X5xpeH1AF6mj5/dBY2mGKZUfvl0tgLXku2Id+ho0BCqKQ4qRUOkaMORB6+1fcFh0IvHvSme
 bgwUzUEL/EB4GkN2xjc6UwNCsaUiPfVs/BgXjQOocGZWGajYgsKTpjxMqFxD9/yKmlwIvZl
 sFuxwfUvrjLZMAkZlTjFTpAi1fJXJLIMbzaDm4S4CrzQa8I8qJqI+KJ5Cacg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783701226; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=h/T7cJaVh+vpdnCnVWowF/GJXIiYthZ82xWXxPXNVVI=;
 b=u4RL7GOIOaMumdY0BuxKkZWrjT13dE5k5YNoqX7TbHBElojSWLHGsfvsueWvMqfYHgDT7
 PP6FmLa9AWcWTdOTX2BLJmPX2lGXOrXHN3zYa9BNfgfrOFYVhoDn/eGHQQuBf4+9ybCGcB+
 QPYE6E4bKQDw1JTIwso38ssFbjWzK7rAQ7zdtocCbS1IJ2nMyRBrnrXBqxfIPM8Mwcfi5k3
 bIb3nGNd4fTFV1HFo/QHn1tjRz995U9cYINMAnbzq4L0B2VGu4LKXAOlumN+TwNUh0bckda
 1i+tz0Rp54LRN+4j2S8Mt6QBdOSci38NHH1OWd6MHe1cjtkchBnKKWrm54wA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 6E3E046FDF
	for <nouveau@lists.freedesktop.org>; Fri, 10 Jul 2026 16:33:43 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CC24710EF62
	for <nouveau@lists.freedesktop.org>; Fri, 10 Jul 2026 16:48:47 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-8453427d3f4so1029031b3a.3
        for <nouveau@lists.freedesktop.org>;
 Fri, 10 Jul 2026 09:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783702127; x=1784306927;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h/T7cJaVh+vpdnCnVWowF/GJXIiYthZ82xWXxPXNVVI=;
        b=Fjj8Z7j7RTjr/BMUJIKXxTu7gJa4aRmlP6+mdUFqNSP7Dx45qNsFSIxG2Sh0DlFRV4
         c0+pvdvpXAH9d9/qcs0LYkoKt8YMRzKSBHLKA2VB7L99rbO7QKvenUsK60nl566batfi
         9Pa1S3DK9IYa5RYk54JCf8FVzuumjmHSpq70C4LkMNduT/auZBxadRht9tncXQ76eNdB
         4alWyTCaSBjARvKpP/gs6G+mZUX8fm9xvblRXimeMmj1fKTY0kkzy4vk9XMLaXUA/OvJ
         2SXwHcnxNd84tAR4o8jxiVHIbdncgJiQnUBlA+pMRY4bWEU6WwS6I7l39q62sXVGCSPk
         iJuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783702127; x=1784306927;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h/T7cJaVh+vpdnCnVWowF/GJXIiYthZ82xWXxPXNVVI=;
        b=Xr1CRcAOZwDXanfDtLip3i4EP4ziSq69JkbhjMeDF7/He4MEjXoS+UbCiB4b7fpnQ4
         itaKcP9CrTjlGKF9ebTVfL6sjro0dVEiis26okjusH6hGQKgHnQLHG/jqB6vwwlq3v/X
         DGB3kE5SAnPblH6EjGVpU2AOgiroC/u9iiHNtNetJb9owZaZXYNxqZi6oPmStVGGEyum
         Jf/N0GZI+TMpaZ1N4/fdrdL/8L6MZrBa6qxNUxQmd/ZHvTrlFISxYthWC3xazNipCp85
         XxiS4UmPSahs9WtPi7FmRikUFGna6ngTcDcE3Jntj0U8K3doSz6rxFGiYAmrFE8zuair
         kVaQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoMOUPgctWvdWmm4ekV7ZEWTy9ASF1KT+gSHHe6gdB+oGzc1CWqWh5ipRFe93s+g/+zCeXn/PBU@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtcjT16PhILFG61ksUr5DUAumkpIM7W2CJYq4tma5hkOH+ov1K
	JC3nMpRNwruJHjc6Kau5EteKUT0wGC/uYmzDLzB3rszZhG5cWr6i3J01
X-Gm-Gg: AfdE7cl9tZ/M1G1gE+CWEBykiitXCCSV5ltwKIEspVok4gXrUaUyc6rYn76zEKyW55X
	DNluqXBZsCCYCcRKd/3Y16AC6t5xHCkt83BI4wExP6RO0QMXm8Wv/C9qV5kcd8w1q4BS3EZqjrJ
	YMu5YHEWfdigKwDYmKyzHbCVkfTWuvCbQqHGaXtG3F2mWUNLKW728lxnkBAcFYItbEhHEIjjj2Q
	cNeuOgvCQCiVg6SkMtBjO5YZxtrOc/LrfFh0QxNJc4FWHfhHUuYVASLAyr7Lp6/VMVQjWvU7grz
	gPdyCZWvGKyjw5ck1zRCk3jvpjnpav0gzhnTjenY++Z87G8LCSVSRG7vkNTtXp+35IBIE/ybDAv
	ClzxzaFPrIIE2EAxNqtnQ8+jzSES+LlAjOtQblhYJ7GLgUX1hnLk/otII5uPJiX/EJEbXFNl5K2
	tyB3NXxTqgi09GNRDkRfRGdDfOYvdLZJz7b/0oksmLIR4bhWKc0io3Q0c=
X-Received: by 2002:a05:6a00:6c9a:b0:848:2f7a:2e57 with SMTP id
 d2e1a72fcca58-848438a63damr12313317b3a.70.1783702127271;
        Fri, 10 Jul 2026 09:48:47 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6b609acsm10408336b3a.1.2026.07.10.09.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:48:46 -0700 (PDT)
Date: Fri, 10 Jul 2026 09:48:44 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v7 2/8] mm/hmm: add hmm_range_fault_unlocked_timeout()
 for mmap lock-drop support
Message-ID: <alEibBRYmWQvf1z1@skinsburskii>
References: <178345345668.660027.2952911919681614557.stgit@skinsburskii>
 <178345362182.660027.12809852179204464964.stgit@skinsburskii>
 <20260710162749.GP118978@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710162749.GP118978@ziepe.ca>
Message-ID-Hash: C2CPGVVZQYG3KD4Q3LSSWTYVHGUYFMLK
X-Message-ID-Hash: C2CPGVVZQYG3KD4Q3LSSWTYVHGUYFMLK
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/C2CPGVVZQYG3KD4Q3LSSWTYVHGUYFMLK/>
Archived-At: <https://lore.freedesktop.org/alEibBRYmWQvf1z1@skinsburskii/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, Jul 10, 2026 at 01:27:49PM -0300, Jason Gunthorpe wrote:
> On Tue, Jul 07, 2026 at 12:47:01PM -0700, Stanislav Kinsburskii wrote:
> 
> > +int hmm_range_fault_unlocked_timeout(struct hmm_range *range,
> > +				     unsigned long timeout)
> > +{
> > +	struct mm_struct *mm = range->notifier->mm;
> > +	unsigned long deadline = 0;
> > +	int locked, ret;
> > +
> > +	if (timeout)
> > +		deadline = jiffies + timeout;
> > +
> > +	do {
> > +		if (fatal_signal_pending(current))
> > +			return -EINTR;
> > +
> > +		if (timeout && time_after(jiffies, deadline))
> > +			return -EBUSY;
> 
> I really dislike there is a timeout here, HMM is supposed to be more
> deterministic. GUP doesn't have a timeout, what is this about?
> 

The timeout was added because this version makes the unlocked helper own
the internal retry loop, including -EBUSY retries.

Several existing HMM users already bound those retries with
HMM_RANGE_DEFAULT_TIMEOUT, so the timeout argument was meant to avoid
silently turning those call sites into unbounded waits.

That said, I agree this mixes driver retry policy into HMM. A cleaner
split may be to make the new helper timeout-free and have it retry
internally only when mmap_lock was dropped by the fault path, since that
is the part HMM must hide for userfaultfd-style faults.

If the walk fails with the normal HMM invalidation -EBUSY, the helper
would return -EBUSY to the caller, preserving the existing driver
timeout loops and keeping HMM deterministic, closer to GUP.

Is it better from your POV?

THanks,
Stanislav

> Jason
