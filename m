Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9650FF885A
	for <nouveau@archiver.kernel.org>; Tue, 28 Apr 2026 19:06:47 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8269F10ED91;
	Tue, 28 Apr 2026 19:06:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hB+gG01r";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C8FBE45C84;
	Tue, 28 Apr 2026 18:54:24 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777402464;
 b=C/9qmSFKZiRF0JRCGw3hLE6Id9L/uWvwooeUgslRQM/e0ah+QoVwnChA/LFUCtDPE90Kh
 7nlF7o1d3qsscpXry7Tznzc/FBH02nmaILreL75t9FrBiwciEioapV6D2jIYw5ScnkWoqSn
 xnTuOeSptPNyf3Kpi4eXPbnlMN4ru5mbvD5vVLvGqeD1vPnlZyNtmCmNuirZrXecoD5GRFW
 AedXuwwFBDKMJHpfpjAAURa4TZ+FWDr3hat9JSPb8HXPKfjSg5xFVryaE2x6Q/jHvcMuVIO
 IAXYpzqCaDwGc1i8ojZHHy9bDMnxjxq0Xha6F6PwFeeWOTPG83tsSqBpIeJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777402464; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=vTM6EzhoLmh2e5QFtxFH3AEoU2mZqpj3SZtrKYCsVYE=;
 b=jAjTd6N16EHb3UppWwCazx9NcosinLPADaAp4Bk87nWV4o4GIAMR91i5fuiYniCROM1qS
 V9fM0uq5Z5abjWog5aZ+XqtRvDpPdQYNhpbgxzFGnQ0E5eL++sP+x4PJIJFhmSyyyDGU+ZK
 b70HbVmN5Fu0Pw8b7mFSekLt8QbF6MwRY3f4s/bXdtmyQxahg0Af04qWj77Zjr5E7hP8L91
 NEvniPws+7Lgyf10XjP/HcxuHS30ztqNxYi/qiwP/fTmcBIui8mAiVhzZQ1hw2l3O/GCWO8
 ZzFz/UeRUXxxylOAP4EutOZ2PxtPD88ol6Tm10lqo5cwEe42dCfcQmdNJyJQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 68F8B45563
	for <nouveau@lists.freedesktop.org>; Tue, 28 Apr 2026 18:54:22 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DCC2610EBBE
	for <nouveau@lists.freedesktop.org>; Tue, 28 Apr 2026 19:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777403204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vTM6EzhoLmh2e5QFtxFH3AEoU2mZqpj3SZtrKYCsVYE=;
	b=hB+gG01rEIb7m7evTvNflaDECyabwg6+lGun3jlJMJCAtVzyvCRsTeCnaFxfdbL4o0hsrf
	r3ZQOxMA1NeJBbYLMCIwtaa+2pv5dNuPUAKb7jP+m8T2rlh7YxSGo5hRq8wBgtE8t9/5PX
	RSBny1IOafp8llmmDWAPFOdCoA+7N0M=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-443-m_K2I5gQOuuQX2n7dp2kYA-1; Tue,
 28 Apr 2026 15:06:39 -0400
X-MC-Unique: m_K2I5gQOuuQX2n7dp2kYA-1
X-Mimecast-MFC-AGG-ID: m_K2I5gQOuuQX2n7dp2kYA_1777403196
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9112119560A3;
	Tue, 28 Apr 2026 19:06:35 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.88.40])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id D5C011800352;
	Tue, 28 Apr 2026 19:06:31 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	Gary Guo <gary@garyguo.net>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v13 3/5] rust: drm: gem/shmem: Add DmaResvGuard helper
Date: Tue, 28 Apr 2026 15:03:43 -0400
Message-ID: <20260428190605.3355690-4-lyude@redhat.com>
In-Reply-To: <20260428190605.3355690-1-lyude@redhat.com>
References: <20260428190605.3355690-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: 4xDLadzGhRy-fQYXO0ct_Yk8mCBvIzg8IXi7wtTEqHo_1777403196
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: FGVV72W7BLAAC3J6AFYUUNYHVERJUA3P
X-Message-ID-Hash: FGVV72W7BLAAC3J6AFYUUNYHVERJUA3P
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FGVV72W7BLAAC3J6AFYUUNYHVERJUA3P/>
Archived-At: 
 <https://lore.freedesktop.org/20260428190605.3355690-4-lyude@redhat.com/>
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
---
 rust/kernel/drm/gem/shmem.rs | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index 35d7523e164ff..92ec2b67ed023 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -27,7 +27,10 @@
         Deref,
         DerefMut, //
     },
-    ptr::NonNull,
+    ptr::{
+        self,
+        NonNull, //
+    },
 };
 use gem::{
     BaseObjectPrivate,
@@ -224,3 +227,28 @@ impl<T: DriverObject> driver::AllocImpl for Object<T> {
         dumb_map_offset: None,
     };
 }
+
+/// Private helper-type for holding the `dma_resv` object for a GEM shmem object.
+///
+/// When this is dropped, the `dma_resv` lock is dropped as well.
+///
+// TODO: This should be replace with a WwMutex equivalent once we have such bindings in the kernel.
+struct DmaResvGuard<'a, T: DriverObject>(&'a Object<T>);
+
+impl<'a, T: DriverObject> DmaResvGuard<'a, T> {
+    #[inline(always)]
+    fn new(obj: &'a Object<T>) -> Self {
+        // SAFETY: This lock is initialized throughout the lifetime of `object`.
+        unsafe { bindings::dma_resv_lock(obj.raw_dma_resv(), ptr::null_mut()) };
+
+        Self(obj)
+    }
+}
+
+impl<'a, T: DriverObject> Drop for DmaResvGuard<'a, T> {
+    #[inline(always)]
+    fn drop(&mut self) {
+        // SAFETY: We are releasing the lock grabbed during the creation of this object.
+        unsafe { bindings::dma_resv_unlock(self.0.raw_dma_resv()) };
+    }
+}
-- 
2.54.0

