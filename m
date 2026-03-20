Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DBE61099B27
	for <nouveau@archiver.kernel.org>; Fri, 20 Mar 2026 23:37:11 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5D54610E1BA;
	Fri, 20 Mar 2026 23:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RQoOVRX7";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B65214525C;
	Fri, 20 Mar 2026 23:26:14 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774049174;
 b=loppWTYh1e3GeiNLYA1XigNkUtQbSQrwnkRQW6KubqSG4YyRbOmT089JkEBgBiN7aNP0C
 qqs+7Tq8vpPLjzanzF3jCGq65cXvGyGrl+94K3VhyxtUCe2yOqOIC3Lcb2J/698xrRHEZCf
 xhvYFz/1lFrcv0OG0B108Xl7snvLFRDXwcpxWso9my92aQEZJrMGA0GaPbUjrCpbKLddb6N
 D6OVBAu31HVB2mVX0+fIWfZDQnWZ6SoJMCZCGGCJv8hod1yYRq+rs2FqzECVIF0eQfCghSd
 MKv20hslonorM4lih4QA4HleNLN5bGj/JlAz62iudvY1zaXxVC14sANqmbzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774049174; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=eGS+bPTCCnx2OfxFYkphRjFLuxpr51ULITK831fZk4E=;
 b=puzsaQRZHXAtclda8qeCAyDlSpcKuuH1nOEq8s9kHR3KyTHyiiZLtpEkp+S9GUlKEb03S
 5ThYNIWimv7DTQrPblw9tEmm9eFfHOVKkn1zTbtZRHMfVnjO28PUjbk70IZKSYCHR5ABq/8
 EmUj7FprR1j7b3yKcRH9QsLZbCm6GGbccIeq86IyMU4lK3sDv/sv83jmVxcH2fRLDf4r8AJ
 er6x3Sq8v4wj3uTF61phXkLK3JysZLnVQP58sQmyU0KEiSlU8T64YJ3TLYkMX2dPsIkH3Fw
 p33cTaEVsOCcmQ6JglVeBU1XAaqjWtsQvOcchcB6C0/tpB4kj4eI25L3LTRA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 3684B44D6D
	for <nouveau@lists.freedesktop.org>; Fri, 20 Mar 2026 23:26:11 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7E11610E172
	for <nouveau@lists.freedesktop.org>; Fri, 20 Mar 2026 23:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774049826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eGS+bPTCCnx2OfxFYkphRjFLuxpr51ULITK831fZk4E=;
	b=RQoOVRX7cvFssu1OT/GmNS7KSGD+hdnS7t/VWYIAJgNYd5y36jT6DsuTzoK/XW1tzQkna+
	WltHfJn+jJegGgfPg+It7vhX4zQOB6FlE5ufL6AgPUjy4nRnyabTYduHzMO+aXYoRhzoKW
	VXBaunUUo6BXFzxE2ffkuNMPJHEpOoc=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-364-MdSbmsTyP_ipftwrgNCuOw-1; Fri,
 20 Mar 2026 19:37:01 -0400
X-MC-Unique: MdSbmsTyP_ipftwrgNCuOw-1
X-Mimecast-MFC-AGG-ID: MdSbmsTyP_ipftwrgNCuOw_1774049818
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E7C04195608C;
	Fri, 20 Mar 2026 23:36:57 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.80.37])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 38C4B18001FE;
	Fri, 20 Mar 2026 23:36:55 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 0/5] Introduce DeviceContext
Date: Fri, 20 Mar 2026 19:34:25 -0400
Message-ID: <20260320233645.950190-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: P5P8RBBKLI80iST5m-AkQVvTKOiHfA3vOwqp4PTQKUU_1774049818
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: MYQQRD3YRQU3PRFC5TUZU6BCA53VBA3L
X-Message-ID-Hash: MYQQRD3YRQU3PRFC5TUZU6BCA53VBA3L
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org, Gary Guo <gary@garyguo.net>,
 Miguel Ojeda <ojeda@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Alice Ryhl <aliceryhl@google.com>,
 Shankari Anand <shankari.ak0208@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Benno Lossin <lossin@kernel.org>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MYQQRD3YRQU3PRFC5TUZU6BCA53VBA3L/>
Archived-At: 
 <https://lore.freedesktop.org/20260320233645.950190-1-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Previous version of this patch series:
  https://patchwork.freedesktop.org/series/160217/#rev5

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

Lyude Paul (5):
  rust/drm: Fix potential drop of uninitialized driver data
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


base-commit: d19ab42867ae7c68be84ed957d95712b7934773f
-- 
2.53.0

