Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C5CD58CA3
	for <nouveau@archiver.kernel.org>; Mon, 23 Mar 2026 00:16:12 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id ECB0210E215;
	Mon, 23 Mar 2026 00:16:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="K49IgaKB";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CA4AA45281;
	Mon, 23 Mar 2026 00:05:09 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774224309;
 b=AJu2hyG54DJZ5z410xe5y9wMcjIlxbJZcMXKWSoPJPeooKIHZDY+xjZKOqdBr4sf/5zbx
 HhQzDYJTW/j5B5iblbi/c9J2VTly9UlA4++ZMq/+RIobEsQtXUkylTXffdc8zV8WSJ2tWz9
 CuYvvUIExqDgGvB9lzAp7l42bPBS3+YAqbIzP6+xsoDShvfx8HeccCJOiPGzFqBF8hQXcE5
 2eorf+k8f4ZYfcLGItYcsTOwMYt8wGxUzqChAGj/PaOcqnR7rDMVqdzQVan9HoVfaaeJ5UH
 iBpdrgDLYBEMN+WcvRAMG2+zWKjwW4OjC9N47E/TAX4UpxPBCVYVbuwDRu2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774224309; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=K+4Vq1AL/fz/i5E1hcFRvVJwDC9ZhKP1RXx4ihYMSCg=;
 b=zfoslYc2dyCkc2kt0humFB39MprM7UCSXm/rMjErPZfNYRjPOtFWBGOz16ncGPbf5k4DQ
 VWP7GaY1SaE7fr4O9k10YSRLUOhYVBfNt/pdmGGBkFFGXQQddJz6ZukJTyubkdbtHhxbFnA
 kuWPr7vELigwmgZvHzx843966JrfUuM4yjfIkbp/rnF3VM5jaQ/zP7IAA9LM9JOJtLGEoMY
 daeRfjeovtAV1a3CesjfpY12LZwgf2+m2cKCJHIfYZuz80aQvJ30Nwd+wBl22zCm3XFVY4m
 eFnsl1+jl5hZtT6yMEili9HkcfAYaDMm/IEcrFBx4sqqD4EdWQw8+FFSAMWw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 4C4754023E
	for <nouveau@lists.freedesktop.org>; Mon, 23 Mar 2026 00:05:07 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1057310E1C6
	for <nouveau@lists.freedesktop.org>; Mon, 23 Mar 2026 00:16:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C8B0A42ABD
	for <nouveau@lists.freedesktop.org>; Mon, 23 Mar 2026 00:16:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB5D9C2BCB8
	for <nouveau@lists.freedesktop.org>; Mon, 23 Mar 2026 00:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774224967;
	bh=Vz6hlss71wCpMQTFpOI1UCwil8q0Rwfj9v3C/adr88w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=K49IgaKBHvfjrjUTPdu5EtJnJwHDSCtVg5836pGr17Tolll4phlkn3kK6tscuRGv8
	 lj5wVJvGU+l0/J3q8zhrEzFzUOcZ577TSsiAgd+xEM4SQUags8QNKmcaMuEsX2IIk6
	 Eupr/0fE/NSaHgtnc8Hv6coQqu/Ie/rMmpxuqD+FL1PqFdABPdkDTe0xVxxhv0IBoj
	 SxDPEqllePTuhppFENB0kGnniMAP9rmUokobao7jnz8BsjXfhNAMi4/3yzzIiD8l7k
	 ZBBGM2pjbfHTbcV4vglorRmhvHpscvYWXeZOZ0N8aMxjr/cT2T6v5elPXiIGjKWhaZ
	 w/LiUbTXc5X4Q==
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-38be5e86918so32450491fa.3
        for <nouveau@lists.freedesktop.org>;
 Sun, 22 Mar 2026 17:16:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV0NbBRz1RmZn+xvFk3xmNoTVN08omXNhyY+d1uUWcuUbzCv0ZmBjhnJFyWMgKGe2SUo9iOLiTC@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzcgaF3bg554mAhfHel3WKzO39pFJDvMlSmi8zw9UFatYaEQqIx
	ReaidPYqhpaxNOg9phSD+vo3UCRViodMlYtoIP+CGMQN5Q5W9Cf6ISk74/lkrqWkpDjet9Xz1mA
	U73bmdO9d5RJlaNwF0bYJXJ1X4/6p5bM=
X-Received: by 2002:a05:651c:1313:b0:38b:df0c:979f with SMTP id
 38308e7fff4ca-38bf9741c1bmr26363211fa.37.1774224965758; Sun, 22 Mar 2026
 17:16:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260319121653.2975748-1-gary@kernel.org>
 <20260319121653.2975748-5-gary@kernel.org>
In-Reply-To: <20260319121653.2975748-5-gary@kernel.org>
From: Tamir Duberstein <tamird@kernel.org>
Date: Sun, 22 Mar 2026 20:15:29 -0400
X-Gmail-Original-Message-ID: 
 <CAJ-ks9k+aTosVrC+e5SAm7Hso60sGw=YiBRjwwx5ruRNgSRepA@mail.gmail.com>
X-Gm-Features: AQROBzDn4PtiEdBNjn48YaossWLeRtmfaQJy0WX92eUX_bEnBMYsO2ItiMTXlbM
Message-ID: 
 <CAJ-ks9k+aTosVrC+e5SAm7Hso60sGw=YiBRjwwx5ruRNgSRepA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] rust: make `build_assert` module the home of
 related macros
To: Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 6VJ5ZZYSKIIP3CF43HSAXN6LL3LYYATQ
X-Message-ID-Hash: 6VJ5ZZYSKIIP3CF43HSAXN6LL3LYYATQ
X-MailFrom: tamird@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>, Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Yury Norov <yury.norov@gmail.com>, Will Deacon <will@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>,
 Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
 Yury Norov <ynorov@nvidia.com>, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
 netdev@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/6VJ5ZZYSKIIP3CF43HSAXN6LL3LYYATQ/>
Archived-At: 
 <https://lore.freedesktop.org/CAJ-ks9k+aTosVrC+e5SAm7Hso60sGw=YiBRjwwx5ruRNgSRepA@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, Mar 19, 2026 at 8:17=E2=80=AFAM Gary Guo <gary@kernel.org> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> Given the macro scoping rules, all macros are rendered 3 times, in the
> module, in the top-level of kernel crate, and in the prelude.
>
> Add `#[doc(no_inline)]` to the prelude so it just shows up as re-export.
> Add `#[doc(hidden)]` to the macro definition and `#[doc(inline)]` to the
> re-export inside `build_assert` module so the top-level items are hidden.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
>  drivers/gpu/nova-core/bitfield.rs    |  4 ++--
>  drivers/gpu/nova-core/num.rs         |  2 +-
>  rust/kernel/build_assert.rs          | 19 ++++++++++++-------
>  rust/kernel/dma.rs                   |  5 +++--
>  rust/kernel/io/register.rs           | 19 ++++++++++++-------
>  rust/kernel/io/resource.rs           |  2 +-
>  rust/kernel/ioctl.rs                 |  2 +-
>  rust/kernel/net/phy/reg.rs           |  8 +++++---
>  rust/kernel/num/bounded.rs           |  2 +-
>  rust/kernel/prelude.rs               |  3 ++-
>  rust/kernel/sync/atomic/internal.rs  |  9 ++++++---
>  rust/kernel/sync/atomic/predefine.rs |  2 +-
>  rust/kernel/sync/locked_by.rs        |  2 +-
>  rust/kernel/sync/refcount.rs         |  8 +++++---
>  rust/kernel/xarray.rs                | 10 ++++++++--

Acked-by: Tamir Duberstein <tamird@kernel.org>
