Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C72A5C982C1
	for <nouveau@archiver.kernel.org>; Wed, 16 Sep 2026 22:36:15 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9A1D210E542;
	Wed, 16 Sep 2026 22:36:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OwTMSiDh";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A17494815B;
	Wed, 16 Sep 2026 22:18:39 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789597119;
 b=T88k2j0ZN30DMcYXGQeRkUztFGzQEXRKQGDwDzjS5D3kE9RMWVRetJTt5cvXf5alArF4A
 8rTPOduXsQLpwNIfQFcXC3gVf/gVdnDyLPvvoIBIT6jGAEtQNhkDhGarqYZrdcCol9RlbBU
 VNVqKQAenImDfDKJbOSlQ7wOCDnViGqS/ADGn8o5DMhPDQGAAIMvxlqh5lj1S2b6mdodWBD
 ET7R8qT8CUzXkvHeSo3FIiQE+p0mFUj+pIWPsWC9H51Xs8yXpcOu2+aXoEj1vBTt8kerHM3
 P9ar8GNuhQeafYS0ySMIPdOx8QEdbiLvQ4XR9lKXSNHLeDB10nG786lVZgbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789597119; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=aqewkI9XW8kkFhwe5axz2bN5ZZvRPhhV5qUm5s3SaP8=;
 b=O63vLLqyT5SqlhkQ722YtlCrwGehDvwQ80NyIqicbuTsoMouNwIlGGtajMKc5LToDQqG+
 r1OuIFoxUrtNj0EjxNrRB3BKnUCkwTlqU1/u/tFU21UTdRcsKS0Gl4YqS2o0NGfqhM2k7Mj
 SI5bXzfbA7CblkYghcQEtgNP5jG7e78x5aeO3eLX49IXddl5dp2to0+724K5z/36S5ZENGv
 tzuFulNV7eeyjjXC1gaA8xDo8AM8LELsbT5SNt334Y9O/Kqm4KLxkJV1BhreY7XidifCDuB
 EEsivNJ8nnTG7eM8jlornCaWKSqD6eCL/knumMU1IPZ5CIcRtncIMgpxQrgg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id E226E480F6
	for <nouveau@lists.freedesktop.org>; Wed, 16 Sep 2026 22:18:36 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE9510E3B3
	for <nouveau@lists.freedesktop.org>; Wed, 16 Sep 2026 22:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789598171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aqewkI9XW8kkFhwe5axz2bN5ZZvRPhhV5qUm5s3SaP8=;
	b=OwTMSiDh9MezTaadqapmL/Ktnt+Hb8uXL17kgx49IfvPKcX4N+fcvNW6V6g7QHRk06K37q
	y4FJZfJXWrpdaJnZjR56+wW1QcpESagy2b5ZDdsgGVj44G00DkUaNDQFi90DGxIHoP4QIe
	S8bxG7cafDOP/t54UcxvgfFcry5lxxU=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-650-jOJSavJEM4KDUusR4F8PpQ-1; Wed,
 16 Sep 2026 18:36:06 -0400
X-MC-Unique: jOJSavJEM4KDUusR4F8PpQ-1
X-Mimecast-MFC-AGG-ID: jOJSavJEM4KDUusR4F8PpQ_1789598164
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4404418000A3;
	Wed, 16 Sep 2026 22:36:04 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.64.52])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 4D0F31800581;
	Wed, 16 Sep 2026 22:36:01 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/5] drm/nouveau/gsp/r570: Enable Gcoff in fbsr again
Date: Wed, 16 Sep 2026 18:25:09 -0400
Message-ID: <20260916223358.507351-6-lyude@redhat.com>
In-Reply-To: <20260916223358.507351-1-lyude@redhat.com>
References: <20260916223358.507351-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: oDYIGSQ2JTU07VNCDuAyCjJeL-jx3mToRGwrJJ3wPwU_1789598164
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: 5ADSVSDDVAKTU735OP2LBIX7N76HEWFM
X-Message-ID-Hash: 5ADSVSDDVAKTU735OP2LBIX7N76HEWFM
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Dave Airlie <airlied@redhat.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kees Cook <kees@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Hongling Zeng <zenghongling@kylinos.cn>,
 Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5ADSVSDDVAKTU735OP2LBIX7N76HEWFM/>
Archived-At: 
 <https://lore.freedesktop.org/20260916223358.507351-6-lyude@redhat.com/>
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

