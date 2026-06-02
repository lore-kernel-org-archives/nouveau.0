Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC494CD6E60
	for <nouveau@archiver.kernel.org>; Tue,  2 Jun 2026 17:28:45 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B4F7410F455;
	Tue,  2 Jun 2026 17:28:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GNSArR0A";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 718744675E;
	Tue,  2 Jun 2026 17:15:05 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1780420505;
 b=tdtRghFxW2qYL48dCazD6TXJt/izGYJ+29qpPRCP1m2RqyQXR825MiaT3/27fkyb1T0g6
 te3cqycht4o3aUTVjKrWrkCy+OsoFGCF1SIVzRrLFESPchsNF4c2e1IAa7lGfWrXwrW2iKo
 INm92X5Mk+ChUG6kMWQ9qLdrUSdZIWNqV/0htHQ2db+b+Osw6QeL+zw1nqGnvjFwdIdkXqW
 U7W+vOtZjdHN6cSn/zyoKdKfVeZlN7OK7+FHwBFvF95o0nxbBUtqaMSqFj0qv6iQclpLnNV
 dKup/6xXNoEb13wLrzWD8fyxHy+/o+tC1rZyQsvZBEL1BtOLAv012bo4BjHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1780420505; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=cF/fCKGGsVn6l967F1Qq9M9WKaqTKMJ/A9UZOUtdnUs=;
 b=fr9s60/L8RF6L87gL6EUdNSr59P9OG111l3blpbxUxPRr+6WcHmzpUPJdubFTF1pcewPb
 0Dnkwi5LvA92Zs3I6BUPKlLqi467JqgVantZr5EqWP0H4CILs4bNS1RzmrYgrVgz5i0idOV
 Vrh98/QT2yh1TxrxUqKBlsMDmKAxTRcA1r/pylJIPgU+b7TZmnoktEHOhhmpaV73gEDUNqU
 L5nCLr8me2vV2qwpkD9MaMjBUvG6YiMUCyiMRYRx+tNzkw4zr9Vfgf9zj3CBaLxRv4nr9Rg
 Gfj5raNjAZdAIi6eROlyr5d/llUcv5OvpZTJXjWvKOzoOdPGuMQW+6TsQM5w==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 783ED4675C
	for <nouveau@lists.freedesktop.org>; Tue,  2 Jun 2026 17:15:03 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7C53910F42F
	for <nouveau@lists.freedesktop.org>; Tue,  2 Jun 2026 17:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780421322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cF/fCKGGsVn6l967F1Qq9M9WKaqTKMJ/A9UZOUtdnUs=;
	b=GNSArR0AqH11L2muL46YiKFcgsgLQu35PbiW+5w4mWSddBTQCentvqOo8k7Cv86Y2qidEp
	E8AuJNHh6uj8KAWtUguH59b6mgBblmS0FsJHnEO3KXEfUUjuprNQt+Axx/bPkK1SsmjqS3
	pMbjkbYZWDLEFXcqhrZanvHHKVG8AKg=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-39-sPPblZQJNcCS6PCce_xYQw-1; Tue,
 02 Jun 2026 13:28:38 -0400
X-MC-Unique: sPPblZQJNcCS6PCce_xYQw-1
X-Mimecast-MFC-AGG-ID: sPPblZQJNcCS6PCce_xYQw_1780421315
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E6C631800617;
	Tue,  2 Jun 2026 17:28:34 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.81.216])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A680F19560A7;
	Tue,  2 Jun 2026 17:28:31 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v16 5/6] rust: faux: Allow retrieving a bound Device
Date: Tue,  2 Jun 2026 13:25:04 -0400
Message-ID: <20260602172807.1051806-6-lyude@redhat.com>
In-Reply-To: <20260602172807.1051806-1-lyude@redhat.com>
References: <20260602172807.1051806-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: cJ4k1laLBuW_FeL9L8TKIRrBOTHNcOm1nW5KvFlDEMQ_1780421315
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: 5QACOG6ASKBP5JJ3O44LZHV5U6ISNLFW
X-Message-ID-Hash: 5QACOG6ASKBP5JJ3O44LZHV5U6ISNLFW
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5QACOG6ASKBP5JJ3O44LZHV5U6ISNLFW/>
Archived-At: 
 <https://lore.freedesktop.org/20260602172807.1051806-6-lyude@redhat.com/>
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
 rust/kernel/faux.rs | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/faux.rs b/rust/kernel/faux.rs
index 43b4974f48cd2..e0856b2964a2c 100644
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
@@ -59,8 +60,8 @@ fn as_raw(&self) -> *mut bindings::faux_device {
     }
 }
 
-impl AsRef<device::Device> for Registration {
-    fn as_ref(&self) -> &device::Device {
+impl AsRef<device::Device<device::Bound>> for Registration {
+    fn as_ref(&self) -> &device::Device<device::Bound> {
         // SAFETY: The underlying `device` in `faux_device` is guaranteed by the C API to be
         // a valid initialized `device`.
         unsafe { device::Device::from_raw(addr_of_mut!((*self.as_raw()).dev)) }
-- 
2.54.0

