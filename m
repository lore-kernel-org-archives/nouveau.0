Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 671CC108B8E4
	for <nouveau@archiver.kernel.org>; Fri, 20 Mar 2026 10:04:11 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 46D7B10EAC8;
	Fri, 20 Mar 2026 10:04:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mVdxMc5k";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id DFAA54522C;
	Fri, 20 Mar 2026 09:53:15 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774000395;
 b=z9p2ivHLprLmHTB8yIzn7f00O+sWAC3ernopd4WrwSQyqSiLq63M5YAESJH3LMAM5JY2v
 67aAHaraEfZCBjXSjxux4w7JmkLA9to1esW9+SQ93gJkp9q+jVhPHd4+15ev31ofVGub3Mo
 n2GkiMm7DvdEQDC7yKXvngyiRuBt7OBi5SSo3WdwE4K0GUUk9OnPz+KH17zTmXbpR9fsbEw
 6ZsTuwcfa5E5hfdvK9PcifgtILN5GI2sbsCnK5J0DDJSsTzOAE5BoV3IDURiSGMZqSH1M6w
 X1aQAWMuApacS0PC5w7p/id8G4Sn0DK9yXR1pRnuIqJ6CsNwJhOi+iELzzxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774000395; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Izdm/7D68g40rNesT50ueXh6Akh0cFui4OgMPqSoSys=;
 b=UnLYTEYc8zTNhLoNhbJQG/n9kjYBCYRyzYj0hTrJxRNFJ9TH9KWYyyauG4kb7DwNYNjbo
 njWI911dLDmoMsKz1duAWUDD9BAb3js7Yw3zUfKSwTRbsSNQWtKwlg6MMXqF8wA7pRzK1UM
 p5DPgboO32pd3BCWWCzhTnc+HAlgutMnCg1VYOmbnHxTTzqehTvRxtXalOXIFRUD1fR6jAQ
 LO/dFBkbIs/kkwCfTzvKNO0Uz5HZwr1hl90s2vULT71BZKfgxmC7eSGuXu2jtRhPKRu+Na9
 2vb0VvPdOhB+v9S+/6Y2kLeHYaVE7s1r1FuHd1lve+EgK34nKzOCOtH8/opw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A0346450D6
	for <nouveau@lists.freedesktop.org>; Fri, 20 Mar 2026 09:53:12 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CE5DC10EAB8
	for <nouveau@lists.freedesktop.org>; Fri, 20 Mar 2026 10:04:07 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-2a7a9b8ed69so23407515ad.2
        for <nouveau@lists.freedesktop.org>;
 Fri, 20 Mar 2026 03:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774001047; x=1774605847;
 darn=lists.freedesktop.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Izdm/7D68g40rNesT50ueXh6Akh0cFui4OgMPqSoSys=;
        b=mVdxMc5kkhG/YKcmGrmuvD3Agb+GgfDBN+E8yHkQCku8d7Nl05kcGPkZqKWBs9jhLk
         j2+A0K5DIAXwLyDlECFnTHhYk9RfWeYyBiTRmU8uRCao6Jti6uT4ScZlM91FzZ5/PaN3
         OF9MfmWEbANS24Fnofe1MIaIgbArv9jNkGLF6/zLE4N0IwLYwTaib4saJQimWXnPhoyZ
         ti4ItzLEnzrqkQG3Aks0dbR6P26k+hCigmg5NE5ySE6Ws6mULEPwitDFCqsErTFysM6c
         qthjwE4/rVHqZ9p5JRX1zB7Gx8ILv6Wfv3rsvds5bEgiw0hhkKA69fZbbK0Mmjb7NVsS
         Rcwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774001047; x=1774605847;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Izdm/7D68g40rNesT50ueXh6Akh0cFui4OgMPqSoSys=;
        b=VxuI7In6zOczzfVZpvJ5JTbvpCMBVnTiZi0QL9394WQAmpjSSwW1otAHdOFfKHTviC
         +dI0FwDFIO54Zop/0hXuGupAOkVKYcSxSm0rDsw8mE+8XSTiHqOrS8bdXigd8wHJBGzB
         RcA0HFqnGNOZK0vBq6j3zHMY2fmOeaFegRwl6q3fgWm+mZxzTjfVgAomIp3fd1usmtY3
         AgZh9CTCqEDGvfC8u/4Co3wqJ4tSDm7b9gCHoLrzuAReS88IvUhAyMftmU9wbFnHiqwS
         wTLdqvB5OgYQhDmUrWm89enbuRB1ddoulxbxVzVjXmQTq6Isbd87CZvQYRhLZ7aIPBis
         KJ9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpQ3bbZ62Md0gmyCIeEcjbplesxHfDgYl3eDeUUB5eBa0pywIHk47p7LpZ7b+oNg9dC2rb1R3h@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5E9JlFCyF8DpvTPw9d+8r4O56EndIZW+o2BJXaSF2M2I+IBaz
	jXuQxoRQ4W4eSpIvqam/hYwA51xolaHmtup0+OMg0Ap703qJp9vIG9FA
X-Gm-Gg: ATEYQzywORk0GuzP/oO8hC/EhBrfptV6pybb077vojhMz3fair8YBQBFezTEQqaaOCQ
	Bgzdb7q4GtEGwUOjoNJODkuyvldwVTj6KJEJOG0hI5DiFoBnsFlTV3lwWGL0Rebql688Et2ya5v
	M840ZOraG9VsWPuDS3kBTOl6yUDp9+v2is13MSH4mXUvLWVLXxhyzzORRRLXfRqtt245Rn+hojK
	zk/gyYeLZReDiGw6gQ4zhSAUNKSIk9VdH4mEAUnLwew6vwJE2eZvky8FDY8uF5XHqPCEdR4LBvV
	h4R5uUg7OR1aEXvCcMiT0wnhIjWdAitiYbMADd0oEvHL3bkSmwG+lXRAYzKk1HXg8uUM7m/aCJV
	209Ix9Vu0rXF872INcU8ih5aXUkYsFnLMgFCqwj+GlbWtu1g/ek+8xZfpJMQkTlyNP3qYDig8xp
	2FHcezV8/gXifQvDfevQ==
X-Received: by 2002:a17:903:244b:b0:2b0:676d:973e with SMTP id
 d9443c01a7336-2b0827e3593mr22392635ad.46.1774001047271;
        Fri, 20 Mar 2026 03:04:07 -0700 (PDT)
Received: from localhost ([112.149.32.52])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b083516400sm16756525ad.11.2026.03.20.03.04.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 03:04:06 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Mar 2026 19:04:01 +0900
Message-Id: <DH7IVVURBJ8G.QP1WRFTGS556@gmail.com>
Subject: Re: [PATCH v5 0/4] rust: add `TryFrom` and `Into` derive macros
From: "Jesung Yang" <y.j3ms.n@gmail.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Jesung Yang via B4 Relay"
 <devnull+y.j3ms.n.gmail.com@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260129-try-from-into-macro-v5-0-dd011008118c@gmail.com>
 <DGQCKLKCHRD1.25W93SR8LJ87H@nvidia.com>
In-Reply-To: <DGQCKLKCHRD1.25W93SR8LJ87H@nvidia.com>
Message-ID-Hash: KVGCAUVVGAD26H6UMUHPU76RZH4UU7JT
X-Message-ID-Hash: KVGCAUVVGAD26H6UMUHPU76RZH4UU7JT
X-MailFrom: y.j3ms.n@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: y.j3ms.n@gmail.com, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KVGCAUVVGAD26H6UMUHPU76RZH4UU7JT/>
Archived-At: 
 <https://lore.freedesktop.org/DH7IVVURBJ8G.QP1WRFTGS556@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Apologies for the delay.

On Sat Feb 28, 2026 at 2:31 PM KST, Alexandre Courbot wrote:
[...]
> FWIW I have converted nova-core to use this, and this results in -200LoC
> delta. Obviously I like this very much. :)
>
> A few pieces of feedback for things I noticed while doing the
> conversion:
>
> - Very often we need to convert a type from and into the same primitive.
>   Not having to repeat the same thing in `#[try_from(foo)]` and
>   `#[into(foo)]` for these cases would be nice.

I think I can add a common attribute that works for both `TryFrom` and
`Into`, e.g. `#[convert(foo)]`.

> - In some rare cases, we want to convert an enum with 4 variants into
>   e.g. a `Bounded<u8, 2>`. This can be done using a `From`
>   implementation, and that's what the register macro expects. These
>   cases are not covered by the current macro (they are few however).

I think you can just do the following?:

    #[derive(Into)]
    #[into(Bounded<u8, 2>)]
    enum Enum {
        A,
        B,
        C,
        D,
    }

    let a =3D Bounded::<u8, 2>::from(Enum::A);
    // or let a: Bounded<u8, 2> =3D Enum::A.into();

This works because `Into` actually generates the `From<Enum>`
implementation for `Bounded<u8, 2>`.

> - When converting from/into boundeds, the number of used bits is the
>   only thing that counts - the backing type (u8, u32, ...) is
>   irrelevant. I thought it would be cool to be able to have a generic
>   TryFrom/Into implementation that works irrespective of the backing
>   type, but as far as I can tell this would be difficult to achieve.
>   Just throwing the idea in case others are more inspired than I am. :)

Yeah, it seems difficult to me as well since those macros need the
full type information to generate the trait implementations.

>> One last point: the current `Into` implementation relies on
>> `Bounded::from_expr()`, which utilizes `build_assert!()`. So the
>> expanded result looks roughly like this:
>>
>>   impl From<Enum> for Bounded<u8, 4> {
>>       fn from(value: Enum) -> Bounded<u8, 4> {
>>           // Compile-time assertions to guarantee `value` fits within
>>           // `u8` (Omitted)
>>
>>           Bounded::<u8, 4>::from_expr(value as u8)
>>       }
>>   }
>>
>> After some experimentation, it appears that the compiler correctly
>> optimizes out the assertion if (and only if) the `Bounded` type covers
>> all enum discriminants, though I'm not 100% certain of this behavior in
>> all cases. Can we approach this better?
>
> I think you should also be able to have a match arm for all variants and
> call the `Bounded::new` const method - hopefully the compiler will
> optimize that as well. That or rely on unsafe code and a (hypothetical)
> `new_unchecked` constructor for Bounded, since the macro can infer that
> its invariants are respected.

This looks much better. Thanks for the idea!

I'll update the implementation based on your feedback within this week,
but I'd like to ping Benno first to check whether he's satisfied with
this v5 before I send those new changes.

Thanks for your patience.

Best regards,
Jesung
