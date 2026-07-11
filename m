Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4965C43458
	for <nouveau@archiver.kernel.org>; Sat, 11 Jul 2026 03:16:47 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 900AB10E711;
	Sat, 11 Jul 2026 03:16:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OcgZfLzC";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0494A47098;
	Sat, 11 Jul 2026 03:01:42 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783738901;
 b=R9nU+52xO23Dbim+c5Lbqb9LEeQAIdcg/5AXrGVcrEmiQJ98U53TUXSICgQY7FdWCBvYw
 c0J/HOmgS3+VBbwudoLbfnPEYIGLrQ67sVmbgiR+APsnXVsruauV3Jl/EtV/8vJvpS1y49T
 Ur73zAy6GRYD7zxBAh4YwKQ2eE/n1BOvSlCgD/xugQqcSFUhedFE01vlp9b484POddBQcDi
 u9vsDEW5yaAOH7McPM3M0ZOI5wPKEr9CKHfKh0Fqn/P0Im5IeoTQcIi6Y3vbTxcVIfYg14c
 eS0voTdmBBpnrb0WQvkQqmkgOwlQs0D/8LMZaVYKsErjKW86FLLnvA9ZRhJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783738901; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=FBlRq40n+WQNoah/jqkKv0Mdb6DSXF7flMHY66vmfak=;
 b=LzZyqAphrQJLdw8y6/WIRdslaECF4jB7vJaLT4eAthcpoVj2/5N69vbZwgGt+B3o71gDh
 OijlEtLFs02s5lZzUnuTmVDiMbbrHznJMkmPLs/bSIsUOLT1p8Z80P/JmD/H8NAeciGZYen
 XdpAwnAJjsGrfqjRw2Kwin8WH5RsLfOOSqPfWBjwD8igy07wCS44qGUw5bsdpvSM94hmdd0
 xICPGqoenS4s6xXYuhy8wNBhoApJtsIECjzzRbIh/HdR7HscdPPjiGn4k2wQ9h8OZS3ir0p
 cta8CoAsj28p0MGKe2h5MeBkCOzGb8oezkvNtJG/EOmDURVQA/Z5IgttzNcg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 0116046BC7
	for <nouveau@lists.freedesktop.org>; Sat, 11 Jul 2026 03:01:39 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 56E8D10E707
	for <nouveau@lists.freedesktop.org>; Sat, 11 Jul 2026 03:16:44 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-8487214ad2bso2030815b3a.1
        for <nouveau@lists.freedesktop.org>;
 Fri, 10 Jul 2026 20:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783739804; x=1784344604;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FBlRq40n+WQNoah/jqkKv0Mdb6DSXF7flMHY66vmfak=;
        b=OcgZfLzCM5pp62rEMe7uHm6TGnAG+n81jcNeTUO2pE/r9v7Lpadbhp0BhUNsW6latY
         xpCOT2zYk8Aav/NNuMk9+J652S5NWFJUL/g5jqW81PbdLiKQ4dz7kd0WqgS5JFtzcYft
         pVmWtmikEFerrS7MKxYFtta86CeDhRAqf2a4mNMrHygCwbWOOxFG29sjVUpywqhr94rv
         Nu0ki0iS+HnhzRa8wr5sMCe5XV2yjb84WmPtyM33Pe7RakqnQsuIjH47pjaPcvHkMOR7
         EqQkGxPeQzwC43NC40I9zcWRkwWHbF9TX3x0pvdKOec73w3RzSxQzmNSv14fabWzwUtW
         pFcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783739804; x=1784344604;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FBlRq40n+WQNoah/jqkKv0Mdb6DSXF7flMHY66vmfak=;
        b=ihFEhUECvXaNuJpzcDzcHjOQJzJ2rUrFwLcV0SZvNd2UW0zFQ7UoDLcLns7LU+yfZt
         n//C8z+ndTLKmb55P0PYwqwAi3AX+yAQYd0rXiXJKUsRi36Du9J3eW6un/Y/Kqk5TFMr
         So2RDqvRoUJZWMr4Z1IWv12acczazQxX6bE4ZCVpS1/GpVjMIcpZO1hxifcSX6S5h2tC
         Thc0K3Ypu+c41gkk+nHDTBtF7koAw5I4acQVEYpZ2hFB0dlsFBRStD0Pequ0FIAVjY6l
         cCHvz5KKgjWtWGVYpD+mGsot2K5yz27P09lxtdUqeSUhBLtShP48Xu2a/fHHIeajjU2O
         Wurg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp6bB059Nz8fu6Wk4upwEkDaPjNQ85+xpn1axWR/vL1IbxnaviC/17cn6bjmJqT7s1oL0c6+lHS@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwcxY4v6z2sR0XZ3IzWaqHb9ubiin7CO2zoQTUGt5MH+CCnRp6Q
	MLeSThEwseJvEWLLzDu3Qwbq4Mxs1KwWEcuy+GpY5xXa9/qJcAjqM6fs
X-Gm-Gg: AfdE7cn/XwiRJIWnJKRSv8DHvaLRqU6vtDl7BdhDfDleaeUTO+wISll4nFFGplU3Yxn
	sQVttkji+n2kvzyoMY0fA3hlPRAaIjscSlVrewmZf8+zFyQeFAETWa0bBQrl/J6YCYsEPaJyQN4
	ilL9sM93Fx7nZLT09cpTNQi2LVNURHndCcnppMkoV3akqy6YHJpPTTMc9y5HF+kseS4dCcu8C5g
	prvR59G759OJ+whQn31uRPdxGFIrDZLiKX97TVoMtyflrYbPi3x0XDPdGVBKxZcb5CAiQYx+4UH
	Kvb7Fzop4yK4dTZ7M0fypjr828n4LGROuzRmLty9vK9XrgTzGBwzqVpG39dJs0evNKk3xt9lQcs
	roplJOIZmvmlUPQl2sWyxjU5caN/h1Go47RwCvI89+np9ursVd35N062f6gUQFoeTJpuwjANljW
	vq4kHXbyevgewOAXPSfaGE7g5L0NKZ3anihnlJjQvod8pnz/LWLRtbNEk=
X-Received: by 2002:a05:6a00:b4f:b0:848:2f77:e2da with SMTP id
 d2e1a72fcca58-8488979d33dmr1391764b3a.67.1783739803838;
        Fri, 10 Jul 2026 20:16:43 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84870d76ce7sm2041406b3a.55.2026.07.10.20.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 20:16:40 -0700 (PDT)
Date: Fri, 10 Jul 2026 20:16:35 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v8 5/8] drm/nouveau: Use
 hmm_range_fault_unlocked_timeout() for SVM faults
Message-ID: <alG1k3JsoywE2CBM@skinsburskii>
References: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
 <178371881847.900500.8789369230260725500.stgit@skinsburskii>
 <20260710151222.ddb35eab9c81a8720491464a@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710151222.ddb35eab9c81a8720491464a@linux-foundation.org>
Message-ID-Hash: EPM6AEDFHJKR4MP4ZZMSOUSCJA5GFD3Z
X-Message-ID-Hash: EPM6AEDFHJKR4MP4ZZMSOUSCJA5GFD3Z
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/EPM6AEDFHJKR4MP4ZZMSOUSCJA5GFD3Z/>
Archived-At: <https://lore.freedesktop.org/alG1k3JsoywE2CBM@skinsburskii/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, Jul 10, 2026 at 03:12:22PM -0700, Andrew Morton wrote:
> On Fri, 10 Jul 2026 14:26:58 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:
> 
> > @@ -683,15 +683,11 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
> >  			goto out;
> >  		}
> >  
> > -		range.notifier_seq = mmu_interval_read_begin(range.notifier);
> > -		mmap_read_lock(mm);
> > -		ret = hmm_range_fault(&range);
> > -		mmap_read_unlock(mm);
> > -		if (ret) {
> > -			if (ret == -EBUSY)
> > -				continue;
> > +		ret = hmm_range_fault_unlocked_timeout(&range,
> > +						       max(timeout - jiffies,
> > +							   1L));
> 
> "1UL" here?  I'd have expected min() to warn, as it likes to do.

I'm not sure... The "timeout - jiffies" can become negative.
Won't 1UL convert both of them to "UL" and thus make the comparison
overflow?

Thanks,
Stanislav
