Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA66C88E77
	for <nouveau@archiver.kernel.org>; Wed, 16 Sep 2026 00:23:28 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0B1E610E754;
	Wed, 16 Sep 2026 00:23:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Z/FS8q6g";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1F8C8480BE;
	Wed, 16 Sep 2026 00:05:54 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789517153;
 b=rMm9y4dXtiFLxU8RWCGlaBe9tins0V3U6G/KOexVpWDsEnzqh0Q/M6pZdPpH5J+SsrFHA
 pV+kAufZgxS879T9qQx5L+hUFgrOcQl7y08l/xet3BITBDU4xQ9998Su9iFpTpOsywh1HLE
 2aGmQ6hr4aWTxw7R17NBRG/KZ+eXPXRZwhzkeDHUs1eoZc0yrBrMfR+ps573k2ETHD/tyiN
 JZnbDkwz9aT2oWc5XCthmkEW29ryOGrAOvJ8l3XitI/TvNp5CeHJBx78MoIOWmt/h2Lr4B5
 9e5kfXcFTeriFKwfSk+8fWqAei1bL0YEXdYR1CxOU11WU3viP+0ihEkaT2UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789517153; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=aqewkI9XW8kkFhwe5axz2bN5ZZvRPhhV5qUm5s3SaP8=;
 b=0EQstvMu2dBxddiWBYYJiXK0fRBXsCPyJXhHfOKkZTaptz68i2w1ndOEjSUbWGLx3E+eu
 RKjueDDzh6ZDQ+ZyU6RUoKRyCXkJPNa0W1ZDfXOpd87y6nYUk3P7SquPROrOVgl2ua7o2xF
 onToD1VYlABeME3zZtwTq3r5eLZBZGFY7+QASr6ODisTj/mzF8kgzJPjr23e8b5xN07rAsu
 3mV0owpZpKbRY5TJ/1qGPxxvRZwuJ/RzYWmBOsYGDSDk91n1bHu9iqq3aG3fqc4vzBQlrLa
 1LyoWmJbxsynegwxjP60+dBQmukrYp6/CxiJBoDKV6WQVEQk+LNf+yXt4gZg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id DDCB2480A6
	for <nouveau@lists.freedesktop.org>; Wed, 16 Sep 2026 00:05:51 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 86D8E10E5EF
	for <nouveau@lists.freedesktop.org>; Wed, 16 Sep 2026 00:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789518204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aqewkI9XW8kkFhwe5axz2bN5ZZvRPhhV5qUm5s3SaP8=;
	b=Z/FS8q6g5P/khUt6ckCGMQoaSBVaekIoe7ii+vjb204GDqwHVhUmtrSa9j1FctiAxW24Ot
	fEvIWerFynlhW0ldYFv+CytI+MI48opcRh9RkD5+DUE6+HBHipcRqmek4GRVOYtFIGPJkN
	d5sBop7lFxEtrul22gA5sJ/w4KCbN+A=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-112-PrvtuHjxNxKxmwrEk7ghag-1; Tue,
 15 Sep 2026 20:23:21 -0400
X-MC-Unique: PrvtuHjxNxKxmwrEk7ghag-1
X-Mimecast-MFC-AGG-ID: PrvtuHjxNxKxmwrEk7ghag_1789518199
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6F2F6195BDCB;
	Wed, 16 Sep 2026 00:23:19 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.80.21])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id AE8723003EFB;
	Wed, 16 Sep 2026 00:23:16 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/5] drm/nouveau/gsp/r570: Enable Gcoff in fbsr again
Date: Tue, 15 Sep 2026 20:09:55 -0400
Message-ID: <20260916001603.22394-6-lyude@redhat.com>
In-Reply-To: <20260916001603.22394-1-lyude@redhat.com>
References: <20260916001603.22394-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: QkD8-6H9bogj1MBVsoENuzaPkFqelzFqWt-4ZZDGn6E_1789518199
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: CDCGKUREUXXFBNTVN5IV7TWHP4OCP7NP
X-Message-ID-Hash: CDCGKUREUXXFBNTVN5IV7TWHP4OCP7NP
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/CDCGKUREUXXFBNTVN5IV7TWHP4OCP7NP/>
Archived-At: 
 <https://lore.freedesktop.org/20260916001603.22394-6-lyude@redhat.com/>
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
index d3684bc4cf187..f27f19612a80d 100644
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

