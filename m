Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25DDDC88E65
	for <nouveau@archiver.kernel.org>; Sun, 13 Sep 2026 13:20:46 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EC2C310E8FB;
	Sun, 13 Sep 2026 13:20:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="aej3VOP8";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6A58F47CF2;
	Sun, 13 Sep 2026 13:03:17 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789304597;
 b=ovwKdu6rsAMczTdEw7YvDKaBIKAJ4ECGJgw1l/GW0RnA15hoCeTQWaFcg4ZQiYJVu8/2K
 CGsM8NXSWWx0cD8Ri2wIRnhXV9/t08OSI+zI1wSEjriYImyeaxDpKwieIXn+OnUROOlNmBH
 q7br393JMIcO2lqepfR1lvljjVsbuuQ7qEBXv+QKolooks62oE2LB7zWLhhwj4IrCv13Nwa
 7nZPR0SwDz9w3JgP9xpqGmm8kvRHrZOZtwix2aL7ITk38drRSkrxsNyieN2UMSm8Bs2L/j3
 6C4immcXxk227KFwV2UDT7NTl2y71d0HBsoGPr25IaVOtHtF6pYYcWqywEbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789304597; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=QNpEoAYO5tPIJrxr6Q1S8k9pTa9ZIFsxZipyEXigaYY=;
 b=R1e51BMW2PcvDXlTFxmkBh7ZgSuAI322smD1+PLc7Qj2XwNj1KSw2qeF1c40rPfauMZi7
 +yHRBaeO6esDWYlgE7WQB8aNYKt3YWZP2sYjl1nhb6ySyO9uB5TlyqehKdT3gXy7v941RYH
 8ufyFr84CNfFfGArfqDw51oxjbQhHCiUh/Ra8H1InGj2Eh5uAOqcgvUMI+fHhshoBM+Pqjv
 bR2kW6Ri5WbVsHLKNWh7TNsWBJdQojgoG/14ofrX8LhNyGuUWMkNmmKbQ/iTEQvtsZjXpTv
 HacaNm6bEapyS//D3HCGa+7NkR8XRYpRkIykTVeBKHCUmW3x0x2IozFIwvYA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=seu.edu.cn;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=seu.edu.cn
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=seu.edu.cn;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=seu.edu.cn policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id F10F7473CC
	for <nouveau@lists.freedesktop.org>; Sun, 13 Sep 2026 12:40:10 +0000 (UTC)
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Sun, 13 Sep 2026 12:57:38 UTC
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com
 [45.254.49.197])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CC1F210E0C6
	for <nouveau@lists.freedesktop.org>; Sun, 13 Sep 2026 12:57:38 +0000 (UTC)
Received: from seu.edu.cn (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d907a3fa;
	Sun, 13 Sep 2026 20:52:30 +0800 (GMT+08:00)
From: Slavin Liu <bolin.liu@seu.edu.cn>
To: lyude@redhat.com,
	dakr@kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch
Subject: [PATCH] drm/nouveau: validate required NET_img regions
Date: Sun, 13 Sep 2026 20:52:28 +0800
Message-Id: <20260913125228.110071-1-bolin.liu@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa09ad38ab103a1kunmc644730d251211
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSkxMVh1PS0lITx4fQ0gYHlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhOQ0
	NVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=aej3VOP82w76HOV1Pkn2hex74ttZ+/C75EM87dAw9JSzuK7yPnMNrcX5VcxDN2q1zCo19dyjbUHZjZbix53PIEdra2lyw8zUu4V1a72Gd229VX6AKlxgVZj/d+hgc1tuN9+MuBXJ/bhAi8Pj1gPdY+3ZonT4hVM3rRrfothnK4A=;
 c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=QNpEoAYO5tPIJrxr6Q1S8k9pTa9ZIFsxZipyEXigaYY=;
	h=date:mime-version:subject:message-id:from;
X-MailFrom: bolin.liu@seu.edu.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: ZYFHJ2XG55DHEG7OAGX5PTJO3YIMGHEJ
X-Message-ID-Hash: ZYFHJ2XG55DHEG7OAGX5PTJO3YIMGHEJ
X-Mailman-Approved-At: Sun, 13 Sep 2026 13:03:14 +0000
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, bolin.liu@seu.edu.cn
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZYFHJ2XG55DHEG7OAGX5PTJO3YIMGHEJ/>
Archived-At: 
 <https://lore.freedesktop.org/20260913125228.110071-1-bolin.liu@seu.edu.cn/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The NET_img parser can finish without all FECS and GPCCS regions.
Reject missing required regions before computing their data addresses,
and release the firmware on both validation and ACR loading failures.

Detected by static analysis and reviewed with AI-assisted source auditing.

Fixes: c4bdac754ca0 ("drm/nouveau/gr/ga102: initial support")
Assisted-by: LLM
Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
---
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c
index 2b51f1d0c281..bfd1e00537b8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c
@@ -317,6 +317,11 @@ ga102_gr_load(struct gf100_gr *gr, int ver, const struct gf100_gr_fwif *fwif)
 		}
 	}
 
+	if (!fecs_inst || !fecs_data || !gpccs_inst || !gpccs_data) {
+		ret = -EINVAL;
+		goto out_firmware;
+	}
+
 	ret = nvkm_acr_lsfw_load_bl_sig_net(subdev, &gr->fecs.falcon, NVKM_ACR_LSF_FECS,
 					    "gr/fecs_", ver, fwif->fecs,
 					    fw->data + fecs_inst->data_offset,
@@ -324,7 +329,7 @@ ga102_gr_load(struct gf100_gr *gr, int ver, const struct gf100_gr_fwif *fwif)
 					    fw->data + fecs_data->data_offset,
 						       fecs_data->data_size);
 	if (ret)
-		return ret;
+		goto out_firmware;
 
 	ret = nvkm_acr_lsfw_load_bl_sig_net(subdev, &gr->gpccs.falcon, NVKM_ACR_LSF_GPCCS,
 					    "gr/gpccs_", ver, fwif->gpccs,
@@ -333,12 +338,13 @@ ga102_gr_load(struct gf100_gr *gr, int ver, const struct gf100_gr_fwif *fwif)
 					    fw->data + gpccs_data->data_offset,
 						       gpccs_data->data_size);
 	if (ret)
-		return ret;
+		goto out_firmware;
 
 	gr->firmware = true;
 
+ out_firmware:
 	nvkm_firmware_put(fw);
-	return 0;
+	return ret;
 }
 
 static const struct gf100_gr_fwif
