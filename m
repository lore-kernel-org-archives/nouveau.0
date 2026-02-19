Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF22E9A03B
	for <nouveau@archiver.kernel.org>; Thu, 19 Feb 2026 09:01:53 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 44EE810E6A2;
	Thu, 19 Feb 2026 09:01:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JpGBxhOY";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 739D64341D;
	Thu, 19 Feb 2026 08:52:02 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771491122;
 b=prsrIrkeg2g2oACM1yWq6aDavJzpMmaTBLoQwJMkafxw8Bm5Y2SraEu/vQolfoPKx7Hsx
 edud5it6hh0CRJ1A9l3/6tqQMqNYlbjZgaQ5nwiR8R7hGWJvXXQceCNs6y7gK8P9fs4LAs2
 HPhkTPNpvXP+E39kHet6fgBMa3o1fE+l5ODOnSKtF9zRs/IgJ+4YMgodYfznFvH0SITOwvj
 nSLj9Y6i8ek3BtRK5G0Ld3L9kuCAV4OK1hRjzBjk0z+26oRkV7P4RCkctiqsgyUd2rib6cE
 HRJXoOjI38M4dN9H++ij3KhpFzkRjmb+5FEyvcScamC/Hr5uY0iXES0347Zw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771491122; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=q68l7L2sX5XalsQbPARMh6LZnZjDP1I1e8IBtyAWP9c=;
 b=HkDP6qTPuvnhtGaSf34QxaBaIokoB7SFI3rkyVUCoXIlP+u/6BJhLE4QiVkh/iq6z+wGs
 VmcXS21Pa1lBhkTs1v7FsDPSQzQc+wsSmxf8Xxgx6ct652SWQTp4VtlVJ1JYTPePFcm+uCZ
 OyC5zcXzszMy5+EwrHIxfYCBLnbbjSb0frnGHNLLWUZzB+wkTTGxyPOvv0nAEKMPqRkBVIU
 rh1o824Wy2I4tiX+tEbefoVypxn8m3kXc0BHAotViInA1d0fnbmJUvon2RciyqnF3eONa/H
 sbr30C0Z/XC8OvcdYqvfNXGCTeZ6E+dJqmQcIV5gDybKBtCIWs1ExeWIN+og==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 8C1A8433C1
	for <nouveau@lists.freedesktop.org>; Thu, 19 Feb 2026 08:51:59 +0000 (UTC)
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com
 [74.125.82.47])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF6A10E687
	for <nouveau@lists.freedesktop.org>; Thu, 19 Feb 2026 09:01:50 +0000 (UTC)
Received: by mail-dl1-f47.google.com with SMTP id
 a92af1059eb24-12734af2cdcso58857c88.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 19 Feb 2026 01:01:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771491709; cv=none;
        d=google.com; s=arc-20240605;
        b=XUMkCRhUsud70Lt5EEv9VDxE+8NDIaFc0IAfDfptgHXtVT0IQzVwgKSzFMtgGRHCki
         FjHcqpA4hB2iP3u2rztYbsZHNE/LCfPcczPTCZfTyqj0/BKm2Il407y6rfigz0b4NfWV
         KMaNPlivl7YYGP9uckSqy7P9f1rGqIS3nFl1t5EgSZ76eSCjdK18IVdCBIIaWMaj+Bhq
         BfbgHz/FnFrfeKQldy3IN86cvp8/nbRWVDvKERjw/w7AAmT5QmLrJAhYVEXCZ1LvCMRi
         L3NKV+aJFztmYt5zGWvylrbHbik0QbqTwMA6+EM8fuY9gx7EY7w874B7xJbKseHdimat
         LUNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q68l7L2sX5XalsQbPARMh6LZnZjDP1I1e8IBtyAWP9c=;
        fh=kTgAZ65xhWA7S7WtAZv9qr3Zi0y2N/FAYMS6gS5t9Kg=;
        b=Ll4RPHqtacn+IhXhq1eOE/+mShm87Nx1f8iDc0Hs9IrfRuEahqVNBdR+W33rzg2VcN
         FF4yaMKQNuyVB0sM8IuKzm7t6KFwWFegGWa5q35AIa4Tda3a2ZXdVbkvF8u1laDmvDDX
         su9cpEPEi+SaPS16wbfOP8a5s+UdkoR1Pim+fGmYQeldq/+VCNP5AUiO6TmFeHFRblmh
         VlStvuYcH6xwpDwFuhGtYN+/zeGgtmJluReMzDHkMtIIufYkC4v6Li8zqsqRawM1VePI
         xw3A0+uGJj7n0t8QxzKo9tpeTaNyqG3PRDyx0YPOyZZcywS2g4MhluiOYFZErkP8+DZu
         1vxw==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771491709; x=1772096509;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q68l7L2sX5XalsQbPARMh6LZnZjDP1I1e8IBtyAWP9c=;
        b=JpGBxhOYL+T4krZf1wj6MfPfN9HI7/0nXp6KXI+Y2hCpT82todFXaHvcXW6Qa2M1x2
         semUNhzZ45XcZO9JAtnKdwBJWe6MeRdUGNGsib3BoYwzFb76qy2vXuz/9173wd+/7ZyP
         o4kVEV2747mbA0vU3FuBF7pW8tsWmzOjYIoNFGgUhXdxMCj3GjKSOfpXOB1zS2g3fsNZ
         x+DosnmjYILLKJNbRUsULdt7s5ZpfARbKsqW3Saa1JhOF4gOmNZqGn8kPP5ayu+T7YHE
         4mEvKdWQ/hCGV2cFtKgm1SyPdnFrFbjhvcc+uCzan4hmQ6vJOYQ8745YVEc8iFJLdVUZ
         gloQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771491709; x=1772096509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q68l7L2sX5XalsQbPARMh6LZnZjDP1I1e8IBtyAWP9c=;
        b=b82thsdRuMF1heEB7VIvScJS3EB98e/tkwelD/TuVSpIe9ZC9wMe5pt6rGSp1vimmV
         TKHKG18tm1MhUrgbJmxwNsbYSQF0pikb1opnA7FlSWIdoEkui9Qjd72vLvR9CiLfOdgp
         lzWVV0GbuuTJhrpG/KmELQ7P6zoIGA0C/yZeSgROcEc+ptVBIKWuhON9t+akAXuBrbt8
         c3qWDCmxza+pz6scv5pFZDJbVDm0fRAb3ASGfth7AAd71/rnAfVSM52mUzn+/M9GVe5O
         uE2kfezKna72gvDUjgafhzoMq/59IE2rHsMN9N3kNYDSFFVTEC+Nyd80kCM52bzEHP5d
         1g3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5ANJBmbLQpSFyof1Q5yZ+G0H8A7SIS+xdaP9yLE3tQbPIG/T7BthllSO4I40fgvPsVLp+4Ee9@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5K3RlDgbQSRfKO6qC4zPL5eR13NdmFfBOK6RBlwMYVDOpbh/X
	9MMMxH0MS+1FUDOeThVni5QKDQKuYi58NhYr9k5ul7OqL7YMA+J7x4Bb5XQHZ4LVky0zSd909WU
	/47BpiG5y0oCxiWjy2a0rQZdPZ3y5mA8=
X-Gm-Gg: AZuq6aJx8w6wKeFCN1EpHugW74HbOrEM4zp0T1fLtFd09uH1PrtKM2h2QcrD6f8hJje
	HOc4+3ax1b933geFvGfipUHcbDwy0fYu4bsY7sUoEdBtugr+JWA8jTr/cBIAvQ66C29ceHkuacZ
	D3PJMWHHQKObx2hB9LbPv7nt4wn/NPpLBgWjHN+K2FPzUpUznwRkHxjuqCGi8v9RhaBgT5qzwBG
	N/zcEKbGp57ZpBgzY1T9b4MEVqlEa0Z0tj5sSFuIGLouOtByCvucnTpANJ6xnKAWC8JKrJSXtoD
	DhP+UpdJsDlVASrm/Roiek6Q5jyUH7oBcokdw25p/SqaALEDz7uIcgLIpa9VnvQn5N7A3xqGwmk
	R5Z+PNlbdhzvFAkQMTBJfHufB
X-Received: by 2002:a05:7301:5792:b0:2ab:ca55:8940 with SMTP id
 5a478bee46e88-2baba10cda7mr3796458eec.7.1771491709103; Thu, 19 Feb 2026
 01:01:49 -0800 (PST)
MIME-Version: 1.0
References: <20260210024601.593248-1-jhubbard@nvidia.com>
 <20260210024601.593248-20-jhubbard@nvidia.com>
 <DGHDW3YKM7L7.C75AZ8DY9K51@kernel.org>
 <f019cbd6-1778-48aa-a75b-d85cd48410f8@nvidia.com>
In-Reply-To: <f019cbd6-1778-48aa-a75b-d85cd48410f8@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 19 Feb 2026 10:01:36 +0100
X-Gm-Features: AaiRm50yCTPUTAm0W1wjhx4vGDvZUblZQLfNd3bEDqp90twJHJyvBTvUPIp09Hc
Message-ID: 
 <CANiq72kzFhzP_41ADCpjz8doVvPd+OBpajC2FH3gvNb-hHZ2wg@mail.gmail.com>
Subject: Re: [PATCH v4 19/33] gpu: nova-core: Hopper/Blackwell: calculate
 reserved FB heap size
To: John Hubbard <jhubbard@nvidia.com>, Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: CGOYPCFLGA3S5BO27Y4X524W4FYRITGQ
X-Message-ID-Hash: CGOYPCFLGA3S5BO27Y4X524W4FYRITGQ
X-MailFrom: miguel.ojeda.sandonis@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/CGOYPCFLGA3S5BO27Y4X524W4FYRITGQ/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72kzFhzP_41ADCpjz8doVvPd+OBpajC2FH3gvNb-hHZ2wg@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, Feb 19, 2026 at 4:02=E2=80=AFAM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> That doesn't compile on rustc 1.78.0:
>
> error[E0658]: inline-const is experimental
>    --> drivers/gpu/nova-core/num.rs:225:5
>     |
> 225 |     const { core::assert!(ALIGN.is_power_of_two(), "ALIGN must be a=
 power of two") };
>     |     ^^^^^
>     |
>     =3D note: see issue #76001 <https://github.com/rust-lang/rust/issues/=
76001> for more information
>     =3D help: add `#![feature(inline_const)]` to the crate attributes to =
enable
>     =3D note: this compiler was built on 2024-04-29; consider upgrading i=
t if it is out of date
>
> error: aborting due to 1 previous error
>
> For more information about this error, try `rustc --explain E0658`.

Please feel free to add `inline_const` to `rust_allowed_features` in
`scripts/Makefile.build`.

We are going to do it here:

  https://lore.kernel.org/rust-for-linux/20260206171253.2704684-2-gary@kern=
el.org/

Cheers,
Miguel
