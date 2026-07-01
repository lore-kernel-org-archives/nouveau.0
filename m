Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C61C43602
	for <nouveau@archiver.kernel.org>; Wed,  1 Jul 2026 18:29:23 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E936510F0BD;
	Wed,  1 Jul 2026 18:29:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Io+bFoP2";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 31B5646E1C;
	Wed,  1 Jul 2026 18:14:38 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782929677;
 b=ha/sUdQYONrXXCyTV+Z9hj8nHnxgi1uIcMT2RtfLT6vEC/wDVboxdfYMb2IPUpfOQNR/X
 P/2d8Movivc6bGTTu+WbCmjc093S6BjoRK5heV2WWeN0i3/pcYZjYv1TbKXp/Lb4ORNAius
 TrETFPs2p76wUPKw2uvMN3BGdNsTaDe/bz6tjcYJZjwCIlXYyn/eVBOPnzMqEdWvFBC/sze
 PCWxIdpHqpAWwvO0ifLjDWD8Auix8lGpJxs82P2Tj2g2Kyd8aUg2qn37gIp+hvDai/TWkNm
 q+UtTUDSoGibQKKOBpZECTqjhzO3pVP86DuXVYKQyFpbObV7QwoT86F0mHEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782929677; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=zw+yxHJkPLDJzuuhT36OrRKDnTGX+7WWEu0wvYE6r6k=;
 b=hNpANvnYnXkGwkgTJ8ZDfHDAyjPMmfaSNYr/I9q7WwmN1Z8x0ssW8MOGU56r6Oo+D83SI
 BvpOR7+qF6DLa+ywpOwaD4/BEf8V0cjpa3RgQMYkAeDmGlsPKzRt5ZSZBNETUvjoJ1dbwAx
 RPGuEpKvYWa/LF5gxW2EJL95LYXFUetz4Tb5NYFD6azTS5oAOjSfcsAzzRF6G6/7oELd03C
 /WkJ62a/FP/DG/UOoxx/Mz8H0v1bHpCuwQGVD2wSdXG+rLLdOeFsU+Nj8+JjEuVdtFRYj88
 MTNgrZxOx3vZRJA7sd2F2dvI5GTA7QPAnHNvsMJ/81Y1syfBsXYAsKpygMkQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A1E1846E06
	for <nouveau@lists.freedesktop.org>; Wed,  1 Jul 2026 18:14:35 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 19E1D10F0A3
	for <nouveau@lists.freedesktop.org>; Wed,  1 Jul 2026 18:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782930559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zw+yxHJkPLDJzuuhT36OrRKDnTGX+7WWEu0wvYE6r6k=;
	b=Io+bFoP206+cPnuKvWXzRFTN4Yu9+w7+wt/RRZKXO21YJZWhrntdfCfMNfda909B5kSmJo
	LQ3Ekuvqhtf76IUnMvpGmfygzjxFHGCSBWM1Vv2pHK8rMuqyLozfyVKgfIa4gRyaDiR1VI
	LVDZXBskrAN+KlzL2o8+uwW8Lv9h4Uo=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-35-hvADoyWyOhqU9c3AUPJFbg-1; Wed,
 01 Jul 2026 14:29:18 -0400
X-MC-Unique: hvADoyWyOhqU9c3AUPJFbg-1
X-Mimecast-MFC-AGG-ID: hvADoyWyOhqU9c3AUPJFbg_1782930555
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4AD7C1933EAE;
	Wed,  1 Jul 2026 18:29:15 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.89.127])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A8AE21800599;
	Wed,  1 Jul 2026 18:29:12 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] drm/nouveau/gsp/r570: Never enter Gcoff state
Date: Wed,  1 Jul 2026 14:17:34 -0400
Message-ID: <20260701182857.190713-3-lyude@redhat.com>
In-Reply-To: <20260701182857.190713-1-lyude@redhat.com>
References: <20260701182857.190713-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: R23mWZiiAHw3R5wNuvdefPcWbql_91XEJJH2kKxTFZY_1782930555
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: AK4OEOWAYNG65BJ7JYTHVIMSR4DR7AVE
X-Message-ID-Hash: AK4OEOWAYNG65BJ7JYTHVIMSR4DR7AVE
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: stable@vger.kernel.org, Dave Airlie <airlied@redhat.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Kees Cook <kees@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/AK4OEOWAYNG65BJ7JYTHVIMSR4DR7AVE/>
Archived-At: 
 <https://lore.freedesktop.org/20260701182857.190713-3-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

It turns out that the only reason our previous fixes looked like they
worked for this was because we would occasionally set the Gcoff state to 0
in the normal S3 path, which fixed suspend/resume on desktops - but not on
machines using runtime suspend.

The proper fix is to just never set this flag. Our current guess for the
reasoning behind this is that Gcoff likely coincides with GC6, and not
literally power off.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: 53dac0623853 ("drm/nouveau/gsp: add support for 570.144")
Cc: <stable@vger.kernel.org> # v6.16+
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
index 2945d5b4e5707..af5aa5065c3dd 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
@@ -81,7 +81,7 @@ r570_fbsr_init(struct nvkm_gsp *gsp, struct sg_table *sgt, u64 size)
 	ctrl->hClient = gsp->internal.client.object.handle;
 	ctrl->hSysMem = memlist.handle;
 	ctrl->sysmemAddrOfSuspendResumeData = gsp->sr.meta.addr;
-	ctrl->bEnteringGcoffState = 1;
+	ctrl->bEnteringGcoffState = 0;
 
 	ret = nvkm_gsp_rm_ctrl_wr(&gsp->internal.device.subdevice, ctrl);
 	if (ret)
-- 
2.54.0

