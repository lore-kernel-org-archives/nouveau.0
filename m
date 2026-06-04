Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB159CD6E7C
	for <nouveau@archiver.kernel.org>; Thu,  4 Jun 2026 19:29:08 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9CB7411A27E;
	Thu,  4 Jun 2026 19:29:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CHWo8tI9";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B7F6D467E3;
	Thu,  4 Jun 2026 19:15:23 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1780600523;
 b=dwnFUZgsNhQu1UZJ9U1EpBeUlVMkIHVK9OQwNrEkP10yaOivZtw7phgCnLeNniHVNnBy2
 rGEfBltokNZice/ib4mVISEyAtKBnCa75hrKHeS6fjR5LHsf1UAVO2SrFsXEs5KDu1UvShM
 8GLakOz24dhrltoq7Sltfl+sNsdIGDZBcRm8hbXwLehH72Nfh9r8Q85zOd9U8KDbaBYPxzZ
 bzuH8pKSUuXoMunr+0JrKp05a0iFhAp4dutB5xmDGNJL7ZG9bN4IS1bLhxt8w0NEwqDVpwb
 IhE8GOl1JLPk7nlm8vcHlVsM8ECeZeRlme10mT3TnIAaFLyHzwH06vIC7/+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1780600523; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=QlYcsDX/fFbrYtcqnwAP7Gnuoxt4BlnnFKxcvfLkLbM=;
 b=oovRUA4EtGjHybokA/gxPeWbvBSG3YnruinhK3J0vQKw2sFDQXzbh92z8vzWFB2GlKXkr
 ZSY0bk67f84fL1qpsN+8/YG452ZoHWM+P5C6mmERU8/IxmLcrqhrSZsB8wKSyu5OdiS9SJi
 o5b2xtPe7F5JNoymrqn5vRkku+5LWd8fMTneZVt3jDdLy7kJJ0LAnThPfip5KuhbjfZDbWg
 sH/ucAK4YXo/CMT409QF8MfaA0gh8nueuSqSM6QFegD1enzhjjmEYRLpX6QDAYib1AJUYyA
 XGPEOiLI3wPR19nyaPWRXShungi3yHV3wB+1lkj+zrZ0doLHvpbPwdXwaxJg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A3ED1467DF
	for <nouveau@lists.freedesktop.org>; Thu,  4 Jun 2026 19:15:21 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4A89511A26C
	for <nouveau@lists.freedesktop.org>; Thu,  4 Jun 2026 19:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780601345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QlYcsDX/fFbrYtcqnwAP7Gnuoxt4BlnnFKxcvfLkLbM=;
	b=CHWo8tI9gdmKnCmpX1m3TxOesw2jrDoNLJ9fTNifDHoP2zYkkMtMDDqGEeTQiPhtajlt8h
	wR+UBtRTsPiPBuvq+RR4FBNyA/+RhDZfFAIEigl7Sok1Q1Bs7rarqqfb+ovWZj1J2dMz9O
	NYJMyI1Hvz7Acp7cE5lPcZhOHg2n/pQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-503-qx9TbXrVNYuVCuw1QEsuyw-1; Thu,
 04 Jun 2026 15:29:01 -0400
X-MC-Unique: qx9TbXrVNYuVCuw1QEsuyw-1
X-Mimecast-MFC-AGG-ID: qx9TbXrVNYuVCuw1QEsuyw_1780601338
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 50A02195608E;
	Thu,  4 Jun 2026 19:28:58 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.65.199])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 0903B763;
	Thu,  4 Jun 2026 19:28:54 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v18 3/4] rust: faux: Allow retrieving a bound Device
Date: Thu,  4 Jun 2026 15:24:30 -0400
Message-ID: <20260604192740.659240-4-lyude@redhat.com>
In-Reply-To: <20260604192740.659240-1-lyude@redhat.com>
References: <20260604192740.659240-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: nB2njN40FOsvcO_1L2GrQ8z6CoMhNt3ohZxqoURql84_1780601338
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: G7WAMC6H5ICOBNCI5QHCSLFVKCQEKEFR
X-Message-ID-Hash: G7WAMC6H5ICOBNCI5QHCSLFVKCQEKEFR
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/G7WAMC6H5ICOBNCI5QHCSLFVKCQEKEFR/>
Archived-At: 
 <https://lore.freedesktop.org/20260604192740.659240-4-lyude@redhat.com/>
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

---
V18:
- Add notes from Danilo to safety comment.

 rust/kernel/faux.rs | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/faux.rs b/rust/kernel/faux.rs
index 43b4974f48cd2..20ab638885354 100644
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
@@ -59,10 +60,15 @@ fn as_raw(&self) -> *mut bindings::faux_device {
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
+        // - faux_match() always returns 1, and probe runs synchronously (PROBE_FORCE_SYNCHRONOUS).
+        // - suppress_bind_attrs = true on faux_driver prevents userspace-triggered unbind via sysfs
+        // - mem::forget(Registration) is not a problem; if the Registration is leaked, the faux
+        //   device stays bound forever.
         unsafe { device::Device::from_raw(addr_of_mut!((*self.as_raw()).dev)) }
     }
 }
-- 
2.54.0

