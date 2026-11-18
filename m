Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2192E60A2600
	for <nouveau@archiver.kernel.org>; Thu, 19 Nov 2026 15:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=cMpbmfZ0
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0A56C1125B6;
	Thu, 19 Nov 2026 15:37:47 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0A02540472;
	Thu, 19 Nov 2026 15:37:42 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1795102661;
 b=jq/x8wD1w4q8qrw78x00iUD76/feJJM3Z/cZc0OmptpmOnXApt/8ZnzjJJaTEXh2MaSr8
 7a5OUxogZXvbVUJx87TmoI6cfc16nmLcHeEGOOjoeNGQxY/J+kW8X9+AdP9F0fDcm31Kc4j
 gjOdk/5pxEET8G0i43qq3GH/SaSFKa8LVj+lToLw0j+tr9AeERuCVxsTKgcpTPBoaQ5wZy9
 DrDeR1YGSPvTbn5Xj4zWu0cm2pgdrh9IMF544Mhm4pPfA9JfW16mb4tCPlJGzvORLnaqLm1
 /ZYVIpujzpHdzAHePbBhsbmXDILQfcyVR5PaaQAZfHovPwUY4TuvVq1thFqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1795102661; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=foydl+Nk9ZmJviej/30gV1cygoCTSVCceGPI7w/fow0=;
 b=CgzPPIFPX/OKRoAQybtBKjE0dpvKyIinIDaM+N0Qt6gHDuoK6n6pqQ3by8406DsgCBicw
 Q8RLtf++Y6FSqgPm3jGyc0ss4wPlhw2nkZJMm0H7lztAOxsLYMf1xX7WWsx2lqrS7DUb1FK
 fliDK91g3JxIWM9q316z3jR8DDBn6qS3Q32ieqYJKDTNryIysyRNsOe71aNFLSV6G/PVpGU
 ksH6bmO8L08wop5rTnZmbokCTMF+vGD6op6PlDPYDeNaqp1dCHxrC0SymyHiiOTJ3y0Kre/
 8Qw1600OXWBLu7NMdHtnyPLfTKLNs765ncV1JRrpG+n44EVuCdKu3aELdsaw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=infradead.org;
 arc=none;
 dmarc=pass header.from=infradead.org policy.dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=infradead.org; arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=infradead.org
 policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id CE0164668B
	for <nouveau@lists.freedesktop.org>; Wed, 18 Nov 2026 13:45:34 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DDD2310E7F3;
	Wed, 18 Nov 2026 14:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=foydl+Nk9ZmJviej/30gV1cygoCTSVCceGPI7w/fow0=; b=cMpbmfZ0BwP5BHLVj+ahy7474K
	9jQVZUTYDPRWMmNInqlwq3Il9TbgjATQK7ing2WRUOh+0zkz6gdJ06IIlFf0kAgGCezCNZYU5YvcV
	DMbIAtPVR4KGaM4r0jjXRWj63/NGqk/VvxCuqWAyU7vg3ueZRkWC1YrlwedfaaaTLZgXVm9MNV/Z+
	bTtoazxVy81wDZTODobdzyYIrGH5ns62eNNCyuU1UQhxdkcuIdhm0K7+sUgro43CUTcrfkfggiZtG
	JRC/pLl0dPHJoH0LTcq4Cat0YqPdDv0VykNQ/LGugccBVDJEpbAxIr1vdePSum1wbi1k+DVWpC2D2
	2sm77DEQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252]
 helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTgHi-0000000E2Nt-35pT;
	Wed, 18 Nov 2026 14:05:15 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E2EC13005AF; Wed, 18 Nov 2026 15:05:13 +0100 (CET)
Date: Wed, 18 Nov 2026 15:05:13 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Bence Csokas <bence.csokas@arm.com>
Subject: Re: [PATCH v4 2/2] treewide: Use struct_offset()
Message-ID: <20261118140513.GO1813469@noisy.programming.kicks-ass.net>
References: <20261118-offsetof-v4-0-95b385c10b22@arm.com>
 <20261118-offsetof-v4-2-95b385c10b22@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118-offsetof-v4-2-95b385c10b22@arm.com>
X-MailFrom: peterz@infradead.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: 3VXOSCOG27PJVZ2QUSRFYYS2UECGI2CW
X-Message-ID-Hash: 3VXOSCOG27PJVZ2QUSRFYYS2UECGI2CW
X-Mailman-Approved-At: Thu, 19 Nov 2026 15:37:38 +0000
CC: Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Philipp Stanner <phasta@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Danilo Krummrich <dakr@kernel.org>, Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Selvin Xavier <selvin.xavier@broadcom.com>,
 Kalesh AP <kalesh-anakkur.purayil@broadcom.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Chengchang Tang <tangchengchang@huawei.com>,
 Junxian Huang <huangjunxian6@hisilicon.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Miri Korenblit <miriam.rachel.korenblit@intel.com>,
 Jes Sorensen <Jes.Sorensen@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Guenter Roeck <groeck@chromium.org>, Nilesh Javali <njavali@marvell.com>,
 GR-QLogic-Storage-Upstream@marvell.com,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Martin K. Petersen" <mkp@kernel.org>, Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Paulo Alcantara <pc@manguebit.org>, Namjae Jeon <linkinjeon@kernel.org>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
 Bharath SM <bharathsm@microsoft.com>, Carlos Maiolino <cem@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 Ihor Solodrai <ihor.solodrai@linux.dev>, Simon Horman <horms@kernel.org>,
 David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
 =?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, "Geoffrey D. Bennett" <g@b4.vu>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, linux-hyperv@vger.kernel.org,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-scsi@vger.kernel.org, cocci@inria.fr,
 linux-fsdevel@vger.kernel.org, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-xfs@vger.kernel.org,
 bpf@vger.kernel.org, ipsec@lists.linux.dev,
 linux-security-module@vger.kernel.org, linux-sound@vger.kernel.org
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3VXOSCOG27PJVZ2QUSRFYYS2UECGI2CW/>
Archived-At: 
 <https://lore.freedesktop.org/20261118140513.GO1813469@noisy.programming.kicks-ass.net/>
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

On Wed, Nov 18, 2026 at 12:50:09PM +0100, Bence Csokas wrote:
> Generated with a simple Coccinelle patch found in
> scripts/coccinelle/api/struct_offsetof.cocci

I think this is a good example of why we don't need this. It adds yet
another macro to remember, and doesn't actually save many characters at
all.
