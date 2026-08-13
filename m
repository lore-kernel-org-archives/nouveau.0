Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A33C5DF6A
	for <nouveau@archiver.kernel.org>; Thu, 13 Aug 2026 20:37:47 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AF41910F53E;
	Thu, 13 Aug 2026 20:37:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JesRnFOr";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 62E1F47758;
	Thu, 13 Aug 2026 20:21:24 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786652484;
 b=NQGFnGeih6ZO+59JAANv17xDDxtbBfV0I2iljnWl7oKN7JxMAZ0XhB7d1c2cvSyzWNAz/
 eDcEVodgvKNiG7rqxAHBZgxJF79NlD0sUzSyY1rGKPRRDyrLic5FZStCW/0SHg11ppKeHOa
 eaPBXpv0p8N3L3I9ioMzNXEn5njarx2jGLce/QP4F5AkLnY1nH3arlxYPoAb+CJWBwy1pPy
 wsv2BA5pn9CMbIKU0qDpjDlz0VMMlpVBAyQ4FCsmRqrCiIrSCrkkzh5YxA8bV5FQ1zaUJql
 jYyAm0f6BfYKyE7Erc0teMKvYRS4TpItrtD5jGbvALltB7G4SJWKFoI4jbQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786652484; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=I9JC+g0Maoo410UDO/ewvAWhlpWmYHQJSQQ2FmZGNDs=;
 b=sukp4p5Qz85MDrujlGJ2hULwsxBxG0Rq68LoVamDjOARYTlJYMOxunWAtP7scsq/+GgAE
 LypSnjdkXdL3/sQqqnlZMUxyce6Xem3zr/QOYE89xA6cUfUirfpEs+/mSytGSgnu1SAzatW
 E5whWyp0AuhoacdYdCzy4huI8D/+o9qhE1ZpI7zbKQ1LyqUliClo2GCro4Hh8/mWTcwYQ9c
 l4DnwyllC+b+xeZc5s/QxI12lCfZGdGu3w8RnXwa1++K4U7xS06e8YkEHilDe7xGiCKnNG+
 Ws4/7LjszcFnSJ9rqRNRfBzrW9nd4Q9XIKpEEdBcIUKOHfSHdVs8cKKOcEjg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C4FFE476F0
	for <nouveau@lists.freedesktop.org>; Thu, 13 Aug 2026 20:21:21 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C7DA710F530
	for <nouveau@lists.freedesktop.org>; Thu, 13 Aug 2026 20:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786653461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I9JC+g0Maoo410UDO/ewvAWhlpWmYHQJSQQ2FmZGNDs=;
	b=JesRnFOrrWN7TQAaLK/CpXHeOtvkkKTsitPNlnsRQwoxGaVY4U6IvCVQBYfPntFspy9Q/s
	yKZh1M1kGlvAOoz2tQmGjJAn+XyslF40UIzm0pEyXB5wKBdq6r8oy7wWJpHNZmFK7c0GW2
	X2jDoUi8vcqAFdn04VhCksuvgdZeCGw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-606-BLFkP55LMwq_BQPD2_IlLQ-1; Thu,
 13 Aug 2026 16:37:37 -0400
X-MC-Unique: BLFkP55LMwq_BQPD2_IlLQ-1
X-Mimecast-MFC-AGG-ID: BLFkP55LMwq_BQPD2_IlLQ_1786653456
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B42321800365;
	Thu, 13 Aug 2026 20:37:35 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.80.207])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 364BA195DF9A;
	Thu, 13 Aug 2026 20:37:34 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v7 2/5] drm/nouveau: Print the nouveau.atomic parameter in
 nouveau_display_options()
Date: Thu, 13 Aug 2026 16:27:06 -0400
Message-ID: <20260813202833.2051778-3-lyude@redhat.com>
In-Reply-To: <20260813202833.2051778-1-lyude@redhat.com>
References: <20260813202833.2051778-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: 24QvuoY3xmWn8ORh2eYYCJh8vWq_ZkUNZhnfQ5xLGnE_1786653456
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: PYT6I7V4BZ7NOK7WUIJF4P7BGUHUOJSH
X-Message-ID-Hash: PYT6I7V4BZ7NOK7WUIJF4P7BGUHUOJSH
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PYT6I7V4BZ7NOK7WUIJF4P7BGUHUOJSH/>
Archived-At: 
 <https://lore.freedesktop.org/20260813202833.2051778-3-lyude@redhat.com/>
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

