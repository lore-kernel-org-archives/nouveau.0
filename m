Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83D5EA4FC4
	for <nouveau@archiver.kernel.org>; Mon, 23 Feb 2026 14:20:50 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 643AD10E3D0;
	Mon, 23 Feb 2026 14:20:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fdiU3uvT";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3776243499;
	Mon, 23 Feb 2026 14:10:50 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771855850;
 b=XN/BotNgNu7B1aFjdFDJNc4MX0u+XuqeXOKESxAP2azoloQKYnsz0zNQSunpXJh6XegOB
 3UkMJ2S8tF6rxWbqSmB//bwOkXL+1chv6i1+TUvJl2ma28fJj4RHHLrakWn8XWxoNjpQ5ec
 R62V+Wwk7jnig0dgUNPruwJyK0ZUcShao1IMvlCcv6zK8K2vaVBmqhUWslHgCn2PyoVWQTL
 +1VnPDPr5n8xHD3LWG3vzDYMd4Gp4eC+9aRZ51EUvLeh3c6Hq62Xtert5v6v0OeO+cEobBM
 j1+AXd5s8wkokeoypRWQO4s8N4htBWMEqmphHSJRYOD4yiqvyPsvrA1OMPuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771855850; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=TD8Xv4nQP7g6BVAqDxNYGRaF3cJxF2FaGTlTeD5YMoA=;
 b=YmjQxGKw6WhvNPnoHJCRwIHs/lySoEBNbwxK7ru/cDXmtn3Z8+KsNn6la34Trr80+dDI9
 gT0soQ3FBVC0ruTFWMNCVsrZ24YfGn4JTj6ZVe9NFtqF6hrOxntBUvbjfgrnfWJdk2Ojjlr
 ghl+pxeiLsAKuUL00c+87hvI154pV3NhMWdWRS6b7XGsg8fkRJ1U0hq1dxV4zPw6m3QhGQi
 HqBtG1m4x4C81mOqveiUTnX5HUM9fHx0ROa7tir85UKkKV8juhmtXrMhY6HuhKt7j86laPF
 ub+5ASwiOfhmoMd9mQySPTBL7M8AP0EhRTIag7HH8jdZi3vnRgYEGJF/DR7A==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 8F31C40F63
	for <nouveau@lists.freedesktop.org>; Mon, 23 Feb 2026 14:10:47 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8B33110E3B9
	for <nouveau@lists.freedesktop.org>; Mon, 23 Feb 2026 14:20:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 365DD43E95;
	Mon, 23 Feb 2026 14:20:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE553C116C6;
	Mon, 23 Feb 2026 14:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771856447;
	bh=/x9RMS+FWJD5HbEDlZbYvRK9i6bZ6I+mSAtPXGc8dVw=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=fdiU3uvT9gCCYFh3XuLC/MI+zSvpcol6Q6vVBPiGycPt2uxiu1MN20AgGeRfu4eQY
	 qsvLryG3Lmg8TDaU+Mi0lTtKukbzQxzwCSBtu4/N06PYt9/K9zLUVoFWs6POWuajba
	 XE96+FfSO4lfCGBNSYiDP3bihfLQnmY3GTdGDYu2IsLSkJkYWWlTuy7RVFAjfnlK0g
	 C4EO4NQRqwuzB+JA7r6rfz4GuX/Bd0dUV7D6+yt75ysEe5KJYmfUuR7gCEESCMZ30H
	 bz5QBg4CTID+YtYooTYU6911bL89NMGEAFAA2Raa6q5q/D6aoyKRz6hiZe5E0Wi52W
	 By1hNCa1jzBVQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Feb 2026 15:20:40 +0100
Message-Id: <DGMEORS8PL1T.242O5BRE6ZSM6@kernel.org>
Subject: Re: [PATCH v5 21/38] rust: ptr: add const_align_up() and enable
 inline_const feature
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
 <20260221020952.412352-22-jhubbard@nvidia.com>
 <ee76d46cc0cab88ce6dbdeda6a8850dc@garyguo.net>
 <89b240a4-33ec-44dc-8f7c-1a3f8d379e0d@nvidia.com>
 <DGMAKO04ZM3J.1NJDI9SYE354S@kernel.org>
 <ba7aec533e083622be9055e77c30fee0@garyguo.net>
In-Reply-To: <ba7aec533e083622be9055e77c30fee0@garyguo.net>
Message-ID-Hash: IXA4EZIILJI6NSPEBKUVE4VF4ZPWAJ7T
X-Message-ID-Hash: IXA4EZIILJI6NSPEBKUVE4VF4ZPWAJ7T
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alexandre Courbot <acourbot@nvidia.com>,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/IXA4EZIILJI6NSPEBKUVE4VF4ZPWAJ7T/>
Archived-At: 
 <https://lore.freedesktop.org/DGMEORS8PL1T.242O5BRE6ZSM6@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon Feb 23, 2026 at 3:16 PM CET, Gary Guo wrote:
> On 2026-02-23 11:07, Danilo Krummrich wrote:
>> On Sun Feb 22, 2026 at 8:04 PM CET, John Hubbard wrote:
>>> On 2/21/26 11:46 PM, Gary Guo wrote:
>>>> On 2026-02-21 02:09, John Hubbard wrote:
>>>>> Add const_align_up<ALIGN>() to kernel::ptr as the const-compatible
>>>>> equivalent of Alignable::align_up(). This uses inline_const to valida=
te
>>>>> the alignment at compile time with a clear error message.
>>>>>
>>> ...
>>>
>>>>> +#[inline(always)]
>>>>> +pub const fn const_align_up<const ALIGN: usize>(value: usize) -> usi=
ze {
>>>>> +    const { assert!(ALIGN.is_power_of_two(), "ALIGN must be a power =
of two") };
>>>>> +    match value.checked_add(ALIGN - 1) {
>>>>> +        Some(v) =3D> v & !(ALIGN - 1),
>>>>> +        None =3D> panic!("const_align_up: overflow"),
>>>>=20
>>>> This is wrong. Either this function is always used in const context, i=
n which case
>>>> you take `ALIGN` as normal function parameter and use `build_assert` a=
nd `build_error`,
>>>> or this function can be called from runtime and you shouldn't have a p=
anic call here.
>>=20
>> I think the most common case is that ALIGN is const, but value is not.
>>=20
>> What about keeping the function as is (with the panic() replaced with a =
Result)
>> and also add
>>=20
>> 	#[inline(always)]
>> 	pub const fn const_expect<T: Copy>(opt: Result<T>, &'static str) -> T {
>> 	    match opt {
>> 	        Ok(v) =3D> v,
>> 	        Err(_) =3D> panic!(""),
>> 	    }
>> 	}
>>=20
>
> We already have `Alignable::align_up` for non-const cases, so this would =
only be used
> in const context and I don't see the need of having explicit const_expect=
?

Fair enough -- unfortunate we can't call this from const context.
