Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3F7C53209
	for <nouveau@archiver.kernel.org>; Mon, 27 Jul 2026 17:53:35 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9F43F10E6A2;
	Mon, 27 Jul 2026 17:53:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="emrzAdxc";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 46D6E47420;
	Mon, 27 Jul 2026 17:37:52 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785173872;
 b=QnoWCB8/NtBg5hHSIdfefpgYMClhwV2EWO9/gd5pas535zOaJDxa0nYWwtjLCaNO+ZO4r
 XXYZgaBKDfGpEXu5z8CqHAnkFw/tPddX5y9dfm5mg58yvTLcS7Dv3phGY4P1p2P9TyoKjO5
 WP5r4kzcgWtCnf5zCrHhMqNtRaYTLqIqVBCAYJtDzQb+585cXv1GrEbbOwr8kEbkmgfTHSi
 7cYSpEhA245c4/1I4+Y3i+GUsxpdWIgfh04VtRzZCB2doeA3vVpu5/KYKYXyV+p7BbDzWAm
 +WHY4XF+wBHcBnd5AvSbGMUm6sjHBX3miKwpMJ97Z9Rlpqs2RCaQGG6FZQRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785173872; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=lcVPYQIeblJtEP+34yE/x7AhxVwpjV45NCnPDgJycms=;
 b=WGGjQ9d+uCOAOI3MZX9oZtxl9Qqks0f90F2uAp6BZfyePZB4+wmqff5VaAPurh4P5KS4R
 28qRGiIO0nLXY72xLuY/8vZS+DZ2CekpkzJ+5VQdKSPfz1V8juFMXUUnf7P/5P9/u4ZSb9l
 ULQKFrPEZqJzCCHcptTRNEovpGGw9VWTnAGN6DUVBJINfK6CKr82JUpOQtEt06zb3qIWKWA
 R5VliVX/g3qvtEZScg8ghTxIR92BvSaDVWyRbH1nngkUuuicBkzrs0Q2kmMfoYyszoW/9fc
 WLHkQ34SBzYEU057VIUGtvSxZ/acJZuYC1OlWjFTVr9Bim/zRJMidu9AjO7w==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 80ADC46B91
	for <nouveau@lists.freedesktop.org>; Mon, 27 Jul 2026 17:37:48 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7028A10E430
	for <nouveau@lists.freedesktop.org>; Mon, 27 Jul 2026 17:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785174809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lcVPYQIeblJtEP+34yE/x7AhxVwpjV45NCnPDgJycms=;
	b=emrzAdxcWaOKlQidzpw+Xp5sNTU3OxvOZtdsIeko0cuPTnbx2107dwlLV6Mgc2pSsAkDeP
	n9DCWJ7Pzo7q2JI9flGdd75/XqJLlNnowv72oshdxWaV2kdCaFHhWZ+e7n0CoDTPBQB062
	V64P9bMB73pUfTyJCuSBREvBizjnneM=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-442-G1hfIIenPT2FTAPYIrG6qg-1; Mon,
 27 Jul 2026 13:53:25 -0400
X-MC-Unique: G1hfIIenPT2FTAPYIrG6qg-1
X-Mimecast-MFC-AGG-ID: G1hfIIenPT2FTAPYIrG6qg_1785174803
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 7FE0919775FE;
	Mon, 27 Jul 2026 17:53:21 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.65.215])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id F04541955F7B;
	Mon, 27 Jul 2026 17:53:17 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] drm/nouveau: GSP runtime PM fixes
Date: Mon, 27 Jul 2026 13:47:41 -0400
Message-ID: <20260727175246.642071-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: UAV9AV9l6Cqtf-UQVkzVGUk_BoKe-7UJ7VsisDBnZ_Y_1785174803
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: BUYLDKAQR6QBNVJZAFH7A43SQSM6COQC
X-Message-ID-Hash: BUYLDKAQR6QBNVJZAFH7A43SQSM6COQC
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Dave Airlie <airlied@redhat.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Kees Cook <kees@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BUYLDKAQR6QBNVJZAFH7A43SQSM6COQC/>
Archived-At: 
 <https://lore.freedesktop.org/20260727175246.642071-1-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Runtime suspend/resume has been notoriously flakey since we started
using the R570 GSP firmware, and possibly was also flakey for some time
when we introduced GSP support initially.

These fixes get runtime PM to be dramatically more stable then it was
before. Unfortunately even with this patch series, there are still some
remaining issues that need to be fixed. These likely stem from the
currently different code path that we need to take with these fixes in
order to get suspend/resume working.

While we're making progress in understanding what exactly we're doing
differently from OpenRM that makes this the case, it will likely take us
a while before we actually have things working well enough to copy what
OpenRM does. Taking precisely the same path that OpenRM takes however,
will require some additional work - and at the very least these fixes do
appear to get suspend/resume and runtime PM working the vast majority of
the time.

Thanks for nvidia for providing context into what all of these various
flags and settings do!

Previous version of this patch series:

	https://patchwork.freedesktop.org/series/169457/

Lyude Paul (3):
  Revert "nouveau/gsp: fix suspend/resume regression on r570 firmware"
  drm/nouveau/gsp/r570: Set GcOff = 1 in fbsr
  drm/nouveau/gsp/r570: Enable S/R Display workaround in GSP

 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c    | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c     | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c    | 8 ++++----
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c     | 3 ++-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gsp.h    | 8 ++++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h           | 2 +-
 6 files changed, 17 insertions(+), 8 deletions(-)


base-commit: df0311845915442ab75d03ee89fb443b444c1370
-- 
2.55.0

