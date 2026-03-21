Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFAA109447C
	for <nouveau@archiver.kernel.org>; Sat, 21 Mar 2026 13:41:47 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8965410E1AE;
	Sat, 21 Mar 2026 13:41:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GZV3T/RL";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 96F6245259;
	Sat, 21 Mar 2026 13:30:45 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774099845;
 b=xCIxX8eJoYfX6SQlwolERtjoIyBw8o++1vsbqa8HmrERPkd+Mhc/incVfnoHWxQi5GjlC
 h72i9+ItkTwOemJAF4Y7pcPZ9hiVenaFhWjnpYG5i6tplPYlVORgCbAPmk/uzzfyoiZHJ/L
 e2OViNJWa2FqFQKxxczT/crkHnK4yDqmnb4F+ki0FZw6QsjFPN6DmYr+5d3vV+I/VXOQ+dW
 GJT3yhk5N4zk8uFrZ4TQj8VKZzNuUc/nDvrb9Q2+kkSTXA1aIJFSP3j0NJLnFBZQnSXN9Yf
 FrPOH9CVJR3nG5fdqLaxGcZkjLWHwnQajpzfMt/SplVbmj5EFE6EiwNhVfmA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774099845; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=XLhX9/g2+09qUmS7UZocL6buru35hRvt9bcjyD+wrFQ=;
 b=HLze8jBgUgG0M17PfF5BBot0E+amOZcyyHcQmc5xSNaIDRrSf2ezMB7fDlsPhQsJB5iIt
 rY0Ra5BKz8X9Sop98v6IL1Wnpy6aSulB8r64EnfCQGBgsHqJzsxpRBThlinqCqoBUrBf7rU
 NTkpilr1uAl72W3gyogV/saod7kSkjxwu8ICTRkoyqv2fAzO/2sQaty3sS/e7mIQh9JAJhY
 lKUqAoh4ff5JQhx+W3QWYq5BnntDumThLqEjvzq9QGjYn1nBqVF1iLRe3ZMyx2ptfToL5JZ
 TPsYZFydBFPRV7VIbN+iZK5vunepf3EGV5/RbEDKzTdFLh8jc7RVb2YUva4Q==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 408F3400D8
	for <nouveau@lists.freedesktop.org>; Sat, 21 Mar 2026 13:30:43 +0000 (UTC)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com
 [74.125.82.171])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DF52110E12C
	for <nouveau@lists.freedesktop.org>; Sat, 21 Mar 2026 13:41:40 +0000 (UTC)
Received: by mail-dy1-f171.google.com with SMTP id
 5a478bee46e88-2c0c482dfc8so125647eec.1
        for <nouveau@lists.freedesktop.org>;
 Sat, 21 Mar 2026 06:41:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774100500; cv=none;
        d=google.com; s=arc-20240605;
        b=X2eOmmBLLw3i3sXxC5+NPGBBrfK7ELWpH9wTnkEHU+4VaW9dHVnjE2lw84BgiEpAXg
         rz9vrlEcWZIsA4sbaxuvA1fqqSWLuR8A5hVJJohgk6IPAF5vV8nawvHMRKLYzlUTtv0L
         AVuyB+rjnv9x+10umPZTmYaEIwJ8LMw5dbNDZrLA8+RLVQOU9qxyKuBbzAQpSDXNxGw3
         aQVtautlfPaGtjVlxntLsp89PAzwtARxK5l+I+rliA7rB2blrLm43X7unL8Ghaqxgb2E
         YAzC48oMLLa4meXeS4dj6LoPfehkmAxtpFzm/9YQYwhfKsizyjY2pCFVe+7FUV/ZTrLy
         q2Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XLhX9/g2+09qUmS7UZocL6buru35hRvt9bcjyD+wrFQ=;
        fh=/+ZBk/zy0E4VRk6XJx8hdZ2vetVF00VoyL358jaxiZs=;
        b=XUzbOezkZjXin6uL1KNNw+9yoeP84jcQMuDG6J3EpHbIwSrfHwdia4ZHJD90LNnD+k
         fyQ1KqjrercL+8rFIpM+jYoE7xwBDhMUc/IefEU2KFUC9ifVuyW7xWXNKffTVWvJejKX
         qQMRE3nbmCbYpXCJTUgSs0DjhVByj4Z9kNOv3YJ6uBmYnNlGkZZFGnFeMe0ONq3Zlewd
         CoIkD5fgrSY9IQjm6RnyyQw9mCJ7tbeCGLRRZ1TUTlbe6B1HX+/serbP9Jao0+K4chY5
         yjVxW56bfhdLk5y3/FMkYrTmPiS/+N99hklGObYJZurKHlHhmsJMXMtUmJDKlkgRNZ3g
         Rxiw==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774100500; x=1774705300;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XLhX9/g2+09qUmS7UZocL6buru35hRvt9bcjyD+wrFQ=;
        b=GZV3T/RLZO5x0BwFrTO37AyjfYMwOP0A+slqHo8AYaeVxcMf5p4/JlMi7pAOaBz6xB
         slcDCN6ITntzb89+wzEYPVV/gSa7W+U8cNXUZ0ac2uZ2+tdce8Rbz09g/fi7uXNq97Oi
         OWPkxNIPe47k9dTEx5QY9XhC2hpz4tKW8VL9nkAw04+kr6t8l/7P/18PGA5VIbLaCmc4
         g8D8lPUggY05qe/8aNQc7/gqSWy5kYxm0e9KvRpYGkv6nl4Gw8rKqOpXdph1CN8t79TV
         bBYdG5WgT9gEEKpqyrmDk3rKgFE7Qvd427PLSqo9nbNkEG0al8F0U/W8LXf6XoPwVA2x
         brzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774100500; x=1774705300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XLhX9/g2+09qUmS7UZocL6buru35hRvt9bcjyD+wrFQ=;
        b=LNuiUrYfK8IM9QCEd/x3hQkqcy9nLeqPysIR3PrDGNQtNYI5NSB1P4D3jCCyyQLj5H
         HTZd/Kmwu9+sUOEwUeydnhJucQ+SvvPbSp4S0HbBR+l0MSGb1FkQTBtyID2Nh9GADmpU
         6MICU33iTzm1IXDkZ5MErgR6XRCxWzEzzi+wclZobzbmdfpRsrObmqi2F6Dm3pbeH55r
         vmWy6SgS+BrZ/l6NuveqspjHnOW5VthOCzIpiQ+ierRmCIvC25qNEnVXgmzGrrpxBnx8
         jXs02kN6e/pC9GCKkj8DqKZHdkRVTCgyInUJQi2kcWrnE2I5fb7DKEYLpUCrq1IPsPj6
         aL6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQZ3PKGiICZWrHP+ugFWZdFPsdei+9EQKNxFl9HnF5+gDLCR5w7WrDdokGg5Tvk1fQlc+mWvBf@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfBk/5TbItfSRh2hM/IOAErJhbA0g37GFFPje3tegGxicLyoBO
	noQ1nFf24iAun73NHSM7r/+d8GJk/OnE8uU8d0J+px37SOyU3RXv0GRD59pahCFGeXI8/pHiW42
	W2Uo5T6MrU8XnoG8P++7VNN0I7Bl5DZ0=
X-Gm-Gg: ATEYQzw36d7JQ0tftCX5Jt76qfyKjA2n+932gD7ILbRXuv0yQhR8k98XKOGYq29Hu1i
	fit1oTDi8h5cXGkDRq719dno7JbDt2DnPxfiSaTrvkz96sR0bMW1b+UOvpsX5MWM/SzOJ4hD+MV
	MRX5+Uldc9P/O2DqXNya/OVGWTDJLOeZp5CcJa59f/aZsNlEynPXG4jsQpPRld2AKenBZrT8PWS
	QcdjjhEKJ+Vq4xxP8H2c1QcN7j6BF+ghE2l12SlxePhdrTW+dEuDInjYzhjbytJ5lHt/41VkUVn
	/hjtLqCV4dlH1boPHwsczeIDBwv0Yu1s/PN7ZgmX7MbNE3lCUdiEZ1bJfqkio0BdyqVOT2/fePt
	5BHwwZDAjB3cyJdDRao/7mO8=
X-Received: by 2002:a05:693c:3105:b0:2be:687:5dbc with SMTP id
 5a478bee46e88-2c1097cc851mr1504671eec.6.1774100500037; Sat, 21 Mar 2026
 06:41:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260319121653.2975748-1-gary@kernel.org>
 <20260319121653.2975748-5-gary@kernel.org>
 <DH8HDA6Q6FU3.3JR57W97IO1VE@nvidia.com>
 <DH8HYCAIRCZD.2DXSNBFXXT6ED@garyguo.net>
In-Reply-To: <DH8HYCAIRCZD.2DXSNBFXXT6ED@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 21 Mar 2026 14:41:27 +0100
X-Gm-Features: AaiRm51Hwdlg5eHPgbbbJ8KEe0n7xAmw4NZpb9mUA-Y19mwW6yxZqTznI1K4o44
Message-ID: 
 <CANiq72kamU+XqG8AisK8uk9A2vkJeo0xcXZ7SJiisb9KMLK6ZQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] rust: make `build_assert` module the home of
 related macros
To: Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: YJLJTPH3TG32LSN6Y3IUSWWTG6SCWAVC
X-Message-ID-Hash: YJLJTPH3TG32LSN6Y3IUSWWTG6SCWAVC
X-MailFrom: miguel.ojeda.sandonis@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Alexandre Courbot <acourbot@nvidia.com>, Gary Guo <gary@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Yury Norov <yury.norov@gmail.com>, Will Deacon <will@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>,
 Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
 Tamir Duberstein <tamird@kernel.org>, Yury Norov <ynorov@nvidia.com>,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 driver-core@lists.linux.dev, netdev@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YJLJTPH3TG32LSN6Y3IUSWWTG6SCWAVC/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72kamU+XqG8AisK8uk9A2vkJeo0xcXZ7SJiisb9KMLK6ZQ@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat, Mar 21, 2026 at 2:32=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> I personally view them all as variants of BUILD_BUG_ON, hence the name is
> `build_assert`. I thought about `assert`, but to me that feels like it's =
going
> to host runtime assertions.
>
> I won't be surprised if we're going to have `assert` module in the future=
 to
> host families of
>
>     assert!()
>     warn_on!()
>     unsafe { assume!() }
>     ensure!()
>
> etc..

We also have now `unsafe_precondition_assert` in the `safety` module
which is essentially a `debug_assert` at least for now, which could
potentially be moved too.

Most of these (both build time and runtime ones) should be in the
prelude anyway, so they should be easy to reorganize.

Cheers,
Miguel
