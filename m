Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17713CD5BAC
	for <nouveau@archiver.kernel.org>; Thu, 21 May 2026 15:34:03 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CD52110F3AB;
	Thu, 21 May 2026 15:34:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jmslYTsB";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5290D46154;
	Thu, 21 May 2026 15:20:49 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1779376849;
 b=HNJbEHTO7EaSij++4gLBMflPGxMDH7siBR32Ekal/nL0mSK9r7gK05SasDihQEENp7Mv5
 QSa4LM1FOh/vi80FXUItfbRN2i4s0BvyiCi635LBTbov2LjMJYGZFkFk4YabaZwGQtZQ3RS
 JUohxQftwQofHmTfTCO+oFs+9POCIwfmwNilBO27FS3e/W2GUJSV0ZE9CEEtRf4XccIzPLx
 wfXbPZhzmOn6R09NRtij8NVbiNTL6GPm11X0f/lou53MBSaKKEsRA3dOZfpy1e1/VAKUdNH
 P5UTKkt50y6cMCFc3Dyh1/Ffi8r1S7gCfTPkTbFXTtTkTPMOpXdLMMKLZGgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1779376849; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=RfHyghQkuGkWqA8eUzVzPKJ2kyI5blFU5Z3V4gExrrw=;
 b=AjR3WDZ2L+kHFB7sEGikpawHUTqm2xEXFGM7lH3sjsq4xqnrwU1Rs7xTT3nsJEnVJ2ne2
 iPGfh/KGqPoqV8S+Ud0+qJdi7XF9uI76OSG5mpVIRSqFqgfM/tpl6/x1QcAXeSYlFBJfWlD
 8FcrJh49EUctPi9m06RtsNMhntaELUVVUJ+Ct6uwbsvTdTCMFHf/8b39PbxeeF6u4foBcSb
 Rssyd6TeLR4psctKkZ8miV5PPbky0C7GYgXw2oRXRrqyeAnbBtyB/nKfKByq8A2hScAcv4H
 45xE7S8/8Rzbs+zWZiPrfXbs8g4AV7hUpNXWGgadv5DT0QCdzEzzQCJ/oTlA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B296146101
	for <nouveau@lists.freedesktop.org>; Thu, 21 May 2026 07:46:00 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5F68210F24F
	for <nouveau@lists.freedesktop.org>; Thu, 21 May 2026 07:59:13 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4891e86fabeso76341615e9.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 21 May 2026 00:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779350352; x=1779955152;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RfHyghQkuGkWqA8eUzVzPKJ2kyI5blFU5Z3V4gExrrw=;
        b=jmslYTsBM1xmGh249NYKz/ezIIDJ9HaWmAj/i95Z7yOvo9h/sl7kKVM3u1Ix+odVG5
         LwGTTP0YNabcinAJluQ3DsSg2vM6Tll3e4fF4kLYOVWqNVSr8Qeclr7ABknyZ9aNSgWi
         MrPOuBAIJZ5YbX4WLe7GVoE79WaUDVZjsG4iCRPrt5xYRAtmFUqKBOnhtPw3mUrGbKm3
         Bv4QQB8eLDuCzas6v3SNrcgHd2OysuMSUlWM1I+lYgEYmNVlXtTrg79L5UWh5w/16s1j
         5ulFQzx3APHCWBKdVquj2W8mbuOeIxwEdkup1w6lZm8up9mUUgW1SjHpLIwUB6V9Wxqa
         XHIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779350352; x=1779955152;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RfHyghQkuGkWqA8eUzVzPKJ2kyI5blFU5Z3V4gExrrw=;
        b=XwRariR8BlTCxWHuO4E4LsI3iwbsVYDbt7hHoAfHrJp/FAt+rt7MuYEBF0YL6FjSSY
         X3MHvz4q/Jr49AITAaClfSKAhs/JXaZxUVHK8+wgVHVy9xAPNp9ycbqJxz7JpIoNR/dp
         GkzSwHbUredFj06suCzHgwbe0FVYxZQKIPqAlaYSY9ZvPB3HdC5hpyopqyCq6iIJ02vu
         OIfFFlGed49B/I4zquKAlMO0MNkoB199sTbhQc8YHI0JFL3tKPhPu1q14Zq40TedAae+
         dgRCfQbjRoLMzqsp3H9LtrMCY467NB74QN6vbeOCWQXBMCfap7fbUICwGMFd25KVedtT
         gANQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+abpGGYevzcv4agt2eNAW+g+2dnbI5UDD0xYfVnuAWA2tuIpgnx1xK5W6uHkyCawt/W+PuWx4Y@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYWZ4knTqOJuwfMtvb+RjpnLR8zGlRwBx1qf8dCV+XtZIR/i9V
	xkDVdLCWpqpqFOu8NcRD5qwdLJQ+die5BoxWh3zyptD21cgep4/Shpxap408ZQ==
X-Gm-Gg: Acq92OHe+6viT3IVXTKpnIMc2nNH0tKiAkmzS+jNwZk7ymgyreCVHTsX45CtjZvTYUB
	OCHcZQ2Ee+nxHuIMugC4CXQDcqnoacL9rQmnPeLNLORdNQ9xzhIfmkW54xzklcU8Z9gxFYyqyaT
	R9K9mXFsXg6dtLvp/sythurbgZN/+j+AvzziSOaosikNT7lg8sG1CVWopasjhzqpkuppg0sFm+5
	d7epvJIA/jB+rI7AEua2xGrElXeI5S4tDbCYzUGpQlQA+Jiu5as+VjMLG09BncZbapx96tEyO10
	2UqtohqwiJ83MdfQfiTE+4+zLt8FK/md0bceokeB4iCLDiKdASy5/WBrGJRVsvue0sIwh5sSvPU
	nzhWIK2WV36Ub646ZARjx90Mv6NToLm8jgYASv6mdSF/0YiRAfCBnsKl6UMKRwojNhinBKh6UOZ
	twKPI8+XIw6HqGho9AFsekHntzIba3wQJHkiPzNuneaP5av4NFS5Ceq5tQ0KqmLc53m3BS8DWAK
	TCFkD1m8ul7tQ==
X-Received: by 2002:a05:600c:30d3:b0:48f:d612:3c59 with SMTP id
 5b1f17b1804b1-4903605d86bmr12514805e9.9.1779350351689;
        Thu, 21 May 2026 00:59:11 -0700 (PDT)
Received: from orome (p200300e41f291e00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f29:1e00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490387d16basm5521255e9.35.2026.05.21.00.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 00:59:09 -0700 (PDT)
Date: Thu, 21 May 2026 09:59:06 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 6/9] usb: xhci: tegra: Explicitly specify PMC instance to
 use
Message-ID: <ag67FStKnQcvNOrP@orome>
References: <20260506-pmc-v1-0-a6de5da7216b@nvidia.com>
 <20260506-pmc-v1-6-a6de5da7216b@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o4bqtknoba4e2ooc"
Content-Disposition: inline
In-Reply-To: <20260506-pmc-v1-6-a6de5da7216b@nvidia.com>
X-MailFrom: thierry.reding@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: UYMYFMTF7K4STNHDPM3QLCY57R7SSLYZ
X-Message-ID-Hash: UYMYFMTF7K4STNHDPM3QLCY57R7SSLYZ
X-Mailman-Approved-At: Thu, 21 May 2026 15:20:47 +0000
CC: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Mikko Perttunen <mperttunen@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-ide@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-usb@vger.kernel.org,
 Thierry Reding <treding@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/UYMYFMTF7K4STNHDPM3QLCY57R7SSLYZ/>
Archived-At: <https://lore.freedesktop.org/ag67FStKnQcvNOrP@orome/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>


--o4bqtknoba4e2ooc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 6/9] usb: xhci: tegra: Explicitly specify PMC instance to
 use
MIME-Version: 1.0

On Wed, May 06, 2026 at 03:41:57PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> Currently the kernel relies on a global variable to reference the PMC
> context. Use an explicit lookup for the PMC and pass that to the public
> PMC APIs.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/usb/host/xhci-tegra.c | 38 ++++++++++++++++++++++++++------------
>  1 file changed, 26 insertions(+), 12 deletions(-)

Mathias, Greg,

can you ack this so I can pick it up into the Tegra tree for simple
dependency resolution?

Thanks,
Thierry

--o4bqtknoba4e2ooc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoOu0oACgkQ3SOs138+
s6HRkRAAqo5/UZ1fUVfF67PnLxU9m4v7JcLF4Ytf/Z7v087AEjfB1FXekO/SfEUl
dvex3+uqG9CIaSIQtQ8rxWgfEyOZeFirJloIENzJtaXACdsld465AHpQKBNbI5xU
/euNFiOwGTIgOHGhhxAIurS7F5Ag0WgWOTDN2uBlYGiDeuZShkW3Ek3M1WHSF2ey
Ai6uDC6tf03sgZla9uXS+eOZHkVaTx9pRDE1oxxHHLMtwgfkkl9BEHKxJ4ZqTYk8
6G5Bdz88LVtn4VWK2v/B+E6LiY5FJWuS2bM0PeRI2KpkB3F1jUy0rnC3OjdcMBjE
zyezSJsdMXkgODfA1zpIjGaAWjJ/wkU3ptsQ2EHq2+uTAji5OBUP/fquL+uOI+xH
WIHngd8r7BaBvygQpvVPl3YAC26qyRDmRqptWTXY/uISmcwmRZ6BaQTBsx1WOPmM
mFdZE0rVwRSfMws0GpPu6Atz++gerVHz/2EAFKPrntor6zUjSTbF3B42XCtIwpyO
T1Wmpfdvpt02fe1SjJvhkFCHzCv2sHvUqshC79KoN0gavq9732DOpJdn8aN8YTfe
GK4ekoKpjRZr5MUhTWGmRL0wrDNysBgOur97daSMrtrJNs+s8wlXA+9CP9nyICzs
2bbPfHWWQ78FiSSH8IOW/xAAFxM7aEh2UcHuajcX9pBLFwOnveo=
=ByYw
-----END PGP SIGNATURE-----

--o4bqtknoba4e2ooc--
