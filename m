Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BBBC53209
	for <nouveau@archiver.kernel.org>; Mon, 27 Jul 2026 17:53:44 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE9610E6B5;
	Mon, 27 Jul 2026 17:53:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZuABiiUP";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E194447425;
	Mon, 27 Jul 2026 17:38:01 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785173881;
 b=RnvPbOiSukUI/Q4WtszXg1TMp7e5/hEfri0/fxFvvhwz7QARnbA1GTS2bikaSc3gX2fNS
 DjJULiy8MgJFhW+myDUAB5toEkB3vUcz8xZD5d9X9O21oiqjOTvbxl8TQNYdj8eTNjAi1VM
 acsvgjw5Me1UPdHP7vGiepbDod2vKy8DLZV+bFaxvDi2ndd4ZoIS7j7d62jHKP3JcFWviMj
 yRPdAhIDPw2/I/mKOlGVJScHzKq1tQ5pDIiuZNO6Gk2moBP4PLgu2YLR3z6gl7FO2fdX6ZA
 c/DxrLDmy3LQ5gH1tL1co1Ty9TCFkMFTJ2eqYA8/7GMxfyQ+r0NdvXMIKMzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785173881; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=TowdlvuTVZS9NXVVVPf7eFBfnfCtrOAkvuPJAet0P8s=;
 b=XVNhG7xsyaAbfwGcpazgHqWFJaT/gKOcEBotdoMXmcaxibMpdtgXRkzYyWVQmcD2EhQi9
 XOHkmqpycntwoE4diag3VvLPQspGL5nsNVaza49NoJhMBwjsZF8w4ItkaR8mt+iTZzDHkTw
 bkWM/EhlizflvVS4EMP4Ylawf2+p7XNjiKFVaRmfi0VS9LO12ASJTnqVqetF3daXxK0UbOc
 AF+UMDU4ugDMvSMONPiIWWs16FUS0ntaZiaIVZEYcZ4P2BMCVQjTD4Drn+hiui5UXB5q7Ap
 FlMusAoFkpS2Qdm4VqbsUqzU86V4ecctwTfehPBDiCOyZmdVALATpL1a0OPw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 6309C46B91
	for <nouveau@lists.freedesktop.org>; Mon, 27 Jul 2026 17:37:58 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6D38210E6AD
	for <nouveau@lists.freedesktop.org>; Mon, 27 Jul 2026 17:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785174819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TowdlvuTVZS9NXVVVPf7eFBfnfCtrOAkvuPJAet0P8s=;
	b=ZuABiiUP7oEfw9EzyApcrIGoWARXqHkbHaiMNMjVwOSKHejhAplEYyOUSwToZIOZFzAOOM
	238N1v8v/YqIV/Pc7HBV5Af66+dk0oOLFXg9pypLFLse1BAb1iPIS6YSPssgn4w1OT/Ckm
	pThR0Gx6HrLD9fUK4OFU/X+OLXsVv+c=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-149-AT2a_bd6PGianhP61_q71w-1; Mon,
 27 Jul 2026 13:53:36 -0400
X-MC-Unique: AT2a_bd6PGianhP61_q71w-1
X-Mimecast-MFC-AGG-ID: AT2a_bd6PGianhP61_q71w_1785174814
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D210F195DE15;
	Mon, 27 Jul 2026 17:53:33 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.65.215])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 953701956041;
	Mon, 27 Jul 2026 17:53:31 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] drm/nouveau/gsp/r570: Set GcOff = 1 in fbsr
Date: Mon, 27 Jul 2026 13:47:43 -0400
Message-ID: <20260727175246.642071-3-lyude@redhat.com>
In-Reply-To: <20260727175246.642071-1-lyude@redhat.com>
References: <20260727175246.642071-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: W5Ow3WgjM-1ZCvRquB2mc2QXjxSN5uF9hORfdzmvWVc_1785174814
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: YVIEDHCKU3ZQN6QOAMBROWABKIOYKDAR
X-Message-ID-Hash: YVIEDHCKU3ZQN6QOAMBROWABKIOYKDAR
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YVIEDHCKU3ZQN6QOAMBROWABKIOYKDAR/>
Archived-At: 
 <https://lore.freedesktop.org/20260727175246.642071-3-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Previously, it looked as if we were able to fix suspend/resume on some
desktops by setting Gcoff based on whether or not we were entering runtime
PM. This was a mistake though - the only time suspend/resume would end up
actually working was if Gcoff = 0.

It seems like it's likely the main reason for this is the FBSR GcOff
argument actually controls GSP's behavior with regards to which buffers it
decides to save across suspend/resume. When GcOff = 1, RM reserved regions
are saved unless they are marked as LOST_ON_SUSPEND, and RM channel-context
and kernel-client buffers are also saved -including- when they are
LOST_ON_SUSPEND. This means with GcOff = 1, we end up having GSP save and
restore buffers that actually need to be reinitialized on resume - causing
the failures we're setting.

In the long term, we do want to have GcOff = 1 as there are still a handful
of edge cases around broken runtime PM that I've seen on laptops - and I
have a strong guess that actually properly implementing the required bits
for enabling GcOff will probably address a number of those issues. For now
though, disabling GcOff results in runtime PM being dramatically more
stable then it was before.

Thanks to John Hubbard from Nvidia for providing some background on what
these options do in the GSP firmware do!

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
2.55.0

