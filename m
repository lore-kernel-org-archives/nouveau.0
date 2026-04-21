Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0159BF94CB8
	for <nouveau@archiver.kernel.org>; Tue, 21 Apr 2026 23:42:58 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A78F810EDE7;
	Tue, 21 Apr 2026 23:42:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HNZ6FTMh";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E648D45AB4;
	Tue, 21 Apr 2026 23:30:49 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1776814249;
 b=V8dHBK06VeGX/rfawIUIjplDpPkIuX/Ji7AwtXjsj871f+d8MhFoPJ5YMgJe+Flyf3goW
 uFPdRWWP81+C9aOpiUCNJf9fH6baVfxJYiO+IN9G2vue+hHJhVGHzCxbPT8ugfHdU0mfTUU
 Rz9RfBRdbi+SGGVKAtj1xkAztWWdEi82eAJ87UZAUADD5N4BtmEuxUg26NJomKaPpYVQLC1
 bE20wmbb2GCSBpswmcnrxUChrgp0tWVVlmvuQ7WpDNAHs0qe3AduuSozMx2RcKUipzPQuOU
 scUf8sdoGMB9/Cc/rfkeExFzD6otvGSG9D6t0vHebAJ4hGykZwtbpHJKOQww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1776814249; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=WX8GF8QjZYpTHNcCIWqfIkVacO9JeuGdxARtANDN6u8=;
 b=jYaTtTxdI/mS7jwjx4/ap1mXZ/yl+tPY7OiUQ1ZGAOtS2vThd4SgW1hSbdUW1vTLqk392
 QeWZBb+fuifgjS8Qx7EHwALVizhVHiswmY7EbIEf18VEbv5uS5DdAL0+LEaEI15q2aGb/1M
 bjDur7ulxfwFbO9EqNSfAnheKf3fQU/fdfZ+VNgE0YbcokLabFLqvPl9SnjeRcswY2oNShb
 dNye/FzzPS31eL2B5vmJT7xYAyfJpn+6LIJyAxkEIvVKbnIGAoMQ2hcNquK6Xxu/43VOOZi
 mkXIpu5pURIPhdLU+M1n6XcUJ/YZyiYSRBDMcrSZOIXRBYUwcdWImdpslYGA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C4CA545AA5
	for <nouveau@lists.freedesktop.org>; Tue, 21 Apr 2026 23:30:47 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2209110E243
	for <nouveau@lists.freedesktop.org>; Tue, 21 Apr 2026 23:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776814974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WX8GF8QjZYpTHNcCIWqfIkVacO9JeuGdxARtANDN6u8=;
	b=HNZ6FTMhax9dCBEOMCnG22s5jLNUdKy8MykAaguwpYvoGD8aR6iyLiaUfzPvPK+R3bnDxY
	+GjrXEsKMRQ9QQQHz5MEZuhoIKTYsxmMigOpVjmF+wYSAEwo3gBPCz4SV/5EKpk3SD62E5
	AEcwklWwdLCESMESkslOQtMGGOWh3z4=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-97-b8tNv6ojN6uyujB6V__tuw-1; Tue,
 21 Apr 2026 19:42:52 -0400
X-MC-Unique: b8tNv6ojN6uyujB6V__tuw-1
X-Mimecast-MFC-AGG-ID: b8tNv6ojN6uyujB6V__tuw_1776814969
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C61061956048;
	Tue, 21 Apr 2026 23:42:48 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.80.14])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 19A041800660;
	Tue, 21 Apr 2026 23:42:44 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	Gary Guo <gary@garyguo.net>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v11 1/5] rust: drm: gem: s/device::Device/Device/ for shmem.rs
Date: Tue, 21 Apr 2026 19:40:37 -0400
Message-ID: <20260421234234.638503-2-lyude@redhat.com>
In-Reply-To: <20260421234234.638503-1-lyude@redhat.com>
References: <20260421234234.638503-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: knWb-xaJ8vL3vEpDt9F6JQb30hnnXAHSdGl3r7IHCm8_1776814969
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: XOBMBCQAAJW6TVGKNSYNPUZ2EIHV5PEF
X-Message-ID-Hash: XOBMBCQAAJW6TVGKNSYNPUZ2EIHV5PEF
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XOBMBCQAAJW6TVGKNSYNPUZ2EIHV5PEF/>
Archived-At: 
 <https://lore.freedesktop.org/20260421234234.638503-2-lyude@redhat.com/>
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

