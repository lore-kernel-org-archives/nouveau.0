Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E24E1CD6E49
	for <nouveau@archiver.kernel.org>; Fri, 29 May 2026 18:37:21 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BC1B51123E1;
	Fri, 29 May 2026 18:37:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="AWL719ZJ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2EE96466C7;
	Fri, 29 May 2026 18:23:50 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1780079030;
 b=DN28kw0ws7CaylXueb3/ZuCQYrB96OLoyMUUbtFRtCQ1FUWJAcg1Q/aKLsvU6M302cx/0
 Im3EinzdiGAu3XQATzb5lH2lB3SpXgwY1wUlyX7nAdf6+cgVdG84e2jO+V4oR4TsfUzrYcv
 0EJUCd3KMNx/G0JtOyFpxtjjfc+V1ADRJsKKVGtNgDz8McDbeLG+L53lSJYm+7jmMIM9SyF
 38qhGFoyql3vD10uWbBY3vVIKY0i4uTA/TBvDgkpLGrGKWRDKjndL8qsy57ZTNxznhWtOmi
 SPScxF7nFZbAPRoY/cCVvram97AQd9Jf0R92E7jjHfWRpNBba+3w3p6/Nj/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1780079030; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ibOzZZ9MbBgPCsyeHLx7hx/XOPF768dDk7bOGh7vXek=;
 b=hh2SD+h1r0R6Hj1rRNuOKEDXvP6OehmZPZ2s+ASJ0XtzQmwOPKmMk6pOJQz15au+tIZmL
 cZ8UXhLWiCxuDj/rxzbb/g2t+1EjSy9dmyGExZ2SK+0cRSDzHcuh+7SlO7D75fOYMqwy4Kq
 ihH1Goy0euNtUZ5DoxugJ0xt5GxmjnW186nrz+6xon7VKLaIHXJ7HKGqKqxm0t8AYLP38ed
 3ICUbS+wrY+QSG2dYf5gOm2GJ19XR+yIn7kB1QwNgUI1ecJKFWDC2/3GBqfLwzrv6LIH77Q
 1HoXeAp/cr5628bHCB2Wr6RKLfq3PRQJo/O4VXNpEHR8soTGQEY+BxqhX+tA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 04D2942910
	for <nouveau@lists.freedesktop.org>; Fri, 29 May 2026 18:23:47 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD241123CF
	for <nouveau@lists.freedesktop.org>; Fri, 29 May 2026 18:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780079837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ibOzZZ9MbBgPCsyeHLx7hx/XOPF768dDk7bOGh7vXek=;
	b=AWL719ZJT3mk1ARtRTH7xXY5+MH+0jRoutrZhOe0mrVrR5MuBtIvTJtmaiKl0qdqua3IkC
	F2H5loCn4ua47grgbEHxt/UnUiFM6D340w/Nd148uIUb2ER4a4DKEKiCT606dz/pdxPLsZ
	yudxKIOtjonG7zTMEv7RDlIb8OdCdFw=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-641-N3PmdtkkNv6foI_0vejyiA-1; Fri,
 29 May 2026 14:37:13 -0400
X-MC-Unique: N3PmdtkkNv6foI_0vejyiA-1
X-Mimecast-MFC-AGG-ID: N3PmdtkkNv6foI_0vejyiA_1780079830
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 81E7019560AE;
	Fri, 29 May 2026 18:37:09 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.89.101])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 9C43B1688;
	Fri, 29 May 2026 18:37:05 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v15 0/6] Rust bindings for gem shmem
Date: Fri, 29 May 2026 14:33:58 -0400
Message-ID: <20260529183702.677677-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: WROaDPFzN_IWQVoL02oMVDAaEsue7Xr4MRtwdUaGLNc_1780079830
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: BCNZDLUNXZ3TV7A2BX42E7X3RHBC2ZY2
X-Message-ID-Hash: BCNZDLUNXZ3TV7A2BX42E7X3RHBC2ZY2
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BCNZDLUNXZ3TV7A2BX42E7X3RHBC2ZY2/>
Archived-At: 
 <https://lore.freedesktop.org/20260529183702.677677-1-lyude@redhat.com/>
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

This patch series applies on top of drm-rust-next with the following
dependencies applied:

	https://lore.kernel.org/rust-for-linux/20260529173137.303717-1-lyude@redhat.com/T/#t

Lyude Paul (6):
  rust: gem: shmem: Fix Default implementation for ObjectConfig
  rust: drm: gem/shmem: Add DmaResvGuard helper
  rust: drm: gem: Add vmap functions to shmem bindings
  rust: faux: Allow retrieving a bound Device
  drm/gem/shmem: Introduce __drm_gem_shmem_free_sgt_locked()
  rust: drm: gem: Introduce shmem::Object::sg_table()

 drivers/gpu/drm/drm_gem_shmem_helper.c |  32 +-
 include/drm/drm_gem_shmem_helper.h     |   1 +
 rust/kernel/drm/gem/shmem.rs           | 497 ++++++++++++++++++++++++-
 rust/kernel/faux.rs                    |   7 +-
 4 files changed, 512 insertions(+), 25 deletions(-)


base-commit: 0e42ec83d46ab8877d38d37493328ed7d1a24de8
prerequisite-patch-id: c8ade07eec6e9c9e875800b114137c459d362e4e
prerequisite-patch-id: c38da06dbc4cfd2589bf2e7e9f0ebaa4da521ddf
-- 
2.54.0

