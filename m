Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7780DC43458
	for <nouveau@archiver.kernel.org>; Fri, 10 Jul 2026 22:12:33 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 545F110F9B0;
	Fri, 10 Jul 2026 22:12:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Tf7EXdr4";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 50F6F47084;
	Fri, 10 Jul 2026 21:57:28 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783720648;
 b=ZXJ+0XDsP6NlQZNfOR6HdZeUK+pJ8U6olB0F+rGtySdILxHbgb4KlxJHnfwsZC1ESC5U7
 5mgrcwm0TXrSchDxf9y6cSvUOxfS2G2urKRMShaxas4iDF0s5M0jQXjF07Dy8aF0unZy7DD
 ZR0xfwkAwwPVazr/dElZu/mYCPgU2BVFWgjjSOLsg187Ov0FBqHL2TnnmYiuJeFXsGdLW+O
 2KPduP6N3QX1o+ZloiLRcizC2ej+N3PHyx5P200MwP57oRrpRWN+41r6MmeZngQzq11ejfb
 mipgKHbZ75yb/IBebpaj5icyvRbHLhZJUBIHeGPeSkT3HXDPPDjiH2LrHqZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783720648; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=xkCCHtME3GEINo3S7szVFYlvRYIJypWuhYUEdvTFvPA=;
 b=G478YdBXSBd2OMrYuv2uSDCNaC+P+DdngJAaogybuVbs7e0XhAs1/Dmt7b/FF18133kmQ
 QzHNaLft8935+b1UEj8Q2MZJ0mIp9apoLvDgx/efzilIOD7wjZL7POOb1vEVsYIPXiRKhK8
 iyizrgJcGFfcXLdwArDGw7ftSUkndoU+SzmZ1qatdvvcZB4zPwpPY+ndpbQMSyeJlTiEoI0
 cP9EfWsg+6jBWZuP0geGIKiN86+C74CFt1sYFWb2DljF8v5i4MQYOVJBujkrT2f1jYOP3mp
 e5ZmirClnRIZbdJnGrvk//3D/Sl6N50l3etym7jp3Chy9sNTeO8IIssxuSZA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=linux-foundation.org;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=linux-foundation.org;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id E135746FDF
	for <nouveau@lists.freedesktop.org>; Fri, 10 Jul 2026 21:57:25 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B6B9510F99A;
	Fri, 10 Jul 2026 22:12:30 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3AAB8600C3;
	Fri, 10 Jul 2026 22:12:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA4BB1F00A3D;
	Fri, 10 Jul 2026 22:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1783721549;
	bh=xkCCHtME3GEINo3S7szVFYlvRYIJypWuhYUEdvTFvPA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Tf7EXdr4fTwcS6bniyj3Vljw2mjizC+AuVuuOhj6bjBU+VQ5B8ncb1aZAHQiXGsR3
	 UJExhUGBEyVaED8iH8HJqi0W+vr6Tz/+3qjlVDYwoFzxOnKf5zVzjI99nkFnZ3/AnG
	 Xc4aywWAj0b21m2YpR5KgM/KdqEwzhHM2gkdlFUg=
Date: Fri, 10 Jul 2026 15:12:28 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>
Subject: Re: [PATCH v8 7/8] accel/amdxdna: Use
 hmm_range_fault_unlocked_timeout() for range population
Message-Id: <20260710151228.ca22e127b93ec5c6d591fb5f@linux-foundation.org>
In-Reply-To: <178371883276.900500.12789147320642521200.stgit@skinsburskii>
References: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
	<178371883276.900500.12789147320642521200.stgit@skinsburskii>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: MSAZHOXUE6ZETVMHTR2QSBX4JEQXKYXP
X-Message-ID-Hash: MSAZHOXUE6ZETVMHTR2QSBX4JEQXKYXP
X-MailFrom: akpm@linux-foundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MSAZHOXUE6ZETVMHTR2QSBX4JEQXKYXP/>
Archived-At: 
 <https://lore.freedesktop.org/20260710151228.ca22e127b93ec5c6d591fb5f@linux-foundation.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, 10 Jul 2026 14:27:12 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:

> --- a/drivers/accel/amdxdna/aie2_ctx.c
> +++ b/drivers/accel/amdxdna/aie2_ctx.c
> @@ -1061,22 +1061,11 @@ static int aie2_populate_range(struct amdxdna_gem_obj *abo)
>  		return -EFAULT;
>  	}
>  
> -	mapp->range.notifier_seq = mmu_interval_read_begin(&mapp->notifier);
> -	mmap_read_lock(mm);
> -	ret = hmm_range_fault(&mapp->range);
> -	mmap_read_unlock(mm);
> +	ret = hmm_range_fault_unlocked_timeout(&mapp->range,
> +			max_t(long, timeout - jiffies, 1));

max(timeout - jiffies, 1UL)?
