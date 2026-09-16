Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7ED2C982C9
	for <nouveau@archiver.kernel.org>; Wed, 16 Sep 2026 22:35:04 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A174410E1F5;
	Wed, 16 Sep 2026 22:35:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XjtrEwiz";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8849848146;
	Wed, 16 Sep 2026 22:17:27 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789597047;
 b=kcwa8DFfxEhvHGBJyUYkYTVVgweHDmzE3VNfL4IEy49l/Lr+bpTzgVXga4EryGxVAQYET
 cqeRHBZ6sdvfub4INcSAKt1IWnjCNEHkHOp1M2cGwT7uW/DpuAZbeE04LWRiw82BIQI1ds2
 69H1RHz5487q5Ve6PtM0R7vl24+7H+7VBh1REV8EUrDA6qoFwUIiTxU8q680pmY1iHvxizC
 SqWYxE4i94OYUifeOPYf8LP096T9910o1wfocXgZqwiVs8DTU4mCXAcrOSLUvcglfd7lMYg
 YXdAstsUZmPCRQNxZ2Q5W4NfxMaUgSyhDMKb9NTK+gm4cVztV1TVjN3566pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789597047; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=hyzBhMwpeAjXeWZ8oT+xDx18tHVYCSWsv/6bhvYHBDs=;
 b=yGM+5zPfV1LCTSRO+rqJ7wzN6nvOP+QK369KwsOdgZxSAWyByf/ta1fF9kwxA2lVy3dfS
 Kb2LKFdYvu2t9xHixgtpmHVs+3Pcdll6pztz3ES7kpjnu+sT/2ku5t/JjOtk7K6T8OOPCFy
 dRJVhCdSKaccbu9pO6GtmCzao9IXhUI14N2MqKzof68Z969h1lDXKi+Axgp346ck2ApegZ8
 2PSrCG8cxs+SWO5ZpB0elsEZFiWYQcRXI1n7sf+qSm7x+sQwUaxk9taBR9KIpH6fK+YYgVv
 ZBmIwqv881ntQNLE6F35CgqwRBp2PS600h8eI4Y+e0OCfAilEhWD++47KamQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id CDE3E48108
	for <nouveau@lists.freedesktop.org>; Wed, 16 Sep 2026 22:17:23 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 74B4E10E07D
	for <nouveau@lists.freedesktop.org>; Wed, 16 Sep 2026 22:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789598098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hyzBhMwpeAjXeWZ8oT+xDx18tHVYCSWsv/6bhvYHBDs=;
	b=XjtrEwizAQmQhfC20KnLqXWO7Jxc0IwH+BTn0s3CFrPZI12D/Ax5CPt5T/PHFoekkq7GTr
	jqX4i1enZhkqvMmCGTCSilc2OKcGyovpPcpOgL4395K5740J/D2W7MvvnPQqbeX8Q10fm2
	zil4ESw7HyTS/CCrso609J+2HAUadS4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-74-2I1OL0sIOLaYKlSWu7kWBQ-1; Wed,
 16 Sep 2026 18:34:54 -0400
X-MC-Unique: 2I1OL0sIOLaYKlSWu7kWBQ-1
X-Mimecast-MFC-AGG-ID: 2I1OL0sIOLaYKlSWu7kWBQ_1789598092
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5C7811800BCC;
	Wed, 16 Sep 2026 22:34:51 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.64.52])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 806B21800577;
	Wed, 16 Sep 2026 22:34:48 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/5] drm/nouveau/gsp/r570: Follow OpenRM's runtime PM
 process more closely
Date: Wed, 16 Sep 2026 18:25:04 -0400
Message-ID: <20260916223358.507351-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: erMomowQXhT2o3MgPaqv_N7iNENr67HyYPl3dg9yHV0_1789598092
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: D6WUSBXE3Y3E6V3MDSKKOO3XGAUAFXJI
X-Message-ID-Hash: D6WUSBXE3Y3E6V3MDSKKOO3XGAUAFXJI
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/D6WUSBXE3Y3E6V3MDSKKOO3XGAUAFXJI/>
Archived-At: 
 <https://lore.freedesktop.org/20260916223358.507351-1-lyude@redhat.com/>
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
  drm/nouveau/gsp/r535: Add support for INTERNAL_GCX_ENTRY_PREREQUISITE
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
 .../nvkm/subdev/gsp/rm/r535/nvrm/gsp.h        | 52 +++++++++++++
 .../nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c    | 77 ++++++++++++++++++-
 .../drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c | 36 +++++++++
 .../nvkm/subdev/gsp/rm/r570/nvrm/fbsr.h       | 29 +++++++
 .../nvkm/subdev/gsp/rm/r570/nvrm/gsp.h        |  7 ++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  3 +
 15 files changed, 308 insertions(+), 2 deletions(-)


base-commit: 5589ef09f93b85b6f506e279a502d4cf1654f232
-- 
2.55.0

