Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3035DC43458
	for <nouveau@archiver.kernel.org>; Sat, 11 Jul 2026 03:19:56 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0D51710E71D;
	Sat, 11 Jul 2026 03:19:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lVVLr9b2";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 814FA4709D;
	Sat, 11 Jul 2026 03:04:50 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783739090;
 b=YfvyL+H+n5qGa0AX8QmwD6sncxV+/+fPGnKO8nTvgsrSWWGQZkZ2TgYeA/e0ypGYiGXQP
 FA0/Bu0JcBaTh7tYx+nbwsveKUlyUgsucws32AJatPKVbB3nf8wKE6g7V4Gjglxh9OPlln0
 /7Fdri+pXuRU/kF1BkD7IjpHwPCSpCYH0nEYLkW8uWqUmyWZgW5fbK+su8v7U7gu4nBxvgI
 K8CyFJUbOBGyzZzPVxUvgS76X7rGRC3CTU7Wc6ACIs5+WB2/mCzWsPHczOFHp23wzjnnHVP
 n0W30cLVjgCaeqXzGd60n8Qnoj6pbq+IQl3NpA1cV+/Gk7h4dcL30FnpMchA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783739090; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=CYTaMzfdKXyQ96IWRR1Bd78qVpBo65z/nucHslKEHMk=;
 b=H/vLe1Hk9niBzu5hr1XThTzDKDBepE6AISd5Q+6mpmZjhgrfspsHKyR60TlTAb4MQHrMz
 b6q/BMw6g+TbLGHvjzMYZQaIO2GRBVNfIT8qiItgIM6VFR9Nv2osHgM2gY0nifVby6L4cQL
 q8hA/oxW4dEliV4E2oBBOMmSejl19/l1/HoCpnNHBVdb2LYbcxVzJqHOABfprGdCaA65Fzj
 oTm3EHpdo8iWunvNQL0SbPTR6RX0hn1mQ1PrxEZtBt5AQ//B5wPgQS5J+mdGNRbxdMeo/37
 8D29ttHqEzG7YcejFpQTx/DuvXJmCHpSN8H/8AZyC5w86Fx1bZ8h0leZKUHQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 5659A47095
	for <nouveau@lists.freedesktop.org>; Sat, 11 Jul 2026 03:04:47 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A4CBD10E716
	for <nouveau@lists.freedesktop.org>; Sat, 11 Jul 2026 03:19:52 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2caea3f742bso16886775ad.0
        for <nouveau@lists.freedesktop.org>;
 Fri, 10 Jul 2026 20:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783739992; x=1784344792;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CYTaMzfdKXyQ96IWRR1Bd78qVpBo65z/nucHslKEHMk=;
        b=lVVLr9b27LXGDr9B4nnT9eA02AX0bhioCbakpGalCwbm9ZoRsFYC8taEE+dIuqPxPF
         RQWnFvwv7LPxPPjexTXWHgmyFxKfpt/yti9iJweb/3hbWW/Dc19MinS6SYW+XGTCWuIk
         livck9mQR++WVtS9zCpKD3kVoE6QSn4YETj1bscRPY6H4ZTBrS/pcSB3FOXeVlf+47mE
         Iqu3Of8YQn33VoGIOkXmrbw8asi6araXfkz+Yfm255XpwM2nQ6Dqq3zRTb8XVWs0aQY/
         SWXLSj3S59aTVACGLIWkFn5l2lzPgJSdTDRGxg+J+o89W2YM0BGQ8prvhcjp46X7Gp02
         fn+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783739992; x=1784344792;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CYTaMzfdKXyQ96IWRR1Bd78qVpBo65z/nucHslKEHMk=;
        b=CyEWFHTIojihEYPcnUP+Wkk0GQReT0HSQXINa7KOOvOWb0SHAVbAhDTA5gWgbfQtrP
         2d+8PEpuepK/M5RvipQvUEN7UXcwAJtl52xnAj5KrVn+N9QVwYbZfq/SE8ZhuZ8FKWEW
         qBPoEJ0L01XLwBmi6AomGGfy42yZuixUVb/cZ37HCdEWOBt5DVvcnHzIu/Wg/FmB7PpD
         ZyW80pnXPNobsbLMEBNm8CTb2+nTSzSq76LG6bPmOav6f+xCRJk48/V3oRIPeOJtNWbI
         0AxJxWH8ddOGG7yeMEqBijRoOh7OL909ccQtdzcP0cMbufXKNtaLZtpfWed3TlNxsCxP
         evNQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqhS2Clmk+dV2si1tNqvK/DqNYqhzRUMYbzR8BBxZj1gCPsfjuTw4SqzkAQ2l1ta3bOvwLRyhm6@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHun+LKSixzKDpvT4rtJFnDzz3ZBNyAJ1uCHMAG6mv6qVBGDBl
	roV99hsxpeQQQZHJIjux1gyXC6CXOlkvUtxrtYg7Ec9NIFdVHEOCR6zU
X-Gm-Gg: AfdE7ckeMOKGGvUVtezwQgG1Y08ZiWR2Ed6FADzTjqB62ZW4tp5qk1V62qhrQHD3MwX
	zKfqwArkWCbeKQWQ20nkyZVzllVhpl5FeLCazitV0iFioL3LzqiCUQTUYB+/GKTlDbf82r7XvFx
	oKXVsOi6javO6yRLc6PbLtDCafG+hrmORrmTKCgMUvC4s8prKqHIdsRryEf39vuk2Nf6eNlQEHw
	71fBLT1QnnJAWZxPrccJpbyJZDFboulYpnSI8YosXLcdgB5CnSmcNhSLvPfIgOPsI1DjHr6vDLu
	JELh65NryN4KHdfxqppILIT2hlm/6bflYGXi5cJiLcWju79LSoChhNdNktAQ56Q6QrgrYj9tMGn
	zEDzL+yab3gOzJxHr60J7bUc6BRTQ9SS8Cl0qoqFObJFkRK+c+tZNNZoC7PxbMxvge7Gu7lBrTs
	2qR5GRQNbAbScnriNnaRct7mWyuJANa/fk8h1UObP8tC0zFigO8NFzSdg=
X-Received: by 2002:a17:902:d2ca:b0:2c9:97a8:8c1b with SMTP id
 d9443c01a7336-2ce9f2948camr16114365ad.46.1783739992132;
        Fri, 10 Jul 2026 20:19:52 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9d5bdddsm67571165ad.77.2026.07.10.20.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 20:19:51 -0700 (PDT)
Date: Fri, 10 Jul 2026 20:19:42 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v8 7/8] accel/amdxdna: Use
 hmm_range_fault_unlocked_timeout() for range population
Message-ID: <alG2TldWdL8Ez8Dq@skinsburskii>
References: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
 <178371883276.900500.12789147320642521200.stgit@skinsburskii>
 <20260710151228.ca22e127b93ec5c6d591fb5f@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710151228.ca22e127b93ec5c6d591fb5f@linux-foundation.org>
Message-ID-Hash: V3FYMLZKKFCDVT7VOL3G7K3SXINX7XWO
X-Message-ID-Hash: V3FYMLZKKFCDVT7VOL3G7K3SXINX7XWO
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/V3FYMLZKKFCDVT7VOL3G7K3SXINX7XWO/>
Archived-At: <https://lore.freedesktop.org/alG2TldWdL8Ez8Dq@skinsburskii/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, Jul 10, 2026 at 03:12:28PM -0700, Andrew Morton wrote:
> On Fri, 10 Jul 2026 14:27:12 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:
> 
> > --- a/drivers/accel/amdxdna/aie2_ctx.c
> > +++ b/drivers/accel/amdxdna/aie2_ctx.c
> > @@ -1061,22 +1061,11 @@ static int aie2_populate_range(struct amdxdna_gem_obj *abo)
> >  		return -EFAULT;
> >  	}
> >  
> > -	mapp->range.notifier_seq = mmu_interval_read_begin(&mapp->notifier);
> > -	mmap_read_lock(mm);
> > -	ret = hmm_range_fault(&mapp->range);
> > -	mmap_read_unlock(mm);
> > +	ret = hmm_range_fault_unlocked_timeout(&mapp->range,
> > +			max_t(long, timeout - jiffies, 1));
> 
> max(timeout - jiffies, 1UL)?

"ma" for sure, thank you.
I have the same quesitong here: will "max(timeout - jiffies, 1UL)"
handle negative "timeout - jiffies" values correctly?

Thanks,
Stanislav
