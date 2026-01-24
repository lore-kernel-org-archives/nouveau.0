Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3578AD715EA
	for <nouveau@archiver.kernel.org>; Sat, 24 Jan 2026 13:29:46 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4B49110E334;
	Sat, 24 Jan 2026 13:29:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Gb9UBnZF";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id EE90340686;
	Sat, 24 Jan 2026 13:20:50 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769260850;
 b=MI9WYr8iXLhuTfPQaXeOhsIcFKSnZXJPtT4MCuYBB3e/rz0bInd5ObJJOmyqQdqeB2FDs
 8bRWbNSAqFjpD7ItIWOMNlwM8s+FQXxb6jB+ZmLsPcJppOzwMRA04FwkjuYMWyRQU4MaOwP
 9FKBn1KKyLHIUGaFVaQoMmG5DmxcFA4LE4MEpepzp2a6UKfOOEBVu/LkzIDnX/5a6I/bgLB
 cGf7fnZlgVvlf+rSp8K9adZUqpPu5aALmgD7A9lruZbt//G+bTaXhWCBjI/XVrie0uT1ziF
 ZuPor4GTRfETP/pHidNvu07hs92WjZdLZU1HWl1arDbGuXDD2FiGEVB32Nfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769260850; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=WuVDWxE1MFEQyWLSNVYwC/Xc2H589TKTJgLy9InRQRE=;
 b=zi4xpu7ESv2FIPoq7IJljoEPKEbtaZ9gm2EFg2TJwoZB+lrX6BK0HpuDwP4ppGgieCnHK
 PnBIc6fX/z8JShMcgT31JJFzBEMalF9NmWFkhKFlWrWoDI5IXLW+CvuPD8vxNcpPTzCO3mh
 TMy3X2PP4x7j0ZJYjZyTCHJCx97tQ5vXcLd3AnX/R6yBozzbwmBOUGLTPcsEdHrPK+uQLhW
 ZWqul0zoSYewOZdsWOXrKDIOaqlZBpCoVWI5XxFcnW6dSu+oEOXlINLabkfwJJdLGMnetni
 PRLbByWANPba4fk1CmwsXLoCaNrFrZfBHvnk4ljqxYfQ/LkY6joyOLEsNdQA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 73BD24031A
	for <nouveau@lists.freedesktop.org>; Sat, 24 Jan 2026 13:20:48 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8B9A110E1AA;
	Sat, 24 Jan 2026 13:29:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 32EA0406E9;
	Sat, 24 Jan 2026 13:29:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 147B8C116D0;
	Sat, 24 Jan 2026 13:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769261381;
	bh=WuVDWxE1MFEQyWLSNVYwC/Xc2H589TKTJgLy9InRQRE=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Gb9UBnZF4xTb1ngAYRQHI1osVNTq+aL4eNcHF65vr8h5CXhWhXaM2CUodyUBucK11
	 TulrjPZbuFBIAU5Z+mDUjKTgVqYfcJDD0D5SzhinpNaoVOCyooCLRXQlLd8c+ghTkb
	 zIMoIbUJQx3bEoD4ZQ+w4h026BNrn8Af3gBMuOPrJ2JT4ipRFPOCT6J/kFpdrVYjkh
	 muJfeJ26j/ONbnOfW3xupkVidZ/FiUnY7lwb/PAPjnPYsgULHgJcxooYkysgoKQMlr
	 3oGXjs8s/ET3a59SvVou/4b0/0RshlbGJ92jjCRMUc7nepczA42KADvlOd+KE5QNy6
	 B/ooxyTeWyKCw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 24 Jan 2026 14:29:34 +0100
Message-Id: <DFWUTANX4HBS.QIN5BJPI5MAO@kernel.org>
Subject: Re: [PATCH v2 7/8] gpu: nova-core: remove redundant `.as_ref()` for
 `dev_*` print
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260123175854.176735-1-gary@kernel.org>
 <20260123175854.176735-7-gary@kernel.org>
 <DFWUC9ZS6CCU.3HPTNAO7CU41S@nvidia.com>
In-Reply-To: <DFWUC9ZS6CCU.3HPTNAO7CU41S@nvidia.com>
Message-ID-Hash: 2G54GPJ7VHAE77KPCOAE2FC3LW55VFRX
X-Message-ID-Hash: 2G54GPJ7VHAE77KPCOAE2FC3LW55VFRX
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Gary Guo <gary@kernel.org>, Gary Guo <gary@garyguo.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Simona Vetter <simona@ffwll.ch>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/2G54GPJ7VHAE77KPCOAE2FC3LW55VFRX/>
Archived-At: 
 <https://lore.freedesktop.org/DFWUTANX4HBS.QIN5BJPI5MAO@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat Jan 24, 2026 at 2:07 PM CET, Alexandre Courbot wrote:
> On Sat Jan 24, 2026 at 2:58 AM JST, Gary Guo wrote:
>> From: Gary Guo <gary@garyguo.net>
>>
>> This is now handled by the macro itself.
>>
>> Signed-off-by: Gary Guo <gary@garyguo.net>
>
> Acked-by: Alexandre Courbot <acourbot@nvidia.com>

We should take this through drm-rust in the next cycle to avoid conflicts.
