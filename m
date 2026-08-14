Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E2D8C5CFC1
	for <nouveau@archiver.kernel.org>; Fri, 14 Aug 2026 19:46:06 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 614E110E596;
	Fri, 14 Aug 2026 19:46:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="A7me+E5u";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D5B64477C2;
	Fri, 14 Aug 2026 19:29:42 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786735782;
 b=ucJONhKex4P++pN9NOnoa8PTIyl+qG9sHMS0lTkaSCa8woWOW7GTPVKILyfDenNMEmUvq
 7Iemaq5xbnpAe+XZraXc1izyv8WEQWk/LjKvDZ5bOOYvm7FwqazI6iK5yqDz9ej96Pi4XD7
 dOmDPUu3toH9tsy9Qk/6VtFs/k568zvJ2MgyOLa6uss3+2vV9cUvUEO1eg3XQQcM8XCHfXx
 jaW2CYsYTjMZ8pHKaIavFcPEM/CTWdUwi8UR78GkV88AMm0IBeDKvu2+hnWiLDiLefqD+wf
 ZT0W1ygneAJ71bGMHaJlFn4QOhexUbq5Pxf/mSRprh10LWF3WMxc7MqhO06Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786735782; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=14vYyxbGfrsDjEA60FYCuMaSiR5Qxd//ahhPFaqsROc=;
 b=Eeg9ioPS5JTBDeI1hhpUVut4+1Q4h/tjnW0aTTpoKw/nB16k9qS1qcFc+tVzy48fMIkoM
 Ga5hzxK0ltUIVj+j0GYQFcuoA3oJ7CG37+c+mFivIrIDQBktHxyfnPAZ+RB/sKn1fyjgYrx
 Wrn2C3/Lz2REl0Kijaw1jFzSj/5mHnxXko0zqe8gAI+5LA7Dzd/Ispcb4BHmHbTo/0/TOrw
 zbS2pnik5NHY0IJDjnZgZimnNLkjTwMs/Z3Z7d/8K1MkV8TfvSdgWfGlOOmPlNVbrXPXhLz
 HFBJjk6tjvxJrgl8nNuxvA9CosAFYg0HlAUpIc0kyHfceWDZJVaktL16qxUQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id CB385476EE
	for <nouveau@lists.freedesktop.org>; Fri, 14 Aug 2026 19:29:39 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D8B5110E19D
	for <nouveau@lists.freedesktop.org>; Fri, 14 Aug 2026 19:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786736760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=14vYyxbGfrsDjEA60FYCuMaSiR5Qxd//ahhPFaqsROc=;
	b=A7me+E5uIVxUESj5O6sIpWMCdTiRm5UKrKtRsw3L6d3nnrdE6OijJlKzqys9+V0DEYHU+9
	aGiDXLgKSAdinSnXC4e1Bh7iD/JijPeT+dLNNai05du0LatC33jTbJlhzgr0Xy3u0+/xpK
	e/QR+wnTq2DXTOF7IQ5XTzi0FtcUbbc=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-384-n1s_vrdNMm2NQ1YiCm-C9Q-1; Fri,
 14 Aug 2026 15:45:52 -0400
X-MC-Unique: n1s_vrdNMm2NQ1YiCm-C9Q-1
X-Mimecast-MFC-AGG-ID: n1s_vrdNMm2NQ1YiCm-C9Q_1786736750
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id AF72B1956095;
	Fri, 14 Aug 2026 19:45:49 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.64.233])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 0DB2230001A2;
	Fri, 14 Aug 2026 19:45:46 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/4] drm/nouveau: GSP runtime PM fixes
Date: Fri, 14 Aug 2026 15:43:47 -0400
Message-ID: <20260814194542.781955-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: 4EDrEDnJzQ29shnmYAlHRVRbt9f7l2SwsdU-3uknytk_1786736750
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: FQCTTXSWYTKNJKC5US6UPHWTX2SBWMUO
X-Message-ID-Hash: FQCTTXSWYTKNJKC5US6UPHWTX2SBWMUO
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FQCTTXSWYTKNJKC5US6UPHWTX2SBWMUO/>
Archived-At: 
 <https://lore.freedesktop.org/20260814194542.781955-1-lyude@redhat.com/>
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

Patch-wide changes:
* Add magic sleep, this seems to get things stable - but boy I wish I
  could figure out why.

Lyude Paul (4):
  Revert "nouveau/gsp: fix suspend/resume regression on r570 firmware"
  drm/nouveau/gsp/r570: Set GcOff = 0 in fbsr
  drm/nouveau/gsp/r570: Enable S/R Display workaround in GSP
  drm/nouveau/gsp: Increase delay for magic sleep in r535_gsp_fini()

 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c    | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c     | 8 ++++++--
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c    | 8 ++++----
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c     | 3 ++-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gsp.h    | 8 ++++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h           | 2 +-
 6 files changed, 22 insertions(+), 9 deletions(-)


base-commit: f29ab62f7ed55eae7b246bb535ede56d3b338674
-- 
2.55.0

