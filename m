Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B712606A31E
	for <nouveau@archiver.kernel.org>; Thu, 29 Oct 2026 10:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=owjb1PqO
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B14361121CA;
	Thu, 29 Oct 2026 10:29:11 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D266348BE5;
	Thu, 29 Oct 2026 10:10:01 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793268601;
 b=Y2KBNBlgJyxoiFr+65EffvvemH7Ha+9QnMZnQdChic7irlcdTAuzmHOQjWMRI6+7H7vKW
 2/bj5X/qG+2L328Iccj+ialSzCkL5LsZyrSaRwPmbvB1aTee/oCHEh9pwgyseerQN1+RqfS
 8IG3m4WLATzO4yb8ze7NZJFaMiGTYEuWZLBw1JD16LUT7VLQZ53rVRMvkEKWfq+T8xo8aWA
 nHPlzQnHuGijuQYBxl0HlHkO3E8t6NH5lvuu54m4iGNDlMSBhI1SUWIdGd8DiQ9NwvVc73B
 w1fRz3KkHgWzde53cWz0ohINR9g2z3+JY1W+UexPfmPUVhuB262JzZAOWJJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793268601; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=PQfG2Km+YKrxCDPAAbbWYdryEevMUab9CWpj+Sh05TA=;
 b=P9zSqEXuJ1ja+9EB7kD9s53jg/8LoxY4inGIOIzdgG1oYXIozdDDDrnNoxyedupQvNIXi
 VewTjtm3gnunfjCyXY9PSrUj5nW/L001qVuGCk6T//LnwfgtWYtsQp6CNpe5onsQ4FUPfGf
 qLWtJTE7Cs7Djmz0hhqEnfGHCJo91rpMaVtUKAwxNPw0dQA58H7qaY32+tkXRG3w9TeiX04
 rBq0zTLZBsk/HXufjXxUnCULCfzRTcJJ5WysFrvBautwS8nLxFmpIincRRtJjEPiJrv7u4K
 FJZNv32XbJXoyzNSrZ6iv45xphnNlUkVuudsx7lLeqXopL4K2+uN0bpKkLJw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=mailbox.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=mailbox.org
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=mailbox.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=mailbox.org
 policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 229FF46CD7;
	Thu, 29 Oct 2026 10:09:58 +0000 (UTC)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 92D2E1121C2;
	Thu, 29 Oct 2026 10:29:02 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4jFgSW3XgszMlJf;
	Thu, 29 Oct 2026 11:28:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812;
	t=1793269739; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PQfG2Km+YKrxCDPAAbbWYdryEevMUab9CWpj+Sh05TA=;
	b=owjb1PqOwF30L04GcK9Gww366AX2aDnKYxBGxkid6fiIMNw14Fg6DhRRdvbRSRfBeVSMQl
	WaxlytFFpjs1RJoZ5N45Sz33bL9w1qJBlyeR1eU5rt65f55C6aO6qdifwEcZ130ppK53tP
	pSveThL3uREOnABjLcdpsunrn9gRUFcZLXwXOSMIY/Byy+6Sd2LBtfvMGzoSgr9hC9w0Ly
	5xXQ0diqvtpnZBddkWZNE4v0Z6yBzfp+Ldvy08kYgCZJDjkf6XZXF1wQdHfrhUyKVv7ICE
	Oy4tVehaRM110/poQ6AB8ew8cPWmwyLlOdtLmIRxn5M7f9zit58chkxeIOjPjA==
Message-ID: <3565783722927fa48a30f48b063ef99bcd703eab.camel@mailbox.org>
Subject: Re: [RFC PATCH 0/6] dma-buf: Phase out is_signaled() race
From: Philipp Stanner <phasta@mailbox.org>
To: Lucas Stach <l.stach@pengutronix.de>, Philipp Stanner
 <phasta@kernel.org>,  Min Ma <mamin506@gmail.com>, Lizhi Hou
 <lizhi.hou@amd.com>, Oded Gabbay <ogabbay@kernel.org>,  "Rob Herring (Arm)"
	 <robh@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>, Karol Wachowski	
 <karol.wachowski@linux.intel.com>, Andrzej Kacprowski	
 <andrzej.kacprowski@linux.intel.com>, Sumit Semwal
 <sumit.semwal@linaro.org>,  Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>, Alex
 Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter	 <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Russell King	
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>,  Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, Alessio
 Belle	 <alessio.belle@imgtec.com>, Luigi Santivetti
 <luigi.santivetti@imgtec.com>,  Qiang Yu <yuq825@gmail.com>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov	 <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang	
 <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten	
 <marijn.suijten@somainline.org>, Lyude Paul <lyude@redhat.com>, Danilo
 Krummrich <dakr@kernel.org>, Boris Brezillon
 <boris.brezillon@collabora.com>, Steven Price	 <steven.price@arm.com>,
 =?ISO-8859-1?Q?Adri=E1n?= Larumbe	 <adrian.larumbe@collabora.com>, Liviu
 Dudau <liviu.dudau@arm.com>, Dave Airlie	 <airlied@redhat.com>, Gerd
 Hoffmann <kraxel@redhat.com>, Matthew Brost	 <matthew.brost@intel.com>,
 Natalie Vock <nat@pixelcluster.dev>, Arun Pravin	
 <arunpravin.paneerselvam@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Thomas =?ISO-8859-1?Q?Hellstr=F6m?=	 <thomas.hellstrom@linux.intel.com>,
 Melissa Wen <mwen@igalia.com>,  =?ISO-8859-1?Q?Ma=EDra?= Canal	
 <mcanal@igalia.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance	 <kernel-list@raspberrypi.com>, Dmitry
 Osipenko <dmitry.osipenko@collabora.com>,  Gurchetan Singh
 <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, Zack Rusin
 <zack.rusin@broadcom.com>,  Broadcom internal kernel review list	
 <bcm-kernel-feedback-list@broadcom.com>, Thierry Reding	
 <thierry.reding@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Cameron	 <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?=	 <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman	
 <gregkh@linuxfoundation.org>, Sunil Khatri <sunil.khatri@amd.com>, Kees
 Cook	 <kees@kernel.org>, Jesse Zhang <jesse.zhang@amd.com>, Timur
 =?ISO-8859-1?Q?Krist=F3f?=	 <timur.kristof@gmail.com>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>,  Kexin Sun <kexinsun@smail.nju.edu.cn>,
 Prike Liang <Prike.Liang@amd.com>, David Rosca	 <david.rosca@amd.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>, Marco Crivellari
 <marco.crivellari@suse.com>, Shixiong Ou <oushixiong@kylinos.cn>, Jouni
 =?ISO-8859-1?Q?H=F6gander?=	 <jouni.hogander@intel.com>, Thadeu Lima de
 Souza Cascardo <cascardo@igalia.com>,  Pierre-Eric Pelloux-Prayer
 <pierre-eric.pelloux-prayer@amd.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, Al Viro <viro@zeniv.linux.org.uk>,  Neill Kapron
 <nkapron@google.com>, Michael Bommarito <michael.bommarito@gmail.com>, Sam
 Day <me@samcday.com>,  Gabriel Prostitis <prostitisgabriel@gmail.com>
Date: Thu, 29 Oct 2026 11:28:39 +0100
In-Reply-To: <abca3f0039b07999e29558690c27fef23292bea3.camel@pengutronix.de>
References: <20261029095542.1526750-3-phasta@kernel.org>
	 <abca3f0039b07999e29558690c27fef23292bea3.camel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: j7weafhpcaunystyo7r38dam3cyszcnz
X-MBO-RS-ID: 051d97976afa34da498
Message-ID-Hash: ENYCOO2GVJQGOIDDXA45K2FYERUDHJU7
X-Message-ID-Hash: ENYCOO2GVJQGOIDDXA45K2FYERUDHJU7
X-MailFrom: phasta@mailbox.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 imagination@lists.freedesktop.org, lima@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-usb@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: phasta@kernel.org
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ENYCOO2GVJQGOIDDXA45K2FYERUDHJU7/>
Archived-At: 
 <https://lore.freedesktop.org/3565783722927fa48a30f48b063ef99bcd703eab.camel@mailbox.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 2026-10-29 at 11:23 +0100, Lucas Stach wrote:
> Hi Philipp, hi Christian,

Jo Lucas

>=20
> Am Donnerstag, dem 29.10.2026 um 10:55 +0100 schrieb Philipp Stanner:

[=E2=80=A6]

> I think we would all be interested in the actual use-case that's
> sensitive to this kind of latency.

Me too.

Let me use this opportunity to stress that in the future, in DRM,
whenever we have [to accept] a racy "optimization", both commit
messages and code comments must document why it exists and who
requested it with what proof.

Would save us lots of time when those things are discussed >5 years
later.

>=20
> However, I wonder if this is even an issue anymore with the lock
> inlined into the fence structure.

Almost no one uses inline-lock so far. So unfortunately, we might
regress old drivers, maybe.

But sounds as if you're in favor of phasing the locklessness out :)


P.
