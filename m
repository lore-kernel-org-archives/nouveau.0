Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739B2CDE00B
	for <nouveau@archiver.kernel.org>; Thu, 25 Jun 2026 21:24:37 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3AFF310F3A0;
	Thu, 25 Jun 2026 21:24:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Onrh2DRe";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 928FF46CE7;
	Thu, 25 Jun 2026 21:10:05 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782421805;
 b=IW+F3famGHM6aRAo4uPxFujP4ugJL0kvEPa3/Gm00/gyRqkyTbNIfZsYeUwUYc+MiIs3M
 shueVAEJEQtKd4AE09pTSoMZiImlqcjonojTIYR+LcBV2eelIHjtEsZK6JSLVjlylZkN4DG
 E7Wla6ovbh2FJZeyHAp/rS9flmd1ex1JOsQDeuU0AFDrATd+Z5Z+HYl6MYvhvQK/bBpbgA3
 fqQKI9Ui/aAqTGwkC556e5Cw7USAPrRtx6l1Xkz+SB56bTN1LRAo5y2lDD0TPOgHIhZeNhR
 IQBS0RT8+Eyn+5tOBX6pbFmOrRFbp9eFrUv+mShBSTgd8wjCABx798xycZlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782421805; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=uDposd9yzkD1FM2nIjNn4bXbkvDLt/YZv/vRKxkPZLs=;
 b=pKpbO7bed+pZpszv7fNBzo/ov8cVJzqbC4JppCnwi5isfdP/3T/z6z9eCmF8zf/aivoQH
 0iYIsoepDwoj+9AGDqpoRPBAgCInJ1FhxxX9fOXPMsUREYZ6Eh0HYdCnB01INr7TlhP5GK7
 Y7hFbrABbBSEJlAxw5imlbsMidAZ1TZXpl+5LwQjjZEy4g2BCwgvC3/ak1IJO3EJWqr2Y2O
 oXhoXCHaxoonIrTqc1ZrrfkMzrgBX96ab8y6ajFi6zh/nNPuJguPR4SXnAIS+85ZHe5HJuH
 ILE+JhnOQ7EEGGUrT55ABxFeGgORZVWYgb7/l7ASdSaAnsPgHHjb8Igcqqtg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 6FD3840382
	for <nouveau@lists.freedesktop.org>; Thu, 25 Jun 2026 21:10:02 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E331A10F397;
	Thu, 25 Jun 2026 21:24:33 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E769560098;
	Thu, 25 Jun 2026 21:24:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0974B1F00A3A;
	Thu, 25 Jun 2026 21:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782422672;
	bh=uDposd9yzkD1FM2nIjNn4bXbkvDLt/YZv/vRKxkPZLs=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=Onrh2DRe3etG8+gEtrOVtB/xO9K2Pc6B/OJAfHyrypQjzi1uaCgLLM4uBlOd7FW6g
	 +8nmPgwFJIlj3/hINrovtvarjjqIFLBUDc0ldxhclyhwr3FDdvSwwk6A3kw98zSTQC
	 zb6N+Qsg3G3JxkHZIYp6Uaex6pAzzAOIme2FMm4JdOWFKP6nGDs1W1yZDwHIsnGfqt
	 KU25U8mQYcZHwblmMjMKq33uNEgpC43OlAxlei9c0DCz/OjaboMv7swe2MqQn3+TJt
	 kMLlhvw4pzTRFQNXVLHpIdbhp36vwVMuArLhNV+9TSOGEQQJKG741dIWsVKn7Lxd7C
	 8xdMhUH91Z//Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 25 Jun 2026 23:24:26 +0200
Message-Id: <DJIG3OW4RS98.3R1C3C97X702N@kernel.org>
Subject: Re: [PATCH v21 4/4] rust: drm: gem: Introduce
 shmem::Object::sg_table()
To: "Lyude Paul" <lyude@redhat.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260612194436.585385-1-lyude@redhat.com>
 <20260612194436.585385-5-lyude@redhat.com>
In-Reply-To: <20260612194436.585385-5-lyude@redhat.com>
Message-ID-Hash: 2OYSFSOWYHT633EXAU4MUEHW24RA2WUX
X-Message-ID-Hash: 2OYSFSOWYHT633EXAU4MUEHW24RA2WUX
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 driver-core@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Benno Lossin <lossin@kernel.org>,
 linaro-mm-sig@lists.linaro.org,
 Mukesh Kumar Chaurasiya <mkchauras@gmail.com>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/2OYSFSOWYHT633EXAU4MUEHW24RA2WUX/>
Archived-At: 
 <https://lore.freedesktop.org/DJIG3OW4RS98.3R1C3C97X702N@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Jun 12, 2026 at 9:43 PM CEST, Lyude Paul wrote:
> In order to do this, we need to be careful to ensure that any interface w=
e
> expose for scatterlists ensures that any mappings created from one are
> destroyed on driver-unbind. To do this, we introduce a Devres resource in=
to
> shmem::Object that we use in order to ensure that we release any SGTable
> mappings on driver-unbind.

It seems that this patch was applied without also applying the prerequisite
patch (patch 3), which broke the build for the newly added kunit test -- I'=
ve
picked up prerequisite patch to resolve this.

Thanks,
Danilo
