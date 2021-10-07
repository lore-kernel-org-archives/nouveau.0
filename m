Return-Path: <SRS0=aYAu=O3=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63588C433EF
	for <nouveau@archiver.kernel.org>; Thu,  7 Oct 2021 21:47:30 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BC6660273
	for <nouveau@archiver.kernel.org>; Thu,  7 Oct 2021 21:47:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1BC6660273
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F85C6F4E5;
	Thu,  7 Oct 2021 21:47:29 +0000 (UTC)
X-Greylist: delayed 350 seconds by postgrey-1.36 at gabe;
 Thu, 07 Oct 2021 21:47:28 UTC
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DF5D6F4E5
 for <nouveau@lists.freedesktop.org>; Thu,  7 Oct 2021 21:47:28 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 81051831B0;
 Thu,  7 Oct 2021 23:41:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1633642894;
 bh=fInwMaWN1j+5AjRLOCJ8WqzjwYwU7a4/Fu/B//8E1nw=;
 h=From:To:Cc:Subject:Date:From;
 b=Z/uylYb/+tFSSLedBMIeUw3rCZ1rMa0hhSA1jLjNFTQTFHv31pFwCXcQXpppx/V9T
 WOXzm3nMqhRPJiDTslzRwKwtYypS5Aw+Lg1FTZ5luYXvgWUw4TGTjyGgftE55Qup2i
 P5ipqybRTME+AhTCDxkW5UVS3/LCtaQ1vtceRJD3Y8COFhLGBkg2MLfw4xbnZ1BDt5
 I4lNftZr8BteE2pMfo+YOlXWPIVtKPhgb57MRZkKAZNNwLu3OjxBlPYCelMjtToa0f
 IUwyL3e4wfXhEmGifrfPxptU8Mlps32Hqu+popG4+FgvVO/zIBhry/ZB9R+1nayMHs
 A7hFUNdLb3olw==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org, Marek Vasut <marex@denx.de>,
 stable@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>
Date: Thu,  7 Oct 2021 23:41:17 +0200
Message-Id: <20211007214117.231472-1-marex@denx.de>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Subject: [Nouveau] [PATCH] drm/nouveau/fifo: Reinstate the correct engine
 bit programming
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Commit 64f7c698bea9 ("drm/nouveau/fifo: add engine_id hook") replaced
fifo/chang84.c g84_fifo_chan_engine() call with an indirect call of
fifo/g84.c g84_fifo_engine_id(). The G84_FIFO_ENGN_* values returned
from the later g84_fifo_engine_id() are incremented by 1 compared to
the previous g84_fifo_chan_engine() return values.

This is fine either way for most of the code, except this one line
where an engine bit programmed into the hardware is derived from the
return value. Decrement the return value accordingly, otherwise the
wrong engine bit is programmed into the hardware and that leads to
the following failure:
nouveau 0000:01:00.0: gr: 00000030 [ILLEGAL_MTHD ILLEGAL_CLASS] ch 1 [003fbce000 DRM] subc 3 class 0000 mthd 085c data 00000420

On the following hardware:
lspci -s 01:00.0
01:00.0 VGA compatible controller: NVIDIA Corporation GT216GLM [Quadro FX 880M] (rev a2)
lspci -ns 01:00.0
01:00.0 0300: 10de:0a3c (rev a2)

Fixes: 64f7c698bea9 ("drm/nouveau/fifo: add engine_id hook")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: <stable@vger.kernel.org> # 5.12+
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/chang84.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chang84.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chang84.c
index 353b77d9b3dc..3492c561f2cf 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chang84.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chang84.c
@@ -82,7 +82,7 @@ g84_fifo_chan_engine_fini(struct nvkm_fifo_chan *base,
 	if (offset < 0)
 		return 0;
 
-	engn = fifo->base.func->engine_id(&fifo->base, engine);
+	engn = fifo->base.func->engine_id(&fifo->base, engine) - 1;
 	save = nvkm_mask(device, 0x002520, 0x0000003f, 1 << engn);
 	nvkm_wr32(device, 0x0032fc, chan->base.inst->addr >> 12);
 	done = nvkm_msec(device, 2000,
-- 
2.33.0

