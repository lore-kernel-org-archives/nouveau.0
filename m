Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523BBCD5BAF
	for <nouveau@archiver.kernel.org>; Thu, 21 May 2026 15:34:10 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 18A8410F3C2;
	Thu, 21 May 2026 15:34:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jHRC13cG";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 95F9846102;
	Thu, 21 May 2026 15:20:56 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1779376856;
 b=jdPhysHBlHRpG2ywpSUmq4ldLRBfelS4CRqY2QiDB1ja3QV+nUAFhN0KtJMvcVtnx4oqR
 qGWdAgWGgYaxBy+GDrGQ5GmlDbYACebfXLMik244Nzm4/nMNIm+aP+PrAS+zYRNaM1O5b7u
 I2wtm6JJUvTw+NqWgC/CCepvbi/C77ybgzvEwINu8JV4UlgWUlyESmz/fF2ryvYuN6WOQej
 gteVdFRfA18PpypXv8zm+iF5T3IryUFavW2tPhmx4112G2kPXtCyaku9bE6bWX/Nrnz9IQ7
 kyeIXapvTGYarGuyVhB6QwKVa4jBzUZJeRg9l4GCH28s09QgQY3T8Y5zMuIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1779376856; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=CAGm6nF0wdUN0d2423OYPWZUGqBbg4/Jc7nYqxEaHM8=;
 b=I5t9XOzUlvro0Gji4xRJBWdtoR+Nz6Sc0ZET/IiX/q3PHtsmfc59pawzOXGX6qCgdgANN
 cY8jNkpGS/wqln4A6O7PHEPMlX61RmBidA4xiDo1Z01s62iE4QuSbGtDmZ19QUrMEk9CcKz
 c0neWAwZmG6EdpS+xt3jURhF37XDgjOfdjJBn6WQfwRIsW3xKDt6SGaQuFVXliIe93zOFb9
 CTNpj3xuW6Efagn66FvlPlVmp8znugUSSbvOuKQtrm84OBigA79HjOXKUxfSaojteKx03eO
 JVQdmLjkq42kgq7s8cH74CMWDtzngDUusiamius2pAKuJGCFKp8U3h48NRYg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 70DFF46103
	for <nouveau@lists.freedesktop.org>; Thu, 21 May 2026 07:48:01 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1805810F24F
	for <nouveau@lists.freedesktop.org>; Thu, 21 May 2026 08:01:14 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-449d6c68ed8so2836232f8f.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 21 May 2026 01:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779350472; x=1779955272;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CAGm6nF0wdUN0d2423OYPWZUGqBbg4/Jc7nYqxEaHM8=;
        b=jHRC13cGSWYgmNSjxnwJQ6PzgSR4e/aAPLJ3s8fr8AuArWYJr4L20vYdp4SrpCQfWG
         QYZS45Dl+NPN0TvXBE3k937IMcDyObrBsAU/oPeZ4Y64GB2VAi/nHddz37nQKm1NHp1x
         q9L1Xs9Z34eoaEA02XwinkkmmsEEA4CiZk+W/NdmZWGu7Go2Qk+k3fccOJetcoSxfACi
         9H+LMufqPwTxxBXidkxo8zr3GFy8o9UArTlqQY3b5WJUq+2jeHpoFNBy1XkcNYeHzRHt
         QNg4D54Ly01wF+YCV6B1BLEHNk2h/ApncHATeyGSNv19f1BD0U+2gCRanca5G2Kyr6mb
         2duA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779350472; x=1779955272;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CAGm6nF0wdUN0d2423OYPWZUGqBbg4/Jc7nYqxEaHM8=;
        b=GWy9uoJjeBIj0xGoIQ0p34oG31u8jaf4yatNB/oQutY9SeodPqIsN6d5pQl97FJ23v
         EBvKmkebZB3I5hnSFT3D/mnunMQ8uqUEdqxD+He1I/ujKRcK3AzNv6oS4iPnyDkecN3C
         MM0K2MaGqH8j96mAwdROhg6IUelTmxOw2GLYNzwEmM+oW+96cbCqvDv53DOSiwgU2m8B
         SxojRaFrOKqQP8HsBfl8V5HizqCL+UpWHRH7vwXZIj3tCojy6dqSQF5/FIEUVmz9STXC
         26iU0YBO7qmvIGo6wCHvaJTM/d4n8DUkTqc/82OGI/OdTPIbxRQjc6ZoYlX7jGbve5mI
         clpQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9obFIb0Fu9q21ghkHS9ka+RIxEMAnNc/lZVeOzEqTKwU6ESc9uueFLLV9LINMZqpleRf1vW9iK@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZqMWKZNYKBnZ++1suEyrerQINNvf+7xCokUgOkLAsn86JiEw9
	bR3Z2V5Li9n2yghgWe50x73bipb4Hx7O7+KiE2pdgfw0ENjml91qIpHa
X-Gm-Gg: Acq92OGsyCFBKIroX9F66c9/MT+ka6Z5lfPgfOXelJuZaQ2h68lLwYQGy9L0LWRAdER
	/IkZ7f8gctC5Z30S2fn02k4siFGDuscumrMGDcunVlI/+GNZO29g2PZgpE/EOsUAVMKpOFCWvm4
	GGGtUTCbWE8Vg9QTp4Uduz7JePlXqyQ488THfjNTI/Mp4Q0Zm2UOxvPHG8jP5Z0CXRtCRx0YZmq
	uJS6X40p5CtLwwoHHWapTumJhwmXClS1Hm26CR9Ns1x+F8eFYHtUFxB8k3+tv7RI6TtNLJ0kHSa
	2SRqe6r2vfuAXS3kiounDZ/8O7zYPrdi9yyrUcQv3CCTirOrVvYYT+20IxE/9AD8V7mgA7hmTZ1
	qwHlqWEcIkUSzgRhxXsrWGj61Jl8w6i89CqZMFwvqaRGHJiKXpWaWcdFQh4E4HNQ5DWIw2IcsMM
	bxjrDV151uOu7usys7MHUwt0636wfhXMfhoJYMXeM4OGaErAAcKNaUpg+wf8oK78Vug2WfXvrH0
	w65gsAXTmqR/X3NNbRRUbyS
X-Received: by 2002:a05:6000:4027:b0:45e:a0ab:8bc9 with SMTP id
 ffacd0b85a97d-45ea3dead2amr2513624f8f.41.1779350445635;
        Thu, 21 May 2026 01:00:45 -0700 (PDT)
Received: from orome (p200300e41f291e00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f29:1e00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eaa7dd9e6sm857662f8f.16.2026.05.21.01.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:00:44 -0700 (PDT)
Date: Thu, 21 May 2026 10:00:41 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH 2/9] drm/nouveau: tegra: Explicitly specify PMC instance
 to use
Message-ID: <ag67dmFtSDBC6aPK@orome>
References: <20260506-pmc-v1-0-a6de5da7216b@nvidia.com>
 <20260506-pmc-v1-2-a6de5da7216b@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5oal4jl4ykfwr5c4"
Content-Disposition: inline
In-Reply-To: <20260506-pmc-v1-2-a6de5da7216b@nvidia.com>
X-MailFrom: thierry.reding@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: LQWNQVL4ZL7OPEEQ7DCNZDQGIKUFDRYX
X-Message-ID-Hash: LQWNQVL4ZL7OPEEQ7DCNZDQGIKUFDRYX
X-Mailman-Approved-At: Thu, 21 May 2026 15:20:54 +0000
CC: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/LQWNQVL4ZL7OPEEQ7DCNZDQGIKUFDRYX/>
Archived-At: <https://lore.freedesktop.org/ag67dmFtSDBC6aPK@orome/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>


--5oal4jl4ykfwr5c4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/9] drm/nouveau: tegra: Explicitly specify PMC instance
 to use
MIME-Version: 1.0

On Wed, May 06, 2026 at 03:41:53PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> Currently the kernel relies on a global variable to reference the PMC
> context. Use an explicit lookup for the PMC and pass that to the public
> PMC APIs.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h  | 2 ++
>  drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c | 9 ++++++++-
>  2 files changed, 10 insertions(+), 1 deletion(-)

Danilo, Lyude, Maarten,

would any of you mind giving an Acked-by so I can pick this up into the
Tegra tree with the rest of the series?

Thanks,
Thierry

--5oal4jl4ykfwr5c4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoOu6kACgkQ3SOs138+
s6FK8BAAgs0A7wFYJOVZxTTW6MNa4zXSjm64uXobpTYaWzKll6wOHDvn6C9dcp/v
MLtSLfP1p1SW/dO74lgYcFcwNaDIZdDsJZmNba+3Jf6PpFLkFdvor5IxklQDCq7p
CTff6BCXl8nTZkHm57wdzn9MMiduUUlKEc1foNpP34dKfb148QjLYdxi/2hFY/ap
VNo3Lr54eMkr3RXicgdgDHq5TXk2gKfSdy+Tve1QiUcemkc36olxR3tcgVSLxPJC
Q66EiKj9g3bjK+fEzB7hA/GeAQOfpuUIObaCdcASbPeCBTyZJY23WbYAF5XMMRDs
LjCs2r/E0EtZLwKY0NGBEZjwzWxF8PddUoqi3TngTTfv/EJ4qx3QzqvAf2DIVKsA
xJgxWd1rDD2HclOQ4GojKyO7CYLt4Xa8hWXPt4V7ajU03l8bOCvKOBNmg6hRD5jp
vHxVRmM/KOteKe7c9VJCMmxmo1oi9lE3e6BCB/VAGm7tzXHK9/43ug3tlh4A4Yk/
ad3eKm3kJxNa4FvJor3dadP6+6C0HUwZkk40TGgkYubsdPfR2kyGI3YZlr1J7cBI
jdRqcYoo/S+HmsreQgBpPXcTUhKqLsTU9/eqQ7V+9SItN6mvX8pPWmUaf+UexFht
1fkm9VtVD/H5bQ0QeOiRpJMXOe/ozNGH0hUKOEywfy7W8syQACc=
=YTdM
-----END PGP SIGNATURE-----

--5oal4jl4ykfwr5c4--
