Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49545C88E72
	for <nouveau@archiver.kernel.org>; Thu, 17 Sep 2026 19:09:05 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD2910F079;
	Thu, 17 Sep 2026 19:09:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RKhytnOR";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8B965481F1;
	Thu, 17 Sep 2026 18:51:26 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789671086;
 b=NkXuOFfz6xJ8qKcTxtsY9VkJERKq7TSsPzCTFTl7a7pqE1kTf9bqfSq5BsmK6WIINLd8d
 u0jstMA9HduKr6AT58DTkwkURDyFn6PD+8t2idG5FiN6yLKuIKf3mlEmrgfcKyyXLsntJP7
 xQPuJlij092nm1UDJAweHF74rjB6n4BqHbKl+0xxZi/yZJ/XMTETg1ai7NK4MZS6kkzRTRn
 9rYSD2Wc7JZGizJJ1yFkZ1r2UCI8gl3PMaKpk+Ft0eMFmljiQ97W1m76xkNUrK9C6mZARds
 sry/o1nQ8IfIt1AU774k+LqPSIHfVLVDkY++1hZyP7XXCskAwhN2fcHKvLcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789671086; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Shd+9zYz2MIFpfBEwcTjBlPbohGUXJNzi3P46VFt1WQ=;
 b=ne2wdmqdEYaiWVmMxOUOVLz7E54I0vU8Q2ZGwkFXRFmhSYAjfXToFnu7peCQ4YQo81yfA
 BMhqPA/WM0nAoCCTakxF2GxoSlcPQ7ole/L/qGCsAYwNqW7nNUbA5skaak3DeI13g8fyw7r
 mKFsAzcTQunsmyL1oqbDLhqA9yPT6wiBDieTpmbIWOADzKY+415hEsEhYxLW1CaIT9WArNj
 LyXQykIl4znMVB66bRPdXwwlfbh/Bsc51YTALY+/C3pzR1P4pwRG2JhBtpCJrE8u2/ODmra
 AgB6XB76gug9N91Kr5/s1EfTW3wJ5tDlf1NR3d/Y4RjlyXUgY3X/jcqnqdhA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id DF49A481B7
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 18:51:23 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7C11D10F071
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 19:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789672140;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Shd+9zYz2MIFpfBEwcTjBlPbohGUXJNzi3P46VFt1WQ=;
	b=RKhytnORL2+Q6ayiW9q/NhWAfVNEpNI7S4HMwX++wCWrhT6We2Bk+UojGRKKPQJAMBgKW6
	0Szfws6U2+PivD1LU9SdjfT27+I6TYIp/T8ZFGauEahr1MFbRtmxCeNWeb5FeMj+9YE/iO
	xLWNWYciVz3uwv9YpGpD2YJOCLIqBm0=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-101-laRmQZWkNrSytWpybp495g-1; Thu,
 17 Sep 2026 15:08:55 -0400
X-MC-Unique: laRmQZWkNrSytWpybp495g-1
X-Mimecast-MFC-AGG-ID: laRmQZWkNrSytWpybp495g_1789672133
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6CEFA197750B;
	Thu, 17 Sep 2026 19:08:52 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.64.177])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 9530C19AC048;
	Thu, 17 Sep 2026 19:08:49 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/5] drm/nouveau/gsp/r570: Follow OpenRM's runtime PM
 process more closely
Date: Thu, 17 Sep 2026 14:54:24 -0400
Message-ID: <20260917185916.1089621-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: GGkPuxpXDpp6KZG-SDFvmtM3ou9U3xTvNfBGcrGdYLs_1789672133
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: NH4Y6W2MT5J2KOQL6WCIMHOL226M6DFD
X-Message-ID-Hash: NH4Y6W2MT5J2KOQL6WCIMHOL226M6DFD
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Dave Airlie <airlied@redhat.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kees Cook <kees@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Hongling Zeng <zenghongling@kylinos.cn>,
 Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NH4Y6W2MT5J2KOQL6WCIMHOL226M6DFD/>
Archived-At: 
 <https://lore.freedesktop.org/20260917185916.1089621-1-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

While we have runtime PM working a lot more reliably then in the past
with R570, we're still doing things a lot differently then OpenRM. For
instance, we don't save/restore comptag backing stores, and we don't ask
GSP whether it's OK to enter GcOff.

This series fixes this, and gets our runtime PM process to look a lot
closer to OpenRM's by implementing some missing pieces and workarounds.

Tested on my daily-driver desktop with an AD102, a ThinkPad P17 Gen1
with a GA103GLM, a Dell Precision 7780 with an AD103, and my test
machine with a GB206.

Patch series based on drm-misc/drm-misc-next. Branch with patches here:

	https://gitlab.freedesktop.org/lyudess/linux/-/commits/nouveau/rpm-openrm-sync

Previous version:

	https://patchwork.freedesktop.org/series/173901/

NOTE: There are no actual changes besides a single fix to patch 1, which
had already been requested from airlied but somehow didn't get sent with
the rest of the patches.

Lyude Paul (5):
  drm/nouveau/gsp/r570: Add support for INTERNAL_GCX_ENTRY_PREREQUISITE
  drm/nouveau/gsp/r535: Add support for MEMSYS_GET_STATIC_CONFIG
  drm/nouveau/gsp/r570: Add comp mode workaround from issue #3172217
  drm/nouveau/gsp/r570: Start saving comptag backing stores
  drm/nouveau/gsp/r570: Enable Gcoff in fbsr again

 drivers/gpu/drm/nouveau/include/nvif/cl0080.h | 10 +++
 drivers/gpu/drm/nouveau/include/nvif/device.h |  1 +
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  6 ++
 drivers/gpu/drm/nouveau/nouveau_drm.c         | 13 ++++
 drivers/gpu/drm/nouveau/nvif/device.c         | 13 ++++
 .../gpu/drm/nouveau/nvkm/engine/device/user.c | 35 +++++++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/base.c    | 10 +++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/priv.h    |  1 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 17 ++++
 .../nvkm/subdev/gsp/rm/r535/nvrm/gsp.h        | 45 +++++++++++
 .../nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c    | 77 ++++++++++++++++++-
 .../drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c | 36 +++++++++
 .../nvkm/subdev/gsp/rm/r570/nvrm/fbsr.h       | 29 +++++++
 .../nvkm/subdev/gsp/rm/r570/nvrm/gsp.h        |  7 ++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  3 +
 15 files changed, 301 insertions(+), 2 deletions(-)


base-commit: 1e04611d3735543bd80a67d9d13dc13f503746fb
-- 
2.55.0

