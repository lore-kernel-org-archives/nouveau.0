Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84AFFC55162
	for <nouveau@archiver.kernel.org>; Thu, 30 Jul 2026 01:09:02 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5E4CF10ED15;
	Thu, 30 Jul 2026 01:09:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DPjA5gV4";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 01D64474C4;
	Thu, 30 Jul 2026 00:53:15 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785372794;
 b=zi+GEbLjRvLvHFfjRNsYXBoinImZLbrHucMltcnn4+vFaBDtwoI3FEZXS6nQYmIDz5Kqn
 Zvf4Uu89Y4PTMSk16VLpQzIm2APhcgrk0yq5h38PYn2VfWZgevGZSqLcksBSBBY0QxGwiHp
 LJ1BnYpam1DdgvamqVdoT4Yq2WMpo38qZsHxCNkLanMNbn3ECOWnh0NcOwRcb1RRbQymE5b
 i9YcO7OQAaCfffZ01wiULm8aZrsRbEqPm+6LRKQ6VeryZdMilyP5F3zduH7Zu1z66+O0J5f
 zrZ33cTjoOqa+hNMLn6/R3VpvZ8V+Dqm3gLtkXuFMg5qN8jf1peXgLdsRumQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785372794; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=YiNCJoEECcPz+Wpr3FMgtDFTUjdJqhZszXnfhO/Ruq8=;
 b=JPjWWjK7GA7PWhBSLW0lR0wso/orNq9I/ZwD250JvnRoDixMCbgDJc9NX2O5RRFL0gyrG
 jThILfLDimQgji8jjVdYGBt03wpASHpsgJKGdKvB31jgPk07YAJ8B77SGHCd9qtlUWz1kPX
 +IbzrxBmXin3OWBXIB2fCoIR6pqcMtlDXNDrhbqYwEyrRC/kyoqNDlf50/++9GgiXs6c87Q
 hg2mCSETNyjE6Gpmc8YIwN/qjdx0eBj8CQ8ACM9oAAmKTMpykf3E8G2XpEJ2O3K+RpqaRNw
 h34MDACmDLww1aH6I87TQpR/ZgQK0lurIdm1RYgUOnhExTkQEFCLbQri9h2w==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id D040C46ED6
	for <nouveau@lists.freedesktop.org>; Thu, 30 Jul 2026 00:53:11 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DFC8E10ED15
	for <nouveau@lists.freedesktop.org>; Thu, 30 Jul 2026 01:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785373738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YiNCJoEECcPz+Wpr3FMgtDFTUjdJqhZszXnfhO/Ruq8=;
	b=DPjA5gV4ht6p/GHcT1+6bGRVvyvgIPGDOYEczMqpQxPMy2dV2jRn7t/gLin8d+bxOTRn66
	lbpw7T/kkw31fZn0UmSdasJxyCH04mxCoHUCQ0aDLsKjv7/G0uu+RGbiuy9yUK6Nl1rZ/O
	132aWoV1ReDwFdGdlETkfa7IA0bqPHc=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-38-tE4zbd-CO_Wuaub0-pEq6Q-1; Wed,
 29 Jul 2026 21:08:52 -0400
X-MC-Unique: tE4zbd-CO_Wuaub0-pEq6Q-1
X-Mimecast-MFC-AGG-ID: tE4zbd-CO_Wuaub0-pEq6Q_1785373730
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id AFEA1195608E;
	Thu, 30 Jul 2026 01:08:50 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.88.35])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 4EC311800480;
	Thu, 30 Jul 2026 01:08:49 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] drm/nouveau/kms: Only allow enabling atomic modesetting
 on nv50+
Date: Wed, 29 Jul 2026 20:56:09 -0400
Message-ID: <20260730010828.1056397-4-lyude@redhat.com>
In-Reply-To: <20260730010828.1056397-1-lyude@redhat.com>
References: <20260730010828.1056397-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: QWG3qv-4CE2wpIlQMJyATziYBNvsY6xym8DOJtFm-AU_1785373730
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: 7MU2JGGTJJOKC6LBH5756UENU3XYQO5E
X-Message-ID-Hash: 7MU2JGGTJJOKC6LBH5756UENU3XYQO5E
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7MU2JGGTJJOKC6LBH5756UENU3XYQO5E/>
Archived-At: 
 <https://lore.freedesktop.org/20260730010828.1056397-4-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Atomic modesetting support was never added for pre-nv50 chipsets, so make
sure we don't allow it to be forced on. Additionally, print a small warning
when it's not supported.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 8899f009f825e..b959d79f7e1c7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -770,8 +770,12 @@ nouveau_drm_device_new(struct drm_driver *drm_driver, struct device *parent,
 		goto done;
 	}
 
-	if (nouveau_atomic)
-		driver_pci.driver_features |= DRIVER_ATOMIC;
+	if (nouveau_atomic) {
+		if (drm->device.info.chipset >= NV_DEVICE_INFO_V0_TESLA)
+			driver_pci.driver_features |= DRIVER_ATOMIC;
+		else
+			NV_WARN(drm, "Atomic modesetting not supported (needs nv50+)\n");
+	}
 
 	ret = nvif_device_map(&drm->device);
 	if (ret) {
-- 
2.55.0

