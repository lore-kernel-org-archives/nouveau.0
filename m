Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39AE8CD8CB2
	for <nouveau@archiver.kernel.org>; Wed, 10 Jun 2026 16:24:55 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 630DA10EA4D;
	Wed, 10 Jun 2026 16:24:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XdQKWR+K";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 675B8469F1;
	Wed, 10 Jun 2026 16:10:55 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1781107855;
 b=Lk9j21+n8EStd+y+SXRCoqmSlxyZ58IVPRWBhaxA8R0GUZH9V66ItcX4n8EmgyRcnOhe5
 9XUpPpGhFIW0hbVXKqJUxsUaXVxBA83AlcGLZlHpUBUvK2mfev2mbs53SSC9xifFLOX+hHC
 kjnQJKr3htZokqKymLm1tzZk9XwDMKEgntgOs/XGW77gn9MhMT98OcYQ5YJXKeBPAiVwM7c
 K5ZnMwHJKy2RMzS6pDXvqKwkYWN5ze5jaQYZ+htt/PG5CuSp21nGbzS8M3umcdv3NG2Iabe
 WTGLpejbd8Ps29mOTJNnvqLXuNUPMQIgHYPuUbuWyGYEUw0bWjxt0v5YnRyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1781107855; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=aJZSLKFmwdVxL+9TcEJu6Qfawm5t/bukKEPwYVEKRRQ=;
 b=eaaQ7LaYQzl/FZ3eXvcF8f8x1RGwJ5T+6koyCyS20nhycixSyfbjVulhwdE8QegC/7wOV
 kgO8ebBP1xAG+eaiNvuHHAPfcHLRDvn2n+U0RaehbW2Kiy7MWn11lslbkPPkxRPORBLIh8l
 oz8fGVUopHBZygiBdloYmpNMCjOBg369+lH7U4RGrBYoggBX/rNOAKWkCLVSvTxN5vTZ8W3
 pyUCliFjJZERjioUJ8s2dq8E/5DEBIslwVx5SxZ5wClFgI8pVwcb3VGUkZzU0EQz5YjOWc+
 pWARGolSMH02ZvvdNJ4PBjd+hacby/W9vX1KG7kTJAHct/TVjlfMJBwQAaiw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 74E7F4602E
	for <nouveau@lists.freedesktop.org>; Wed, 10 Jun 2026 16:10:52 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 19DEA10E4C5
	for <nouveau@lists.freedesktop.org>; Wed, 10 Jun 2026 16:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781108689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aJZSLKFmwdVxL+9TcEJu6Qfawm5t/bukKEPwYVEKRRQ=;
	b=XdQKWR+KsjW+qSNxJ/dl5P0T/eMmkz4GoAFg9mbbm2Exx3NqPuTKlziUbmic6Qd+vSRy2I
	szEjJDM5pPnRKbUCaVExAd4vndl9CqPj7elOQqcpXKVsj9sNj9RfgBQ0MTFT5t64/H2cDi
	UMZ14w/OtSnn/V9u/FNRtmNg6oja0Mo=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-586-g2kUAiG7PSW8nIaPg6uKmg-1; Wed,
 10 Jun 2026 12:24:45 -0400
X-MC-Unique: g2kUAiG7PSW8nIaPg6uKmg-1
X-Mimecast-MFC-AGG-ID: g2kUAiG7PSW8nIaPg6uKmg_1781108682
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2C937195FE08;
	Wed, 10 Jun 2026 16:24:41 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.89.69])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 5696F3008DC3;
	Wed, 10 Jun 2026 16:24:37 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v20 0/4] Rust bindings for gem shmem
Date: Wed, 10 Jun 2026 12:21:27 -0400
Message-ID: <20260610162433.923550-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: MOUb-kvkcnWSNV8vhJCLO_dZSt2SVUHyhFmKN8NhEoQ_1781108682
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: W76KJYE4UWK7LMV5AQTOFQX7E2FDALDL
X-Message-ID-Hash: W76KJYE4UWK7LMV5AQTOFQX7E2FDALDL
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/W76KJYE4UWK7LMV5AQTOFQX7E2FDALDL/>
Archived-At: 
 <https://lore.freedesktop.org/20260610162433.923550-1-lyude@redhat.com/>
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
Patch-series wide changes since V20:
* Lots of Sashiko fixes, excluding the comments that I couldn't prove
  weren't just bogus.

Lyude Paul (4):
  rust: drm: gem: shmem: Add DmaResvGuard helper
  rust: drm: gem: shmem: Add vmap functions
  rust: faux: Allow retrieving a bound Device
  rust: drm: gem: Introduce shmem::Object::sg_table()

 rust/kernel/drm/gem/shmem.rs | 546 ++++++++++++++++++++++++++++++++++-
 rust/kernel/faux.rs          |  16 +-
 2 files changed, 546 insertions(+), 16 deletions(-)


base-commit: 848bf57e98e1678ce7a49eb4e0bf0502da95dc07
-- 
2.54.0

