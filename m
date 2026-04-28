Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 399B7FF886F
	for <nouveau@archiver.kernel.org>; Tue, 28 Apr 2026 19:06:38 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E1E6610EC88;
	Tue, 28 Apr 2026 19:06:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Zf574Vom";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2E16A45C81;
	Tue, 28 Apr 2026 18:54:14 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777402454;
 b=wZFLhNV5JKSBNlxDiU8v7Mj8kJ7b4VmRjMxM4vZTNyV4HuLWLx3Q2+XM7IOJbrN7SX9q5
 696L/OZISmgHsbF7jml3wtEHxKLCzmeP1oUy/BXKUlRGoHjVko6WAt5HIQzJls05ENUlczK
 6CfMkFc+JKtt+fe1/whcPUXsIgeIniCrb7ws3/Nm22c+X94oTDJPp4Wlx6zhW1axp2ZVNY6
 qd2RQkKfD7zAeiDxyTBMnBAFharSLWRCtWDNasFq+1Lc8MVl0vbNwUun5tlR/G/LJKw3X8B
 utR1jAFe46ANv8ZVY+Pesp8XxvAgJZk7pYQadOYK8Tn4UiqHeZfqb9ea0apA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777402454; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=EzRtTH2IupIIuuQqKZWkz6pIEFHqs7DdB+TxYzhYcw4=;
 b=qMCiAl4GPyjB0PhsVVt+2RmZcYvDxwo802EOCzbAjgOXtxO6appdXvkhgDtEm1Wyct8+a
 VUZTAy9kgU4Qbee/38T1Yq+WbOcQs+oYBuc+aLtkodvquAveceDM34Qtp7z1iimmrkBrPMt
 J/CWFwonWSA/+DBfBBO5nV3mQthcYz+ZwTloPKNSxtWaI3o3kB3N0K/V4Mb1jL7p04eMvTT
 HGyodiHjwXzIBxTwJf6OYi1vn6oiuS1Z9qMyfrP9ff0aRRBPqW6Tzsj2q6cEVUnSuEXcqT3
 Nejj4qzMy1htkl+KoL2rq3yZur3eVcYzVB0phDTcYgYcM5EEzstzHOQKQYGQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 7AA5D45C7C
	for <nouveau@lists.freedesktop.org>; Tue, 28 Apr 2026 18:54:12 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id ECFAD10E377
	for <nouveau@lists.freedesktop.org>; Tue, 28 Apr 2026 19:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777403194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EzRtTH2IupIIuuQqKZWkz6pIEFHqs7DdB+TxYzhYcw4=;
	b=Zf574VomQTJ4anm2TbwnxHC8II8o6VOY7xzuzIB3oLDYdAjMAP1sxzp8gJtkX7Bhd994BW
	Y9mi7QgxuwbGaxMEIvoJwzpyOI6l9EC3+zRHce3zlmPsv7GvW08ynuUM3icKWlW1/w8UfU
	23GOHANj55k0F1DGkBao6UQPKfd5h1s=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-693-yTNhVo9ZMqWGEWj1e-SHNQ-1; Tue,
 28 Apr 2026 15:06:31 -0400
X-MC-Unique: yTNhVo9ZMqWGEWj1e-SHNQ-1
X-Mimecast-MFC-AGG-ID: yTNhVo9ZMqWGEWj1e-SHNQ_1777403188
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A9C1619560A6;
	Tue, 28 Apr 2026 19:06:27 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.88.40])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 19ECF1800351;
	Tue, 28 Apr 2026 19:06:23 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	Gary Guo <gary@garyguo.net>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v13 1/5] rust: drm: gem: s/device::Device/Device/ for shmem.rs
Date: Tue, 28 Apr 2026 15:03:41 -0400
Message-ID: <20260428190605.3355690-2-lyude@redhat.com>
In-Reply-To: <20260428190605.3355690-1-lyude@redhat.com>
References: <20260428190605.3355690-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: fHaDdsvMaH9Qi8qkZgJkaC6X9TjIPRt7L05r0c-cok0_1777403188
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: T72AFIO5C5PEFUI3SC4IPZHJYPFYFZ2U
X-Message-ID-Hash: T72AFIO5C5PEFUI3SC4IPZHJYPFYFZ2U
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/T72AFIO5C5PEFUI3SC4IPZHJYPFYFZ2U/>
Archived-At: 
 <https://lore.freedesktop.org/20260428190605.3355690-2-lyude@redhat.com/>
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
index e1b648920d2f6..35d7523e164ff 100644
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
@@ -106,7 +106,7 @@ fn as_raw_shmem(&self) -> *mut bindings::drm_gem_shmem_object {
     ///
     /// Additional config options can be specified using `config`.
     pub fn new(
-        dev: &device::Device<T::Driver>,
+        dev: &Device<T::Driver>,
         size: usize,
         config: ObjectConfig<'_, T>,
         args: T::Args,
@@ -148,9 +148,9 @@ pub fn new(
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

