Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A68606A320
	for <nouveau@archiver.kernel.org>; Wed, 18 Nov 2026 14:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=I2c9NUvq
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AD75110FCC7;
	Wed, 18 Nov 2026 14:06:54 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6AD394951B;
	Wed, 18 Nov 2026 13:47:00 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1795009620;
 b=XUP78lJgh9G27Mb+eh5rkwFnqF9JShkEMDGjxpGEZ1SheMlownEEny7H1SKB7ZYobXk2N
 ZJKKR2goxHFr1zXTCB6hF61oy1ouQp0JuIU2HZMRuEI+l72qBiCSEDiC/+mjHPdT8+Xqcz4
 3xZVnuQIAJ2mdHzAQtfRWtwjEY1lcYB1wBhXGPhIn+CV6NMmFFh2iSK9i8DbNYQ7kQAtRoA
 xMUqsGhY+RTot7J3DnxG1MmR/iWneG92wcOy2diDeOZ2tScq6gnR8aabTiRPlNYZ2AbvAun
 jcxrTVzOc8r3HtyhXxkHYBV4CRS6foho9Sj1IQNt0q3tZicFmug1BkaNbiBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1795009620; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=O8kUxWwNMGGKdJF+2JBGIvhWCx8VFS9Gq0fs2XPEP3c=;
 b=OLYOoJSII5CdqtG2UgLrW/qjJCN/cxS++DEy/FIez32VFr4arjVGdfQJqQhbmSLDo+Sl6
 KU8sV9FpqqG8GDvfaLdZzMH9fSq46pDKNmw6HfaAehS4MspIUXCydhNzk/mYuVf/LINH7dk
 klig49t4dxFhDCo4qsfhz9JAbNdh6DjD2Mw8dRVqtMKc0a5TXrWWGWlkX3QEcLvr5YTcv73
 ciQwsA9WIbpBWOCZXrgWbkqYc/r6dc0vbgXiPMIEjRIzUhNXiFHi4cJlPCiuQqm5IeELYuc
 5iKycTYX1gSGVDQo3JgugeO2F/F4lURHfWNZDg/L5DuSpW5AWoUHJlQ1K1lw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C9C89494A2
	for <nouveau@lists.freedesktop.org>; Wed, 18 Nov 2026 13:46:56 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E366710EC10
	for <nouveau@lists.freedesktop.org>; Wed, 18 Nov 2026 14:06:45 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4bb68c197c7so14096835e9.1
        for <nouveau@lists.freedesktop.org>;
 Wed, 18 Nov 2026 06:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795010804; x=1795615604;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O8kUxWwNMGGKdJF+2JBGIvhWCx8VFS9Gq0fs2XPEP3c=;
        b=I2c9NUvq+C5FWl6oDgcyVl2svEUbTiDltKnvnXOJUTtS5VF8lE4PF4TXnpIfmKhhLc
         FePg2dHSUPMK1ZfSD2kd42QnFIq0u0XYarUdIiwFma6iJF4p7lt1no6qF0A1CODDLXrH
         VCfGF4h8mlr2vkDNeRdryTV2j8W245lGCJlr+4ZCDUaolWRTZLANpx1Gt9a8lzqbVeWx
         oNgmr4XPecY3ySeavDFfDyMc8mKcP050Q3WCxdLiklx2DRMGDHYrxxr14kI2XXmCxxfs
         92bwsUeDezBQsgUGfwY8TR+fvQ/Hn87fwEIk9OWrAdPaTjSc2o8MwjvEo3nbnm0DJ0w6
         ZXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795010804; x=1795615604;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O8kUxWwNMGGKdJF+2JBGIvhWCx8VFS9Gq0fs2XPEP3c=;
        b=NDlnC9FEJ0kA57AAdqdGbND07L+F2Ft86jYonqBRkmXyXvGG0uZ9qwodmHEuBH1bIC
         snwEYxiOn+ilsBAHZgVSLwIGp1HgrwyETLAxmzISuYET8mxuapBFgTPeOxd49sqeI6vk
         1Rxt3ZjAmSQmRx0LQLegIj6QGsWClc3V6YseCuammCupPNoV7UgtZf3ys/c8BwAKk4OU
         1t7+QxjYpAdTUrRbIPA59NrdaQ5u+KUFMKaCQt6G9pgJ8oniQ09nIBiu6GAWHY0pfsEB
         1NsKLaVImZLLTR3SFbQWjWLZ88oY6YGtpCDeKaJZvb8p405FGtU50672H2Aaboym3a4P
         p87A==
X-Forwarded-Encrypted: i=1;
 AL+hErFRmlgpDJR7VYWUTBLZhoprJbBpbZORLfNGZAVY3D4zU5idKvGLKhBKiN1FEeEvzagDbh77Zswn@lists.freedesktop.org
X-Gm-Message-State: APuU4Z/VZX9x5Bv9AzB5Z+1b70H5JrTTs9kz3cKEbKEZXLqeg/4Vxi+o
	eoJShh96lOSZ+kGxqjAGUCXcLaofjcW/IoG37y5AZnUdkkBKCqdMcw3VWYrVZhladSI=
X-Gm-Gg: AYBFou3WN+kyDw2PHTslHKeGV+NxoorS+dpXcmZ5A4NDT9epOqeDX2uvK1QiXFrXN5q
	SpVZDJibnupwl28M3rbl2aPWrG8lqXlv8vd5Of5S/Smw0bA1HHXZUJOIcbEK41bb7NOliFlq61K
	5oPSZP7HqBmlCUcBOVt2FBlNKMqXuGbhgNadUSGFln2HsyTTUfPwUKdaLfjQRdKaNFiCyIStt2/
	w+FmBW8h69aLygGoiDbyKc7DOfOGFwP8KA3uRGkeeoFnd0l2v/Pv/b0t9JYXr0O/Z1nHtHKIYgQ
	ux9bMOTK140KAUJJ4lPXW99MEAIUGbeqB3+rvlNmB1DpEftGzkxMcnRxFQG2N1kc+GHxBs2oK92
	uSXjojc4w2KHs4O46rpu5Td9UwkcYInhV2cLVGcTt6ffbKAzC21Z7yDgvFOFiVpm0xnsWCfrGk6
	8yvf9x1em27T6d/ZsEcVFgAW3SSOkSyL0yPx49mVzsgVLb1BNMA//h5yZPs6B/4q1vkvjboRJQ6
	DsMDLn23jnNTswa4L7ojSwdEcnO1hxhIJrtqMssrnR17AvmYVbiO2xXlfv/qdbdacPtyPa0fj8l
	3oTTey4B0PHuwwCh4mgOLzecnGe4PDw1aMU=
X-Received: by 2002:a05:600c:3509:b0:4bb:68b9:f610 with SMTP id
 5b1f17b1804b1-4bb7da03954mr52120315e9.9.1795010803953;
        Wed, 18 Nov 2026 06:06:43 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4bb7d256f64sm61534715e9.1.2026.11.18.06.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:06:43 -0800 (PST)
Date: Wed, 18 Nov 2026 15:06:41 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v1 9/9] drm: Unify coding style for *_device_id arrays
Message-ID: <av2rKJQ0AKU9CFZI@monoceros>
References: <cover.1795002467.git.ukleinek@kernel.org>
 <a2d5ce256b8ec150de4a6494c177b19693a33222.1795002467.git.ukleinek@kernel.org>
 <7692c160e418e7ad0528739fcc879b11fbac8ab0@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5c6ped4sw6nigwko"
Content-Disposition: inline
In-Reply-To: <7692c160e418e7ad0528739fcc879b11fbac8ab0@intel.com>
Message-ID-Hash: 5UQ6PJP2EOJ76UXS27PB7N6W4KXRUJSM
X-Message-ID-Hash: 5UQ6PJP2EOJ76UXS27PB7N6W4KXRUJSM
X-MailFrom: ukleinek@baylibre.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Simona Vetter <simona@ffwll.ch>, Sasha Finkelstein <k@chaosmail.tech>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-riscv@lists.infradead.org,
 etnaviv@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 imagination@lists.freedesktop.org, linux-mips@vger.kernel.org,
 lima@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5UQ6PJP2EOJ76UXS27PB7N6W4KXRUJSM/>
Archived-At: <https://lore.freedesktop.org/av2rKJQ0AKU9CFZI@monoceros/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--5c6ped4sw6nigwko
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 9/9] drm: Unify coding style for *_device_id arrays
MIME-Version: 1.0

Hello Jani,

On Wed, Nov 18, 2026 at 03:27:40PM +0200, Jani Nikula wrote:
> > [...]
> >  drivers/gpu/ipu-v3/ipu-common.c               |   8 +-
> >  drivers/gpu/ipu-v3/ipu-pre.c                  |   4 +-
> >  drivers/gpu/ipu-v3/ipu-prg.c                  |   4 +-
> >  254 files changed, 1155 insertions(+), 940 deletions(-)
>=20
> How do you expect a patch of this size be merged?

Using b4 am :-) Honestly, in the cover letter I wrote about an immutable
branch and offered to rebase to 7.4-rc1. When trying to apply this
series on top ov 7.4-rc1 there are only 6 conflicts (1x modify/delete
and 5x content); these are all not so hard to resolve (and even dropping
the respective hunks (i.e. resolving using `git checkout HEAD`) is fine
for me.)

> > diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i91=
5_pci.c
> > index 84a7dc6ab5db..faceb3de4fa3 100644
> > --- a/drivers/gpu/drm/i915/i915_pci.c
> > +++ b/drivers/gpu/drm/i915/i915_pci.c
> > @@ -870,7 +870,7 @@ static const struct pci_device_id pciidlist[] =3D {
> >  	INTEL_ATS_M_IDS(INTEL_VGA_DEVICE, &ats_m_info),
> >  	INTEL_ARL_IDS(INTEL_VGA_DEVICE, &mtl_info),
> >  	INTEL_MTL_IDS(INTEL_VGA_DEVICE, &mtl_info),
> > -	{}
> > +	{ }
>=20
> Personally, I would *always* use {} instead of { }, and would rather not
> change.
>=20
> Across the tree, {} is slightly more common than { }. IMO changing them
> is pointless churn.

It depends on how you count. My statistic looks as follows (on top of
next-20261117):

	$ git grep -l device_id | xargs -n 1 perl -g -n -e 'print "$1\n" if m/devi=
ce_id\s*[a-zA-Z_0-9]*\[\]\s*=3D\s*{(?:\s*{[^}]*},\s*({\s*}))/' | sort | uni=
q -c
	      2 	}
	      2 {
	      6 {  }
	   2598 { }
	   1262 {}

So over all *_device_id { } is more common by a factor of > 2. This
series fixes one {  } and reduces the number of {} by 37. For only
pci_device_id it's:

	$ git grep -l pci_device_id | xargs -n 1 perl -g -n -e 'print "$1\n" if m/=
pci_device_id\s*[a-zA-Z_0-9]*\[\]\s*=3D\s*{(?:\s*{[^}]*},\s*({\s*}))/' | so=
rt | uniq -c
	    159 { }
	     32 {}

Without the context of an array initializer there are many empty
code blocks (function bodys or `do {} while (0)`), empty dt nodes, and
{} in Rust code, which IMHO have to be considered off-topic for this
statistic.

Best regards
Uwe

--5c6ped4sw6nigwko
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr9sOcACgkQj4D7WH0S
/k4vggf+PQfM4MkbLgaQRCdXRWWsc4/Fa0tTMBQAl4gjx2p5NE/N7TDUO571o3+N
oWcelzY5O1uRcc2qHZVnu3vAxFqzk4YHfGjsbGHsxQAibxnIFW7ttYTzt0w5a9NH
v65V6+sebCdwLrPVE5ilcqzFFSgmnv1wTNm2vCEUxdKGacifySaGRmg4+ax+fLb1
CL+RS7fM2EkQxG1k4iDEPv1Onrm9S4DtwTts0wxkK780rWYD9FoSLjHyX/x21Y8x
SZKaXeNZlxtHJpQLq8ub8AL/t6k82nC020wYZOUbUmvPyqxhNoUuuS0/RVlz9xT6
kXiliIwWzcMtAKt4ik8nbTRO5JERhQ==
=0alU
-----END PGP SIGNATURE-----

--5c6ped4sw6nigwko--
