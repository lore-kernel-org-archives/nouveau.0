Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D551606A31B
	for <nouveau@archiver.kernel.org>; Mon, 19 Oct 2026 18:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=W+SsKTAA
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 45D0B10EACB;
	Mon, 19 Oct 2026 18:56:50 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B8C6D48B3B;
	Mon, 19 Oct 2026 18:38:01 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1792435081;
 b=i8Er2GttzPicTc+VmINR0O3zAoGiOPrjEcJzGgk13pQ3ejj6iJJhXki8aS8VwfEQw4vxn
 /yU54qGQQ6bco+35OReFQJDj5n90Btw2cXvbDKEKj1gKfesjW9SbAQWgJKMnOhq5RO69bDQ
 ec3pPNn9m5rCKlxMrAoqxufCNy7X6YOuipBLhPZanvsLBU0BQK7o0a2OepdhGPtKxFXJH1Y
 qwxcbAbwL9sGY9u6HTqiZOqtLpBulEmPUx8LC1dUlrtWD6j6sJgV7oe/+pAdL05mloTeM8l
 d3H7u0TgLE92b+XTYJGyNo42sE1KePq3uJUYyEc1gAisumTOvmPMgf/0Om7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1792435081; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=whcwWcGUKRfvtRwNpcj2S48Yg35okxV42v9ufuqcUeM=;
 b=JX2I5s4Io2xvZB/0r5C3wPT5R0TS/q95ZtjPa3Dp4cQ16je/V6NTflcvkdxXp6rnSWh4I
 6WDQZFyWm5xnf+riBl9Zb4NOnq6x+VT8jazo+yOp0Z2h9mX5O0ppcyH8Xh9/zqLcOlwuhwO
 jhHpMi7rBJotz+gXI0gvn17NDJrE5GB8Gmnf/LCOkhUElAZ6VJvyM0BrTXONhdnxxIF+l7U
 17Zfx4aNC7U1IMVpppKLsY4bcw3pDTTs/yd/Xe3XP75RUttWruWLrJ/oCJfJgAl2ZL/Rw38
 7Vg/3F7I92VLFHWTtFZieAsoh/qzEqxY2fAv9ZXP1nMPu1hlB3SNBlc7LMvw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=163.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=163.com policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=163.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=163.com policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id B76E347B29
	for <nouveau@lists.freedesktop.org>; Mon, 19 Oct 2026 08:33:24 +0000 (UTC)
X-Greylist: delayed 406 seconds by postgrey-1.36 at gabe;
 Mon, 19 Oct 2026 08:52:06 UTC
Received: from mail-proxy25210.mail.163.com (mail-proxy25210.mail.163.com
 [103.129.252.10])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BA65210E8A8
	for <nouveau@lists.freedesktop.org>; Mon, 19 Oct 2026 08:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=wh
	cwWcGUKRfvtRwNpcj2S48Yg35okxV42v9ufuqcUeM=; b=W+SsKTAAxDCRa/2MyW
	7zwswFvwlpPCDRlltEZ6E+KT3p5mq8UV4sv+a4IF2KMh5C+zcUmpysq+ubRRPi3J
	iL3hGfLCqIJFXAGLjmHqL4FxmxdDIzbKa47RmRvysgh7NA4n0oa/lrTrfpGao2U6
	n1EYUuUgdyKUVkGdCIUqmVwmM=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id
 _____wDnt9ng19VqcQOlAw--.9091S4;
	Mon, 19 Oct 2026 16:42:15 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Ben Skeggs <bskeggs@redhat.com>,
	Dave Airlie <airlied@redhat.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] drm/nouveau: reject empty VRAM ranges
Date: Mon, 19 Oct 2026 16:41:34 +0800
Message-Id: <20261019084138.1821477-3-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019084138.1821477-1-yaojiale02@163.com>
References: <20261019084138.1821477-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnt9ng19VqcQOlAw--.9091S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrKrWUZw17Xr1kArW3ZF18Xwb_yoWDXFc_CF
	4xXFn3Gr1kKrWDtw4DAr43XFW2ka1UWF40vrs2qasxtry7XrySg347Xr1fXrykC3WIgFZ5
	G3Z0van5KFnI9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRJManUUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzgc-eWrV1+czqwAA3Y
X-MailFrom: yaojiale02@163.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: 57QI2KNPMOEXFV7Z6TZFPHRXCJTUGU4I
X-Message-ID-Hash: 57QI2KNPMOEXFV7Z6TZFPHRXCJTUGU4I
X-Mailman-Approved-At: Mon, 19 Oct 2026 18:37:59 +0000
CC: Jiale Yao <yaojiale02@163.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/57QI2KNPMOEXFV7Z6TZFPHRXCJTUGU4I/>
Archived-At: 
 <https://lore.freedesktop.org/20261019084138.1821477-3-yaojiale02@163.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A VRAM range smaller than a page becomes a zero-page TTM range and
causes drm_mm_init() to hit its zero-range BUG check. Reject it before
creating the VRAM manager.

Fixes: 37205891d84f ("drm/ttm: make ttm_range_man_init/takedown take type + args")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/gpu/drm/nouveau/nouveau_ttm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index cfc0868e2dd3..99c74c3b5976 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -181,6 +181,9 @@ nouveau_ttm_init_host(struct nouveau_drm *drm, u8 kind)
 static int
 nouveau_ttm_init_vram(struct nouveau_drm *drm)
 {
+	if (drm->gem.vram_available < PAGE_SIZE)
+		return -EINVAL;
+
 	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA) {
 		struct ttm_resource_manager *man = kzalloc_obj(*man);
 
-- 
2.34.1

