Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F39BC531FC
	for <nouveau@archiver.kernel.org>; Fri, 24 Jul 2026 23:35:17 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4ABFF10F4B0;
	Fri, 24 Jul 2026 23:35:16 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 16805473B8;
	Fri, 24 Jul 2026 23:19:40 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784935179;
 b=lgoO5jEL6APuapwtJL2K0MH+GLNH+ST501GQIGLvqQ3oXtmY7zxr+GUgRaGtmMan/hbhB
 XmIkrJQxTBZPdSCB9m8h0WnA0VA+Hab8p+xTcdMnI3p6kET4D+gOWz4pndhRyBtiYe2iJD9
 15lajeZWe4M5pgOmU578Is3qlBrXy7tO9kAlkkRiIDzwIjmjGHwWkxmxD5BPRwb2ODNYncv
 KDo+SjpKeDVftQRjJXKdwZPRcsHh8RJUFItJzyluzEi6gtPSWFjr6D2GvlKflt7YYgqX8ZL
 NKSTTMwZCuxGv2cy/njutksku187XINMgvYfrJ6NyWwAvBZaxySWMxmosjyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784935179; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=4ZsZf8mlcRgO4a30pXSf1rO5CYE8B1uYHjFerDlxN7c=;
 b=PYJYzHUEW+cc0Qq+5O9qKnEtt7k/dzmI2neHTfL29A6sAPEBLbYb+RNAD+HVSmTbcKYIH
 ILW3M7ujuwHMANYdj7ifzmPiWTt8IcI1y1W/wQ23iX+C/h2eW/2WLbxS8l+I6PFL8L5dSqy
 IGEIa7aEBveqXSoj8Hh5a2MXmpFCs4gXH09osg9PRjCBjTaURA77dEkAJrBkffXm589DF4W
 50VMT75izk1v80vki3v337D0LnApBF0kDJtFc+YEDIp6oE2vHYecHwE1hgEh00HSUYu1MtH
 2mgD7YDI21w+rg32yOPAjOCW9L1dxWTx/PgW4ttJh6OGu9J6rz2Iy6G3L0iw==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=collabora.com
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=collabora.com
 policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 7FCF44732F
	for <nouveau@lists.freedesktop.org>; Fri, 24 Jul 2026 23:19:36 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 78C3910E0C0;
	Fri, 24 Jul 2026 23:35:12 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B1CC14513F;
	Fri, 24 Jul 2026 23:35:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79E171F00A3A;
	Fri, 24 Jul 2026 23:35:11 +0000 (UTC)
Received: by venus (Postfix, from userid 1000)
	id 93CE9181F1C; Sat, 25 Jul 2026 01:35:08 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Julia.Lawall@inria.fr, Alex Deucher <alexander.deucher@amd.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Borislav Petkov <bp@alien8.de>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 David Airlie <airlied@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Florian Westphal <fw@strlen.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans de Goede <hansg@kernel.org>, Hans Verkuil <hverkuil@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jakub Kicinski <kuba@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Jaroslav Kysela <perex@perex.cz>,
 Jason Gunthorpe <jgg@ziepe.ca>, Jiri Pirko <jiri@resnulli.us>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Johan Hovold <johan@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Julian Anastasov <ja@ssi.bg>, Leon Romanovsky <leon@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthew Sakai <msakai@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Mike Rapoport <rppt@kernel.org>,
 Miri Korenblit <miriam.rachel.korenblit@intel.com>,
 Nicolas Palix <nicolas.palix@imag.fr>,
 Pablo Neira Ayuso <pablo@netfilter.org>, Paolo Abeni <pabeni@redhat.com>,
 Ping-Ke Shih <pkshih@realtek.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sebastian Reichel <sre@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Simon Horman <horms@verge.net.au>, Stephen Boyd <sboyd@kernel.org>,
 Steve French <sfrench@samba.org>, Takashi Iwai <tiwai@suse.com>,
 Thomas Renninger <trenn@suse.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tony Luck <tony.luck@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>, Vinod Koul <vkoul@kernel.org>,
 Will Deacon <will@kernel.org>, Yazen Ghannam <Yazen.Ghannam@amd.com>,
 Sang-Heon Jeon <ekffu200098@gmail.com>
In-Reply-To: <20260723184538.3888637-1-ekffu200098@gmail.com>
References: <20260723184538.3888637-1-ekffu200098@gmail.com>
Subject: Re: (subset) [PATCH 00/36] treewide: remove conditional returns
 with no effect
Message-Id: <178493610858.699463.6794401814873674138.b4-ty@collabora.com>
Date: Sat, 25 Jul 2026 01:35:08 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
Message-ID-Hash: WVX2KPJGF4AMO5EZRBFB2YIR6CTP3O6K
X-Message-ID-Hash: WVX2KPJGF4AMO5EZRBFB2YIR6CTP3O6K
X-MailFrom: sre@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: cocci@inria.fr, amd-gfx@lists.freedesktop.org, dmaengine@vger.kernel.org,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/WVX2KPJGF4AMO5EZRBFB2YIR6CTP3O6K/>
Archived-At: 
 <https://lore.freedesktop.org/178493610858.699463.6794401814873674138.b4-ty@collabora.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>


On Fri, 24 Jul 2026 03:45:02 +0900, Sang-Heon Jeon wrote:
> While reading mm/memblock, I found a conditional return where both
> branches return the same value:
> 
> 	err = do_something();
> 	if (err)
> 		return err;
> 	return err;
> 
> [...]

Applied, thanks!

[26/36] power: supply: pm8916_lbc: remove conditional return with no effect
        commit: b7c8d46411317f135e7791c0eddc56691de63f07

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>

