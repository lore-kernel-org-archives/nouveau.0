Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23447EF4EC8
	for <nouveau@archiver.kernel.org>; Mon,  6 Apr 2026 09:03:29 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C4C8F10E22A;
	Mon,  6 Apr 2026 09:03:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ObDdco2B";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C094C45640;
	Mon,  6 Apr 2026 08:51:52 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775465512;
 b=1D6muulm1CO0by1p2VcXn4kpIUsS6gRI/LOJQgJMmEa1j+IgLpqWNe/1Y6u3zzi2JBIV6
 u+cTbIW3pgmy+ehhPTJdwrdPJKgk3g4KzgUpiEz4wBqq3USzPUPBEjmWL4KL7oAHzn5SjGL
 4/IZqpiNqZSVoNqak/bK6SoPLFzsOFe+LfKbYAonGmM772KuzgWnf+98jOl/4kpLMTpy/Wl
 avtJA6UCGf7sTR9OAxKWwrDxUQwYfGWZm+YOeESQZY4gHaCrgkJomFD4npzXctKR8OdajEt
 XjWAigsBg5bPvoeYVee83h5N1os/PRpdyoid7/vP6TyciKvFIQlEKPDBuFmA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775465512; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=iVamUPJfkbP2PYNa14ddDsteyLquBt95MrPlozlxwT4=;
 b=KnSqxt6QVWLw+NshpoIAO/iQRvIAuj6tn6Jx2PRP1rkFP3n/GVgvGgGnGn39bGKbJ+nFC
 LMjnZdKxSG65AbbjfrsfV4moi02a865+h/jJUdUchQxK/aWdcbjRe8Jpdsw7eEYxOgr1F16
 3Aau+pckNezT83b5umhRklYeIOMJCemdXRQHiK5wj5ErjFS5iG+vkGLrOykvvBSCHqb/mBu
 Nx0fl4z2B2+TP9WY7j6ztcaHFYw01MGLSr/7uhRmUqMrv+XUzMTjyyIPEKHcNRU1P/Jal0w
 iaCU2U6WooY2LB+/fN8ZyMXzamiz0fzx00c3mPftJk+cM7Yv7uNh2zlqB1XA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 63A4B43DA8
	for <nouveau@lists.freedesktop.org>; Mon,  6 Apr 2026 08:51:50 +0000 (UTC)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com
 [74.125.82.173])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 364D510E220
	for <nouveau@lists.freedesktop.org>; Mon,  6 Apr 2026 09:03:23 +0000 (UTC)
Received: by mail-dy1-f173.google.com with SMTP id
 5a478bee46e88-2c7e5f38a69so203272eec.1
        for <nouveau@lists.freedesktop.org>;
 Mon, 06 Apr 2026 02:03:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775466202; cv=none;
        d=google.com; s=arc-20240605;
        b=B6uneUYyUtuOnEMRscehjT4zV621J2kpdmAGqyhLtmMEZ6a5gwdSItj0BpALa024C0
         w94xoUy0PbejOjgMMXlKRrGF+dRmfs4Mn3Id7FsxaTQ7yKqqNCznKvSQYvxSsWsEtga2
         /RCV2MTmttclgl8/pcMY9xy5fzGKh4obCKsF1YygSSvDmw2GEaFTZJvBGQrVEvdXQqS8
         DdJercNUeytWAI8jHCut1fPQTuUFl80DSO2zyE2enh4zNfCblMJOG1ioQP45zXowhDFt
         H1azj87+5hjRxobfqqK9cUtkF4RsBuvGB5rKhWGozQFMLlNzjHQeQEEswE0no/lhIAus
         0v8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iVamUPJfkbP2PYNa14ddDsteyLquBt95MrPlozlxwT4=;
        fh=OKu3/RMxS+WVdOkkbPNbBo5mZAPmtODMk0r2/e2MGuc=;
        b=XZ+TJn0FBpgCFMy9GLyl4nFETNldftCXATbLLMXUasGFx/jq9PYKm3PfdE1crmZcJG
         nonB6xMrvvM+jUVy9wSyCvrxqEkXVFl2w/56ObAJ+LHk7x/9XZ7Xv8cusVdPVygwlCss
         Z+gFfjljhs99XF1xnLLCJL6HfaeOuseMzYftA67M38v9sbi+bOaXrwue9+5XPnqarPyn
         EG7IJgLvSRHSKYAilXbvQyzn0/n9pVoHpka4dWRN8cymiVcxpN7AMW3tr7zu05PGrFgM
         3NVRCuSUO98exgJB29t6KQ2rN8K6VPoYrClsbk5emIpPg0J+MHl2vAIgo3lBwHJNjC/S
         ygdQ==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775466202; x=1776071002;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iVamUPJfkbP2PYNa14ddDsteyLquBt95MrPlozlxwT4=;
        b=ObDdco2Bg0dx0e99TdS7C3X/cHhJdQ7lmNzTjSSaEmQvEklwUZtMmIxT4aCUcRsk/S
         cXoKOp4VCnenQ6ZS6kGsWMUDl5hWeVDogZ7FL79ExKkwDquTSLh+1b+2KvS8eM4rN+Iv
         sA8ZsQzdevx5sR1Ry8WQQAjOZo4oJschAwcFATPFg9wVvys0i6AkdBfBUZLPWnvvsB4a
         OKRgWrk+UFxcYAY6I6LeSA8RZwJ6cOifF4sA0fIKyzXHKMeg5TOvjo8up+GiDXc3o5o0
         Pwi/fiCyb/shxJKBmAIcY6P5P4dfwrQ/zg7rO1pSgb3yV3Vj/shshlvwgziqmUUw7Veg
         HI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775466202; x=1776071002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iVamUPJfkbP2PYNa14ddDsteyLquBt95MrPlozlxwT4=;
        b=P1QhCcxHAKHVmb3Yb0MSsuT3i/voZlsDPm7bwcQq8CkmVvU+alByuoQ/q2H4nuxFBp
         2Zelw24YWtVcO3lb3NXrS9FdIKx6z7TpJ41jIs3E/o7O2zsw9q38EnJ4I8FkXddDEzvi
         cBosrUda1+Hfvb6y8jhEhcy3StKATds+gMKi/bGE60B/ImDw/fRlNa1+t6eNeM+HWltC
         Xk1Okp3dSzaiLk+PMKHR9PFvsT9cJBo6e50WhNGGFgIDhpRojkuSf8ND8L5HnNJi/Vzi
         y0mrNdQzoGJOvA+MmPxgtr5CG0+pPHLr03zRRkVEswBTve6a1Y8DtDB9G32gk+cIpd9T
         ZQcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWY86TMUhZl6N/UQCqg0PzEP+azIXqfKT8Nmeniocci9BEQZ36LxnM/CS17yv0MsncDRGFxT7lj@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvvQin6hW9eYqHtlDKPozbIv4yoiErNBySxekL5+Hjbw4DvKPo
	XTCLTJholraahYpbvpoVoG8cGzdxerf7PiaJ9RmhR+zPpJFHhZxZJFqmnIP5MepxqZrWxHCwaF8
	iTfWPIyoimIjncn/i8djcOf8+SdF3MJ4=
X-Gm-Gg: AeBDies1D3DVTIMhJxl2e6cGNbVHRL+8YllapDN1gUHbRxt17CP21XSqWirkAZ67es+
	U6mXUamkf6RTklyyTjahxoyvGSWOumlk8dabq3bHaXPpEuS1+5hHgqNKNhbuGXCoKuVPczfpLuq
	15l2ERVYpugeS0iFDjf0V647GcfeOBQGJZ9a91B9To1eMvuxsxdAbl8JRPuoHtTkQzOI3E41X8L
	TLYgL1How2x/XWQeEWeJ759EOvVJHvDoNi2Srb1apfED6Mx4GC/9WQGUa3i9qpAgZ/IahSYsLbD
	AdAdpFHE+eCg9F82vt4DLki6af9hGFxaHoZ5GJ8IQHktEXdRhpoW0WPNkacItluFc4+OkvItn66
	bM5OSYF5KwLKZOjlu6h4QIKc=
X-Received: by 2002:a05:7300:2315:b0:2c4:76a3:bdfc with SMTP id
 5a478bee46e88-2cbf6897126mr2280931eec.0.1775466202269; Mon, 06 Apr 2026
 02:03:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260405235309.418950-1-ojeda@kernel.org>
In-Reply-To: <20260405235309.418950-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 11:03:08 +0200
X-Gm-Features: AQROBzDwpcCEtASRfptsJ0WJ2jdyaJlOCl6SPsL-e-w0TnWmNnUbHOjTvtft1Wo
Message-ID: 
 <CANiq72mnGArtgAbe7xXZCYW1x7Zd5hozfnzoftaGy9rxoLO4ew@mail.gmail.com>
Subject: Re: [PATCH v2 00/33] rust: bump minimum Rust and `bindgen` versions
To: Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: UAOWGSE5HE2K4NR2PEQB3X2NZOFI3EEC
X-Message-ID-Hash: UAOWGSE5HE2K4NR2PEQB3X2NZOFI3EEC
X-MailFrom: miguel.ojeda.sandonis@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Courbot <acourbot@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>, Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <david@davidgow.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>,
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>,
 Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@kernel.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org,
 moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/UAOWGSE5HE2K4NR2PEQB3X2NZOFI3EEC/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72mnGArtgAbe7xXZCYW1x7Zd5hozfnzoftaGy9rxoLO4ew@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon, Apr 6, 2026 at 1:53=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> As proposed in the past in e.g. LPC 2025 and the Maintainers Summit [1],
> we are going to follow Debian Stable's Rust versions as our minimum
> supported version.
>
> Debian Trixie was released with a Rust 1.85.0 toolchain [2], which it
> still uses to this day [3] (i.e. no update to Rust 1.85.1).
>
> Debian Trixie was released with `bindgen` 0.71.1, which it also still
> uses to this day [4].
>
> Debian Trixie's release happened on 2025-08-09 [5], which means that a
> fair amount of time has passed since its release for kernel developers
> to upgrade.
>
> Thus bump the minimum to the new versions, i.e.
>
>   - Rust: 1.78.0 -> 1.85.0
>   - bindgen: 0.65.1 -> 0.71.1
>
> There are a few main parts to the series, in this order:
>
>   - A few cleanups that can be performed before the bumps.
>   - The Rust bump (and its cleanups).
>   - The `bindgen` bump (and its cleanups).
>   - Documentation updates.
>   - The `cfi_encoding` patch, added here, which needs the bump.
>   - The per-version flags support and a Clippy cleanup on top.
>
> Link: https://lwn.net/Articles/1050174/ [1]
> Link: https://www.debian.org/releases/trixie/release-notes/whats-new.en.h=
tml#desktops-and-well-known-packages [2]
> Link: https://packages.debian.org/trixie/rustc [3]
> Link: https://packages.debian.org/trixie/bindgen [4]
> Link: https://www.debian.org/releases/trixie/ [5]

Applied series to `rust-next` -- thanks everyone!

Let's see if we find any issue in -next.

(If someone wants to give tags today, then I am happy to pick them up)

Cheers,
Miguel
