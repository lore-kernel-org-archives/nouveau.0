Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72635C531C9
	for <nouveau@archiver.kernel.org>; Sat, 25 Jul 2026 04:38:00 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 47EEC10F4EC;
	Sat, 25 Jul 2026 04:37:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bhpTuvSZ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 92768473BE;
	Sat, 25 Jul 2026 04:22:22 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784953342;
 b=WdZJnx7ir/pNdMuffToZCUIvcOLW2qE07m+/W6HLk2idcu84wEdrdAcRPAclSDPahd8x/
 UVRymcAv6UoDyJm4TlSKR90N+t/meMMSzmGy+3K9XJXyLjbZy2G6IOx83+Y9elMHZVzIeJG
 BA02c4cW9M7TUYwLnaJ7oSw0y23KzaMQGbaWahwphNOdwIE1eXWgkMPGh0Tyx9EhTjySTlC
 uUn+Qt7u2BFT6W0SOeEebtj7jXXDDGCuvh35/JJuOvqhUZTcvVqWh9/deA0kzU+Ky1y0eh8
 hEL7lkZu3jG1SuXAZNTsy+x8eq6oz3CW6Ds0UP7AfTcJfhdBGDcWN0wxFTlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784953342; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=GTdZSgSwBlfAlIxva5M6ZU/kD9VYoe26BBxVBJ5WdPE=;
 b=kabhXyvUXe8GRjJgH+zFlc9fkFQHOy34F33xMqaSRsCpASxuoRFRdeE3HzKLtGlAy+HF9
 QINOyaX7Z2/yfwEH/BD6raSH/FwOQu2nAaZPzz9vxtO+zwd69rZjb3hYnay0JAA0OVA2HfR
 0cBsTpEoIhUuebrOGQ5uVPyDgvPBV/ykNhS4LRce9ObrCj93q4auK49k1tL9G05aqDlruiI
 2WaZ7/xEBvNGgOc5hdLGBkQvloeUNcX03pVEd6a8gAyIu389aHgaiGg4aTARFqzWvJD5ZCo
 iy6O7snnlPfG3+KCx8tYrzfMC+j5Idys5T08CzOCII0OfVWfVV2JRelKnPbQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id BB0CF434E9
	for <nouveau@lists.freedesktop.org>; Fri, 24 Jul 2026 21:32:51 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 75C4710F49F;
	Fri, 24 Jul 2026 21:48:27 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1DC3C60A60;
	Fri, 24 Jul 2026 21:48:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A6FC1F000E9;
	Fri, 24 Jul 2026 21:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784929705;
	bh=GTdZSgSwBlfAlIxva5M6ZU/kD9VYoe26BBxVBJ5WdPE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=bhpTuvSZWBV7iq9keKc8+pixk18qLEuyMz3ZTlqKcB81KF/CnyeLGI6JSyvHGt9tA
	 E+SxQVBXcXsXsZgtn3HAr+6nPULrU5HRAYu13tTfnL5ffRJr3w0sXxS3y6FSy3SRlS
	 Qe3XQkADPgbjY9nioQHCBPR4pvKP4dL5d3HxM/ORX/63JYStNE+wqJy61XHcdbEpWF
	 xaZAuoqTpynwYjXBJP4BY73AhLP471MMWjcWFGi91teQEabAfmboMZJJ2AI9mVl919
	 5Vj52Ap+SYxCLa6sCvz56w/tCisRBng0kD6I+yiTKpyHAoJV1VexiywmsHK9mBuUsB
	 8QLvkwcrgPftA==
Date: Fri, 24 Jul 2026 14:48:22 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Subject: Re: [PATCH 00/36] treewide: remove conditional returns with no
 effect
Message-ID: <20260724144822.6af8213f@kernel.org>
In-Reply-To: <20260723184538.3888637-1-ekffu200098@gmail.com>
References: <20260723184538.3888637-1-ekffu200098@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-MailFrom: kuba@kernel.org
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 max-recipients; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: W2OM3VTSBG23WYOZ2YUANJULTYV6GFFC
X-Message-ID-Hash: W2OM3VTSBG23WYOZ2YUANJULTYV6GFFC
X-Mailman-Approved-At: Sat, 25 Jul 2026 04:22:20 +0000
CC: Julia.Lawall@inria.fr, Alex Deucher <alexander.deucher@amd.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Borislav Petkov <bp@alien8.de>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Florian Westphal <fw@strlen.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans de Goede <hansg@kernel.org>, Hans Verkuil <hverkuil@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/W2OM3VTSBG23WYOZ2YUANJULTYV6GFFC/>
Archived-At: 
 <https://lore.freedesktop.org/20260724144822.6af8213f@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, 24 Jul 2026 03:45:02 +0900 Sang-Heon Jeon wrote:
> Patch 1 adds a Coccinelle script that matches the pattern, including
> negation and constant-comparison variants. Where a local variable is
> assigned right before the check, the assignment and the two returns
> turn into a single return of the assigned expression.

Huh, I thought we already had such script. Various script children have
been sending such "cleanups" in the past.

> Patches 2-36 are generated by the script, with hand fixes to restore
> unexpectedly removed comments and to fix the formatting checkpatch.pl
> complained about.

Please post patches 4,7,8,9 as a separate series. Since you only CCed
netdev on subset of the series patchwork thinks there are patches
missing and doesn't kick off any CI.
