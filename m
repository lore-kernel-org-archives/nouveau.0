Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B78CD3423
	for <nouveau@archiver.kernel.org>; Fri,  1 May 2026 21:57:30 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6AC7D10F634;
	Fri,  1 May 2026 21:57:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="iNmsFoBw";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6562A45D90;
	Fri,  1 May 2026 21:44:58 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777671898;
 b=DCyMJCVtsIi4Em2xXHdZvKROGOCgDn8kl/Y04t8BzJh3AX7SmY3OSlGSZ/oc8j/RYttei
 PBERFx05EDn9QD9PElA43UUb1KvDpUHCvMze+tSYEuGN9tTi2y1s6ip+EtNtBgHv0FRkBxo
 TTTpPUhosSu5k8QqKTEY9GzfyNmuPF2EYSTHXlJvhsTDRVP5rW1VY7ZsmhJn2TDCJHyYFZc
 khZDZsl2qk9oD913euoKShuqS4bE9bHlSHukdv5SYNuYIJtPPkn/cseDw2rkNQ7G6cpWvuO
 ehaLezwYEhIdujcIkD2yzpQvQ8QZP5V5yaP363dKEwiWsBX+mqIQVh90QGLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777671898; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=OgYb6Q6VT1d8Vcjc4hdMcMbpViHB83uWVolo9jV/q9s=;
 b=eFepXHml5Es9Ad5eO8dUJtErpHs3S0mFJQdyaXcvbU+40C9GPAr9Ey+zzukS+kPewbRaH
 9MSRxT9yuXY2YzVjXiFCidhDd+NkZniUvj3kcr7ftVQE7iIvo2W7HKOrFffrsh9BGenPOSP
 ULv43k4b77gcDESPheVBNY1xH0dEjrKtT5egFgGG65eu/Raxrlh3tOXeygPtKU2fVOXiHYx
 zh9Rwj+pNpyUj9BS3Laz2APVIVttsdiKTweZSYMM5J9EI1Xrqc7VXy7H6ZyL4k9uuSXN5Yt
 O1dG2yVWouEVCtUvtlZZfEXdP5gGaNp521gUzD77Df6jOpywBlaYoPSwWCrA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 6F20745C3C
	for <nouveau@lists.freedesktop.org>; Fri,  1 May 2026 21:44:55 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CD2BB10F62B
	for <nouveau@lists.freedesktop.org>; Fri,  1 May 2026 21:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777672644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OgYb6Q6VT1d8Vcjc4hdMcMbpViHB83uWVolo9jV/q9s=;
	b=iNmsFoBwyJtrndlxmCN4C8znUVqhaH+TVQh6fcq6I2eTzGNWnYTPm/AsKmYbh+EdDpONKN
	r7ELUyo/ztlkgouZdnole6/2pwH3171yWskbBPrmpGn1DW6iK4V/YF+wUjBznhRWv+vNXf
	wzoPWmuoKBFJNFpX4png6Gm+L9xph0I=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-235-tBYRbHs8N6WQOjczobiswQ-1; Fri,
 01 May 2026 17:57:20 -0400
X-MC-Unique: tBYRbHs8N6WQOjczobiswQ-1
X-Mimecast-MFC-AGG-ID: tBYRbHs8N6WQOjczobiswQ_1777672638
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 77E5419560B7;
	Fri,  1 May 2026 21:57:17 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.64.61])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 2C18A18001ED;
	Fri,  1 May 2026 21:57:15 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/nouveau/kms/nvd9-: Remove unused header in crc.c
Date: Fri,  1 May 2026 17:57:02 -0400
Message-ID: <20260501215703.820656-2-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: bTPA8akNY7WTu96vJcV8xdveRHjDQ6LWxdzTIlSzNSQ_1777672638
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: 744A2SROKVGT7UGRYNETPGQGWYOVQ5NE
X-Message-ID-Hash: 744A2SROKVGT7UGRYNETPGQGWYOVQ5NE
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Dave Airlie <airlied@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/744A2SROKVGT7UGRYNETPGQGWYOVQ5NE/>
Archived-At: 
 <https://lore.freedesktop.org/20260501215703.820656-2-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

No functional changes.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/crc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc.c b/drivers/gpu/drm/nouveau/dispnv50/crc.c
index deb6af40ef328..42a6ebbc2e3c3 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crc.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/crc.c
@@ -16,7 +16,6 @@
 #include "nouveau_drv.h"
 #include "core.h"
 #include "head.h"
-#include "wndw.h"
 #include "handles.h"
 #include "crc.h"
 

base-commit: 29d6da40d0b8bf3bbc3dcd1d2198434a0e1f71b0
-- 
2.54.0

