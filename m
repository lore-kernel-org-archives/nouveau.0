Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39392E9D826
	for <nouveau@archiver.kernel.org>; Sun,  5 Apr 2026 23:15:59 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4E8A610E1DF;
	Sun,  5 Apr 2026 23:15:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mjJR9pVb";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 28F76455A2;
	Sun,  5 Apr 2026 23:04:25 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775430264;
 b=d38fvVPfU7Y5Hq+g7vOuuVitOL4Wq9caiEnxhpCkj8PtGAYZ4UBGW/RotAq0yQqbWV/NP
 hlCeVtr6YL1JqoUrtrI4VGB2Jis4kBL0wxEEQNUoOId/5hv+cSkpUjzLI5AJPv3QwIzSxlr
 9d2D63Z0k+4/URnGzdpChQ6Xk+MeKt5KGvSoPsq15HTxM4caMYzm/l0YruRq8uAPpJL1dgD
 jvBUR0n4/scfj3KBx30tHywqowzNOFCUMp3iu31YDE+wrjxwAS2wbV920Xb2up95uwLPYXt
 v2m3/r5rj1pfD1g3EQuXLbEEDjWuGORE/pD5jY6x1bhUMwVXf3mVc4dPyp9A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775430264; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=7nRF2alQvQ2aT54Jx0Zl/2nZdMqcYryRscNapi5ZMxM=;
 b=oEwqzjDHiJgELNWuBV+gSAFj6sQl6q+o2xXfUZE6fMH6EHUxW3PWiejunj3ezFak4LoUV
 mkKDS3Jvi4F9Hu/Y0qjmxEKFVbdtYwRsAzea70v5LroSS0bJG6htKZ+stN6TghADpr0ogXc
 4NXfOZmFYkyDd6RQHjJBBjkHCeOoauAyVT+UBaKn6YIwUVe9/AkI7Givwj4/aTBHaNDUqiE
 q1tsk6YdSHcTRqGoEEcD7wgDhSLsb3hw6Buv1CJA+uDx6lMGVgHwR2joBsFeIR43arGkCb8
 eY2En6rqm7Hlhi/DwHjb3c+uTQM93a9hoQhBnsQy1Rx/JUrrbhZNd6H1K2bg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id AEC6B42DA9
	for <nouveau@lists.freedesktop.org>; Sun,  5 Apr 2026 23:04:21 +0000 (UTC)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com
 [74.125.82.181])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9A7E010E1D8
	for <nouveau@lists.freedesktop.org>; Sun,  5 Apr 2026 23:15:53 +0000 (UTC)
Received: by mail-dy1-f181.google.com with SMTP id
 5a478bee46e88-2bda3b4318dso224432eec.1
        for <nouveau@lists.freedesktop.org>;
 Sun, 05 Apr 2026 16:15:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775430953; cv=none;
        d=google.com; s=arc-20240605;
        b=Lf8k+uxEIo3C6MCj3LfQDk9Ke5vokdGwKDod3O+3Rxwx4n6iRykdmEVrZ67T2VDW3d
         T10BybL9xSUOrkUJryn2GfihwV58YU0WlhxcHe7A6JvIyKItWuHo6SPMJtroDGYw97sp
         RloPU9KVMUgsbnVGJ5o3AjUL0vrIX0dS2GTKv2G7K41OKppQYyFEjnSP4Z2JLjCDOPwb
         68TR8Q/Q8X1nKEVomdu3yD1h9Wy5rHOqEmUvgOyA8nesyDvw+nqyl4rYiKRfvRKxzjKK
         dLL9SS2K7U+0oWDgm3z4M3k1gc//FwXxeeYMRN8dyKWUawOMdCUTbkvWwlLfJTUKZmv1
         nuAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7nRF2alQvQ2aT54Jx0Zl/2nZdMqcYryRscNapi5ZMxM=;
        fh=0SAh0J4i5sjzY3jOaqJ2aY2hz2AZyUYaGyxQIQz9TD4=;
        b=I+VYZlopaoiwdb5zYC6VeVK3cGnHkJroLnFq3PtN7aIP4CMrbokQhKTu0Pq+6P4rVr
         nmBcOnuTjIR7ezu3/DYFrsoWN+G6TFpG1t+ZVQNImnA46RHrzM0qGB80k5TarBgy6ysB
         +7Kt+oI2l33NLwVsgLaT7yiAsf4qHuQ0FwEDxGrX5cNWIakK5cueFnwq3iz/njlnaASw
         LYH3GaXNpwlvG/iGQgxDVNRcz9bXOKfiX0goBXQOpobCa6O3MOBdzj0BYdTP6JDlge5W
         SzukwbG50Jtul6LzwGH01pCQA2GVnaXkDHpyRJQoXS+CavGpVdn5anndWrNTIWgfvmIy
         yNgw==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775430953; x=1776035753;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7nRF2alQvQ2aT54Jx0Zl/2nZdMqcYryRscNapi5ZMxM=;
        b=mjJR9pVbqN9wKoIoNc7hGRSETuNn9LWjr1JHb8J0C1iRNvq3Z8LZhBA7m913ef1skA
         1GwfT7Cl3j8S7B4t11w9pre2AUEZYMqeEj2R3OLjgnuGApT5s9TVSd7zI8vcOWQVOFPp
         hXcWJ9l21Ac2MBuzYcLmx41WLg9mRf8YclHN4ZU4ZcCcxqU+JciQxDI80+0NHzbXHs/v
         fc2VBFErjVGWFj4E+u5uGzj02TSNX1OgveMh6V2I3kasXEg7vGLUgBVFwWXSdJjXRlra
         M5eg72m1Bh2knvBiPZ83mbi7SveuGzBzmpUrqwaMMI5n57cn2EuiEVbJFqrABGPP8gmh
         fFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775430953; x=1776035753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7nRF2alQvQ2aT54Jx0Zl/2nZdMqcYryRscNapi5ZMxM=;
        b=TnbMKfrbTiQPzqKMy4orFByRNiZRbjXydnQ2DXJeEbdCtPUdWPm9OYf8q7VjUff6IP
         DlSiIFybO1wqJ9pIlCmOCwmWl9urbjxQcISkxALbgqX+P650PQcpO+q28IJml43v279j
         B/1knWfbQtmIXMiqOBGzceudkXj2wvLb5mGz/9sX4/PbmhcaRBY2qIHiqxGepKD42SnV
         xY/9POqijNgTF6Cp/uDOUeXxp8yd3oc1g2RPAoslU64YcqCYfzmsXpKD8SVA3sLYgftc
         a6XiN08UCh08uPO9v4Ds9kaYGUHG6zR1EU3qKVppDXerGdb98sEIu18EmGgDXVXI2Hnu
         d7cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWL73BjnT5ZDULKkQcSq2N/ZaVdmWHfqKZf/7ozoxs3JqdHfWys0JCKyyWNoS/XrtlTDXo6fTRa@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEmad3O+RTO0QN4GR5VdV/DaJVyTc33MykXVf/xRRcgtjVLT6r
	dsRIFaAVoXYq6cPatsSKkgG74179NrGbYrnAriR/bBnADqJJEoywahj/4NHOW0uYr2/lcGa59Ne
	cPDfLmVxUFMCps3seg+OMqpSZ9QfACeY=
X-Gm-Gg: AeBDieu5e382R7wjiAbRWh7rlnGjTmmuRAfjR8nIDNkdqUsSqwXxuFnmtbIgmcdNgQ8
	c0tNXoNHNY7WYgj2nssi4UM2v6v/RPpwAhmW0SJsAmSqF02pLt4srdH0vxPC844MhHRj/qeYbxY
	+CgQIuG1E+wA5RRrAjJyU0iyg4/wmMlLi8UNetdobkbN46j1ihKb8EuF/0gNQwGBygPBX6C+uTJ
	DI1nqDyeoB7voVSivqEsMjAG6kXRmvq2Mk/qhH6koR4auaJJ8YG9NFqDydwY6496+fbsY+QjnJ3
	EgTrpBeAmjflHhdHS1f/7Gf3dArXiVUB4C7P5pgdpeflf1U0F1IMGFDC3Dxkc1FFoaDPYOOWvsK
	yo1rw9d4yTZ5js4BdlDHM4k8=
X-Received: by 2002:a05:7300:fb8a:b0:2c7:3a7:c795 with SMTP id
 5a478bee46e88-2cbf669b785mr2053063eec.0.1775430952689; Sun, 05 Apr 2026
 16:15:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-33-ojeda@kernel.org>
 <DHHX9O7V06VZ.G0N1CQ7BUKFO@garyguo.net>
In-Reply-To: <DHHX9O7V06VZ.G0N1CQ7BUKFO@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 01:15:39 +0200
X-Gm-Features: AQROBzBr0aNQIDV47zgxZ35JmTq7j6zQBNm1bxMAs_nutxdLV5rErBhW_SWV5gw
Message-ID: 
 <CANiq72mTaA2tjhkLKf0-2hrrrt9rxWPgy6SfNSbponbGOegQvA@mail.gmail.com>
Subject: Re: [PATCH 32/33] rust: kbuild: support global per-version flags
To: Gary Guo <gary@garyguo.net>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: KHIT74DMG2UWXU4ERGTGGZJFHFQ6BWOZ
X-Message-ID-Hash: KHIT74DMG2UWXU4ERGTGGZJFHFQ6BWOZ
X-MailFrom: miguel.ojeda.sandonis@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KHIT74DMG2UWXU4ERGTGGZJFHFQ6BWOZ/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72mTaA2tjhkLKf0-2hrrrt9rxWPgy6SfNSbponbGOegQvA@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, Apr 2, 2026 at 12:28=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> I think I would prefer moving these down.
>
> The current approach append the flags to all variables, which will cause =
the
> following equivalence to stop holding after the flag update.
>
> KBUILD_HOSTRUSTFLAGS :=3D $(rust_common_flags) -O -Cstrip=3Ddebuginfo \
>                         -Zallow-features=3D $(HOSTRUSTFLAGS)
>
> (Per version flags doesn't go before -O anymore, it comes after HOSTRUSTF=
LAGS).

[ For context for others, Sashiko reported the same and we also talked
about it in a Rust for Linux call. ]

I have been thinking about this, and about potential other ways to
achieve the same thing. I think the best at the moment is to move just
the `$(HOSTRUSTFLAGS)` below, but not the rest.

The reason is that it is closer to what we do with other user (kernel)
flags (e.g. arch flags come after the general ones). But I am
wondering if we should/could set all the user variables later in the
`Makefile` in general `HOST*FLAGS` later in the `Makefile`.

In fact, there is already a limitation with the host flags: `-Werror`,
i.e. that one gets appended later, and so users cannot override it.

This may be considered a bug, because commit 7ded7d37e5f5
("scripts/Makefile.extrawarn: Respect CONFIG_WERROR / W=3De for
hostprogs") says:

    While it is
    possible to avoid this behavior by passing HOSTCFLAGS=3D-w or
    HOSTCFLAGS=3D-Wno-error, it may not be the most intuitive for regular
    users not intimately familiar with Kbuild.

But passing `HOSTCFLAGS=3D-Wno-error` doesn't work, since it comes
earlier (`-w` does work, but because it turns off everything).

I am also a bit confused with:

    While this means there is a small portion of
    the build that does not have -Werror enabled (namely scripts/kconfig/*
    and scripts/basic/fixdep)

because it gets enabled in the build (I think it is referring to other
targets like the config ones).

Anyway, for now I moved the expansion of `HOSTRUSTFLAGS` in v2. If
Kbuild (Nathan, Nicolas) think it is a good idea to do one of the
bigger changes (e.g. for more `HOST*` flags, appending it even later),
then we can do it afterwards.

Cheers,
Miguel
