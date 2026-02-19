Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF73E9A04E
	for <nouveau@archiver.kernel.org>; Thu, 19 Feb 2026 08:54:31 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E10F410E687;
	Thu, 19 Feb 2026 08:54:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="haRxJfuf";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 226D14341A;
	Thu, 19 Feb 2026 08:44:40 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771490680;
 b=JACNO7+RrV1Gzg7zoYMuIYA5P6GTL3aw7wAyvfIoRJ2PsllstHm7H6AebT9lZvdFeY6BP
 5/U7mlBSJUTFfpIvdSUTujmVilT9kKZZKo9OfnuAP08hlOiEvSR/Ph4djgmYdSxmGXRtmpN
 qPsK7U8YkBtQzKRFHVG/C+JMRz4Vr51qVpXT52zyoBttWh1g5ZmgDBtnorENnq7P3iUEeVe
 i+75ghuKUGJ8keJNb9xyRMY0Laz5Y76SmxJnqtfz7h8a+Yo/kdpmx8j9T6lZFSujcbRtbVf
 9vqoYvjRWa+70CveA+9D377xsylFhoeSXES6EI5lZT7IR/OytzaMK5BKJYmQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771490680; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=g8xC20PjlQRA9OqDEMwSqMg/DaSzTbKRCj2DbPKEt6Y=;
 b=LT1Qj0lWG3FBEDqEe9OmeRrN8evDu/80/XsZaXZ3dQ4gOL04JQyTZqwTB5JeaOmy2tLMY
 SQO5Lua5P9ULyQkT+pFq/HDF6EiYcUJ4qsxKif6CpiVdK/MVHTtPr7/uahxOCp+gSa28R1S
 yR9oPhzWy/kcIar2hlJR0+CFBxqh+oUOGDBQWBKkqsToMa7Is1i4Dc3lhOaQoGfvaq/9PJh
 bDlIxRXlWyxXz78moWLdI/cnCffLkXCjxV0h5TbOypjt6pYeDaOtWwCAV4/n92uhQVqe7g8
 LqkaFvnZ4WzoWxWGzjscDz7tbu2tqDsjE5EFacWwXEK3PFFgW21LaVbkX+tA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 2A9D7430BD
	for <nouveau@lists.freedesktop.org>; Thu, 19 Feb 2026 08:44:37 +0000 (UTC)
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com
 [74.125.82.50])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BA27010E1C8
	for <nouveau@lists.freedesktop.org>; Thu, 19 Feb 2026 08:54:27 +0000 (UTC)
Received: by mail-dl1-f50.google.com with SMTP id
 a92af1059eb24-12736a0147cso52704c88.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 19 Feb 2026 00:54:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771491267; cv=none;
        d=google.com; s=arc-20240605;
        b=Vf3GWhZTal8W+oqgcXtuaVoj4+TIOjQp/5k5iyLnP5uB4R0v1QW5qKDdh0rqd5F/Gb
         svMP8/mzA/tz63a5n30qlUs/hQOXrt3AGCn2aybvrgzviTzXazipLzrjw9RnrTMvKX1N
         feji4uEHs/8TNIRgsCtYV+XhxNMSEkpQ+e3uums1Z4QN2+s94ypVzqJIoxCDFjf4mG76
         40nLGsXvSvSc2IP98oJAdBpgod888MXHVE/2fyUniaxzCKgapSIYbLNZa6niFgFxlTn2
         jsvbVD5AOm5VCKjJoJoFXOEPEroOXxTAc+6RMBTh+0ND2XFrGjO5nw64GcM6R+2l1LmT
         bEAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g8xC20PjlQRA9OqDEMwSqMg/DaSzTbKRCj2DbPKEt6Y=;
        fh=JFeeQ/Jcm1ADtVHcpdShZKiUJryA5ouCVn8hyem/x0k=;
        b=FWG4I7wdgwcfnjgpQesTQ/oextyYS2y7/lc+gk7oejuscs1cDkYKfBejLwdQUa0LKl
         MxiS82g2toJK0V/I7nOSscziAmNroQpcH7qOPTw4QH05G1bvRSKken9qtGoNRdjMjFfp
         jIT0tmFVf6wRZ4J+3GXs+bKTdw1s8SgTqpMJEZodU5r8TAHR25zFCham3k4+vU0xjwdg
         8czY/6q6YBkJMAt0E4zeepigCWQUFgi5P67Hy1SuoN14n+d4/yIQlu6FeTdIHxR9eS5J
         FFTrqBQDvCFRe4FwaXRlbKsyKGK1iXQTZHWJEA8rjXmwgIA0BumEHWDBzMSKqKQ/F2r6
         HtKw==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771491267; x=1772096067;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g8xC20PjlQRA9OqDEMwSqMg/DaSzTbKRCj2DbPKEt6Y=;
        b=haRxJfufUKpgOvV5aqze50H0KAWrI8iQ4O2fc/qzy6AHLJ2kjAdH2SeR71FuRlmZYq
         dmgysQI5WO1wYA2rSYNWmqkb7Hfgh+gy2mdi+KF+miYfv4Al6BV0wTzobyrb5cTxlymq
         SMn/USHwkGi8/XGBe+lQH/Ww2TVCQ9k0MN5b9tZLLLTHRcXpi6JTdvvvt1pbpLIXHdpR
         qNeicDoJv6hdjS4XhdwHiYtA3hLMQeSzKsTlZs4kGr6x7+/qFLIiscPiU4TpANWQnh5g
         vrlQZaaZBpZ+Fc63TM+/nkkz5RfiKcHiQA9tQaiESNIOAD3lI0pa+6e+csku63yg9hRJ
         ZBYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771491267; x=1772096067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g8xC20PjlQRA9OqDEMwSqMg/DaSzTbKRCj2DbPKEt6Y=;
        b=TkygcF+seb31Lc57IyTiE6IbZH7SF42sXYXeWEwnf1NpKHkFFYhbyYrbkXkmUSeAyw
         j6SAnGehrSL62BKdQwpLBOHuOsgGtsPQUkGHQZaXjTDaPivVSvQ/Qg2cN/nJkYxy2fk5
         nYtFgyLHAkGoiLvohel9sH5fxoqJRzGC7K7b59is6Kuz0teGa3KKtuNfK80xoyI9D2kE
         fPBRz41hx3eH2KQsXErHv/RwkLJN0apthivseZ4T8xGOu95xxv4YAkwirL6GxFJBwMHb
         srOST9+jMdT3kGtXm+HOcNZ5jHDWTzAmwXsZiU0V07NP7snX8PWmyaMLqnixoM5zQi+9
         I0sA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5PSCETg3gkXX+GsH9zG1SvD6l52KY6ODd14fC3w8Ny7EWK/hxq3BfA7nnzpvA/3KNH3s/yelM@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJTHCvbNIT9eUmpfku6Sn0Krds6P6bKRU1ziJtPc3GKOWylZ9M
	qemiIgPsaM/U+UOfeQSHhPSx+lZ6G3cnSwaf4UDzsb8sIKG1dxMLVxaouHQY3j6D9Hfkeu4ZeHD
	sIHSl3c1HFrd+wXqSdgSqAPntkHqXr18=
X-Gm-Gg: AZuq6aJDzD48PH5Nl6VhDDvi6IDtXkbhCkzSNYoklRZEL387IZGoWjsukJ3el0FzWIf
	FAQZ1vFKNqoF3fEsp9uRLW1QsDPJCha19/64XmrUOeMx51rjQln0cEl6FUdBn+mWaBsExT29KrQ
	Bx1aR76ehqpA6SdalWrliizDUo1BQFxvGVWs/hXb3weUBXC/1ZGGmNTBLAnp8P7bpb0ldt7Rzk1
	q8rrXsdLAUG+goNIX7QF6a1z2nUJF/cHu5mPlNkG5H/WY1uNWvvQhc6wVB4kp1iZLQDfQY6u13C
	yP2Yr+VragZWR58RtQfeZjpXRD8qDpw6xTtqp67ndcSOLoG+ftCX1LrcWcZyEeFYm3sA1WUq643
	HNP05mZw9oPkU7CdHv6+3jgEn
X-Received: by 2002:a05:7022:419d:b0:11b:65e:f33 with SMTP id
 a92af1059eb24-127397d8800mr4979968c88.1.1771491266834; Thu, 19 Feb 2026
 00:54:26 -0800 (PST)
MIME-Version: 1.0
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-7-joelagnelf@nvidia.com>
 <DGIOJQC5HEAT.262OM2KS7C2HE@nvidia.com>
In-Reply-To: <DGIOJQC5HEAT.262OM2KS7C2HE@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 19 Feb 2026 09:54:14 +0100
X-Gm-Features: AaiRm517O8N5cgdFr-9hA2xKEEuwUHYT4nDXwLjBAL8577hK96CpY5pCEg8UfyE
Message-ID: 
 <CANiq72mH=sCfO8+HnVp=m219b3drWZbqUWE=NJn=M3y4ng3qXA@mail.gmail.com>
Subject: Re: [PATCH v10 6/8] rust: gpu: Add GPU buddy allocator bindings
To: Alexandre Courbot <acourbot@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: H4GWBNX6T4HEZXIERVPXNZFQDTQT4IAJ
X-Message-ID-Hash: H4GWBNX6T4HEZXIERVPXNZFQDTQT4IAJ
X-MailFrom: miguel.ojeda.sandonis@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/H4GWBNX6T4HEZXIERVPXNZFQDTQT4IAJ/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72mH=sCfO8+HnVp=m219b3drWZbqUWE=NJn=M3y4ng3qXA@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, Feb 19, 2026 at 6:13=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> rustdoc complains that this links to a private item in a public doc - we
> should not mention `GpuBuddyInner` here.

If you all think something should be mentioned for practical reasons,
then please don't let `rustdoc` force you to not mention it, i.e.
please feel free to remove the square brackets if needed.

In other words, I don't want the intra-doc links convention we have to
make it harder for you to write certain things exceptionally.

I hope that helps.

Cheers,
Miguel
