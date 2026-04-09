Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E296810FC45F
	for <nouveau@archiver.kernel.org>; Thu,  9 Apr 2026 00:17:10 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B05FF10E727;
	Thu,  9 Apr 2026 00:17:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CPWNVxgN";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D7AF8457BE;
	Thu,  9 Apr 2026 00:05:31 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775693131;
 b=JP6KRQWVzvZ1Xn2F/TR0QKnJxC7++G8vyAKVaEyFWYb/iQqQCw6Aoue1T9P/Prhdi0Id4
 2pLkG//VuZuwsoHCg+2+9J0bmFxP8rOZRUvgCqPSiAg5M7/SeHOJcptI3hDuj3V/jyTEr/l
 pWz4NjAYzEmFv2MCPCLICk5z/9E/1mlouWVJ3NFhnhqsypJoRnBcwGw9+B637xGF/VTWin+
 CmQHhp02s+3f6vS6rScrAL1U5YZssdFZooG8kvnit2OAP49a1an3AvDAIsR5czC7uFmu3Lz
 8dLAtYlEf7KyYwxBCoNq2PEH+Ij1PIIY7CrC+jt4XNSBmHzE77fLhWSlZ+SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775693131; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=nQ/kkld0vtHaBT8o/y52woZ43HcqsBt739q7XOTr3PI=;
 b=oJy06xqtbh31CRg9LicMWX/uS3M5sTCfunbe9383PoXmaxs7xnNfVcqme+0nJdL529f2w
 ahmL59EZUSffob4p+ygEC2B36lil9THTeFfcDhuKNOiRHrLbi7PmNVLwGqJz+vcTt1FUnC3
 w5mOBy3oEKJxyrAr4jXJnWCOWY6nhhmmGqfgPhEHbPEL5BR5J0Nt2mRFOA5D+htmSXmwJ/y
 jZ+jsYuXeP2c8P+LGAvGhXVeKKJb4MnReUgjlTRxyrT3ljudC03kvHDOdUt3EA2NBf2ZNzC
 Kq/+MrvJYYq6HrFJcsgkNhuGQegxz0jDk/UA9nObdTh5w7WCRdsAUIEocAfw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 11CD1400AE
	for <nouveau@lists.freedesktop.org>; Thu,  9 Apr 2026 00:05:29 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9A35810E71F
	for <nouveau@lists.freedesktop.org>; Thu,  9 Apr 2026 00:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775693827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nQ/kkld0vtHaBT8o/y52woZ43HcqsBt739q7XOTr3PI=;
	b=CPWNVxgNKJdDpV+gUVfpWDQJmcqZIfn9L9R0iKgYNXdyjMk5Z4HS0hc03JXlSV8dXbogp+
	5GBEL3ysfsazLxj9bgutyA7QTyZxTITa+yhm+3GBnW1DB5bYNKs0IUdwLVkb/WSpN4QZ/E
	TsDzAPZTR6wHlAzfeMsL7QCVjab234U=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-295-dV8j-oK_Ml2tpKVB0cpQdw-1; Wed,
 08 Apr 2026 20:16:11 -0400
X-MC-Unique: dV8j-oK_Ml2tpKVB0cpQdw-1
X-Mimecast-MFC-AGG-ID: dV8j-oK_Ml2tpKVB0cpQdw_1775693767
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 03DAB1956060;
	Thu,  9 Apr 2026 00:16:07 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.80.49])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id D91AA300019F;
	Thu,  9 Apr 2026 00:16:02 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	Gary Guo <gary@garyguo.net>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v10 0/5] Rust bindings for gem shmem
Date: Wed,  8 Apr 2026 20:12:46 -0400
Message-ID: <20260409001559.622026-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: yFVkLRYuv7sjrcP3KJnbOdrQHiVELyYmF3AL4lt4rTk_1775693767
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: O35ULWMSDRYTPTMY2WDK4H52Q6EQ5EWU
X-Message-ID-Hash: O35ULWMSDRYTPTMY2WDK4H52Q6EQ5EWU
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Matthew Maurer <mmaurer@google.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, christian.koenig@amd.com,
 Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Krishna Ketan Rai <prafulrai522@gmail.com>, linux-media@vger.kernel.org,
 Shankari Anand <shankari.ak0208@gmail.com>, Benno Lossin <lossin@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Asahi Lina <lina+kernel@asahilina.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/O35ULWMSDRYTPTMY2WDK4H52Q6EQ5EWU/>
Archived-At: 
 <https://lore.freedesktop.org/20260409001559.622026-1-lyude@redhat.com/>
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

(apparently it mistakenly was not sent to dri-devel, so no patchwork ):

	https://patchwork.freedesktop.org/series/156093/

Branch with patches applied available here (+ a hack required to make
sure this builds:

	https://gitlab.freedesktop.org/lyudess/linux/-/commits/rust/gem-shmem

Lyude Paul (5):
  rust: drm: gem: s/device::Device/Device/ for shmem.rs
  drm/gem/shmem: Introduce __drm_gem_shmem_free_sgt_locked()
  drm/gem/shmem: Export drm_gem_shmem_get_pages_sgt_locked()
  rust: drm: gem: Introduce shmem::SGTable
  rust: drm: gem: Add vmap functions to shmem bindings

 drivers/gpu/drm/drm_gem_shmem_helper.c |  48 ++-
 include/drm/drm_gem_shmem_helper.h     |   2 +
 rust/kernel/drm/gem/shmem.rs           | 553 ++++++++++++++++++++++++-
 3 files changed, 590 insertions(+), 13 deletions(-)


base-commit: a7a080bb4236ebe577b6776d940d1717912ff6dd
-- 
2.53.0

