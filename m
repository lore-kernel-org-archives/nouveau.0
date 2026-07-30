Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF73C53200
	for <nouveau@archiver.kernel.org>; Thu, 30 Jul 2026 01:08:57 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A276A10EB85;
	Thu, 30 Jul 2026 01:08:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Ao2sXtaz";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 40600474C3;
	Thu, 30 Jul 2026 00:53:08 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785372788;
 b=ZYlkJUpVJABhFRG7xwP4IeR/Yk3Fu37DS/N+hduw+U3ZUIzp+lOBOGvwcPxei74KaH9oU
 ygia1esT981C5DrZXJR4ywJweVXeIUjaYASUySNaTv4nFb+RK0p/UA2rR9O0y5ybruZ6E9j
 leuSFTSm09jBC6yl9xyf5C9tVJDMBBw5hXrFtf+DuM9u3cDHgXIM2h0Yiu27bGypZovvmTt
 qcnWLxvxtJTQdbUXH7Nu1UxiW5magm/u7KPXIWynrNyu6rZvOhs4DMVI6fJfnsVsYwg0Enw
 FqPzFbotqcLuokL7F859V8y+MRVZO6Z9R1THBxc92WQ4SNmkSvFdzN2tmiyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785372788; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=XtOErhmLXN4lxixM28GsejK33cC7v68+DPaDNJ4IPHQ=;
 b=Qi9pROSzxrfA2/cmrNv0jfjvjuRbVjnD8iNxpOA7022+dv6nJITYs4rD4qC+543ZpaEy0
 MgWKX15bf4wspSFfrjX4YiShi27scUV5qwe/OVIOfkYGeFCM957DJoR7L03GHwPe4EbXNIX
 Ur7/RSt0U/deQpidmncoOXkb8z+mGkUXqI2lkmRYy4s0TjyOjPwdeTj0pKR3AdFCPOZLvtg
 C41SVTp0VzejSRKOI94jY8yF+fBXpruAjYCdT3cSPKN1UVMCvCt1rdLp7ciscyLRseLhCTx
 bff1vikmZBnnNfBQdwWV8sriESkpk19ErWQhfO9Zxa9kyjTFdElS+rNebu/A==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 52EFD474B6
	for <nouveau@lists.freedesktop.org>; Thu, 30 Jul 2026 00:53:05 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7063210E0CB
	for <nouveau@lists.freedesktop.org>; Thu, 30 Jul 2026 01:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785373731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XtOErhmLXN4lxixM28GsejK33cC7v68+DPaDNJ4IPHQ=;
	b=Ao2sXtazWPgCOUaOsNkjHsytRI8RlZRZr8QQKM1v/KeSw5nswmP4jgiPSueQPWotHuSfzs
	iSsUDo0Q+4F2f74taJnfKrrFqJJy9PnRj2fC/r+MJtwACW2kwXIoW2qbxNwmZj3hpwwxrn
	eJ5Tlt06/DMmM9UwbksFvvaXr7fRy28=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-596-y5Tv_o9TP-KmW-BEjgEjIg-1; Wed,
 29 Jul 2026 21:08:48 -0400
X-MC-Unique: y5Tv_o9TP-KmW-BEjgEjIg-1
X-Mimecast-MFC-AGG-ID: y5Tv_o9TP-KmW-BEjgEjIg_1785373727
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9EB3419560AA;
	Thu, 30 Jul 2026 01:08:46 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.88.35])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id E0F2618004AD;
	Thu, 30 Jul 2026 01:08:44 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] drm/nouveau: Print the nouveau.atomic parameter in
 nouveau_display_options()
Date: Wed, 29 Jul 2026 20:56:07 -0400
Message-ID: <20260730010828.1056397-2-lyude@redhat.com>
In-Reply-To: <20260730010828.1056397-1-lyude@redhat.com>
References: <20260730010828.1056397-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: 6QSXOkdI7iqsYw6v1mTde5YrlAzLyroeMX6-wLEcP78_1785373727
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: MWJGFLBYTSD3FLMK4AVHJNN5VD7WBJEO
X-Message-ID-Hash: MWJGFLBYTSD3FLMK4AVHJNN5VD7WBJEO
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MWJGFLBYTSD3FLMK4AVHJNN5VD7WBJEO/>
Archived-At: 
 <https://lore.freedesktop.org/20260730010828.1056397-2-lyude@redhat.com/>
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
index 4d1ad718e09b7..ad693d2849bec 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1416,6 +1416,7 @@ static void nouveau_display_options(void)
 	DRM_DEBUG_DRIVER("... debug        : %s\n", nouveau_debug);
 	DRM_DEBUG_DRIVER("... noaccel      : %d\n", nouveau_noaccel);
 	DRM_DEBUG_DRIVER("... modeset      : %d\n", nouveau_modeset);
+	DRM_DEBUG_DRIVER("... atomic       : %d\n", nouveau_atomic);
 	DRM_DEBUG_DRIVER("... runpm        : %d\n", nouveau_runtime_pm);
 	DRM_DEBUG_DRIVER("... vram_pushbuf : %d\n", nouveau_vram_pushbuf);
 	DRM_DEBUG_DRIVER("... hdmimhz      : %d\n", nouveau_hdmimhz);
-- 
2.55.0

