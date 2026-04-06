Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34949F46C51
	for <nouveau@archiver.kernel.org>; Mon,  6 Apr 2026 15:31:08 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 67EFF10E275;
	Mon,  6 Apr 2026 15:31:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kqD9k+yc";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id BDCA645679;
	Mon,  6 Apr 2026 15:19:33 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775488773;
 b=UXLnOrzebXeluhRPzeZRgSsaV2Cm9tEtmo3EdXsjF5zhUfFA+rhAXFXpgo8AzFp0BkvwN
 m72Edb9AX9YXb3SIdaHcN2T3pRqwiOqRLBn9l7suGmLxyjUQOUEsuhdV2eTCramvmm4rHz3
 sduj28au6DtBJJZqd1tquJVkIkVq2UfHD4qCnN9SA/sW5YbsI7oHHNd+p5X9fAmHh+IUp6e
 sM66Oc2ixzQZJEza0AA1nnFQLpr2W9ZMNxmTidH4Q4Z9ohg9iHpYiB7v4C7GY8u17krTZVV
 Hzu7dFBjWVb+Av+yYbsYwa8t6WD20Hxo1rzt6tUVlTgXIHR7d8Q4ji18Kf+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775488773; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=upOPgQrKow7ScyuKD1WfCKj6976lQXmqW8HddZVDJoo=;
 b=H9KHnTuRSrQ+H+bxiAGJdhJVGHvtSvWZ4dd4eB7KNn8NrcrTySJZZNfi+x58E8U9EURVW
 zUXRgMLwPextQRuyAJuU5eS7XtzZeB4APTR2PPkVueFIJZk46SKZM0usN8asrycs9Iv0JJx
 Ivlf46+3dNyyBi+pIGIG60+wVpnfeNK4M4vMGw0N9EW+cVKrQR+/Eg8TJr5nEKHDmKR0hzF
 ygop+dRH3IeM9i72DzyJDYsFoYckTpZ8hDzcm+1rOv8kLAiPSoXMg+hL+BJpWcf+3umpOKl
 cwSyYwyaCMp2LEiEpt7ui1fwhnvQtmw5+MDrznxfiZlj4CoTGBOEt3A1Ub4w==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 192F145582
	for <nouveau@lists.freedesktop.org>; Mon,  6 Apr 2026 15:19:31 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7DEB810E0BE
	for <nouveau@lists.freedesktop.org>; Mon,  6 Apr 2026 15:31:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 286F44455F
	for <nouveau@lists.freedesktop.org>; Mon,  6 Apr 2026 15:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B400C2BCB5
	for <nouveau@lists.freedesktop.org>; Mon,  6 Apr 2026 15:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775489464;
	bh=upOPgQrKow7ScyuKD1WfCKj6976lQXmqW8HddZVDJoo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kqD9k+ycQlsiYEuHvSJeSyj6IRexOnfGBKsKJSNIrwAwZTHRSHkstsk1e8qmv714V
	 FUeHB5NV6WB/0CHoUr1Lz5BcP8qsJXzTG+0JENcCwgi5JPw01njdTBXGZ88ZdKTTKz
	 5JxnP9jfP9WcAfmbgR3zkTwF4YSGdqaoY6Y1tt9fDxwV+VxZhuFAXjaGFxcfFDAX9I
	 GG4IfT7hAE/g5gMEUz/ACvTuOyhX6rQEGd8gv6B0QFGdjdmSKpTx8VxOVqSB1+yOiy
	 cS3ATA0jMkmkM6QhsQ+y8HtZJ6SKahrSm/DoKMfme1blIQ9Trr9b2zy9kl5UEA9o85
	 v11je9Jgag/Lw==
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-38de18126e7so22246221fa.1
        for <nouveau@lists.freedesktop.org>;
 Mon, 06 Apr 2026 08:31:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUIIulAWv+2uJczyckTCVYlkSgR9M9rCx834IjXrx2Y8kLdX3CTGSGeyWHbApKr2+O/CETyE3Pg@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhPuqr1/QWlU5FfGKNdVPObdxtucvOyppJgvlQUIip/q190Okk
	IhK4dP4f46mZwqkhyUmZZK7R5fuLO7Vu1KL8jI/rlso7ViMZO1F5P2pUqvuyFlikAnQk4lLQnfU
	ARwLC5AmgceGXGUztq0JdXkF/z8ljUfU=
X-Received: by 2002:a2e:80d3:0:b0:38a:f5a6:9173 with SMTP id
 38308e7fff4ca-38d91c092bamr32802941fa.27.1775489462303; Mon, 06 Apr 2026
 08:31:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260405235309.418950-1-ojeda@kernel.org>
 <20260405235309.418950-8-ojeda@kernel.org>
 <177548573697.95472.13544191227699996309.b4-review@b4>
 <CANiq72ne_JYPodnROckyNto10ZF0PqadRxSrng5-mZyqVovxFg@mail.gmail.com>
In-Reply-To: 
 <CANiq72ne_JYPodnROckyNto10ZF0PqadRxSrng5-mZyqVovxFg@mail.gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 6 Apr 2026 11:30:26 -0400
X-Gmail-Original-Message-ID: 
 <CAJ-ks9kbHz_KYAXx02vgW1dN2pfb5MFoaSoU1HbJbJg2O8EUaw@mail.gmail.com>
X-Gm-Features: AQROBzB1MuYM_2_U32IZvjJjOPHSscckixukkJGDNua3mGMOgh49W4AabPzp8YM
Message-ID: 
 <CAJ-ks9kbHz_KYAXx02vgW1dN2pfb5MFoaSoU1HbJbJg2O8EUaw@mail.gmail.com>
Subject: Re: [PATCH v2 07/33] rust: allow globally `clippy::incompatible_msrv`
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: F3OIGEIOVUHV4K7FB2AHA5MBYQTFS36W
X-Message-ID-Hash: F3OIGEIOVUHV4K7FB2AHA5MBYQTFS36W
X-MailFrom: tamird@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
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
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@kernel.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/F3OIGEIOVUHV4K7FB2AHA5MBYQTFS36W/>
Archived-At: 
 <https://lore.freedesktop.org/CAJ-ks9kbHz_KYAXx02vgW1dN2pfb5MFoaSoU1HbJbJg2O8EUaw@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon, Apr 6, 2026 at 10:38=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Apr 6, 2026 at 4:29=E2=80=AFPM Tamir Duberstein <tamird@kernel.or=
g> wrote:
> >
> > Could you add a reference to the upstream bug report [0] here?
>
> Of course, thanks for the tags!

You're welcome! Actually it seems the lint was already improved
upstream, starting with 1.90.0.

Link: https://github.com/rust-lang/rust-clippy/commit/c0dc3b61 [0]
