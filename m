Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99947F53D6C
	for <nouveau@archiver.kernel.org>; Mon, 16 Mar 2026 21:51:20 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7D6C610E564;
	Mon, 16 Mar 2026 21:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="vpFCXRo8";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E1F2E4519F;
	Mon, 16 Mar 2026 21:40:31 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773697231;
 b=zUOFy4w/6yADeRhYs0ebcvAy/TXJSv5S2lR78ZAeSpFg72r5xy9Obik9ogiYV53kOs/8+
 P17RXPBwxTaR4WhY5wGeQ9M2WteRssOBHwkPKfxOz4Jm6SyURktM1Q1YO6nMTx5adG84Vsd
 dcT9EcMKDXWkrkIZcXUDgCDugrQQInALlmg+dLvBSDnWdhqlMjGwO2injBy5hhqsGP8g5eu
 QeHF/lARhfnyOUd8nH83nSsGV4vtu0zMmJuOhYBxeubUDsIFFYwQ/z0hgeV5d9sP//Eug9J
 DGbOxRQ59hTifgeRBn6JPOzijqvsFieArsFf0MMvZnBfbv4u8+MiAfZSrYnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773697231; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=2/tZIe+BPoFvmilCuBDIILyAAAE/8kY1OOmSixpK45Y=;
 b=fjcYZH1RBqsAvumNmZ6q0HRAjas6sZBswBURqgxa6j0nOJkbfB22432PWZmup9Q5+8S6D
 bKldEm36oap5ud7l6yFDKYDWUcPU1RSdZVwE9TygmDPxvjczDJ0SJ49CtBoPs73agDneWv9
 wv18yooq1R83vH3ZX1ZWRNGRfU8akJTfcD1p5Zrb4P9oGncIJGpV3SR21VGBqMWROlxF98l
 sQC0BVtzyJ06FahvX41pGR0qpKR5Lf/fcGTmNlY5UHpBe9Xs7yEwO0b9A9Dva23zH6d3kGY
 QpEWwQS4XcjVevxrHcgK2d+74pKTKFGAcfBCMihDISIdl8gzS/mjqfH/EWEw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C09EE43790
	for <nouveau@lists.freedesktop.org>; Mon, 16 Mar 2026 21:40:29 +0000 (UTC)
Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com
 [209.85.208.74])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 185B510E3A4
	for <nouveau@lists.freedesktop.org>; Mon, 16 Mar 2026 21:51:17 +0000 (UTC)
Received: by mail-ed1-f74.google.com with SMTP id
 4fb4d7f45d1cf-663262142c0so5319011a12.2
        for <nouveau@lists.freedesktop.org>;
 Mon, 16 Mar 2026 14:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773697875; x=1774302675;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2/tZIe+BPoFvmilCuBDIILyAAAE/8kY1OOmSixpK45Y=;
        b=vpFCXRo8lU6zP1BInjDuqSJ0Ip6GdN2hYUH4/kU2pCnA4tIOuatapkdmH4vNV7bM9d
         /IZZ7tH+/CKxq6iBTKlw0XnZIiS1UiBG+FkbP2Hon/BTlS3T4zkN79gkLpuFJJ6q+HWz
         WiKyhHWAk8L+41pMsuF7X0lz6xBDfRYYSps737HzRuhDr+JSPIMhU4PGqWvvCpCXlfYc
         m8PxmKJb9NAUOY+o/J2bPDkVY8lsGQTRF14aXjmp0nx/8YHX5Kqqr75HvRNoM50H7u0W
         KwwrzDXuPIMopdiA83KedLDysXXpTwE4QLSbK33ic+nWY6imYFsMVG3TfLReQOh8pc7o
         BOdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773697875; x=1774302675;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2/tZIe+BPoFvmilCuBDIILyAAAE/8kY1OOmSixpK45Y=;
        b=Dg+GIcAUcmcXx46YziblNfKL+G1z6t8jIyHQrQgeG3c9UGe21gmYMBg6bgDV7kPcvg
         qoNgcZDopgszWqzWMXs6N3PFwXrnnGn+WuWqOi8M50nJsYvCoEUy/HZWVfLjSFE2CyF5
         98wk5N8XW8SzTkGDYQkdQVnKYiOd0v7B61xGBvjhH8sB28Vk4gIrXi6tcI1NB4cFV0Sd
         lrL5Z7TXslz/oo1Mbo/3IYGgYrhpG2A6M9Al0SLYJexF14yll8oXm99uGPAFvrj3vkpw
         70jOY+R/UHozf8TjxKsfkCfEhnwbAWquj2obCpLdtCtQQEVzlRR02i+zsQPDJkG5McDF
         5nnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdLFlVlmNQTg3H35QJ0Mb/2ckcsE4WFPt+SFMu0YBl7zhi8J877rYZvQPgZV+wCx5un4dloNa5@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDjsVxgbCiMSNjiF6gqHS5c3gP91Tn0cf7yLdaZ7RjxYllWD26
	nq3Dlvf0adArKie2gfYFUFy9Wbl+BVccF8GTLWFTFEU7qgnJHUyIV67EWOT8GPaO4CZL+Ix2PGj
	1V/hY59sTb2NR1ZUxKA==
X-Received: from ejdf22.prod.google.com ([2002:a17:906:856:b0:b97:73c7:6049])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:2d90:b0:b97:b03d:d264 with SMTP id
 a640c23a62f3a-b97b03dd8d2mr399815166b.4.1773697875178;
 Mon, 16 Mar 2026 14:51:15 -0700 (PDT)
Date: Mon, 16 Mar 2026 21:51:13 +0000
In-Reply-To: <e47d8712100d8aba2b77425cb4912cb2c3966e19.camel@nvidia.com>
Mime-Version: 1.0
References: <20260316055736.1690546-1-ttabi@nvidia.com>
 <20260316055736.1690546-3-ttabi@nvidia.com>
 <abhrJgPEiIRCvmwe@google.com>
 <e47d8712100d8aba2b77425cb4912cb2c3966e19.camel@nvidia.com>
Message-ID: <abh7UWSgRHtQlAxI@google.com>
Subject: Re: [PATCH v9 2/6] rust: uaccess: add write_dma() for copying from
 DMA buffers to userspace
From: Alice Ryhl <aliceryhl@google.com>
To: Timur Tabi <ttabi@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 2TOZXVU4IHRU3F4G5OSP5EKMKG7JE4IX
X-Message-ID-Hash: 2TOZXVU4IHRU3F4G5OSP5EKMKG7JE4IX
X-MailFrom: 
 3U3u4aQkKB4Aepmgiv2lpksskpi.gsqrsyzieypmwxw.jviihiwoxst.svk@flex--aliceryhl.bounces.google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: "gary@garyguo.net" <gary@garyguo.net>,
 "mmaurer@google.com" <mmaurer@google.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 Eliot Courtney <ecourtney@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Joel Fernandes <joelagnelf@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "ojeda@kernel.org" <ojeda@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/2TOZXVU4IHRU3F4G5OSP5EKMKG7JE4IX/>
Archived-At: <https://lore.freedesktop.org/abh7UWSgRHtQlAxI@google.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon, Mar 16, 2026 at 09:42:44PM +0000, Timur Tabi wrote:
> On Mon, 2026-03-16 at 20:42 +0000, Alice Ryhl wrote:
> > On Mon, Mar 16, 2026 at 12:57:32AM -0500, Timur Tabi wrote:
> > > Add UserSliceWriter::write_dma() to copy data from a CoherentAllocati=
on<u8>
> > > to userspace. This provides a safe interface for copying DMA buffer
> > > contents to userspace without requiring callers to work with raw poin=
ters.
> > >=20
> > > Because write_dma() and write_slice() have common code, factor that c=
ode
> > > out into a helper function, write_raw().
> > >=20
> > > The method handles bounds checking and offset calculation internally,
> > > wrapping the unsafe copy_to_user() call.
> > >=20
> > > Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> > > Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> >=20
> > > +=C2=A0=C2=A0=C2=A0 /// # Safety
> > > +=C2=A0=C2=A0=C2=A0 ///
> > > +=C2=A0=C2=A0=C2=A0 /// The caller must ensure that `ptr` points to a=
 valid slice of `len` bytes (i.e., it is
> > > +=C2=A0=C2=A0=C2=A0 /// valid for reads of `len` bytes).
> >=20
> > I don't know how I feel about this 'valid slice' thing. The memory migh=
t
> > be dma memory after all ... just say it's valid for reads of `len`
> > bytes.
>=20
> Shouldn't the safety comment also say that `len` is valid for writes to s=
elf.ptr, not just reads for
> `ptr`?  I know there is a "if len > self.length" check.  Does that check =
obviate the need for a
> safety comment that references self.ptr?

You do not need the caller to do anything special about the userspace
part of the write. That's just safe because 'copy_to_user' either
succeeds safely or returns an error. Only reading from `ptr` is
dangerous here.

> Maybe I should rename `ptr`, to avoid confusion with self.ptr.  Would be =
okay to rename it to
> `from`, since it's copying from that kernel address?

Yes, that is a good suggestion.

> > After all, in below SAFETY: comments, you also argue that it's valid fo=
r
> > reads, not that it points at a valid slice.
> >=20
> > > +=C2=A0=C2=A0=C2=A0 unsafe fn write_raw(&mut self, ptr: *const u8, le=
n: usize) -> Result {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if len > self.length=
 {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return Err(EFAULT);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `data_ptr` poi=
nts into an immutable slice of length `len`, so we may read
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // that many bytes from i=
t.
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let res =3D unsafe { bind=
ings::copy_to_user(self.ptr.as_mut_ptr(), data_ptr, len) };
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // - `self.ptr` is a user=
space pointer, and `len <=3D self.length` is checked above to
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //=C2=A0=C2=A0 ensure we =
don't exceed the caller-specified bounds.
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // - `ptr` is valid for r=
eading `len` bytes as required by this function's safety
> > > contract.
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // - `copy_to_user` valid=
ates the userspace address at runtime and returns non-zero on
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //=C2=A0=C2=A0 failure (e=
.g., bad address or unmapped memory).
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let res =3D
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u=
nsafe { bindings::copy_to_user(self.ptr.as_mut_ptr(), ptr.cast::<c_void>(),=
 len)
> > > };
> >=20
> > Points 1 and 3 in this bulleted list do not seem to address any actual
> > safety requirements of `copy_to_user`. Yes, the function validates
> > userspace addresses at runtime, and this is part of why its
> > implementation is safe, but it's not a precondition on the caller.
> > There's no way to call `copy_to_user` where it would not validate the
> > userspace address at runtime.
>=20
> Fair enough, but I'm struggling to come up with a safety comment that doe=
sn't just repeat what's in
> the function comment:
>=20
>     /// The caller must ensure that `ptr` is valid for reads of `len` byt=
es.
>=20
> (and maybe also valid for writes to self.ptr).
>=20
> It seems to me that we're just extending the safety conditions copy_to_us=
er() directly to
> write_raw().  That is, the reason write_raw() is unsafe is because copy_t=
o_user() is unsafe.=20
> Therefore, shouldn't the safety comment for copy_to_user just be:
>=20
> // SAFETY: Caller guarantees `ptr` is valid for `len` bytes (see this fun=
ction's safety contract).

Yes, that's a good safety comment for copy_to_user(). I think most
commonly it is worded like this: "By this methods safety requirements,
the caller guarantees that `ptr` is valid for reading `len` bytes."

Alice
