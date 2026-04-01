Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A91D2ED0A
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 13:31:55 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3FD5310E540;
	Wed,  1 Apr 2026 13:31:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ItxiVNpT";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D6E5E453A8;
	Wed,  1 Apr 2026 13:20:31 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775049631;
 b=l0SRrplRZ2zm2MmraTs+VKx/hnSaLf07Kw+ZFXPRGRoaizGveKcPrZ/ibKsh0cMG3n+UZ
 zYO4olxfiMG+G4MW50r+ySNJawMs06jULdjyJVvoMB9zHEVo0TD5c1b+Pi9JCRJ4awL1dbs
 B4qxxlMGSqrRG+ONzDguQwpKF+4oEs5BWTzRP0waDKlUEGQ/12CNQSXyppXFOPgjptc0m/5
 zT1gezJ+RoB8Yp85C2s1NEdgxF6JO9zS4h3pj6KP9Ufot46EY9gxKrJwYHwSuNxq0lbOr2O
 7jZAVIG2BcQsD+0la5DMJgBcQqNgAc8NO7tk4eJyYXAS7tbgUhqoO5RDErwQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775049631; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Pxwyobpuf86TQi+f2j4+wIWXBQigp/e8eZSaPuRG5TU=;
 b=bDHVQfSDceQqffDfebHV9iKT1Jm8VpM0ElD7Mbt9TtPvNkHhay/XyDdg0j42x22UOGoo4
 q4PyjmPDNikqZWbTxWrDRYez67fZniFH3IWLvVUuBfDJeN/6BxoI2ZlaA8w8VTjjcEq57TJ
 PqYjcntMQRWc8MNGH0wfox75RQ3Job2I4w46P9+95VgoC/iHy684dk4/4bxwyEBFtJZi+oO
 Q9nYKACxWil87kVfASDu5m9gOYWZ2/4bM0ipdM6wjcW6IvV02rW5sU+6zv9si1yAhuSxuSF
 /kKx6YvSMbat/67mxdjMruW9rA+JsMxHtRJBZFuKFTnYX/O/rmqqOrtpLiww==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 2D81B453A8
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 13:20:29 +0000 (UTC)
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com
 [74.125.82.182])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1BF6B10E330
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 13:31:51 +0000 (UTC)
Received: by mail-dy1-f182.google.com with SMTP id
 5a478bee46e88-2c6f5574d07so109609eec.0
        for <nouveau@lists.freedesktop.org>;
 Wed, 01 Apr 2026 06:31:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775050310; cv=none;
        d=google.com; s=arc-20240605;
        b=jT5VK+8qtwSlkQCJyTDQ2YqoVYmDmYl7lPgkkbB8MbF896NA6qJV5SaeuPMPfEIKx8
         lrP9bz2HjqKswtqahLcqU5cMDWT0eRtrzIcoQ2QK2yU7GyKib6OpDKiWy7h+usy9zcnt
         9bf1iO6vYH3VDy8+x1l6Cjoiulwyw9An8pjJt6JRwL0Y/w84+JpjoC1qceCZZBN182fE
         +XAcLdMZJ6EpDFdUbS39iL3xE2ZLeFNuPkewEoYio4rVYYhtqNmoOj+7yTzSnzQ3twKZ
         CwUEepBQ6rOR95KzB2a01tjfyWR4bgzNNYFuuqCxsgPbgkleE6g5O9L13xbz9/OKucnn
         Fweg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pxwyobpuf86TQi+f2j4+wIWXBQigp/e8eZSaPuRG5TU=;
        fh=mPgDtK5LwXn5wPUrVeAURlJ7ejyIE/HRqRqW7LevPgY=;
        b=CBfCLS3CMTGhSENx62OweHqgG/3esZzjw4kba9lvALcRkoCeTez7WsmBTdHtZB62x+
         ocuMUKoMkbq3YVbpbrYRBLoNrLG/CVfOqooS8KgLwz31d/2cEKQUJ2RpytUEcuwQZ1+K
         QguO7Yqm/c3GIeFCs0007iscsgMzENUELCCPEcYhzFmkuyq926ecrmqjbsOvEjsLawtH
         nI6LKlyJZl339PMP5oRzda25XDPw3HXR+SpXLVL5qPXiTI0zq0LdKuWufW4EF1O0komc
         8NLVYE9QuRJ9KDx7dFbIwuK4VbNVFLE90O9oTVotTak8pKWdyuh0+yXuEbOw4UXOdBRj
         H1tA==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775050310; x=1775655110;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pxwyobpuf86TQi+f2j4+wIWXBQigp/e8eZSaPuRG5TU=;
        b=ItxiVNpT4xbfWP8Wr427Cmu19/dn2btuLUjkjP0eLcwv/K/9tXp2D7DwuI0cPqSljd
         mo5inN8jOVMrnjRT0A+3UuWTxSVu0SN4FkO1a1AgIjbyuVXdCLiA0hXwkbC1KXXsA50j
         qNl4HOihioMjyu2NNXy9aDslI5+DCEq2+4FUQ5xBiPq1nAL26ER9TPPG8A6DB7UWOAi2
         2N597jDcd16iC8oBtDsUMCDJORsrwCTiz3qX3Wts2L99w5ZeQK6chn8E1kEtDz+uh2dm
         9CIoBQlOygMJC7dED6giPQ8lIiAc8mQulIAVczyJQMmpA1F+A56MjP6072ZP5KyveNC/
         8LGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775050310; x=1775655110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pxwyobpuf86TQi+f2j4+wIWXBQigp/e8eZSaPuRG5TU=;
        b=WqGO4QHQmOhqomfN2FKOn2eBJwz6MmqSyB4k7K18uWE12qVkHSF4UmvNkcNbZVCbPW
         MxClAwVm6mNbs23YEkGf21FZV1rAnPLjqGBOCwASpwe48JYxhFg7+I7KRGrM7LSKMZi3
         pcYKTXCcbBLVvSzGckmw1W2D+DB6e9d2+YaGW7Y0QXtd1TlP2hv7SPZ24Pz+ybDz2O31
         IekVK3YzoC6WACPmOY8dYCFcWa/fpO7z3zypZ0vns1HThXuZH/gDQDch8VyniRy00y2r
         lRt9BfPq8WZBtACnYu5paYQee9akjSIXl059GykDcQMP9h7NHsgqVx9GDp0Ej7J173MB
         yZyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDK9UrqKaWuarI9qXo3x8EPS+5Di+7lYhCgjuFZyVVcpWoa57pllt2f2aR1TfbIi11Awe0xGOP@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpzF1WJl5F34IwyYytimkv2pfj9aUK8rz1e3c6mv2q/QdhQBEP
	AV/McnuR4aISMCQzlWV3rJdMizoDP6H9EvOJiyTYIx4kSGoPi1IL8paxN+87feqTfQQRjglS6nN
	FFwbFFNtc4TeQIyedx05jcNubyrTXFLA=
X-Gm-Gg: ATEYQzxSXbUg/bk0Nv3tuIf1d9rA6aAtyis3TETYO+pmyliBQfZVey7g9xddkY7e6bJ
	6Plo3HfTptvtUg8KJhcOTdQawHq2A67chbBV6NDRDHD5AP7Q6Ena8RMyDQblsbKAakP2i38SDtL
	xj9/I2DY3E1j7R2Rb4L2RWOO9YQHjC9CoA7FuTgj0BX5Qpw26+vZ0/nL8bHjYMepU8c3qfciEQa
	8Bl/KZZURd2uTZTd1RzuvqdlmleayFKcHV/DNs4fHhi1QhC4CxkUTLL1wm2z9YDi1NJ2R/I9p90
	wOptjvPMaLx5/d7mzTyiOZB26eSt3Pjch2+ngeZMejcGzD4Fmq8bgGMAKU8GS3ztDS2C+xRMfzM
	CtI2UL46/bGi06I/OxTt1Xm3F2DSSD07MPw==
X-Received: by 2002:a05:7300:fd16:b0:2c4:6ec:141e with SMTP id
 5a478bee46e88-2c932bab66bmr849425eec.7.1775050310241; Wed, 01 Apr 2026
 06:31:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-2-ojeda@kernel.org>
 <DHHUQRB9ZL54.VQZ7OUZNSYDS@garyguo.net>
In-Reply-To: <DHHUQRB9ZL54.VQZ7OUZNSYDS@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 1 Apr 2026 15:31:36 +0200
X-Gm-Features: AQROBzD4KmXruNHpjUyy0X5nLhLhXQUuTTY9eP3fb4LBTyRyQ4wVkUjvlUGGI0w
Message-ID: 
 <CANiq72=FBbJ--jrzYyKe3T56YqT5eU+0DXzPG3Ho7a+D9rfu=Q@mail.gmail.com>
Subject: Re: [PATCH 01/33] rust: bump Rust minimum supported version to 1.85.0
 (Debian Trixie)
To: Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: HYVYUKBWATNIVV6NWUNOJBNKQHHKNV34
X-Message-ID-Hash: HYVYUKBWATNIVV6NWUNOJBNKQHHKNV34
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HYVYUKBWATNIVV6NWUNOJBNKQHHKNV34/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72=FBbJ--jrzYyKe3T56YqT5eU+0DXzPG3Ho7a+D9rfu=Q@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Apr 1, 2026 at 3:28=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> This diff fails to apply on linux-next, due to conflict with ece7e57afd51
> ("docs: changes.rst and ver_linux: sort the lists").

Yeah, sorry, I should have added `--base-commit` -- it is `rust-next`,
i.e. 3a2486cc1da5 ("kbuild: rust: provide an option to inline C
helpers into Rust").

There will be other conflicts too, e.g. in the list of features in
`scripts/Makefile.build`.

Cheers,
Miguel
