Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F68ECD6E55
	for <nouveau@archiver.kernel.org>; Wed,  3 Jun 2026 19:52:37 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0A95B112325;
	Wed,  3 Jun 2026 19:52:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="jFTQFyRR";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5354246780;
	Wed,  3 Jun 2026 19:38:54 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1780515534;
 b=ilC7uRVr4nCf0Ob/r2awziFYxYZWKSz8zhwqGjuu9pEFY+URnaOLnshQsedAGOL8+Xvl+
 15LIHyrFmmKbqjipETZ54uVwmVD9ClcwusvpwpkAFdEEXExeMdLUgzgFohyclJTM/F8sgJs
 xCsgc08XhpU4UY5PRnDZOlCVlmz/nE4lYVVeFjuJEUKH7LKr4O9TXRvKjyXCbBm/3qtG6tx
 Wnn04e5MnHaDhFCnO98Yel2MmnwXAe426zsWytZtgzxHnnEwRq0OAgXuW3OHCSfgy6kA/JO
 SnWWvpu3N8BZHeVW1SpMAyU3vx5UcxX6E3umY0zPxQznqVImg8qg4ULausdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1780515534; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=r7Z/C3WKzX9d11zFSyCLO1QOj5Cg/fxzu0wnbss0mqw=;
 b=QUOoPvpU1ZA1iHLcVKrhRaKeiSJBLYA520MD4A0L9tGQAr6gbrlU5komxTCQcgs+IXnGE
 fjhefCVwo7oP7id5qkHHTk3aOIRa3Ljr+GN4gVNN4fc4VRp4GSVw2z+wpAm7/IZy+w+qqaW
 2TX8avrRAdMxb8x1cGhO7bAzurZh72qoTQRQUR9eGugaYbRCsZ+EXL701bISw0W763vjlpy
 98AMm4VRtRG2Eh9vz8fT0WSC+np9wzbyHRdpyEEvG82nOYuevDeE+wIxBzDidm80cR4eG+R
 ssUsSEIHScanbahjXHtd0wjPGDtJTjNBbhkqCW/vehK+qq0senwUSm1kiDQw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 6B33244C81
	for <nouveau@lists.freedesktop.org>; Wed,  3 Jun 2026 19:38:51 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DB3DD112321
	for <nouveau@lists.freedesktop.org>; Wed,  3 Jun 2026 19:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780516353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r7Z/C3WKzX9d11zFSyCLO1QOj5Cg/fxzu0wnbss0mqw=;
	b=jFTQFyRR+5vj8q+z9GweXtAH6NpXNXXRHPEdgNZQRfM/tqUjDOjRzxrFV2nm/6M8rWRMyi
	iW2ZTtt/OW5nypGfrE2PCe4Pp587X4XwECdOrxfVdf4/IBwygteAwYI/feH+nm4E9rY9wh
	Z/NUrLdyH1RghlL5c/uIGWJt2x48TLU=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-357-SY1bvVhgOOuDGB9t24XwPA-1; Wed,
 03 Jun 2026 15:52:28 -0400
X-MC-Unique: SY1bvVhgOOuDGB9t24XwPA-1
X-Mimecast-MFC-AGG-ID: SY1bvVhgOOuDGB9t24XwPA_1780516345
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 7940C180034C;
	Wed,  3 Jun 2026 19:52:25 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.81.203])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id E2278180049F;
	Wed,  3 Jun 2026 19:52:21 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v17 2/6] rust: drm: gem: shmem: Add DmaResvGuard helper
Date: Wed,  3 Jun 2026 15:42:31 -0400
Message-ID: <20260603195210.693856-3-lyude@redhat.com>
In-Reply-To: <20260603195210.693856-1-lyude@redhat.com>
References: <20260603195210.693856-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: IrvhUsWIBA24XQ0DqrZ9-JpLTInUMBEdstqDLs3LCzY_1780516345
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: BOKGPZNNL4NJFA3LW64YALBECRXTBSUP
X-Message-ID-Hash: BOKGPZNNL4NJFA3LW64YALBECRXTBSUP
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BOKGPZNNL4NJFA3LW64YALBECRXTBSUP/>
Archived-At: 
 <https://lore.freedesktop.org/20260603195210.693856-3-lyude@redhat.com/>
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

 rust/kernel/drm/gem/shmem.rs | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index 084b798ce795b..650c34dd8b7a4 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -30,7 +30,10 @@
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
@@ -244,3 +247,29 @@ impl<T: DriverObject, C: DeviceContext> driver::AllocImpl for Object<T, C> {
         dumb_map_offset: None,
     };
 }
+
+/// Private helper-type for holding the `dma_resv` object for a GEM shmem object.
+///
+/// When this is dropped, the `dma_resv` lock is dropped as well.
+///
+// TODO: This should be replace with a WwMutex equivalent once we have such bindings in the kernel.
+struct DmaResvGuard<'a, T: DriverObject, C: DeviceContext = Registered>(&'a Object<T, C>);
+
+impl<'a, T: DriverObject, C: DeviceContext> DmaResvGuard<'a, T, C> {
+    #[inline(always)]
+    #[expect(unused)]
+    fn new(obj: &'a Object<T, C>) -> Self {
+        // SAFETY: This lock is initialized throughout the lifetime of `object`.
+        unsafe { bindings::dma_resv_lock(obj.raw_dma_resv(), ptr::null_mut()) };
+
+        Self(obj)
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

