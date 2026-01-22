Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DF5D6CFAB
	for <nouveau@archiver.kernel.org>; Thu, 22 Jan 2026 22:51:31 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7A66A10EB6B;
	Thu, 22 Jan 2026 22:51:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UePsLDqN";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id BB788404B5;
	Thu, 22 Jan 2026 22:42:39 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769121759;
 b=fdsRW/0pPkIJ4Oa6hg0qV7I0J1sXbdN8iCMKEplTLTgHucwM+ARj02JIR63L12VTxOL2T
 1MIH8WiWQluY2UXAZRfpNJMG5qH+h0hum2+K7VKi3Uk1vKrJvk9v08rsYvy6DqnnfT6mTLV
 uxF04LpsXqPr7bUHDV5eiTZMJcpRNiGAxbdgOCcQ/cFMjSYVXWJNWWFdkRmiyfk3AjMDhr1
 HZd3lk7VUHyGu7K8uptoSIeeNQjdZQL9S1XKcoNwmGRqvvzKsape4etDCqbh7HD6/AJsju6
 DG1NuV4R8ZxR55MIZ/ifw3m3m3GIEp2kuxNqzRPqPsPuKVX4ynnMILJ66OAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769121759; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=UCysTo7OMV2/jfbYw2YK22A1cPCErwIaomCVQtYlQaE=;
 b=eAIrbBfkTDlJ9V4l/DKpMibMz61WHZLR2S6GYuaTYSFqrdUT9ex8dhe5q8cWNuUqJFHHN
 vbxmlGxf+nwn4gu3BClxk4mCrK6v/fRWQUM9bN10mUaP7BgQVO4ddEkkqlIvmDTa2lna1hp
 StJKVj4Pf3DT4quoUVKmzdGA1Tm+VdA+gDNwQ7wz9bmkB/9VlNakK39XpVaYMEnXyXpjdc1
 JpDmDOzXWWgtphK0haqSQY3U1GvaTsdnWPM4NyGq1INC+P87IVf8DD6TomzUPTY9tYWE75B
 Nn3dC8tCxJtMgBronOdXNKpKFGcmcPe5/YDFnvCbZ2jEAL84G9D8aUZCV10g==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 0BA18403B4
	for <nouveau@lists.freedesktop.org>; Thu, 22 Jan 2026 22:42:38 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6C7E610EB4F
	for <nouveau@lists.freedesktop.org>; Thu, 22 Jan 2026 22:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769122286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UCysTo7OMV2/jfbYw2YK22A1cPCErwIaomCVQtYlQaE=;
	b=UePsLDqN0xslpCH3XExQu30pJLy1pEoCQd4V0F7oNthu5/B/JHqSfmP37whBhYfpsoawve
	sItAuBdHuWtCa1BCmQDSS5B7YflibZIlU3dyy82W0eKUl+U7SyUTYfgzPO9XOGlp22UAO6
	MnDDLkRa29ZyVZWHEgIFIMlYjaCRHjQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-591-66iMN1VCOG61fk1WMto-bA-1; Thu,
 22 Jan 2026 17:51:21 -0500
X-MC-Unique: 66iMN1VCOG61fk1WMto-bA-1
X-Mimecast-MFC-AGG-ID: 66iMN1VCOG61fk1WMto-bA_1769122279
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6E8C918005B9;
	Thu, 22 Jan 2026 22:51:19 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.89.232])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 7B69A30002D8;
	Thu, 22 Jan 2026 22:51:16 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v3 0/3] Introduce DeviceContext
Date: Thu, 22 Jan 2026 17:46:35 -0500
Message-ID: <20260122225057.3589500-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-ID-Hash: M4SWCFERQPG37FQSBZZRBKCU34TRGQVG
X-Message-ID-Hash: M4SWCFERQPG37FQSBZZRBKCU34TRGQVG
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/M4SWCFERQPG37FQSBZZRBKCU34TRGQVG/>
Archived-At: 
 <https://lore.freedesktop.org/20260122225057.3589500-1-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Previous version of this patch series:
  https://patchwork.freedesktop.org/series/160217/#rev1

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
* https://patchwork.freedesktop.org/series/160525/

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
 rust/kernel/drm/device.rs      | 246 +++++++++++++++++++++++++--------
 rust/kernel/drm/driver.rs      |  55 ++++++--
 rust/kernel/drm/gem/mod.rs     |  64 ++++++---
 rust/kernel/drm/mod.rs         |   4 +
 8 files changed, 303 insertions(+), 102 deletions(-)


base-commit: 6ea52b6d8f33ae627f4dcf43b12b6e713a8b9331
prerequisite-patch-id: d596b2a5a81fb067cb267fe30b6e2d8fd47fddad
prerequisite-patch-id: 32f09c643498c714d92a6a87b3de220b5d37b41e
prerequisite-patch-id: 28f11c925aab9ed9d4fa70dbbf2c4a7accb5c05d
-- 
2.52.0

