Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84359F94CB7
	for <nouveau@archiver.kernel.org>; Tue, 21 Apr 2026 23:54:09 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3388510EDF1;
	Tue, 21 Apr 2026 23:54:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="A0E2V9Dv";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7CCC145ABA;
	Tue, 21 Apr 2026 23:42:01 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1776814921;
 b=cjKbqW4ob8C1myzp32acU9eMhBs81pjQnZSAbqB3WWZpoYAjlEJ4AYcx+OZWfkoiv8xhQ
 2EuQx7ANvUhSjUWaW+uYLNytbuYGrK9D1ueVa624V+y/p1aqJAhZLfssbZhLC5JymInc2FD
 /iSx2auoAScMAzMLm4bVMqfj+KxoTx5gS9qlqv3lYjAMQ6XCXFErRBLez5R9ILPeflidhyI
 h1Z0dD+GbQbh7Qa+PRljC0JyjkfBiT3JF0LFMS9DR/YVtrluYxvXDm1GvinDQFIwh/Sumql
 DUA1rNmiy9zQQXJ4+IVn9heKrJsPz1vESCklF3sg1YI2cE2FWx9mn/hU71tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1776814921; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=+BYMBbkpws+Rj/0scMeX8uDdxWKOZ93iimn7i+E8GpA=;
 b=gM4/mzMzvOGKotm0RH1Dx1rAN+DR/7cFhkErykC7Gk9A7VCONVv4U6PnvCYX1qtyVv1HP
 xJgqvCOLs0jYaGU6BV6EoxZNBmDo4uQPbvQczSuzAU6IN+0sEfRGR2yVksqhc/gsgt26C8q
 7fKTYDz3EIWu67z9XBK8wsCajtzH61phWwfY8f4xfqRiU5yX0hWMBfTBbQoQuJN7CYNHS9F
 CVguS0ptJ4WuVBGUuZMKfNjlylMq6nAqxgfz3ebhOf1ZJ1KbQO63ryDZEGyoghVplqN6jk3
 yCSQ1ZB9FKKUjHQMHjvnQFPxGP/AhazJRP0/f26c0IwUmOxbT4keiM7ICilw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 5837545A9A
	for <nouveau@lists.freedesktop.org>; Tue, 21 Apr 2026 23:41:58 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AD36210EDF1
	for <nouveau@lists.freedesktop.org>; Tue, 21 Apr 2026 23:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776815644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+BYMBbkpws+Rj/0scMeX8uDdxWKOZ93iimn7i+E8GpA=;
	b=A0E2V9Dv0MnkM1QDYOytljDU6pVGjpNdevM8vdddEpgh48bvpqPem4pr7Vkj1fd2mFE4A5
	tA1wh8y6/VqBTMCkmQyubp5SvO3MzmTfLdFLSEJ3La8V7JNPja5N5pf2emvNPtHGrYSNQv
	J8xFaXsADoCDSONPgwY5zc/B4Wl6w/A=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-581-N9uCqpu1OdOzIC0jHt74LQ-1; Tue,
 21 Apr 2026 19:54:01 -0400
X-MC-Unique: N9uCqpu1OdOzIC0jHt74LQ-1
X-Mimecast-MFC-AGG-ID: N9uCqpu1OdOzIC0jHt74LQ_1776815638
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E913B1956089;
	Tue, 21 Apr 2026 23:53:57 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.80.14])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 2551219560AB;
	Tue, 21 Apr 2026 23:53:54 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	Gary Guo <gary@garyguo.net>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v12 0/5] Rust bindings for gem shmem
Date: Tue, 21 Apr 2026 19:52:12 -0400
Message-ID: <20260421235346.672794-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: lhBZULx2J9PQcH14XTqUMRc08228YU2By0vDvmYTjdo_1776815638
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: 2TOUVU5X2LJIZAZ6TB3RLKDUSZLJMMLC
X-Message-ID-Hash: 2TOUVU5X2LJIZAZ6TB3RLKDUSZLJMMLC
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/2TOUVU5X2LJIZAZ6TB3RLKDUSZLJMMLC/>
Archived-At: 
 <https://lore.freedesktop.org/20260421235346.672794-1-lyude@redhat.com/>
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
  drm/gem/shmem: Export drm_gem_shmem_get_pages_sgt_locked()
  rust: drm: gem: Introduce shmem::SGTable
  rust: drm: gem: Add vmap functions to shmem bindings

 drivers/gpu/drm/drm_gem_shmem_helper.c |  48 ++-
 include/drm/drm_gem_shmem_helper.h     |   2 +
 rust/kernel/drm/gem/shmem.rs           | 557 ++++++++++++++++++++++++-
 3 files changed, 593 insertions(+), 14 deletions(-)


base-commit: a7a080bb4236ebe577b6776d940d1717912ff6dd
-- 
2.53.0

