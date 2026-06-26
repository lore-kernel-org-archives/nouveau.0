Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E6CDC43211
	for <nouveau@archiver.kernel.org>; Fri, 26 Jun 2026 14:47:29 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 114E810F680;
	Fri, 26 Jun 2026 14:47:29 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B1EE446D21;
	Fri, 26 Jun 2026 14:32:55 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782484375;
 b=T+icjZFJIFWi6tCqjwo0lPG49r6kL54UzNMMpiEGEMHo1cVmhu9rGoHdZ1eAJPbuC9RA6
 XFR8c/RIflA9e4wWFmFq9LXbgHEKGhUwtL3r4uXVYum8wV129T6jeyL4zrnm2EoWSFTnUfT
 EFR5+UI9vB15sj56aiVBRPWC2Acv7wmQTqSorP27sjCRpg5ZUSiItYPv7TmgiIlU0/ETznU
 NnLBEL2aFwORrr4yRi8WtTJvD1c1Monf8Z4NJCnHYNqv91woHD28ZSXwouY4eUbvXq3wr+5
 L1SMyZCE7zSqW3FN2X7zuIw3iV0HFuU7HtdOP59MQfnIedb2UbP75qV2+C7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782484375; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=UF1GCq9zEoEKOITb4FgSOOtsV6VRes3oEatN+hVTZTE=;
 b=NBAhArMPFl2sKrgIl8HNNGUSOos7VWsD6HCKSFTDL7DRBkK6KmkKQJzbhbQXfC//aXVZE
 bRJgWKKVfFQDBDuvI6p0py06TRAotyfau5C1LsTlPWY31angLFEUbucCFTTncR9Be65yrF5
 naf+z97I5U/Ab7gSwzZMeLzxPj787WTIwH2e8XME1ksNnhQbemopBqal/55ax2qcIFWVj5+
 eUc9kvKQ+qsgAKtxcVvCtSL83kfTdsesyi0YGxP7hePULZPuZ71rKiEFIf0P+h3ir+g/qpz
 6Otwou+NinJAkYRbrf9HkYXcCs7xD7tqkHfxJ+f8tjUJHqLb10KenFmAiiGA==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 26B6A46CFC
	for <nouveau@lists.freedesktop.org>; Fri, 26 Jun 2026 14:32:53 +0000 (UTC)
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8BBD210F677;
	Fri, 26 Jun 2026 14:47:25 +0000 (UTC)
Received: from localhost.localdomain (unknown [117.182.75.66])
	by APP-01 (Coremail) with SMTP id qwCowACXO9T1kD5qibBqAw--.4140S2;
	Fri, 26 Jun 2026 22:47:20 +0800 (CST)
From: WenTao Liang <vulab@iscas.ac.cn>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] fix: drm/nouveau: nvkm_ucgrp_new: nvkm_cgrp_new failure leaks
 ucgrp   object and engine reference
Date: Fri, 26 Jun 2026 22:47:17 +0800
Message-Id: <20260626144717.49109-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowACXO9T1kD5qibBqAw--.4140S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KrW5Gw45WF15trWkKr45KFg_yoW8JFW8pr
	s3Jw1avrW5JF4rtF48A3W8uFyfZan0qFyFkas0y343Zrn8ZrW8Cr4Fy34qqFyrZr47Ga1Y
	yFn2yrZYqF1YyFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCT
	nIWIevJa73UjIFyTuYvjfUOlkVUUUUU
X-Originating-IP: [117.182.75.66]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgcKA2o+h0EXvAABsw
Message-ID-Hash: J4MV7Y35BTTUGXKTS5JOKKOKEI7YYA2H
X-Message-ID-Hash: J4MV7Y35BTTUGXKTS5JOKKOKEI7YYA2H
X-MailFrom: vulab@iscas.ac.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org,
 WenTao Liang <vulab@iscas.ac.cn>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/J4MV7Y35BTTUGXKTS5JOKKOKEI7YYA2H/>
Archived-At: 
 <https://lore.freedesktop.org/20260626144717.49109-1-vulab@iscas.ac.cn/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

nvkm_object_ctor initializes ucgrp with an embedded kref and increments
  the engine's reference count. When nvkm_cgrp_new subsequently fails, the
  function jumps to done without calling nvkm_object_del to release ucgrp.
  The caller ignores *pobject on error, so the ucgrp object and its engine
  reference are permanently leaked.

Cc: stable@vger.kernel.org
Fixes: 06db7fded6de ("drm/nouveau/fifo: add new channel classes")
Signed-off-by: WenTao Liang <vulab@iscas.ac.cn>
---
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/ucgrp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ucgrp.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ucgrp.c
index dfa3c7dbdf34..7d11b92f946b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ucgrp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ucgrp.c
@@ -113,8 +113,10 @@ nvkm_ucgrp_new(struct nvkm_fifo *fifo, const struct nvkm_oclass *oclass, void *a
 	*pobject = &ucgrp->object;
 
 	ret = nvkm_cgrp_new(runl, args->v0.name, vmm, true, &ucgrp->cgrp);
-	if (ret)
+	if (ret) {
+		nvkm_object_del(pobject);
 		goto done;
+	}
 
 	/* Return channel group info to caller. */
 	args->v0.cgid = ucgrp->cgrp->id;
-- 
2.39.5 (Apple Git-154)

