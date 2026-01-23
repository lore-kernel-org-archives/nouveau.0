Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7461CD778B1
	for <nouveau@archiver.kernel.org>; Fri, 23 Jan 2026 23:12:47 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 94CED10EC0B;
	Fri, 23 Jan 2026 23:12:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XWSMMurI";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8A55F4062E;
	Fri, 23 Jan 2026 23:03:54 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769209434;
 b=h9fP9cuvUxHltCAaeqlKMQZjKCVahXfi/bRxoifG2ploHkywihec/e+qXh7kiuMs7sM/P
 3vpFwt8vNjNpouPvqBHQ6WRzFwTHEUZ4qzl+EC0Uv2TGDjZNmQX0Qo3m8iBXvHipiZAa3YH
 Z7t2W0ItG/G2DyN4LPpCqGFCM1pweTqgoCAXZD48kgV0gRnx3LRc4jLhyjysZRIIY4VsiYd
 7LfU10DYoBIZcpbKAmh3rPNPJ1nnrBiGRmwFQAbev0FZQoBTaJ5Hp6W1ULtJZWucQgGU6Gj
 By/5BFAYOY/vBu7NumBPrjqi4LfsoT3ETSreU5eH8uzMPWvi3I+ImuSCFKjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769209434; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=q3EQGPwM17ahHgggCnLwM/epN4ehtW+OIYvbEeIxdv8=;
 b=qFWC0EgyveV0MZapmGA8dDpul3rUHd3E6tcydCqz7LEc7GtMTXPvCFE41a7UrSGZrCi8+
 KSw/OzLsgjoMBInXP7WXKGLlGpmsYO2ZJhzZt7nfvqA2yJ7RgYh+fcMWrRBxQWXR9l8pZ9y
 2IvsCFLFEL9ZmGIaNmqxrxDVOnqDnFJEP06JpwAA/r8tk61UpkukOS+koamDcvVWzLF/9S+
 IAbqxCmITdQZXOUwBWvEhwgNHnIE9Ezl5rx28LhS/YC/UvoGAzwBMQLEgYUx2IQfZhOIowL
 gGwPyXBOXHgo9FcFT7wo/2AMKVxhpW/cLD/Yh+nrM+cb1KbsVgMPaWSLdpvQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C08C5400C5
	for <nouveau@lists.freedesktop.org>; Fri, 23 Jan 2026 23:03:51 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6CAAD10EC00
	for <nouveau@lists.freedesktop.org>; Fri, 23 Jan 2026 23:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769209962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=q3EQGPwM17ahHgggCnLwM/epN4ehtW+OIYvbEeIxdv8=;
	b=XWSMMurIXo8PxJRyOoYCru7tIuY5eEt63Z4hDXtEYFfa/5GZqm/LmLWpuEQRSTiIVDFr3Z
	bvP/+5Icm5mmgP0ZeLgfXyuvop/hIduFr7kDeEPb8y0m8kAi2FIqjL7QVZP8ROn9akaB7e
	KxH4nJuzsZAuRDucxhyM9kJrPdzn9Js=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-194-tpzwDz1ZM7OmPHgWxAyfjQ-1; Fri,
 23 Jan 2026 18:12:38 -0500
X-MC-Unique: tpzwDz1ZM7OmPHgWxAyfjQ-1
X-Mimecast-MFC-AGG-ID: tpzwDz1ZM7OmPHgWxAyfjQ_1769209956
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6FEEE1956054;
	Fri, 23 Jan 2026 23:12:36 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.89.232])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id E0F581958DC4;
	Fri, 23 Jan 2026 23:12:33 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v4 0/3] Introduce DeviceContext
Date: Fri, 23 Jan 2026 18:10:12 -0500
Message-ID: <20260123231230.248500-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-ID-Hash: 7CR4NSXWOWGV3M5GIZ6KUPHC6JU3O4JQ
X-Message-ID-Hash: 7CR4NSXWOWGV3M5GIZ6KUPHC6JU3O4JQ
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7CR4NSXWOWGV3M5GIZ6KUPHC6JU3O4JQ/>
Archived-At: 
 <https://lore.freedesktop.org/20260123231230.248500-1-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Previous version of this patch series:
  https://patchwork.freedesktop.org/series/160217/#rev2

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

More changes described in each patch description.

Lyude Paul (3):
  rust/drm: Introduce DeviceContext
  rust/drm: Don't setup private driver data until registration
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


base-commit: 5ec66bbc74883b73d169ceb25dcb7a5cb22e275b
prerequisite-patch-id: ddb20be75c8fc92ba2d48a5c4aa8e724202de1ff
prerequisite-patch-id: 87e69cd89a806392d3275b19fbfb160d44d957c9
-- 
2.52.0

