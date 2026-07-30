Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B2FC5516E
	for <nouveau@archiver.kernel.org>; Thu, 30 Jul 2026 20:46:22 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2355210F098;
	Thu, 30 Jul 2026 20:46:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="im6fZ0SE";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id DBA3E47546;
	Thu, 30 Jul 2026 20:30:32 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785443432;
 b=C06HykWm6Iv4L7ndgc+SJHCsGA/C9rcL1vkQQzNrFKhZVc17S3dHfPAlXh1L0tuF4jsb9
 RjG7WythUUASzAB+IOUDZZ5BZVaOpJymcykPFtrr1pO1tgTDMNj6KlYTmDPVt7+DECNickp
 PZdrgBq4HKg73NvPbsj5cyUC5KNbL5XWxmn7IDe+j27bBnUbAVMwiiuwFDE9EV0wx0weYAl
 ZDxHqH1gZ+dpdJtGb3PnjY9ygTCZAp2vKoRHn0qNmggGxV3eP54rC+f5ek3B83/sZPh9ciE
 dtHek+7Ins2OpPSo05FOQn881MFTvQZiOTaiiW3aXeyEQqsnnWH6LxVO1iWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785443432; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=NzeCgaMnOsG+RV68upoUHtAiXUIkruVdtD9NVtgw7D4=;
 b=NH/3+6cO+pWtkuMW01MtOqek6k7NJTALoxEYGOiaJmbZ6kM6/MeA4oAIVfU6bdTc82AlX
 4PRHnPw8Ks00Oho0B1zBez687sFQTl7idEn3jIIITdFFcgF2keANELm6j0BLWBRhSNkcROX
 fsx82Nhbqw64Lhy+KHlzWluY79n4X0FltTdwcIeiDaIqO47gFv+wwAy+RIFRE1VVsk7L4vC
 QvX+Ph1EDcsS3B5uK3Dcdg7RVfZdo20zFl25GNmHS1+ALiS57dodcDTnoSfbnVSA1iXvc/0
 7GVN/byVKFVvfhE5a3aJtyNMhNE7CgoT4hEOhtD8JYwrf5vRBByGy367EkrA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B140147541
	for <nouveau@lists.freedesktop.org>; Thu, 30 Jul 2026 20:30:29 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A6E5410F08B
	for <nouveau@lists.freedesktop.org>; Thu, 30 Jul 2026 20:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785444377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NzeCgaMnOsG+RV68upoUHtAiXUIkruVdtD9NVtgw7D4=;
	b=im6fZ0SEQmO0BXgNXIFT1quAg1JDQotVKoIBaDkbN+CpJFTiX9UPSrpOLbbIWMdtqRpolB
	GR0OlmkrGfNnT2++MrSR2qtw/HbqEnMt7LCLRDb4ffMRUzcWWj+juAeWVpDmoZpMV8cS/7
	/FAd0OHznuCgIxjhzSiutS6VW+Nurm0=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-567-zDpfwHC_MfOPTyF3KuY7fg-1; Thu,
 30 Jul 2026 16:46:16 -0400
X-MC-Unique: zDpfwHC_MfOPTyF3KuY7fg-1
X-Mimecast-MFC-AGG-ID: zDpfwHC_MfOPTyF3KuY7fg_1785444375
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 10462195608A;
	Thu, 30 Jul 2026 20:46:15 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.88.35])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 84E091956089;
	Thu, 30 Jul 2026 20:46:13 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/5] drm/nouveau: Print the nouveau.atomic parameter in
 nouveau_display_options()
Date: Thu, 30 Jul 2026 16:45:07 -0400
Message-ID: <20260730204604.1729505-3-lyude@redhat.com>
In-Reply-To: <20260730204604.1729505-1-lyude@redhat.com>
References: <20260730204604.1729505-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: wqAHzLIB-Vvn_k4tqJbxzppSGpE4n7oRy361lQLa1mk_1785444375
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: PRVCEKMZSOOD3TA2KNEPJWTTKYDH2KRL
X-Message-ID-Hash: PRVCEKMZSOOD3TA2KNEPJWTTKYDH2KRL
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PRVCEKMZSOOD3TA2KNEPJWTTKYDH2KRL/>
Archived-At: 
 <https://lore.freedesktop.org/20260730204604.1729505-3-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Seems like we never remembered to start printing the value for this, so
let's start to aid in troubleshooting in case we run into any issues with
atomic.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index a348115518ec4..451009adee0de 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1417,6 +1417,7 @@ static void nouveau_display_options(void)
 	DRM_DEBUG_DRIVER("... debug        : %s\n", nouveau_debug);
 	DRM_DEBUG_DRIVER("... noaccel      : %d\n", nouveau_noaccel);
 	DRM_DEBUG_DRIVER("... modeset      : %d\n", nouveau_modeset);
+	DRM_DEBUG_DRIVER("... atomic       : %d\n", nouveau_atomic);
 	DRM_DEBUG_DRIVER("... runpm        : %d\n", nouveau_runtime_pm);
 	DRM_DEBUG_DRIVER("... vram_pushbuf : %d\n", nouveau_vram_pushbuf);
 	DRM_DEBUG_DRIVER("... hdmimhz      : %d\n", nouveau_hdmimhz);
-- 
2.55.0

