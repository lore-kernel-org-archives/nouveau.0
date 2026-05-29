Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 266A2CD4F54
	for <nouveau@archiver.kernel.org>; Fri, 29 May 2026 18:37:27 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F29B81123D4;
	Fri, 29 May 2026 18:37:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="POIZspgN";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 722AF466C8;
	Fri, 29 May 2026 18:23:55 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1780079035;
 b=TtRdZveKvbg54JANcZS5dxO74SX6tM67M5w5nB3g1kIdoycb8bu15LRRbLeZEmTfTq3Lv
 79xKlJ+DXOTRJwOnPNp/P9KMLNkvtVCZXB4I4wtUQZ0XXAuGt9l8zZLe5rCixzhh3VoPErF
 /ImJwlE3/iEEFPplyfZ+qAR75e4BcdGERKaf4RGxnpTGAFxs38EaTL6iJr8SfPBxOnIO9Mo
 pQIcKqOt8Q6vSPisOHVzxbgHrzt3EEsODRVJXTtKU7vfhAbC5ereneIA0BFvrz9INhr2eFQ
 eLUc449v+22FuqcK1DdU/fMYIDlBfMtXojcNsNNdIXFUZLc7BMmcv314T2WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1780079035; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=35xOY5UpjGtZddGUxJfTOaK/u/wc0iWDPCGCXs5Om6w=;
 b=ls3YhLLoFacYD8iJXh5OTlKQB3LYgHhVX9lvlJHLeIYFjxDsr6kjQ/D2W2VGWYwTDigoj
 x7fiq9aCZAbJfnPre6hCuTu+IG/HTdS9uUOmsQBnGHO6LzgtwJKwTquLQyK+Aw3O0GYrzEc
 BaQ6lhJrl7A7dwctUA9tCf7GK/SmeYnvwRzIht1/l+K8GR7jpQy4xhKL/rD8hoM7fceBFCA
 xn+uwaVx/BuDYQc1ByMem+3UnNslcr9+ElNRv83pgUMuaiA4bQUkJxtp/h2jzoi8chBJFuM
 gnRZt9orw93VBQYsh+Ut9xsOCRuVY8jQQ0kgvoeLk1PyvhHtEJjaHk7yMBVg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id ECB2B42910
	for <nouveau@lists.freedesktop.org>; Fri, 29 May 2026 18:23:52 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 323511123CE
	for <nouveau@lists.freedesktop.org>; Fri, 29 May 2026 18:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780079843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=35xOY5UpjGtZddGUxJfTOaK/u/wc0iWDPCGCXs5Om6w=;
	b=POIZspgNE47lxmFt+IL2300Atuic48sS04HYQuX3EDzbSdH3VFZmfsJEymXQyEXEk5HGHC
	KjCoePbqIY+z2yQEdc6QX1gMR1h/y1I7KMHlYHL2XiuGIrc1Pu25K+g5fhjmqYFLIuLSlU
	3iQZfa1/HkSDCptgr5hSLWWNij+hWp8=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-384-VLIRDv4IP3exfw8E8q8HAg-1; Fri,
 29 May 2026 14:37:16 -0400
X-MC-Unique: VLIRDv4IP3exfw8E8q8HAg-1
X-Mimecast-MFC-AGG-ID: VLIRDv4IP3exfw8E8q8HAg_1780079834
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 804B01956089;
	Fri, 29 May 2026 18:37:13 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.89.101])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id B23801686;
	Fri, 29 May 2026 18:37:09 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v15 1/6] rust: gem: shmem: Fix Default implementation for
 ObjectConfig
Date: Fri, 29 May 2026 14:33:59 -0400
Message-ID: <20260529183702.677677-2-lyude@redhat.com>
In-Reply-To: <20260529183702.677677-1-lyude@redhat.com>
References: <20260529183702.677677-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: 7lNJLgsenxTYuWjATZ5jByLcUF-Dv--45pKh3mq-6II_1780079834
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: SCIRWBY3TT2NB7CKCDOAJ3HZWNR6TGJR
X-Message-ID-Hash: SCIRWBY3TT2NB7CKCDOAJ3HZWNR6TGJR
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/SCIRWBY3TT2NB7CKCDOAJ3HZWNR6TGJR/>
Archived-At: 
 <https://lore.freedesktop.org/20260529183702.677677-2-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

I completely forgot when coming up with this type that #[derive(Default)]
only works if all generics mentioned in the type implement Default (and T
usually doesn't). This being said: We don't use `T` for anything besides
using it for a reference type, so whether or not it implements `Default`
shouldn't actually need to matter.

So, fix this by just manually implementing Default instead of deriving it.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/gem/shmem.rs | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index e1b648920d2f6..8b7de136ab1f9 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -39,7 +39,6 @@
 ///
 /// This is used with [`Object::new()`] to control various properties that can only be set when
 /// initially creating a shmem-backed GEM object.
-#[derive(Default)]
 pub struct ObjectConfig<'a, T: DriverObject> {
     /// Whether to set the write-combine map flag.
     pub map_wc: bool,
@@ -50,6 +49,16 @@ pub struct ObjectConfig<'a, T: DriverObject> {
     pub parent_resv_obj: Option<&'a Object<T>>,
 }
 
+impl<'a, T: DriverObject> Default for ObjectConfig<'a, T> {
+    #[inline(always)]
+    fn default() -> Self {
+        Self {
+            map_wc: false,
+            parent_resv_obj: None,
+        }
+    }
+}
+
 /// A shmem-backed GEM object.
 ///
 /// # Invariants
-- 
2.54.0

