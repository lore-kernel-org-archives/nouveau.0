Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87956C4450E
	for <nouveau@archiver.kernel.org>; Wed, 15 Jul 2026 15:02:19 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5563E10E202;
	Wed, 15 Jul 2026 15:02:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="ddqtysqt";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CF5BD46E98;
	Wed, 15 Jul 2026 14:47:02 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784126822;
 b=CMy+9CqYsBCEMW0Pefsfcq/TNgRhMA+4kUcMXkLy0wcSZcCq0J2V+sa0LcLbk0AwhLwUO
 nNAIZHH/kED6BOTsIAByYuFmzHyANU67/SYbFQQQoE4kq4n1jurqEjareu922xnVfAHJG1N
 7tJJ9KRwO1tWHFdmRQWZZp3wnog1iq3As7/+N1TtvZut1VRYnqdc1FnNoxo/RNwZ2y1PgWa
 btWFX79xY+Y7px8duxvBpHdPg0PGfa5HR55CAb6BTCZ7SxupXug5zYH8KH5wakiHluAOvDu
 zyRv0nEWhr2Vd13UdPl/D2g1wBfVdRrKMI9NnPme3tPeSL43i6irQ4yF56MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784126822; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=nGecurzBYdjUfiEExv0oL4FVVbYZSUEIMh9OhYH+0R0=;
 b=zG+fiHQ4maO97y51KnLvqWMb1rAMlFEabz9U0u5r8g+wlBK+t+kZ/t5BrU6PDJhxxIbw1
 3YWj7igv468sx+rdQucJFGVe0WUHB9D7eO51n4Y3JqfnmPL1lYVu0waLLovp61GT9GiT98B
 7znrqwES/Akknx/mfSv6WDWYCv2FRSBNnVV7Q+UctGAGj495ea4cjtuNIovvxbHi7LaBvAX
 d4iKw1LKynlBxCqbhqEJkeUZQxT1LpCFOe7EVmytiX9sHxA7CUmZT1KiBRuLLiCgb6du1Ek
 pTiff4cmuxb8a832zNj2hh/nPATwx3ajXTdOXwCbErS0IpUea10Q5VzN+k4w==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=ziepe.ca;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=ziepe.ca;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 96F5D46CB5
	for <nouveau@lists.freedesktop.org>; Wed, 15 Jul 2026 14:46:59 +0000 (UTC)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
 [209.85.217.46])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 779AB10E1D2
	for <nouveau@lists.freedesktop.org>; Wed, 15 Jul 2026 15:02:14 +0000 (UTC)
Received: by mail-vs1-f46.google.com with SMTP id
 ada2fe7eead31-737de52625cso2581968137.3
        for <nouveau@lists.freedesktop.org>;
 Wed, 15 Jul 2026 08:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1784127733; x=1784732533;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nGecurzBYdjUfiEExv0oL4FVVbYZSUEIMh9OhYH+0R0=;
        b=ddqtysqtjsXrr5GwlWp0+DlF6mKnACHl34D9wMG+qCmaa81DisL9WSThEnKKY76pyX
         H7AAu9FMT5shPwPI0gLYSVEwtGvfo68ThzXxYVsXSDH2WnVSfvPEvWjgQor9wKwCYXXq
         4JD2/zb9JbmkSVMDCduLbKlC04lE6ahFxxohYH0vvHWNai0rq14EM1xWawXxYAZ5d7VP
         BH1NGBy0DveYXQEV9kXKj65sN66VlTOtg83jC0/qbo2voLjPWsuIHw1iQd0ZmEuzMYRx
         9MKHN5hU6Zs5oZlEDg67waTt2bO00NvuHD4ZmLoXca2JnwVPoC45RnQDvZrZkOmazycQ
         eSXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784127733; x=1784732533;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nGecurzBYdjUfiEExv0oL4FVVbYZSUEIMh9OhYH+0R0=;
        b=OwNqfZkqw8nsawoc+XH8ZMSiy+kwcJOrjSMZmV1fq+ML///9nM+LoQRtf5A3GSviV/
         d+koeAyVY4tVlmTBRQ29eaxVTRVPg0QJJ5EpBBCjfQFgTVqYD049xuhYcXzrmJiuP6Ew
         6NY9h0+rz0N/6/bQEDNWuKUm1TNwhqs6NcVgzxWA9zOo2Vw33UGtYOdvuQpTlMuYEr/E
         +TfhUBOAJ7y7m1xcNvUKMUwClsKhi+QDe5cjoLgCNtqG7RqgR1EZPOtlj0MHOUGxLqbA
         yonA04LnLGvu2pcQPKlSlBSEf43sAdv3EWo85zcWGzLYoy+JgpA2eQjkFOjYNdW1w5PC
         73cg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrIiVc3pMKGMphadQcWjCAwcqCgiC4KHA4rpPAYTmLgyCAD6Xrkp7h4bijL+qvWNCV2VnLUlm4x@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDKcO2XdDFnzqjZq9kDnEwsAbwLky78SDVZ2MTWd6aIMPaBXi2
	SbfVGpDDFM/PY8OcXdg2ykR5U4473vT1SfBXy7SEdokvPwUaJVvPdiKYl7kV+VHvuUQ=
X-Gm-Gg: AfdE7cmrjONY0hJWiJ/jRMdZvp1PMIdd0zpVfQ33IXp92CsLY2OCWagaPZeIqfvqWTQ
	9m95NMC7xM4VdDe2KVWtym0vvAs2FJXVVXD1KrK6MD1Yv6w8+DWO8vZLrwV5NhYZew9EZGhvP2i
	RRI5zyQeX1fYIV13DWpmQFHmcEnFm5G2H9YOo66QVr8nuSSGJI/C1fjHh4X5updv6up6L/H21AD
	7VbnCc+5vnPhR95hBgMr22HKrephbQ1sMhqlLfC7QzYQ3bCrZly6BTK8EKJYuEhqbE18sWtDgoL
	kTbb7okFa+pj2ELwX+9326AJJKIYysyUEOrMmw2Ex3WgwSv+oZqzxzlIw2O9mevmzzYWB9hlo+1
	cvXo8gHxLb3/IfQIFfRprJQrP6gaBUNb6zR66HHQa8JxdJJC8/nmHC2RQwguW
X-Received: by 2002:a05:6102:d87:b0:737:9edc:36f6 with SMTP id
 ada2fe7eead31-7458757b204mr4167130137.26.1784127732764;
        Wed, 15 Jul 2026 08:02:12 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8ffd50e0811sm196100666d6.3.2026.07.15.08.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 08:02:11 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wk17i-00000000TXQ-3Nvp;
	Wed, 15 Jul 2026 12:02:10 -0300
Date: Wed, 15 Jul 2026 12:02:10 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>
Subject: Re: [PATCH v2 0/4] mm/hmm: Clarify notifier retry state and scope
 HMM timeouts
Message-ID: <20260715150210.GA3846105@ziepe.ca>
References: <178406760622.1106335.2379450382728057793.stgit@skinsburskii>
 <4300f09b-8f93-4605-b072-7c09a82cb16e@kernel.org>
 <alecaJ1FUso39D9k@skinsburskii>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alecaJ1FUso39D9k@skinsburskii>
Message-ID-Hash: ZJB5SZOPMHNF5PXIRLY3QBU253TK5EXH
X-Message-ID-Hash: ZJB5SZOPMHNF5PXIRLY3QBU253TK5EXH
X-MailFrom: jgg@ziepe.ca
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: "David Hildenbrand (Arm)" <david@kernel.org>, akhilesh@ee.iitb.ac.in,
 akpm@linux-foundation.org, corbet@lwn.net, dakr@kernel.org, kees@kernel.org,
 leon@kernel.org, liam@infradead.org, lizhi.hou@amd.com, ljs@kernel.org,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZJB5SZOPMHNF5PXIRLY3QBU253TK5EXH/>
Archived-At: <https://lore.freedesktop.org/20260715150210.GA3846105@ziepe.ca/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Jul 15, 2026 at 07:42:48AM -0700, Stanislav Kinsburskii wrote:

> > > Stanislav Kinsburskii (4):
> > >       fixup! mm/hmm: add hmm_range_fault_unlocked_timeout() for mmap lock-drop support
> > >       fixup! drm/nouveau: use hmm_range_fault_unlocked_timeout() for SVM faults
> > >       fixup! accel/amdxdna: use hmm_range_fault_unlocked_timeout() for range population
> > >       fixup! drm/gpusvm: use hmm_range_fault_unlocked_timeout() for range faults
> > 
> > Why a fixup series instead of properly resending the full thing?
> > 
> 
> The goal was to get a Sashiko review, and v8 has already been applied to
> both `mm-new` and `linux-next`.

I think if you send the whole thing with a base-commit tag that
specifies a real base commit in linux-next sashiko should work

Jason
