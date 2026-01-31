Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5860E6BF3C
	for <nouveau@archiver.kernel.org>; Sat, 31 Jan 2026 00:16:43 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 86B6210E971;
	Sat, 31 Jan 2026 00:16:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hxd8PnQ/";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E0DA140F72;
	Sat, 31 Jan 2026 00:07:35 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769818055;
 b=kohbqKfz1tLamI2rhTQ5M4jF8W0zww2T9Fr5fPaDUoBAFIFBd2ClHnRgfmf2luMAv0pYw
 04Df5+cZpo4Sgl2yNQy+TYHWJjCLQuT92/DlMP9BKOcfJTJbcreMJENu6Ok2ye/FqljkXJH
 2Q2cRuQ96u07ZJ7Izrqtg4gf4St6Dag3Z/AD07bTZDmXPkmy9kYhS4KO7TGXmmkFXKY40Uj
 1Kc6RUw3o4e3/qXPIqf4dwAFpIKqXbtNWavPjfV2bM5Aiz6ESF/1l1/pDWpMLV6X0X9v5De
 ejDQISKYjMeakSrW4IQSiyJvHoSE8Zy7jVjG4KPO4Bd1JECao90ShGo9BdKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769818055; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=IeGVh8eg3y5XRBcRrvdnHSZCYu5A8t1Oo+7qwOk5rSg=;
 b=NCclAPDvvyybPg5TH6EwbB6mFTdxRUiqFa6+xfTUtqOi/5xgHIHOubLl8UiRuGKbWg/uf
 JZofPazHdp/ACcf3ovCfTSCNFqFa/HpA0rf2U2PnsX2almb713ilSEgx8rxvXEgYhwJ4U9o
 iGa3gqQowKk9d+4T1JDCzg8BYMHFlsz63WYBC9I/7nMchqJxc/EwuCCMGFm7tsSd4cOHVAe
 uNOqOCxqGaJzyLgNOwcQ7KWeUHcxbo+sogPM0F9i+D4LNBXrGlyNCeKH6VUQDcXROGFl1UD
 c+PemkX895PZXQfHzZVD2bQoAZ5q+YtLBbR1ScIQxZKkvB0BFUeNsYwje/vw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B27A140F63
	for <nouveau@lists.freedesktop.org>; Sat, 31 Jan 2026 00:07:32 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 173DD10E1A4
	for <nouveau@lists.freedesktop.org>; Sat, 31 Jan 2026 00:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769818599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IeGVh8eg3y5XRBcRrvdnHSZCYu5A8t1Oo+7qwOk5rSg=;
	b=hxd8PnQ/k4SKhe/8icLReT+VLy91o2Bw4ICyGlXXySOh5sl1ucoExxWQpSnW0X1/n5Z0Mp
	yEG2G5nGX5f81ZXWLXG1wLgdyTeiWBWUsps4A7fVfif1zqEzp8zSQRgK69tjnMM0rQDwTy
	+3mmD0MSSDZC64rwEL5CdkBmCWnlGOo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-581-jGUs_dbeOb6KgEEDE4Lu3w-1; Fri,
 30 Jan 2026 19:16:38 -0500
X-MC-Unique: jGUs_dbeOb6KgEEDE4Lu3w-1
X-Mimecast-MFC-AGG-ID: jGUs_dbeOb6KgEEDE4Lu3w_1769818596
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2FF391800451;
	Sat, 31 Jan 2026 00:16:36 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.81.64])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 15D6C18002A6;
	Sat, 31 Jan 2026 00:16:33 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v5 3/4] rust/drm/gem: Add DriverAllocImpl type alias
Date: Fri, 30 Jan 2026 19:13:32 -0500
Message-ID: <20260131001602.2095470-4-lyude@redhat.com>
In-Reply-To: <20260131001602.2095470-1-lyude@redhat.com>
References: <20260131001602.2095470-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-ID-Hash: TH7X7VD6EKMZ4QXH6VMB456466SF3YUD
X-Message-ID-Hash: TH7X7VD6EKMZ4QXH6VMB456466SF3YUD
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org, Miguel Ojeda <ojeda@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Alice Ryhl <aliceryhl@google.com>,
 Shankari Anand <shankari.ak0208@gmail.com>, Benno Lossin <lossin@kernel.org>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/TH7X7VD6EKMZ4QXH6VMB456466SF3YUD/>
Archived-At: 
 <https://lore.freedesktop.org/20260131001602.2095470-4-lyude@redhat.com/>
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
2.52.0

