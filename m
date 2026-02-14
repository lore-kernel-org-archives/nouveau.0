Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD43EF48C5
	for <nouveau@archiver.kernel.org>; Sat, 14 Feb 2026 10:06:36 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1285210E291;
	Sat, 14 Feb 2026 10:06:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AmCz2P+Z";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 490AD42DA9;
	Sat, 14 Feb 2026 09:56:54 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771063014;
 b=el3Q4y3Drixsc6Y59sUZFpsUrhEiF7OZ3stVX5e+uGxKp3EqaDRnikc4751QdlDHTQ6OF
 7GfnDNwZfuGlxyzb+xwZu1gCWF1LCyl5NKzNeVFZbkYTeul20LZAzgmzVvRYcoinaaHTpN4
 n1yFdDx7SoMcvkTyBHfV1Nxu2/HnfWr5HI6iAD3UaI2UqffPdgTgSDeDSm7/3aCF7q3C+Wx
 zYjH83l+g1Yhlt6FjfThcvq/AiOJ+T910Cm1MsOtMB7Tm5jzoWhb1HHYyzD2apYueVRLTdd
 I5NClwShMJQMjBgU+3p6YmSUSBEmCgOe99b92sP4lPm4TXs5HooAHci9fcuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771063014; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=u1yN2y1qgnP8fWuTao0EKZ8unX5LfbdoNjd1rudCt7g=;
 b=dmlLvq8OSaK5FPHQL3Lihu1aSbI3mOP6aPnkHiVG+zfaqElA8jnc9Qo/C0rmqBd1rzhPy
 TqA4D27KFlW3uQS90z7bruPRGbtrrHac/RZX3uMtEmWfKD4BI+JDLO46cQkIUKpQD1+Pm9U
 R7VmOFBJu0bRsjktF4K70VEgUqArBTo5TIXyLTtlXF8i1OdzYkign33F2zPt/+HlveJ88CD
 +q9v1efnOh36GETaHJzEyRHXQTAfDqoDUt2nS2U8S5Bfr96URZEZsQ685p1304fEKAdLSK+
 e7Q1X+RH25yZ05kfeDV/wlEolI2IlORrSHYJ2qMCplSQGvQ9JdbucimLg9yg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C3A1B4053B
	for <nouveau@lists.freedesktop.org>; Sat, 14 Feb 2026 09:56:51 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 55FAD10E134;
	Sat, 14 Feb 2026 10:06:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 128134169F;
	Sat, 14 Feb 2026 10:06:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E6C8C16AAE;
	Sat, 14 Feb 2026 10:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771063590;
	bh=PdLyjOtiHcS9KxnLEo8RQrCl/hd/HfoyR+aSR/QqB8o=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=AmCz2P+Z4G7QWiVlM6uRg/bEsFP1udIPacrq+VGr5PCF/7J1dafKyhMzB8HrtnM48
	 vV6r8GMCnRGgMIcemyBM8MR4hxfDgyd7g0vlLq9UDagy4hlPYmKL09TNC9L5EW5vsE
	 KaS+xKbsl3i9LozGqcYECFl0OgAc1O26Dr9B0OMtKnvCidXPwb+lEXsyz0DMq09FBk
	 pKq9sVfh61Urla68uQXge2gMNnYoA4ZNZXUTQDJXeAx5uzDgC69/YwduRDPHPZUR+I
	 HpCevVLl85xn07tEuJkuBP8W6J4HKAOVe30gDF7MiA8m3069PHOsIGltZu9Y4A0noR
	 T8uzxzOuOXk+g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Feb 2026 11:06:26 +0100
Message-Id: <DGELN7K4KEY5.2SIZMKT9SFZ8F@kernel.org>
Subject: Re: [PATCH 3/4] gpu: nova-core: convert to use new `dma_write!`
 syntax
From: "Benno Lossin" <lossin@kernel.org>
To: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>
X-Mailer: aerc 0.21.0
References: <20260214053344.1994776-1-gary@garyguo.net>
 <20260214053344.1994776-4-gary@garyguo.net>
In-Reply-To: <20260214053344.1994776-4-gary@garyguo.net>
Message-ID-Hash: Y4GPHDQ4NLEUGDPI7IVWR5ZHEFNS6JMH
X-Message-ID-Hash: Y4GPHDQ4NLEUGDPI7IVWR5ZHEFNS6JMH
X-MailFrom: lossin@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/Y4GPHDQ4NLEUGDPI7IVWR5ZHEFNS6JMH/>
Archived-At: 
 <https://lore.freedesktop.org/DGELN7K4KEY5.2SIZMKT9SFZ8F@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat Feb 14, 2026 at 6:33 AM CET, Gary Guo wrote:
> `dma_write!(dma, projection, value)` is the new syntax to be used.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Benno Lossin <lossin@kernel.org>

Cheers,
Benno

> ---
>  drivers/gpu/nova-core/gsp.rs      | 14 +++++++-------
>  drivers/gpu/nova-core/gsp/boot.rs |  2 +-
>  drivers/gpu/nova-core/gsp/cmdq.rs | 10 +++++++---
>  3 files changed, 15 insertions(+), 11 deletions(-)
