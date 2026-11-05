Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C7C606A326
	for <nouveau@archiver.kernel.org>; Thu,  5 Nov 2026 09:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bFAS48f0
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 18D6F11228F;
	Thu,  5 Nov 2026 09:15:21 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id DB00642407;
	Thu,  5 Nov 2026 08:55:55 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793868955;
 b=E2/QD4UkTCHNouRxXGooSxf6jvzvxDEpsVYBcFVNxosL1PtyLQLp4/t+NYKC+wRAzuytO
 MvIQFVst5tyXH/ir801Ik4XFnZWhXjTLamS1rgxJY00CuUA2xxCwuIbQkCVa2dkKPHtz1xc
 EiRFB5Z2Q75Z4bPHRLLd6c3xQME0GcP5L4H6oO/uIdVAbr3n4OnVTCNbDpLPr8pQpQglWdM
 ooT5jzKzGjTUOmvMaA4Wtceo9HuPQK9N10YS/Ew3xAsG5LUz/SFWYlN24dYoPYsVzC1Albs
 l+v/b/KTzKu6p9UGlTpVZsaZ2qu3qAYsP6J3ndmyPzsupH9NOQ6NmcbF9CkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793868955; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=yuu8MRbvZ8Q99gVGDEWGPtvGQgcdEiYL3ohtAsA9Mfg=;
 b=rWXDr9Tn8IV5qnKT4wlRZ16j1rGmFzEBsSfKyk2FeNEnkBgn/LJHTxeQYZNAzPymkuQKa
 Qo+9w6c73rxhoncYw9AdU6MwGKkeQiJe1zIFFos7qSJJt3RtuR4sVZdvYekynR44QpqYAZl
 3BGbsICc48ZR4gHWO393eWorYt3Zx4Q4IMFTgYeUlNZjAdEqfHCDJeXG2p7DBcWpudkfwwe
 riBccDdrsYcbxcHA9v9UCHbZbS+VgaDB3OvJFh5iuGJrNyneA/WpomkqBlNmJk0bmvy/TLN
 K3QIQq/305OsULUhsNfg9rLPKHqVA8k/hktFRJV/D6iBjEwldcBjb7ZYdc7w==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 5E85A40699
	for <nouveau@lists.freedesktop.org>; Thu,  5 Nov 2026 08:55:53 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3212411225E;
	Thu,  5 Nov 2026 09:15:13 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 30E8860F3E;
	Thu,  5 Nov 2026 09:15:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36B561F000C1;
	Thu,  5 Nov 2026 09:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793870111;
	bh=yuu8MRbvZ8Q99gVGDEWGPtvGQgcdEiYL3ohtAsA9Mfg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bFAS48f0dLcspAEXkjkArw9f5g1sLZat7q01f+HKggEbmSs8nuly01Er89M9cFC+E
	 aJelUDSseJymE+2CsLiDv70w3W0f6o/p8FxgDHcsOPwgv1/JMp5POhaS6WYnvYb7K8
	 zUzkNI/hkDRyloSNnZbNr8XotLbG+h1F+jOL0Hkb0Avr9U7fYBRpfR9C0mcxiQBR3s
	 vMTD9J5x5SQw0X/qL4Os/hOqj2LHOa1MTSUUKJIb4NDus9wXA/2kpJ9BHnn9SLC4gw
	 1auncQlq+pWnfmu6Sf7Gd8Hf0QutCtTy+KqQdynzeHMD3cDRsYlcu6hbTs5fM0MRzR
	 2QGNBnbRrZdUQ==
Date: Thu, 5 Nov 2026 10:15:08 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v3 00/37] drm/connector: Convert all drivers to
 atomic_create_state and remove reset
Message-ID: <auxJBtexUg6oHcs9@houat>
References: 
 <20261030-drm-no-more-connector-reset-v3-0-30e71d92c327@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="2zvnwa2sqytkzb4j"
Content-Disposition: inline
In-Reply-To: 
 <20261030-drm-no-more-connector-reset-v3-0-30e71d92c327@kernel.org>
Message-ID-Hash: O2XKRUOVVYJNPXJ2IO363BZOCQZIOMVE
X-Message-ID-Hash: O2XKRUOVVYJNPXJ2IO363BZOCQZIOMVE
X-MailFrom: mripard@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 Russell King <linux@armlinux.org.uk>, Alim Akhtar <alim.akhtar@samsung.com>,
 Inki Dae <inki.dae@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Alison Wang <alison.wang@nxp.com>, Stefan Agner <stefan@agner.ch>,
 Huacai Chen <chenhuacai@kernel.org>, Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 Jianmin Lv <lvjianmin@loongson.cn>, Mingcong Bai <jeffbai@aosc.io>,
 Qianhai Wu <wuqianhai@loongson.cn>, Xi Ruoyao <xry111@xry111.site>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-renesas-soc@vger.kernel.org,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@kernel.org>, linux-tegra@vger.kernel.org,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Alex Lanzano <lanzano.alex@gmail.com>, Chia-I Wu <olvaffe@gmail.com>,
 David Airlie <airlied@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 virtualization@lists.linux.dev, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/O2XKRUOVVYJNPXJ2IO363BZOCQZIOMVE/>
Archived-At: <https://lore.freedesktop.org/auxJBtexUg6oHcs9@houat/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--2zvnwa2sqytkzb4j
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 00/37] drm/connector: Convert all drivers to
 atomic_create_state and remove reset
MIME-Version: 1.0

On Fri, Oct 30, 2026 at 04:13:30PM +0100, Maxime Ripard wrote:
> This is a follow-up to the plane and CRTC reset removal series, and
> part of a larger effort to remove the reset hook from all KMS objects.
>=20
> The connector reset hook is overloaded: it is called both at probe
> time to create the initial software state and during suspend/resume to
> reset hardware and software state. These two roles have different
> requirements, and the reset hook is not fallible, making error
> handling difficult for the initial state allocation path.
>=20
> While reset has the semantics to reset both the software and hardware
> state, the vast majority of implementations and all the helpers only
> reset the software state, making them equivalent to
> atomic_create_state in practice. The atomic_create_state hook makes
> this explicit: it only allocates and initializes a pristine state
> without any side effect, and returns the state pointer or an ERR_PTR
> on failure.
>=20
> This series converts all connector drivers tree-wide from the reset hook
> to atomic_create_state, then removes the reset hook from struct
> drm_connector_funcs entirely. The conversions were done using a
> combination of Coccinelle semantic patches, mechanical one-line
> replacements and manual adjustments.
>=20
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Applied to drm-misc-next

Maxime

--2zvnwa2sqytkzb4j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCauxJHAAKCRAnX84Zoj2+
dpi6AYDFcyxVth1IfzYJl7Mk/wdU/UrwZChOoRG3vJ2c4jm3YXPwmaZCDBG4hPm/
E3dp1WQBf2Htv+GDvQkXS9avpT+uRjkpFRqowDqfaE0gXWHKwBFuo13bOFi12DLC
XPBNQCk6+w==
=O+mF
-----END PGP SIGNATURE-----

--2zvnwa2sqytkzb4j--
