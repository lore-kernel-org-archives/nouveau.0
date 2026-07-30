Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C27C5516E
	for <nouveau@archiver.kernel.org>; Thu, 30 Jul 2026 20:30:43 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 013B910F08D;
	Thu, 30 Jul 2026 20:30:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CClWfWpU";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CAE7D47510;
	Thu, 30 Jul 2026 20:14:52 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785442492;
 b=CJHW4wG12StT7sFQh2xKLj7c/3s8NGNVRjAr70q8GposTha9CNj8haj+433elD5I4B7o7
 KXuGncAu/UbqaYfJXWY96TfimIbTGFieI3gKW7zdiMwrNbaQe7l5jKuwwCNBVmxVOjXx/R+
 YAmDc/11Pafw70lS6IY0whhtKiMg8xsQCODU46P0y2VmDFiEvZyvAaqK9LXNjZ9yGFLnC21
 CWRfNQM8gshGWlRVlJP24cZQry64PQkpYSvS0kAmPFr4g55MtCjCJrP0iDcQ2SUQMD6QNEg
 5ZoWpMWxD6GyYsqo0yzSXk2qHhu7xV6GiTa9+twGUTwqmk9ShU7viulsw8MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785442492; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=tNjHSSX0xUczFYiR/s25By15KAIbaSixLoDw8lQKz2I=;
 b=CFGzmdPjWAMXtHmG2ImBLhc0eTvTfuv2lTT7voZNgq/427DtAI6U0GawNT3wtRrEnc+Gz
 C/03ZAnt8lTvWp/p/IBbHDsuyu4gi3YkuSLmFb/oeBsnpLAcvH3MKELY4klNY/0t5QHP0wO
 TvxjGWoc1ED51WrQe5y9KJ8QZBVj6DmV7xKNNFy46lZnPS4zXBRzBAEJa5dFvYHadZl0oQX
 ll345ME3CcSs2Kw72A9mtwurBfXH8K4wb9BWFLNLw0edDFr5DddEr1wV9CPP9j53B2OKpnc
 wKi12kGLFDB5AmE+mYOgIDS1hC5MD3j1nspJbXJbdTOYUKK57bKO9vGBcLyA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 4F6DA47184
	for <nouveau@lists.freedesktop.org>; Thu, 30 Jul 2026 20:14:51 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 337F310F071
	for <nouveau@lists.freedesktop.org>; Thu, 30 Jul 2026 20:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785443439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tNjHSSX0xUczFYiR/s25By15KAIbaSixLoDw8lQKz2I=;
	b=CClWfWpUPs+YzkWLAuo83ld8muzAYLFyuU2+00exsJ7IATiwvGJsd/BpYQstQlM5Nnb+V0
	5zch+fk/Q67YRGKyOyTxYLxUMSBtp2oh2uvm69e+o54DmD02j8dRIfyVnlgfI5hD0KmBZm
	bUGgJ2rqWF/PMJzgAFvlTuLyUZRoyNE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-378-CzbW6_huPCi9w0zMdPILug-1; Thu,
 30 Jul 2026 16:30:37 -0400
X-MC-Unique: CzbW6_huPCi9w0zMdPILug-1
X-Mimecast-MFC-AGG-ID: CzbW6_huPCi9w0zMdPILug_1785443436
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4A40E1800364;
	Thu, 30 Jul 2026 20:30:36 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.88.35])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id E3AA6414;
	Thu, 30 Jul 2026 20:30:34 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/5] drm/nouveau: Print the nouveau.atomic parameter in
 nouveau_display_options()
Date: Thu, 30 Jul 2026 16:28:05 -0400
Message-ID: <20260730203015.1572240-3-lyude@redhat.com>
In-Reply-To: <20260730203015.1572240-1-lyude@redhat.com>
References: <20260730203015.1572240-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: 66oHSlutzc4P4TUOIABiXps_miWYsRSS7CYYCHzBbcI_1785443436
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: FN2WHGKRJ3ELZ5O6LZIHAHEG5CUGSQB2
X-Message-ID-Hash: FN2WHGKRJ3ELZ5O6LZIHAHEG5CUGSQB2
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FN2WHGKRJ3ELZ5O6LZIHAHEG5CUGSQB2/>
Archived-At: 
 <https://lore.freedesktop.org/20260730203015.1572240-3-lyude@redhat.com/>
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
index 3dfe21cd4bde4..6940e774ace07 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1420,6 +1420,7 @@ static void nouveau_display_options(void)
 	DRM_DEBUG_DRIVER("... debug        : %s\n", nouveau_debug);
 	DRM_DEBUG_DRIVER("... noaccel      : %d\n", nouveau_noaccel);
 	DRM_DEBUG_DRIVER("... modeset      : %d\n", nouveau_modeset);
+	DRM_DEBUG_DRIVER("... atomic       : %d\n", nouveau_atomic);
 	DRM_DEBUG_DRIVER("... runpm        : %d\n", nouveau_runtime_pm);
 	DRM_DEBUG_DRIVER("... vram_pushbuf : %d\n", nouveau_vram_pushbuf);
 	DRM_DEBUG_DRIVER("... hdmimhz      : %d\n", nouveau_hdmimhz);
-- 
2.55.0

