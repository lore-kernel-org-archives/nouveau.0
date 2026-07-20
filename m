Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F59C44515
	for <nouveau@archiver.kernel.org>; Mon, 20 Jul 2026 21:51:56 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BEC7F10E201;
	Mon, 20 Jul 2026 21:51:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CotSMMi4";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 922AF4726C;
	Mon, 20 Jul 2026 21:36:29 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784583389;
 b=EAYGHBBJoTR99j9IDD099WN/WGAieQLvwuDXE7t3k/SgCwmBgWCC82UKhGT8ZTWkCfVVM
 VlP+MuW/c/rrHt6TIlAmwvkBg6Uym86RrbFC9RgRZbWtKOrBypS79U9S7wSt12/E9DQK+hw
 QzcRV/hzK9VLWrR1ltqdD56et+AnZ3iI8q7agecSX76td3GCnxizI2tpgsDJxi0ETiUEurf
 zdM+33vF4uB7Zpc8SC93Q409R8znlqfe/TVYk7TX1j4P52+1w5iAJ+L6U7elbiOyMOMdy5m
 Fw8oKEiFqRFMgMR3mUBK1HOQ1o/sYCmp63Uj2JOlJOeylVXU+Wddl5fkKwJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784583389; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=YSp2bjmUTFzp0IbxCyAWq1OLo28SH+leDwAT8SY17rQ=;
 b=IecEdY8c8p+bYf3W9HIii4n/FRAxOD/hfFxUq6XLfeY5Ow09frwVqjbglFs7P9AEQdC9w
 MaLb+EX+rUxhG4P8iy3s3xAUbF3oxxsY6iTFDFnShG487/jZc+dGE+Hgch6Wx04r4vsSeOO
 CraYQ7jLlIUGWLm9yN6ZeVqvg+sILNhx5FE+kXgKp5PtSeCJms4DX3VLjlU244J5jtU5yv9
 nS25i/7NcsQ154TDYhKj9K0bp4xgvcLWNiek2dEaIIlrb8gLCC9xD1uGi8rfzfhVQtMeqAq
 dZeaw+WqzS0BbdvRmPQHppzH/uB3/oa67N/mnHGtXE5clEM21QXqmLbYuy2w==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 486A547266
	for <nouveau@lists.freedesktop.org>; Mon, 20 Jul 2026 21:36:27 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2528C10E1DB
	for <nouveau@lists.freedesktop.org>; Mon, 20 Jul 2026 21:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784584313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YSp2bjmUTFzp0IbxCyAWq1OLo28SH+leDwAT8SY17rQ=;
	b=CotSMMi40QTtePMBPQqTX3NqKMwsu+20ACjFJFYgtws44veocWX6Fvmwc7USnuHQFXg14h
	QRM02YJGHi+afn0L/KATRkTLqhb5xIcRf84rXgeLhqQLGKECKWR3aeY1tUgYurN17su3ic
	BTxpBoUwDCnqXjMqtr6jqOcePFvuG+U=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-657-ovSgWrIrMkaUmMkekNLOwA-1; Mon,
 20 Jul 2026 17:51:49 -0400
X-MC-Unique: ovSgWrIrMkaUmMkekNLOwA-1
X-Mimecast-MFC-AGG-ID: ovSgWrIrMkaUmMkekNLOwA_1784584307
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 75A2D1944D42;
	Mon, 20 Jul 2026 21:51:47 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.88.114])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id CAFBD1800765;
	Mon, 20 Jul 2026 21:51:44 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] drm/nouveau: Fix WARN_ON() from missing blend modes
Date: Mon, 20 Jul 2026 17:36:15 -0400
Message-ID: <20260720215058.398210-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: Z4E8X21URkoauPXfaBWRGSKGj3ET-VSqomlxtePFEoQ_1784584307
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: XQ732YEMZKX4QZ6IKFQWV4FU6WRO2JWP
X-Message-ID-Hash: XQ732YEMZKX4QZ6IKFQWV4FU6WRO2JWP
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Faith Ekstrand <faith.ekstrand@collabora.com>,
 Dave Airlie <airlied@redhat.com>,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Kees Cook <kees@kernel.org>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Simona Vetter <simona@ffwll.ch>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Maxime Ripard <mripard@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Stone <daniels@collabora.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XQ732YEMZKX4QZ6IKFQWV4FU6WRO2JWP/>
Archived-At: 
 <https://lore.freedesktop.org/20260720215058.398210-1-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Recently a change went into the kernel to ensure that drivers which
expose color formats which have alpha channels. This would cause nouveau
to hit a WARN_ON when setting up cursors, since they do support blending
- but we never bothered trying to hook up the controls for it to
nouveau.

This fixes the issue by ensuring that nouveau always exposes a blend
mode for any planes with alpha channels, regardless of whether or not we
have control of the blend mode hooked up. If someone wants to add
control for this in the future as well, it should be fairly easy to hook
up with this.

Previous version:
	https://patchwork.freedesktop.org/api/1.0/series/170773/revisions/1/mbox/

Lyude Paul (3):
  drm/nouveau/kms/nv50-: Add .blend_modes to nv50_wndw_func
  drm/nouveau/kms/nv50-: Introduce nv50_wndw_default_state()
  drm/nouveau/kms/nv50-: Unconditionally create blend_mode prop for
    wndws

 drivers/gpu/drm/nouveau/dispnv50/base.h     |  6 ++++
 drivers/gpu/drm/nouveau/dispnv50/base507c.c |  1 +
 drivers/gpu/drm/nouveau/dispnv50/base827c.c |  1 +
 drivers/gpu/drm/nouveau/dispnv50/base907c.c |  1 +
 drivers/gpu/drm/nouveau/dispnv50/curs507a.c |  3 ++
 drivers/gpu/drm/nouveau/dispnv50/disp.c     |  4 +++
 drivers/gpu/drm/nouveau/dispnv50/wndw.c     | 40 +++++++++++++++++----
 drivers/gpu/drm/nouveau/dispnv50/wndw.h     | 11 ++++++
 drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c |  1 +
 drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c |  1 +
 drivers/gpu/drm/nouveau/dispnv50/wndwc67e.c |  1 +
 drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c |  1 +
 12 files changed, 64 insertions(+), 7 deletions(-)


base-commit: b0a652436b892eb9a036a031b33099dca036faaa
-- 
2.55.0

