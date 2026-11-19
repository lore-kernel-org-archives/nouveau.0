Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294AE606A324
	for <nouveau@archiver.kernel.org>; Thu, 19 Nov 2026 10:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=wrFrTipr
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 14086112277;
	Thu, 19 Nov 2026 10:20:36 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id F41944044A;
	Thu, 19 Nov 2026 10:20:30 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1795083630;
 b=Hr/navqcBn7J4kUGlE0ySEpp831GIoDL0//vvDocJh4CBgjjmmE3ecCFdm8lf4ueU1QQT
 qWcK8w/PQEJWRcietZgLQEPNQjHbeaB6umeCLGDmqIU08P02hkdhiHXy4rjsXw7c7vdEQXp
 6rH2USyCZdn7O2oPSiV+d3IqnASAyTO8NrVpklCFbnr0qySKHAw7vH6dpDRBjme4aunL6lz
 HWHxDU+UD/5Oada9WdMunevRlkI2Fr+P6zPwMzNzz3+MXOIW+UOZG22vc5shk1YeKOZvjns
 TwSWwwGqvk/AhvS2cb1mv0/YnhQmqmPSRiGR9hbsw7dDr74oTebJ7MMoS+4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1795083630; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=kMLYuvKF8dKdiwmDA59a1qSto363i7DFLCqovWncpVM=;
 b=gTi48jzcngF1fbW3Nq0FZzRc3orKY5nFoH+dX5tbKc8CkiWuSNg4wcblZnmUc4abo5ukE
 qvsVSAq/Ma/6Aad4ZsKQuFRqa4aTYB+ntkFjn3/qW+5w4utQRaD076bh1s6gV252svyAtcb
 eiKno4q11Ow8jQWvZRyWBtqKwT5sveDlVltP1Eg/A2Nx8gKQ+sPdBl6U8h+gyyvBCc5Jlzi
 18dHt+ds/vLkVmSbWRXat4xm+DFRvsTPSUwcZ8HmvEAQ8an1IXvR1QIcaz73BVlK0Y2VOC1
 KDudeh3iGmtl+HaNhZzQo6xdpIH+Xp9R4Mxu1JswQqFCA0cfTiQV8F3q0pFQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=mailbox.org;
 arc=none;
 dmarc=pass header.from=mailbox.org policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=mailbox.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=mailbox.org
 policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id DD3104020E;
	Thu, 19 Nov 2026 10:20:27 +0000 (UTC)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9E93310E680;
	Thu, 19 Nov 2026 10:20:22 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4jVZGq6rjlzMm1S;
	Thu, 19 Nov 2026 11:20:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812;
	t=1795083620; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kMLYuvKF8dKdiwmDA59a1qSto363i7DFLCqovWncpVM=;
	b=wrFrTiprp0Ygwj7fisQqKLfMWazzJwQS8HPNFqbCcn3xMC23c+XlYnmWGpPY6OwTsCFYcG
	pjdBV2XlPMgXizD5IHA860ywzUkD+zPnBEGC3P1iYty0h7dFnuiza4M6w6o0En4MdrFa29
	+z8/8pstoFJyzCxAaLcosYSfYnFvqRobT36nmnUt0/xlqfaGVRZ2fcD0Ifm0zgDEtu/5+n
	P8Q5PrjWKULrK0PMh7Putf64gTqx4d0cgQar9yKkwd/OUN6051FoFULV5Tr2btX33lJYti
	3up4UWipIuXn1wiDtyGvTg7fYqQDSjJUVFutoAn1IjQz0zTDogOUfQ0NPiL7ZQ==
Message-ID: <11c1451c97fa27ec3379965d13a6eea64e386cc3.camel@mailbox.org>
Subject: Re: [PATCH v2 0/3] dma-buf: dma-fence: Remove dma_fence_init64()
From: Philipp Stanner <phasta@mailbox.org>
To: Philipp Stanner <phasta@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>,  Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sunil Khatri
 <sunil.khatri@amd.com>,  Vitaly Prosyak <vitaly.prosyak@amd.com>, Prike
 Liang <Prike.Liang@amd.com>, Thomas =?ISO-8859-1?Q?Hellstr=F6m?=	
 <thomas.hellstrom@linux.intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>,  David Rosca <david.rosca@amd.com>, Timur
 =?ISO-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>, Maxime Ripard
 <mripard@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?ISO-8859-1?Q?Ma=EDra?= Canal	 <mcanal@igalia.com>, Raspberry Pi Kernel
 Maintenance	 <kernel-list@raspberrypi.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>
Date: Thu, 19 Nov 2026 11:20:14 +0100
In-Reply-To: <20261118134522.1646892-2-phasta@kernel.org>
References: <20261118134522.1646892-2-phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: e0df46cc69f1b87359b
X-MBO-RS-META: 4qqptwxqro4tns8nyafutn165yabqokk
Message-ID-Hash: 4V2SLWS3LNYRTLZYZFBHNPNFYP3GECRQ
X-Message-ID-Hash: 4V2SLWS3LNYRTLZYZFBHNPNFYP3GECRQ
X-MailFrom: phasta@mailbox.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; loop;
 banned-address; emergency; member-moderation; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 imagination@lists.freedesktop.org, lima@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-usb@vger.kernel.org, rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.10
Precedence: list
Reply-To: phasta@kernel.org
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4V2SLWS3LNYRTLZYZFBHNPNFYP3GECRQ/>
Archived-At: 
 <https://lore.freedesktop.org/11c1451c97fa27ec3379965d13a6eea64e386cc3.camel@mailbox.org/>
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

On Wed, 2026-11-18 at 14:45 +0100, Philipp Stanner wrote:
> Philipp Stanner (3):
> =C2=A0 dma-buf: dma-fence: Add flags parameter to dma_fence_init()
> =C2=A0 dma-buf: Port users of dma_fence_init64()
> =C2=A0 dma-buf: dma-fence: Remove dma_fence_init64()

Applied to drm-misc-next with the Rbs.

Thx guys.

P.
