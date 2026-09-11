Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D55C88E50
	for <nouveau@archiver.kernel.org>; Fri, 11 Sep 2026 22:24:52 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1329B10E58F;
	Fri, 11 Sep 2026 22:24:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ada3CtAV";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 177C445E4E;
	Fri, 11 Sep 2026 22:07:25 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789164444;
 b=AqvCJECRQQo/vOkZoGW6hvDDhM221RLjyNOzYcM16+YcdHYBiPPxd5IbHTKP6rQvd9wA2
 vUhIx1/YRfvHVL/Q0DqgNxjcCBLbDQ3IAeAhvBZaOmPBl2SKXjiKFgWTWuTRwvYYlFt0rKX
 oDkw7x55An9/3Zfzdt3skD9jbvCOFSMJ09izreo3G6sCHRsJfNSxsbB0tG7cAb+HXkxr+5s
 iKz+kFtfJ0w/e7ML5meK63nZkAtbp2CyMEZmrW1QjHXWkqB3hws9VjEOYxYrBJlDb0VdR0F
 hgZ3dB80TN5R8uKDqkfJ8QlV+V3cU3TSJeOhMYVmo/LBWWEOSVeacbF4pdWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789164444; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=MLcC3slPi0kXizJ1i2QlzDWQPcjnDpfhBQdjq8/AAys=;
 b=Kn7zZfMQeryaoOlmAYRkD7MdghwXMEyp8qXqfI+S+nhFAhlYVhH2yfHDPSew4tOhm4s2f
 fIXLkBtu3HC394PDvgkwQalb94UVpjhYjPSesVn6IESQS4kTpmtnNUdt5HT/KB7LG23y6ik
 4VV8mGgogABiEJUfuHRVMhI3X8elVT2zBK+e9646GAx3/xHhKJIxVm7r12YUIv2f6n5wUme
 ippXK+SseVTM5lLjcUt7zV+9eTVFHo/FRgZJcAmmsTBZD+Za4cloWl+/Y0bU6dg75q+WBPW
 y4HFcIsGgxwHtZVboVXh95gEIQQx1J04z/zVX3PAAMRVDmORtX/iiuEaB2kA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 02AEF40086
	for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2026 22:07:22 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 78E0910E57A
	for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2026 22:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789165485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MLcC3slPi0kXizJ1i2QlzDWQPcjnDpfhBQdjq8/AAys=;
	b=ada3CtAVAl7EhIm4lLqjmMMM+/RJ6SO3cNxs+St2UX1BbTjFn23f+MQUNWN3XveK2kn6In
	o9hwjCuqt8TXNxMG5JUoIKX1z/mXhXhT49fgghYUf72atvnjgLNqObZ3nnW16nZmKoCibN
	wqNg/aihDWxtEiKtG/KG94AmG1Lfkik=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-220-Bj706SCFOnaNXMRUh6bL2A-1; Fri,
 11 Sep 2026 18:24:42 -0400
X-MC-Unique: Bj706SCFOnaNXMRUh6bL2A-1
X-Mimecast-MFC-AGG-ID: Bj706SCFOnaNXMRUh6bL2A_1789165479
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 986AE1953973;
	Fri, 11 Sep 2026 22:24:38 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.88.4])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id B4A1E19560AB;
	Fri, 11 Sep 2026 22:24:35 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] drm/nouveau/gsp/r570: Follow OpenRM's runtime PM process
 more closely
Date: Fri, 11 Sep 2026 17:49:53 -0400
Message-ID: <20260911222428.752641-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: DWAHxW_hNsWUc-Ihudj-wKqCsd4BMrSnnSQRd7Yob6w_1789165479
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: R4IY2B4BPT456K2HWYEIRAMTVL3ODPBT
X-Message-ID-Hash: R4IY2B4BPT456K2HWYEIRAMTVL3ODPBT
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/R4IY2B4BPT456K2HWYEIRAMTVL3ODPBT/>
Archived-At: 
 <https://lore.freedesktop.org/20260911222428.752641-1-lyude@redhat.com/>
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
with a GA103GLM, and a Dell Precision 7780 with an AD103.

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
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  7 ++
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  9 +++
 drivers/gpu/drm/nouveau/nvif/device.c         | 13 ++++
 .../gpu/drm/nouveau/nvkm/engine/device/user.c | 36 +++++++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/priv.h    |  1 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 43 +++++++++++
 .../nvkm/subdev/gsp/rm/r535/nvrm/gsp.h        | 52 +++++++++++++
 .../nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c    | 76 ++++++++++++++++++-
 .../drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c |  8 ++
 .../nvkm/subdev/gsp/rm/r570/nvrm/fbsr.h       | 29 +++++++
 .../nvkm/subdev/gsp/rm/r570/nvrm/gsp.h        | 50 ++++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  2 +
 14 files changed, 335 insertions(+), 2 deletions(-)


base-commit: 9d4c98219598e77ca7044c453ae6994519ac0a96
-- 
2.55.0

