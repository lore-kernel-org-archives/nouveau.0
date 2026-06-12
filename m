Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9FF5CD98CE
	for <nouveau@archiver.kernel.org>; Fri, 12 Jun 2026 19:45:20 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B5F7210F6B9;
	Fri, 12 Jun 2026 19:45:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FTcTjBE2";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E63C246AC6;
	Fri, 12 Jun 2026 19:31:17 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1781292677;
 b=WRcIM+Y9s/voF7DUVBQ+kNe2S3a9Klrlpc+XM7uAdUoEUWuu5NiTPS9qr7g5mYmWNoqAf
 Vj7Ui/6fHVYdRxsAcagWy13mHr8hsi32lxZyiSr6sWZ9wfGtlHkTvRe+5MqZuryImhZVtaE
 L9psec+AN+qzFA2glIYo01hHcHhyF7SzPYzSgVbwzGg9qhVR+ztbZvdQqATRN3ngWQB6FVZ
 1I450jxSL8kTxrSDHiCOomHPF0mozukQNeMBbjez/3kSad5d8LZM3yVGrrPpnCur8+sQQun
 xU7LBkgDMcoJlahrGguUhea4kvWfT9m8eiCUoEI4gzFCh8MDwmmRFU10/Mqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1781292677; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=jH7WUYCnp8lST50wG3qHB+zJyF17LXEHKeUG3k6Hlao=;
 b=BPyUY7UUXFR/8Klmpk0dWmCQZKgKI83O3gHFInnXuTwfQWcTTocn+gGD4EbZ33mUNk59b
 I9217YPj0DMhB1udKPujyJd9oqUxV82oW00MA4GpO4vSv1EYU9IgoOH8CG4OHtQ62S9BdDC
 lyKd+v4wrFFhiJlObx8ziaxzuUOkuTeBAd4+mwXM3lQrw/VS1kiY2nIeKNeMG60q/m6l79s
 fcAD6JYf58nbJa2x/aRPtRpykI+QjWVyglouS8F5irqQbFZH9s2vjus85pHDJhOJ1AHxgNN
 BoNRdW9b87JxYFVrRd0aQk2xfNzwNH6p8ZRKVJquX2HXLxlR95Dm4Mj8oMTQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 29E51460F9
	for <nouveau@lists.freedesktop.org>; Fri, 12 Jun 2026 19:31:16 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3B8D910F6B6
	for <nouveau@lists.freedesktop.org>; Fri, 12 Jun 2026 19:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781293517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jH7WUYCnp8lST50wG3qHB+zJyF17LXEHKeUG3k6Hlao=;
	b=FTcTjBE2kPbsrhMywT2N0GhYksJniD6HZK9GhyOpKs1XlBeJamsy8I3QTzBrbQmnLH+J92
	wNqZczMoT8TpRculJMwKAivKoihtJmW1LLMOPWDJC0Ly4RdaaVgu7lamz+Li8kxZKZyxxA
	cKyegf8WupFNlXQbfm6OCWeuUdBzNf0=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-322-2odDrzL8O3m7csOZFvRjeg-1; Fri,
 12 Jun 2026 15:45:11 -0400
X-MC-Unique: 2odDrzL8O3m7csOZFvRjeg-1
X-Mimecast-MFC-AGG-ID: 2odDrzL8O3m7csOZFvRjeg_1781293508
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D8F0F1956065;
	Fri, 12 Jun 2026 19:45:07 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.80.21])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 347BB1686;
	Fri, 12 Jun 2026 19:45:04 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v21 3/4] rust: faux: Allow retrieving a bound Device
Date: Fri, 12 Jun 2026 15:43:35 -0400
Message-ID: <20260612194436.585385-4-lyude@redhat.com>
In-Reply-To: <20260612194436.585385-1-lyude@redhat.com>
References: <20260612194436.585385-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: p58hVKW4xVY0IMsIZPC88GucZdUpl_IPBVxBYDX34r8_1781293508
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: BVZSJQLE43TTAV55XDBCHXIX65O4R5SG
X-Message-ID-Hash: BVZSJQLE43TTAV55XDBCHXIX65O4R5SG
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BVZSJQLE43TTAV55XDBCHXIX65O4R5SG/>
Archived-At: 
 <https://lore.freedesktop.org/20260612194436.585385-4-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

When writing up some rust code that used faux devices for unit testing, I
noticed that we never actually added the Bound device context to
faux::Registration's AsRef<device::Device> implementation. This being said:
the Registration object itself is proof that a driver is bound to the
device - so this should be safe.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Acked-by: Danilo Krummrich <dakr@kernel.org>

---
V18:
- Add notes from Danilo to safety comment.
V21:
- Quote all code in comments with backticks.

 rust/kernel/faux.rs | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/faux.rs b/rust/kernel/faux.rs
index 43b4974f48cd2..36c92ae2943c0 100644
--- a/rust/kernel/faux.rs
+++ b/rust/kernel/faux.rs
@@ -25,7 +25,8 @@
 ///
 /// # Invariants
 ///
-/// `self.0` always holds a valid pointer to an initialized and registered [`struct faux_device`].
+/// - `self.0` always holds a valid pointer to an initialized and registered [`struct faux_device`].
+/// - This object is proof that the object described by this `Registration` is bound to a device.
 ///
 /// [`struct faux_device`]: srctree/include/linux/device/faux.h
 pub struct Registration(NonNull<bindings::faux_device>);
@@ -59,10 +60,17 @@ fn as_raw(&self) -> *mut bindings::faux_device {
     }
 }
 
-impl AsRef<device::Device> for Registration {
-    fn as_ref(&self) -> &device::Device {
-        // SAFETY: The underlying `device` in `faux_device` is guaranteed by the C API to be
-        // a valid initialized `device`.
+impl AsRef<device::Device<device::Bound>> for Registration {
+    fn as_ref(&self) -> &device::Device<device::Bound> {
+        // SAFETY:
+        // - The underlying `device` in `faux_device` is guaranteed by the C API to be a valid
+        //   initialized `device`.
+        // - `faux_match()` always returns 1, and probe runs synchronously
+        //   (PROBE_FORCE_SYNCHRONOUS).
+        // - `suppress_bind_attrs = true` on faux_driver prevents userspace-triggered unbind via
+        //   sysfs.
+        // - `mem::forget(Registration)` is not a problem; if the `Registration` is leaked, the faux
+        //   device stays bound forever.
         unsafe { device::Device::from_raw(addr_of_mut!((*self.as_raw()).dev)) }
     }
 }
-- 
2.54.0

