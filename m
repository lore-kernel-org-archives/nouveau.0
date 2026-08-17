Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2463EC5DF74
	for <nouveau@archiver.kernel.org>; Mon, 17 Aug 2026 06:50:49 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 95C8010E664;
	Mon, 17 Aug 2026 06:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jSK3E7cu";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id AE40A47890;
	Mon, 17 Aug 2026 06:34:19 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786948459;
 b=OY6dDCfV99tZ4fLowoZOxjKRrfGCF32ftZdiMXP3uk9k8bX78ji4tpW0fidgs+JVY81t4
 YcEIaOIO5iT/dHHKP/hgoF5JT9R1HZ3+3zfVGg4J9wE4ADonglJ3QU11Ck5qbhL2x/I1bio
 BxAURjcfPXPHazEKxMNoTKfpyMp3gjJa+HgNbhFhB2dtE/YtKOZ6K9uD8dZYEmt1jFhitao
 7rP40l2Ttgt6xCKP4qRLL7tPz0qqlA7SWKYxWsBrSk1gFt6AhEFaLfmh8LKqStiWTpA9Wqp
 po37VDbAF+QEJmgs4EW11QANwDtU6E6GGtvf9stbxkGf22FhqR+yYwxH2ZqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786948459; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=XuSQ1h8q5Dxr0tPGcx8T4sl5O1DVJ8qy/f0AMwWXE7I=;
 b=D1fLNkMW0oTayGrmpH8kuy7OUtE0W+U5n/7sNNVkgLtGMSxJ3WYtM5E7vpur88r6jzKzy
 JQGxs8HTHoQgjrfM7FxRpa0tRRc14sIvGDekCulbBbDDpGQZGC5TXy1iyxVbRSj6848ZRTu
 /AQPTE8ZH6SC+6LtVwCQD+FAGmn6SfkcdmStOYuwouYjdsv3Mw9SElkcthGlK4XXgXysdg2
 ag7CpExndNEqUBZWjn5892f5ZiNFYa7FJQXUQkYgxSYA1puErXHsMVbcABAvKIqEjfAJ0YB
 5DWOsMaE2N9ZMRw5Onr7iAZ7lI1krjPBqR875REy/+S720UVK278jykDUL7w==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 95FF8414F8
	for <nouveau@lists.freedesktop.org>; Mon, 17 Aug 2026 06:34:15 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF7A10E648;
	Mon, 17 Aug 2026 06:50:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 32FF443CEF;
	Mon, 17 Aug 2026 06:50:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 024CAC2BCF7;
	Mon, 17 Aug 2026 06:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786949443;
	bh=0jIfKSzAE+75ToUwYrMLODJzLMibfWw9F/XdnV6FoW0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jSK3E7cu+VAaOG+FFC8ni1vvHjR4yd2XjVUhz131j6+wuv7uTpasKuavN9O0gtGYj
	 QNvu2tSfZzsi/ggaPb5cCCzzeaU00PEfCGE6jyn0IwVkfTi1poF7XNqrOpunkZM2he
	 wjKbVlikUy9H+g3S6khgSxLKqXvWqeAlO7rkq2qu1V5AJaorrZ3hjPv80Bk4oxpC4V
	 p2FP+ZTAO+BRC7frxgcACl5zlHtXs5LFmxh7Achp/FH0opeKjifcOAYMcx3BTr/Yz9
	 I2s7RiJA7g7xv34fZB+7QYvX5xk3eMnKQXubitlLP+BDkb4DPxrILzFj81HQYxDY3+
	 GuxDKsYNSyhmQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1AB3C5B572;
	Mon, 17 Aug 2026 06:50:42 +0000 (UTC)
From: Junrui Luo via B4 Relay <devnull+moonafterrain.outlook.com@kernel.org>
Date: Mon, 17 Aug 2026 14:50:40 +0800
Subject: [PATCH 1/2] drm/nouveau/dmem: pin VRAM for the whole registered
 range
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-nouveau-fixes-v1-1-f518d0c735f3@outlook.com>
References: <20260817-nouveau-fixes-v1-0-f518d0c735f3@outlook.com>
In-Reply-To: <20260817-nouveau-fixes-v1-0-f518d0c735f3@outlook.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 Balbir Singh <balbirs@nvidia.com>, Mary Guillemard <mary@mary.zone>,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
 James Jones <jajones@nvidia.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1569;
 i=moonafterrain@outlook.com; h=from:subject:message-id;
 bh=JWyT9l1BGNNzUOMeazwU1aUewzuACkAELT3y3ijb100=;
 b=kA0DAAoWceg4UIuO8EAByyZiAGqCr0Gia1eSm2iWLYigw1j3zlknOQqpGbukRHCvB7tZSeHHK
 4h1BAAWCgAdFiEEx3DS9jhNtC20TLRjceg4UIuO8EAFAmqCr0EACgkQceg4UIuO8EBu7wEAvphn
 +7tRZx/3bKNUMnkzJnovZ17334oxd+Xun10yN7gA+wY0GrtObNtbcC+rhjGswyHDmreHedTP47s
 SD0tqP8QB
X-Developer-Key: i=moonafterrain@outlook.com; a=openpgp;
 fpr=C770D2F6384DB42DB44CB46371E838508B8EF040
X-Endpoint-Received: by B4 Relay for moonafterrain@outlook.com/default with
 auth_id=909
X-Original-From: Junrui Luo <moonafterrain@outlook.com>
Message-ID-Hash: 67PO3WY5RYI6ZA7NY4CRW6XJMWCNVJPM
X-Message-ID-Hash: 67PO3WY5RYI6ZA7NY4CRW6XJMWCNVJPM
X-MailFrom: devnull+moonafterrain.outlook.com@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Junrui Luo <moonafterrain@outlook.com>,
 Yuhao Jiang <danisjiang@gmail.com>, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: moonafterrain@outlook.com
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/67PO3WY5RYI6ZA7NY4CRW6XJMWCNVJPM/>
Archived-At: 
 <https://lore.freedesktop.org/20260817-nouveau-fixes-v1-1-f518d0c735f3@outlook.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Junrui Luo <moonafterrain@outlook.com>

Commit c32287471077 ("gpu/drm/nouveau: enable THP support for GPU memory
migration") grew the device-private region that
nouveau_dmem_chunk_alloc() registers from DMEM_CHUNK_SIZE to
DMEM_CHUNK_SIZE * NR_CHUNKS, but left the VRAM buffer object backing that
region at DMEM_CHUNK_SIZE.

nouveau_dmem_page_addr() returns chunk->bo->offset plus the page's offset
within the registered region, so every page past the first chunk resolves
to VRAM outside the buffer object.

Size the buffer object to the region it backs.

Fixes: c32287471077 ("gpu/drm/nouveau: enable THP support for GPU memory migration")
Reported-by: Yuhao Jiang <danisjiang@gmail.com>
Assisted-by: Claude:claude-opus-5
Cc: stable@vger.kernel.org
Signed-off-by: Junrui Luo <moonafterrain@outlook.com>
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 9442ec6e1f6c..356ff8f3c1b8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -325,8 +325,8 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage,
 	chunk->pagemap.ops = &nouveau_dmem_pagemap_ops;
 	chunk->pagemap.owner = drm->dev;
 
-	ret = nouveau_bo_new_pin(&drm->client, NOUVEAU_GEM_DOMAIN_VRAM, DMEM_CHUNK_SIZE,
-				 &chunk->bo);
+	ret = nouveau_bo_new_pin(&drm->client, NOUVEAU_GEM_DOMAIN_VRAM,
+				 DMEM_CHUNK_SIZE * NR_CHUNKS, &chunk->bo);
 	if (ret)
 		goto out_release;
 

-- 
2.51.2


