Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D57DECD9A6
	for <nouveau@archiver.kernel.org>; Thu,  5 Feb 2026 21:06:34 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3051D10E0D9;
	Thu,  5 Feb 2026 21:06:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YesdNVkY";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 72BE941A0C;
	Thu,  5 Feb 2026 20:57:12 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770325032;
 b=E2z/7qIQHs91exd3cO2lOL/ZAVgjZkR6thmfVPXWwnXn1tTBxOCViflBAkThAkUMY+5/1
 6+l2POe2Hh+4nlLBsAgHo9i6WHDkLiAdUGfvZuFvHj+FuaHp0HI2V74868YKf2es019P8Hu
 pUlA8Nl7I7KYq8duyQOAd8si8vSANMxetNzzhEd/luiM1TcAEpM+aHIHvpghq8Q+lmjvs5R
 MjgiJgKQH/sDVgn40BsRIkAnvrdQv2JAzFhy5lz+UcJ2Gng+3kLnFxWirMalv11hN10igHX
 1kTDWJP3zX5pK9QhCwWaxUpPCnrj4wcdAHyKEtGfiHqFJ0+6fK0C4tDAorJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770325032; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=JGeCzKcs6APgfKInQ8fPWEO6crHr4dVIgkyVJyOIJ+U=;
 b=i3ZUpTV+N/XY74Ewgz2Kxx8xaWuFwozJTOekMKbWkY8LjM6QZAz8/JqdAn2uCKab88Goq
 9UrJIzhs0vMPeuT2aDkIhq2j9EF7lbKd9DOfvjaFhXVMkzuO0p02vMtM09Q8P+RfhTSZhaf
 sQDqvpphpDOpZ1YzDtd6ZGRxFEAzXxsRwzkPtsQ3w8VuvPJ4ep2LOAeoSg10VW2dA2Smwqy
 KvL0gJYq60myQKzrK+ah6tDrj1RoHlQt3LyP8yQnEUmOPgBFUDmVrAa/yqqBEAFp6dB4jWZ
 SdRPCcnS7PIO/jzX98A5/k3grurIZbhSv3LszL3xEFs0bG2NNH2MfbrVLzjA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 3E308402CB
	for <nouveau@lists.freedesktop.org>; Thu,  5 Feb 2026 20:57:09 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C50F710E0B4
	for <nouveau@lists.freedesktop.org>; Thu,  5 Feb 2026 21:06:29 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2a9004e4239so6776305ad.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 05 Feb 2026 13:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770325589; x=1770930389;
 darn=lists.freedesktop.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JGeCzKcs6APgfKInQ8fPWEO6crHr4dVIgkyVJyOIJ+U=;
        b=YesdNVkYZqc27G4W7fg1VRvj33EDkFTOd7rbMpn9x3hgbdS3xeFTZX/97PMoebj6XI
         xv7FTUcvhPnLOrHCShpBqyXOGbqbIkWYUaTRZZBKDzzUoQFAdmMnFhItyI7zcb7dHEdp
         2X0ngGrwBtovf2mMj2u32RsuZ+ZZXkyHxhEfH4ukZONjdriXT3F/ryxxrU1I4Nx4ErU4
         fTpp2egwoY18NBZEhBkY01DRa6b7hfYQrf50ObCKAcRDRWDakcNQA+kayoU6MqH4rrJG
         g0VSB/6bjJVAM70zp+VTsCoAP88VcJ+SE7wZhyTVFOzPKXfud4DH/LiUXxArZD+88O3p
         iRGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770325589; x=1770930389;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JGeCzKcs6APgfKInQ8fPWEO6crHr4dVIgkyVJyOIJ+U=;
        b=tehYYzMFDytOpU3W1zhH3KFfrMgHG24T7ixJZWWUCFqQLAZn77felbqLKO5S3PrVnI
         TkbwRncyDk8mJZqkgcCDLIZ8WrvHBdmI0Mlw2tjFDFhB1ProTjULWUYkZNV0mvDz+S7R
         0xnidEcAwQ5oMcLOnxQwGCSiapL3x6ZYvMu0jCQr8xIXsfrS0bZwt3K6z2QnYmyD72+k
         9mnSCRQ1JH1SA2d/bLtcljtSkT1onjaFyQrA9Gmg9v2xCHWFrnGMoGoDKvAqiq6Io03M
         LKqne1IwMOh6p98tZwktWNcyduowxwDSTINl6CUFMEpjxostDHehJ3DHJLesgByW6iv7
         2nfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW258ClzE7FKkOlae8OlFQKkvDFPVQZzsB5EjE3ukBO52TsSlQiAyhMQIxW388drehG9l4ZpeU9@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCnYsrXHOnsFQA6L/M3+Uu7KDsQgN36QbUvrS/HhSbR2hUoc6M
	KrqTDamOlcY1OCabz/0fxWhBz0JbN0aDcYIPmNK1rIlD7fzs5MBLHeEK
X-Gm-Gg: AZuq6aLr4vcTQa7eyo7rU7M3uMn3VtMy+Yr14lzp9oBx4Gnb8OX82UX7g5iuL/d6N0J
	g9O8rUtrdFBHlumN5yW7MAOy8YtiOz9NCVgZSF+PjEEDCMpzAsCSyK4aUaMpazOHHxyobRuZAdZ
	heWy4Ekjw+CjbiVro9ZoOlwlHnrGa+z7Yy07MOAjjT45FuZQF9bPfC4fTlX2cm7zMqepTQan/EK
	hup/7XFtqoBNjMGXTBwxjuPmbigEWJWJHhMiZjhNWbFhh117vMLXcghzz/hHUPy8QxgpWh7NaZu
	yMUt+txz13yiT7dArJusiuBMgonz8wulYyIR+WVfBGwGrjHoiVnzKSPaZs1BfHef7lVJ8TVJmsp
	Hha3LIfEErw57dAX3z2WCS2gFvMXPP5tSJQ7t0l+HLf0qnEnwPf05l1nMPI13NGvb0CCM3OTgTD
	xynq1cjA==
X-Received: by 2002:a17:902:e948:b0:2a7:b412:6cbf with SMTP id
 d9443c01a7336-2a951951558mr4424525ad.55.1770325589187;
        Thu, 05 Feb 2026 13:06:29 -0800 (PST)
Received: from localhost ([112.149.32.52])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a951a644a6sm4076285ad.8.2026.02.05.13.06.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 13:06:28 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Feb 2026 06:06:24 +0900
Message-Id: <DG7C1LYQ4SOQ.1HBJ8WH923JHW@gmail.com>
Subject: Re: [PATCH v5 2/4] rust: macros: add derive macro for `TryFrom`
From: "Jesung Yang" <y.j3ms.n@gmail.com>
To: "Charalampos Mitrodimas" <charmitro@posteo.net>, <y.j3ms.n@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260129-try-from-into-macro-v5-0-dd011008118c@gmail.com>
 <20260129-try-from-into-macro-v5-2-dd011008118c@gmail.com>
 <87h5rxuw1n.fsf@posteo.net>
In-Reply-To: <87h5rxuw1n.fsf@posteo.net>
Message-ID-Hash: 7OKVC5XSN2U73CK23BR7Z2ZQMA5FUKWK
X-Message-ID-Hash: 7OKVC5XSN2U73CK23BR7Z2ZQMA5FUKWK
X-MailFrom: y.j3ms.n@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7OKVC5XSN2U73CK23BR7Z2ZQMA5FUKWK/>
Archived-At: 
 <https://lore.freedesktop.org/DG7C1LYQ4SOQ.1HBJ8WH923JHW@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Feb 4, 2026 at 10:39 AM KST, Charalampos Mitrodimas wrote:
> Jesung Yang via B4 Relay <devnull+y.j3ms.n.gmail.com@kernel.org> writes:
[...]
>> +    fn impl_try_from(
>> +        enum_ident: &Ident,
>> +        variants: &[Ident],
>> +        repr_ty: &syn::Path,
>> +        input_ty: &ValidTy,
>> +    ) -> TokenStream {
>> +        let param =3D Ident::new("value", Span::call_site());
>> +
>> +        let overflow_assertion =3D emit_overflow_assert(enum_ident, var=
iants, repr_ty, input_ty);
>> +        let emit_cast =3D |variant| {
>> +            let variant =3D ::quote::quote! { #enum_ident::#variant };
>> +            match input_ty {
>> +                ValidTy::Bounded(inner) =3D> {
>> +                    let base_ty =3D inner.emit_qualified_base_ty();
>> +                    let expr =3D parse_quote! { #variant as #base_ty };
>> +                    inner.emit_new(&expr)
>> +                }
>> +                ValidTy::Primitive(ident) if ident =3D=3D "bool" =3D> {
>> +                    ::quote::quote! { ((#variant as #repr_ty) =3D=3D 1)=
 }
>> +                }
>> +                qualified @ ValidTy::Primitive(_) =3D> ::quote::quote! =
{ #variant as #qualified },
>> +            }
>> +        };
>> +
>> +        let clauses =3D variants.iter().map(|variant| {
>> +            let cast =3D emit_cast(variant);
>> +            ::quote::quote! {
>> +                if #param =3D=3D #cast {
>> +                    ::core::result::Result::Ok(#enum_ident::#variant)
>> +                } else
>> +            }
>> +        });
>> +
>> +        ::quote::quote! {
>> +            #[automatically_derived]
>> +            impl ::core::convert::TryFrom<#input_ty> for #enum_ident {
>> +                type Error =3D ::kernel::prelude::Error;
>> +                fn try_from(#param: #input_ty) -> Result<#enum_ident, S=
elf::Error> {
>> +                    #overflow_assertion
>> +
>> +                    #(#clauses)* {
>> +                        ::core::result::Result::Err(::kernel::prelude::=
EINVAL)
>
> What happens if we need a different error type here? For example, a
> quick look around in nova-core's "Chipset" enum, an unrecognized chipset
> ID warrants ENODEV rather than EINVAL, since it's about device
> identification.
>
> Not sure if it fits the design, just wondering if this flexibility would
> be useful, but would something like an optional
>
>     error =3D <ERROR>
>
> in the
>
>    #[try_from(...)]
>
> attribute make sense? e.g.
>
>    #[try_from(u32, error =3D ENODEV)]
>
> defaulting ofcourse to EINVAL if unspecified.

I believe this is indeed a desired change.

Back in September, an RFC [1] using the same API (i.e., without error
customization) was sent; I took a quick look at the time and felt
everything was OK, but in hindsight, the need for this flexibility is
clear.

Your proposed API looks good to me. Unless there are objections, I'll
move forward with this approach.

Thanks!

[1] https://lore.kernel.org/rust-for-linux/20250930-nova-tryfrom-v1-1-0cc1b=
b507047@nvidia.com/

Best regards,
Jesung
