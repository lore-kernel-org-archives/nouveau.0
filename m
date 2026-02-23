Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26A5EA4FA9
	for <nouveau@archiver.kernel.org>; Mon, 23 Feb 2026 11:07:23 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CADFC10E372;
	Mon, 23 Feb 2026 11:07:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Tv5puIZf";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E9CB443492;
	Mon, 23 Feb 2026 10:57:22 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771844242;
 b=m9fGo4/ABdKe0FohU/j2aym/1+qS/Mg8ApTQIyKQhFsphFHjKIW6HGiM7krPMH7lZ5KCd
 +oxyRH5VF+AcTiE5rCglQaa7c9fYPLnoJx8aqFWHAH2FxzyIYtD+eRsxgn+BEvNViEWOGBN
 QIYsnnj/x/3U9LzXSYhwfNHguKMeVkG7mcvX0m8Q8KYP16chQfOW4RoIvmEGN9bcttbAFfV
 kqyiB9PDqEV+4v5Xq3xiwausD5Gr9LjJxQKtNMYLrXbgCqBInL/x20nAoH/etMnTF5JKMYh
 7vJsRGnmuxbIGuu07KXBJrBZ2ZVwJRcR6MmBtnMY5Z3/selXULF16Zvv2YlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771844242; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=zVfQQOtaRa4Hgzffhzvl0yMDS6OAmJsEW6rjqBYFFcI=;
 b=a6koUWtWD4Mqi2oBhQiD2K8PukgrRTlH6n+3JpTBFcXiwR4H51qH/KWK8MA7PYHsvcUs3
 VsT2fy7OVQ7rWx21SPjcl5zo76Cg+WeZqUeWBk/RdoCUmbf6PwcMLrz5Ci5VnQ7s6H78gro
 7njK04NrErA9+KKmZTj0jBeVxC+GznGGuLqg1gh2n6DYnpREVSCmRR7DPjN8+C/RxjlpTGd
 jeiN5+zPbWku4Nbe5NV8hO7mtJH9s4drzfHz/z+Y3zj8MsOLOsasbcHwUV2L4fWOT58sahp
 gHrmVUQjSbwUnIMY35dqQgFu02gJGhKDcUzJIO3qYxCBm502OO7UcEiBZUSg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id AF9F340F63
	for <nouveau@lists.freedesktop.org>; Mon, 23 Feb 2026 10:57:20 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 622C810E36E
	for <nouveau@lists.freedesktop.org>; Mon, 23 Feb 2026 11:07:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1FA8B416EF;
	Mon, 23 Feb 2026 11:07:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA9AAC19424;
	Mon, 23 Feb 2026 11:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771844840;
	bh=9THcSknWxFekpDxQRFCSKZzyrfb8YlQHG6tgRXaASYU=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Tv5puIZfMAco9XypEYh9cgeD64pwjXw4pW7HW8k3tyc5g9CEWbtdOIlPg2tmLk4OC
	 Tm5Tgu2pn6se/M5yc71749ytXjU6mTorr0vL//AKbEZRpmJnyRTm0q2zgZ2mYLDyWS
	 8cZdnuM1tvHdL+rVFNix0MTL7qNlXPyBvpjbAqF+JrndO5iYg5Ydx8UjLT2Ve3mYRJ
	 ohilm+oYVdtWakc5UEmLjuZD+KlBh8Pd+qJKiM/Vw3mZtqIrcjDTNzHeD3289oShzr
	 Oj7ayfFH+Pd2CnKuC+Zid0tGWqCWAE/MlpKh6+pxU+33ny/UtzQr8BFTNC0Ewrqhri
	 znnQCFGnI0pbg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Feb 2026 12:07:14 +0100
Message-Id: <DGMAKO04ZM3J.1NJDI9SYE354S@kernel.org>
Subject: Re: [PATCH v5 21/38] rust: ptr: add const_align_up() and enable
 inline_const feature
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
 <20260221020952.412352-22-jhubbard@nvidia.com>
 <ee76d46cc0cab88ce6dbdeda6a8850dc@garyguo.net>
 <89b240a4-33ec-44dc-8f7c-1a3f8d379e0d@nvidia.com>
In-Reply-To: <89b240a4-33ec-44dc-8f7c-1a3f8d379e0d@nvidia.com>
Message-ID-Hash: SFAOR5BJDVAZU2SUTNKJ6SGOQ7GGHIWT
X-Message-ID-Hash: SFAOR5BJDVAZU2SUTNKJ6SGOQ7GGHIWT
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Gary Guo <gary@garyguo.net>, Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/SFAOR5BJDVAZU2SUTNKJ6SGOQ7GGHIWT/>
Archived-At: 
 <https://lore.freedesktop.org/DGMAKO04ZM3J.1NJDI9SYE354S@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sun Feb 22, 2026 at 8:04 PM CET, John Hubbard wrote:
> On 2/21/26 11:46 PM, Gary Guo wrote:
>> On 2026-02-21 02:09, John Hubbard wrote:
>>> Add const_align_up<ALIGN>() to kernel::ptr as the const-compatible
>>> equivalent of Alignable::align_up(). This uses inline_const to validate
>>> the alignment at compile time with a clear error message.
>>>
> ...
>
>>> +#[inline(always)]
>>> +pub const fn const_align_up<const ALIGN: usize>(value: usize) -> usize=
 {
>>> +    const { assert!(ALIGN.is_power_of_two(), "ALIGN must be a power of=
 two") };
>>> +    match value.checked_add(ALIGN - 1) {
>>> +        Some(v) =3D> v & !(ALIGN - 1),
>>> +        None =3D> panic!("const_align_up: overflow"),
>>=20
>> This is wrong. Either this function is always used in const context, in =
which case
>> you take `ALIGN` as normal function parameter and use `build_assert` and=
 `build_error`,
>> or this function can be called from runtime and you shouldn't have a pan=
ic call here.

I think the most common case is that ALIGN is const, but value is not.

What about keeping the function as is (with the panic() replaced with a Res=
ult)
and also add

	#[inline(always)]
	pub const fn const_expect<T: Copy>(opt: Result<T>, &'static str) -> T {
	    match opt {
	        Ok(v) =3D> v,
	        Err(_) =3D> panic!(""),
	    }
	}

for when it is entirely called from const context, e.g.

	pub(crate) const PMU_RESERVED_SIZE: u32 =3D
	    const_expect(const_align_up::<SZ_128K>(SZ_8M + SZ_16M + SZ_4K), "...")=
;

> I will have another go at this, and put it in nova-core as per Miguel's
> comment as well.

I think Miguel didn't mean to say it should not be in this file. I think th=
e
current place makes sense, let's keep it there.
