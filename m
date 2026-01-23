Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C776D7237F
	for <nouveau@archiver.kernel.org>; Fri, 23 Jan 2026 12:20:11 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D756E10EACD;
	Fri, 23 Jan 2026 12:20:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LNQFWb0f";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D2AA34062E;
	Fri, 23 Jan 2026 12:11:18 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769170278;
 b=wfA6mlC59Hic4lCTDSAErFeQja2V4qrg0pXLEV6K7D2WGyNHQI9lhsZQqPw+FzJW1EDAL
 XN+cD6dmH2NzRSPcudUx2pMHSNVQB19OE3ywStA0ncT0hdO6AEukzb7j96FHAr/uvtUqI2C
 UbowjojYcnny0+WzZ3lM0VzjZxVWSerw/pYZp0FETpfSAydqRr1/khv+Zl3wtiSjRj70eq3
 1wGsL+sdKlkXfXv9NxhHYmUghKSTsBAxSPRkfQuAr3Oz9qAM1c2ad5RfCwkt21oj3uGVH1/
 V5ExuMHkTRiMJa+u6xGeS2LukstmZ3fgmGx8ac7rcx5G1kPKQZLei1kD7YnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769170278; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=buPtS81bVtk1iyxrxDBmQfGETLLqYfbOOpkhdwQVzz4=;
 b=rVFONZyeQS7xS0QqWNLqmw41OcCah5jPN03LZ+WHfUu2+HsFN0H9YG1agYsMqid2AxHOR
 ZuQO3t5ntOL5rFI8HE5/2ARwCwW5fXQohFKrJQg1PPBLqC4FZlFp+Auv8l9NKRCzB73PcYU
 jt+vyUfREjbruuHWEj1WWm8qDJJs0d8KHrbskHQjMkj80VdqZcHyQqmzhte4+amCaT0IJ4i
 eE5hVghvFTvp82PS5lbk4b9p4si4CUHmY4LqA5X2YIME+XiofV8uZenbFOiye0DwhxkA7zi
 g7yDH/0V+6hKsn68m97P0C/qyLG1lJuKMirWsgYKKY+Zcrn0fMPoS6z2Cg9Q==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id AB8764031A
	for <nouveau@lists.freedesktop.org>; Fri, 23 Jan 2026 12:11:15 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5F63710E2B4
	for <nouveau@lists.freedesktop.org>; Fri, 23 Jan 2026 12:20:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 80AF560010;
	Fri, 23 Jan 2026 12:20:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C900DC4CEF1;
	Fri, 23 Jan 2026 12:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769170805;
	bh=q/UZmhgj57sB6wszTRChoVi4TeezF/1fAYZjjvKtNCI=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=LNQFWb0f+NIGeb7r95SOA6ZMzQfDxDXAnGKdvVBGbaeiwrkEShy84YNAeyVN5h0xx
	 RjeknQkYqTxiWK5FUqcYJenMu8hCA1NkOpObLGAXmJZY3bm6phBguhOkk0EMZwxJss
	 RklN7VIuTDOo0Zlq7piJYkA6hokBvXT6NMLnZqh+Itt4qlgI0HEZiKJMBoCpe/opO0
	 mnqdf+vWhV3buwKYkixSdGhltr5fXv0PFR6N6HZh/qH4o5Rq526UEYbR3220sY24Bi
	 Rg3FMDlXwT+ZO8VQ5J5j6VSd8imYJDcdYlKqEw3dqgszy7YjACIhMm0Dsitc5U96PJ
	 R4bJQk1Kf7sfg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Jan 2026 13:20:02 +0100
Message-Id: <DFVYPIHCN0ZC.1PFXVN4U6Y46B@kernel.org>
Subject: Re: [PATCH v8 00/13] gpu: nova-core: add Turing support
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260122222848.2555890-1-ttabi@nvidia.com>
In-Reply-To: <20260122222848.2555890-1-ttabi@nvidia.com>
Message-ID-Hash: 4UBA6IEIAJ44AATMRFPOMUHIAKPQV462
X-Message-ID-Hash: 4UBA6IEIAJ44AATMRFPOMUHIAKPQV462
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Gary Guo <gary@garyguo.net>, Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4UBA6IEIAJ44AATMRFPOMUHIAKPQV462/>
Archived-At: 
 <https://lore.freedesktop.org/DFVYPIHCN0ZC.1PFXVN4U6Y46B@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu Jan 22, 2026 at 11:28 PM CET, Timur Tabi wrote:
> Alexandre Courbot (1):
>   gpu: nova-core: align LibosMemoryRegionInitArgument size to page size
>
> Timur Tabi (12):
>   gpu: nova-core: rename Imem to ImemSecure
>   gpu: nova-core: add ImemNonSecure section infrastructure
>   gpu: nova-core: support header parsing on Turing/GA100
>   gpu: nova-core: add support for Turing/GA100 fwsignature
>   gpu: nova-core: add NV_PFALCON_FALCON_DMATRFCMD::with_falcon_mem()
>   gpu: nova-core: move some functions into the HAL
>   gpu: nova-core: Add basic Turing HAL
>   gpu: nova-core: add NV_PFALCON_FALCON_ENGINE::reset_engine()
>   gpu: nova-core: add Falcon HAL method load_method()
>   gpu: nova-core: add FalconUCodeDescV2 support

Up until here,

Acked-by: Danilo Krummrich <dakr@kernel.org>

>   gpu: nova-core: add PIO support for loading firmware images
>   gpu: nova-core: use the Generic Bootloader to boot FWSEC
