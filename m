Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D92C2F94CBA
	for <nouveau@archiver.kernel.org>; Tue, 21 Apr 2026 23:54:13 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7691810EE02;
	Tue, 21 Apr 2026 23:54:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NflhBzz9";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C602D45ABB;
	Tue, 21 Apr 2026 23:42:05 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1776814925;
 b=KaqvnLy5VEF0wWw05e1CXSh+N1qTCO0WITT0wq6OSIddU8TN1DMoN8Yrj8jz0IIowP7CZ
 IQ/UxpDL1pJFVof84JcA0fYfXbB9t0qbUzofbfakBjvCCvxaMtBJatwOabAimjrRfsg62Vc
 i2AU6tdiHzcjNufLK5kwC2oIvtkl7brr7hHNGef+6N7WXEvn32q6ScsthioS9m7zwAjgu3r
 3oUD5N563VdDqGZjl9keJQl2FY1RZcK/6Z9fA7J7PA+9+H7WauLjd5t5GAjiGy4EFImDfHp
 l0eQqVzeVJNwZfCy/K9zD5N1zt+w/rAM1h2bUcOV8Q4cHi12A8zHeCa/PgOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1776814925; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=WX8GF8QjZYpTHNcCIWqfIkVacO9JeuGdxARtANDN6u8=;
 b=ESAJIi10Nx9ZGl2Z88m929vd3Y1HmuULtrdUL1rf+EYFf3qCLME22xcrp0Eu6HgezvQdN
 D6RZ1d7y8SB9rElRZqBUxImkUtOcJTaKbgDVz+BcKoji/zlJ1Nb/XJs7LW+xQk7awOIgiXt
 et+bf+yw7CQHyndIqhuBAhgc5o0eL4zaa46a8BfGBY4DxaqCvLGhbuCaJli+Zhfd0i9VBPy
 /rhe5JhQGxXTjATzaCmcVbxefUWB+7zDyf4jvpbEADZzSq2s3HrNqUVHLxTFADTI8mG9WkD
 7mUyG9uiPy68TKl3uOe94F4u/v4+4mU7kJbWXIU4wSdGcmJsKsQhSxc8OW0A==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id EC6D545A9A
	for <nouveau@lists.freedesktop.org>; Tue, 21 Apr 2026 23:42:02 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5189910EE00
	for <nouveau@lists.freedesktop.org>; Tue, 21 Apr 2026 23:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776815649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WX8GF8QjZYpTHNcCIWqfIkVacO9JeuGdxARtANDN6u8=;
	b=NflhBzz9cFe79Vzk1UCb+HIhaG0JRauPUQh7TH2qmOSP1rfSvTeG73p1b85k4VnHNkCIvg
	TkE4Do5lquOjSjogvXalmlLNsGO9EmDaQdQb793D229dnv07fWrOW1nr/Qcuh0Cgq/BX20
	sSfvhX8s96LRSjvKc4Tx45mOpIUCVlE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-360-uGwGoLk5NX6KhymuEd-clA-1; Tue,
 21 Apr 2026 19:54:04 -0400
X-MC-Unique: uGwGoLk5NX6KhymuEd-clA-1
X-Mimecast-MFC-AGG-ID: uGwGoLk5NX6KhymuEd-clA_1776815641
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A2B1C18003F6;
	Tue, 21 Apr 2026 23:54:01 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.80.14])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 234821956095;
	Tue, 21 Apr 2026 23:53:58 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	Gary Guo <gary@garyguo.net>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v12 1/5] rust: drm: gem: s/device::Device/Device/ for shmem.rs
Date: Tue, 21 Apr 2026 19:52:13 -0400
Message-ID: <20260421235346.672794-2-lyude@redhat.com>
In-Reply-To: <20260421235346.672794-1-lyude@redhat.com>
References: <20260421235346.672794-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: bnZGgCLhU73ZqteUy6Wc7At74AZn42EB-9NSFazXWqA_1776815641
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: Z622UAQQVQ57KI2X4ASETI4JIGOB65T4
X-Message-ID-Hash: Z622UAQQVQ57KI2X4ASETI4JIGOB65T4
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/Z622UAQQVQ57KI2X4ASETI4JIGOB65T4/>
Archived-At: 
 <https://lore.freedesktop.org/20260421235346.672794-2-lyude@redhat.com/>
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
index d025fb0351954..11749c36e8695 100644
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
@@ -108,7 +108,7 @@ fn as_raw_shmem(&self) -> *mut bindings::drm_gem_shmem_object {
     ///
     /// Additional config options can be specified using `config`.
     pub fn new(
-        dev: &device::Device<T::Driver>,
+        dev: &Device<T::Driver>,
         size: usize,
         config: ObjectConfig<'_, T>,
         args: T::Args,
@@ -150,9 +150,9 @@ pub fn new(
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
2.53.0

