Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76DA7CD8CA4
	for <nouveau@archiver.kernel.org>; Mon,  8 Jun 2026 18:31:27 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4E3C010F8AF;
	Mon,  8 Jun 2026 18:31:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZUfT0Dqh";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9616546875;
	Mon,  8 Jun 2026 18:17:33 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1780942653;
 b=rn+w3SZpwU/TnzQvzLzpiiyW//I792o5azgAEbnYJauismnet/zkbabbThAYPT6UW8vLW
 3jDQzYoVYD+/Nhoaz3Rpln0RMpDGgKDievFi3Sx7XutqNnY1WdzhRpvUM2MWZGKN02Ii8nc
 uHDwQezNy9YJepNlqApFqzsnYlQf8lI5nLWBX2vOOi3AHIGVNrJOnaSBoewVFYv0uuF3JsB
 EHbU8OXVoG3AccClIbimPHXb2zFV1vWAwpPuwTnf9zVe4L6UAQ/5KGdErsINCQFJ7W47Z1d
 5OkGWLtsHvjyXDgOREYxjckgjC9KuLT5jyJGZ6sU61xDNQ3NQ6MKyMVw1eOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1780942653; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=l0Q78Z8ifFWrqkScVlzVzhmSJQFRs/JAyzSzJkKaHgI=;
 b=ll5z8iu6da3JobaT82mckTr7SHwUG3M1xekb4WpDOvCcCL4xHsOqXXnxqEJzoiIY7/KX/
 JpXOnpF2V9SCH97BWci+nbj3WU1RJtw4EJIj5Ulx/97ihORQfVubIeYW5pa1MrKedTQcWoe
 j/jQFOTOZZoj4urJ5ypG6lZwgPWmUZMCKad3pnckPa4KdPZEKG1RykhEK3XJmrJfbCFbLUI
 L1g3ZDUe7ChfRo6PxJjdklKpxtF8l3X1rGQ9kScgmGK/9UMDsEBT3zrq9e5X6wEeBVkC3lO
 SDW52kIOyrvvni4zXVXwbFHUP+waKPtHkI5ChWYa4GU/6j/SL7SvWCbQpQpg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 49FB24685E
	for <nouveau@lists.freedesktop.org>; Mon,  8 Jun 2026 18:17:31 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B26BE10F88D
	for <nouveau@lists.freedesktop.org>; Mon,  8 Jun 2026 18:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780943483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l0Q78Z8ifFWrqkScVlzVzhmSJQFRs/JAyzSzJkKaHgI=;
	b=ZUfT0DqhAKcPy0Ve/VX8vfliwkw/STjHGQZPWXKynsQ1tVMaPpdpl3/WCTj/zsbEWHPy+6
	qrYkzRVINz+anVSMOK/RjXbed50L9qSi+BkrXuh0AHWd5movmESY2QOLCsNxJW/hUpBSZk
	CNG6PcVf6gJYgf3xzlFh/tfymzewO5E=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-629-GkctutQXPFOOEZJN1ozAgQ-1; Mon,
 08 Jun 2026 14:31:20 -0400
X-MC-Unique: GkctutQXPFOOEZJN1ozAgQ-1
X-Mimecast-MFC-AGG-ID: GkctutQXPFOOEZJN1ozAgQ_1780943477
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C110F197702D;
	Mon,  8 Jun 2026 18:31:16 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.89.147])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 30682180059F;
	Mon,  8 Jun 2026 18:31:13 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v19 3/4] rust: faux: Allow retrieving a bound Device
Date: Mon,  8 Jun 2026 14:29:03 -0400
Message-ID: <20260608183057.2001376-4-lyude@redhat.com>
In-Reply-To: <20260608183057.2001376-1-lyude@redhat.com>
References: <20260608183057.2001376-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: uSZRoynIZJYoEh8OGxVbaWMjU9f8Is9hFX4u5nVHsPQ_1780943477
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: GXJFVTLSMUGRYQLMVFI2PMEAASE6XUZ6
X-Message-ID-Hash: GXJFVTLSMUGRYQLMVFI2PMEAASE6XUZ6
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GXJFVTLSMUGRYQLMVFI2PMEAASE6XUZ6/>
Archived-At: 
 <https://lore.freedesktop.org/20260608183057.2001376-4-lyude@redhat.com/>
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

