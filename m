Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F98DC53219
	for <nouveau@archiver.kernel.org>; Tue, 28 Jul 2026 05:14:43 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E3F6410E7B5;
	Tue, 28 Jul 2026 05:14:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JJvitefY";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 915B447436;
	Tue, 28 Jul 2026 04:58:59 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785214739;
 b=LuwnuZhzLfwLcF2t/kjMNfdb4yluCBJu2WFdVGWAEp66U2MFATkMEw3vxMyQJmiWsgq1I
 cdPd8o9WUf+bcJJzCNpCcA+AorvHyYoDUwdKjVQcPQcYANM1Yknp8mdPspxJ6iyuKHx180m
 8v6UaPMkhthOqHrFlW+wqleAJk39a7Emx+3/Jpbl7WiM6CBp7pVPVj47rzzG3Vl0nxGvdmz
 N6pSRo3R3KYhHe09jeFr3SRjvwWB3Yf4jUNSZv7dJR5WOijUJEpuHRwoxv43FvJ0nVEdxpy
 RDrBLNmNPzwcetZPY2mBpesAAoZVcgA9+54Sh0IaJOuwemslTehCFrkdTXgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785214739; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Wun0I1dkmxfa8qNfn0OQhv2DA5hF2iEgMMGgkdL9fIM=;
 b=rsmZ8WjPzc28pG35KIcLgT+ab+kuUwADwJK3szxiw4AwN5bo0nVsascoGuP2V+vLDcO2w
 9z1oZkyXSWLi2aA/Ll7Agw9Nd6xMQHul5JuAaqaWEi8QfRAHUiznOFBPPNd1m9rmeGCp62D
 w1POBRDw6xAIZXQlp5Gl+QydusSf74N5f5Z1NHCWHhoBznyrNOt3dXQdwCBW5eR3azwMdNi
 6LKtd+50ETr3FLWR7jUnu1vP8Mv/gMY4frvlpHI5RZ5hnRiavBIybfKpGUQwbYZCHONQLmg
 AXBxHklr9DeqY2Jg0U0SPcyZ3Oe1khgDwWp2VRG6kbLo2bj36Rebn/vB4wcA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=intel.com header.i=@intel.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used Org Domain Record) header.from=linux.intel.com
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=intel.com header.i=@intel.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used Org Domain Record) header.from=linux.intel.com
 policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id E1A8F44C3E
	for <nouveau@lists.freedesktop.org>; Mon, 27 Jul 2026 08:14:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0723F10E2B8;
	Mon, 27 Jul 2026 08:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785141038; x=1816677038;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=qWnqu6VCUiwZWG189ixa/W9uGeC6PMG4tY9t7kvdnXI=;
  b=JJvitefYLe07AMSyEpc7DGn/YG7kFCXhaQfVbbJwfTOYn6h27UZtCetQ
   2V4D8O/xI8P5Bf14SztgwaxdyU96ZuwNhG+epzZ6fjagj8hSR30fmfFUs
   xgnob9d5ZicLJa0BxT9MHmd3yl5YVfD7tw0X4nCY9U3xGV+9vqjt2ulOv
   DfdWmhKKbIetZJHGX6RJQaEMg08h7iZtBp07fzN7KE9jaBq2+XebY1ClZ
   brzHV5pVqGjHzXhGJY0j4TIiN6/PJ+3bW/7Fz0gL/ynYa8cL7sAK2GBcw
   hwPAJpvdutYUTe2SSMATAnwMjQt+OPo7F4kjL2TSqhVuGHpS8eHsdFUQ4
   Q==;
X-CSE-ConnectionGUID: ybtQcTcSShOLSPOz0cpFzw==
X-CSE-MsgGUID: le4HquZ4RmiXjaL4zp+Tjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11857"; a="85573906"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000";
   d="scan'208";a="85573906"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 01:30:34 -0700
X-CSE-ConnectionGUID: zuBRshsISau4U4oJl9pq1g==
X-CSE-MsgGUID: S6JnVra9Qs26laDkF7yO1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000";
   d="scan'208";a="259417611"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.197])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 01:30:04 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jakub Kicinski <kuba@kernel.org>, Sang-Heon Jeon <ekffu200098@gmail.com>
Subject: Re: [PATCH 00/36] treewide: remove conditional returns with no effect
In-Reply-To: <20260724144822.6af8213f@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260723184538.3888637-1-ekffu200098@gmail.com>
 <20260724144822.6af8213f@kernel.org>
Date: Mon, 27 Jul 2026 11:30:01 +0300
Message-ID: <0ee1ef4aa7daa908bf28397ccc639c89b6aabd9c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MailFrom: jani.nikula@intel.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 max-recipients; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: KUGG4TAPQX2DXPXUQ3YP4MYN2PLOH6MV
X-Message-ID-Hash: KUGG4TAPQX2DXPXUQ3YP4MYN2PLOH6MV
X-Mailman-Approved-At: Tue, 28 Jul 2026 04:58:57 +0000
CC: Julia.Lawall@inria.fr, Alex Deucher <alexander.deucher@amd.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Borislav Petkov <bp@alien8.de>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Florian Westphal <fw@strlen.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans de Goede <hansg@kernel.org>, Hans Verkuil <hverkuil@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Ilpo =?utf-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Jaroslav Kysela <perex@perex.cz>, Jason Gunthorpe <jgg@ziepe.ca>,
 Jiri Pirko <jiri@resnulli.us>, "Joerg Roedel (AMD)" <joro@8bytes.org>,
 Johan Hovold <johan@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KUGG4TAPQX2DXPXUQ3YP4MYN2PLOH6MV/>
Archived-At: 
 <https://lore.freedesktop.org/0ee1ef4aa7daa908bf28397ccc639c89b6aabd9c@intel.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, 24 Jul 2026, Jakub Kicinski <kuba@kernel.org> wrote:
> On Fri, 24 Jul 2026 03:45:02 +0900 Sang-Heon Jeon wrote:
>> Patch 1 adds a Coccinelle script that matches the pattern, including
>> negation and constant-comparison variants. Where a local variable is
>> assigned right before the check, the assignment and the two returns
>> turn into a single return of the assigned expression.
>
> Huh, I thought we already had such script. Various script children have
> been sending such "cleanups" in the past.

We did, and it was removed, I believe in 1a617a8475e8 ("coccinelle:
misc: remove "complex return code" warnings"), because people just don't
want this constant churn.

It's perfectly fine to have the error case and happy day scenario
separated.


BR,
Jani.


-- 
Jani Nikula, Intel
