Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6568AC43602
	for <nouveau@archiver.kernel.org>; Mon, 29 Jun 2026 22:44:52 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3E83710EA94;
	Mon, 29 Jun 2026 22:44:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="AGT5zEV6";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 91A9046DA7;
	Mon, 29 Jun 2026 22:30:11 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782772211;
 b=HVoIubr10+O56TQoZmoOPiPK42xTKL0Cp6JECXI64FI3PGH66OunCZ83wszenpDeiFLd2
 MkFCbZfzRaXihAXXHdtp1Oq26M8beIqq5uw6rQHDi0F4bY+hbJWaAWVfGErlfnsmSbAQ7oH
 Kzk5RB6bGwecHb5YK0+aNei/0ny/SnFf5UycHi4M0PmP2Fg/k7/ymKFhCIlC4HQYccHz04Q
 6NZ1POpCQxcS20RJtdaWjxIFxev9AwXVJZWR8C8R8EGsecqwV6thD/yeiTVb903wsA2R0CT
 3r8yGig8WQnIIETk+zGn6SK7+KLq0bhbYRi4EBDQi6Xc5QGKTA53f8UYVGuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782772211; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=pkXT6NSCsXj0i3X2uHiUABcB9Jzld6noTRsAXR1p7vA=;
 b=giWN4lWrKTKvRloHUzKKKDraK1RiB5QE0W/k5+v6CeRoc2gf6gVMV07aFVt1I2SrkNKV9
 pL4dwZlzrvL2X8py4BmP8lY55RzeqMZAub187ys9t5rPF3uLWq2CCRnQ2M2yeD0/Y9GLQV6
 Ho1i7YmaS9aXPB02fCj9kxPDMOFSfHJyznp4Gz9MYojPTeTOhhcthx8WKjYca4JnPj0jF03
 ZnKHVfvh10mXtr+V28+1IyEvMGR9ceeK5xbf8Q4cxn79ixiOXxo6qKaBjR6MHcpqAR2mZX/
 l75rh+LUJl3tCnr9yvU4YK0V0QYzrIputLWTjC1WUorLCuQK5rIAoItY61cw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 7062A46D51
	for <nouveau@lists.freedesktop.org>; Mon, 29 Jun 2026 22:30:08 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CDD3110EA7E
	for <nouveau@lists.freedesktop.org>; Mon, 29 Jun 2026 22:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782773087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pkXT6NSCsXj0i3X2uHiUABcB9Jzld6noTRsAXR1p7vA=;
	b=AGT5zEV6/nUywc1EclnRqiX2BbFhru6SengDGkyzpOBJaYpdoxA+RQtksu2qrTnry1vMvU
	3Q1p/el2cFD6tbCwfTxRQjnp3xQMX2S3OQOTzAx9ydQsj7qUKCAQEP2rcPtZsD5wPEmP1g
	T2MNynCnwX/1xD32+5Y4FhdWP8kNpV4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-564-oTPzkahzMjK9kh3AL_vaSQ-1; Mon,
 29 Jun 2026 18:44:43 -0400
X-MC-Unique: oTPzkahzMjK9kh3AL_vaSQ-1
X-Mimecast-MFC-AGG-ID: oTPzkahzMjK9kh3AL_vaSQ_1782773081
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3FC39180AD57;
	Mon, 29 Jun 2026 22:44:41 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.88.59])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 297B53691D;
	Mon, 29 Jun 2026 22:44:39 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] drm/nouveau/gsp/r570: Set oldLevel correctly in GSP
 resume arguments
Date: Mon, 29 Jun 2026 18:42:35 -0400
Message-ID: <20260629224350.2870201-4-lyude@redhat.com>
In-Reply-To: <20260629224350.2870201-1-lyude@redhat.com>
References: <20260629224350.2870201-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: kExsNerIsMBrlgc7wDV7Ii_kIV5dvxTQzs2M2RroinE_1782773081
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: JBKX2TOFCVAUOXC7MBMX5VOSA3GBF6IN
X-Message-ID-Hash: JBKX2TOFCVAUOXC7MBMX5VOSA3GBF6IN
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/JBKX2TOFCVAUOXC7MBMX5VOSA3GBF6IN/>
Archived-At: 
 <https://lore.freedesktop.org/20260629224350.2870201-4-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The way that OpenRM handles this is a bit funky. By default, OpenRM passes
through NV2080_CTRL_GPU_SET_POWER_STATE_GPU_LEVEL_3 as the supposed power
level that the GPU is entering. This is misleading though - because as far
as I can tell, that argument is never actually provided to GSP and appears
to be used mostly for internal state tracking by the driver.

What actually happens, is that on resume - OpenRM tells GSP that it's
resuming the GPU from LEVEL_4.

This is one part of getting runtime PM to be genuinely reliable with GSP
firmware.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: 53dac0623853 ("drm/nouveau/gsp: add support for 570.144")
Cc: <stable@vger.kernel.org> # v6.16+
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c      | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gsp.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
index 996941c668ba9..00158697bd77a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
@@ -197,7 +197,7 @@ r570_gsp_set_rmargs(struct nvkm_gsp *gsp, bool resume)
 		args->srInitArguments.flags = 0;
 		args->srInitArguments.bInPMTransition = 0;
 	} else {
-		args->srInitArguments.oldLevel = NV2080_CTRL_GPU_SET_POWER_STATE_GPU_LEVEL_3;
+		args->srInitArguments.oldLevel = NV2080_CTRL_GPU_SET_POWER_STATE_GPU_LEVEL_4;
 		args->srInitArguments.flags = 0;
 		args->srInitArguments.bInPMTransition = 1;
 	}
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gsp.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gsp.h
index b6075021e74f5..1904305b69624 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gsp.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gsp.h
@@ -521,7 +521,7 @@ typedef struct
     } profilerArgs;
 } GSP_ARGUMENTS_CACHED;
 
-#define NV2080_CTRL_GPU_SET_POWER_STATE_GPU_LEVEL_3            (0x00000003U)
+#define NV2080_CTRL_GPU_SET_POWER_STATE_GPU_LEVEL_4            (0x00000004U)
 
 typedef struct
 {
-- 
2.54.0

