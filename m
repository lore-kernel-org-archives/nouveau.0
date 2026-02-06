Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0DFBEE6B6C
	for <nouveau@archiver.kernel.org>; Fri,  6 Feb 2026 22:35:37 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E39D010E957;
	Fri,  6 Feb 2026 22:35:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OupzJrFC";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C7B3C41BC7;
	Fri,  6 Feb 2026 22:26:13 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770416773;
 b=UGoibwbRJd6wpDEBq94Qdnf18HN/4lsV9qbtGEAxHk0AmGZ6FSVHokXjfC8FYWUNG7hS9
 3lWN7c4dOQlb50syGzBx/IBFISCWuSwbEX32/0e1oIVdRmuufFTtbr/mQiYyg1td2SwFW2c
 s5pB/VIbTqCagvz/zt9H+tB9U8Yr/7mZp0S6A+sxmOLODdE/xI+TJznC2+tBcSRB8NPOcoo
 iWT/1c7S5GFzWxd0WcdYUSbm640c2ynSPW9I4GygoRjbF6mS+hn79kIYCBPbaVVQg5jZT0g
 Gchol10IzNSUtW+01lVQAFmLGcM9KMEwdy8vXchaC6eNJvXq8s/sezI7LONw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770416773; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Le3aiYwi9QA3jxc/i9wr8UlZrE+EEzProIFjlbUe4qA=;
 b=RbcC3Mi4s3FxLIDB7RQhpu/RDBdcI3twiprQTNwg82n/NWyyN+CQB37E8vSmZB4b+sU8l
 LCajBRkRBuotpizFv5AokwPWFp5Lqq9JxYBzsxODodGV/I69i6byoLv0xFcJMF5P5ArFOeP
 fmRnlci3S9cYY2AWhVgzw7An7x6weDx4p2NWC/wjnNXI3Vx9ZYmDvE0J56OEc3ZF4CH+8cK
 9NjuEx2SHu5zRZvlWkriBCXRo2Bwx5f2tzpiQ9wTOuSwUojinbvdH/Z/wetseEEJmjBwHv+
 usK/0UCquAweFAXck9ItLCOEjPcd0M7Qp7z2WJiLo5j+Yb9V0NyEJxnO0oEA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 0773A4055F
	for <nouveau@lists.freedesktop.org>; Fri,  6 Feb 2026 22:26:10 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CC73010E94D
	for <nouveau@lists.freedesktop.org>; Fri,  6 Feb 2026 22:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770417332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Le3aiYwi9QA3jxc/i9wr8UlZrE+EEzProIFjlbUe4qA=;
	b=OupzJrFC+gTDBK5OVXDdlNKIRveVdfdTJX1YbUIFavmbfSgwNcw5eAaS3S+U9Qw6AQCNkl
	/jc/aqCDjgf0PUMeJioJo4sp65xftsaP8k7Nhyfp51KU/Q6HmZAAa/vmcs/HE4CbortsXd
	HL7IwFnGWJT9wTf5SnfHLpnbZgqB8DA=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-515-4jPKyixaMymbbkTAC_xJwA-1; Fri,
 06 Feb 2026 17:35:28 -0500
X-MC-Unique: 4jPKyixaMymbbkTAC_xJwA-1
X-Mimecast-MFC-AGG-ID: 4jPKyixaMymbbkTAC_xJwA_1770417327
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 800E41955F27;
	Fri,  6 Feb 2026 22:35:26 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.64.226])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id D357619373D8;
	Fri,  6 Feb 2026 22:35:24 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v7 0/7] Rust bindings for gem shmem + iosys_map
Date: Fri,  6 Feb 2026 17:34:24 -0500
Message-ID: <20260206223431.693765-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: U0rAv3MhcBdpzWfUAgjGAu9TqopFthHBoykiBl3-VHw_1770417327
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: W3M3AROSXMTEXAY34Z2X34NBO5FEKKIO
X-Message-ID-Hash: W3M3AROSXMTEXAY34Z2X34NBO5FEKKIO
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org,
 Daniel Almeida <daniel.almeida@collabora.com>, Gary Guo <gary@garyguo.net>,
 Benno Lossin <lossin@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Janne Grunau <j@jannau.net>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/W3M3AROSXMTEXAY34Z2X34NBO5FEKKIO/>
Archived-At: 
 <https://lore.freedesktop.org/20260206223431.693765-1-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This is the next version of the shmem backed GEM objects series
originally from Asahi, previously posted by Daniel Almeida.

One of the major changes in this patch series is a much better interface
around vmaps, which we achieve by introducing a new set of rust bindings
for iosys_map.

The previous version of the patch series can be found here:

https://patchwork.freedesktop.org/series/156093/

This patch series may be applied on top of the
driver-core/driver-core-testing branch:

https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git/log/?h=driver-core-testing

Changelogs are per-patch

Asahi Lina (2):
  rust: helpers: Add bindings/wrappers for dma_resv_lock
  rust: drm: gem: shmem: Add DRM shmem helper abstraction

Lyude Paul (5):
  rust: drm: gem: Add raw_dma_resv() function
  rust: gem: Introduce DriverObject::Args
  rust: drm: gem: Introduce shmem::SGTable
  rust: Introduce iosys_map bindings
  rust: drm/gem: Add vmap functions to shmem bindings

 drivers/gpu/drm/nova/gem.rs     |   5 +-
 drivers/gpu/drm/tyr/gem.rs      |   3 +-
 rust/bindings/bindings_helper.h |   3 +
 rust/helpers/dma-resv.c         |  13 +
 rust/helpers/drm.c              |  56 +++-
 rust/helpers/helpers.c          |   2 +
 rust/helpers/iosys_map.c        |  34 +++
 rust/kernel/drm/gem/mod.rs      |  28 +-
 rust/kernel/drm/gem/shmem.rs    | 467 ++++++++++++++++++++++++++++++++
 rust/kernel/iosys_map.rs        | 210 ++++++++++++++
 rust/kernel/lib.rs              |   1 +
 11 files changed, 815 insertions(+), 7 deletions(-)
 create mode 100644 rust/helpers/dma-resv.c
 create mode 100644 rust/helpers/iosys_map.c
 create mode 100644 rust/kernel/drm/gem/shmem.rs
 create mode 100644 rust/kernel/iosys_map.rs


base-commit: 21bab791346e5b7902a04709231c0642ff6d69bc
prerequisite-patch-id: c631986f96e2073263e97e82a65b96fc5ada6924
prerequisite-patch-id: ae853e8eb8d58c77881371960be4ae92755e83c6
prerequisite-patch-id: 0ab78b50648c7d8f66b83c32ed2af0ec3ede42a3
prerequisite-patch-id: 8d20a8db8cf4660c682ee91f3db04e640c144e33
prerequisite-patch-id: 299de9cd2789c19c22e2816f7c817d80d5a4f1db
prerequisite-patch-id: 661ee334905f359daa8fb8d808ed5f4a8085f5c9
prerequisite-patch-id: 05aef545e564948160354e498a3d3c5fd5bbfacb
-- 
2.53.0

