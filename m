Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA7DC25B06
	for <nouveau@archiver.kernel.org>; Thu,  4 Aug 2022 20:48:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B45A70F1;
	Thu,  4 Aug 2022 20:42:03 +0000 (UTC)
X-Greylist: delayed 331 seconds by postgrey-1.36 at gabe;
 Wed, 22 Jun 2022 01:58:39 UTC
Received: from mail.nfschina.com (unknown
 [IPv6:2400:dd01:100f:2:72e2:84ff:fe10:5f45])
 by gabe.freedesktop.org (Postfix) with ESMTP id AE824113577
 for <nouveau@lists.freedesktop.org>; Wed, 22 Jun 2022 01:58:39 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mail.nfschina.com (Postfix) with ESMTP id A6E8F1E80CD1;
 Wed, 22 Jun 2022 09:53:00 +0800 (CST)
X-Virus-Scanned: amavisd-new at test.com
Received: from mail.nfschina.com ([127.0.0.1])
 by localhost (mail.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vmh-X5Pvn_lN; Wed, 22 Jun 2022 09:52:58 +0800 (CST)
Received: from localhost.localdomain (unknown [112.64.61.97])
 (Authenticated sender: jiaming@nfschina.com)
 by mail.nfschina.com (Postfix) with ESMTPA id 574381E80C7D;
 Wed, 22 Jun 2022 09:52:57 +0800 (CST)
From: Zhang Jiaming <jiaming@nfschina.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Date: Wed, 22 Jun 2022 09:52:49 +0800
Message-Id: <20220622015249.8390-1-jiaming@nfschina.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 04 Aug 2022 20:34:50 +0000
Subject: [Nouveau] [PATCH] drm/nouveau/mmu: Fix a typo
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
Cc: nouveau@lists.freedesktop.org, Zhang Jiaming <jiaming@nfschina.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 liqiong@nfschina.com, bskeggs@redhat.com, renyu@nfschina.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

There is a typo in comments. Change 'neeed' to 'need'.

Signed-off-by: Zhang Jiaming <jiaming@nfschina.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
index 8bf00b396ec1..7d26608491b1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
@@ -280,7 +280,7 @@ nvkm_vmm_unref_ptes(struct nvkm_vmm_iter *it, bool pfn, u32 ptei, u32 ptes)
 	if (desc->type == SPT && (pgt->refs[0] || pgt->refs[1]))
 		nvkm_vmm_unref_sptes(it, pgt, desc, ptei, ptes);
 
-	/* PT no longer neeed?  Destroy it. */
+	/* PT no longer need?  Destroy it. */
 	if (!pgt->refs[type]) {
 		it->lvl++;
 		TRA(it, "%s empty", nvkm_vmm_desc_type(desc));
-- 
2.25.1

