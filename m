Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BDFBC88E77
	for <nouveau@archiver.kernel.org>; Tue, 15 Sep 2026 21:07:08 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C8A9610E3ED;
	Tue, 15 Sep 2026 21:07:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="J1r2hbp4";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2371148077;
	Tue, 15 Sep 2026 20:49:35 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789505375;
 b=cGyyqsSrH7wumQqhek81G3BluXECCsR89ldU9PUsQn+n4h+3v+oLSML3W/IFp8CWrjvTZ
 7aNOSJswumStpmuZS/Xy5qMehQLWREqHG0Ms5df1FCa2NTfSahE0gLd84mKSFbStKIWj0dJ
 snHxnzEZSOR3B/ZntUwwETwXsS49t1LPp736zfrFK0HCyy0nJd1tqLM9iwSHBjP0JK8VvM4
 7HAw+QitUUGyHQu3MgE9Me1cgmvl3WQ/phz1jLvwIu9fLpRoi8tYtxAUde1R2HOYm+51LCh
 DI3xYiiElh7pcLORX2w9TaBa6XDQHuO1gHO4OR4hqs+cxPcL+hr81/aKt+Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789505375; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=XCC8shsiIFCG6ymQVfbHy2NkjZ0M95ZFCt7+WcSpRqw=;
 b=E89BxiOub60cwC5B8YAfNMinP/fBAXJyW8PXSLGqV8t86E/2vwvow+vkRd7/JEd9GCUdf
 GAJXwjZa1Alb2IdxG1rxOsKdCceTtbKX9XOaO+0L/sXc1iF48SyljI33rfbEZbu6Mxnx9A+
 PfCWsQazSG6Trkt6LoeeV2RTt28PwWbHjN0cIKeI96bHtuRMjamm9oVScl+SLNlw3531BVv
 2az2MzP+sm7YXWmwbm6lCAbcf2c8zsLgngI+fXsy1RdxOE5EPXw8cMKdMg3TPeOx9HRnwWk
 obpEtFftCzq+Mu+NnDWjOgKNwMc+O/ZD4y12Lpn0MNrlpZRF29OImW7sEecg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 8696D4771F
	for <nouveau@lists.freedesktop.org>; Tue, 15 Sep 2026 20:49:31 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D766A10E2CE
	for <nouveau@lists.freedesktop.org>; Tue, 15 Sep 2026 21:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789506424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XCC8shsiIFCG6ymQVfbHy2NkjZ0M95ZFCt7+WcSpRqw=;
	b=J1r2hbp454De7nVYnxxdIQIhWYnlPlLEB1knkNuf9wC6XxEOcdDmD0Nd84vYN3ywhK2z5F
	aH1kmSsmAJROu1DNiV5omSP3Ksj5WXm5W/oSxNPwHeXej/qbzKCNBv0NlqnPNde97/XU8c
	wmXrg0mU/fGEja4i77S69UBzKNUwXwg=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-280-zYT-ogVEP3qBJbNo654LFQ-1; Tue,
 15 Sep 2026 17:06:58 -0400
X-MC-Unique: zYT-ogVEP3qBJbNo654LFQ-1
X-Mimecast-MFC-AGG-ID: zYT-ogVEP3qBJbNo654LFQ_1789506416
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 748E71828AA2;
	Tue, 15 Sep 2026 21:06:55 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.80.179])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 896101800446;
	Tue, 15 Sep 2026 21:06:52 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] drm/nouveau/gsp/r570: Follow OpenRM's runtime PM
 process more closely
Date: Tue, 15 Sep 2026 14:51:47 -0400
Message-ID: <20260915210647.695187-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: A0jUPdZ6ZF6SdTWEBhUIdA4yREOVvAE2PFDKY5oLfqc_1789506416
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: 5E27VDLRDR5LLGY4KMRHXVN3FGMLNLUI
X-Message-ID-Hash: 5E27VDLRDR5LLGY4KMRHXVN3FGMLNLUI
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Dave Airlie <airlied@redhat.com>,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kees Cook <kees@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Hongling Zeng <zenghongling@kylinos.cn>,
 Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5E27VDLRDR5LLGY4KMRHXVN3FGMLNLUI/>
Archived-At: 
 <https://lore.freedesktop.org/20260915210647.695187-1-lyude@redhat.com/>
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

Lyude Paul (5):
  drm/nouveau/gsp/r535: Add support for INTERNAL_GCX_ENTRY_PREREQUISITE
  drm/nouveau/gsp/r535: Add support for MEMSYS_GET_STATIC_CONFIG
  drm/nouveau/gsp/r570: Add comp mode workaround from issue #3172217
  drm/nouveau/gsp/r570: Start saving comptag backing stores
  drm/nouveau/gsp/r570: Enable Gcoff in fbsr again

 drivers/gpu/drm/nouveau/include/nvif/cl0080.h | 10 +++
 drivers/gpu/drm/nouveau/include/nvif/device.h |  1 +
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  4 +
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  9 +++
 drivers/gpu/drm/nouveau/nvif/device.c         | 13 ++++
 .../gpu/drm/nouveau/nvkm/engine/device/user.c | 39 ++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/priv.h    |  1 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 43 +++++++++++
 .../nvkm/subdev/gsp/rm/r535/nvrm/gsp.h        | 52 +++++++++++++
 .../nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c    | 77 ++++++++++++++++++-
 .../drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c |  8 ++
 .../nvkm/subdev/gsp/rm/r570/nvrm/fbsr.h       | 29 +++++++
 .../nvkm/subdev/gsp/rm/r570/nvrm/gsp.h        | 50 ++++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  2 +
 14 files changed, 336 insertions(+), 2 deletions(-)


base-commit: 5363e01e4ff03a204cab85292b89cf90c2d1b101
-- 
2.55.0

