Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1053EC55171
	for <nouveau@archiver.kernel.org>; Thu, 30 Jul 2026 19:56:03 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5577710EFBB;
	Thu, 30 Jul 2026 19:56:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fNJ0Wv0A";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 334B5474DE;
	Thu, 30 Jul 2026 19:40:13 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785440413;
 b=PUiQZuOy7gtdlwc/uK4ikWm1bccspWVdUz0nJrwo+gcVfntiRIiTyQNNclHmbPBjjzETp
 tb21KJlo9EIcUxryzxbUui8PWmh/2QksT0zApI24wNXdoN/Ki8hgEE6TkfZHF9bWRoL4gnY
 L4xdgAoj3yr1CuLo5XjqxHL9qrN4ka/eglOylw6ocId1LQTH0DmtMtVuO68NuyNve/QLRK1
 +1E6rF+U8JeYQjYr0RZkJeHhgo0n4L3/a6Gobx+KJp+NQMXfEOm3yRwwfQOYyUt8b680T5j
 5oM/lDk1AGOK71nBuEIE4iV617MIeUw4aHKO+1weqvw7etDxonPkKxnlIDFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785440413; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=G7pXERsaJxupz3ibBtEt7AN3qvnUBtFJM+fFekmGGOQ=;
 b=jGiL87aFf9wYucvgeWKiV7JuDbmxLNeUhGaNc3jTflMdPqxUJc3H2NutulgzpaUQgNFDr
 UoMsJ0gIKqgmTBZvseW3oxAzcHXscrCUEVVYgNSYGanWyZqW3KeY31g4grXieoqf6TY7pDm
 j0A71fUCN9xJwvQsQ8ZyoAOHrYxeuKt4VywE/zqAG6y543rP7gv2Y64Xh0Hku4yEYRsanv0
 y0ylfjpPrCg4784+8NtDtt4ZmNU0p4V54wVZth4VVyy30M1xulaj4yZa1vphoWP9Nixx3g9
 xDDztoQub2AKWM3S2GZNsXrHXc5N7WX3ZPvX2OysY8ucEXlinXMumQgY3p/w==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 20B894718F
	for <nouveau@lists.freedesktop.org>; Thu, 30 Jul 2026 19:40:11 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E474310EFB7
	for <nouveau@lists.freedesktop.org>; Thu, 30 Jul 2026 19:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785441359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G7pXERsaJxupz3ibBtEt7AN3qvnUBtFJM+fFekmGGOQ=;
	b=fNJ0Wv0At2uQDdFbJssGvGqK9pt6S76uKj4GX/UTbI0YolBdtTmRgCBXuv7yaNGm36i5Td
	NTVdKqMC4Mb/0PkrchFy6txUDByqSfvcXXQoM7KdZqNkl5CO9K5JB1AbcvsxNa5KuqKvX2
	HmkevSNbnHphvVVHaFscRzLPF2stXus=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-672-DgDdUgqmO224STtwxfjrUg-1; Thu,
 30 Jul 2026 15:55:55 -0400
X-MC-Unique: DgDdUgqmO224STtwxfjrUg-1
X-Mimecast-MFC-AGG-ID: DgDdUgqmO224STtwxfjrUg_1785441354
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D4F14180035C;
	Thu, 30 Jul 2026 19:55:53 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.88.35])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 79571424;
	Thu, 30 Jul 2026 19:55:52 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] drm/nouveau/kms: Only allow enabling atomic
 modesetting on nv50+
Date: Thu, 30 Jul 2026 15:51:08 -0400
Message-ID: <20260730195523.1467423-5-lyude@redhat.com>
In-Reply-To: <20260730195523.1467423-1-lyude@redhat.com>
References: <20260730195523.1467423-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: NLIfhAtl2IUJhSea_fau1wEWkSXirQD_wSLdt8l6i3E_1785441354
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: VMEX5XCU656WXR5EOGT6QOUC26M52MKK
X-Message-ID-Hash: VMEX5XCU656WXR5EOGT6QOUC26M52MKK
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VMEX5XCU656WXR5EOGT6QOUC26M52MKK/>
Archived-At: 
 <https://lore.freedesktop.org/20260730195523.1467423-5-lyude@redhat.com/>
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
V2:
* Check against info.family, not info.chipset

 drivers/gpu/drm/nouveau/nouveau_drm.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index ae489dc1b1943..33f60f5d4d9f3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -770,8 +770,12 @@ nouveau_drm_device_new(struct device *parent, struct nvkm_device *device)
 		goto done;
 	}
 
-	if (nouveau_atomic)
-		drm_driver->driver_features |= DRIVER_ATOMIC;
+	if (nouveau_atomic) {
+		if (drm->device.info.family >= NV_DEVICE_INFO_V0_TESLA)
+			drm_driver->driver_features |= DRIVER_ATOMIC;
+		else
+			NV_WARN(drm, "Atomic modesetting not supported (needs nv50+)\n");
+	}
 
 	ret = nvif_device_map(&drm->device);
 	if (ret) {
-- 
2.55.0

