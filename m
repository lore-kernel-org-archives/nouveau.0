Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A6FD13C1B
	for <nouveau@archiver.kernel.org>; Tue, 27 Jan 2026 02:36:40 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AC0A410E278;
	Tue, 27 Jan 2026 02:36:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="ketQ06f4";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C087A40ACE;
	Tue, 27 Jan 2026 02:27:41 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769480861;
 b=U3gKGAbjTVdNCyHeX+lm0PLD09ahho8bT0YXPPTOLhhZV4Ud9AAzLZOEkjWBRgUSgyCCZ
 YRl+POy4NaF/agb6hdB6d/GCxP8ZogQsaVOBaw+qT/Y0Vy7IZejSIL7rK9EbmstF52TZi/z
 PY5sa6CFT5wtaQX+3qS6rCkx5w7Oj/cHtn/UgXwS/xMkbj/ql4ks8DklWD1VRGoLbZZPcwS
 sgrLi6bnxN+3sZBm+XR27z+0LVLiy2qiMlQrMmLWChgH/AbRuCj+V558GHfxdcsvw2/2HKJ
 X8uH5J2bp9Bchgh+tvEDprD1qjYntAmXEitXALcvn2AIDpeLeBjEIvVskuBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769480861; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=m13OkK6Tk+ugEWhQFvMZVd/ciBO6ic38A0S2OJKhlIE=;
 b=JHR/7FP1IFlLz2F4ROVTnmeFMg6Y8gUxHwUR4o6J6+yzJoZiZdRi1tSTyQVga+cCoZPfS
 fB6zauskH7SZBWcMiaQIUc8NO/+bdM83d/Eca6TgMBQOp+WkI5RzRH+2T2/fSZcBytA/p2z
 6+SzrbladaqXa+ZrkH58V3RLg+F8T/pmMIrHyjOktGIhuV0bKWzg80aDqwPoN5hDwvwBBtb
 5v7f+ajIoXhwc+C9tn6DQnuHqq4+J7MwwCtpvcySyTdMRU0sWqmMkvpRt0fNvntSg9uS4lu
 mkNGb+/WVWFwvJ+kkC6SYMGmjoF81KmXN1fBEoS7xcjyw/JjIs+xX+7+kVDA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=seu.edu.cn;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=seu.edu.cn
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=seu.edu.cn;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=seu.edu.cn policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 0217D40371
	for <nouveau@lists.freedesktop.org>; Mon, 26 Jan 2026 11:16:28 +0000 (UTC)
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Mon, 26 Jan 2026 11:25:23 UTC
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com
 [45.254.49.197])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 50FCF10E425
	for <nouveau@lists.freedesktop.org>; Mon, 26 Jan 2026 11:25:23 +0000 (UTC)
Received: from LAPTOP-N070L597.localdomain (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 31fec9550;
	Mon, 26 Jan 2026 19:20:16 +0800 (GMT+08:00)
From: Zilin Guan <zilin@seu.edu.cn>
To: lyude@redhat.com
Subject: [PATCH] drm/nouveau/gr/ga102: Fix memory leak in ga102_gr_load()
Date: Mon, 26 Jan 2026 11:20:13 +0000
Message-Id: <20260126112013.117318-1-zilin@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9bfa0871e803a1kunm1619dd9d13e54e
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCSktJVh9LHUpNTx9NHkhLSFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhOQ0NVSktLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=ketQ06f4ZFwp0wiwUerGA/o7XMZZOtH5kOiv0tbYwK9+PeZWsMwEbRrp3Fwzfel93OTw5QhwtXW1LwsIip4wjwIc7Cvu+4a3nKaLstBHwmGUC6df31NnYtlzl1ADQAjUMRpWyLZ6obo178jUbgwgCtHlrK9u4IjhPXF6YFPJGYI=;
 c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=m13OkK6Tk+ugEWhQFvMZVd/ciBO6ic38A0S2OJKhlIE=;
	h=date:mime-version:subject:message-id:from;
X-MailFrom: zilin@seu.edu.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: TLB63PJ5IGSB4YNY2P2LWWJ3FLSOJUMJ
X-Message-ID-Hash: TLB63PJ5IGSB4YNY2P2LWWJ3FLSOJUMJ
X-Mailman-Approved-At: Tue, 27 Jan 2026 02:27:39 +0000
CC: dakr@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 simona@ffwll.ch, skeggs@nvidia.com, gsamaiya@nvidia.com,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jianhao.xu@seu.edu.cn,
 Zilin Guan <zilin@seu.edu.cn>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/TLB63PJ5IGSB4YNY2P2LWWJ3FLSOJUMJ/>
Archived-At: 
 <https://lore.freedesktop.org/20260126112013.117318-1-zilin@seu.edu.cn/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The ga102_gr_load() function loads firmware using nvkm_firmware_get().
If nvkm_acr_lsfw_load_bl_sig_net() fails for either FECS or GPCCS,
the function returns without releasing the firmware, resulting in a
memory leak.

Change the error paths to goto out_free to ensure nvkm_firmware_put()
is called to release the firmware.

Compile tested only. Issue found using a prototype static analysis tool
and code review.

Fixes: c4bdac754ca0 ("drm/nouveau/gr/ga102: initial support")
Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
---
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c
index 2b51f1d0c281..4338777506db 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c
@@ -324,7 +324,7 @@ ga102_gr_load(struct gf100_gr *gr, int ver, const struct gf100_gr_fwif *fwif)
 					    fw->data + fecs_data->data_offset,
 						       fecs_data->data_size);
 	if (ret)
-		return ret;
+		goto out_free;
 
 	ret = nvkm_acr_lsfw_load_bl_sig_net(subdev, &gr->gpccs.falcon, NVKM_ACR_LSF_GPCCS,
 					    "gr/gpccs_", ver, fwif->gpccs,
@@ -333,12 +333,13 @@ ga102_gr_load(struct gf100_gr *gr, int ver, const struct gf100_gr_fwif *fwif)
 					    fw->data + gpccs_data->data_offset,
 						       gpccs_data->data_size);
 	if (ret)
-		return ret;
+		goto out_free;
 
 	gr->firmware = true;
 
+out_free:
 	nvkm_firmware_put(fw);
-	return 0;
+	return ret;
 }
 
 static const struct gf100_gr_fwif
-- 
2.34.1

