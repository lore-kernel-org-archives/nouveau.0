Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77ABFF8861
	for <nouveau@archiver.kernel.org>; Mon, 27 Apr 2026 11:28:48 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C453E10E6E7;
	Mon, 27 Apr 2026 11:28:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CKf7kjVa";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 02F8945C71;
	Mon, 27 Apr 2026 11:16:29 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777288588;
 b=IeHr5JgV2G2iF1PUNFlFM8q3rybKqaXLgAY3o0WFzzHrKq1avq0/yTMTyN/vMkObt9j2J
 AXmKM9sKwydOI7dhhzoBPO18xYDEgrxx6kSXDe/lNuj+KXgm+GjDIZXxuPBjWgJkEtHFW/P
 cLZsJpqnWMYaUjZLBr3MJ6atX7fQT3bZ95haTSNVzNFnFdjSs5SNgjH6l/0gpk5K/Dh9Wlg
 ODm0E3aDWmvwC9rYTPXPFshfrTlxNbgXn0udWHRk2eaK7dXlFDIWrRinH4xozRPCGDRJlAh
 OLwYMlvJHo5E09rxEfXTev5xoJZZnovm4z8Uvow6FU+DoZZgr9VqVHDcb0kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777288588; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=t8qbdGApkXc67C5NnjZ7tvOcU2R+JY87tSW+zpj3HpA=;
 b=P/upHtUZ7uN/qjxEUkHNVBSy5mqozKUKBAOE2Rd1zUh4YDVBxeECvDPHkB77FlTa74JJ/
 yRUh4RTzLVAfgrs2rHAMCuvkDQbBSI2D6D3LX8jcfRK9DAFKl0WyOr7d95bw0xXr76R6hL8
 DtAZ8FxvmUB9RJ4LMY6+7HoahqxKgXY4Sp4cqpEf7CZiU8H4nPasgXOC1YsqHEoUGiRTag/
 BHfNSwqbzcO31oaZz6iXfWOs5w5lVPlgcB7uEcIIyr3WsVvDD8fmPKDaXKdHjVHLe3QQ+BX
 vJT/1kVrl8muaOmTk8FbIk4cXWuf0MxekAAmGl/vQB9aaVmwvnK2WhzlrTPA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 29E7240F62
	for <nouveau@lists.freedesktop.org>; Mon, 27 Apr 2026 11:16:26 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CECDA10E6E5;
	Mon, 27 Apr 2026 11:28:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B6D7444413;
	Mon, 27 Apr 2026 11:28:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48676C2BCB6;
	Mon, 27 Apr 2026 11:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777289325;
	bh=t8qbdGApkXc67C5NnjZ7tvOcU2R+JY87tSW+zpj3HpA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CKf7kjVaGTbyarud+ThC4Vxiu8xbySQouSnNVb/Vmzb1AWQR6AmGBbWlgljgoQzB4
	 LW7crYz45tOqZ9D85aVv+f2uqFy/SO2IHk+sFtbb2oInLixMS2ezG8ZSAGOwhYkVD7
	 W32cfeHWob0h39EEEo2xJkYjbfy8c9MM+i0dxqBMmmEtNwMkhj6BW4fxdoSd0MpvVG
	 /lVb0IFO0ewg1qMpHZr7VDmt86BZps2ybG+B6Q813TXyiJpCO2fQhQvaTyQOCx4dTM
	 +w+rPl/+gPc4BH3+v5baSFY5BLzzXNYmRkL2lLSALBeJ78T+zzkJWyPeFd+YE9eSoL
	 K5U8sVVf59wOg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>, Abdiel
 Janulgue <abdiel.janulgue@gmail.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Alexandre
 Courbot <acourbot@nvidia.com>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH 2/5] rust: dma: update to keyworded index projection
 syntax
In-Reply-To: <20260415-projection-syntax-rework-v1-2-450723cb3727@garyguo.net>
References: <20260415-projection-syntax-rework-v1-0-450723cb3727@garyguo.net>
 <Y_UaWMYTo9Xb8viyPNggy28srKaFUvKR9HjIcL1PpalkyTdjVdIgSU_O-zU-kbfo7QT3pyp6v8v03_EeVCUNEw==@protonmail.internalid>
 <20260415-projection-syntax-rework-v1-2-450723cb3727@garyguo.net>
Date: Mon, 27 Apr 2026 13:25:58 +0200
Message-ID: <87o6j4r6ex.fsf@t14s.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: MZ45EYU4X76GPJXNUREZ6MYXAITAKEAS
X-Message-ID-Hash: MZ45EYU4X76GPJXNUREZ6MYXAITAKEAS
X-MailFrom: a.hindborg@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Gary Guo <gary@garyguo.net>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MZ45EYU4X76GPJXNUREZ6MYXAITAKEAS/>
Archived-At: 
 <https://lore.freedesktop.org/87o6j4r6ex.fsf@t14s.mail-host-address-is-not-set/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

"Gary Guo" <gary@garyguo.net> writes:

> Demonstrate the preferred syntax of index projection in DMA documentation
> and examples. A few `[i]?` cases are converted to demonstrate the new
> variant.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


