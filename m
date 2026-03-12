Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A18106ACDD
	for <nouveau@archiver.kernel.org>; Thu, 12 Mar 2026 19:20:28 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AB94D10EA9C;
	Thu, 12 Mar 2026 19:20:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eKa/GtPM";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 34166450DE;
	Thu, 12 Mar 2026 19:09:47 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773342587;
 b=z8zCyx3kotSxqXX738XIDjY/aZer3m+bjJ5ir7oLSCI0zQ0K8LU8w2f0QxwfEoKDnWvPx
 3ulUEcw7wEJ8MrBVlF1fe+jqTQ/zb0grD+tQXgQyLqdT33iu3SiUqq5b6ano7mn2p78aG8a
 /vN+wFTeqkkcO76ZMRaHZIh0Csor3WRHxTicuiGqOKpzDDQNuQM0CkeArMK4qC9CC83uFGI
 EWWcii/41+fRxudIQIGBLQf1aXOBKMVCytrJb4/tviPatWC+o/Z7phqeYi4Chv1QY0FyokB
 YdAs94b0aO9Y5HJ1uJbLtNwLPr7BAyE08fXmdO9BhctGKnJLKRVhfptmLPkA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773342587; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=sqyBefgbThwlgKP9KCSuGlJgdIuR2RT0nMZ3gZqSKA8=;
 b=zezF865d/yWVeB1oIsR2kyVN5vkxvQlGXm0qrLekbMIS0qqO9CVXygg9vTJL10WhCNh9n
 1phy+gZZrmPJBNLL2n5OeMFWokKFGqGGruMDhWTf9Ior4QPsHyV9eBTWas/T7F96hO27HPT
 mHAAyD5uVl0nTWx9n698cwbb9rGApqBeuEmO3YzsKdybKBqCqeSrdwFtgqw5/aXHCFO/KGY
 A2zjC6tkVitu+l5Iz1GcB5uxetb0L/im2BBwkGfANoFdq4a8hjn9layLKHYONq6arFQfcWr
 Irmf3PVnfEN0Xy/OTgxwuV18TVgR7bXaW9eC4U/6G/5wqrFpicZjuAemhQOw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id F20BA40696
	for <nouveau@lists.freedesktop.org>; Thu, 12 Mar 2026 19:09:44 +0000 (UTC)
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com
 [74.125.82.49])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4133110EA9A
	for <nouveau@lists.freedesktop.org>; Thu, 12 Mar 2026 19:20:23 +0000 (UTC)
Received: by mail-dl1-f49.google.com with SMTP id
 a92af1059eb24-12714f01940so65243c88.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 12 Mar 2026 12:20:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773343222; cv=none;
        d=google.com; s=arc-20240605;
        b=GP6LeOpzBsoMPSaaSUdU6hca/c1i+AVOKzPt1tJjTpP+3dDXPMDKhxMjBGg+nTeXyR
         b127QeqJgllxf0kqGrTsACr6GF64Qu1iSKBkvRWbNCbWE07Q2ge00ZTjvyvJpXjzXNUc
         uGQLMtgCGvBYGhxEDKbYApadcTpij8nzIkHvwWot5lWj1iU8VzK6GGKxHUokRRo06fY3
         3J5W1rZ5XI/cUJWCY6m62D1vPoVQ329eUdjQyqebLjc5vTk/33YIm1cvcoUp8iO7ZPZ1
         pWcF4gkXPV7FYQrYN5pyDeyume85wwz3Ys/bmnYaUSw4uQfHNV3tTIIlouiQiyYo0jJo
         ucgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sqyBefgbThwlgKP9KCSuGlJgdIuR2RT0nMZ3gZqSKA8=;
        fh=izfoB4g7Z/GKMPyEdGqtNER77uurrmg5tS5E8ak1dA0=;
        b=gGgfPkUw9/61eaYXpD4P3c3CPfwbdCe8UluMkkOFU7g4mDTCTB78pNUlhcT73TQQUE
         +QhWEgApNoyZQIZLh5fPREJx3wLpW3ylEwGlAUCCmDYQJZ3AqWxofOHgByyllbPL5Onq
         OB+0EjaNGgVDpFlZ5ANMoHJ2jzXcDYxNJjL4S6bH5TmaIYrDM1CO+1S2PMaXxmT+qLf0
         wCazR7u14+9V9oVdsnnFjPEVj/RET5YECWywG9TVIKj++flSc3b7KKBswCG6ogdxlPkH
         FXVrCjZW4UcBzy9E8o+SwoU1j9Bh0HY1mNaud0xRaIPUAk01M6lPu6/0QF1KH9S0xJg3
         ZpWg==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773343222; x=1773948022;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqyBefgbThwlgKP9KCSuGlJgdIuR2RT0nMZ3gZqSKA8=;
        b=eKa/GtPM6DQyTDU1NXE17k03ynX+A5tbTCcDsNZIKXsmdmIq/2Vu2FvzIyDsBMF2kq
         3LB2Ba4NSm3HX4KTlxWs+XQe7CY4o0RwC07+JyWNzmZN4cgxB5VvH9RFlgMMxvbwKQ44
         e+9z7Rn+mW8nPeGorv2EXGrujJbIU/SrcoLjvuLFZFF9GuK65Qq/Orfm9g4r3xVVuQXm
         HNWJp0KcbVTZyQ06X0lG8/CefLI7VEfGZxw08RN70KxirSfYU8nRdXFRunAnrQz58EH5
         aCHWY0Lz7Tn3GVQ/vQxpnNi24rSzCQnwg7YwDCM6xkkU8ojuVnugo4ZbMgRi6ah2Clup
         /gsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773343222; x=1773948022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sqyBefgbThwlgKP9KCSuGlJgdIuR2RT0nMZ3gZqSKA8=;
        b=VEvL72jsHqzjKYhpTAZ7JshGwDlFeneCtG+Tr/g0dvCcnH7x0YBZymiZsRb2twnEaM
         pMueKzIdhiINBOD0drZrK2EozE+FPUcwAZAjX9vViFjaZ1CHJa8cg1QX/k7fgnh30KuK
         s3gXk8JvtRY8IvjoPCZXkBmVI0NBUSi2//EIDIsqxjgpHSPjnqUZ6uGyxf5X3fwcezEM
         XGFi1XpaOTajeb+R8Y3hkCt3bj/Xq+osFz2SWT6eQHJ1xIlQbFkA+kZwc1KvbAeONmBn
         uaBlFev845Nw1TG2uKftdvF+8ImJ160jv6RWJBlajYyiF7ie4tLzAzLfk+TD1U8cNPWG
         D1jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgHVdW5jawqjy2A94BvbJBx49w1PG+qKRI895yPo33rt18WER2F1fVlAl246BsrSct9Vbz+mZO@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybPkuMUybLHz5ClPBYWJPxoibDM2Ww1huM3hCsnpOeqnrAKMrT
	BqCwUnFXboLbe4FIGQSAMoh6AA+XHIGqD/QZVum5f7TUZYQkReDWzUTdyrcV6XhO8JYwrb8RBSR
	W4iyEtTFn/aJ81VbMeIMBt+Vdpw/Zw7E=
X-Gm-Gg: ATEYQzxKH3pbmsqWJxpIAtaExHNGooQvV7zHqJfxCq9pjq0bAauL+9jF2Rr6WbHKFGI
	osuW7knqSrkabigpYM3TxcAR4hc7vDShoelvjsCPtsCKMjwZjZJR+mHrABMUgaxe9u/FaHasxPb
	oliBOZiiVVljbGb/iUzViEvge0fbst+YoyWezstEHcvMgCYAE5Oj/aBJ9SkUazAWX7I+o/umGmv
	VZj6NT1oMZhAdMr3SH3onhr82VP8JqUidNsuFauiRSwkDI9jWyORZeQFkAZjuWMhUzXhW2+FAFd
	cV7DSh5nPNGdqiYXCmZ+RTUjD+8Vjv6Wtx4FXfWKxgDF1jKG5/RMjWgHiDX1hF9J/vs7NR9cT3x
	/kSfYPYm632gKhum8jgaKzjQ=
X-Received: by 2002:a05:693c:3113:b0:2be:ca4:e136 with SMTP id
 5a478bee46e88-2bea539b6c2mr239955eec.2.1773343222351; Thu, 12 Mar 2026
 12:20:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260306203648.1136554-1-joelagnelf@nvidia.com>
 <20260306203648.1136554-2-joelagnelf@nvidia.com>
In-Reply-To: <20260306203648.1136554-2-joelagnelf@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 12 Mar 2026 20:20:10 +0100
X-Gm-Features: AaiRm53FHItUdFEegxUW1-4wt0_otNvbfdbd3Uys6sYfgMCnCSAVDf6Yalvkc30
Message-ID: 
 <CANiq72kEnDyUpnWMZmheJytjioeiJUK_C-yQJk77dPid89LExw@mail.gmail.com>
Subject: Re: [PATCH v12 1/1] rust: interop: Add list module for C linked list
 interface
To: Joel Fernandes <joelagnelf@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: KEU64BYG645TBPYU4TREKZTZLYCCDMW6
X-Message-ID-Hash: KEU64BYG645TBPYU4TREKZTZLYCCDMW6
X-MailFrom: miguel.ojeda.sandonis@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Alex Gaynor <alex.gaynor@gmail.com>, Danilo Krummrich <dakr@kernel.org>,
 Dave Airlie <airlied@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>,
 Nikola Djukic <ndjukic@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>, Elle Rhumsaa <elle@weathered-steel.dev>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Alistair Popple <apopple@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 alexeyi@nvidia.com, Eliot Courtney <ecourtney@nvidia.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KEU64BYG645TBPYU4TREKZTZLYCCDMW6/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72kEnDyUpnWMZmheJytjioeiJUK_C-yQJk77dPid89LExw@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, Mar 6, 2026 at 9:37=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.co=
m> wrote:
>
> +//! // Create typed [`CList`] from sentinel head.
> +//! // SAFETY: head is valid and initialized, items are `SampleItemC` wi=
th
> +//! // embedded `link` field, and `Item` is `#[repr(transparent)]` over =
`SampleItemC`.
> +//! let list =3D clist_create!(unsafe { head, Item, SampleItemC, link })=
;

Was the patch tested with Clippy? It has several issues.

The worst news is that it seems the "supposed to be `unsafe` block"
does not count as one for Clippy, i.e.:

    let list =3D clist_create!(unsafe { head, Item, SampleItemC, link });

So we get:

    error: statement has unnecessary safety comment
        --> rust/doctests_kernel_generated.rs:7416:1
         |
    7416 | let list =3D clist_create!(unsafe { head, Item, SampleItemC, lin=
k });
         | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^
         |
    help: consider removing the safety comment
        --> rust/doctests_kernel_generated.rs:7414:4
         |
    7414 | // SAFETY: head is valid and initialized, items are
`SampleItemC` with
         |    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^
         =3D help: for further information visit
https://rust-lang.github.io/rust-clippy/rust-1.94.0/index.html#unnecessary_=
safety_comment
         =3D note: `-D clippy::unnecessary-safety-comment` implied by
`-D warnings`
         =3D help: to override `-D warnings` add
`#[allow(clippy::unnecessary_safety_comment)]`

For this, we could write them as a `// SAFETY*: ` comment or similar,
to make progress for now, but it would best to request upstream Clippy
to detect this or to rework the macro to force the `unsafe` block
outside.

In addition:

    error: unsafe block missing a safety comment
       --> rust/kernel/interop/list.rs:357:17
        |
    112 |     let _list =3D clist_create!(unsafe { head, Item,
SampleItemC, link });
        |
--------------------------------------------------------- in this
macro invocation
    ...
    357 |             |p| unsafe { &raw const (*p).$($field).+ };
        |                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        |
        =3D help: consider adding a safety comment on the preceding line
        =3D help: for further information visit
https://rust-lang.github.io/rust-clippy/rust-1.94.0/index.html#undocumented=
_unsafe_blocks
        =3D note: `-D clippy::undocumented-unsafe-blocks` implied by `-D wa=
rnings`
        =3D help: to override `-D warnings` add
`#[allow(clippy::undocumented_unsafe_blocks)]`
        =3D note: this error originates in the macro `clist_create` (in
Nightly builds, run with -Z macro-backtrace for more info)

So this needs a `// SAFETY:` comment on top of the closure.

    error: this macro expands metavariables in an unsafe block
       --> rust/kernel/interop/list.rs:362:9
        |
    362 |         unsafe { $crate::interop::list::CList::<$rust_type,
OFFSET>::from_raw($head) }
        |
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^
        |
        =3D note: this allows the user of the macro to write unsafe code
outside of an unsafe block
        =3D help: consider expanding any metavariables outside of this
block, e.g. by storing them in a variable
        =3D help: ... or also expand referenced metavariables in a safe
context to require an unsafe block at callsite
        =3D help: for further information visit
https://rust-lang.github.io/rust-clippy/rust-1.94.0/index.html#macro_metava=
rs_in_unsafe
        =3D note: `-D clippy::macro-metavars-in-unsafe` implied by `-D warn=
ings`
        =3D help: to override `-D warnings` add
`#[allow(clippy::macro_metavars_in_unsafe)]`

For this one, to begin with, do we expect to have actual expressions
for `$head`, or could we constrain it for now to an identifier for
instance?

With an identifier there is no issue then -- the example currently has
just an identifier anyway.

I hope that helps.

Cheers,
Miguel
