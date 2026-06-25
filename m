Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A4B7CDE00C
	for <nouveau@archiver.kernel.org>; Thu, 25 Jun 2026 23:16:11 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 458E810F3D5;
	Thu, 25 Jun 2026 23:16:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fkeF8PmY";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7041B46CEF;
	Thu, 25 Jun 2026 23:01:39 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782428499;
 b=fTKOKHr8hpCksveniC5Pa3SSHnEyNoEhxXqqOazNVM84OnAWlGDiAb+signEWvM+GAjE2
 hod0RQ40B67LAEJbIyYOFBxdSyFFgodcGaNETk6lYHNDT+0QJ2ttPTQ6p5TFcnScUlaDIbi
 B+5W8V3LmasEG3v8lipSy+jWc4k/oTXBezMxFMO2bi0V92QD582msELOeumU5FEwT57fY12
 qI1VXlUWa29VORfxmYBd9BI867tKkmygDrUXNprkV7sBqS0fWlkYzOSXjykg2ID3/NeVLF3
 AHpOKWY4dIyl8X2qk68EM64DmyifPpVlBeY1AUSmzZJx7jUAcJHP15IgCQFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782428499; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=yrCphSM3KhpC5g69iDlAmJJN2Kzxjdu/a38nP3+JCPU=;
 b=axLECjc8SPYAugtg8kXt7kVxmw6vMJqJhcaIgz889D50MJR0b6vEyKOuJQauq3l4mu7Fv
 sVbnBluKwtLzoVNZmia8tyINPTISsQTb1g5WdSjf8R96cD6osGENjKVu13shiO5G6FgCDp3
 vqS/zl9vYzc/h6KnoYyuY+lQ7LWG1cVNPDbhjnjlf+bD/eHXwFLd53WLwQhn0zsgGVJ2elL
 LbLGu+GH/ApwtCStB0IMj3/NgGwHwrhbnpDH6H+Z29jbzlIefkSr9PkYkgb/EuGy5vH1mPv
 e2a7ZJ48nb3eCMzwOQm+aHgDtah5jrUrPyBU4FBq4nmfcG+BCzYzoZRBu52w==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 7A54D4684D
	for <nouveau@lists.freedesktop.org>; Thu, 25 Jun 2026 23:01:36 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1235310F3D5
	for <nouveau@lists.freedesktop.org>; Thu, 25 Jun 2026 23:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782429367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yrCphSM3KhpC5g69iDlAmJJN2Kzxjdu/a38nP3+JCPU=;
	b=fkeF8PmYL1Jo2RqERzA2CaL0nom4nZj0WnlK+MN4t7m6hVv0sqNyIsSYMv15OYIsp9X3xK
	VvWoS1ck/kgEhcRq19B81ec2wBZ5SVcuIOI1y7Br5np/NkYrJTgC4lwbYbJqyGRg+4veEA
	QKT/CvRU4pRwcreBUCwY5l2zhM0E2Jo=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-711-Fb5Al1OVPRu4zvq2iSnKww-1; Thu,
 25 Jun 2026 19:16:01 -0400
X-MC-Unique: Fb5Al1OVPRu4zvq2iSnKww-1
X-Mimecast-MFC-AGG-ID: Fb5Al1OVPRu4zvq2iSnKww_1782429358
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B40AC1955D99;
	Thu, 25 Jun 2026 23:15:58 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.64.18])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 81B3630A8;
	Thu, 25 Jun 2026 23:15:56 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm/nouveau/gsp/r570: Never enter Gcoff state
Date: Thu, 25 Jun 2026 19:10:55 -0400
Message-ID: <20260625231252.89684-3-lyude@redhat.com>
In-Reply-To: <20260625231252.89684-1-lyude@redhat.com>
References: <20260625231252.89684-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: Afo1yNqHkfIhn2Ub-oDZBfPJ4JIqYpncbXmaMcfj8vE_1782429358
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: 7BMJJKLXUJURG37NH6EZ6WSXPFRJBRQA
X-Message-ID-Hash: 7BMJJKLXUJURG37NH6EZ6WSXPFRJBRQA
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: stable@vger.kernel.org, Dave Airlie <airlied@redhat.com>,
 Kees Cook <kees@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Ben Skeggs <bskeggs@nvidia.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7BMJJKLXUJURG37NH6EZ6WSXPFRJBRQA/>
Archived-At: 
 <https://lore.freedesktop.org/20260625231252.89684-3-lyude@redhat.com/>
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
Fixes: 8302d0afeaec ("nouveau/gsp: fix suspend/resume regression on r570 firmware")
Cc: <stable@vger.kernel.org>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Kees Cook <kees@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Timur Tabi <ttabi@nvidia.com>
Cc: Ben Skeggs <bskeggs@nvidia.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mel Henning <mhenning@darkrefraction.com>
Cc: <stable@vger.kernel.org> # v6.19+
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

