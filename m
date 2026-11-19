Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E57606A32A
	for <nouveau@archiver.kernel.org>; Thu, 19 Nov 2026 01:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n5rcT0Zl
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1F9B91120F3;
	Thu, 19 Nov 2026 01:27:18 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id ED19D47E7C;
	Thu, 19 Nov 2026 01:27:17 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1795051637;
 b=yGSdeDUVmf42SB2ICw3V1Bm1Hwvhf1edUr+c3CaQvaGnBRZZWM3ZaRfVBwn1RxVHk3H5u
 rppo2yuNNIThnjX9Q9a1Tpb+7K7AmoYJx6BV2Kjlo/9NFl4z/8E7Aqic/kg4ZmpNrWiQPDT
 oJw13AI+8uOFqJqosutVdkEKaPq+/5LP/AEGZyGt3yK4hpj+BuYlnFGm/lGmy8iMRHGAEN4
 elkwX+3iawZKBwCBZ/x02hUklB9mi55oLbvnokVFg0yEictKyg+cuU+eex8gUveNvlbFlA4
 P+MYvhUoXxiciQIRGq7UaFEwkPLXMPqLAqimrblVWv/etChbwoWmZOdDofKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1795051637; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=OprzOyo9+JassEd1TEvafiLmaglW2JAX08bz3qXzH+M=;
 b=trskZkp7gLl11uo4lrLjHUXrORJFo3sCeisGIzH8CJ6CRuN3ura5XPapEXs3K51qcv7Bl
 bBdxneb3IVvIIdf3EE4ujXaXlFw6AbdPwnnuDSeobAdyYMCN/h0//d52tt9V2+NCo2paUbq
 Hj3XodO/suaT3A2XeJyhPyADQiyc/28Inl4bu0bOmBySaRlYvia/HqYCJwNzJ+uXvNvgqgx
 e+fs5E6bV9AiisZV1Qp9nR9bDvV7i+/AcPdwZkYPfKfcHcrFdamJ9gUnSn5WuFmpRsow7Rd
 4i10BAl9sGaoBACSKUL7Otz1iNEitusq55K/8j18KHkIRXi7ZJkrgCBclz8Q==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 994C647E7C;
	Thu, 19 Nov 2026 01:27:14 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 783DA10ECD2;
	Thu, 19 Nov 2026 01:27:09 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 69306645CA;
	Thu, 19 Nov 2026 01:27:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F3471F000C5;
	Thu, 19 Nov 2026 01:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795051628;
	bh=OprzOyo9+JassEd1TEvafiLmaglW2JAX08bz3qXzH+M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=n5rcT0Zl/SE9jHWi65HwpiTbSdysgFWjql0ekarf62v72raja8OOgMi+64tXtTKOa
	 M5ygoG/bvHgzz8ZIeXIs2ivMgUwHgIEgn7GOBgW3ty0l2awMnvQY9owfOlmYKZD2uU
	 2IaJgO1zVeoXLDsLzuDkE2VXP7vdpkj0WzaTyH9BUuFigeLVhYz3ZCFE4AeDGyxyAR
	 U67BOybTOTaQp+T1SaHwEyeHtKvyxjFWydFbtpqNlmTQHU1xt3xlJ8+WoBg8WNChOH
	 xTcGI0Ji3/zNwyOnhcai3ZPaEx93fKbvlJNQHZs67FMZkQmqfPD+REcBrIBi9qpXuS
	 REEkUUwWsOnzw==
Date: Thu, 19 Nov 2026 01:27:00 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Philipp Stanner <phasta@kernel.org>
Subject: Re: [PATCH v2 1/3] dma-buf: dma-fence: Add flags parameter to
 dma_fence_init()
Message-ID: <20261119012700.2980cbe3@jic23-hlaptop>
In-Reply-To: <20261118134522.1646892-3-phasta@kernel.org>
References: <20261118134522.1646892-2-phasta@kernel.org>
	<20261118134522.1646892-3-phasta@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: PNVG63T4YEO5BSHBH5M4NPRNLKVOPI4O
X-Message-ID-Hash: PNVG63T4YEO5BSHBH5M4NPRNLKVOPI4O
X-MailFrom: jic23@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Simona Vetter <simona@ffwll.ch>,
 Sunil Khatri <sunil.khatri@amd.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Prike Liang <Prike.Liang@amd.com>,
 Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 David Rosca <david.rosca@amd.com>,
 Timur =?UTF-8?B?S3Jpc3TDs2Y=?= <timur.kristof@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 imagination@lists.freedesktop.org, lima@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-usb@vger.kernel.org, rust-for-linux@vger.kernel.or
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PNVG63T4YEO5BSHBH5M4NPRNLKVOPI4O/>
Archived-At: 
 <https://lore.freedesktop.org/20261119012700.2980cbe3@jic23-hlaptop/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 18 Nov 2026 14:45:21 +0100
Philipp Stanner <phasta@kernel.org> wrote:

> Currently, there are two init functions for dma_fence, dma_fence_init()
> and dma_fence_init64().
>=20
> Since more future user options for dma_fence initialization would
> require distinct init functions, too, it is better to do this in a
> unified way.
>=20
> Add a flags field to dma_fence_init(). Adjust all affected drivers,
> preserving the old behavior.
>=20
> Support the SEQNO64 flag, and add a check-function so that the user only
> sets valid bits.
>=20
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> Reviewed-by: Timur Krist=C3=B3f <timur.kristof@gmail.com>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
For IIO,

Acked-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
