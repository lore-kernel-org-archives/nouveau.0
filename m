Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF3F4C44501
	for <nouveau@archiver.kernel.org>; Tue, 14 Jul 2026 16:09:59 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 98BBB10EDE7;
	Tue, 14 Jul 2026 16:09:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RIx+isyS";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 40D3F47154;
	Tue, 14 Jul 2026 15:54:46 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784044486;
 b=yRulQ7apZpQADO5XW4CLAtilZ/228fHpiHOxAlX6diw95AOfL7+g5nkI/zNhHCnxSH7Ij
 M8lz+xVz+IxLRY1AUY0qEPzAlLL4wOGErf2s3kdq860LHXeRNQtMwZGpWvL6k/M60rgM8vU
 n4A7a6Nit+kD30jgv0Lj//Nk+maumGo2cn1CnWrm2VZjtI7j6Phfxs9I+K9a4ISfpXD6fIf
 Y7v782yVWTwyaXk+onImu8W2yhaso2T+FwY+3Cv80j2ko+H9IQqjh3hjW8jckavtzZ3GRbx
 6/pKKaUT64gnJlGApDNmVVpDPzYAADvmsoefPkn+/sK5Fo11Z3jVBt+TntGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784044486; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=kdgMbrcVylxaBaGAreEv3T5etD7pXeCq9ZAv6P049TQ=;
 b=Tj6LVv35oCh2cP13kMGqQlABl5PSa4eNnR/zVpuLjrFZ0BUpzUH8Z2Yu5EUi1QEsnKjL/
 mykNgd9ypiJZVeUU4YCIIzvYXsWUQi45d1NwP3QCWTOTpTqrWk3+WPMgLaYwKMflbIn+yoU
 F5cyAacOOztMW4Xx9zwiQenuVWX8QZ8X78kNGad7yP7yONCClSTTsJmj08NAwl+HM2BSRow
 O7SYfOJtV665nbDySnmtzj970/NeeKebxttgo38qMOhOWp60fcnKdHAra4MQIAN9VDeMbSr
 3bkRkJ3qhef1f5wslvrdNzNboRR/FTcistCaR+gzI7pjWlOdkIs2qCQ+DhEg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 38F6146824
	for <nouveau@lists.freedesktop.org>; Tue, 14 Jul 2026 15:54:43 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5DDC910E075
	for <nouveau@lists.freedesktop.org>; Tue, 14 Jul 2026 16:09:56 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-84830c774a0so971131b3a.1
        for <nouveau@lists.freedesktop.org>;
 Tue, 14 Jul 2026 09:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784045396; x=1784650196;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kdgMbrcVylxaBaGAreEv3T5etD7pXeCq9ZAv6P049TQ=;
        b=RIx+isySTjzsbBbfc0YR8RGG28DW2XOT1GUX1adp0MpZZjHHtU5JBxSszEsf5m4mIf
         8fY6Tvemd4qr8MMdnrcmqnJ02UlnSglQvnGC1AORwdWHm7jpgOiOd++PTlX6Tq4ybQTK
         rCwAwrOiBaFpTtevi7Ywtv+48CjQ7TjbuWxvFWB7jqenjOSo1pU0/hz5pnD13EdfYA4C
         8rbc04bpXHXKHAXtRQe8KwvcENFSzcooL72MVDL2mXD42Mo5qrTcc+m4bh9FDfo0yGN3
         FUlDXaF+yFenn+v/kKX/nLZGj1xZyb063t9XCUtIuGJuLPHwm6UZzo+6I/ly1FNeOqjY
         q4Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784045396; x=1784650196;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kdgMbrcVylxaBaGAreEv3T5etD7pXeCq9ZAv6P049TQ=;
        b=LR5eOLxW+UhdExm+iifvg32YpwczaCbweaNyuV7Di5EVfqjq9rcb0LPEewVqlrCKsN
         8lyD+YsxTmqaGvKHcThGSQJNtiu93lXS19qA8XaOcbw0uV3BE1lNFy4Dy3OH2WyWSs+c
         k1oaSZ4EhYZiwZbA/gQ30jLeEQJPVJgfKF3PzTOwwR3zBL+v0vaukqFMYm3xQmSiv6sY
         HB5O1nr4yZw0a3vbezXnm8eMdoHt8pqgTGoK3rb7z7un9ieDmiLaft8pSNB6Joi6vKiw
         CL+Jd05GpyBAPqQO3ZHH/Y/LfkzqSenCep4Z6O9Aq9UInx3SuHUcrxHHUocuos+JK8uB
         X/NQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpvKD2ieBZi2dVVrkYtsmwEKbAHp5zpUUlUD59+NDTshsLNthz7qF7KdWyZFQ8ak1r1KUka0T9u@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzV/XE+BtgOwR/HITFH/2OC2/n0wmWn38F4YuXwdoRuaujg9aWJ
	7VwF94DoKJAH4aaWdVWKbx/zNG8hVZbh7uUAnxiqnE67x0UWShQm3dS+
X-Gm-Gg: AfdE7cnXCI2VS2lulSinDCMPenOuppYq6kSAZI9bXiMQ6g2ri7/VtHJu8LRMyk9uhjA
	01gm7dPcuqem+EGPidyZ09l/uGcK8DzDsZgBXHpUOL09tuaY7OjH2qcjn5a2z3cPjAmYV64mK7N
	z+8MPCkl9EJ/KCPVkLpI4V70QaaC/ny+C0TtImB98HKHdlM4lkecifEWBVbb+qflwWNLRb5Fav9
	7MRIdgX1FCjVXxJFsXxj+UVvjSgl50Z+uBCXo5+2VLzmeUleUz3bp7FzOMdiKQAqpM0Ji8tEx7x
	39b8yZmF85GKZWYTkQuHXOGTAntpHvLSLO2Lf7b56DeyZfscn/+7pNaaseQrMUJwMf4rQbarfGw
	PV2Yl0VpqYLMeLd+cGkf5pdk8PyhnPQZd8JJ4P6H+f4nWWR7dJ5J+m7rLVBJBqzsxsBoStxEtKT
	AhhOUWDahPQsLNmsT+eSGYlORhjUMFQubLrpsNYXN5l2/dDsW+vklsF+0=
X-Received: by 2002:a05:6a20:d70a:b0:3c0:b55a:80ff with SMTP id
 adf61e73a8af0-3c11063d595mr15198722637.24.1784045395651;
        Tue, 14 Jul 2026 09:09:55 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ca5b31628c1sm10020860a12.19.2026.07.14.09.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 09:09:54 -0700 (PDT)
Date: Tue, 14 Jul 2026 09:09:51 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v8 0/8] mm/hmm: Add mmap lock-drop support for
 userfaultfd-backed mappings
Message-ID: <alZfTxfypj39OrCE@skinsburskii>
References: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
 <20260710151151.1e193eedd0cf2591ae392f76@linux-foundation.org>
 <alG2-RSitzPWClAX@skinsburskii>
 <20260710224950.53bcb43ce7e564f07a1f6a8c@linux-foundation.org>
 <alVRU38lMfvmUFqJ@skinsburskii>
 <20260713154535.7656b3a630e2f6f076b4e76e@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260713154535.7656b3a630e2f6f076b4e76e@linux-foundation.org>
Message-ID-Hash: AVNRBIDJBLOKOWSS6SFKJIHYQCUBCDKY
X-Message-ID-Hash: AVNRBIDJBLOKOWSS6SFKJIHYQCUBCDKY
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/AVNRBIDJBLOKOWSS6SFKJIHYQCUBCDKY/>
Archived-At: <https://lore.freedesktop.org/alZfTxfypj39OrCE@skinsburskii/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon, Jul 13, 2026 at 03:45:35PM -0700, Andrew Morton wrote:
> On Mon, 13 Jul 2026 13:57:55 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:
> 
> > > > I rebased this series on top of mm-new right before sending it out.
> > > > Should I have used a different branch?
> > > 
> > > mm-new is good - Sashiko attempts that.  But it's changing rapidly at
> > > this point in the development cycle.
> > > 
> > 
> > I’d like to send another revision addressing a few comments and also
> > replace the `max/max_t` check with something simpler.
> > 
> > Which branch should I base it on so that Sashiko can apply it
> > successfully?
> 
> mainline Linus would be safest.
> 

Looks like linux-next/master has been updated with the v8 of the series.

I have v9 with a few small fixes, but it is too late to send it out already?

If it's not, then what should I base it on?

Thanks,
Stanislav

> > Or would it be better to send fixups against `mm-new`?
> 
> That should work as well, but it doesn't give us a Sashiko scan of the
> whole patchset.
