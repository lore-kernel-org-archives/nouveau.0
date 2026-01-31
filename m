Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E902E6BF3C
	for <nouveau@archiver.kernel.org>; Sat, 31 Jan 2026 00:16:25 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4ACB110E1A7;
	Sat, 31 Jan 2026 00:16:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="KrsG3FP9";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9C8DB40F63;
	Sat, 31 Jan 2026 00:07:15 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769818035;
 b=t2tjP3GZzkFGJBEVlTvwfrqlSAoA0hEbVdBVCXdG7Xo8rOXJHG+7uKyzx6Ln58EddOc/I
 5V+n3wSsqNl3I5xMzy7RDNiLO+BDG6l+1BemC4ayB0NNg9/lTNPT+I0a5pNmkW0ih5XiSp4
 makRl8en/fHkhzkImk/9Qda8V6s869kpypXW+6Ssy19Bxd6rjxdCOhrRgtWorxafRVF1nXq
 0VRpDuVLvlEzQNvMIGNWmIlI97AA1DmJ1niKR6IMhGeb3hx+Al2Y3aHqrfBay1gWtyecFx+
 ZJMOkS5OMkwIcToMS2TSFBf/CrCB2wjZ/BrN7u4TIshnYDXGryaKK0EBROZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769818035; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=DUlHZCO3uYHyEV1uv7j6n5bPLjINc4Q3Eh1O4mdV7Bg=;
 b=XbEgXufNLYF0NUylG0eHw2jgRyCb7MLhOK2Li5gwzrvcYPEJFF6ET1lSOCPhnqRf1vgs/
 5uFvPtDImbzGBmGay09uoe4svOk7jI9px/i/CWdGk+6B9gMlVTxUglR+R8TaPY4hxjQWSmb
 v1N5Mydb5HOOYzSsgLB6i0NoJUqKLykgCK2ul5clKHGZtK+V6bzWMZ91FWJw4qiyG/5BuuM
 5eYLGqJ6yEZZYxGJqUpLE/M5BPqZVJ16rdA6bhRc9687zxGxIOuQEzFKsaE1jEb/2UX0bM0
 BUL+5xqq9wnFLeXW2JvYNLbKA5k8oc+Cf26or4ufHviIV8xAcd4SNqDasIUg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 8B01740ADB
	for <nouveau@lists.freedesktop.org>; Sat, 31 Jan 2026 00:07:13 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D3B2F10E079
	for <nouveau@lists.freedesktop.org>; Sat, 31 Jan 2026 00:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769818579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DUlHZCO3uYHyEV1uv7j6n5bPLjINc4Q3Eh1O4mdV7Bg=;
	b=KrsG3FP9pUkXOK12A3P5BXva0HYf9CQRbcnT8WtcN+7GDolMPCwToLZ+VGFhgo04AXunBZ
	R+I0OoN++WUFNsKM2URkK44OMABZ+ODL8/eShFYKdsYMH0J5tSEPx1goRci3GfH/7Jn95L
	pjtEkIubhVU4RMkA2rOaTmlg8vVAbf0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-228-zlw75-UyNGmfOJGcqocEnw-1; Fri,
 30 Jan 2026 19:16:16 -0500
X-MC-Unique: zlw75-UyNGmfOJGcqocEnw-1
X-Mimecast-MFC-AGG-ID: zlw75-UyNGmfOJGcqocEnw_1769818574
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 351AB180044D;
	Sat, 31 Jan 2026 00:16:14 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.81.64])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 1676A18002A6;
	Sat, 31 Jan 2026 00:16:11 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v5 0/4] Introduce DeviceContext
Date: Fri, 30 Jan 2026 19:13:29 -0500
Message-ID: <20260131001602.2095470-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-ID-Hash: IBFHGV6YH4URE77WIPRLNOINCSFONPW5
X-Message-ID-Hash: IBFHGV6YH4URE77WIPRLNOINCSFONPW5
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/IBFHGV6YH4URE77WIPRLNOINCSFONPW5/>
Archived-At: 
 <https://lore.freedesktop.org/20260131001602.2095470-1-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Previous version of this patch series:
  https://patchwork.freedesktop.org/series/160217/#rev3

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

This patch series depends on the two pre-requisite patch series:

* https://patchwork.freedesktop.org/series/160523/

                          Series-wide changes

V2:
* s/DeviceCtx/DeviceContext/ for consistency
* Move private driver-data availability to the Registration
  DeviceContext
* s/AnyCtx/Init/
V4:
* Split out DriverAllocImpl into it's own patch

More changes described in each patch description.

Lyude Paul (3):
  rust/drm: Introduce DeviceContext
  rust/drm: Don't setup private driver data until registration
  rust/drm/gem: Use DeviceContext with GEM objects

Lyude Paul (4):
  rust/drm: Introduce DeviceContext
  rust/drm: Don't setup private driver data until registration
  rust/drm/gem: Add DriverAllocImpl type alias
  rust/drm/gem: Use DeviceContext with GEM objects

 drivers/gpu/drm/nova/driver.rs |  10 +-
 drivers/gpu/drm/nova/gem.rs    |  11 +-
 drivers/gpu/drm/tyr/driver.rs  |  12 +-
 drivers/gpu/drm/tyr/gem.rs     |   3 +-
 rust/kernel/drm/device.rs      | 250 +++++++++++++++++++++++++--------
 rust/kernel/drm/driver.rs      |  52 +++++--
 rust/kernel/drm/gem/mod.rs     |  64 ++++++---
 rust/kernel/drm/mod.rs         |   4 +
 8 files changed, 305 insertions(+), 101 deletions(-)


base-commit: cea7b66a80412e2a5b74627b89ae25f1d0110a4b
prerequisite-patch-id: ddb20be75c8fc92ba2d48a5c4aa8e724202de1ff
prerequisite-patch-id: 87e69cd89a806392d3275b19fbfb160d44d957c9
-- 
2.52.0

