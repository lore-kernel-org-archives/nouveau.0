Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBBFC982D2
	for <nouveau@archiver.kernel.org>; Thu, 17 Sep 2026 17:01:03 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7287B10EFFD;
	Thu, 17 Sep 2026 17:01:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HJx7DXJf";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A7C01481B2;
	Thu, 17 Sep 2026 16:43:24 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789663404;
 b=WhEN7pJNsA1VXFhbOiivYliEuaZRfNAkKpl/nvhWmnvJTAqT5tj1eZiKOa0BC9qtPhFMX
 +np5VNT1E5tH1VAGKLMBNOKJGVVWAKoJTAS0VraJRW1XnCNsl+SyC4tA8QylZWDmQ6BAfk4
 Zx4vkkFf4tGe4hAxkaStYXsjIfxw1aK3qLS2JHn/xlqjTIp5+AX5M3cI+7W9/fR4F/NMLw2
 6TdGO/xmawnunTTB+MYU43PXLaBUxEz2Ds5MXJKYknVGUSxC0B4ubIyeLwRNKoFqC5JP87p
 Gt8jayhYJqt7GcJ86feaSq83eRHUFj4eh22oeqj8fyvyH5gSdr3v7RKhjUeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789663404; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=3cUvhJCeylyKmCRzVdnpI1XudDCvPfdO1HTMEIyjjhA=;
 b=LkiNjMnJqLz8NxgBKU60cnELrnhbz1rhRDwFprez0vXARqNaKqgBiBXkJgEHieqrZJbnf
 lRrvnqHL2Xy3i4y+XRQ+m/iJNev/q+3NMBr5n6+LTmPhVfhniufMnSY5bEcj+8zSAeV+WhR
 3IAs/SGjusl2aVN4yqRR7YD02xc78ApDWf2bIipADMoCNHzhiETvpxapOleEzcPZvax+CoW
 +oAGGH5kbQmxLl0lWrBSKNw240Al3vroFeVXfMtck312XtYefr32axEyCA/Tf9H5La+d/PD
 mSWkXyNVYUdDlGPMxGsdXgzisO1jhmefr7eRX2Lz/4tmyixGeWEiugLtWfpg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C797E480F6
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 16:43:21 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2F5D810EFDA
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 17:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789664458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3cUvhJCeylyKmCRzVdnpI1XudDCvPfdO1HTMEIyjjhA=;
	b=HJx7DXJfho5gdM7uIjwYSJqPnRIKoRZQFa2WorKkjXQSv+Cy81C5Eq36FsFqtmLq1f1gV/
	A9Ih6ApUhuZd5z1zRneRnH7WLP0gl4+oGrNyCz5XH+gLOr138JqJJ72Fo+b0r0idt5modh
	IHVQCVU6uwIg5GqBYEEAKO1GqGi/sws=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-104-fL7CYz7kOVOXxBhP8eCeEA-1; Thu,
 17 Sep 2026 13:00:52 -0400
X-MC-Unique: fL7CYz7kOVOXxBhP8eCeEA-1
X-Mimecast-MFC-AGG-ID: fL7CYz7kOVOXxBhP8eCeEA_1789664450
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 172EE1802554;
	Thu, 17 Sep 2026 17:00:50 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.64.177])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id E1D3930002C2;
	Thu, 17 Sep 2026 17:00:46 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/5] drm/nouveau/gsp/r570: Follow OpenRM's runtime PM
 process more closely
Date: Thu, 17 Sep 2026 12:58:31 -0400
Message-ID: <20260917170042.440276-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: rG_JtN7v4wkN_e9MZzfQR7cV0CTFBaV5wuWHPj4Zi7A_1789664450
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: UPE5VUYDXFXIKY76PZ5JJFYXFXKWSNBH
X-Message-ID-Hash: UPE5VUYDXFXIKY76PZ5JJFYXFXKWSNBH
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/UPE5VUYDXFXIKY76PZ5JJFYXFXKWSNBH/>
Archived-At: 
 <https://lore.freedesktop.org/20260917170042.440276-1-lyude@redhat.com/>
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


base-commit: 5535d5e61a77ad79118ea7665ce1c14f857f0f12
-- 
2.55.0

