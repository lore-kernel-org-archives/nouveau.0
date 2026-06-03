Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F280CD6E55
	for <nouveau@archiver.kernel.org>; Wed,  3 Jun 2026 19:52:49 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EBF13112324;
	Wed,  3 Jun 2026 19:52:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RqwqMDR5";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3BCFF46790;
	Wed,  3 Jun 2026 19:39:06 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1780515546;
 b=VFeY0W5GCJuwTzokj6DXVkaP1D5cZLsvWEotQ4GqOrr5dX+q6rLYOEVNoGmBQwX4AlpTW
 0v96+eXtS3APJeArkDPXOAYPKGPS/LrQpuX9AkTodA946HXOKx4FxUENwx3eteVOgViSXO8
 UT1eSp+dPWC19amZ4mC+KmpkSQT59oUmmv+Y5a8lMBcDGsyGdQSUGur9/YjhnopEIHRMSpD
 Q2WObZxfORQjhfeJikCGll82RSrL8vPNSHmQBcwTSDQwz0ejJPoUn9X5Cgx0qOQ+UKftyXS
 LP6BaCTaLfU458ZcQZJRjpQH0mjQz6RgUDG1nXQJh622FIuSJjNHdZ2xF9Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1780515546; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ji3R873SgQHyxfzMQgkhE7LmK1MPE9r7ND0eG5Mf4OM=;
 b=mcegHx+wOgqidTAXAoFUIDmsjyWBppmcn0od2moSYoxPK7emzKIXC6IMvm62w4Tbiiokm
 vvvOlG8gJ5oVcGtTuy+0BI9GGGs23maDQ6/cOElsWsimpEvXdUX+qLUGPdfNhg296/pf/HK
 lI0IskM5HY+IUHb4eNOEIk7xns6NBASw9wcYf1XSRQjL7NH2bTDlLZOJyXNSf9sdC/gBxPa
 SMnE5KbRRMnFpssvRDeUy7WO+q23RZCqSJ6/LGyl9iRNuNmSgN4aAjGcs2+t8Ouv66cFUhW
 skMj1Qk3+FgzO+7t4Oj0f6BeEHqPhzSlo2vEmFxMlLzLSnbwkzuSoJtVSaKA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 2B4BA44C81
	for <nouveau@lists.freedesktop.org>; Wed,  3 Jun 2026 19:39:03 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 80BB5112325
	for <nouveau@lists.freedesktop.org>; Wed,  3 Jun 2026 19:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780516364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ji3R873SgQHyxfzMQgkhE7LmK1MPE9r7ND0eG5Mf4OM=;
	b=RqwqMDR5jRsCgocUWOUgg/DPDdzdVCe9BPomOCsERHiP9edcc1rVB6c2QPYq7MYgxo//Ke
	sSunlL0ZCr3ldUpHqcsTg2FLMqPv1NxnXJBSnDS37M6QNhNJt9JJXZoU/8Tq7fwXuwuR0g
	jqxr5HhvVtI3hbcMBOPefk984Pvo0Io=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-488-ThXfEKrpPjuaMtoOn4dIWA-1; Wed,
 03 Jun 2026 15:52:39 -0400
X-MC-Unique: ThXfEKrpPjuaMtoOn4dIWA-1
X-Mimecast-MFC-AGG-ID: ThXfEKrpPjuaMtoOn4dIWA_1780516356
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 146EF1800370;
	Wed,  3 Jun 2026 19:52:36 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.81.203])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id E7CF61800591;
	Wed,  3 Jun 2026 19:52:32 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v17 5/6] rust: sync: Add SetOnce::reset()
Date: Wed,  3 Jun 2026 15:42:34 -0400
Message-ID: <20260603195210.693856-6-lyude@redhat.com>
In-Reply-To: <20260603195210.693856-1-lyude@redhat.com>
References: <20260603195210.693856-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: sb7mraY1xiE7QNqWEBJYks5FxIevwowLqeP0YV8uWAY_1780516356
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: SP42BAR5FHWH4AYAZYJU5YASPVL5ZGXW
X-Message-ID-Hash: SP42BAR5FHWH4AYAZYJU5YASPVL5ZGXW
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/SP42BAR5FHWH4AYAZYJU5YASPVL5ZGXW/>
Archived-At: 
 <https://lore.freedesktop.org/20260603195210.693856-6-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This function simply drops the contents of the SetOnce, given a mutable
reference - since that proves we have exclusive access to the SetOnce.
Additionally, update the invariants for SetOnce to make it clear as to why
this is safe.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/sync/set_once.rs | 60 +++++++++++++++++++++++++++++++-----
 1 file changed, 52 insertions(+), 8 deletions(-)

diff --git a/rust/kernel/sync/set_once.rs b/rust/kernel/sync/set_once.rs
index 139cef05e935f..d6e4fc2695673 100644
--- a/rust/kernel/sync/set_once.rs
+++ b/rust/kernel/sync/set_once.rs
@@ -15,7 +15,7 @@
 ///
 /// # Invariants
 ///
-/// - `init` may only increase in value.
+/// - `init` may only increase in value, unless modified through a mutable reference.
 /// - `init` may only assume values in the range `0..=2`.
 /// - `init == 0` if and only if `value` is uninitialized.
 /// - `init == 1` if and only if there is exactly one thread with exclusive
@@ -110,17 +110,61 @@ pub fn copy(&self) -> Option<T>
     {
         self.as_ref().copied()
     }
+
+    /// # Safety
+    ///
+    /// If this function returns `true`, `self` must be freed or `init` must be reset to `0`.
+    unsafe fn drop_val(&mut self) -> bool {
+        if *self.init.get_mut() != 2 {
+            return false;
+        }
+
+        let value = self.value.get_mut();
+        // SAFETY: Via our type invariants, `init` == 2 means `value` is initialized.
+        unsafe { value.assume_init_drop() };
+
+        true
+    }
+
+    /// Unset the [`SetOnce`].
+    ///
+    /// After this function is called, the [`SetOnce`] is empty and uninitialized. This function is
+    /// mainly intended for usage in destructors.
+    ///
+    /// Returns `true` if `self` was previously initialized.
+    ///
+    /// # Example
+    ///
+    /// ```
+    /// # use kernel::sync::SetOnce;
+    /// let mut value = SetOnce::new();
+    /// assert_eq!(value.populate(67), true);
+    ///
+    /// assert_eq!(value.reset(), true);
+    /// assert!(value.as_ref().is_none());
+    /// assert_eq!(value.reset(), false);
+    ///
+    /// assert_eq!(value.populate(69), true);
+    /// ```
+    pub fn reset(&mut self) -> bool {
+        // SAFETY: We write `0` to init below if this returns true.
+        let dropped = unsafe { self.drop_val() };
+        if dropped {
+            // INVARIANT:
+            // - We set `init` back to 0 through a mutable reference.
+            // - We dropped `value` above.
+            *self.init.get_mut() = 0;
+        }
+
+        dropped
+    }
 }
 
 impl<T> Drop for SetOnce<T> {
+    #[inline(always)]
     fn drop(&mut self) {
-        if *self.init.get_mut() == 2 {
-            let value = self.value.get_mut();
-            // SAFETY: By the type invariants of `Self`, `self.init == 2` means that `self.value`
-            // contains a valid value. We have exclusive access, as we hold a `mut` reference to
-            // `self`.
-            unsafe { value.assume_init_drop() };
-        }
+        // SAFETY: We are dropping this value.
+        unsafe { self.drop_val() };
     }
 }
 
-- 
2.54.0

