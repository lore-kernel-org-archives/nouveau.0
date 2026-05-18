Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF847CD5BAB
	for <nouveau@archiver.kernel.org>; Tue, 19 May 2026 14:47:10 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6A22510ED45;
	Tue, 19 May 2026 14:47:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="br9gs2ij";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 63E6645814;
	Tue, 19 May 2026 14:34:01 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1779201241;
 b=ovRYWF62/6Po6AwLHi7y+irFiTS5V5ctgYuK/Vo1rTZ1HqzyrOyIM8my6ZP59ukoIq3Iw
 ui/teKzmeMiRmvze80UZf9OnH8ehE2IQ1mhkh17HThBFVrNbST/P4F2MiyY17sTUx5ZYGmd
 4pJ4dnFz7hg3y3UoNs8ENoPjjFnGxnfKx0XwmaZHqrmMBW4W6rOKuXOOV+ZTFJU9UuDRt6j
 rp+OQhfw5B/WR4BnHISB3wPLes7hK+R0lKQ57UUbJYEhiYpCnvNTJvs/FT97iq5nSyjHN4f
 DcmP+vYjlD8i5IUSiQwW18+/80VdI+H9I5S3oFdjcc8LMBKMY9ExEXN0Lx5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1779201241; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=+GUakJQgQQZFR4eLPRoEYE8uJGTNPLGY7yG6NqQt4F0=;
 b=fsxX3tjDBkJh5LxviYnMYgzOWMmyJK7Byz5vkbwiPkcbG+Imy/vYbTBnBWaejPzDHIwPj
 nOzmOBsPWqEuegWjJj7h96pGYf1b6aEetFDR2cUj4A84IR591vgspiwvanM1ZUttu/tKXFm
 IED4MBNUzzFQxgN3mWC434oubmj0jOCiEo1p2NmrgC0iOpxkfmvfgO/bZHnawzlfiRnDzM5
 HFeqV5cTtZiIo6Zdskir8vfG1grGfqZGS5TdYf8jeF5LSrJqY/rXcFz2X9yq08on4ME1Cla
 WH5Z1VdGM/Dy3ic3JP1LfaoLBj0W8PnywvPvzyqQQLabF4U8nI5s6qpsMgIQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=bootlin.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=bootlin.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=bootlin.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=bootlin.com
 policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 756AB402BA
	for <nouveau@lists.freedesktop.org>; Mon, 18 May 2026 16:44:37 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 198EF10E5E3;
	Mon, 18 May 2026 16:57:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A9ECE4E42CE4;
	Mon, 18 May 2026 16:57:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 624815FFA3;
	Mon, 18 May 2026 16:57:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5E86511AF8B49;
	Mon, 18 May 2026 18:57:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779123459; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+GUakJQgQQZFR4eLPRoEYE8uJGTNPLGY7yG6NqQt4F0=;
	b=br9gs2ijS56RroxBZhqIXRTDxRxrOt1E+VTi6oIGgEftGswlZl6ckZ8/bk1KhGsH6d5AIx
	WCl2r0QWQR1G8PyPsLIuMSEwum4loYYz2Yt7PgSKLea4v87HO8mb9a83Zvb+pDp3CgCp8Y
	rzRULoohRN7ioF9ATxpXUTDxbmwTO795rq7Pke2mXsCg4F2hRggnj2O6obtI2xtKh0SfgK
	SOO2QR36NKTPybZWsgL3YNn+S0dz1eRiyHi6U21UQkjrwAGh+m2k18tYi9extz+qrqglLU
	snTrBIIl3ZGHmuoF8QrK4DSR3nZCa0Wkeg0uakCMZFEIuBVtexvrt2Ftz17YxA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 May 2026 18:57:26 +0200
Message-Id: <DILYMJY5CLJV.2FBCL0X62V418@bootlin.com>
Subject: Re: [PATCH] drm: Use named initializers for arrays of
 i2c_device_data
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?=
 <u.kleine-koenig@baylibre.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Robert Foss"
 <rfoss@kernel.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Lyude Paul" <lyude@redhat.com>,
 "Danilo Krummrich" <dakr@kernel.org>, "Marcus Folkesson"
 <marcus.folkesson@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260518100401.631351-2-u.kleine-koenig@baylibre.com>
In-Reply-To: <20260518100401.631351-2-u.kleine-koenig@baylibre.com>
X-Last-TLS-Session-Version: TLSv1.3
X-MailFrom: luca.ceresoli@bootlin.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 max-recipients; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: Y23LCACUJ66PK26GIDFKLVGC4CI6CXE2
X-Message-ID-Hash: Y23LCACUJ66PK26GIDFKLVGC4CI6CXE2
X-Mailman-Approved-At: Tue, 19 May 2026 14:33:59 +0000
CC: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jagan Teki <jagan@amarulasolutions.com>,
 Liu Ying <victor.liu@nxp.com>, Adrien Grassein <adrien.grassein@gmail.com>,
 Peter Senna Tschudin <peter.senna@gmail.com>, Ian Ray <ian.ray@ge.com>,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/Y23LCACUJ66PK26GIDFKLVGC4CI6CXE2/>
Archived-At: 
 <https://lore.freedesktop.org/DILYMJY5CLJV.2FBCL0X62V418@bootlin.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon May 18, 2026 at 12:04 PM CEST, Uwe Kleine-K=C3=B6nig (The Capable Hu=
b) wrote:
> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
>
> The mentioned robustness is relevant for a planned change to struct
> i2c_device_id that replaces .driver_data by an anonymous union.
>
> While touching all these arrays, unify usage of whitespace in the list
> terminator and drop trailing commas there.
>
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits. The former was confirmed with x86 and arm64
> builds.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
