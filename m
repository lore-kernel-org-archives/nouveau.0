Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE4CCD98F2
	for <nouveau@archiver.kernel.org>; Mon, 22 Jun 2026 16:15:49 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 18D8810E79F;
	Mon, 22 Jun 2026 16:15:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=baylibre.com header.i=@baylibre.com header.b="E5OBftOJ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7CA6846C86;
	Mon, 22 Jun 2026 16:01:24 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782144084;
 b=xgX+GoLVu4Bo4NcQafiVzqfM5H3/U7822mHhS24XbOD0Rp0wVGXU2S8EK8EXSPtPfIcYR
 3GpmBDtaL7/0XlviSTZv7JJRn1N8ExE9AS0aam+msjr0SYtxVBbXa+03kj9LWzwAgbTMfAb
 4ty5MuncgDIwUvZoWbpVAhPLkhueOLu0IqLPurLEGBWfrBj9E5alKlAZkpAAH7N7UjbJk3c
 knAhe4U6/tYRlZ5EA9DhdsNvBtrdiweJ5mo0VOQqTIj6P43i6givPTi6sAD5/UeyqNDwpBH
 bFri9CrZJWn4eOstGHTZcUhnw6lebfNn1oCTL0BLJJnfmoS877NvPByeiZGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782144084; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=zRncht//PInKMEuS4sg5fyC0BItulGq5pVMOQvZq4OQ=;
 b=EPnL0GrvizymIrMWvUxT1q6bXgiStdc9H5SkmXlA6pvqznHGjGizf5Hs0OJeSCZt9tXRk
 tfYIkelxmjlCAvbwsbiaRMO0ELtGhEk1IW/lHTEACpmnM8iCdkwsPkSKAHjRVHvTO3wctmI
 r5BEhBDc1LiN/Nt5Rblgv8/NCQ3OdoVFTGDrfzzQV0DNMJM9yCovPIfp27AnUuPtqDSXYj9
 IKt/W6iOdDbQlaaKSGeQayJuxOkA+7US90/NLepbnmRSJieeubkMiSgtDjSdQPgdB9JPD9p
 9M8Uz5rRMNtQ0sVMBbtjv5W8YZBYZoX3dGfz58qZxGFAjWtAkFWOzsfOiwSw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=baylibre.com;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=baylibre.com;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 8E52446BC1
	for <nouveau@lists.freedesktop.org>; Mon, 22 Jun 2026 16:01:21 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 55B5910E776
	for <nouveau@lists.freedesktop.org>; Mon, 22 Jun 2026 16:15:45 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-491609cdd8fso28440945e9.2
        for <nouveau@lists.freedesktop.org>;
 Mon, 22 Jun 2026 09:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782144943; x=1782749743;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zRncht//PInKMEuS4sg5fyC0BItulGq5pVMOQvZq4OQ=;
        b=E5OBftOJeqAEtY+9eMOCZM8bNobGr8f+uaS/Sy+xcMFNLMi9vpWsYL9VOqS/OSgJUc
         HM0TvReTjoamqb6O85Ic+pIrRvvQtmnfx+hrnmxlxx22T5M8ONvBJLX90m8LF8hGScAw
         DpWojL+DVXc6eXb/lbklMGye882lsSXQID82h/byL1iHNuOSdH1lgHD92xcExO9nXzMK
         P0D43qSqO+9JCeWe6V/gG98DpxctNB3l4EmSLjUN5T0Um23RKrfmVMFPZ3c5+FIcz29V
         Fzh6CPhyvdszGDjtlX+BPsFeTKOZTSomzsS8sndkKwTDSx4nXEUR6nEgrkHwJYtD7Rcc
         g6CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782144943; x=1782749743;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zRncht//PInKMEuS4sg5fyC0BItulGq5pVMOQvZq4OQ=;
        b=aP2/OSHQ0Oaku2pIVJh3HIYl2MYbvyRPMb8fTny03Eqqpqevr7MGQfxwxKa+luNuXE
         vBgZbea2cYs6ymgAwgfRG382Fjv2orsk4PdpYCwYoR6lBLIFpwVx1JJHHG9t+MpsWtlV
         FVTpkm8XhJoJWeG23Cbe+pcIf8boJvZpNGPg89Qe0lpfMGn8cduekVHCgEt3Zieom2D2
         9X1tx3u9YcgzWBtZhPJ42z9/LOC7H6T+0msxXy/ovW8HMztJKKK0uRVtn36G74svO2i1
         fCsWAqLD05oqf2YCHq8tQSwaQxekFBkBkg4GtmpptDw4q9Jp0nlvv21dqOvBOibdghIm
         P9Sw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+0yx7bNJEvRUMN7q/Rb2vGUo3Cpb9itE+unjxuktq30Q7YtpXrmovpWwKzwJ7DzJIMoHbUvBVO@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1bTtbjvQ9/FX5l/xPw1CLiP6Anb2axch5wjqmamR4IrDQDdBn
	tTUbC7zeProvnxS198VWcGC1i4Anl6dgMP117HDISIOAtiktROuuiuhZ/aUHGgSX+5k=
X-Gm-Gg: AfdE7clm4ypGiJHPQgA/scinHZVeHNCj1sIjPQV5qEoiykRMpffwdxZHDSVvPrjrtS9
	yZJRwBzyq6Jr8i7qYwJIlNqdsFwVi+gtXiepIKYKvXkem767076zt0/Cz63ee8ymKHiDzPodd65
	Whn/ZWAF+Xi0pWJ8Z5xcM7TJETjkvRfrNWLhfQdJp208EJrHSIbUiqcovRMVEbjLgo3ZRc+Qx1r
	kakuRhFNsVFZplUF1V8QXTwyZJFT96yEAiimuL+ipFkzDnJvB4WEiQZiqyigccED6SQ0YgpKQid
	/saSROVzod+5wJWTTOaJpNF2XD/qI2hSExS7Dqp74p4bZ3z21XGskW1sTPHtvjR33W8sCA+NThr
	AzzpSRbYMXdcpaFN77dNn1UdLvZynA2Brh4yofQdmCzaBHrlNlgf6f8tzutgNCLdGS89o/ifWQ/
	8REt/e78w7HkiPQ6T72Mgu2SeNcR3bXAJ/zy9ewL44oVNBUtelOco/a7m4VhxVkNVFJfuB4RX7o
	M8=
X-Received: by 2002:a05:600c:628f:b0:490:bd66:e522 with SMTP id
 5b1f17b1804b1-49240e72434mr246625255e9.29.1782144943295;
        Mon, 22 Jun 2026 09:15:43 -0700 (PDT)
Received: from localhost
 (p200300f65f47db040ad79c14d83edb3c.dip0.t-ipconnect.de.
 [2003:f6:5f47:db04:ad7:9c14:d83e:db3c])
        by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-46667221da1sm27127062f8f.36.2026.06.22.09.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 09:15:41 -0700 (PDT)
Date: Mon, 22 Jun 2026 18:15:41 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH] drm: Use named initializers for arrays of i2c_device_data
Message-ID: <ajlfiTxD8TwCu_1l@monoceros>
References: <20260518100401.631351-2-u.kleine-koenig@baylibre.com>
 <aimbWuKkPZdKuO5f@monoceros>
 <DJFNU4L6YNVS.2OXF28HEUNZO3@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y646ypfl4vteiwwb"
Content-Disposition: inline
In-Reply-To: <DJFNU4L6YNVS.2OXF28HEUNZO3@bootlin.com>
Message-ID-Hash: 4RS4LJ6TVC423QOG3YAWUYDURNVZVB3W
X-Message-ID-Hash: 4RS4LJ6TVC423QOG3YAWUYDURNVZVB3W
X-MailFrom: ukleinek@baylibre.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jagan Teki <jagan@amarulasolutions.com>, Liu Ying <victor.liu@nxp.com>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>,
 Russell King <linux@armlinux.org.uk>,
 Douglas Anderson <dianders@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 Andy Yan <andy.yan@rock-chips.com>, Xin Ji <xji@analogixsemi.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Fei Shao <fshao@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4RS4LJ6TVC423QOG3YAWUYDURNVZVB3W/>
Archived-At: <https://lore.freedesktop.org/ajlfiTxD8TwCu_1l@monoceros/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>


--y646ypfl4vteiwwb
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm: Use named initializers for arrays of i2c_device_data
MIME-Version: 1.0

Hello Luca,

On Mon, Jun 22, 2026 at 04:50:06PM +0200, Luca Ceresoli wrote:
> On Wed Jun 10, 2026 at 7:15 PM CEST, Uwe Kleine-K=F6nig (The Capable Hub)=
 wrote:
> > On Mon, May 18, 2026 at 12:04:01PM +0200, Uwe Kleine-K=F6nig (The Capab=
le Hub) wrote:
> >> While being less compact, using named initializers allows to more easi=
ly
> >> see which members of the structs are assigned which value without havi=
ng
> >> to lookup the declaration of the struct. And it's also more robust
> >> against changes to the struct definition.
> >>
> >> The mentioned robustness is relevant for a planned change to struct
> >> i2c_device_id that replaces .driver_data by an anonymous union.
> >>
> >> While touching all these arrays, unify usage of whitespace in the list
> >> terminator and drop trailing commas there.
> >>
> >> This patch doesn't modify the compiled arrays, only their representati=
on
> >> in source form benefits. The former was confirmed with x86 and arm64
> >> builds.
> >>
> >> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>
> >
> > who feels responsible to pick up this patch?
>=20
> The affected files are mostly in drm-misc so I could apply it, but I think
> we'd need an ack from files belonging lsewhere (should be just nouveau and
> sitronix at quick glance).
>=20
> >> base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
> >> prerequisite-patch-id: 7779c63f16ef6f7247cdb71c89e66b27e299eb74
> >> prerequisite-patch-id: 6f920b6f8c31dc0ad1689200c37680755c20ce8b
> ...
> >> prerequisite-patch-id: 915b7a2276c5a38944107c84bb282271d0bf28f4
> >> prerequisite-patch-id: 76d499a624150588f7ef07dc087e70eca6f33419
> >
> > FTR: These are bogous, there are no dependencies, I just wasn't
> > attentive enough to drop these lines.
>=20
> And 'b4 shazam' messes up because of these lines.
>=20
> Overall I think it's better if you resend after splitting by tree, and
> removing the prerequisite-patch-id lines. You can keep my R-by on all the
> patches if you just split them without further changes.

Thanks for considering to merge, will rework as suggested.

Best regards
Uwe

--y646ypfl4vteiwwb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmo5X6oACgkQj4D7WH0S
/k7aZAgAgxwaByetfG1d2X9atyXsHeGlCD55Pa/o1ew5duFQnVUaJvcNEbVOSZz+
v0V/9dVyvNdjtGDK5wSDDEBle2RShIvlf03cFHzxv5+2JujQYFFyL9KdAfPzgD4F
u4JUNJ2tRoP8FKGjRrXfssn1nYDjF7CNf0uO7gBiA+gLqxixduOncPUKGDZ6aFyr
vM4ndnOVMHZODdxv5jMZmpOfHDccoTViPQTaIo5B+/z7P36XleQvKA5rXc5lZDOK
/rK3pfF/ns3LNa8qnfBbE415HX4DQT5KjLfETJjhxDUMrwQWZrcjGXqQuNscdIjY
MXDXgyQ87eH6Os6E/yY2h51+U5vUlw==
=YE6V
-----END PGP SIGNATURE-----

--y646ypfl4vteiwwb--
