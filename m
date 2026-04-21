Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFFCCF94CB6
	for <nouveau@archiver.kernel.org>; Tue, 21 Apr 2026 23:42:59 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D75C910EDEE;
	Tue, 21 Apr 2026 23:42:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="SSVOhbJ5";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 38ADB45AB0;
	Tue, 21 Apr 2026 23:30:51 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1776814251;
 b=hbGrUgyWVhwCcSnuCxdVPkHeJIoLokoCWbLPhB6msom/PaZdZR0GNUoka5W60TZ2ZABJQ
 kDn9jNcqyVMaopt68u6o7ZCPE4/dw9QYENz/Jt+Aok+C6DkVyDbJJ4DVAJFMRXwbiJo/s+Q
 m+njHWAabF2cCfkFZhR9D4ORzxStpbWNjOqn4p7CHV4XteqbqwnWvKZzhEGnsgrVIVr0wns
 Enl1dduLk4nl/pl7tzBbB8AEbX0SSCCaSNtwQcDVzPvFdl3IaUlGFlwDTjpFaROB8FO5bFa
 +2xptgdcwlp86T3lYW9n53dOwrlyEzkZdZvOOZx/Qc6Rv6q61jhMUoSfv9Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1776814251; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=oqhU59Gz5v6faIGUOxDc3K6Gyrpk7Nle6UXoLaHqK3o=;
 b=H2z6NIFeNzjh0XQHCbuJeyj3KixtB+wO4CH3pUjShMhqL8vDZtL2ZDRy5jq4T6v48nyaM
 7hUxKk7NbRuf62nyjgx3ysnDKhHkpJosNcxvB1R+lxMxMJv1PMibHrZuLkf2afEatQ5gfmK
 zzouKKv4O6S3ESVSMGtnd6JZ1XEhyME4sCOfQ75G7RLL016/VlS/Dldy9DuICCnotBVgeuY
 fQFmwthgyYVI8m9E1QotyK2D1PVw1mOQo9Lfoi3Myk235geDQ1jFJfKIPFpCFwFCJEDQN5W
 QI+ddE/0UkQmfZQ1j7DkKyEHUQgaIUaf3xgxRCUrFjcs+aN6/Eb17gMahuVg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id D38B545AA5
	for <nouveau@lists.freedesktop.org>; Tue, 21 Apr 2026 23:30:47 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 345CA10E940
	for <nouveau@lists.freedesktop.org>; Tue, 21 Apr 2026 23:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776814974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oqhU59Gz5v6faIGUOxDc3K6Gyrpk7Nle6UXoLaHqK3o=;
	b=SSVOhbJ5Htaj/5xPui5ice6ACx892JSo5bPUOkGYvvMg3c2cHa8YZidvEOF/kggbpswe40
	bdhXfGaGGo2G/64zIhYoGGA3o60/jb8yG7opo4myzUVI69KYxMUOTjdCSKJe4csexzS4jS
	43FzczmH9hoajMlR3rKKDLksP2+3XoA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-144-RBsNdtxFMcWVaeJL4WEyrQ-1; Tue,
 21 Apr 2026 19:42:48 -0400
X-MC-Unique: RBsNdtxFMcWVaeJL4WEyrQ-1
X-Mimecast-MFC-AGG-ID: RBsNdtxFMcWVaeJL4WEyrQ_1776814965
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D6742180049F;
	Tue, 21 Apr 2026 23:42:44 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.80.14])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id C66601800352;
	Tue, 21 Apr 2026 23:42:40 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	Gary Guo <gary@garyguo.net>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v11 0/5] Rust bindings for gem shmem
Date: Tue, 21 Apr 2026 19:40:36 -0400
Message-ID: <20260421234234.638503-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: msrBi0E_LTvixS2-YoiB8bQENCOuO1HJQYHVtH6zw3Y_1776814965
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: 3PFQC6LXHXRLKNST6BLTEXLO6SGL2RXW
X-Message-ID-Hash: 3PFQC6LXHXRLKNST6BLTEXLO6SGL2RXW
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3PFQC6LXHXRLKNST6BLTEXLO6SGL2RXW/>
Archived-At: 
 <https://lore.freedesktop.org/20260421234234.638503-1-lyude@redhat.com/>
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

Branch with patches applied available here (+ a hack required to make
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

