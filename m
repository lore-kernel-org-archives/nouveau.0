Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316AACD6E6E
	for <nouveau@archiver.kernel.org>; Thu,  4 Jun 2026 19:29:00 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A7E591129A0;
	Thu,  4 Jun 2026 19:28:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="POMmocm9";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id BA019467DF;
	Thu,  4 Jun 2026 19:15:12 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1780600512;
 b=FWrglwBvK3boVs8ST0W+U2PuZdQHKDDmI/swlPG0tTzCW5Ej0mM9NjdR4uJG3gQuXRM6S
 8Xr3DGWblE0COsVeyM5tUEpML1LMAcD4rnO1//HoAZAIsu7DtfACBloRIRPR5fgMtkJA6E+
 QaJrGWDYik1oQzE0cfSL5xBAK8uPCbPs0wk+IQGA0HZLwlG2bPrPF2c9rHRKUKzxN2kIWuV
 Y8BfNJzkH3bfqKmjVpJopq78RBkxGkzVUcPa6nVXSsx6KLP5TpuownfC1XL0zK62TPrECwO
 aw5Sx6XghwMZEBaGO2DqLQ3VlT4iH4K1guPWx5wVn5YssSG/quCKVAl3rdcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1780600512; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=XS+UsD0PDVuz1LYdnD02PCXwroKcozOQEvx5p18Ch3g=;
 b=ysEtTeAkEbAbB6dcrDbxLxrJ0s+EWmiOPCeb4UvoH5iKpuLaojqrXLut3TDQwZ1Ni9UA4
 M847eBPBUpU9O/LOEU7UgFiFk8VhtGas5HvhneTpTj7jgjBq7GENhVcPrCJvtxgxqiO6Fmb
 nVf0hDQ5h5D2884RlWsXIIqBeGbQRX2zhWHcBMW8psKBd4nw1oFCzw01ATj5SXKGtka33Uq
 s+g+NKDkATCmWRIqdG6xer5pFwlKPB/QeYpRGqt/ia/9nEXnYJGacc5aUZN4I2spNkldp9b
 9dr5TSUe0PhwRYDL7AZIox5zsc7Yz5DbaqdhL/fFwFS16eAZlE2ONki5KCFg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=redhat.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=redhat.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id B0B6840638
	for <nouveau@lists.freedesktop.org>; Thu,  4 Jun 2026 19:15:10 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 52E9C11299B
	for <nouveau@lists.freedesktop.org>; Thu,  4 Jun 2026 19:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780601334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XS+UsD0PDVuz1LYdnD02PCXwroKcozOQEvx5p18Ch3g=;
	b=POMmocm9BiWNgrTp0daua/3Kl3lv6o2WM80MH6Y1r9QW6S8o8F1rV5NO0NuVD767jpm7BU
	M/9EAQW29NZpgWu4Trxn6lNey/eaIwRb8GdL4ilca3x2p2950OId3rSwhKTYB4iunISRmK
	dtSpUau7uN3VamuX0Z1J4vYqrzDQEFE=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-674-X7zekWodNVSHoJa5gZYAWQ-1; Thu,
 04 Jun 2026 15:28:50 -0400
X-MC-Unique: X7zekWodNVSHoJa5gZYAWQ-1
X-Mimecast-MFC-AGG-ID: X7zekWodNVSHoJa5gZYAWQ_1780601327
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id EDFEA1956089;
	Thu,  4 Jun 2026 19:28:46 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.65.199])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 57C42414;
	Thu,  4 Jun 2026 19:28:43 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v18 0/4] Rust bindings for gem shmem
Date: Thu,  4 Jun 2026 15:24:27 -0400
Message-ID: <20260604192740.659240-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: kx6l39lQA7Hp-N74Y6m5a1dvnwlP0aEbM0pjdEmZOBk_1780601327
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: FCIZJERIAF3DXIE7AMXUTHLQ5YT76LSV
X-Message-ID-Hash: FCIZJERIAF3DXIE7AMXUTHLQ5YT76LSV
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Alexandre Courbot <acourbot@nvidia.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 driver-core@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Benno Lossin <lossin@kernel.org>,
 linaro-mm-sig@lists.linaro.org, Danilo Krummrich <dakr@kernel.org>,
 Mukesh Kumar Chaurasiya <mkchauras@gmail.com>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FCIZJERIAF3DXIE7AMXUTHLQ5YT76LSV/>
Archived-At: 
 <https://lore.freedesktop.org/20260604192740.659240-1-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Most of this patch series has already been pushed upstream, this is just
the second half of the patch series that has not been pushed yet + some
additional changes which were required to implement changes requested by
the mailing list. This patch series is originally from Asahi, previously
posted by Daniel Almeida.

The previous version of the patch series can be found here:

	https://patchwork.freedesktop.org/series/164580/

Branch with patches applied available here:

	https://gitlab.freedesktop.org/lyudess/linux/-/commits/rust/gem-shmem

This patch series applies on top of drm-rust-next

Patch-series wide changes since V15:
* Fix some major rebasing errors I somehow didn't notice :(
* Drop the dependency on LazyInit, use the trick that Alice suggested
  instead.
* Fix dependency ordering so that Tyr can get the vmap stuff first
  without the other bits.
Patch-series wide changes since V16:
* Fix ordering one more time (SetOnce::reset() doesn't need to come
  before adding vmap functions)
* Rebase against the latest DeviceContext changes from me that got
  pushed.

Lyude Paul (4):
  rust: drm: gem: shmem: Add DmaResvGuard helper
  rust: drm: gem: shmem: Add vmap functions
  rust: faux: Allow retrieving a bound Device
  rust: drm: gem: Introduce shmem::Object::sg_table()

 rust/kernel/drm/gem/shmem.rs | 511 ++++++++++++++++++++++++++++++++++-
 rust/kernel/faux.rs          |  16 +-
 2 files changed, 512 insertions(+), 15 deletions(-)


base-commit: fea3a2dd7d3fc1936211ced5f84420e610435730
-- 
2.54.0

