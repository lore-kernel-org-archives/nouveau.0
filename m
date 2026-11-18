Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016FC606A320
	for <nouveau@archiver.kernel.org>; Wed, 18 Nov 2026 15:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=V9nauUfo
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 557B410FDA3;
	Wed, 18 Nov 2026 15:15:21 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E42A649526;
	Wed, 18 Nov 2026 14:55:26 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1795013726;
 b=HRudUVSXuiD3WeRsP40C+5EsnkGvvwdkbRc/QfPCuVOpX1QwvpWAIKwRNKFr3vGlhNpvF
 Ss3AsCuCXNS10oDQeiy1YNLuMX0NYBtUvKi4vSs8x7wa8OW+r5j7vACvuS6HO3wCxmVq8an
 YHU5sab2oKWwurJt0F/GpCXWWJ22BI74VZID30gVcBaiwPYb0zwxRKJBS1+4EzFQVHtxU1w
 bVZlZFtyyAu6FcGmI5KlykuoMKIOGeTR5hnNyRh7KZ7/OIPbteAgikexfnCuwPrVsHgjYqT
 5w60S5Q4jgEDLtzD01xzBWPFPzZKogsRU7mlQvIKGwBqBDlvyl4QQ7uO0X7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1795013726; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=NMyCaXf5z5oe2JRwa4VbW5PgsfLFNCTM5DQAiHr/6xY=;
 b=ztIWNzFRVIjgVbVC8la3jhuQ8dK/Dj1BI1xJugfc8iXIUhlRwXOXMb+NWQe2plUShzzOQ
 y+aDaVR11/1eaP0BDw8A5gVnh9lELEvQHiiTCdgDuDOvKNWlY035+u9Zcw9vGdpgbR9hZyf
 LTHkeiyQGJQMOmCpVxSupgeHSBXCkuBnAj1voF1p5zFQ4cGx8Pa5bd8zMeQxDU4aWQqzgxW
 fh79OeAQETxeSzsD8JOTCfY/eocgWrn+ePX8UyqjlQ/B3Jt+gSF6X7qWsQybFBkgWpvhdhE
 dgv4t6KK6TatNR1iBuTlQG1OhKlYwAusbPTP+KXvP5dm0Q6GR7JKP9h/4dpw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=baylibre.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=baylibre.com
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=baylibre.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=baylibre.com
 policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id AF2864668B
	for <nouveau@lists.freedesktop.org>; Wed, 18 Nov 2026 14:55:23 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D7A8710FD9E
	for <nouveau@lists.freedesktop.org>; Wed, 18 Nov 2026 15:15:12 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-490c3ae81d3so740471f8f.2
        for <nouveau@lists.freedesktop.org>;
 Wed, 18 Nov 2026 07:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795014911; x=1795619711;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NMyCaXf5z5oe2JRwa4VbW5PgsfLFNCTM5DQAiHr/6xY=;
        b=V9nauUfo84MBJzcidGGXiUX9CnOWKaYTHZ4VUxdMsddopfVovoUMcTAxoA6nylsb8X
         JydHm7KymsJ1QMxP5c1PzvsqVyRVAxqiYa81uIjAyypz2BhjJUKP88PIju1S0QzIVmOj
         3K/JARPrhcwAzs6pD0Asxh9WhFjyiiOF+h9weymIZnkK7PGwKVe/5rD+e2/0PJEPWTOM
         ineLC05a849W6WrT8NO+mTXiNTFATe2NkuPlzaN16ybTlKcQNa8r4rBO9EHV2ULYOhA/
         lPxMYeLFnAMe6WR5i+rNsYDnwmcwez3BA4JBgmPosH6PSbA+RTeIqrGeiu10sixTVFZT
         Irbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795014911; x=1795619711;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NMyCaXf5z5oe2JRwa4VbW5PgsfLFNCTM5DQAiHr/6xY=;
        b=MWK69Bs1Nw/7Eq33OznNgStc3oTRgq8/YGf3sF9T0UfgrHQDfewouwoMd0KDMypO6x
         L7gAkIJpsClZ92ga5WyI70nPi1mCd0Ew8DMOE7XWOUQ/gppH0UkBFUeIQQ52DnIg2Vwu
         0XN/routFqy6s0HM9n0ZA+zQtps/EyNJ+3OuRQtcOj59ZIlUt7ZQ/P0QH6wFwTl2XGB8
         pGVpK+cNNyUmWbFEoJV9oJ65jVm+iDpBIlUZYxI3I/CtK5ie/tWeYYmHKlUlD51bR/ME
         6wBAmfXs8ByycX1n2h6VlDHNZQ2k4D7GyS6TMW/1RVIFPa7FNDRlkMC7L6Nn9TKT6aX+
         RdMQ==
X-Forwarded-Encrypted: i=1;
 AL+hErEfaOS/tV5qLrOnTFIfISaFi4pD4fmpC6ZU7luttuyavubowWokQOeBUi9xtFzsQALXN9XqjpVn@lists.freedesktop.org
X-Gm-Message-State: APuU4Z93mRyiPasTst4N5Tbui0HmES1dPdxsxSqLkf/BBRPaSEJDHHso
	626OqsrRLvqc9JGwUSLBiGAPWVU4zK0WW+/gtDbr3i9cpk3guudro7dMG+7LCw2WnNk=
X-Gm-Gg: AZFdTZfsCxrp6ySD0PCaom17hp4Rbu+lroXb3UB+WoIENMUeEJ5nO/kgPxPKqbJ9dt5
	BDCUevmOOoDlSeF710t/KnQwkSbuNAjP+VKYUFgQDKLf7KLNfMqdrctNZN77P/t2SP+A7r5vzBB
	EOl6Hg9Uy9GJI/6llbqqBEoDCnTsohuSVdNKbibQQm+KoUL9tv5NKVsvDVpFZvJdmOpeYi8wMIV
	f+/pNSYAlcKaMuSxC3Op1+cUUaZLvxUMm3qjDYAHmMdG08DVUYHKR4KfFJrG6VjY8KmpVbPdPdb
	svAn2LF4bSFS9b0hWqlzVpvlOqNxkhziLFrf9eFVuNzalFX8OfUaMbNhPYvmk9vbahFfEVBKXAA
	TlSTcsVbPGj8qLoV88HGonBq6DPx+SfoKKRQ8JZqI4EfjBpsQ27P/babT3rSl/KJEa/iJ9C6VWP
	C2r8PE7h1P7nn8OWYmtLOeGZwhpronCvlNb7B3tz5C+ly7GQsk4q7roiySzQULzFH1yA8xI0fD2
	yt+2KN4gmt0hAa1d3R2IXcOWD6e8CbwDpbEEMjiWIJK3FXWwtkbIvituHjfRrzeVd/r2931MIB0
	pnnfCtpsjinqNLuAH5ckFglKHe0kOEWw19d9EDcgzQHMBCP+d02izRUY/+lD76TZLIkFRGd6To+
	d+pjHQNygNC0nlUj2
X-Received: by 2002:a05:6000:46c5:b0:48e:6357:c76d with SMTP id
 ffacd0b85a97d-4a63d2cf09cmr4070440f8f.21.1795014910678;
        Wed, 18 Nov 2026 07:15:10 -0800 (PST)
Received: from localhost
 (p200300f65f19a904f642bba75325d003.dip0.t-ipconnect.de.
 [2003:f6:5f19:a904:f642:bba7:5325:d003])
        by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-4a6575a5c28sm5424703f8f.59.2026.11.18.07.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:15:09 -0800 (PST)
Date: Wed, 18 Nov 2026 16:15:08 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v3 0/2] drm: Use named initializers for arrays of
 i2c_device_data
Message-ID: <av3AMIcRXCy7PxOQ@monoceros>
References: <cover.1794386771.git.u.kleine-koenig@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yqlhfm52kcn3z6dt"
Content-Disposition: inline
In-Reply-To: <cover.1794386771.git.u.kleine-koenig@baylibre.com>
Message-ID-Hash: H6HUB75IWJOU6ZVLPM7FAWRH5O6TVAUA
X-Message-ID-Hash: H6HUB75IWJOU6ZVLPM7FAWRH5O6TVAUA
X-MailFrom: ukleinek@baylibre.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/H6HUB75IWJOU6ZVLPM7FAWRH5O6TVAUA/>
Archived-At: <https://lore.freedesktop.org/av3AMIcRXCy7PxOQ@monoceros/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--yqlhfm52kcn3z6dt
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 0/2] drm: Use named initializers for arrays of
 i2c_device_data
MIME-Version: 1.0

Hello,

On Wed, Nov 11, 2026 at 09:49:43AM +0100, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> v2 is available at
> https://lore.kernel.org/cover.1784545092.git.u.kleine-koenig@baylibre.com.
> The first patch of the v2 series was applied, so this is a resend of the
> two remaining patches with the collected tags added and (trivially)
> rebased to v7.4-rc1.

This series is superseded by
https://lore.kernel.org/dri-devel/cover.1795002467.git.ukleinek@kernel.org/
It contains the first patch as #2 and the second as #5. (I only noticed
now, sorry.)

Best regards
Uwe

--yqlhfm52kcn3z6dt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr9wPAACgkQj4D7WH0S
/k4AhAgAoL9dnbHgbbj8R0XrasdtXwSZVvDr8O01kZzWsXqYjwvs7LdZui2+YlsN
SkiOdu3/FT2+Gh6i0J3OqqX12WBliJIgrYx6zY7BFQeKrYTM1WLkGQuyp42IZp+A
ppLIuB/v0oaI/GNGEBkaNCIHFN9oOkIBac3jJngETehLC2ryvpWGee6tLhONicwh
whuVxHfT5tP7ghp05rH3XP2KnElh326S2eO0KOpiJkADAWmzqNOCkN7wmReFW+Vx
SPYjcuT+4QJBUm8Qv6SuMDL+QlPoOjBZcw6TgIAxWU3sCjR57xcSiCDTbldaSeJg
4sepDhgw5sq6F2F7Dq4/sEiPzbBvDw==
=1snT
-----END PGP SIGNATURE-----

--yqlhfm52kcn3z6dt--
