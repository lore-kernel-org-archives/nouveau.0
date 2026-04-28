Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDABEFF885A
	for <nouveau@archiver.kernel.org>; Tue, 28 Apr 2026 19:06:36 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A69A810EB30;
	Tue, 28 Apr 2026 19:06:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="b0JDgDeG";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E00D545AC5;
	Tue, 28 Apr 2026 18:54:13 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777402453;
 b=KviQrIc/v2DBlGXiXW6SyBIf6VATk9TuG5HoPVZ54exOWyrd/gqDMSGMBK8M4FURo7adM
 jVt/IA/HkOfIKHkn/zN9qApq6OodVIRgZ0bntVHEcJSDzfqXezegFPnM7SuqJ1WBiZvwL5m
 cPmtl6jjSwJKNGz/3Ni0/e4wXiRP6w2ZR9i3A9v6BuOUfW/7+GkO8dIZ0MAhr4bq7wam3Wo
 4Hmx5OmsZDpfFtMXzb33Ap22A1BD/4P9DlfLZv96lH7P0S8vntnkb9/5ecIACu/b00mcq7P
 goE3i5yjqifAaseyYlaew0+roAryTAj5yciiF+uQ2qBkFVDh4No8d+Gpg0EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777402453; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=pNUOUDk7TvFf6N8DNlBRG1fyLPLqIsmFG8XfE2Cjk0g=;
 b=IOOv4VOI8FykBtaKhwYxyhjtuMrcvkc3il7SBwcEoBu5hl/8sPUWWrcXTsrbYpMwRb6DC
 PbSiOA7KvD/hxRELBAgJdFbLzdo4puG/JnCBVUf7uztYaGFyF7nMolFAKYycAeDHLnHelvV
 ZgM5LCPLTUFi8Wm1OYkHM0lANbh++Tv+8NSFzfkVzMAov9bfsGZbdCnyuT1dBz8fWsqel6B
 +0bgbikg9MEdXBkJrugs4O6DWRgcA8CsqDeYlfxa/3srW+MT8D9PfecNHPS9Vzz1DRk3V/t
 p+zkp+pKm0oN9KMMQ+LWR0IAR6NQ0su/WvLZFhYKOishEj7/MtJ2jMI6QKqQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 659E645563
	for <nouveau@lists.freedesktop.org>; Tue, 28 Apr 2026 18:54:10 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C21F610E0C0
	for <nouveau@lists.freedesktop.org>; Tue, 28 Apr 2026 19:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777403191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pNUOUDk7TvFf6N8DNlBRG1fyLPLqIsmFG8XfE2Cjk0g=;
	b=b0JDgDeGI3rqVDKghyOl9uEzya8uO9CM4nuO7od0vtFZ+eM4NZwiFm6mCp+Jye4CT/ws4r
	1EWgjckXp7W2F2RcU6UQEoQG6Qrn4fGAq6miQhlquc5khIE4WS1Wowm0jJvwx0VyqO2MuW
	7vO+BTmttGVHG19Ffi3SFMFb0q+B68s=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-220-L7g3Gq0XO7q1A3hwReHsWQ-1; Tue,
 28 Apr 2026 15:06:27 -0400
X-MC-Unique: L7g3Gq0XO7q1A3hwReHsWQ-1
X-Mimecast-MFC-AGG-ID: L7g3Gq0XO7q1A3hwReHsWQ_1777403184
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D1F5C19560AA;
	Tue, 28 Apr 2026 19:06:23 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.88.40])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 08824180047F;
	Tue, 28 Apr 2026 19:06:19 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	Gary Guo <gary@garyguo.net>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v13 0/5] Rust bindings for gem shmem
Date: Tue, 28 Apr 2026 15:03:40 -0400
Message-ID: <20260428190605.3355690-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: ZVg9XfKDnWBgYAAguigebn8zWzlLCZd4ymajzfsQU-I_1777403184
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: 2Z5ARXVTFDS22NK2QFPJXXL6ZE4J5BID
X-Message-ID-Hash: 2Z5ARXVTFDS22NK2QFPJXXL6ZE4J5BID
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/2Z5ARXVTFDS22NK2QFPJXXL6ZE4J5BID/>
Archived-At: 
 <https://lore.freedesktop.org/20260428190605.3355690-1-lyude@redhat.com/>
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

Branch with patches applied available here
sure this builds:

	https://gitlab.freedesktop.org/lyudess/linux/-/commits/rust/gem-shmem

This patch series applies on top of drm-rust-next

Lyude Paul (5):
  rust: drm: gem: s/device::Device/Device/ for shmem.rs
  drm/gem/shmem: Introduce __drm_gem_shmem_free_sgt_locked()
  rust: drm: gem/shmem: Add DmaResvGuard helper
  rust: drm: gem: Introduce shmem::SGTable
  rust: drm: gem: Add vmap functions to shmem bindings

 drivers/gpu/drm/drm_gem_shmem_helper.c |  32 +-
 include/drm/drm_gem_shmem_helper.h     |   1 +
 rust/kernel/drm/gem/shmem.rs           | 602 ++++++++++++++++++++++++-
 3 files changed, 614 insertions(+), 21 deletions(-)


base-commit: d9a6809478f9815b6455a327aa001737ac7b2c09
-- 
2.54.0

