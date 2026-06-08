Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B11BCD6E79
	for <nouveau@archiver.kernel.org>; Mon,  8 Jun 2026 18:31:22 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7F64010F89A;
	Mon,  8 Jun 2026 18:31:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="KHfsWk/5";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id BB55146871;
	Mon,  8 Jun 2026 18:17:27 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1780942647;
 b=oOE5iw9iTBFlDG7tb1A5tISBWYHZHrtx2K5fRVOtybQZT/3A12KgKFZMfN4k539SX2pgv
 DPoSVy8jBSlM2pb+XdQZD5dJFLZvpNR/2VUzD1VPmN18SyuBlEm3k4CIbRaubSviZWM3rc8
 ywSrukRsj0wjc24vexcRglakTmgZiBeLLaVokwh8uV0R4GDvwXlVD/q4NLJRyxRgXTnJcd1
 lUNhYhE1P9NlhvbTiXTefk0qeRejvDCiCh0NiZe7RR919rukBWAEzxIw+Y9HmAccuorI+V7
 F5ImEFt+3Gbj6AD9SfnP4hu8GXWTdtawUEYC6zSBXjl7tPI1ffI0nvDw+m9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1780942647; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=VvkqqMaR/p4iNrcFd0EO2fuLaTlmARCcel/DKCsLETI=;
 b=mL/mYNDof1lQbABeV0Xl2wlfQB7S/Uz0RchIVKz5mijyeAMy64sm+vTRtHHYcj13iCv8b
 TtG1a0SXohbWFaVMgTPvq1Uqu8n9vbsQvJPzeFppfuME0EaJVxPhfAy9Ktb4ejHh7NdP/5m
 HkahHfjaSztUS3227tJsj5nfOgrW3ROk2gwr+F1Ujg4ObozauZWcJ8vfjfVNrfyHiXCKn97
 l7tKvl8auprpvC6Mfo7j3qSYL+1uHaVVuzo1nfu+eVnEZJNsU5NA4L3FzUVgU/bsii0pNkR
 LtBwBpBNkPE6gJE8EC4CyaSQmL9Jjq/ezhD7SdHAEn5mar8anTY41ic6HJNw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 9C9EB467EF
	for <nouveau@lists.freedesktop.org>; Mon,  8 Jun 2026 18:17:25 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0E1F610F892
	for <nouveau@lists.freedesktop.org>; Mon,  8 Jun 2026 18:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780943478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VvkqqMaR/p4iNrcFd0EO2fuLaTlmARCcel/DKCsLETI=;
	b=KHfsWk/5aB9C2NBgfkXxPftIxdAFJL3foq4yGrkx9U6SOHlCZ5YQPJ+Ql6i48kI4xHcsxi
	01q9mHxhE2INMyu7PgBh81/8qu+tJMg/KVUtbMJCDYlKAaKeincf+LMrEsMuKtVioFL7n+
	BCuI1sGnC/4jU8xPaNvBzl43pVc+2L4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-398-btYvUMdhNxmvG4gFfxuJCg-1; Mon,
 08 Jun 2026 14:31:12 -0400
X-MC-Unique: btYvUMdhNxmvG4gFfxuJCg-1
X-Mimecast-MFC-AGG-ID: btYvUMdhNxmvG4gFfxuJCg_1780943469
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A77BD18307E5;
	Mon,  8 Jun 2026 18:31:08 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.89.147])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 23F951800594;
	Mon,  8 Jun 2026 18:31:04 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v19 1/4] rust: drm: gem: shmem: Add DmaResvGuard helper
Date: Mon,  8 Jun 2026 14:29:01 -0400
Message-ID: <20260608183057.2001376-2-lyude@redhat.com>
In-Reply-To: <20260608183057.2001376-1-lyude@redhat.com>
References: <20260608183057.2001376-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: -DO43siSrqZiH6gf2cGOOzWaKFDO1mF3680Hez8Vc_g_1780943469
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: XP7BLTTO35CIKTHCXD2AFW3UKK7BA32C
X-Message-ID-Hash: XP7BLTTO35CIKTHCXD2AFW3UKK7BA32C
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XP7BLTTO35CIKTHCXD2AFW3UKK7BA32C/>
Archived-At: 
 <https://lore.freedesktop.org/20260608183057.2001376-2-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Just a temporary holdover to make locking/unlocking the dma_resv lock much
easier.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Co-authored-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

---
V17:
* Fix format of commit message title
V19:
* Add NotThreadSafe to DmaResvGuard

 rust/kernel/drm/gem/shmem.rs | 39 ++++++++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index 084b798ce795b..da1acc223bad4 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -22,7 +22,10 @@
     error::to_result,
     prelude::*,
     sync::aref::ARef,
-    types::Opaque, //
+    types::{
+        NotThreadSafe,
+        Opaque, //
+    },
 };
 use core::{
     marker::PhantomData,
@@ -30,7 +33,10 @@
         Deref,
         DerefMut, //
     },
-    ptr::NonNull, //
+    ptr::{
+        self,
+        NonNull, //
+    },
 };
 use gem::{
     BaseObjectPrivate,
@@ -244,3 +250,32 @@ impl<T: DriverObject, C: DeviceContext> driver::AllocImpl for Object<T, C> {
         dumb_map_offset: None,
     };
 }
+
+/// Private helper-type for holding the `dma_resv` object for a GEM shmem object.
+///
+/// When this is dropped, the `dma_resv` lock is dropped as well.
+///
+// TODO: This should be replace with a WwMutex equivalent once we have such bindings in the kernel.
+struct DmaResvGuard<'a, T: DriverObject, C: DeviceContext = Registered>(
+    &'a Object<T, C>,
+    NotThreadSafe,
+);
+
+impl<'a, T: DriverObject, C: DeviceContext> DmaResvGuard<'a, T, C> {
+    #[inline(always)]
+    #[expect(unused)]
+    fn new(obj: &'a Object<T, C>) -> Self {
+        // SAFETY: This lock is initialized throughout the lifetime of `object`.
+        unsafe { bindings::dma_resv_lock(obj.raw_dma_resv(), ptr::null_mut()) };
+
+        Self(obj, NotThreadSafe)
+    }
+}
+
+impl<'a, T: DriverObject, C: DeviceContext> Drop for DmaResvGuard<'a, T, C> {
+    #[inline(always)]
+    fn drop(&mut self) {
+        // SAFETY: We are releasing the lock grabbed during the creation of this object.
+        unsafe { bindings::dma_resv_unlock(self.0.raw_dma_resv()) };
+    }
+}
-- 
2.54.0

