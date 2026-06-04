Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47746CD6E77
	for <nouveau@archiver.kernel.org>; Thu,  4 Jun 2026 19:29:04 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E953D1129AC;
	Thu,  4 Jun 2026 19:29:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="R3/vD+hi";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0ADFF467E0;
	Thu,  4 Jun 2026 19:15:19 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1780600518;
 b=T/RGgGy4pLQXvhlvtzcnxssIgOB6Xi+lSJ5LWyMac7O14VVbrPabYgVXEwUphjv+ykorA
 pBxvGcJbg4r0Lh5mDDfDVmC+BJI/aKw2YAfTb0KBHBB69kPgKARcsXMIML2PjBa02awjGm1
 DP+GRgtVfItsBg8m+VEeSQ6XuArOOhLnFiUaMRnDJpIIL+jtuqivEXu6PP7gJX88rV/b5fa
 WZJecU9PRzj0B+uNaOVKnivLemOrPSw22daMYiGDeOrVN4r39lCgQuSMoIe0TdB0JeuNHjg
 Yz/hS8IfbMjitvNOid8hmpic4TFiSaqHhh1dfos0HuOsmU8ghaqWsasDGvOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1780600518; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=r7Z/C3WKzX9d11zFSyCLO1QOj5Cg/fxzu0wnbss0mqw=;
 b=yVqQ+95q0r+cmFNbbMVxd5W3B8qMCI6NrVrbt3Gw3dvvPUbUIKYzzzTkiXdNyvxk+uJKh
 tIKc7+XkFIdkeUOKk6T4pAlklJmim/riz5pRMovNvn+pYRAOLbb3Vrlp1hSy/PbK8ZS68Iy
 NR1FixdePKfdcyPHPGbYB9CSzu8geEGD+M0zDaXnQpGdK5z4yUyJf7o1mw64oay3zOTT/g7
 DPLFaGsGzmr+9gnWqrv5+Eg/3Va04wG1Nm6IshumPJjUbAl8aT/bIzJm5YDROfplhofLCT7
 Umz4TlRkcXcJhp3CFmzP9FwvEblCfaHjGPBJSYko1j7hp49u/IXzBNuupXAA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id E8AD940638
	for <nouveau@lists.freedesktop.org>; Thu,  4 Jun 2026 19:15:15 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8F4F91129A4
	for <nouveau@lists.freedesktop.org>; Thu,  4 Jun 2026 19:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780601339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r7Z/C3WKzX9d11zFSyCLO1QOj5Cg/fxzu0wnbss0mqw=;
	b=R3/vD+hi/F0LtzfxfGDBX871BtuQUT8/LOV8VgF+PEXal3xP/qNvYNSd32Fq91wvS2UeRS
	GZ8ZkdgBPWHwzGZiowo5yGdm187Myt/4peVuWyO1gZNX1LZbM0xs/oLg2WaB8XnbeGka20
	H7mPYtZ+5lQdRJ83HhBdq/8uEEJ1DWY=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-19-zgX0bRHXN9yWCnDpzcJjUQ-1; Thu,
 04 Jun 2026 15:28:54 -0400
X-MC-Unique: zgX0bRHXN9yWCnDpzcJjUQ-1
X-Mimecast-MFC-AGG-ID: zgX0bRHXN9yWCnDpzcJjUQ_1780601331
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 033151800347;
	Thu,  4 Jun 2026 19:28:51 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.65.199])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 562BF763;
	Thu,  4 Jun 2026 19:28:47 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v18 1/4] rust: drm: gem: shmem: Add DmaResvGuard helper
Date: Thu,  4 Jun 2026 15:24:28 -0400
Message-ID: <20260604192740.659240-2-lyude@redhat.com>
In-Reply-To: <20260604192740.659240-1-lyude@redhat.com>
References: <20260604192740.659240-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: n3injVKn2u07ZeTEAu0p8HXOSfoaBbHfsqUveUQT-uc_1780601331
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: 2ZPVIFJVNHRVEV2BXNG72GKNO4TOTAHT
X-Message-ID-Hash: 2ZPVIFJVNHRVEV2BXNG72GKNO4TOTAHT
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/2ZPVIFJVNHRVEV2BXNG72GKNO4TOTAHT/>
Archived-At: 
 <https://lore.freedesktop.org/20260604192740.659240-2-lyude@redhat.com/>
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

