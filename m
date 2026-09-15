Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F9EC88E75
	for <nouveau@archiver.kernel.org>; Tue, 15 Sep 2026 21:08:11 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 363CD10E836;
	Tue, 15 Sep 2026 21:08:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Ks6XPvyi";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9440E4808D;
	Tue, 15 Sep 2026 20:50:37 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789505437;
 b=Q3LZrGKYzcwo+NwQHRWQ79JxcGeXmk/5+OhlF+d75IdUrYkPLiNEeXYOB/zh6QCv+HYja
 qoUj/Z0msfJzy1ECZY7+9XPrFPLNvwapnc3fekhmlR2cDe5enu4bQPCMGh/2DEtvATkXLzK
 UHRE3zlH/W/UhgAMgJ/Z3UJYN5/9VSR3uwfRlMAvHzRN3oUMiIe4YjQ/ANZevnjzfALYokV
 /SzGdfvPxQRYLqsN/syGUxIf8+2mbE6Za3q7BBViN54XVKg/SudkyK3gkF51nUhqk+LHnLJ
 wqCbaeY0tUNW+hc8tRenWyYzZVIO70s4pk+c0LsbqNhW47+RX/pgwW1Za44w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789505437; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=2ATpn8ez/0YuEtC0S+/A/Cw0hfbbKsjXiceZVuc6lSs=;
 b=aVushczKXrzOYd0pDSFfZUIXBrL37NT9B1kxttUYZqscmErQrD159Z0d2yg0KdCUhPR0e
 jiv6iYEn7oNr8gBxm6O2aqARt4ssI16D/gfJd1GJ3csdOkAuZQlBAAol4EKVXAPv4ykTKda
 y+aRo16WC4p42ytRMKDgrQnpHtoC9vyGI7bsoBbe/SXHCu7hsY93Zl5VkXQ/LTP3HJC7+Zt
 orGITwcFhsUXWKUiaPSYTFas3JHyfiO/4g0/TA/OnGJXKsCoKbDGWRvE1o/xTatariECgBG
 dRhjxXpcEKf2l2rImKbSAuXTGCB97F1/dbvYRb69pIoBpGUyTA3AYYsk9QSA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C1BF24807E
	for <nouveau@lists.freedesktop.org>; Tue, 15 Sep 2026 20:50:34 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 261F910E2D6
	for <nouveau@lists.freedesktop.org>; Tue, 15 Sep 2026 21:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789506487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2ATpn8ez/0YuEtC0S+/A/Cw0hfbbKsjXiceZVuc6lSs=;
	b=Ks6XPvyimfT+aWKD1dbMvuTZnpRXW9p+HHeTizKy+R9GqMPfqMfegTvFF6CxFNBE+ftdhm
	EzvxY3NnGZPwjD8R7eCHAR0jUFqsW5O+3zaTEfNiB7JQqb/kl99DoK1oLcBI0mIgeYlmJ+
	14Y4ZdyCKZzNBpYkYWH5EemNVxJTYgg=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-397-0J5yZtvJMDi8q541Fju1Uw-1; Tue,
 15 Sep 2026 17:08:04 -0400
X-MC-Unique: 0J5yZtvJMDi8q541Fju1Uw-1
X-Mimecast-MFC-AGG-ID: 0J5yZtvJMDi8q541Fju1Uw_1789506483
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BA9E11869BB8;
	Tue, 15 Sep 2026 21:08:02 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.80.179])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 53CD61800446;
	Tue, 15 Sep 2026 21:08:00 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] drm/nouveau/gsp/r570: Enable Gcoff in fbsr again
Date: Tue, 15 Sep 2026 14:51:52 -0400
Message-ID: <20260915210647.695187-6-lyude@redhat.com>
In-Reply-To: <20260915210647.695187-1-lyude@redhat.com>
References: <20260915210647.695187-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: hrsVQ7_ibvbuh-SdvGe_8TDiTuyioPhjRNlpmUZOzxA_1789506483
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: NJ7GXNOBEWW57IYJZNZUY5C2STET2Y7U
X-Message-ID-Hash: NJ7GXNOBEWW57IYJZNZUY5C2STET2Y7U
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NJ7GXNOBEWW57IYJZNZUY5C2STET2Y7U/>
Archived-At: 
 <https://lore.freedesktop.org/20260915210647.695187-6-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Now that we're properly saving the compbit backing stores on fbsr init, we
can start setting bEnteringGcOff = 1 again without things breaking, which
brings us closer to following the exact same code-paths OpenRM does for
fbsr.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
index feef5104a6241..11f18b3eb6b16 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
@@ -135,7 +135,7 @@ r570_fbsr_init(struct nvkm_gsp *gsp, struct sg_table *sgt, u64 size)
 	ctrl->hClient = gsp->internal.client.object.handle;
 	ctrl->hSysMem = memlist.handle;
 	ctrl->sysmemAddrOfSuspendResumeData = gsp->sr.meta.addr;
-	ctrl->bEnteringGcoffState = 0;
+	ctrl->bEnteringGcoffState = 1;
 
 	ret = nvkm_gsp_rm_ctrl_wr(&gsp->internal.device.subdevice, ctrl);
 	if (ret)
-- 
2.55.0

