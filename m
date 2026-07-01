Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FCCFC43458
	for <nouveau@archiver.kernel.org>; Wed,  1 Jul 2026 18:29:34 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 450E210F0B9;
	Wed,  1 Jul 2026 18:29:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LAZqFwZ3";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8740B46E22;
	Wed,  1 Jul 2026 18:14:49 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782929689;
 b=uPoBri6pi/AEeeAUpqPxsp6uqgFzQS9fF+OrszfKRj8LTZyQu92SPXHmW0QaEMR4wKls+
 P/qHfJNS/kO61O55ipL0RKhQmSvac372sHRaKxKqQKbKe56uXtraBBxX87W0x1elBn6ji/A
 GVnMkts5UaiZLU2ABqJMnOXC373Y67+4NPefIBAl7HgVMF1ynYt2dij8togDSV6cJoLqRck
 ImWmWedd69kJS7iPzWbk06Yr7tw4ZxrqIR6x1BP8JoUE3AysPWWuT6zefW//EUrf6VofJeG
 3DwfKuT4C1PbJvX96eV9WhDCDW5dwPc4q6MP0+5i5JqGabSW6BD+NsLAHiDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782929689; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Bd0zjAt31uHijlzNz/qtp2d5hkCpWAc/XD0nGOg/LzE=;
 b=va5MXXTkyTW/m7o0yz+r416kqF89mVmqY/IWCsSiNO4dtEP7xdiPt6VBd7EFUoi0oU8qq
 qGDJnA/+nmm7t4sOt45fJHnR38g8DugA3P1Wf+D7ruFceZNPu4mImvJbvMhj086IW37RAGW
 AqFr0F3FlRy5RllaIb/Q01Gny7x4NSmMnR8dzw3iwjp4mIyCculPjVyAEf+iXcJs3X2TIve
 l8O1LmyjGsH4s1CmtdnDtFFQe/xvtClpVr4sz2BQG/23WS0WJO7F252qWgAE77CXlayIqVJ
 8WIqXY/mJbQjxmNTdqZ1dxEnz0sQhLss8nfW9wPZGJC6eUAsX+kELOCTRS+A==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A8C1B46E1C
	for <nouveau@lists.freedesktop.org>; Wed,  1 Jul 2026 18:14:46 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 221EF10F0AB
	for <nouveau@lists.freedesktop.org>; Wed,  1 Jul 2026 18:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782930570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bd0zjAt31uHijlzNz/qtp2d5hkCpWAc/XD0nGOg/LzE=;
	b=LAZqFwZ3qlc3msWu6H1JuBlY3RACB70usN7iJ37EJQn0CDqnrLZgYJlITNq+DggG/svg8x
	GA7/6V3CS9gxsY7KN2L96v0kRD6r7IODEfz9So+e4HDYyM8dHYjmmHhy6QhjjY77fljchr
	0YePceRL14D6uSHOyuigK0a4rJ1McdI=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-665-_n_ciy7-M5igDLrg3se7Hg-1; Wed,
 01 Jul 2026 14:29:24 -0400
X-MC-Unique: _n_ciy7-M5igDLrg3se7Hg-1
X-Mimecast-MFC-AGG-ID: _n_ciy7-M5igDLrg3se7Hg_1782930562
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B2F851879581;
	Wed,  1 Jul 2026 18:29:21 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.89.127])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 705D1180056E;
	Wed,  1 Jul 2026 18:29:19 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] drm/nouveau/gsp/r570: Add missing state flags to GSP
 resume arguments
Date: Wed,  1 Jul 2026 14:17:35 -0400
Message-ID: <20260701182857.190713-4-lyude@redhat.com>
In-Reply-To: <20260701182857.190713-1-lyude@redhat.com>
References: <20260701182857.190713-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: rrGegF9Q99CT4PRPXklnlzq8cor5ln7zM5kXPWc_2tU_1782930562
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: UXAAQSKJCA6TNL5T72R5DNZWUCCEXBP7
X-Message-ID-Hash: UXAAQSKJCA6TNL5T72R5DNZWUCCEXBP7
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/UXAAQSKJCA6TNL5T72R5DNZWUCCEXBP7/>
Archived-At: 
 <https://lore.freedesktop.org/20260701182857.190713-4-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

When resuming the GPU, we need to let GSP know that we need it to avoid
destructive state transitions when bringing the GPU back up. Otherwise, we
will end up with a plethora of strange behavior after coming out of resume
- such as push buffers timing out whenever we try to do rendering.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: 53dac0623853 ("drm/nouveau/gsp: add support for 570.144")
Cc: <stable@vger.kernel.org> # v6.16+
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c     | 3 ++-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gsp.h    | 8 ++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
index 996941c668ba9..3e391646d8f7d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
@@ -198,7 +198,8 @@ r570_gsp_set_rmargs(struct nvkm_gsp *gsp, bool resume)
 		args->srInitArguments.bInPMTransition = 0;
 	} else {
 		args->srInitArguments.oldLevel = NV2080_CTRL_GPU_SET_POWER_STATE_GPU_LEVEL_3;
-		args->srInitArguments.flags = 0;
+		args->srInitArguments.flags =
+			GPU_STATE_FLAGS_PRESERVING | GPU_STATE_FLAGS_PM_TRANSITION;
 		args->srInitArguments.bInPMTransition = 1;
 	}
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gsp.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gsp.h
index b6075021e74f5..c458569af9d72 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gsp.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gsp.h
@@ -523,6 +523,14 @@ typedef struct
 
 #define NV2080_CTRL_GPU_SET_POWER_STATE_GPU_LEVEL_3            (0x00000003U)
 
+#define GPU_STATE_FLAGS_PRESERVING         BIT(0)  // GPU state is preserved
+#define GPU_STATE_FLAGS_VGA_TRANSITION     BIT(1)   // To be used with GPU_STATE_FLAGS_PRESERVING.
+#define GPU_STATE_FLAGS_PM_TRANSITION      BIT(2)   // To be used with GPU_STATE_FLAGS_PRESERVING.
+#define GPU_STATE_FLAGS_PM_SUSPEND         BIT(3)
+#define GPU_STATE_FLAGS_PM_HIBERNATE       BIT(4)
+#define GPU_STATE_FLAGS_GC6_TRANSITION     BIT(5)  // To be used with GPU_STATE_FLAGS_PRESERVING.
+#define GPU_STATE_FLAGS_FAST_UNLOAD        BIT(6)  // Used during windows restart, skips stateDestroy steps
+
 typedef struct
 {
     // Magic for verification by secure ucode
-- 
2.54.0

