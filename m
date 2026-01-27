Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A3BDD2F003
	for <nouveau@archiver.kernel.org>; Tue, 27 Jan 2026 11:44:19 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2193A10E54C;
	Tue, 27 Jan 2026 11:44:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="esWF/u4L";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4F18D40ACC;
	Tue, 27 Jan 2026 11:35:19 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769513719;
 b=Sw86elpUblHD5+0wZk7yw7MM/oDrWZU8vMRRaKf8jgAImC4bb8zj/6pOXXXdOO6UkUCqs
 vyJXr/a/k6DebzBSYgT/9igk6jqL2AI6SvPEHWbxuNTEQY5W4Dlj6cD73tNfRsnFDOe/0HV
 1BrlbGrRa2ztAcS1Dl3xqpYfSObFQRkiCNcdpeFMDgATiokyjuO/g0ekxjPhKQlOMaF7BfF
 ZNtd7lsbeWqx3hE2GUY/ZoztWnUlq3tkPvocAGApAfSJO/rBKjIJkJt7/+7u4uEWWrt8Bcf
 +pX2B/5caotoBYnmsuuyYjpq4XtAV/aOsbVvS4fn3RqFAHvmrYJJ14YuFcrA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769513719; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=dx7Qje3xfwtzTtjPoOa/QrD/VQ15mG7+9fe5W4XM3Kg=;
 b=oSwc1gUv+ALQhQV2/Rc1zZODFhpeE5PfddjPIDArGTOiVpJBhdLFGckBHeNb0UjsNfKtq
 HSQcn2VsJ8xez+n6M58bgY9o3Kp4khz0z8nqSvyPsiUfX7y/aTb1QlmR3Rod4URHbzEesvl
 K0f+UCQpV2BwV6p9iY6AamoLlhHg3fq9h57q2N3BMv0CCqflkWOITercfuEds8gtwhOUurX
 pJwYEFu2W8Qqxd2kYFSjswygnLV/+qZs6mw+M/w17v9UajV9iGWRBCK3axwtwD+3KaOp4T4
 +mmxfleaKAU3AOC4vlm9gH2oA1jGzMHLsUwwPM/oxEpfFmZUMWFQx+mPk7Dg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 4C611404D9
	for <nouveau@lists.freedesktop.org>; Tue, 27 Jan 2026 11:35:16 +0000 (UTC)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com
 [74.125.82.173])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E482210E055
	for <nouveau@lists.freedesktop.org>; Tue, 27 Jan 2026 11:44:15 +0000 (UTC)
Received: by mail-dy1-f173.google.com with SMTP id
 5a478bee46e88-2b72b154883so190748eec.0
        for <nouveau@lists.freedesktop.org>;
 Tue, 27 Jan 2026 03:44:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769514255; cv=none;
        d=google.com; s=arc-20240605;
        b=aecboO4brf11wrQmURP1taFNsYFRi43fGRPMcvKAlGy9UFpA0qrLGl7yVH6uem4MS4
         eYRTdnJoW+GQGbT0AXL8CUdyEAkFilVRS8e5IbyuuUMns8xcXoj17D0czT2JMh0EuUOm
         OoBcAJ5OGmbCVgLnLKPXGapweU21idDSdfwi79iUmKRplEo4m6LQqVpixLRFJWdgoedG
         VjSZlRQEsqN6zknn+3FQYxA/JvkipaxVBxXyNE68TYcwai8c646XV7hjklJlxaX6Emd7
         qmEaL2xEm3qPQytgICl31oYW8jryTa7tL0RPbrJ0mGeEkRIsWHdFkKOtIuHZvUm3IxvJ
         cCqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dx7Qje3xfwtzTtjPoOa/QrD/VQ15mG7+9fe5W4XM3Kg=;
        fh=/UyLOJ6UkUewKhFu3qfkCYaijkJjT6AtBgdGJkygKUI=;
        b=iroP1sZgl9WUQUNunY6EdgRT4gTjCylD7JAVwlWDO8hsj/bCzpHtCrKBRxwf/XAn7U
         zwpz3k0RU66QiQpB6xiUHpd2djZ/NL/VQ6Sa2iRXZJUkeRENsot4+qruvBeYCPB5vrJP
         CBYbN8GtWsCY22YvajMJL7CBmASHxWEXiCsi8+ZOIiaRCWREIf7lg72jCSb6xw9YIZNB
         7EgkVpblhSbYi0UDPf+AKNRZ04Lard3nehqTX/DJ1hXLn5GzY3xxsvnvnAOkZ0j3Mv+8
         2BHJnXH7XUtMcbUCaeDDDdU/FVauZScBra6wQXoh+F+0ehuAuZSkCCpxzntec7VtBDzG
         +WoA==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769514255; x=1770119055;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dx7Qje3xfwtzTtjPoOa/QrD/VQ15mG7+9fe5W4XM3Kg=;
        b=esWF/u4LBsJEy0V8tlR32rzU3jF2CpHgT/z6UHFmLcjU3yiIZM1Xktsxq4a9dZVZRI
         wQ3Px37EAh0tVuPg8nM6WYGfQ4GIewRgHpIEXadkZ/dW+LOSwWPZMZCPed1qvtEKt65M
         RpbyoEXA71RDzXBAoEUO6PxXaBLa5fecOH5EwggPG43pa9cvKSUBku+PQeFeIMGVp9lF
         3Ca0/XmENhDKO52v+b8/D1JcvXOU+RuBeIoiaUE+H9GUmJuNWXOIl6NVqkRXsiB/RdKC
         H9K1y+fUxDExB0zU5LJN37a9kRC1qGbGsuH0tJwLwOoXfuawu5vkz8ssSfhEoCIaynrQ
         XUAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769514255; x=1770119055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dx7Qje3xfwtzTtjPoOa/QrD/VQ15mG7+9fe5W4XM3Kg=;
        b=OYR/USoBeqOP3zRdk0HDOAkJpuK+u40YJtUbLb7mFPeiTDDHy3Sph2lzcTPgl+l0Lu
         hEVM54QpaXuf/gUoOF6j+gcCgXp5W9UNsWz7KtxQhyoUDnYdN5jNuwfwsb6pzXfhbwRu
         OFNgVM0I0az79IFqnk1pZ3gsKUjeUwPh4QL5zWnCY9C43XrE3LSuFawZBy5mYZRHDewY
         bUN9j8yq8GrZbEOevbFE8MA3sYezQaKkuw/qHNyQErDeVJTjVMvhUQdHsnmtQDPdwfbM
         m1ERb3reZUqNDolfYtuM8v7ipkCwTKt6ROMJ1I6lIs4KgUmtNXk2JM0lCrPbAagKw3qd
         NGvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU81JnKUxFNomS8UW+jyqkGdE3lewIIxn/TqnoLcBvr/fJoqcEyeXQwZIjAODr1O4jko6kRA3bE@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVBjBIMdVMMZfv1X29+x6RjaH7YdDToAgMUeIew9FtcSwK8WYB
	MtXNXhZKof25pCrLXhfTS+WM+ygMF1pnnwTVDV78HvoX3rKEiyFgrBI+UMZuBsAkA50cBKo95J2
	4R0keX+p2/aJdW0f1KXMh827+yXuR54M=
X-Gm-Gg: AZuq6aJ/0pWF54CFrcjvg421K42t7XL9qD1xToxVlPfKX8xQH1vHFzCu6sx1o7E8W+D
	N9fDx5/TocplUcFvjE/jvjGEe9tcd393GpdehXIRBUHO4cvztsMG5nOE5IGXwtOVyR4hFv/xHtB
	X+F4F4Da2RasFdcc+SdwsTNWv7kia5vMuhCH+hR8mbGtoTxwjhNtgznE194C7l8Wboab/Gg6yQJ
	//JJcvKDvwTSjvYcUY61Us4YAQPe9dliNyIFgccW4GylD8dujXxRpOL4xY9zuhSPMmQbbzdX15k
	b4MAVpNUYC944uSOq9w/zMcDaTwaXO3FbEuv8vn8jxvwTkvuSWvD3UrR6w5+QR21Ic7PLc43BWa
	FPh4hf92AErhb
X-Received: by 2002:a05:7301:4341:b0:2b7:24fc:f639 with SMTP id
 5a478bee46e88-2b78d9042a7mr423287eec.3.1769514255045; Tue, 27 Jan 2026
 03:44:15 -0800 (PST)
MIME-Version: 1.0
References: <20260123172007.136873-1-gary@garyguo.net>
 <20260123172007.136873-2-gary@garyguo.net>
 <DFXZDYFOPVZ5.1EM568PBOZI1F@kernel.org>
 <DFZC5UCV59NK.IUELAQIKP5MP@kernel.org>
In-Reply-To: <DFZC5UCV59NK.IUELAQIKP5MP@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 27 Jan 2026 12:44:02 +0100
X-Gm-Features: AZwV_QhVvhR6oqwzeoIZPB0kvVicuxqC-P3J8xI9u_lSyucUndCsrBNFKiEvCBM
Message-ID: 
 <CANiq72mo+RpsTxZm7vEOBd+JQ7DJ65JE_q+H2oa57MeyyaHeqg@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpu: nova-core: remove imports available via prelude
To: Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>,
	Nathan Chancellor <nathan@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: IWIN2AVZRNKWZZZHOAE2KCDBEC3KPPIQ
X-Message-ID-Hash: IWIN2AVZRNKWZZZHOAE2KCDBEC3KPPIQ
X-MailFrom: miguel.ojeda.sandonis@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Alexandre Courbot <acourbot@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>,
 Daniel del Castillo <delcastillodelarosadaniel@gmail.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Shankari Anand <shankari.ak0208@gmail.com>, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/IWIN2AVZRNKWZZZHOAE2KCDBEC3KPPIQ/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72mo+RpsTxZm7vEOBd+JQ7DJ65JE_q+H2oa57MeyyaHeqg@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, Jan 27, 2026 at 12:30=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> I just checked and there shouldn't be any conflicts, so if you want to pi=
ck this
> one up as well, please do. :)
>
> Acked-by: Danilo Krummrich <dakr@kernel.org>

Will, do thanks!

> Given that klint can do quite some convinient extra checks, should we con=
sider
> making it an optional part of the build? Similar to what we do with clipp=
y?

Yeah, that is the goal (e.g. `KLINT=3D1` or similar eventually).

But if someone wants to run it, it is already possible, IIUC Andreas
already did the other day.

To make things easier for developers/maintainers, I asked Nathan the
other day if we could have them in the LLVM+Rust kernel.org
toolchains, and he was supportive on adding it there when Gary is
ready, so it may be straightforward to set up in CIs! :)

(And later on, ideally, even on linux-next when we things are more settled)

Cheers,
Miguel
