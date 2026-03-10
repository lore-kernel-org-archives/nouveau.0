Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C890FD4F2A
	for <nouveau@archiver.kernel.org>; Tue, 10 Mar 2026 20:01:32 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B534210E2D3;
	Tue, 10 Mar 2026 20:01:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="lhCiCLZv";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9FF1745022;
	Tue, 10 Mar 2026 19:50:57 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773172257;
 b=Diru2cd9pGOPctRA2zA6czoBvJWisu2wjrc1IvzfuUG6wf95XsnuJEANbRYvS/IhY3wUu
 vnRo6B7D6PSpOpCcc9HoEEOjhOgwnU8ivq+kBUPSkPFIFJ5kE4lNtbPEXwgx8M/8IvTWDiq
 vGBp/agqh+eldTMQ8CmC4VfbkREe0Ii1/Jj+CqhjGSqL8xkEO3PiAF+nYJvLtFnf/Pt56+A
 6sE6OO0rw0vPkNbiDa5oFRY5SNKl71JmgNVXphgx3P9unVA/QMI7jFzP3GMkgJxUtNG/WPi
 KBz/qb25zwcpgymKQQpQ0/Dju+Kp6FuIqUOr97/78H3UKe8SDugaZXWq/BTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773172257; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Fs+riCZult8rzbuRe4FFzM4OU8hFF7xnxVGqWo96vMk=;
 b=baBfFziP0mlghS7h3cIHIgnKsdFA7Vsleo+R8QHIjymT5FEBUnWoUkuzd/Q8JDqPkey1r
 9sNQgUw8xlviPI/sZnmI+8ddEutqF8VBLCSHsSlsuQMUTuEmo0DNadTb34n9sJg/Ro7ChbP
 q8BM9vpi/SUIvKBD7P19EBrZIyQ8/XiMqD/wR2cSp/rBR5BmpVtXH00d3zxFihUBRJzQu0J
 b3hJPhsUE4yyoqorsrX6VGM20COoIx9On+FxRqEGUvqnU35BVgkTrFB2STBE/1Y6zNIeGyN
 sA6rGGnzCT7eQMh6uQYgu8o7jwPURK3v8UP+Vlvv4Ykj02PE59SYDLfsVDdA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=google.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=google.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 32F4C44F11
	for <nouveau@lists.freedesktop.org>; Tue, 10 Mar 2026 19:50:55 +0000 (UTC)
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 090E510E128
	for <nouveau@lists.freedesktop.org>; Tue, 10 Mar 2026 20:01:28 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-4853b00f9f5so22256525e9.2
        for <nouveau@lists.freedesktop.org>;
 Tue, 10 Mar 2026 13:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773172887; x=1773777687;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fs+riCZult8rzbuRe4FFzM4OU8hFF7xnxVGqWo96vMk=;
        b=lhCiCLZvhFH8AJjvJU5PBdrPmu6WGqjB+dH/Jlw6QfW7ORCqeuPLiXwLomToUGq61h
         XZHE9wYiQtkHrK0RNzjfK2TOZXVy2hllKLdmr1qSTmB1Yp4zDqvrxMsRWpSKODwmqxdw
         uDZuMGxABzNd/uFYKD3mz61v/tSAQYu8ngw264FRXraudvdc8u7yZ2MR5xnCShFKYa5L
         0IzCkFdlRBTedR1sG8dBzH0OaUsOYrp+lH04ihFcHWtGaE3V35w/u3HkiYb+7mAXSL27
         zvVfhhhDZpk5+DN8OVroHjz2ln/gxiLBRAZiFhrOuh6CDF+iTFz8sp2WX2dJ1EqEtIph
         j5DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773172887; x=1773777687;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Fs+riCZult8rzbuRe4FFzM4OU8hFF7xnxVGqWo96vMk=;
        b=jFn5RA/zcLyBaZQToU6uBBGQvFevPCFZd8etTEoDveEkYYb9TrYgKrVEuak9nrxfYq
         xWOkpFX5RX0szlwPe19Xyla1FeR0FSxP0mdt3h55PPlK++oK3Q+C63O6HCvOX3DY+dNW
         oxqmo0J08CBTyEP9oz73mNz7OBZIgGeFSYrdjmZTQnOjSQhJYRBvC6zkgJscIJOCr+5P
         slkUqo0i4hiIMOykz+MSvsU7rwjLqKNv0Dj45QLgOmKuKWVQmdU/ugZxcsEvh67MrDjv
         s1qCGFi+cUanAfzBoA5zWbUIPJnW6sz7GhHyc3CaeaUUpadcf96jcB/QqqQ3DgnzEiTB
         4sQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV31YXWxk5qOpiTyJmj3ai3MyP5r0/QCC4CrZcm+4pRMREAkoV4aa4jXcsQv0PdusggcXUaTbi/@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUo8yE+Dl6WOM818CzBlsjjCpYek9fmpqX82GXw/3onOcyAU++
	coi3DT8ZnhqK18lFnze/cT76JmPqP6nVgbO1k7BqtsOkej6cPFqx0GGbohQlNh6kky/DThOo0E1
	aKEg+1L58LmJLPWjIsA==
X-Received: from wmim17.prod.google.com ([2002:a7b:cb91:0:b0:485:2cfb:96e3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b16:b0:485:3ee1:eba5 with SMTP id
 5b1f17b1804b1-4854b10ed0emr549635e9.27.1773172887011;
 Tue, 10 Mar 2026 13:01:27 -0700 (PDT)
Date: Tue, 10 Mar 2026 20:01:26 +0000
In-Reply-To: <4452ba874cae2d6dfa64b9625e4e5f2ab7f34559.camel@nvidia.com>
Mime-Version: 1.0
References: <20260203224757.871729-1-ttabi@nvidia.com>
 <20260203224757.871729-3-ttabi@nvidia.com>
 <DGYIO09FC9VC.5DQNYP82VVFC@kernel.org>
 <4452ba874cae2d6dfa64b9625e4e5f2ab7f34559.camel@nvidia.com>
Message-ID: <abB4lswS6IubT644@google.com>
Subject: Re: [PATCH v7 2/7] rust: uaccess: add write_dma() for copying from
 DMA buffers to userspace
From: Alice Ryhl <aliceryhl@google.com>
To: Timur Tabi <ttabi@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: HDMVFCWFSZDT7WQ4YAUKSIZLEC54KPBT
X-Message-ID-Hash: HDMVFCWFSZDT7WQ4YAUKSIZLEC54KPBT
X-MailFrom: 
 3l3iwaQkKB548JGACPWFJEMMEJC.AMKLMSTC8SJGQRQ.DPCCBCQIRMN.MPE@flex--aliceryhl.bounces.google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: "dakr@kernel.org" <dakr@kernel.org>,
 "gary@garyguo.net" <gary@garyguo.net>,
 "mmaurer@google.com" <mmaurer@google.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HDMVFCWFSZDT7WQ4YAUKSIZLEC54KPBT/>
Archived-At: <https://lore.freedesktop.org/abB4lswS6IubT644@google.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, Mar 10, 2026 at 07:52:47PM +0000, Timur Tabi wrote:
> On Mon, 2026-03-09 at 20:59 +0100, Danilo Krummrich wrote:
>=20
> > > +=C2=A0=C2=A0=C2=A0 /// Low-level write from a raw pointer. Caller mu=
st ensure ptr is valid for `len` bytes.
> > > +=C2=A0=C2=A0=C2=A0 fn write_raw(&mut self, ptr: *const u8, len: usiz=
e) -> Result {
> >=20
> > The method has to be unsafe as the caller has to promise that ptr is in=
deed a
> > slice with len elements.
>=20
> Ok.
>=20
> > Another option would be to pass a fat pointer, i.e. *const [u8]. write_=
dma()
> > would then need to use ptr::slice_from_raw_parts() and the safety requi=
rement of
> > this function becomes that ptr simply has to be valid.
>=20
> So I tried this approach, but the end result was that write_raw() and wri=
te_slice() were practically
> identical.  At this point, why bother with write_raw() -- just have write=
_dma() call write_slice():
>=20
>         let src_ptr =3D unsafe { alloc.start_ptr().add(offset) };
>         let slice =3D unsafe { core::slice::from_raw_parts(src_ptr, count=
) };
>         self.write_slice(slice)
>=20
> I think this is better, but I wanted to get your opinion before I posted =
a v8 with this change.

Unfortunately, the creation of a reference into volatile memory is not
legal. Here, 'reference' includes slices. You can implement
`write_slice` in terms of `write_raw`, but the reverse will not work.

Alice
