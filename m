Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18EEAC43458
	for <nouveau@archiver.kernel.org>; Mon, 13 Jul 2026 16:56:20 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E175710E636;
	Mon, 13 Jul 2026 16:56:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="qqXPbpsa";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A695F46821;
	Mon, 13 Jul 2026 16:41:08 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783960868;
 b=T853Cbbetx5yXtjaZASdoHSQTS1p4aTzRM9HDriHIIJpV6RbTl+yuCe4UE5WQcZtDDltI
 JaZZbniYFx4w7CqRaVKgot93womT/Gx3mMhAdP0Q7VOnuFjqE9i7YytYpseRQ3UW/C3mDa/
 C3ZYaFaAXZZI6dalqKkhwLR3Yqx99PrvRlQNNiHwNvTEgUYMi12uo8A4ooPdcuJQwvjqaU/
 EmjQaJMOLbXr0Fb6yphfFviE+9DuC181QPyPqq7yQPUnums5D0VVcSxgEWN0K6Q5XUGB8h1
 6lPkVkFE7gtplIrLE6tzRjKCyuEXvSWMjf5n3pgnO+qQcGYFBWwR/RJ0uOZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783960868; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=+wyTThpzWI663yfCX7yR0ohXV0bj+fwjL2+oCBrswHw=;
 b=Y8a6CyCpU+bnk5X9h/DHFEm5Klv2zjS+lWnnuczE7ioKcjmt/3zFJ1Hmwfjd6mCjVGkVt
 1q+LFn6Lsv8ll7I/7XcB4/bGpbTIV+/kbT/fdiud3pyT7jE/+6Z4Z4Ev2KIintbG9i6UWny
 tbkXpWAUloo2Q+iIeQ49Cx7HL4QiBdna8hRb60stJwTUz6j29x28jo16sAuWZL0yHF8F9qN
 3xuSgeqGSLzpSpCLMmDa3I3cmdEyoSSYSsKrL9MbVQBvbuOKglZlejl9YDXDOeYNOgit2Q5
 bDVUHjya2+QwdncN3sk6NR4C42zHVDY+5bZogyQPNYAezsy7tmvsyOAEF/Fw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id EE43444921
	for <nouveau@lists.freedesktop.org>; Mon, 13 Jul 2026 16:41:04 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E388010E62E
	for <nouveau@lists.freedesktop.org>; Mon, 13 Jul 2026 16:56:15 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2ce9e39fccbso838155ad.1
        for <nouveau@lists.freedesktop.org>;
 Mon, 13 Jul 2026 09:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783961775; x=1784566575;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+wyTThpzWI663yfCX7yR0ohXV0bj+fwjL2+oCBrswHw=;
        b=qqXPbpsad4Ff23vhjTjQfJGs1mkZz7MjIXIIzbvfDvPMlV0LrpK99LsJAdACNYPiK5
         DECzYPgs8sMitz1nTAvb3sv5a0Ax5pVGUAsiR1hBrbYdpqfyDpK9g7f5zdyERlnQcCTJ
         /1SrK9kHugrRIDkQkszneIw+MTHZKubiyohMmqvYqU7S79SptXzmj2/SsjG8Dgsqh6ot
         cZ4a7pPggVPAQiMTm+29frYM/hgBbulNPg6fNETQiYRconjplhyuk1Hq4ARS4VE3YOsu
         vi3pFq6PGzoF5XdKwiex7oVMF+BUA7KvGlTuw4T5xDXtI8Pp3t9liGhh9QRowJBCePRw
         ITEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783961775; x=1784566575;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+wyTThpzWI663yfCX7yR0ohXV0bj+fwjL2+oCBrswHw=;
        b=oI26h64es7khjJB1UEyWqnIqhkgUIXN9T57orpKpU8XrDUImByj304kpM91R3iUF33
         OLzNVB5xtiuBxSayXsDT6+79kt6/48aJH57/zLJJUIB2T0LqDUMqEgQdyF5sFFLpbVVf
         kyiFuGwzDQso834qB/35FJzw04d1e5whFkZj0EkXBSm/Ni7kNXYOCBtmYsdbcr/Cb3r4
         lXXhnBrWqBOalJu3S0mVU735pCwZf35JFabxMc1aCP5s1RnhyVrM+ZJ/8sfcdtrKtegS
         dV6stcLNaZ3m8nMdvtzd9mH7p+iq7tgyaViZ7+KwBoFQnqR29CjTvJ+/P4XnO86k9fDq
         L2jA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrZBp5Q8/rm2sbWjSUDaeDe7t5x5x5g+x/9nUvQ3C71VBk17VuWbIdOmVMQFWyB//f+NbiI0UL9@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmWJYJ8QR5MIFwJmkVAIRzHPCqf7bZqYNZk4tihKRGt2csl90Y
	qmK7T/pkaP5OCcFdbF2XWiNcKBn5N1J2B+qcAc8+h9a0KBq9C3lc9/hC
X-Gm-Gg: AfdE7cmArEwXdkjoAicocZHgVb5T74XO7NnCOL1IP3nhi5nOMLeFmAIoM04CG64UuhX
	ycI0rbHuNQNr/o3+rW2Mej9zsO6TrS5qRjJ5aoDvgIpxlUtdiC/Kf8FpU0ihnyKrRsKjWh72dkc
	SWAestIvH1IlPBIyotTq9zFX86w+gLZyyMPSR88rVqwijFgW9H0WeWvG/j2uZY3Ww+BpDSzC1wN
	00u3arix4A6sp/YMVusA44DwBgp/bolPX6GnNsSFqMuou7p7bZvTpLQhVaDxJYsd75rx4i1sY8Z
	uJsmAa0lBdJStRfc07kiKroeYd6pozP6n5JqukeWnXGsYGMHzo+rCHN15nXRXRgDfOjXsQ263NM
	0lvXX+i2TZGaVlaThYkrJkCZuQiAIDBRJdaKZf2MBvebxolOu87G0ObPPijyfEj6pjsJCiOz+FK
	xSRZd5nnUGKB4SC5zEmhbwQdqI65H70eWEztE562d5RyQuKezEsvcCPt4=
X-Received: by 2002:a17:90b:57cb:b0:36b:769c:c037 with SMTP id
 98e67ed59e1d1-38dc81978ecmr7351194a91.5.1783961775319;
        Mon, 13 Jul 2026 09:56:15 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38e1745a596sm180718a91.15.2026.07.13.09.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 09:56:14 -0700 (PDT)
Date: Mon, 13 Jul 2026 09:56:12 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v8 4/8] mshv: Use hmm_range_fault_unlocked_timeout() for
 region faults
Message-ID: <alUYrESVcHR_p-S_@skinsburskii>
References: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
 <178371881034.900500.5214601525971121683.stgit@skinsburskii>
 <20260710151216.0397a6f9ac5c7b4ccd274cc1@linux-foundation.org>
 <alG1JwgUK44dCiN4@skinsburskii>
 <20260710224606.69235ab5c49b5987fd33e924@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260710224606.69235ab5c49b5987fd33e924@linux-foundation.org>
Message-ID-Hash: BJ7IJJDOT45FD5LIU2HAJQNOBV435S7I
X-Message-ID-Hash: BJ7IJJDOT45FD5LIU2HAJQNOBV435S7I
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BJ7IJJDOT45FD5LIU2HAJQNOBV435S7I/>
Archived-At: <https://lore.freedesktop.org/alUYrESVcHR_p-S_@skinsburskii/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, Jul 10, 2026 at 10:46:06PM -0700, Andrew Morton wrote:
> On Fri, 10 Jul 2026 20:14:47 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:
> 
> > > > +	mutex_lock(&region->mreg_mutex);
> > > > +
> > > > +	if (mmu_interval_read_retry(range.notifier, range.notifier_seq)) {
> > > > +		mutex_unlock(&region->mreg_mutex);
> > > > +		cond_resched();
> > > > +		goto again;
> > > > +	}
> > > > +
> > > 
> > > If the calling process has realtime scheduling policy and either a)
> > > we're uniprocessor or b) this process and the holder of
> > > interval_sub->invalidate_seq are both pinned to the same CPU then
> > > cond_resched() won't do anything, and this might be an infinite loop?
> > 
> > Yes, looks like it might.
> > What can be done to prevent this?
> 
> Well the best way is remove the polling loop and use a proper sleep/wakeup
> mechanism - mutex_lock()/prepare_to_wait()/etc.
> 
> If the polling loop is to be retained then maybe msleep(1) or
> usleep_range()?

Well, running MSHV - or, I suppose, any other VM - on a uniprocessor host
would not be very efficient.

I’m not sure whether this corner case needs to be handled explicitly.
But even if it does, supporting or explicitly forbidding it would be a
separate change. As Jason noted, this is not a regression introduced by
this series.

Thanks,
Stanislav
