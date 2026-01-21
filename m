Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE26D262BE
	for <nouveau@archiver.kernel.org>; Wed, 21 Jan 2026 03:20:30 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D25B810E694;
	Wed, 21 Jan 2026 03:20:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="b4TptX+0";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 12F6544CC1;
	Wed, 21 Jan 2026 03:11:44 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768965103;
 b=rNWvtYp5buqD+godME/nMgOzHooEDa3VRlDtXK+xNBLB++85+8jL9rrkKRvZzKKRuthAr
 gXecEh8lpJdM1Hy8V8PHxPnwo152hw0tgmGHezWIdSavN74gxoEz8xQIb9JRCLkUMHHA6Dl
 RYg9yb6V8u6Lh0qykP19FaMbMnn4S2YzwrUUqlTFVY/6ZjzT0EvvRnXcFFxde36SP5Vk9i/
 LEg2V6Oeu+iinzbNa9ysXmTYNpDA79coAB4SShWwQccT6AxVSdDes6mC6mwIEoXyVod0169
 gFQIWrW/lFnNN5hyUNBmlk6oCg2Rca4O2a2jAMNWwmznUbhNe5vAYQ/51xPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768965103; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ENJy6NtKsO9aQqhGsET5QqkuIFBDfe/xZv4HvwTdfk8=;
 b=SQxuezK5Iq834QbZinchcH4iu52Q7BZVLkNH2JcOwRRgziP3QAyn9w9dbbyb1w5h65ndc
 6LpEKUxob7Ffv36k7/QvLNCbZV6Cq86DqOKKfmNdDHB2PilYJFRbYZbqGmEu7uNWYsxxT+7
 QPXMeSnYsdiNE3UnectY+Mic+sMRsOOqDlrAk9s4IorJ4fRjwcnP8NUYMG3jFH60IA7nJ1w
 Xq2PDAy6BtEazH3AogjrQsPIcFl0OCYc34649dbwok4WP8ND52ZpYT7puWV0uU4FOWKRi8t
 +XkPQ+lbjWJ1yPgPDf9V8xoqXK9QqJAxn1mqIJcm38JnqCA6bAlOtme/OZ/g==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 56ED54401E
	for <nouveau@lists.freedesktop.org>; Wed, 21 Jan 2026 03:11:40 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BB91710E1F1
	for <nouveau@lists.freedesktop.org>; Wed, 21 Jan 2026 03:20:25 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2a0a95200e8so39917605ad.0
        for <nouveau@lists.freedesktop.org>;
 Tue, 20 Jan 2026 19:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768965625; x=1769570425;
 darn=lists.freedesktop.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ENJy6NtKsO9aQqhGsET5QqkuIFBDfe/xZv4HvwTdfk8=;
        b=b4TptX+0R2pVzbStrgWpdqi0TrK7Gdo4JYQxWlyedfeJj8nsv/rM7/uz7zjK+Klp+c
         RmbLqNepEvwlmutpZNvKwBA59dmi/rhDStck1FAnFeaAnel0P1+K+IPh0XZlF09mGxMB
         mBxzM/4VP0OYxJ429LdEyEiq6hjULEe4rx2xEqncyJj6WT/XJxHAFa36soiADlQfwuqf
         6eZg1WT9IoBjmGMsNbWBbMUBYXQflvKoWVP9NkDc5zw/sQqQWn9Dg+SOJSIfqQjULgMQ
         solXBp+NhYXbaYjnaVM17/kf0OJRXgItvGlhMSeii/53TTrJWQF8oBSm8ztGCPjr5rPa
         eHGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768965625; x=1769570425;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ENJy6NtKsO9aQqhGsET5QqkuIFBDfe/xZv4HvwTdfk8=;
        b=FwDP2v7s9rCgnOOVPpCTYJYQXDv8tIs2z56OG7PVSzuj9RwjsejRvOnsoN/DDEDVpE
         yvOWZfH6lnbuqaRMK0HdBHSnwJmsg6JqBMg03o2BGJi3Db+jgB/99gZma5GV2/6i0nMO
         A/CKXYDcHVESl5YAebje/f5gBPU4eSo2z+jpt9OHuBlO0XQbhknKbgx7qBfXDg8vinWe
         RPXhnnE6hKeT58/IojJuxUm8ySD5Kcz7nysszzr2f8zy5yM+ZtL0TVvUSUGp8YSuspW2
         ZStEYraPucRHs5ElYrmfcRC3c20ni6By3C/82wlUc7eoxsbd3jInX07wxiLEboPpIwph
         fqrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXK+GUWHyRTCzsAMTmCKvSKLg3Z9o7U1jMPNdub7qjO1dPzUBhXMyURl2O3fHrNNuImYVIBW7Dj@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKew9tniWktkhRolGgHK9+pfbUH1d+4UHZgXA0uOtePvj4es86
	SViH8wT0pn2TzXAkbGIWEa1FBeFGDV68CcF/IbfGn8WWqD9r4hI0hWvG
X-Gm-Gg: AZuq6aJS4fdz/TYYrlYIlfiVk86fjCs9O+nCODR+yzCndsid9APXstgR+RIPC7hzSBI
	fFXR8HcMH2ke/AcrL89q+kmWgfuRToIVfkFf/xRy8+QZVCNQsoCmgCYWuruZLIdphlYVn3WWsVr
	45oLwJQt/dHbhcXdeIPNtagBnKOeGv1emQUoVaRQudwYbXaAD3jLnpq8vErqoj5glbr7dWdVZPn
	lNMQLXgSR0egHaPx+xRTuEUgNV9B9f0GOMipnt2cS2XOQf/zFs9PRWuTHiMqwxKVNdDa6s+mnKu
	fTId/mT/MSSb7iajgQ9fFwBdnMKeie/chZYoP0JrocPCKPzz4i9ySiNcJPNYg/i8M4zIN4Lw1So
	FTzWq+q67tJyBVenPd3E6DBYmKZ8zawDPH2vCeuOPUCknslnnaCQe1dx0PB3iWO9842Vyr3oyBb
	LmgoYNew==
X-Received: by 2002:a17:902:f689:b0:2a0:a92c:2cb6 with SMTP id
 d9443c01a7336-2a76ad6bb37mr36121375ad.36.1768965624996;
        Tue, 20 Jan 2026 19:20:24 -0800 (PST)
Received: from localhost ([112.149.32.52])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a773de1fe7sm28075635ad.82.2026.01.20.19.20.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 19:20:24 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Jan 2026 12:20:20 +0900
Message-Id: <DFTXZ7AN65B2.ZW0EK0VZFYT5@gmail.com>
From: "Jesung Yang" <y.j3ms.n@gmail.com>
To: "Benno Lossin" <lossin@kernel.org>, "Jesung Yang" <y.j3ms.n@gmail.com>
Subject: Re: [PATCH v4 1/4] rust: macros: add derive macro for `Into`
X-Mailer: aerc 0.21.0
References: <20251225-try-from-into-macro-v4-0-4a563d597836@gmail.com>
 <20251225-try-from-into-macro-v4-1-4a563d597836@gmail.com>
 <DF7HDE1T2BOS.33WUHP49WWO1M@kernel.org>
 <CA+tqQ4JPMg7CGq7YiN2EwzzQBC2grRE5OFgRQTws+xh8UbzqEw@mail.gmail.com>
 <DF8QDONK951M.10NYLJ40UNNY1@kernel.org>
 <CA+tqQ4+Xp_Uv+O32JgCyN0vB-AJEaJdUWoWDOx0nTogeiDbj6w@mail.gmail.com>
 <DFBFMTS0ZRDB.30O3L4GMYW4XJ@kernel.org>
In-Reply-To: <DFBFMTS0ZRDB.30O3L4GMYW4XJ@kernel.org>
Message-ID-Hash: PXQV4CWUJ7ECCC7LN6MHXDPGIEX4YHRX
X-Message-ID-Hash: PXQV4CWUJ7ECCC7LN6MHXDPGIEX4YHRX
X-MailFrom: y.j3ms.n@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PXQV4CWUJ7ECCC7LN6MHXDPGIEX4YHRX/>
Archived-At: 
 <https://lore.freedesktop.org/DFTXZ7AN65B2.ZW0EK0VZFYT5@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

OK, let me reignite this series...

On Tue Dec 30, 2025 at 6:09 PM KST, Benno Lossin wrote:
> On Mon Dec 29, 2025 at 1:29 PM CET, Jesung Yang wrote:
>> On Sat, Dec 27, 2025 at 1:57=E2=80=AFPM Benno Lossin <lossin@kernel.org>=
 wrote:
[...]
>> To sum up, I see three options:
>>
>>     1. Drop support for `#[repr(C)]` enums entirely.
>>     2. Special-case `#[repr(C)]` enums: allow them to default to
>>        `isize`, otherwise require `#[repr({integer})]`.
>>     3. Permit missing `#[repr({integer})]` generally.
>>
>> I am personally leaning toward Option 3, since our existing
>> compile-time check provides a sufficient safety margin to allow this
>> flexibility.
>>
>> Thoughts on these?
>
> Looking at the nomicon documentation [1] again, I found the following:
>
>     repr(C) is equivalent to one of repr(u*) (see the next section) for
>     fieldless enums. The chosen size and sign is the default enum size
>     and sign for the target platform's C application binary interface
>     (ABI). Note that enum representation in C is implementation defined,
>     so this is really a "best guess". In particular, this may be
>     incorrect when the C code of interest is compiled with certain
>     flags.
>
> Which to me reads as "don't use `repr(C)`, if you want to know which
> repr the enum gets". Especially the last part is concerning to me, as
> the kernel uses lots of (bespoke) compiler flags. So I'm thinking we
> should just drop `repr(C)` enum support. Any thoughts from others?
>
> [1]: https://doc.rust-lang.org/nomicon/other-reprs.html

I think the last part you mentioned is less of a concern in this
context, as this series does not introduce new FFI boundaries;
`try_from` and `into` themselves live only on the Rust side and do not
interact with the C side. We are indeed relying on Rust's "best guess"
about the internal representation to perform compile-time checks, but
these trait implementations do not pass enums across the boundary to C
code.

Your concern is certainly valid for anyone introducing new `#[repr(C)]`
fieldless enums that interface with the C side (and we may want to
revisit any existing ones). In our case, however, it should be safe as we
ensure that discriminants do not overflow Rust's own internal
representation of `#[repr(C)]` enums.

Best regards,
Jesung
