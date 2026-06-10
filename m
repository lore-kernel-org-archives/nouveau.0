Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1863FCD8CB9
	for <nouveau@archiver.kernel.org>; Wed, 10 Jun 2026 02:55:52 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D331510E6C6;
	Wed, 10 Jun 2026 02:55:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="BVeB97sS";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1B488469E5;
	Wed, 10 Jun 2026 02:41:55 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1781059314;
 b=p32tjCGgRw2BAkR1MMuNcsGgHtwSGyTW3BhxsdwchIncDHCsZb3rQnnevVOCO2Ns1OWhk
 trP4n4kk4nWdA+wN7WGrrxn8cLfSPIYXJP1t42fs4zv53Az+u2FWIbe/IW5GygUOZDeS01Q
 X3j6TXgdugEh21Xq4qZcpKZFbbx1+PbTY1QvpMJVfH5sPgftliPnZND5wkLsGKXpSD+Han0
 aAw2qrHo1x86RBMNWiJLmKHUMbiYwikfC/03WvtmZdQW3eaP6LkG8hxiFhMmBJ8ElFE1wCV
 tKSvv6fOJGWFC5O+eY5JmEh9i749uvNDMRaYg2NCApCI64wDDSBENYw68cLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1781059314; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=0pJPLwBr4j7fuUn4mvVSS8dg+sLUYiki6rsJq47kVB0=;
 b=EnDcjYWhAapY3lkZpJSTqDmNKfmMgoxiGs46LJFLjJV4EqAmJd2QfE2+Hbe48wcyoA4ee
 4RrT3ozIZq/SPszc49NEnNVyQBOwEMRmwt3B047hUXtpUA14oL5HL3Hs7d4JewNu7KOICzM
 92m5OGP7yKTH54/jsBcDu4bWFVTRUy0GPrZXc1/61vFYyHzhlm28ih2Jsr/+2pQbOJxRwhN
 GGEmAzJpGPzjA87vFFhcs/50ciG+08AU76bnvuQsl1uL1nUMhXo9FBxenUIfzvnoI8ilerX
 3K0iBeV1H6dXNfuMdgrtYtyLLTPFXr8FwUxjsmefHag/KDuBr1U8cZ+uJ1CA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=seu.edu.cn;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=seu.edu.cn
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=seu.edu.cn;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=seu.edu.cn policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 38A9F46846
	for <nouveau@lists.freedesktop.org>; Wed, 10 Jun 2026 02:41:50 +0000 (UTC)
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Wed, 10 Jun 2026 02:55:45 UTC
Received: from mail-m93210.xmail.ntesmail.com (mail-m93210.xmail.ntesmail.com
 [103.126.93.210])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 21FE610E3C6;
	Wed, 10 Jun 2026 02:55:44 +0000 (UTC)
Received: from DESKTOP-SUEFNF9.taila7e912.ts.net (unknown [221.228.238.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 41c381d5a;
	Wed, 10 Jun 2026 10:50:38 +0800 (GMT+08:00)
From: Dawei Feng <dawei.feng@seu.edu.cn>
To: lyude@redhat.com
Subject: [PATCH v2] nouveau/firmware: fix memory leak on BL load failure
Date: Wed, 10 Jun 2026 10:50:37 +0800
Message-Id: <20260610025037.4115412-1-dawei.feng@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9eaf7062b703a2kunmc6eba4c6156930
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCGB1KVh5PTBofS09PTEgfH1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUpVSUlDVUlIQ1VDSVlXWRYaDxIVHRRZQVlPS0hVSktISk
	9ITFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=BVeB97sStw69DKNXFQtYXpsIiiNTJ/xuDGVaXutLyIwGvGDWzjd81LpZ1siCwco3Lhx0d4CXRrnVANOKJZNkK799vsoxQTDDp1MBK6yEWj2OnJx4nrMqQa1+xw1xn5H+41sL0uDQ4K3WA9zOXryl89EdxTLCmhS9KJSCjJ/p/Wc=;
 c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=0pJPLwBr4j7fuUn4mvVSS8dg+sLUYiki6rsJq47kVB0=;
	h=date:mime-version:subject:message-id:from;
Message-ID-Hash: QNMGRKODT5V2VXM4WLOQXDZEFXO357UF
X-Message-ID-Hash: QNMGRKODT5V2VXM4WLOQXDZEFXO357UF
X-MailFrom: dawei.feng@seu.edu.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dakr@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jianhao.xu@seu.edu.cn, Dawei Feng <dawei.feng@seu.edu.cn>,
 stable@vger.kernel.org, Zilin Guan <zilin@seu.edu.cn>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QNMGRKODT5V2VXM4WLOQXDZEFXO357UF/>
Archived-At: 
 <https://lore.freedesktop.org/20260610025037.4115412-1-dawei.feng@seu.edu.cn/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

If loading the HS bootloader blob fails, nvkm_falcon_fw_ctor_hs() returns
immediately. This skips the common cleanup path and leaks the firmware
state allocated by nvkm_falcon_fw_ctor() and nvkm_falcon_fw_sign().

Fix this by routing the load failure to the 'done' label so
nvkm_falcon_fw_dtor() can properly clean up the partially initialized
state. Keep the original image firmware in 'blob' until the common
cleanup path, and use a separate 'blob_bl' pointer for the bootloader
firmware so it can be released immediately after the bootloader data has
been copied.

The bug was first flagged by an experimental analysis tool we are
developing for kernel memory-management bugs while analyzing
v6.13-rc1. The tool is still under development and is not yet publicly
available. Manual inspection confirms that the bug is still present in
v7.1-rc6.

An x86_64 allyesconfig build showed no new warnings. As we do not have a
supported NVIDIA GPU with the required firmware to test this path, no
runtime testing was able to be performed.

Fixes: 2541626cfb79 ("drm/nouveau/acr: use common falcon HS FW code for ACR FWs")
Cc: stable@vger.kernel.org
Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
Signed-off-by: Dawei Feng <dawei.feng@seu.edu.cn>
---
Changes in v2:
- Use a separate bootloader firmware pointer instead of reusing 'blob'.
- Keep the original image firmware release in the common cleanup path.

 drivers/gpu/drm/nouveau/nvkm/falcon/fw.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/falcon/fw.c b/drivers/gpu/drm/nouveau/nvkm/falcon/fw.c
index 4e8b3f1c7e25..063469ee462f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/falcon/fw.c
+++ b/drivers/gpu/drm/nouveau/nvkm/falcon/fw.c
@@ -277,19 +277,20 @@ nvkm_falcon_fw_ctor_hs(const struct nvkm_falcon_fw_func *func, const char *name,
 	fw->dmem_sign = loc - lhdr->data_dma_base;
 
 	if (bl) {
-		nvkm_firmware_put(blob);
+		const struct firmware *blob_bl;
 
-		ret = nvkm_firmware_load_name(subdev, bl, "", ver, &blob);
+		ret = nvkm_firmware_load_name(subdev, bl, "", ver, &blob_bl);
 		if (ret)
-			return ret;
+			goto done;
 
-		hdr = nvfw_bin_hdr(subdev, blob->data);
-		desc = nvfw_bl_desc(subdev, blob->data + hdr->header_offset);
+		hdr = nvfw_bin_hdr(subdev, blob_bl->data);
+		desc = nvfw_bl_desc(subdev, blob_bl->data + hdr->header_offset);
 
 		fw->boot_addr = desc->start_tag << 8;
 		fw->boot_size = desc->code_size;
-		fw->boot = kmemdup(blob->data + hdr->data_offset + desc->code_off,
+		fw->boot = kmemdup(blob_bl->data + hdr->data_offset + desc->code_off,
 				   fw->boot_size, GFP_KERNEL);
+		nvkm_firmware_put(blob_bl);
 		if (!fw->boot)
 			ret = -ENOMEM;
 	} else {
-- 
2.34.1
