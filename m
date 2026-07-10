Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6CAFC43458
	for <nouveau@archiver.kernel.org>; Fri, 10 Jul 2026 16:27:57 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4C94B10E1FE;
	Fri, 10 Jul 2026 16:27:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="lUhSTfeD";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C1D3B47013;
	Fri, 10 Jul 2026 16:12:51 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783699971;
 b=jJGlA+Mr0SFNqnZ5XMatjtSR83mrqtqdVH6TQ38QmizMHZeW1PkSbFdlNWUdoE8qxubaF
 jeb7ung9pVUmO0nYoerl5YoBhWkQGy6DPruB9LtJI8rkWRphuU+L1Vm+ScNZrRUReLEXtV5
 1zljZYDu4tvKk1dXZMtoVlrzU7ZwxSRHlBnm8xErs84nZ4C7/BiymaSdTL/gLsQvhAuyaLZ
 4G6wrm3a6rOlBNE6oTtIj5+gsv5xB8PmqAaVDRicvOFVGwIuhU6zvyIxDUYKF87TJdlNhln
 PqXCeCmAR1lflJmR+hV9GVldsPy0aH/UU7NUofE96hEhdMyicYDntcPc6HBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783699971; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=UNIXCm8Zus/z4nQ3xLBTLCwOawMM/+5sDMMsd2dm66E=;
 b=xSYJ0yHJpWDn2hCxcfNmBCJe6flrfoi/ULzCFQyH5krgbSE2puWqhov3hl934078a5z+d
 FobtRdhVuwZM2Q2kTX4b85U5SQMOwiYbAcGF2ajzYKhFaxL59ewFjAjgIePRO6MigrYY4zW
 iHxDe81ZCtExMVO8GgH9GeS1Fu91TBtZcddrlUEJOff1cC+Zof25wXZBNeUugTWwaEzKSv/
 kjJLoA9Lam39fHMBMKmMJaNkZNVH0m2vN6CmSEPhjSR+AWTSVk0G3YYLJJW5pX7XJGg4PTR
 7JmWqEYKr/Fne27/aMkE2IZsYcjfwZYwbKegx8J+Q3xJ+Pbu6RIF3p3tYneA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=ziepe.ca;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=ziepe.ca;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 9269346F4F
	for <nouveau@lists.freedesktop.org>; Fri, 10 Jul 2026 16:12:47 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AC0C710E1E1
	for <nouveau@lists.freedesktop.org>; Fri, 10 Jul 2026 16:27:51 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id
 6a1803df08f44-8ff88549786so10835686d6.3
        for <nouveau@lists.freedesktop.org>;
 Fri, 10 Jul 2026 09:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783700870; x=1784305670;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UNIXCm8Zus/z4nQ3xLBTLCwOawMM/+5sDMMsd2dm66E=;
        b=lUhSTfeDfk+bg+ysWgSxEwepr7lUSOK4dsEXuUVzAajIZJrPEon47+NURKlAA74I8T
         pU8LA0mC/Eo6M29vHAt3HmWEGidwOyVCaxh79STxJm1UDa2DU19sjdauwwIuy11bFo4r
         HkuUZXySNNxUycwRUQs0TacJMWNRpwS4aSREXEasOrhfLIzi4b51uCBa7JlVLBYr9Rvk
         UjjGgjHcbSzPFniUXFrqs9A8szByRZcvy5PpCjzzE4K/R1IudQrlO5X0X53JSkIb9AWq
         5IHqW61bA6ZRdtroZqc+0T3KYGBiAXYgPLKUkRfJMo8Asvw2FqS6mbIwfj0IJlEc1YRU
         tj7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783700870; x=1784305670;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UNIXCm8Zus/z4nQ3xLBTLCwOawMM/+5sDMMsd2dm66E=;
        b=sxTzTH1iWvZb/d6Nqm10e1haL9bqODy3Uf/uYU9DZeAW99BcZDCJ1Ny0ekoV0IL/M9
         RnOp61h4I40dJP8ir8Uj/SLiT0bhAbXfSY3BxbyBSshX0CQm3ZU/UM0liJJv302MWaWo
         +goyhm5AFODVmTFJ5COYnUMjqdlzXg0wP8Jo1cAUohda2SDVCJrWrC7wffUx9citBYgs
         5/fiZ3dS+p17y/jPH5QIBzy29aTRSu8uX81dIMxELzksUKJL8r1Y8H4cmi9Ley7KphH8
         1bgV2zh56vNx821bVRXvzKjwwJebhHHp0GMl+g/gsDBoEkJXkKIdr5WZKsatOJVhIKsq
         nBag==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqn5737EQhA8hsTDfw2DmRMhcCYSBIQ/iKeauaOvzL1Nj/jLJHImFawc0kds0GT7qKz0Vmenm0N@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5bN1vAnh4x5PkDjzbUI3pcRyvgkKoFSUtVW3XMh7Mp9MEFF4Z
	o7cUAg5keg2Or7000TflFabht7m0+0Yx3xW3o85HAfWIhXvdnGwgfejFol65JWC0554=
X-Gm-Gg: AfdE7cmWqKDvvqA+a8sIPSGu+FHdVtz8JBknPFnZk8UqH7gr1xqgdRmjCWQZPwbUpe2
	bpaBwyp5keF+G7bDDjZaHfVjBvS21rFriqMPr+8UnmGhg5KeARWOq25SkyBYkzdRcqxuzpjcTgd
	R8XGDfv1JV03EdENJ778LxeUygTCUMwC16giILg2ZgYxo6Ykm3UHUf6z3aFyudM+3zttKXmJrB7
	+IL/9noxt3Lr1UcA9vU47qvpm1B3UN7slrdMnj/6OKUCZct6o8kCuxZXjdAuCvDmcsWEw8hIm6D
	LKQyac2VODr2J7AVADSChpGLCerSF0tgL2+hlYI9Yb/6qbds8AzwiPgAq4I71Po683jmy1f0iWs
	CEiNn4p5GrX58smStcJZMRrHICMOiqfcv5bd010b31XmbwbD5trMt0mpbe8pz9vbpkimB2AU=
X-Received: by 2002:a05:6214:2127:b0:8f5:eea1:6f04 with SMTP id
 6a1803df08f44-8fec3522cffmr120531466d6.54.1783700870475;
        Fri, 10 Jul 2026 09:27:50 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8ffd50e081dsm44781476d6.9.2026.07.10.09.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:27:49 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wiE4r-00000007XPF-1WDC;
	Fri, 10 Jul 2026 13:27:49 -0300
Date: Fri, 10 Jul 2026 13:27:49 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>
Subject: Re: [PATCH v7 2/8] mm/hmm: add hmm_range_fault_unlocked_timeout()
 for mmap lock-drop support
Message-ID: <20260710162749.GP118978@ziepe.ca>
References: <178345345668.660027.2952911919681614557.stgit@skinsburskii>
 <178345362182.660027.12809852179204464964.stgit@skinsburskii>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178345362182.660027.12809852179204464964.stgit@skinsburskii>
Message-ID-Hash: XOKVTRIIJBXXR7GXHJCSQOOBZMST6N6F
X-Message-ID-Hash: XOKVTRIIJBXXR7GXHJCSQOOBZMST6N6F
X-MailFrom: jgg@ziepe.ca
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XOKVTRIIJBXXR7GXHJCSQOOBZMST6N6F/>
Archived-At: <https://lore.freedesktop.org/20260710162749.GP118978@ziepe.ca/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, Jul 07, 2026 at 12:47:01PM -0700, Stanislav Kinsburskii wrote:

> +int hmm_range_fault_unlocked_timeout(struct hmm_range *range,
> +				     unsigned long timeout)
> +{
> +	struct mm_struct *mm = range->notifier->mm;
> +	unsigned long deadline = 0;
> +	int locked, ret;
> +
> +	if (timeout)
> +		deadline = jiffies + timeout;
> +
> +	do {
> +		if (fatal_signal_pending(current))
> +			return -EINTR;
> +
> +		if (timeout && time_after(jiffies, deadline))
> +			return -EBUSY;

I really dislike there is a timeout here, HMM is supposed to be more
deterministic. GUP doesn't have a timeout, what is this about?

Jason
