Return-Path: <SRS0=seGt=L5=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9159CC07E99
	for <nouveau@archiver.kernel.org>; Mon,  5 Jul 2021 09:05:27 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF738613FC
	for <nouveau@archiver.kernel.org>; Mon,  5 Jul 2021 09:05:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF738613FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baidu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=nouveau-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A262C89838;
	Mon,  5 Jul 2021 09:05:26 +0000 (UTC)
X-Greylist: delayed 923 seconds by postgrey-1.36 at gabe;
 Mon, 05 Jul 2021 09:05:25 UTC
Received: from baidu.com (usmx01.baidu.com [12.0.243.41])
 by gabe.freedesktop.org (Postfix) with ESMTP id A30D789838;
 Mon,  5 Jul 2021 09:05:25 +0000 (UTC)
Received: from BJHW-Mail-Ex14.internal.baidu.com (unknown [10.127.64.37])
 by Forcepoint Email with ESMTPS id 870992DBA41C14F17D9D;
 Mon,  5 Jul 2021 01:49:59 -0700 (PDT)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-Mail-Ex14.internal.baidu.com (10.127.64.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.10; Mon, 5 Jul 2021 16:49:57 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.4; Mon, 5 Jul 2021 16:49:57 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <lyude@redhat.com>, <christian.koenig@amd.com>, <tzimmermann@suse.de>,
 <bskeggs@redhat.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Date: Mon, 5 Jul 2021 16:49:48 +0800
Message-ID: <20210705084948.796-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex21.internal.baidu.com (172.31.51.15) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-Baidu-BdMsfe-DateCheck: 1_BJHW-Mail-Ex14_2021-07-05 16:49:57:760
Subject: [Nouveau] [PATCH] drm/nouveau: remove unused varialble "struct
 device *dev"
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau-bounces@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
Reviewed-by: Karol Herbst <kherbst@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 4f3a5357dd56..c5624048de5e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1242,7 +1242,6 @@ nouveau_ttm_tt_populate(struct ttm_device *bdev,
 {
        struct ttm_tt *ttm_dma = (void *)ttm;
        struct nouveau_drm *drm;
-       struct device *dev;
        bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);

        if (ttm_tt_is_populated(ttm))
@@ -1255,7 +1254,6 @@ nouveau_ttm_tt_populate(struct ttm_device *bdev,
        }

        drm = nouveau_bdev(bdev);
-       dev = drm->dev->dev;

        return ttm_pool_alloc(&drm->ttm.bdev.pool, ttm, ctx);
 }
@@ -1265,14 +1263,12 @@ nouveau_ttm_tt_unpopulate(struct ttm_device *bdev,
                          struct ttm_tt *ttm)
 {
        struct nouveau_drm *drm;
-       struct device *dev;
        bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);

        if (slave)
                return;

        drm = nouveau_bdev(bdev);
-       dev = drm->dev->dev;

        return ttm_pool_free(&drm->ttm.bdev.pool, ttm);
 }
--
2.25.1
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
