Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F38FF6E82
	for <nouveau@archiver.kernel.org>; Tue, 17 Mar 2026 21:32:26 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AA63710E680;
	Tue, 17 Mar 2026 21:32:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LHkXync9";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id DE82D451F5;
	Tue, 17 Mar 2026 21:21:34 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773782494;
 b=duSjhLHjwyLtEQVed9jBcRsGKZYQ+CqPM9V099F5RV3QVwJvOU2kvqVSN2xRizpIlbU82
 rPqOTbHA90TPggKUhX56BXkcQfc3fKEHQE3sCd7p8xawvtKF66yDufkKnDcec6dTfA1cfJG
 d+BBYjQKipvcKO0sm+fgXTt5n9T2gFX9XCG8hRCPI8sF2ftnLX5dKW2AVKESVSemq3NWKqg
 FpVrnjkarwA4zhPtCZuK8BNexqarSTBVusNrdegmpqzzOQOepFvUYzy9nDitDRMJqUi+xI/
 wj+0u1a6qtWv7Khz5hOt0PPAqmdjeJdfj6JELpFoXgfiiYihHc6Gxb36XAQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773782494; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ij1yQntSvQFt7/RHVuQLId2L2krPhGO2KVctxdDPVP4=;
 b=lLEHq0OCCO8XUcInh/nh56rjsJeT25faeIXbcPQJvcfgf6PaJK5ymT9zQ57kWdR033UJ4
 WGt1I+iT383dfii7H3d5LARt7Nwef6Sdjf+HmsHqKTofK2mbLYRga/KL4zDSTiyHyCYLVzA
 Bp6BLqEadUzDDUwm5cSNNKvPFpvZWz0Q9Rld3H9pniUwvcAXKhQZLHF3mq+IZyqwIgb2Gbs
 hFj4LmeMlMzwZmOYH6W58sEh3lKfcl/naGv8hRwOcWkWkEhwHTUg/jOaUk7mZGft1Ds7+ps
 5gr8VHCfY4rY6+f7MwCl2++RwQy8cTZ+EeBnaxb/Mdsmt7v4JbUca1Qu83jQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 3272E43446
	for <nouveau@lists.freedesktop.org>; Tue, 17 Mar 2026 21:21:32 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 432ED10E645
	for <nouveau@lists.freedesktop.org>; Tue, 17 Mar 2026 21:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773783140;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ij1yQntSvQFt7/RHVuQLId2L2krPhGO2KVctxdDPVP4=;
	b=LHkXync9TK9G14I76wZKgs7MuV0ogNK6jv27Xkhcq6uoC992vCBxYkSk5AUn0OqHqAjhyD
	wc3CLXWJFUhsyh5JaYVLothBf5AtFGChXocrZ4OnpNm+ry6g8SAWyREfR4OBxXDqURuae+
	Wzhn/HTdD6hKeblaU/OeYRWCo64CatM=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-77-wj7QIJHgNdybYpTePyw_Tg-1; Tue,
 17 Mar 2026 17:32:14 -0400
X-MC-Unique: wj7QIJHgNdybYpTePyw_Tg-1
X-Mimecast-MFC-AGG-ID: wj7QIJHgNdybYpTePyw_Tg_1773783132
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3CC691956048;
	Tue, 17 Mar 2026 21:32:12 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.64.56])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id AFB5D1800576;
	Tue, 17 Mar 2026 21:32:09 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 0/4] Introduce DeviceContext
Date: Tue, 17 Mar 2026 17:28:29 -0400
Message-ID: <20260317213003.606088-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: oSOxPgj8hdnRvkuzOsSeeHgtqs0rdlRX58DnFf64Sdw_1773783132
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: YRPDXJHSJTSQ672TDK64YB2TP6OLZ34P
X-Message-ID-Hash: YRPDXJHSJTSQ672TDK64YB2TP6OLZ34P
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org, Gary Guo <gary@garyguo.net>,
 Miguel Ojeda <ojeda@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Alice Ryhl <aliceryhl@google.com>,
 Shankari Anand <shankari.ak0208@gmail.com>, Benno Lossin <lossin@kernel.org>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YRPDXJHSJTSQ672TDK64YB2TP6OLZ34P/>
Archived-At: 
 <https://lore.freedesktop.org/20260317213003.606088-1-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Previous version of this patch series:
  https://patchwork.freedesktop.org/series/160217/#rev4

One of the unsolved issues we still have with the rust DRM bindings is
the ability to limit certain Device operations to contexts where we can
guarantee that a Device has been fully initialized and registered with
userspace, or vice-versa (e.g. must be unregistered).

While the previous solution for this that I had was simply not exposing
drm::Device at all until the device has been registered with userspace,
unfortunately this isn't enough since:

* As we found out with Tyr, drivers occasionally need to be able to
  create GEM objects before device registration
* We would still need to be able to handle KMS callbacks which could be
  invoked after KMS init but before userspace registration (not handled
  in this series specifically, but DeviceContext will be required for
  handling this).

This patch series provides a pretty nice solution to this, by
implementing a very similar solution to kernel::device::DeviceContext:
introducing our own DeviceContext type state.

                          Series-wide changes

V2:
* s/DeviceCtx/DeviceContext/ for consistency
* Move private driver-data availability to the Registration
  DeviceContext
* s/AnyCtx/Init/
V4:
* Split out DriverAllocImpl into it's own patch

More changes described in each patch description.
Lyude Paul (4):
  rust/drm: Introduce DeviceContext
  rust/drm: Don't setup private driver data until registration
  rust/drm/gem: Add DriverAllocImpl type alias
  rust/drm/gem: Use DeviceContext with GEM objects

 drivers/gpu/drm/nova/driver.rs |  10 +-
 drivers/gpu/drm/nova/gem.rs    |  11 +-
 drivers/gpu/drm/tyr/driver.rs  |  12 +-
 drivers/gpu/drm/tyr/gem.rs     |  10 +-
 rust/kernel/drm/device.rs      | 252 +++++++++++++++++++++++++--------
 rust/kernel/drm/driver.rs      |  52 +++++--
 rust/kernel/drm/gem/mod.rs     |  64 ++++++---
 rust/kernel/drm/mod.rs         |   4 +
 8 files changed, 312 insertions(+), 103 deletions(-)

-- 
2.53.0

