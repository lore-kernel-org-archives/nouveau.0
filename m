Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BDBC5B572
	for <nouveau@archiver.kernel.org>; Thu, 13 Aug 2026 17:44:42 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 28C0A10F4A0;
	Thu, 13 Aug 2026 17:44:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Aayv2FsR";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 12E9C47739;
	Thu, 13 Aug 2026 17:28:19 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786642098;
 b=X3ybP4IdNX8oDBXOihhJQ1ZRTqVTcdYi9iVC/umYIDAsqkxOybojiBRWXAZfEBBbwAPgG
 4rE+ROpn5Cq381Y6rOVzRs/4ZB2TgptdChyM/wLQq2ZK9UWG1jD67O0rCzz61uGXujMQRqJ
 ICRHJm/I1UDIp+/QAGNWpTF8XEA+SNurXE9kAn+t029x+4QuNUyMXdNQcjz5krgvWxvehDE
 JP/RrBMLM/9uAS8hz1R4bzDcQ4+rXKRcYfrERf6xo7lzZiVKefQMX5x5RgiBYo1DdpPkXih
 //O17g/am9E59LrEKah1uT7/LLhH4BCoRkLeHnSvDfRJopCX2xhhv9QlfZmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786642098; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=NzeCgaMnOsG+RV68upoUHtAiXUIkruVdtD9NVtgw7D4=;
 b=ohqiNHKlI6YUyEVxRnJHVveIv8QqfphoVZ91GJ3yPGY398NvFiEwHH/OhE5gQVTEq0C1s
 aub67LIoX5aiwtScx0KLoBkg9ko8XILGEB5zGwILAsTwDvfPaHf4f9bWXiml5/f8oPzIYFU
 Dy62dQ5xV390PExg8zXpSTLJXKngQM33Ec2DfiPJgtGemcYdzK/URH3kZW2/FIHq7kNWL9Q
 oHdqhhaU1GTuNEawABgpryeIdtBWLtoTG2lFZJ1R7DNiFBemd4qb8QnlZ5uyw730ZHHgZcG
 /8cpzFP87WY9DfcWUZ9fnAYqCagyTb2RSxfGvRGutoV+d0nI/WiuoblU+vbg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 5AD5547708
	for <nouveau@lists.freedesktop.org>; Thu, 13 Aug 2026 17:28:15 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1F70810F494
	for <nouveau@lists.freedesktop.org>; Thu, 13 Aug 2026 17:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786643074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NzeCgaMnOsG+RV68upoUHtAiXUIkruVdtD9NVtgw7D4=;
	b=Aayv2FsROS3pV4AiZ0Ru88KTauh4c0CVMCU19jt46jTjOyx3YkcHdU7/90Mdq0VJXGV2DX
	BhdXHtOYnF/FZwULzTdp8R/Tt5qvwoaK/vEhASU4y099r/75Ykat244GcSxBp70b0k1Bu5
	Grn3bp5z5UA8VWo3lMWdgEhirIdhthA=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-308-FyiTRK8vN9WhUgUcxgXCdw-1; Thu,
 13 Aug 2026 13:44:31 -0400
X-MC-Unique: FyiTRK8vN9WhUgUcxgXCdw-1
X-Mimecast-MFC-AGG-ID: FyiTRK8vN9WhUgUcxgXCdw_1786643069
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5A7B71956057;
	Thu, 13 Aug 2026 17:44:29 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.80.207])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id D80CA195608A;
	Thu, 13 Aug 2026 17:44:27 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v6 2/5] drm/nouveau: Print the nouveau.atomic parameter in
 nouveau_display_options()
Date: Thu, 13 Aug 2026 13:42:53 -0400
Message-ID: <20260813174416.1812656-3-lyude@redhat.com>
In-Reply-To: <20260813174416.1812656-1-lyude@redhat.com>
References: <20260813174416.1812656-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: 8ChbC5LV1lRjaJ3JPOtPqVPn6qQF-sYxVLCyE7lc32s_1786643069
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: MAHVARXIG4KJHDGJXGFOSGZ5R6CRHRSG
X-Message-ID-Hash: MAHVARXIG4KJHDGJXGFOSGZ5R6CRHRSG
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MAHVARXIG4KJHDGJXGFOSGZ5R6CRHRSG/>
Archived-At: 
 <https://lore.freedesktop.org/20260813174416.1812656-3-lyude@redhat.com/>
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

