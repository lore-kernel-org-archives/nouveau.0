Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58F3CD6E55
	for <nouveau@archiver.kernel.org>; Wed,  3 Jun 2026 19:52:41 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AB073112330;
	Wed,  3 Jun 2026 19:52:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hIhF04wm";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id F021546784;
	Wed,  3 Jun 2026 19:38:58 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1780515538;
 b=KG4iyDd1l1JwKjO77GTOfWesRK4OCCxCRbDa845yHWISNuiFCIOYijTCCa3A5zUnWCXMg
 wtcqkI8Awcg/M1A3+xWnZ5zwTMBV/XSt8sLTL5We8+FuW42GJNw3fy5s0M+MjQYyC3NUrNI
 qz6ijHLyCEsUHXE70yS9HVdfRIudX/MJKqcUIsBR+puh3gHLd2j4yAbVZNp5DsQeRJX90DW
 POAEmY7GfEesVx6iy9O0K5PFZ8hH0h/4QgKpvrfh2ruSbflqy4N3fR7aeFGKPkSfPYTgWRV
 WUfvyYV2UPqHBEgYwoS/GEOy30B+ADbiYyJSZ3W0VSDxqpClhXh9l+W+NJTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1780515538; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=cF/fCKGGsVn6l967F1Qq9M9WKaqTKMJ/A9UZOUtdnUs=;
 b=Vli4XxJvDusevQEmDxu5i4YXqMe00vOGN7f+FTl2V9/JFwyCzCigAO3a4PXIS6F2Yi4hM
 KuKKv3G8hIXUuQmvGZVZ04ZeTEvN3lHLX8CeEIDQknH1EVLi4ABHuimV/JfEMOQ6HTpijNP
 VPNVyGOZ+AcUXTapMY42Co6ZKQ8kc8AFGElumjl8Ma1bHW+2UObptgyrOnW2jVGl8jB8k8C
 TJ/ux60JGhTEfw91nwp6nWCmvLr26FniHmCV3U0Sy3o1iVAG1HhiAOHHx/oKqrlBMwU5uld
 INUwdEgOwQzK4FY9yYob94CecVFHy8GHTi6CCE8QSuQvH9cZqT+V184Pm9oA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id E1FD744C81
	for <nouveau@lists.freedesktop.org>; Wed,  3 Jun 2026 19:38:55 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 56C5A11232A
	for <nouveau@lists.freedesktop.org>; Wed,  3 Jun 2026 19:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780516357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cF/fCKGGsVn6l967F1Qq9M9WKaqTKMJ/A9UZOUtdnUs=;
	b=hIhF04wmFcrHcfo3mqc7YRMJjStq/G2anFcgDjulZSWf1AFAblWJaWG/n/7rNpdivgy/W4
	v+FtUlead8g0w6mImGiqA5DLstjUbnGuVDVMbYCIwMtPZvq7qv4xEdtx2fatDD0JkchqkF
	8SdLUzGkwbPXizM3VX8kgGUUvPbv7zc=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-602-JWznmNClPk6VDIrlAHBT7w-1; Wed,
 03 Jun 2026 15:52:36 -0400
X-MC-Unique: JWznmNClPk6VDIrlAHBT7w-1
X-Mimecast-MFC-AGG-ID: JWznmNClPk6VDIrlAHBT7w_1780516353
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B735B18004D8;
	Wed,  3 Jun 2026 19:52:32 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.81.203])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 64930180049F;
	Wed,  3 Jun 2026 19:52:29 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v17 4/6] rust: faux: Allow retrieving a bound Device
Date: Wed,  3 Jun 2026 15:42:33 -0400
Message-ID: <20260603195210.693856-5-lyude@redhat.com>
In-Reply-To: <20260603195210.693856-1-lyude@redhat.com>
References: <20260603195210.693856-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: qp2XGLtvMEnvbZw-iDkihKvzNHzHdTLA3kXeRaxR8Eo_1780516353
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: YTBD3VDELXTHEYP55XGF3LEJ4ULLX2OH
X-Message-ID-Hash: YTBD3VDELXTHEYP55XGF3LEJ4ULLX2OH
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YTBD3VDELXTHEYP55XGF3LEJ4ULLX2OH/>
Archived-At: 
 <https://lore.freedesktop.org/20260603195210.693856-5-lyude@redhat.com/>
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

