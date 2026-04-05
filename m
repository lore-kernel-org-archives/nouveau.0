Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F9E7E9D800
	for <nouveau@archiver.kernel.org>; Sun,  5 Apr 2026 19:36:03 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C008510E220;
	Sun,  5 Apr 2026 19:36:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iiyvQZWw";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id F249A45599;
	Sun,  5 Apr 2026 19:24:29 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775417069;
 b=mA2FRZgft3EZ1uOym/KhBNeCSuwsemfWXLryXdCLv7jDVV2kNQcPEpMzqpsllj0FYp2os
 2vpgIOaJXqyOsnv6jccmHKv0DQFh7RjDbRImKKNIks/ukyoj79HjE3k4AgeXnErGiSHQcSx
 bKQf95y1o1aEWOZ09oFPjzyW27ofleOQjg5bmZSRR+wtkXVmYAWqUdeQjlVFCt44QM+7vrR
 fI+gsvrVzhPTL835eklBLv8GhQ8CtNh8g+HPJP5j8mrQCGeWd4YRx4YQIbzedmNarh7eNQ8
 IXsMYGA3+asFKgYXpxF8V2Lw5lZVD0rC7QPOCTKSK5Fy/ydsqDU0wOUc2Tow==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775417069; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=BfjKSt6DEr7n25ZH5xS/6Npl1F2WZyz5JjVGM21RHvg=;
 b=etkgqT8wVZfqjG38anxqIn6TYHaCFUpiBo4yZWr1A7vUxaPu4IOJmzMqXCsdgz4OiujQV
 idEZcV+JLf1x2tGKrObhQdm1ROVR7J5QmFVwy/Efpk0PKhIbhker76XU80ZiASflWrCDTnw
 953X8O8xzS2vodfqUuc9zai80rpATg2cL1GPKcVL4JAr0tqf9Dg/OsSmw35uf+ZoOJhs9C4
 Ck1hGTCF+2J8Vm51qg0UjkGy8/e0q6N7j0wQs1yAoBtonKT7lHc9t05a0zUa1HEhDqPlOiE
 Qy4IjyXb695VHioflYLvWZjpFaI/sf+RSNxZ5Ewc43SoxAkQ1dmVrHWUzcFw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 7B50942DA9
	for <nouveau@lists.freedesktop.org>; Sun,  5 Apr 2026 19:24:27 +0000 (UTC)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com
 [74.125.82.173])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 142EB10E1CB
	for <nouveau@lists.freedesktop.org>; Sun,  5 Apr 2026 19:35:59 +0000 (UTC)
Received: by mail-dy1-f173.google.com with SMTP id
 5a478bee46e88-2cb19ddda43so250267eec.3
        for <nouveau@lists.freedesktop.org>;
 Sun, 05 Apr 2026 12:35:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775417758; cv=none;
        d=google.com; s=arc-20240605;
        b=h2lSNFNguMBQ866QDFvFJOeoxmGWloUGRj2mvE9U33Pf0GmYtqh78gkkyySEV4WiKS
         lDnORRlgCzwYBH20kdC2wd1tsEcFEAO5sLcS51M+ID+WUJvD14+Ku9s8UQ4+VzN+dXz5
         nBhYk1aeiKtE1yuGp8KDUfcczQwOfDAz683bPuCu8PskkftsNUZt0pyp+f2AZtM4TH8l
         w0tzai1BQ3QDpIqLbYxGMdguqE4JKipvFC4vc6evrX18/cxY8Jp5SoZxGQNX8eTqQkKX
         3UbrgMRARF965qF2fIesDj9fEal1SOfxkj51f8HGX8kt9Dlq3wRk5yDmtFkleXH7pxxu
         RYIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BfjKSt6DEr7n25ZH5xS/6Npl1F2WZyz5JjVGM21RHvg=;
        fh=W9NR8IR4vtXMOehFmY23YJ9a4Gj3XJNfGp3EIMRicKQ=;
        b=aGDDCKQJsyHnpSMKsWDnPH9Ru6lxoYmJYI7v+mu3YfoKoMeRxKo6AmddVkcwWAmuAt
         b+l+m8DFl6diXNuJ5XkoIkNswN/LftCwt57ps1VSa6VhGdRzTf3j9/ijQU+X9gAswyVx
         xrzk/1HfRGSx+nYlZ7aUjR7NyYA3yxt/JbRp9K3BCIvmEISvnJbX3qwMGE2wHwTYdnPw
         554xViqhjXjRlrWj/ZypyPBN9X5TppYgGX/3gD/SsmFetJhjfYNki3nYnJEHVgQveRP7
         NZl6XQWLmqfeL0cbFO0z1y8Zxir3WAbj/umM4l8bIyX8u3rRYBhq+T+iPJz67IHRUBJT
         9vsQ==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775417758; x=1776022558;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BfjKSt6DEr7n25ZH5xS/6Npl1F2WZyz5JjVGM21RHvg=;
        b=iiyvQZWwcjQKaxyaxGPnNiu8f0sSJagijPvY0K9SOk33fbrQjsXvQBIlcAoB0IFvXP
         7vnRS7WFhiPKIkjSJrxZtBlmR/V2SkFgckwkjcUCZqPxBdLImyE5wRdUylqBNlBNuoTV
         vaM7EEW1IbLOsyTAK0QCaTDSHJyXop1HUnLqeQUIq9NHhfEEDgRJkuDcVqjn0/TIDI3f
         usJSiUeEBNxr8+Kseone2NwOyknNBobNw6m1Ov5goWIEDeXjK+L5LNnulPdWWIWaBCft
         GfGc8dl+jipQx25MbJoFNxImYdWTIQ9T+GPbdnvkuZOSQvs0ggYhBgnNjMtHt9TPetNC
         Ajpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775417758; x=1776022558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BfjKSt6DEr7n25ZH5xS/6Npl1F2WZyz5JjVGM21RHvg=;
        b=AJ6JLwZe8taQJTedRo2tLQrUo7NSOy1/bTYe1QCmSHywK9vQpdviad1XrUmBeRsKwe
         OXVC5Im9KZ3t9BLTxbFGPOO4ElPWpHcgTh0jQSUZXE/dWNhIlxGTfnksKl4mecR00zLy
         rZCmcwASJFd11cfhs18RpBMv0IDjJWsbnDNb76SELImAbfLqj6agYD3DNDmHLq8TZNx4
         OjYGpnfKpCaXy0FNUklBbBHrKGfGqQyg6+2ztZIOFOHQlco4lfzPpHX+cVSWv7juRm4c
         KavCe5h6GDlw0xSChv+sFe4ypDSZwasZMUqHyhI+GgSIFt2fbmg8K8Dq1a12YTukcsPb
         zzuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyxrHevD+/ZEJ39XWSWcfts6iESNEkJz3YcA0lxRZh8FytcMAhm5teOAEc19w1Mc7SqsQ7zCwk@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTTRjM6t4gJ9c/3Wn9/X7+71TrqdH4YtOguji4EKyoD2whhQIO
	n9ucGdw0hvHMbIv6UdlimO29dwKHosiBsF0acj7qOcUDYILg/v/TykkO+A9vc0LANQmE7zVMvzl
	Q2m06qqTAgdEYBAaEst+vnSxnRPdDuhU=
X-Gm-Gg: AeBDievGR3NCByyCjh4F2B7jyFH9OCvbJd0VkuePAm7+MguX+RSHIu4mM6qnElz3JCD
	miTgVAq5mazjbOrvedGg9QYo9P1kqn0TDuyD2MQcopRvKHW4k6H9l8gQncOBJZmfw23CRQAHknQ
	MvxoZyvm+pUSTffOsWkTFZFejq3ehie9SthruG+2LurTVnPFXX9SZe22wC0JNsKq0tEUUE1HYLR
	oifjohsNfxhF711uQ8JDKURskoVrKxSsWVFzq/54ty1mWirdvrANsx24LxNN6ySZbUD1MBrQYRu
	W8T9JB7sR5NCG/OQcepBBugwDY4b33vMkCbfsCngTEolKbbncj/ysLplRF1A+HiMC+DJ+TgLYPC
	CM/aySLh4Idvkxj/d4GXR1rA=
X-Received: by 2002:a05:7300:dc88:b0:2c6:7f49:a862 with SMTP id
 5a478bee46e88-2cbf9afb2abmr2166610eec.2.1775417758303; Sun, 05 Apr 2026
 12:35:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-24-ojeda@kernel.org>
 <177508434465.73816.4492182082440539007.b4-review@b4>
In-Reply-To: <177508434465.73816.4492182082440539007.b4-review@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 5 Apr 2026 21:35:45 +0200
X-Gm-Features: AQROBzAMmQ2fYtLyUeAFSvUDsVE_iEOg6GKNUQ48f6LlPWNoSXcMUKGWx0A_W0I
Message-ID: 
 <CANiq72nqenC30r7QQAmdKxS8ehGU2SoSGr+LCnoTAGLegH-KnA@mail.gmail.com>
Subject: Re: [PATCH 23/33] docs: rust: quick-start: update Ubuntu versioned
 packages
To: Tamir Duberstein <tamird@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: X4IGXKNMV2UDZUR4KFAYPQFB6756R23H
X-Message-ID-Hash: X4IGXKNMV2UDZUR4KFAYPQFB6756R23H
X-MailFrom: miguel.ojeda.sandonis@gmail.com
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/X4IGXKNMV2UDZUR4KFAYPQFB6756R23H/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72nqenC30r7QQAmdKxS8ehGU2SoSGr+LCnoTAGLegH-KnA@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, Apr 2, 2026 at 1:01=E2=80=AFAM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> RUST_LIB_SRC is also mentioned in the nix section, do you know if it is
> still needed there?

Yeah, that would be nice to know.

I tried on my own, and it does seem still required (at least with
those packages mentioned in the example). But perhaps a Nix user knows
of a better way to do it, anyway.

So I kept it.

By the way, I think it would be nice to have a "standard",
well-maintained `shell.nix` (or a flake or whatever is best nowadays)
in the kernel tree somewhere, i.e. one that is known to work, that
covers most tooling used in the kernel, etc.

Cheers,
Miguel
