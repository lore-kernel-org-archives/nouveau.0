Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C8ECD5BAC
	for <nouveau@archiver.kernel.org>; Fri, 22 May 2026 10:15:41 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 44F5210F546;
	Fri, 22 May 2026 10:15:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GLBrR/TX";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id F065446161;
	Fri, 22 May 2026 10:02:25 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1779444145;
 b=YvY61HmgJ3upDwOxbFzBQlpw5S0RO0bKlf8/h2NPgLYpufm78SDcIdFV4IlBNt8/SfyTh
 vtJtkJICLQ1zegyrW9sq2KQjzo2Ty6VqgD7Ol+ME1umI4sIkKOvyrRItnnX8YUUM6bDOoQN
 KCuaDJ4KUUAQR/4Cu1kyyqvAoQ/LTBaQmWt10a7NDnld/16VU+9LdIT0STYnlzN9/T+aAxB
 TKlMI9ozG8jqoJy+zvMn9L2HaftJ75pviBQKX9Jl7xzkLDlVqcxreyx/X7sgTYB5hSkwric
 e3i68NV1EbOLY9ajvjQ1H0Be6YB/ysrlaRCH2ADeQokaQgU6nnAHRIKgnMqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1779444145; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=hFoNmBbf70FRqGV5pmUwMEHTZE5OKrs8CbDRqYE1oiQ=;
 b=rlXkR1gUqXmMEEKft8CvrfYF6Jau7TA+MSr5N/NdM/mhBZXHJG2nt3+Tp4uIVvGeJC8NG
 vcjzPKS6U2pIs3QpdkHzAK7l/Zcf/+EtkgSpvFNBCjh6WpX6jTJjvBpCvXAfkaqVdI/8WLv
 WEmvV6JSeaJWDM350SEXzZJUPOMfZEC+VBYaddjNs6PRyefxafH13lEmzsY0Jmkt/aObius
 LepCNFYks+bva1jTUj5ryXxbgDzu0hC8mJPPW2Jl+GmeALA7UnnOMiURhJrJYsf6V4ZCUHT
 eEeQGfUtfGRwNE+jpgQlMTle/kFGMPqAuOsCKZUNXqbuXqSEYkUfno60L5UQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 77EFC42910
	for <nouveau@lists.freedesktop.org>; Fri, 22 May 2026 10:02:22 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 85ECE10F53F
	for <nouveau@lists.freedesktop.org>; Fri, 22 May 2026 10:15:37 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4903cbfad68so10474995e9.0
        for <nouveau@lists.freedesktop.org>;
 Fri, 22 May 2026 03:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779444936; x=1780049736;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hFoNmBbf70FRqGV5pmUwMEHTZE5OKrs8CbDRqYE1oiQ=;
        b=GLBrR/TXb2/KUKzSLXdsQji15DkWmnBk75AusilyOQl5pyj9iO/TbWWSIV+6+kXi5s
         35EW+iWNbMDsif6rxLPIbeEj0uLYoqeSPDI4VebryhOx9d9Qe5YWs1TBIuUYbytIhzSj
         liBZ2LJWmjh0tjFMICLYf7p41g8g9ENf32eG94Pp4KwLeQXHCcSp9L90tvbQ+M5UdXHO
         5ag6IFUr3BJuY4pkwmtpUHny+orQt4AKgdc7jQT1u1j8mz9B5gD8k01zBAYaEvupoKti
         jMUj3ywTmspdcKmGUyNIxtwL+wd52QR5J5hJ15pIRHNldzw4I7AASYuGBercORLsX0R+
         27QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444936; x=1780049736;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hFoNmBbf70FRqGV5pmUwMEHTZE5OKrs8CbDRqYE1oiQ=;
        b=O9+tybv5HC19Sp4pypUXZMoOSEUzQhp/m06+5E6macijLbIOPbcDNk/Tj1T7bZsbyE
         HF8DwvNaJG9a8yHzMFG+S6BJnRa8gq+PAW1op0X72cmJ7rod+JwmnwuPXfAXRzXHBSTx
         WpFE5SBiUzEk8jgrMq/sn1XOC823DWbJa9hRm00Bt67D1K6/ppf3IM94PW3JMGkeew4p
         zBoy7OnRe57aTG9hxmLf9OTMQd1WSakuDsJU0V8lUKgDCnnRShhRkibdZWDDfg6HZ4dX
         eeF8yN/8hayWbl0jORhGv/QDDSi60Z71O8Zjjr8s/J7kRGE7Nob77wVFmrOcpwwZxrmv
         WE5Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ9fLmnoqh6Xm3rt4X3lEZWT7BCOjSjbKl1ySNYRLd4QCG1IPdAkcy2XT5uX8plCZbTdkNxNJjPK@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEwOHXGebmiLbBQCCL6mmg3ZWZ7htdrJ1jLFo/QQsKm1gsU38P
	5Hj5eEorZ+eDECGjC5BzXx7O72emYB9SxrgOAuB+mwS5FGiI2Myjr9sJ
X-Gm-Gg: Acq92OEFc1UkfvAJj31xoNX5qBHjSJQhFkjFm8wjTyqe5rI6PVoN45RFxTYmC5BjOif
	Bnwaxm94/UMpyEzG010OJio8OWVecyfhrx/2DJayyygBYhPLXFs/WkeTkJnF6muQerdUlpIy4bD
	dCTngVCoopk8jbuMIXrgPj93aIXOnjXtZURNvMFDsHgb0Y+N0gQb4WhWkvDCS3wg8Np0NWhTi97
	lPtI19h60Hd/XHVrYKiJwGKl5ZbMxRP1k6H1O98PawThjB4qiGDUCjZ0KhoKdwQnsL3Vw41L+oN
	3WV2L2xboQ2q+hUA0PemEsKAX7XKKRbbV8lmobKH5DqJyR+YhyfhXjeWaCF9xfUUHzu+C2VaF2e
	WZ2HYUM/2oxVa037oEBHTW0n9zLMlE9YloA+MkW4RTlo4n33IBWNxN4hRZTXfYIUuq+LmT5Uxej
	xa/c9CcT49HYEP/V3EKb4PXh75hT3fb2jT6TmZeWuoEvkz/86qoYMdKVzIHFezoxKnvGNsMCrUX
	ZAPLQDFr6603f7jjCbacfNO
X-Received: by 2002:a05:600c:a402:b0:48f:e230:29f5 with SMTP id
 5b1f17b1804b1-490426b0c92mr24655565e9.16.1779444935807;
        Fri, 22 May 2026 03:15:35 -0700 (PDT)
Received: from orome (p200300e41f291e00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f29:1e00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4904527dbf3sm30624875e9.6.2026.05.22.03.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:15:29 -0700 (PDT)
Date: Fri, 22 May 2026 12:15:25 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH 2/9] drm/nouveau: tegra: Explicitly specify PMC instance
 to use
Message-ID: <ahAst802sjuJr7-l@orome>
References: <20260506-pmc-v1-0-a6de5da7216b@nvidia.com>
 <20260506-pmc-v1-2-a6de5da7216b@nvidia.com>
 <ag67dmFtSDBC6aPK@orome>
 <f08c6164-78d4-4c79-b4d9-d7e883e5a0c0@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qtz3f4pwlb7uchwq"
Content-Disposition: inline
In-Reply-To: <f08c6164-78d4-4c79-b4d9-d7e883e5a0c0@kernel.org>
Message-ID-Hash: TSPOVHVLAS7RZR276ARYG7QDXHRHRWM5
X-Message-ID-Hash: TSPOVHVLAS7RZR276ARYG7QDXHRHRWM5
X-MailFrom: thierry.reding@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Mikko Perttunen <mperttunen@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/TSPOVHVLAS7RZR276ARYG7QDXHRHRWM5/>
Archived-At: <https://lore.freedesktop.org/ahAst802sjuJr7-l@orome/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>


--qtz3f4pwlb7uchwq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/9] drm/nouveau: tegra: Explicitly specify PMC instance
 to use
MIME-Version: 1.0

On Thu, May 21, 2026 at 04:04:28PM +0200, Danilo Krummrich wrote:
> On 5/21/26 10:00 AM, Thierry Reding wrote:
> > would any of you mind giving an Acked-by so I can pick this up into the
> > Tegra tree with the rest of the series?
> Sorry, I thought I already replied to this.
>=20
> Acked-by: Danilo Krummrich <dakr@kernel.org>

Thanks!

Thierry

--qtz3f4pwlb7uchwq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoQLL0ACgkQ3SOs138+
s6G6mg//ZTSVOV0O5XnlSqUo1fdyiV44Qxo3ysbWUv2+O3w+r5WwMjgdyUM9yAbS
cdsRz3LHOAYcXBxYZhtdkLh5KhhvjdkUk4e1fdo/5QSGjRPARHPS3bQAZbnpZy46
tWvdiKwj2fM2rZ5JQHvYEjGCSQ9hGa/9Ri3OnGti51rcUbCJhJS/J1KgyJ/UOmyn
ZKLr/2FfTbmC8w0Ukki+CV3d4JV/pxY1UNjyt7x568o6JlebDPK6M7PKMI/IM6GW
fHt0U+f335ljan2LD8HZfSia4sa2nZJnbJDtIEj1ov6suhrowY9Mne4JQTEwjuLX
db6abSI9ox3O3vkx7Zd1G795TZUWTXKlw2SHr5vMyOBXhJHtipm7y0bAwj4ZJiAp
5ghmBQzl9HdBVy8x8x8SjmVCygxrt2rOVocYDG1/Uc5DSZWa8aa3VQJMK6WZy9gB
9G47X1VZPs9B/KeqE5TWRwB05OHuLeCIVQz8Nd06DjN0IEUStecgDWXm0bs4UNWZ
zMwz/HPgK4zp59HRlVqgoYRNrIRXCd5wmz5t+JdqDwbytna2YVTV7u/3FOGgn/rD
HgxwYqtJsO3KosQ3UN/HKPoEk67noCBWMrSzZbwFhw/DziZwEn4mr+slHKizUvrF
40Ir94vEC6DhMDCNJClxmU6S9zhRoKUOqW3FLyPgC1Ghfp5RQrQ=
=MZIt
-----END PGP SIGNATURE-----

--qtz3f4pwlb7uchwq--
