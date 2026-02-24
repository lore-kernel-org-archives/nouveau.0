Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DD4EFB810
	for <nouveau@archiver.kernel.org>; Tue, 24 Feb 2026 07:28:45 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C5B2410E4CB;
	Tue, 24 Feb 2026 07:28:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="BiP9EZDD";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0C49543717;
	Tue, 24 Feb 2026 07:18:43 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771917522;
 b=RowxuTOWayOwT3fLAI/QTyocU+3V85Lsjz8VS3szSs93zCA090fUQ7tO5hZwifGaBzeDu
 0OQdE3tXe5jcXrjf6kcKQeTwb58MAr9zmQAermN1LLA6Z89HKUEhLZ7YSUna3JFq54insik
 +tcB5gzkYycWytS6uEpzMvPWPrnnhDBBzuW915Ddu/GW34H2/wLsD43bXqrqoW4CMxSzcDD
 abY13Jvmo5bqCTVsfWY6iYFVa5NrQxqxi/+LsWz4umOVgMraiEnkQCxHVcfMj3aMbGUFP5Q
 Dnh3vpm9obGyCYbExogAHpfJrMgSQk54qrsKUG4d0iT4BfoVUx62DJmlRyoQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771917522; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ADQ2LS0GC1QDa36+EuaOS8kzbv7z7Bp7Bm4Gt5ISiek=;
 b=eFaQAaT2YkrwCl1nFQeV7ZSVayDT6cpgLp8HDyZM26w/3u45eCLI8Kp8vrsMUC3US1rIP
 exbzac6N4xgNN+T8ebdzu+yIUdaNrrRGf30lXOdm/+1GoJkrLBRnwit+tLONiuMuHXuGskq
 U/sZONEVZ7BsW9unbUs0Dw/K5jhtgeszAlhlSDyDw2EmfhJAjNcw2/l+5M7C6FYN2F3UkVk
 gBfVWfvG1gTo0Spx61mWNEVGdTyHDN2U6Ufv4PzEuOxEXd48WvTuB/r8h46EavEuVtZsi5m
 JPoxwwj2SlSg+IIrKSMwyzvw7Ke0gyBdGd94LCybbGALt9BcTnwgac4I486g==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=google.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=google.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=google.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 9087D40ACE
	for <nouveau@lists.freedesktop.org>; Tue, 24 Feb 2026 07:18:39 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 128A810E4C9
	for <nouveau@lists.freedesktop.org>; Tue, 24 Feb 2026 07:28:41 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-483a233819aso49892725e9.3
        for <nouveau@lists.freedesktop.org>;
 Mon, 23 Feb 2026 23:28:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771918119; cv=none;
        d=google.com; s=arc-20240605;
        b=F55pctpVxmDTi8xC02BzUdewW6TZ5mFxe6k88kCkn8GizbiG/gWyN/kag1VKos8coO
         Bv3U0a9NGFvehQmy3XZP7C5IolKaRNolcOLYQU7ER5bHY6gjKXoqoJbhdkJHi+Ps0tj6
         PVOioq8ZQqt8hwR2tpn2X11C5UKjrt2VWylCDCpXSP8RQS0Yb9CqR3vEDcVy18aJKV+n
         6cSEVK1Brrw22pxuNrGBPpEiAMemnUrpnujMI6ViFmAy0K+qHHrtOTHBBE3MffAkTitH
         YVoVhUxpFR5f8tzFQLJGI3226m36lr6SmSlUXxfaHDvUm7Atokwx491XhcQhicXSqF/d
         cFbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ADQ2LS0GC1QDa36+EuaOS8kzbv7z7Bp7Bm4Gt5ISiek=;
        fh=kvX8nXUKsxN1lcXZr9GiT3SVwPLCNqL1T8db3q80oYE=;
        b=guErh1SQHdqIcxG4pzEzY/+Q0JyZfQWARJ054SNlIShMxi6gZ9xYfeblijQB70Y6uQ
         KjNMtuqM1NekgRts6h3vBVbw/4+LN5aac9sSV4kRfNL3iVqjBdsYO17R8sDqKzezWgY4
         nEjGeIraaCjvpK7BFuRCvj3npltTrL4ZJnkTGZ9khwfKYCWtCrwAEBkjQed64MARODD5
         ZVxRWjHgJhbfT7tnRGf1mEdRTERGaTvOBXhE3ueIx2ajjQojZrHO3A2eDmjzyR4UjBOf
         JviqqG3lbRt4/yuPxmI90AzKC67za9PkW0MCkBA53m8E9UqI5W96GCX2cgXBUpKN+8kf
         PhfQ==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771918119; x=1772522919;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ADQ2LS0GC1QDa36+EuaOS8kzbv7z7Bp7Bm4Gt5ISiek=;
        b=BiP9EZDDtcLpdRooNygHPLepMmIBRIcsNwnQhP6p2Y1TzWhehGC1K0ri47ycFCdKLo
         5bIyTNo4j8agl+YqC5Byg2ZtrdeqtOPozAjaEzpXRbMHvp6jjR51LRvfxJQLJDzbv5nD
         bslQgHOS2Yr+XyK+ZsXgSi7OzYpR62SeNOqzaqpdDWvtf7LaTLSZxT6JHoEYXZxx4OH5
         fV5414FkTmHr1Ba7mKYi1OgxWGGoK2lZTYfuoKHhLHYcTRdddLliIQc1lOjH3Waxxd4G
         DG5XmFJ1eIzC1Bct3Gr8sqcxNYFRBSGf/NTeGK+tc6pvnFqx1DDXPbTFPQ/pCm/vNKh7
         uf2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771918119; x=1772522919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ADQ2LS0GC1QDa36+EuaOS8kzbv7z7Bp7Bm4Gt5ISiek=;
        b=d9FxkCQ7UK61AXzKyqsyfyPyd4tVKhRHdUvJlLQBCpvQKeG9hrP2FQXC28nfsoiIJy
         2AT3jcOefkS8nvglWCxcLlqrcdLTY3LdjUu1HOff5+1UCXKlBcVpJ2EavqnQuzObPIH3
         32SlA0MQ9p4R7GXCLypr8C3oEosM9ZBlT4XVAyhqCOLsRaBvTU4imFErWWN+DftFyIzI
         +MXz9VQXHg/zAk4LCnDPQ73xmfavv1F6chKM2WDE4eb8Kb9SitU2+ibN73FQdRvviYmz
         cd3JMFADCsmZ2uyxIhXsYGLpTb4ag0b8UQz+wF6btbASeEnA0MQLuo5lo6BIo/PK9LCP
         K5uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcuqmMlUR+T4B+o3qc26PauP2Is9G/brqo3/JEL/X8CVi6pSXLpTj4mm7N7Ww5XHgsDpcX6QYB@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTVkCYru1YLNOP/4EB+SepDgi8sGU3d0kwRJPOqxZK5XuRq8lh
	VoHpj1v/c4T2OhJbtbAAjnHm0TTUfR286whCmNcdm2Ch3r7WwZHN0UFHESOLaUWHzOSHd7wIAlh
	tcAztv+0glm6ZLIuJosdupwdCu2n++IOlbAHBr8I7
X-Gm-Gg: AZuq6aIQx+uCwc+OMpPr89jAlKjb8OesR9ASVvi+fYPFN59azuTWze8WffEUePMkn9D
	Qso9rUJIch03uFlJ64N8sWPC9wbC0r3OW9sutjhsPew5/HZuQFz4to0RGJtzjot07wuWSQEuQJ7
	qEF4D+42GV+H7S4mujLv8K8INst06qT0e3lifG31P+nqnq8EjhTTzFtXasGqHk0A+REyq0vej/K
	mM/7LQBiWI0c/tuOp8DN3lqRwYgwc34KYGUPm1FApOY4wpXXbkEvhhIkVy8wqiryPNQD/lAgbjw
	7DoWdilS/pBmHoSK1HWmx+unSW2MYZGW5920cA==
X-Received: by 2002:a05:600c:8109:b0:483:8e43:6dce with SMTP id
 5b1f17b1804b1-483a963a003mr172969955e9.29.1771918119178; Mon, 23 Feb 2026
 23:28:39 -0800 (PST)
MIME-Version: 1.0
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-6-joelagnelf@nvidia.com>
 <DGJN2M93S4ED.3272CCZWMRYOA@nvidia.com>
 <a7be758a-65ee-4572-b8ba-6d4a8d65af73@nvidia.com>
In-Reply-To: <a7be758a-65ee-4572-b8ba-6d4a8d65af73@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 24 Feb 2026 08:28:27 +0100
X-Gm-Features: AaiRm50cmDpg-9YGkfyHUtxGyx8jesE30IQsaptAynPPK_BJKBTapWH8sOvIRP8
Message-ID: 
 <CAH5fLgicH9u18pWYYkQqxZBT8WEig3bDP8JFT9VfDtG6McijQw@mail.gmail.com>
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
To: Joel Fernandes <joelagnelf@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 3YDO7W5NLCZPGB2RWNIAAHEKIL3NYQLK
X-Message-ID-Hash: 3YDO7W5NLCZPGB2RWNIAAHEKIL3NYQLK
X-MailFrom: aliceryhl@google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Eliot Courtney <ecourtney@nvidia.com>, linux-kernel@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3YDO7W5NLCZPGB2RWNIAAHEKIL3NYQLK/>
Archived-At: 
 <https://lore.freedesktop.org/CAH5fLgicH9u18pWYYkQqxZBT8WEig3bDP8JFT9VfDtG6McijQw@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon, Feb 23, 2026 at 2:13=E2=80=AFAM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> Hi Eliot,
>
> On 2/20/2026 3:16 AM, Eliot Courtney wrote:
> > On Thu Feb 19, 2026 at 5:55 AM JST, Joel Fernandes wrote:
> >> +/// Create a C doubly-circular linked list interface `CList` from a r=
aw `list_head` pointer.
> >> +///
> >> +/// This macro creates a `CList<T, OFFSET>` that can iterate over ite=
ms of type `$rust_type`
> >> +/// linked via the `$field` field in the underlying C struct `$c_type=
`.
> >> +///
> >> +/// # Arguments
> >> +///
> >> +/// - `$head`: Raw pointer to the sentinel `list_head` object (`*mut =
bindings::list_head`).
> >> +/// - `$rust_type`: Each item's rust wrapper type.
> >> +/// - `$c_type`: Each item's C struct type that contains the embedded=
 `list_head`.
> >> +/// - `$field`: The name of the `list_head` field within the C struct=
.
> >> +///
> >> +/// # Safety
> >> +///
> >> +/// This is an unsafe macro. The caller must ensure:
> >> +///
> >> +/// - `$head` is a valid, initialized sentinel `list_head` pointing t=
o a list that remains
> >> +///   unmodified for the lifetime of the rust `CList`.
> >> +/// - The list contains items of type `$c_type` linked via an embedde=
d `$field`.
> >> +/// - `$rust_type` is `#[repr(transparent)]` over `$c_type` or has co=
mpatible layout.
> >> +///
> >> +/// # Examples
> >> +///
> >> +/// Refer to the examples in this module's documentation.
> >> +#[macro_export]
> >> +macro_rules! clist_create {
> >> +    ($head:expr, $rust_type:ty, $c_type:ty, $($field:tt).+) =3D> {{
> >> +        // Compile-time check that field path is a list_head.
> >> +        let _: fn(*const $c_type) -> *const $crate::bindings::list_he=
ad =3D
> >> +            |p| &raw const (*p).$($field).+;
> >> +
> >> +        // Calculate offset and create `CList`.
> >> +        const OFFSET: usize =3D ::core::mem::offset_of!($c_type, $($f=
ield).+);
> >> +        $crate::ffi::clist::CList::<$rust_type, OFFSET>::from_raw($he=
ad)
> >> +    }};
> >> +}
> >
> > This uses offset_of! in a way that requires the offset_of_nested
> > feature, so it doesn't build in rust 1.78.0. The feature is already
> > added to rust_allowed_features, so I think it's ok to add
> > #![feature(offset_of_nested)].
>
> Maybe I am missing something, but why should the feature be gated behind
> that if all compiler versions (>=3D 1.78) support it either in a stable w=
ay
> or via an unstable feature flag?

The rust_allowed_features list only applies to drivers and such. It
doesn't apply to the Rust crates in the rust/ directory, which need to
use #![feature] annotations manually.

Alice
