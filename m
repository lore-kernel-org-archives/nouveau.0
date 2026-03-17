Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF02FF6E85
	for <nouveau@archiver.kernel.org>; Tue, 17 Mar 2026 21:32:47 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 77E8510E68B;
	Tue, 17 Mar 2026 21:32:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XlG3QmH+";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B892C451F7;
	Tue, 17 Mar 2026 21:21:57 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773782517;
 b=yJ+740YJ3+70m6MWFVeE4rs9dHWs+c+lzYHtUm6AZgGG4t0mTdu4ACZGmmngAEPdh5Ibl
 r6Eeu/8P3Q176f6sYahMLQmWoCvlXYsJg6WBJdA0v4rU45YlyLI52/v+cOuH7lSd3scCL+r
 30yw3WMHILqM53LQuI+UifAj9mpTeHFrM8z3goEs4yrXCbb5DPKCBbbO3FU0ENfobEjUleh
 KWAEc+w5GTGEAnBIQ9VPluxfHssroXAkX3/Sq7fYzXdL+KM0OFDiWqFgKIbx+jVuX3KZilV
 b175QPlQ8PSh0sjB5CMeeu76pnO70tccDCvPbXc/5NLiajtBlM8ksgOa4vrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773782517; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=QouNEtmlaggCaQo2P5IO63zf/LsG/YgCtk54rapeiQI=;
 b=B5QOt+ZKVrDXWcvKfpYUlVNd48MUN8OK3VvzorE66zSVyYcP3wcXeHGelJzJ5Gfuvm0Dy
 M/4FCGYhWELySvFbwKaM8kaps1D2KuV41YALvVYoFecYtqQCoJkVMef3u2wWZx4F1tIg34o
 hUG7v6NYneDY3W3QbE6aS3VVXmBxh5IuE4BepPnheAL5mnTaqbZVhkf9K0gIDsqEmuaps73
 xB0zeGMgNmbzl27YEfjWlc1I6K9bRu28UUH89q+fXBdr9G517/K6Iqnk2C2c97FaYm+R1MZ
 MBFoNRvERaxdKQ5IsUkII2I7BEUw03EAB39oTJKCKJbmw++CRe2zXe2496qw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 04B4B43446
	for <nouveau@lists.freedesktop.org>; Tue, 17 Mar 2026 21:21:55 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7550C10E680
	for <nouveau@lists.freedesktop.org>; Tue, 17 Mar 2026 21:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773783163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QouNEtmlaggCaQo2P5IO63zf/LsG/YgCtk54rapeiQI=;
	b=XlG3QmH+7NYIzYMtbeUIat7G4NFPJs/wBoewg/YB5QLtE8fVp1B8axC5AdiLuHB5dvmya1
	vMDN7K9bXgh7iLFaAharVs5iGPZusuiswIdgNIk9Nhdh02Y2/3ya7EfmJPssRTWMmB/TEk
	l2yZvg1NSb5rs/GFnx5kLYw3ZPVkPUU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-288-3AwmOY-QP06Fu3U4XIjoXg-1; Tue,
 17 Mar 2026 17:32:39 -0400
X-MC-Unique: 3AwmOY-QP06Fu3U4XIjoXg-1
X-Mimecast-MFC-AGG-ID: 3AwmOY-QP06Fu3U4XIjoXg_1773783157
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id DD5F119560B5;
	Tue, 17 Mar 2026 21:32:36 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.64.56])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 7F8C41800576;
	Tue, 17 Mar 2026 21:32:34 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 3/4] rust/drm/gem: Add DriverAllocImpl type alias
Date: Tue, 17 Mar 2026 17:28:32 -0400
Message-ID: <20260317213003.606088-4-lyude@redhat.com>
In-Reply-To: <20260317213003.606088-1-lyude@redhat.com>
References: <20260317213003.606088-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: GqjA4f7nvmUEnmEsZEQixWMkN2TI01MlL2ejCsGFtbM_1773783157
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: MGTPPMNNE6ZQNCAHTZ52KPJDLSGS6J2N
X-Message-ID-Hash: MGTPPMNNE6ZQNCAHTZ52KPJDLSGS6J2N
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org, Gary Guo <gary@garyguo.net>,
 Miguel Ojeda <ojeda@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Alice Ryhl <aliceryhl@google.com>,
 Shankari Anand <shankari.ak0208@gmail.com>, Benno Lossin <lossin@kernel.org>,
 Asahi Lina <lina+kernel@asahilina.net>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MGTPPMNNE6ZQNCAHTZ52KPJDLSGS6J2N/>
Archived-At: 
 <https://lore.freedesktop.org/20260317213003.606088-4-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This is just a type alias that resolves into the AllocImpl for a given
  T: drm::gem::DriverObject

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/kernel/drm/gem/mod.rs | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index b4199945db378..ad74c5159f725 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -33,6 +33,11 @@
 /// [`DriverFile`]: drm::file::DriverFile
 pub type DriverFile<T> = drm::File<<<T as DriverObject>::Driver as drm::Driver>::File>;
 
+/// A type alias for retrieving the current [`AllocImpl`] for a given [`DriverObject`].
+///
+/// [`Driver`]: drm::Driver
+pub type DriverAllocImpl<T> = <<T as DriverObject>::Driver as drm::Driver>::Object;
+
 /// GEM object functions, which must be implemented by drivers.
 pub trait DriverObject: Sync + Send + Sized {
     /// Parent `Driver` for this object.
@@ -42,12 +47,12 @@ pub trait DriverObject: Sync + Send + Sized {
     fn new(dev: &drm::Device<Self::Driver>, size: usize) -> impl PinInit<Self, Error>;
 
     /// Open a new handle to an existing object, associated with a File.
-    fn open(_obj: &<Self::Driver as drm::Driver>::Object, _file: &DriverFile<Self>) -> Result {
+    fn open(_obj: &DriverAllocImpl<Self>, _file: &DriverFile<Self>) -> Result {
         Ok(())
     }
 
     /// Close a handle to an existing object, associated with a File.
-    fn close(_obj: &<Self::Driver as drm::Driver>::Object, _file: &DriverFile<Self>) {}
+    fn close(_obj: &DriverAllocImpl<Self>, _file: &DriverFile<Self>) {}
 }
 
 /// Trait that represents a GEM object subtype
-- 
2.53.0

