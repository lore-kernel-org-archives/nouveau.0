Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5DFFFCA19C
	for <nouveau@archiver.kernel.org>; Mon,  9 Mar 2026 22:40:22 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1416C10E5DE;
	Mon,  9 Mar 2026 22:40:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jGcUhr2o";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E63C544FE0;
	Mon,  9 Mar 2026 22:29:49 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773095389;
 b=d5IdjOasp8j8fVl0Eu2smjEz8rC8sdH6Mm4IvOalL+ZdvlcU4xcU/MQfAPGkfIVnP6MD7
 a0tjFI61nSEI7Fjf7q5ji52L894fB7NUwY3q1347oLyXDqcO5lXthUjaHtnmvz0p4ypKWca
 RAMczG5zRlIsg7Hpq0ammfWpMKEx/9FrvZgmOaKDNxx9T9Dc/tD/mJTm0geuCvMAMu8Vdce
 j45+7f5vzwOnJcZm6UHHqTc5h2GvK0wc9NE6HDzOO8iiLl7eeEMmK+rc3tvBUl2fVu9KJM8
 n1/lqyOpS5A8ZfJMNjottCPAppt+PQqfyEQr2dwRh+cdyvS6tCHhOGJX3v+A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773095389; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=7ZruxRPvWNkf2N29j9GJ6qz1GqSjD5GFtkioQbQCT50=;
 b=0N7KGE1Ezg/iOFFZO9BItEvDQ7LNBOajJFvwGnr2fGoUzGsbHAuSPALc1dHaX3a4kT5G2
 VK+MeFSsondQeBqMQoZKX4iexowncGPbLPFgxq0QwTkdAxBfHmXK1dIYCDYX9Kr7A151bVe
 dnl2Geb9+Ospc0RWolGHWmfrPITEZoMciww/ey9+5W3lZ7f/DTswF6IA6t3Rfz850pBsmjT
 jkWOpmpRM6iLErD47o4v5Sc6X2INRScDUT0RihjTlYi794hT/EbmE/nQxwlxyKv96IjGqm3
 dopWWk0Pxu46Linr2c1L7Se+OS+j+v/mRcZeKSdSjOyXkCW99sLYTtjzYW+A==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 40C77404AB
	for <nouveau@lists.freedesktop.org>; Mon,  9 Mar 2026 22:29:46 +0000 (UTC)
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com
 [74.125.82.48])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2D47B10E5CF
	for <nouveau@lists.freedesktop.org>; Mon,  9 Mar 2026 22:40:18 +0000 (UTC)
Received: by mail-dl1-f48.google.com with SMTP id
 a92af1059eb24-128d428ba0cso124248c88.1
        for <nouveau@lists.freedesktop.org>;
 Mon, 09 Mar 2026 15:40:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773096017; cv=none;
        d=google.com; s=arc-20240605;
        b=dDstLeg+QnFo9UJwXlOGmOCcdoZutX5/4dwi0MBgRLQu6LT3CmIG/DHke5rKj3ecom
         UUyx1lqy9wqlj3PtsjdmkZxSlIjuFIG50jkblNJAFkkDYVR6uLC57bRxKaG+kn3M9w7e
         gZRdX3uib7TJLMKl9Kcxjk/5nIEA54zVsUKTX+wWZeb0x4Z7JXjkBH+dvOflwVwkIsAF
         1lTzJE6GSKB06zKWh6kLNaI8QDjO6V5njbDmDU5zaZEDRXt5//M1F8XJ8T/9mqXueYYI
         QdZ53G5Bzl9UVi+ITjUFJvjvQieQDFlGt6PhFfQMEkb7UpybAdB1FPT71Kx13ssprpeE
         MKLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7ZruxRPvWNkf2N29j9GJ6qz1GqSjD5GFtkioQbQCT50=;
        fh=W93xTeCr5zfgmbeNvqPpD+ZxlsLL5tUmEpMbWu6f8bQ=;
        b=Xy0pM/vkrGOi4zh9T0Xz3Y50OmPd5fZumxXn3nl8t2rfBz49CQCZIIPg6VVgQMoAgx
         Q9xI860flGj8vv30cMN6yn4et54BzltHdsQD/Vhq2Fg0I4mUyu9fCLVB0W1XkgcNHfGB
         o308EthpzyKg/mI67p6hgbB2bddCsNTa8D8RqVqbsU0rfFRzhBoa0h5qWsftIv65tE2z
         J7kpaL3RFdi5w88CnsrAAOi39gYK3zZ5SrdRrw9QwxB1g9+pJEF1rcuYmS9Gxv1/8imi
         g7FCTFZmKiFxK3niWPGX3P3bY4WAEFRUPdjcuwI98WGxRruSNa0cm0XjSrgxQ/l0e7xh
         iwOA==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773096017; x=1773700817;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ZruxRPvWNkf2N29j9GJ6qz1GqSjD5GFtkioQbQCT50=;
        b=jGcUhr2o9y10vosxWqcp2iH4SvYfZqttWIoXZ6BgXx14WcT+MmNM60YzM9ft0ooG9s
         MYFF3Vmkl/vEQex5pLTJojMihBrNmDrx21RzG1fyPugvU2IEHB9/+MrbrjrqMgtYhuu+
         RJ4s7o534ChqPhPMRgi+R+Jk1xwylq3C+BvbCxakcg149pvi7NSVMHKaq4Jo+zPbAlXu
         PnGAbJf1VAg58v94Bg4ErbXZaLloecLNvuD6Wizdth1Mx3QnQO2hP8iF+0lPIUPlT7Yc
         ClQLxrpVDEAktkX+LX6rNqkG3T1B3E9hvEEw/8Z4oQk5o1GTea393mu3Lf0Q+Uw0u2hm
         P8Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773096017; x=1773700817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7ZruxRPvWNkf2N29j9GJ6qz1GqSjD5GFtkioQbQCT50=;
        b=L9UHbmVvDFILO+WgC7ZNv9VBEIXNWsZDT2ytnA/0MIuBTf5WJjrs3001mcGYOyOhFK
         ARbj/0HhxXd1iV/WrWuREVOVyh1CL+8uBQE2Pq15o4e9GrEpDQc04lqaz8uDOCRbN7aq
         Gk1hGcE38xeGsxdD4Q4kGwp7ZTtEz6VXPha50kamTRlUTUmAtjcCu5BUmk8V22RPQ9dV
         x2Wn3v3axyrM1arEZLKiBLr95inyYlLmqL2Lo9wdGdQ/ts4O4j5ZkmjWks36bEtUoPaZ
         QrtaZwjBOF9dqpCQRbRfg19VVwM2iaiSl5mej4ODeTTm7dmCJdVXX6dNzqfUAQ+KfZpn
         qxxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbeEeIBk2GhmhbUA7VKjp7SdkMMUS2wq1hsr5VcOtry4WostFXZEpJ2dFdk1LTYxi4h1XXwkv0@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9Kc68Z3cDqAnY+0B5LZpU3yJpCVHV4o91/1FislYjYrLcQHqg
	8d5kcdNgXEGMusB35IAVURPfIwQKdNFPnjIPgLA4MtTSIhMrVhbJ/IwMNhKGV8WCLPu/lEx5peC
	c2L/DdZdMYWEb3i6R3fZI/tFUWKfY3ww=
X-Gm-Gg: ATEYQzy3lDP9vsDDvpBFE87kPCO/a3y9vN2vWyg4HKabdp+9wMLcO3F4bLIb7FfHh9p
	Thu1yaD8KU54xmG65up1D0d+ff2ZNh4CNMxQyjjTBZth7Q7DD7CnYwim/MHQPPHzs1ZB8ibArHb
	si5lkOCyORMDbyCtGDoazRYGFilFWkOSGa4BDh0wpklbV5YpvS0vjP+VyeC0TcprmvMlFuBTSot
	4+ZvTvvvr1D4NMyXpa7kdlmAKhpYV4S9+AE6h51+EAjsDYbPZ2AB5AqGIw4ep94Wa/403oOGHS4
	44Zfzj1jlObT+hwWTiwiLGEQLzw5GZH39/TqDmnsvtqs/78XclWU0FPB4Yc2pmSH2903OG4C35F
	NmO7b6ZRPSIwn4LJhXATBk4Q=
X-Received: by 2002:a05:7300:148e:b0:2be:2912:ff65 with SMTP id
 5a478bee46e88-2be4e055899mr2839234eec.3.1773096017354; Mon, 09 Mar 2026
 15:40:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260309-drm-rust-next-v4-0-4ef485b19a4c@proton.me>
 <20260309-drm-rust-next-v4-4-4ef485b19a4c@proton.me>
 <DGYI9CQRWXU3.XNDVWJE0DP6H@kernel.org>
In-Reply-To: <DGYI9CQRWXU3.XNDVWJE0DP6H@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 9 Mar 2026 23:40:05 +0100
X-Gm-Features: AaiRm51i63wiK9zFG4xNzbBEqTFq-Q0BP2B6Ia2Eg8BVDjn1989Ch1oIVRSK_CU
Message-ID: 
 <CANiq72nRZhJV3d33h++jYp1iEO3a=+pqrzZXf690Bbafs84qbg@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] gpu: nova-core: fix stack overflow in GSP memory
 allocation
To: Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: QMWZM5Z74ORKZIS3MXRQIZCHQQJTOGYW
X-Message-ID-Hash: QMWZM5Z74ORKZIS3MXRQIZCHQQJTOGYW
X-MailFrom: miguel.ojeda.sandonis@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Tim Kovalenko via B4 Relay <devnull+tim.kovalenko.proton.me@kernel.org>,
 tim.kovalenko@proton.me, Alexandre Courbot <acourbot@nvidia.com>,
 Alice Ryhl <aliceryhl@google.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
 driver-core@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QMWZM5Z74ORKZIS3MXRQIZCHQQJTOGYW/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72nRZhJV3d33h++jYp1iEO3a=+pqrzZXf690Bbafs84qbg@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon, Mar 9, 2026 at 8:40=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> Reported-by: Gary Guo <gary@garyguo.net>
> Closes: https://rust-for-linux.zulipchat.com/#narrow/channel/509436-Nova/=
topic/.60Cmdq.3A.3Anew.60.20uses.20excessive.20stack.20size/near/570375549
> Fixes: f38b4f105cfc ("gpu: nova-core: Create initial Gsp")

`objtool` also complains about it because it doesn't handle certain
instructions, so probably:

Link: https://lore.kernel.org/rust-for-linux/CANiq72mAQxbRJZDnik3Qmd4phvFwP=
A01O2jwaaXRh_T+2=3DL-qA@mail.gmail.com/

Cheers,
Miguel
