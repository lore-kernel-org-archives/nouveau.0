Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 585FCE83848
	for <nouveau@archiver.kernel.org>; Tue, 17 Feb 2026 02:45:24 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1E8B210E420;
	Tue, 17 Feb 2026 02:45:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.b="dKcKZI6q";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 12E9340675;
	Tue, 17 Feb 2026 02:35:38 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771295737;
 b=hlDBmZET/i6QrmYNedPhm8Xaov8lQtpQz3O2TyFWiwDOOUqilOwbZ6FqVLQeZ5yNtOvEb
 Zzc/adI0vp76Mz0cNCo9IEDt7TegEmcxAc8EoRAdZFgLLSrIiKnUed5jwOco63vdWw7ecIL
 dO/5esJ23I2TfrheJmqwSwcSUS013aesBFiHPTPv/ZHqy/SLqumRswxosHsnrTOJJFzwoxG
 v/GNibjntW0wlzcYjCO+zMIiiCfyQ/soZW0C6hdh1/oN3C9I0AxW+aA9mKX6UdvjzlHFFjA
 20vD46AWJnRYuzXRUGdn9Ly6l46cuZkh6aw7EAfhy/24Hb/Jl7fzCJOPX9Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771295737; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=9XZWY4s+zmuqMw0CXOePmBfT3kmofDaonHN6AonxRPk=;
 b=WkGhzpldoT0ssBQ84qzVD07GUBc0VUnqFY/9Tq9reUXgQRYryFynK295pW8nYnudur+oj
 MSFnPB1xk4RyXJcBpcrIHpQjxFlA+3uNQWpNWahGq+MpZOz67ePPrtqlK/ZuOgqIdff+u2K
 d123Xn2PEtu8fBXBEZhEfZ4trsthdlSOggUBrqJWfcDkslFwh8hD+v7PEAjaIHAUG16bvTL
 DHuY5t7ppUMIJXKdd79MVfe/w2aPB06ccvOrh++NCoXnOaS2sE2uGTTQ+EkcH34dnzUzG6n
 wTrVU48+arhCZoxtUU9gYpz0k5S67O2J3kSCbNHQEt+W7xphlqKYNpLdK04g==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=posteo.net;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=posteo.net
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=posteo.net;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=posteo.net
 policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id EBA0540399
	for <nouveau@lists.freedesktop.org>; Tue, 17 Feb 2026 02:35:34 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F2E0310E15A
	for <nouveau@lists.freedesktop.org>; Tue, 17 Feb 2026 02:45:19 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169])
	by mout02.posteo.de (Postfix) with ESMTPS id 870E5240101
	for <nouveau@lists.freedesktop.org>; Tue, 17 Feb 2026 03:45:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
	t=1771296317; bh=9XZWY4s+zmuqMw0CXOePmBfT3kmofDaonHN6AonxRPk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 From;
	b=dKcKZI6qH1E5SQsDISLoZ1laJUH3agWYJK5CuQEamuAIRUV7sRu9SqrHha/sw1OEy
	 diK7S8ngKSCLwFiV7gtMiHFRlSnkr1H3pMSpaYurVnxzFuTVK+d2AH2rmNy4xPuj/i
	 pfCky5Wvuc95nEzmriD4DrcA1ZV9b/bVQrNQxP9afrqlwNq+oy9vqGOTdBGSjggr3g
	 fixIESi28Us79mXLYPSZas5oq/wKQA0q6TW8KUFTy0X6QYnM/BhFRufvPJxW5N5lkc
	 UrEAm8Bk0D3BXxODtei//lPm5EWSJGITiLRZ9OKfkFiWPbvM2E3ZjXQMLSvntSyenH
	 lRQVP0H8aS+XQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fFPBg0Lwcz6trs;
	Tue, 17 Feb 2026 03:45:14 +0100 (CET)
From: Charalampos Mitrodimas <charmitro@posteo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>
Subject: Re: [PATCH v5 2/4] rust: macros: add derive macro for `TryFrom`
In-Reply-To: <DGGV2METTDXF.1BCNNP5T0TPV3@nvidia.com>
References: <20260129-try-from-into-macro-v5-0-dd011008118c@gmail.com>
	<20260129-try-from-into-macro-v5-2-dd011008118c@gmail.com>
	<87h5rxuw1n.fsf@posteo.net> <DG7C1LYQ4SOQ.1HBJ8WH923JHW@gmail.com>
	<DGGV2METTDXF.1BCNNP5T0TPV3@nvidia.com>
Date: Tue, 17 Feb 2026 02:45:16 +0000
Message-ID: <874ingf5qe.fsf@posteo.net>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: XD5BBJEKZ3JDHZSJFHLCQOLVB4LXEHJE
X-Message-ID-Hash: XD5BBJEKZ3JDHZSJFHLCQOLVB4LXEHJE
X-MailFrom: charmitro@posteo.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Jesung Yang <y.j3ms.n@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XD5BBJEKZ3JDHZSJFHLCQOLVB4LXEHJE/>
Archived-At: <https://lore.freedesktop.org/874ingf5qe.fsf@posteo.net/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

"Alexandre Courbot" <acourbot@nvidia.com> writes:

> On Fri Feb 6, 2026 at 6:06 AM JST, Jesung Yang wrote:
>> On Wed Feb 4, 2026 at 10:39 AM KST, Charalampos Mitrodimas wrote:
>>> Jesung Yang via B4 Relay <devnull+y.j3ms.n.gmail.com@kernel.org> writes:
>> [...]
>>>> +    fn impl_try_from(
>>>> +        enum_ident: &Ident,
>>>> +        variants: &[Ident],
>>>> +        repr_ty: &syn::Path,
>>>> +        input_ty: &ValidTy,
>>>> +    ) -> TokenStream {
>>>> +        let param = Ident::new("value", Span::call_site());
>>>> +
>>>> +        let overflow_assertion = emit_overflow_assert(enum_ident, variants, repr_ty, input_ty);
>>>> +        let emit_cast = |variant| {
>>>> +            let variant = ::quote::quote! { #enum_ident::#variant };
>>>> +            match input_ty {
>>>> +                ValidTy::Bounded(inner) => {
>>>> +                    let base_ty = inner.emit_qualified_base_ty();
>>>> +                    let expr = parse_quote! { #variant as #base_ty };
>>>> +                    inner.emit_new(&expr)
>>>> +                }
>>>> +                ValidTy::Primitive(ident) if ident == "bool" => {
>>>> +                    ::quote::quote! { ((#variant as #repr_ty) == 1) }
>>>> +                }
>>>> +                qualified @ ValidTy::Primitive(_) => ::quote::quote! { #variant as #qualified },
>>>> +            }
>>>> +        };
>>>> +
>>>> +        let clauses = variants.iter().map(|variant| {
>>>> +            let cast = emit_cast(variant);
>>>> +            ::quote::quote! {
>>>> +                if #param == #cast {
>>>> +                    ::core::result::Result::Ok(#enum_ident::#variant)
>>>> +                } else
>>>> +            }
>>>> +        });
>>>> +
>>>> +        ::quote::quote! {
>>>> +            #[automatically_derived]
>>>> +            impl ::core::convert::TryFrom<#input_ty> for #enum_ident {
>>>> +                type Error = ::kernel::prelude::Error;
>>>> +                fn try_from(#param: #input_ty) -> Result<#enum_ident, Self::Error> {
>>>> +                    #overflow_assertion
>>>> +
>>>> +                    #(#clauses)* {
>>>> +                        ::core::result::Result::Err(::kernel::prelude::EINVAL)
>>>
>>> What happens if we need a different error type here? For example, a
>>> quick look around in nova-core's "Chipset" enum, an unrecognized chipset
>>> ID warrants ENODEV rather than EINVAL, since it's about device
>>> identification.
>>>
>>> Not sure if it fits the design, just wondering if this flexibility would
>>> be useful, but would something like an optional
>>>
>>>     error = <ERROR>
>>>
>>> in the
>>>
>>>    #[try_from(...)]
>>>
>>> attribute make sense? e.g.
>>>
>>>    #[try_from(u32, error = ENODEV)]
>>>
>>> defaulting ofcourse to EINVAL if unspecified.
>>
>> I believe this is indeed a desired change.
>>
>> Back in September, an RFC [1] using the same API (i.e., without error
>> customization) was sent; I took a quick look at the time and felt
>> everything was OK, but in hindsight, the need for this flexibility is
>> clear.
>>
>> Your proposed API looks good to me. Unless there are objections, I'll
>> move forward with this approach.
>
> One problem I can see is that ultimately the error depends on the
> context of the call, not the type itself.
>
> Nova-core's `Chipset` returning `ENODEV` is a bit too opportunistic to
> me - the only place where we are doing the conversion is within probe,
> and that's the error that probe is expected to return. But in another
> context (say, validating some user input), `EINVAL` could be the right
> error to return.
>
> There is technically only one reason for the derived `TryFrom`
> implementations to fail, and that's because the passed value doesn't
> exist in the enum. So really what we would ideally want here is a
> conversion method returning an `Option`, like enumn's `n` [1], that we
> `ok_or` into the correct error for the context.

Good one yes. This is a cleaner approach. Decoupling the error from the
type and letting the caller decode via ok_or looks better to me.

>
> But short of that, I guess we could also have a dedicated, single-value
> error type for derived `TryFrom` implementations that we `map_err`. That
> type could even have an `Into<Error>` implementation that converts it to
> `EINVAL` by default, as that's going to be the most common case.
>
> ... but if we do that, that's not very different from returning `EINVAL`
> and having callers `map_err` on that when they need it.
>
> [1] https://docs.rs/enumn/latest/enumn/
