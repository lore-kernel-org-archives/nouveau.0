Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4262DCD5BAC
	for <nouveau@archiver.kernel.org>; Thu, 21 May 2026 15:33:58 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 94F0F10F348;
	Thu, 21 May 2026 15:33:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="naeCmfL+";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1231446154;
	Thu, 21 May 2026 15:20:43 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1779376842;
 b=mT+aVYoPbRBsQiud2v5k+T11hHa/nqr1VuL7Z9YNstsromYXKtRi5Tyryq64S+3mevQib
 +uYZunTEKLunFNE4nKFAsq8Ad5O841/0Bgqir2YvpLIlp2h/dyLAuFM6Acoo7q937Stj+1q
 B0ylswaCFMvlpUUFEJNEUzOx2xZfna7BMTpaDATYB58LYa2MZPcHT3Jp2CKkpBU2Ywodg2d
 slFgloPoZ5qsm5XucS8D26Ph3ndWyMRqQz4AQleGqz4LAlyi9LH9QonK8BQO/ci5nJVyUwP
 KbfI9w5b1gl7k2GFtYK/Rwxvo20dth1OSSxWKMH5OTjuXWPIjCC40uIYquFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1779376842; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=gZORxaPdJSDOgk8ANxzTl375l5CvuQSqBLkQk79bozY=;
 b=BEu5vS+dxauVwmh/e0MFuXARrzZKL1KAE0jZPqReltTp95FbE6C/EebwMnu6EQYT/bfDI
 4sDP5EwHNII+wp6MA2T9xMUKir3nqdVVrIN2Hp5SzIB3wp9JsEYAqxyfXFIjBcp8FRLBmNt
 Y6FRsj0UZNzSOMEt1m2zBM8v+kIoYbg5BG/Hp8Tgb7lzvXUamnQshgBcW4viS8DQRuiR9zS
 e9JNiTZQt1cbK9FFmrXMMKM3fOxijtRpBfShDXrDMPBcCUU+djPP1JjFgnFVCgO/ZhZ5QNv
 cQHjAUJ+MK3tGg34B1YaXrLLG6NhEUVvo7LmFANLMSmVgveXonkuH1zV+ZsA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id EE88745C56
	for <nouveau@lists.freedesktop.org>; Thu, 21 May 2026 07:44:21 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 923E010E464
	for <nouveau@lists.freedesktop.org>; Thu, 21 May 2026 07:57:34 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-45e9f4a3510so541773f8f.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 21 May 2026 00:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779350253; x=1779955053;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gZORxaPdJSDOgk8ANxzTl375l5CvuQSqBLkQk79bozY=;
        b=naeCmfL+YEmzWgK2B0CE+wXvFDJDOj3nmctAKniYIUN7cKPbOdHEEVP/MIA/XaQozD
         XdotckIm+veGAiZHcoN7c+yrLDTAPx9t1NegZaHJauRoCJVqfdZ3qzU9Vd6Mhc4fBRyw
         1/B1+M/pTPmljkuEXQrWfB+AGniVXoZ3+kN4LBa82or9XS1hwwSkQRGAtBTV36UIotaX
         7SDzH7egt3e4ZsN6T/wherB6rGvMNcjGQs+pRuOx5g/gAtaoIuRLsUeYFwRVmB/dvj59
         HTo+T9uGaZNp/VL7HijC1KgkQUj8Nl011YRUFr3mg/AqlDK7o7W34w8fjfCU6p6tcwqZ
         8bcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779350253; x=1779955053;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gZORxaPdJSDOgk8ANxzTl375l5CvuQSqBLkQk79bozY=;
        b=X48Y3yWm9pZGZ3sGSkMWoOL9vrhswaPc7ifux+Qx/1z8cjbsnXZNqOsLFL6sQPaJN3
         2Z1inJ1d0CF4AT4FHZQUtBL5lGBtNcBDf+dRZUj/H4qe4shWifpSCxIfykAp772hb7Fj
         HlOO24X/YayCR4Y8b0ioZGTzQoqZ+sSiWnliztaL6GA7ACqdWSykiv6IuewXQfqxotGN
         7UTcs9sEbDuPWmtB2k1Q/lEhUSePNjA9izY7Xpv3NicvZKqLX/vcelDRdegOJoNAXbD9
         2L8WQNnyoouwyqwvj98G/P9pqAvgHtbQyFYnLsOIfdqr5aEv4j6a4sC5CECTTKuizD1h
         NsDA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8Bwijxfb+O+GKW7T6dkFV+sjUW3RTNSRYGyw3ZpIL9pVYAsO6kWi2P1iKxiu1EdbcYtrz9pR3m@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLPzyOJKouKZbqh7THXGQk0EF8/6xh7PyjS71MVpvyU9PV8hB5
	grDHG0UOJx7zYIu7FdnMOYJPGwQw8zTQxg3ZpTIHYhSd6TtFQ9IcGmV/
X-Gm-Gg: Acq92OEzSfLp5ynvOv3WwwGPpkG5vcBiCQNQY7k/oxQS4+fpkVG1b/tWRm4DN4/23gV
	DoiFgrkrTey5RWbOUFkdeKaaqCUx21K5CG4/6Ry2VxK+KI7c68s8j3jvTHoSNsUOcM08tgUNvg1
	0eqRCodPsIg8CGqG3WG4MzoLs/uQrBOrmo8ncWymCyoP4mLrKKL7hmH0g5Q5fsCS0cFHdyJf0ZU
	qI0Vqrf42HlOZ4PLOdbCUg9EcJ+dxOvowXaIYpwGenL6ZRfCGPwdScjvJaPx+SpUhssEon6JaJa
	1K8kphFTD0tO8ek8OwP4k0dxHzrBHHc/tn0xbrCxpyKgb5xxMLqWxvffR0tEjI0shFajwnPywt2
	Qd5JTYYdlt0WsO1BVCGrFixjokOfI1IhL5t2CHl9Raj8XamTizlMRVmKAf0yxmFGUdMgXwW1pV0
	64wE49Gn5am9rTGXUi0Y42mGeqBst4tHdyP1Bnx83goKgMTW71AUCd4m1QEXQ+lHUVDt/yclvfq
	SuAgahGEJ8Dxw==
X-Received: by 2002:a05:6000:2583:b0:45d:3cb0:5ab1 with SMTP id
 ffacd0b85a97d-45ea4141e17mr2803411f8f.38.1779350252817;
        Thu, 21 May 2026 00:57:32 -0700 (PDT)
Received: from orome (p200300e41f291e00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f29:1e00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eaa7dd50asm821152f8f.15.2026.05.21.00.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 00:57:30 -0700 (PDT)
Date: Thu, 21 May 2026 09:57:28 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 4/9] media: vde: Explicitly specify PMC instance to use
Message-ID: <ag66qZ6rLOeUTWV7@orome>
References: <20260506-pmc-v1-0-a6de5da7216b@nvidia.com>
 <20260506-pmc-v1-4-a6de5da7216b@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ufnilbb7pbo55sdz"
Content-Disposition: inline
In-Reply-To: <20260506-pmc-v1-4-a6de5da7216b@nvidia.com>
X-MailFrom: thierry.reding@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: 7C2WAS6L26YNMPIGSYKAA4LQHOUABMQT
X-Message-ID-Hash: 7C2WAS6L26YNMPIGSYKAA4LQHOUABMQT
X-Mailman-Approved-At: Thu, 21 May 2026 15:20:40 +0000
CC: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Mikko Perttunen <mperttunen@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-ide@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-usb@vger.kernel.org, Thierry Reding <treding@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7C2WAS6L26YNMPIGSYKAA4LQHOUABMQT/>
Archived-At: <https://lore.freedesktop.org/ag66qZ6rLOeUTWV7@orome/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>


--ufnilbb7pbo55sdz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/9] media: vde: Explicitly specify PMC instance to use
MIME-Version: 1.0

On Wed, May 06, 2026 at 03:41:55PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> Currently the kernel relies on a global variable to reference the PMC
> context. Use an explicit lookup for the PMC and pass that to the public
> PMC APIs.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/media/platform/nvidia/tegra-vde/vde.c | 15 +++++++++++----
>  drivers/media/platform/nvidia/tegra-vde/vde.h |  1 +
>  2 files changed, 12 insertions(+), 4 deletions(-)

Hi Mauro,

would you mind providing an Acked-by on this so I can take it through
the Tegra tree? That'd make the dependency handling a bit simpler.

Thanks,
Thierry

--ufnilbb7pbo55sdz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoOuugACgkQ3SOs138+
s6FbKQ//aRQbgwr4ztzl8XykZ3VwYpBsUA5hzUjDURQkJFNdwnkt6k1kBPuF6tMI
joUObtuboDDZBD6T1W1CWvCKqzBPwDlmD5hdckRGlbau3ug5Z4HYFpTEoO2VPhr8
kW6mO+oE+5Jq2I4kEfCg9WfotOOP15ehuSzn2JRbKZDLC9l8/Fyo/7nglXyjmoJk
qgD47vfx8/zgrE/Fv9M+eGdeJzh0XxvRrqWYxe6wJqlFCETYNH38hb+CBfIWa8HR
Tzoa0rmTS4YRP2+p6yeckAN5IWgSx7ZTbCMLLoJfyjEbCUf9Y3ymi7DNWHey2gi1
SY1ue+l/i2UNavChYqtuBV9YOfSyM0PWRQja4YeSMSIK1M7mLfta20LOo37A112O
BN5tR5zmtwiKW5ZnAReOMcWJFLobWu9+ZlbkiyQ4yiONh1truDHgwBOssPfCK+/Y
ejeJGgdzWnlgonVwEp80tLQsNZN4Nccrmnn5JPaH1maEC+eJBtP1Y6V+io/28QFP
YE+W8gXUwm2BK81TcpIw6qswfWiBu8WdGeCx9j5X+mbo/jNWboIo2l0AQxtbCyGm
LiYJV+w1iEWO3WWQKymgmwRdhT/QfeS4VcUikTrZG/NrcIEpVwuVk4syKobUx9Cx
DuSlIPt97hHCjwAaF6HZwg809a+jTrqXPBq4VlYvkjefZNJAiMA=
=2vYi
-----END PGP SIGNATURE-----

--ufnilbb7pbo55sdz--
