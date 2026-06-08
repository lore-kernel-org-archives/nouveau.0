Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 484E8CD6E79
	for <nouveau@archiver.kernel.org>; Mon,  8 Jun 2026 18:31:19 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1ED5710F88D;
	Mon,  8 Jun 2026 18:31:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OLijiRQB";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5FEF94686F;
	Mon,  8 Jun 2026 18:17:25 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1780942645;
 b=x6DkxBEU7uaECyshmfzRmPQ7dhe1mZPiz4Z9IAY7PYDhMom8ow2cfz142d396/62ys5Db
 xiBslDc/WZvndPyEIiiBH3BT7Z26qjbnvoF9ZmkUO5qTZ98MhElvpBhx0NQbX6k+LVWb0Lc
 Zp08ZcqMPEcgu6FFsXiz9JUczLrdbUax8cuuAbuDdtNGP89axrSjLQh5laIc58KtcXxdXfU
 cY33HIDpFC1olMfMDiPVsrFM5brKVi1hvsOTC+EOBEySwzcj5qsDhjB5rnjHz9YycTNJV3d
 jK/HBWTi2DisiuL/7D01WUVz9KXj1u16Aqod6nzdxUJwPSH/Y+Vp84h8LAKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1780942645; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=7lwmbZSn0l8FPiJDFk/A5NQSCW82dnUY+6uz9EhsTgo=;
 b=D6W3lOZmz5BwlZxcFImbxG+gRfLE1czk+Io25nwhphdZKK7Qc6CslSlrL3CXBEB3urV2b
 M7kEsKrPqwdrsRCgbQAANDneAY/sgzDDO0sr7aL6jionhRdBQd4pfL0Rl39RwDi5WC72af4
 hEWtzeud4nUXnmzzg4iae5a7vlt+6FJShjDk6IDHDQ8usamu+C6yF9H3UKYU7rkE96rm7Mw
 e+DvDLy/E9ZWIVsTkJJHPpELxCrL63B7hlTmn92Q+sCEbXXNQ1HHUHwep5AEXvS8t2KJGSa
 CG1IQlE23uuZzMDNoDBRqGOmMxz7MRaaXNCDbg3dvzyTxaFvKKR38v+AehKg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id CC4AA467EF
	for <nouveau@lists.freedesktop.org>; Mon,  8 Jun 2026 18:17:22 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4137B10F88F
	for <nouveau@lists.freedesktop.org>; Mon,  8 Jun 2026 18:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780943475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7lwmbZSn0l8FPiJDFk/A5NQSCW82dnUY+6uz9EhsTgo=;
	b=OLijiRQB2t7T5NIeuBwLB05AakCAkANjdKPvz3oJmuthbp6RRyPafF677ceWEHlEKEHNym
	BdvF7Uosh2HaRofjqhZCVIBZvMXDapof4ow6b/oiElbx2b+LfEh1AOw3AS63Bkzh/RoqgN
	/nfasUnrk1wflJOazcZK36hJ/RxmMOw=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-137-SjUk026bMRWQhqhJK6xgsg-1; Mon,
 08 Jun 2026 14:31:10 -0400
X-MC-Unique: SjUk026bMRWQhqhJK6xgsg-1
X-Mimecast-MFC-AGG-ID: SjUk026bMRWQhqhJK6xgsg_1780943465
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C3151187BE00;
	Mon,  8 Jun 2026 18:31:04 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.89.147])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id EC778180058F;
	Mon,  8 Jun 2026 18:31:00 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v19 0/4] Rust bindings for gem shmem
Date: Mon,  8 Jun 2026 14:29:00 -0400
Message-ID: <20260608183057.2001376-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: TpYhDVzQD9Tv_M7X_2VV3CG09u1kwdWH-j4v43YnAh4_1780943465
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: 2QSTY3YM7X2JLOKBO5YJG6NWHA7NTD5S
X-Message-ID-Hash: 2QSTY3YM7X2JLOKBO5YJG6NWHA7NTD5S
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/2QSTY3YM7X2JLOKBO5YJG6NWHA7NTD5S/>
Archived-At: 
 <https://lore.freedesktop.org/20260608183057.2001376-1-lyude@redhat.com/>
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

 rust/kernel/drm/gem/shmem.rs | 524 ++++++++++++++++++++++++++++++++++-
 rust/kernel/faux.rs          |  16 +-
 2 files changed, 524 insertions(+), 16 deletions(-)


base-commit: fea3a2dd7d3fc1936211ced5f84420e610435730
-- 
2.54.0

