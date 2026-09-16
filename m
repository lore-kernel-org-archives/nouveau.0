Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA5DC88E75
	for <nouveau@archiver.kernel.org>; Wed, 16 Sep 2026 00:22:23 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1292910E368;
	Wed, 16 Sep 2026 00:22:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CPSCp9FF";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0FA43480A4;
	Wed, 16 Sep 2026 00:04:48 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789517087;
 b=bXhIRzRV1oJ3WnjjBU8Fix4pDm4mVD2oWCgDJXuUQsILO67/qnG1VSmL1kaZADY6tjDaw
 Uhp6eoAu2jrm8cGzdc/4f3k4p2HHinlYYiYuX9GxohbzWcawQLmNj5yTxc4cj6FwIXLqtTx
 SmVYxec60NtSzI6OOtk3mfMOv2U1MO1g3QuvhZX8Guo2Xmi4M4T2vvov5HCsGusYxE/Zpzj
 rRojhtm7p2apHZ8un9+UhN28pjohG2V/Q1zhDcnFSbFSGda7cZ4Cnq9Cwlz6U5zX7GeZGQ+
 4wH+ujtAsoFRGjHH8hqa8bGYsMoYOzMI4tcvi1YzWLePgFNTgWr4koVtzdLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789517087; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=xMZBU/NdVGpZ9v1/Gz3rmEtDNTcHrC67v7xThKqfkyw=;
 b=VRRWMy1jhTIL5hkXmKm44UmEyJBJeok3DZASVI6EQpeSru8P0Zi0dTj1DvmCsf/GiZEvT
 Tfvv8kn+toHIaWmAr1jly8yLg7jHjR4LljIQCu3I1GhdsxTh/c5A/Dil9NcBb4Qs1LwiHD/
 UsCYEeMkJztEtQVvYjHaf7tGihTB+OaXeek7tW/omf9smKaB1nsahkGWfF2ey8fIUk4IQ6e
 vGYjpOKb3+97T2qibkuYynbz0NwWPFTO2OCpRAgjz0cw+Q0hL8OBp2BP5ypCbm77mdPS15A
 xSsH8ZCkKENHLXS/7XO+6pFhQ6jjRd24ax3CkhgB6K4ERHRdzizkXOlGiXKA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 3F903477A1
	for <nouveau@lists.freedesktop.org>; Wed, 16 Sep 2026 00:04:44 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CB51910E121
	for <nouveau@lists.freedesktop.org>; Wed, 16 Sep 2026 00:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789518137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xMZBU/NdVGpZ9v1/Gz3rmEtDNTcHrC67v7xThKqfkyw=;
	b=CPSCp9FFEtKOuPmBOrXhZk7M/jNZ5wackcYD3sSKnCZavlJiYBBgG3lXH+2ZmRYU2u1Sf/
	PCC5AsFbHowvZ3pmCm/2EiYJ6EM6GcYo5gBmMD1R/w1ms17GhWBlWaTp8ISCiycKyzTVdi
	YHXJ5sN2v+ujA4pEciD+aaeaLKzch6o=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-166-lHcBCAzlOIiz7TUC7BUmeQ-1; Tue,
 15 Sep 2026 20:22:13 -0400
X-MC-Unique: lHcBCAzlOIiz7TUC7BUmeQ-1
X-Mimecast-MFC-AGG-ID: lHcBCAzlOIiz7TUC7BUmeQ_1789518131
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E51D6195421E;
	Wed, 16 Sep 2026 00:22:09 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.80.21])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 8D7AA3003EFB;
	Wed, 16 Sep 2026 00:22:06 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] drm/nouveau/gsp/r570: Follow OpenRM's runtime PM
 process more closely
Date: Tue, 15 Sep 2026 20:09:50 -0400
Message-ID: <20260916001603.22394-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: feZNA_P8vhewR53TbH8F2vi0oE4S6rWVTKnpNEvGKf4_1789518131
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: 7JRNCZR4M67D3NXQA4KISBOJT3HCQRSK
X-Message-ID-Hash: 7JRNCZR4M67D3NXQA4KISBOJT3HCQRSK
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7JRNCZR4M67D3NXQA4KISBOJT3HCQRSK/>
Archived-At: 
 <https://lore.freedesktop.org/20260916001603.22394-1-lyude@redhat.com/>
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
 drivers/gpu/drm/nouveau/nouveau_drm.c         | 13 ++++
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
 14 files changed, 340 insertions(+), 2 deletions(-)


base-commit: 5363e01e4ff03a204cab85292b89cf90c2d1b101
-- 
2.55.0

