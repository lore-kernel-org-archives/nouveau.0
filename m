Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E751CD5BB1
	for <nouveau@archiver.kernel.org>; Tue, 26 May 2026 21:29:33 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C394310E57E;
	Tue, 26 May 2026 21:29:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NcT7XqoW";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A46494646E;
	Tue, 26 May 2026 21:16:07 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1779830167;
 b=g3fmpPy+hdjjr2gCYxUrx48t2VabvFx+8CR34N7nyFlmMyUtjEGbmuTae1n5WxLhBoYuV
 DcK7ZatrmgtcMnYAYRHEhhEhqzZRKRNOyKcRspl6/LBQMQ282p+w0doucPcNnVHN/RUHOil
 rG+Kd0WLa4PGWAUAftM+TlCyNxvOgus9pTSGaZFtuzm5NIoLXXHOhsZPQXY0hhoskR9XrRK
 c+61l5EHbAAv8HGbBvhuLQXWeky7Srym/QzLLuE/Fe+8n4nWB7qg8htTv4ZSK9X29xq06Dh
 VB9zO3k2/ptKU1s2uCeYpDPGb9JzkkcRPHBt27fJXmyH1a/bel/CLCxwVGiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1779830167; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=dGTPG3QEQJmlnLPRQxC3z6rB8s3h7HSZZcCP8Kz7ue8=;
 b=k7Xl3c+eh9ynwwX2FSirXGdxfMcnr6YcPXHYYeJi1/PEDy4eGlCzp7bMo/nHg/vX4wEkx
 FHv3u18JoVJcLROsNa/WbejmRsU6pSbEMIYwjyiXaK643cF5PhpMFDYXVC95NMkYbKox6i8
 7wy3Rsa8GGFO6m4miFbGxkLlSjg1fDgC/K4fA0B43DCPb3kUpmKT5n+mcgyn40+WcrI6MKK
 wXSxCQEdHInWzU2ZFq+UbpEKFN234exUXXswSidAQzgTWbWOdETjlFOcMsSkyNw+IWwO3cG
 3s1TC9xTIxGZjyYy/bKRC0r3PclrL98KpkqTQ7+GBeR0Gvc5awD/++0wXt+w==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 9319546463
	for <nouveau@lists.freedesktop.org>; Tue, 26 May 2026 21:16:05 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6E96E10E57F
	for <nouveau@lists.freedesktop.org>; Tue, 26 May 2026 21:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779830969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dGTPG3QEQJmlnLPRQxC3z6rB8s3h7HSZZcCP8Kz7ue8=;
	b=NcT7XqoWY09f2Ql2ipGFDS5D3etEu5hwrkmp/wtlJd448dkyauL2miSLGlRHsmeS8DtQXi
	2MH+uuRf0wCxPV9vH3KvW4rOUUyBsj49q7RKYzmRbdLdCEHZmepbYytbWv7QNEROeTnrxH
	l1wz+w2cmzP24wRKsYI6RV2Zb8Es0vk=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-690-LsvWmM20M52MIdIkOVigtg-1; Tue,
 26 May 2026 17:29:23 -0400
X-MC-Unique: LsvWmM20M52MIdIkOVigtg-1
X-Mimecast-MFC-AGG-ID: LsvWmM20M52MIdIkOVigtg_1779830960
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3F77C19560B7;
	Tue, 26 May 2026 21:29:20 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.64.238])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 7065130001BE;
	Tue, 26 May 2026 21:29:16 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v14 3/6] rust: drm: gem: s/device::Device/Device/ for shmem.rs
Date: Tue, 26 May 2026 17:28:54 -0400
Message-ID: <20260526212857.1158294-4-lyude@redhat.com>
In-Reply-To: <20260526212857.1158294-1-lyude@redhat.com>
References: <20260526212857.1158294-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: bogd8xp7f_iHMVcDeVYSst_Qbd1aJ5jBjn6NwXopKDw_1779830960
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: XKTJQT2AFYUEVKIHRWGGMHQHHTYCGDUC
X-Message-ID-Hash: XKTJQT2AFYUEVKIHRWGGMHQHHTYCGDUC
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XKTJQT2AFYUEVKIHRWGGMHQHHTYCGDUC/>
Archived-At: 
 <https://lore.freedesktop.org/20260526212857.1158294-4-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

We're about to start explicitly mentioning kernel devices as well in this
file, so this makes it easier to differentiate the two by allowing us to
import `device` as `kernel::device`.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

---
V11:
* Fix location of //

 rust/kernel/drm/gem/shmem.rs | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index 8b7de136ab1f9..116ed0a13eac2 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -12,10 +12,10 @@
 use crate::{
     container_of,
     drm::{
-        device,
         driver,
         gem,
-        private::Sealed, //
+        private::Sealed,
+        Device, //
     },
     error::to_result,
     prelude::*,
@@ -115,7 +115,7 @@ fn as_raw_shmem(&self) -> *mut bindings::drm_gem_shmem_object {
     ///
     /// Additional config options can be specified using `config`.
     pub fn new(
-        dev: &device::Device<T::Driver>,
+        dev: &Device<T::Driver>,
         size: usize,
         config: ObjectConfig<'_, T>,
         args: T::Args,
@@ -157,9 +157,9 @@ pub fn new(
     }
 
     /// Returns the `Device` that owns this GEM object.
-    pub fn dev(&self) -> &device::Device<T::Driver> {
+    pub fn dev(&self) -> &Device<T::Driver> {
         // SAFETY: `dev` will have been initialized in `Self::new()` by `drm_gem_shmem_init()`.
-        unsafe { device::Device::from_raw((*self.as_raw()).dev) }
+        unsafe { Device::from_raw((*self.as_raw()).dev) }
     }
 
     extern "C" fn free_callback(obj: *mut bindings::drm_gem_object) {
-- 
2.54.0

