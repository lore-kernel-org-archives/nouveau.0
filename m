Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4852CD5BB1
	for <nouveau@archiver.kernel.org>; Tue, 26 May 2026 21:29:21 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 19E8810E5F8;
	Tue, 26 May 2026 21:29:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RXH/dmAI";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id DE4D146466;
	Tue, 26 May 2026 21:15:55 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1779830155;
 b=XLaNXS5alSqz50LLRJi4ekqNo35yGZaqd3WcRrINKXynK5nnMA/ScKTsEBi69P4U36Q+L
 3Dok2dqjaNJhKURGjImyIc4gwS2SJOVczcJaadBH8vfv4UEvwc0phTLGEaJUoQnYZuZpjU6
 y1OVXOkLTw+Ta3w576Z3iHgJRrAeNNvsixcWIG9fcMC30LMkhjhv9J1hkLczOwdxpY6Wt2i
 yKetKa+LQnOjEoEl4tYLSZd7+w6UO/CGAkZXiYsD+6VJ3VNSZR/ifHV+y7Eij1Hw+vOLGGt
 uXrUeVu1vAEeanHOmE5Ul/WYZFXEhS8B4nnSQ2M9d3I+mCUfnEM5M0MQNg6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1779830155; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=UeKDht6hynwmyvVnnx2NrDn4vXJFoG7xglLiWdTdkKo=;
 b=dfiz1X9JEp1jpEdfPJEPOWXJOZjqYjDmxJOefoZakNUlMBhDzb0zxb0QzrSO00O9MmOjI
 FoXSMpCcTOEpPuB787hId8kr3sXVx8OevM8FJqziASLMCp/Rlon+PrsHVAvbhZVc4wvbQ8b
 OErb8lBD2AL/X09apf4qDUuAS39YT18/GfcOmhXpfwUftapYVqK9fO5cZN2/0Zd7lxs3CFI
 bRVB8yxMe2MmKF9uaoO1q3qtFxPNNtWUP5IW29Jm2+9Zj7UNM/CeDbam32S3vRU8tfZ1Ibm
 da+Dkr+L/eP7Cd77z+IwDkeFOK8h8uGrRG2u6nQtl7kiXXGHo5dw5dAoyOSw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id DE92F4641C
	for <nouveau@lists.freedesktop.org>; Tue, 26 May 2026 21:15:53 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B0CE210E25A
	for <nouveau@lists.freedesktop.org>; Tue, 26 May 2026 21:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779830958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UeKDht6hynwmyvVnnx2NrDn4vXJFoG7xglLiWdTdkKo=;
	b=RXH/dmAIWT8I5B9teT3nW5P1lbihDJf9hSKopWwF1hgPQA9BPoUe/by+phoQ+KgoOn91wg
	HGpzp5bJSEXF7JB0jUH3g5BndKF6mUAQ5ruR8V8+CtORbMewFRz4XfvCmLRdlwZn180Qcj
	u89yAk29Q93tIzlKXfaJwEJ85qhZMdM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-380-fu2eY1SLOO-o5GiefNWvRg-1; Tue,
 26 May 2026 17:29:12 -0400
X-MC-Unique: fu2eY1SLOO-o5GiefNWvRg-1
X-Mimecast-MFC-AGG-ID: fu2eY1SLOO-o5GiefNWvRg_1779830949
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9DBEB19560AE;
	Tue, 26 May 2026 21:29:08 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.64.238])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id D130A30001BB;
	Tue, 26 May 2026 21:29:04 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v14 0/6] rust: drm: gem: shmem: Add sg_table() function
Date: Tue, 26 May 2026 17:28:51 -0400
Message-ID: <20260526212857.1158294-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: wejOkBv_w1AybFBioO0yDsWVSamfeYuFYFufmz4v-Mo_1779830949
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: EVK3544XBPJPRKMSMBX4L4UR6PUI4Z6X
X-Message-ID-Hash: EVK3544XBPJPRKMSMBX4L4UR6PUI4Z6X
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/EVK3544XBPJPRKMSMBX4L4UR6PUI4Z6X/>
Archived-At: 
 <https://lore.freedesktop.org/20260526212857.1158294-1-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

(was previously Rust bindings for gem shmem)

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

	https://lkml.org/lkml/2026/5/26/1960

Lyude Paul (6):
  rust: faux: Allow retrieving a bound Device
  rust: gem: shmem: Fix Default implementation for ObjectConfig
  rust: drm: gem: s/device::Device/Device/ for shmem.rs
  drm/gem/shmem: Introduce __drm_gem_shmem_free_sgt_locked()
  rust: drm: gem/shmem: Add DmaResvGuard helper
  rust: drm: gem: Introduce shmem::Object::sg_table()

 drivers/gpu/drm/drm_gem_shmem_helper.c |  32 ++-
 include/drm/drm_gem_shmem_helper.h     |   1 +
 rust/kernel/drm/gem/shmem.rs           | 264 +++++++++++++++++++++++--
 rust/kernel/faux.rs                    |   7 +-
 4 files changed, 279 insertions(+), 25 deletions(-)


base-commit: 2cf1840b0fa7637b6731fd554529f8d57ea34c04
prerequisite-patch-id: c8ade07eec6e9c9e875800b114137c459d362e4e
prerequisite-patch-id: dc4f750bc885b867842587b994261f43602bc6a8
-- 
2.54.0

