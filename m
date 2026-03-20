Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9DD01099B27
	for <nouveau@archiver.kernel.org>; Fri, 20 Mar 2026 23:37:37 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id ACFA610EAFA;
	Fri, 20 Mar 2026 23:37:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MN9GgyQ4";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1F7314525C;
	Fri, 20 Mar 2026 23:26:41 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774049200;
 b=pUCeUtP+6J4RRs3/ccbZkez4n+Yl/HBS/5X0hrk1IF8CmjxHdgdEjHLKD+m4ZeqeEsxgX
 ipFWlWNJl5+MPgTzK4dzn+b+IL0u1SDrEpu/7gW0I/AgWyoq/sJ0KRCQWCor5wiJ6YGabDu
 36qq2SSAxirmBOqMw3xLXS2izfJ82pri72sI1ZWWh9wo+Di+r5w7LdNYULsL6QSDMGV2kPq
 GBXchJ9CvbbHD8mn5f/j2oUu4nXyDmscloyUsIG/eu12W9a8gZd2OcQHoHVD2u+OS39Jqzs
 Mira8kCWRsHfa3oGRAk38oxGLZ+l2dSxUT8lhpeu3Gn4E/veSrPMp0t2A9dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774049200; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=QouNEtmlaggCaQo2P5IO63zf/LsG/YgCtk54rapeiQI=;
 b=ZcpBp4NOcGVcKsA9Ju2xkeYfKNw/7iMYGb2kGbN6rwxBJHRhvT92WLSlnp0hWK+mgHVXA
 QQSDt8Vpz36T6wFtDoIXVqF0YKgvQQC7Hql0p3XEj7X64yayXCHzDIHt4ZTdc5enqKECj9K
 if0M1YTWOLkQPfxpLyN4VHB/Vuwa3OnyThlntlpNhwvVdxfA7Xw8i2jN4legPKm6LUMsl3S
 vcO3gwRPA8l8wG2ixoSTMLbLS9UNDPBq7PtmFtgBiJAFbyn1RP8TQiOK5AN3jBURPg3e/No
 t4d4dJ2YDbb2FEWtcn0cjuZK+4PmVW1eplQcwe53KHQyU1ZNAp/fq9EfEYUg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 894AE44D6D
	for <nouveau@lists.freedesktop.org>; Fri, 20 Mar 2026 23:26:38 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DAF4F10E1CC
	for <nouveau@lists.freedesktop.org>; Fri, 20 Mar 2026 23:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774049854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QouNEtmlaggCaQo2P5IO63zf/LsG/YgCtk54rapeiQI=;
	b=MN9GgyQ4AbE/dDxlT60H9zo8XC+5eWr6Eriz4j4kJ5xXF5qdWYF8qP5drAtLXhgFDB3paO
	Pdd7kUbKPjhkJ7s5VWNr4GepkI6df7I5PJ3bjMYLP9WCmebS4JjDhZlqqy2mmNpi73b1Q3
	yxtdUznOXke1XKoURM99o2wShD162zQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-563-4f6-IlVUOOmiogtqN-RcXA-1; Fri,
 20 Mar 2026 19:37:30 -0400
X-MC-Unique: 4f6-IlVUOOmiogtqN-RcXA-1
X-Mimecast-MFC-AGG-ID: 4f6-IlVUOOmiogtqN-RcXA_1774049848
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B695F19560A2;
	Fri, 20 Mar 2026 23:37:28 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.80.37])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 66852180075C;
	Fri, 20 Mar 2026 23:37:26 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 4/5] rust/drm/gem: Add DriverAllocImpl type alias
Date: Fri, 20 Mar 2026 19:34:29 -0400
Message-ID: <20260320233645.950190-5-lyude@redhat.com>
In-Reply-To: <20260320233645.950190-1-lyude@redhat.com>
References: <20260320233645.950190-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: b7Fzm1Xr6dfkkWbceyZ0dmHA8DcU726vU4uI7lP1gUc_1774049848
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: 7PAPXBCK5DLMS2YRZJNN3XZUFNQFYD6Y
X-Message-ID-Hash: 7PAPXBCK5DLMS2YRZJNN3XZUFNQFYD6Y
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org, Gary Guo <gary@garyguo.net>,
 Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Simona Vetter <simona@ffwll.ch>, Shankari Anand <shankari.ak0208@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Benno Lossin <lossin@kernel.org>,
 Asahi Lina <lina+kernel@asahilina.net>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7PAPXBCK5DLMS2YRZJNN3XZUFNQFYD6Y/>
Archived-At: 
 <https://lore.freedesktop.org/20260320233645.950190-5-lyude@redhat.com/>
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

