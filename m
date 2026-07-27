Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7FD0C531D0
	for <nouveau@archiver.kernel.org>; Mon, 27 Jul 2026 12:13:00 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CBA3910E3A8;
	Mon, 27 Jul 2026 12:12:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cJUiNzz1";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 01B31473F2;
	Mon, 27 Jul 2026 11:57:18 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785153437;
 b=fydJWuhr7wqDsSx/s6ed+0ekk1EGFJQFDcLHfKHwaCBjNglligzcgTQMBC2k36tZ9LRK3
 dxZbYQeaYOuhS3yX4cJ8zr7IU9oDWJd6KmvSzrsVmX39Y3c6JyOSfx5XKPhICNBCgh/XxkF
 AQu4578nnHELNrmw0ClRwp8DDO4h/ct96UoREO1wBcvfk8eQNTMz2Hs+xLOfLyPKWs3s9Ix
 kDZj9LBoitj79Ejv81QTkwAqqpt0rxUEVPB+bAji8Y714cy+Hj5NT6pTI9nLAQYY5d+G60P
 B5x7wv1bnHVgIGRAIZ60ujpahF6iCWaU8boSuQ1ZgBJvQdlGCPDl32S2DX6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785153437; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=NuMpyXi203gMNqb11rcfOKZmtmuJN0EPDdTrfGAbmqA=;
 b=loN0YlpBVQlxb3NnAWwAN0SXi/jo+by0o/jhH31wux1XsAXnJCG/U2kME122zO+qMznlC
 AwDFF61r+j4/BoWV7Jvgq2+8WjVFNOZ3qvZOol8RsQ+I/2fo3Z3DVL35m5Nay0Q/AJ0w6hd
 QslhcoQFMCiysagzwL8xA40CqXDOmWHqwYlY3D4p0hXn9vcYC54/soNrRScOaZRYRZdZ0uH
 5ZorZs44cx8URjLThGySKD5QW3OGoX9SblX/XsPb7aubWmtevXe2OzIyC3X9pBLvVr14zCR
 QXlWi8zcZqTb1OjePABYYEmO7gXynqxzKMaQ2+zqciZ5f4rAmdKx07eIfKQQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 4E904473EE
	for <nouveau@lists.freedesktop.org>; Mon, 27 Jul 2026 11:57:15 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E220B10E261;
	Mon, 27 Jul 2026 12:12:56 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6DAC743950;
	Mon, 27 Jul 2026 12:12:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0753E1F000E9;
	Mon, 27 Jul 2026 12:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785154376;
	bh=NuMpyXi203gMNqb11rcfOKZmtmuJN0EPDdTrfGAbmqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cJUiNzz1prDmu0GWRwCZ182TsRp83BQvTp0/rURfnkMQzP20L6fG8sazv0cYKgUtW
	 pg9MCuVlTFHqe3x/O6EVkylNOZs7wcPPsZhmCr3XEWEcOo26weH2DM61fSqQ+OmbrP
	 tvyWB2eboDXUxX9deZuSx028Hbg9foCFt8d+5Bw+IlFteVi3skzllTVeGL1XafPYbe
	 08wppeqNa8S6eH5zJPQgihAdalyGQJliwPyAS5P+AP5v8yaQxZyfcN5KNznMD5HYbU
	 HA3HDDWzzh9ixbV9ramHSWGxONVFCvMxk3yVAI+jirrpd4gfEm0DA5Mx/fNCvUjATc
	 xHtThaOzcAK8w==
Date: Mon, 27 Jul 2026 13:12:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Subject: Re: [PATCH 00/36] treewide: remove conditional returns with no effect
Message-ID: <adcfc6f2-3309-4496-8331-1ae31e85d363@sirena.org.uk>
References: <20260723184538.3888637-1-ekffu200098@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2ViMWcNJN7tv3iXJ"
Content-Disposition: inline
In-Reply-To: <20260723184538.3888637-1-ekffu200098@gmail.com>
X-Cookie: It's OKAY -- I'm an INTELLECTUAL, too.
Message-ID-Hash: 3HHO4NVW7MO6PV4G3XYJLNKYHKLAHP27
X-Message-ID-Hash: 3HHO4NVW7MO6PV4G3XYJLNKYHKLAHP27
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Julia.Lawall@inria.fr, Alex Deucher <alexander.deucher@amd.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Borislav Petkov <bp@alien8.de>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Florian Westphal <fw@strlen.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans de Goede <hansg@kernel.org>, Hans Verkuil <hverkuil@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jakub Kicinski <kuba@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Jaroslav Kysela <perex@perex.cz>,
 Jason Gunthorpe <jgg@ziepe.ca>, Jiri Pirko <jiri@resnulli.us>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Johan Hovold <johan@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Julian Anastasov <ja@ssi.bg>, Leon Romanovsky <leon@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthew Sakai <msakai@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Mike Rapoport <rppt@kernel.org>,
 Miri Korenblit <miriam.rachel.korenblit@intel.com>,
 Nicolas Palix <nicolas.palix@imag.fr>,
 Pablo Neira Ayuso <pablo@netfilter.org>, Paolo Abeni <pabeni@redhat.com>,
 Ping-Ke Shih <pkshih@realtek.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sebastian Reichel <sre@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Simon Horman <horms@verge.net.au>, Stephen Boyd <sboyd@kernel.org>,
 Steve French <sfrench@samba.org>, Takashi Iwai <tiwai@suse.com>,
 Thomas Renninger <trenn@suse.com>, Tony Luck <tony.luck@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>, Vinod Koul <vkoul@kernel.org>,
 Will Deacon <will@kernel.org>, Yazen Ghannam <Yazen.Ghannam@amd.com>,
 cocci@inria.fr, amd-gfx@lists.freedesktop.org, dmaengine@vger.kernel.org,
 dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-wired-lan@lists.osuosl.org,
 iommu@lists.linux.dev, linux-cifs@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-edac@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mm@kvack.org, linux-pm@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, lvs-devel@vger.kernel.org,
 netdev@vger.kernel.org, netfilter-devel@vger.kernel.org,
 nouveau@lists.freedesktop.org, platform-driver-x86@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3HHO4NVW7MO6PV4G3XYJLNKYHKLAHP27/>
Archived-At: 
 <https://lore.freedesktop.org/adcfc6f2-3309-4496-8331-1ae31e85d363@sirena.org.uk/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>


--2ViMWcNJN7tv3iXJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 24, 2026 at 03:45:02AM +0900, Sang-Heon Jeon wrote:

> All patches are independent and can be applied separately, but for
> everyone's convenience, it would be nice if they were merged through
> a single tree.

Please don't do this, it does not make anything more convenient - it
results in huge CC lists and makes it more difficult to work out who
will actually apply things.  If there's no dependencies just send to
each subsystem independently.

--2ViMWcNJN7tv3iXJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpnSzQACgkQJNaLcl1U
h9DhKwf/RoCnDee69F9hZ06/HOdC8gDpovt8IjWRgC8X3EQmHZkTxcKWoky17APD
5D8K2eKoz+FEDKrtFChR3EfGX0AhpmXhKtwaUanH/Qm+clf4ZjOTiguGtDpB4EVm
bTQ0cWSCcNpHm4yfpRk8XJVw/leZO0YIsDDi9rHzgeKJVY5zWBXi6azVk3svE2Ut
E9u3jmn1vStzN8uV36mRJ2+hgzFQOVilP6XSNNxMrdu6GJXHk/T6ZUlANNAxGcbL
/fZLJuq1gzwgfEJevdiqJ+O9U3OQl0DV9ZELQBaghYKq6Lv3nMs3PFSromeerfgv
GqK0jSpzheWN4gsenCQKqgt3POQM+g==
=WTGT
-----END PGP SIGNATURE-----

--2ViMWcNJN7tv3iXJ--
