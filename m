Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CCDCD6E7C
	for <nouveau@archiver.kernel.org>; Fri,  5 Jun 2026 16:28:06 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BFEFB11A982;
	Fri,  5 Jun 2026 16:28:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="G4y7xzCU";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D8F294680D;
	Fri,  5 Jun 2026 16:14:18 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1780676058;
 b=e6pWLEz/WAW8TVDVV8ut4Pqmlsu5g4LzBOmcVHadTjDRGqESDmr4orw/fOjVhX3HsXmnF
 mOCeb4qIa7FOeMWqsre8CU0tbPIcBHotFwAp5Zr580z2GXWziniON+gxUDlLf8uondwr3dZ
 s7gzLpangFIHZsDlpYh8yZTF4/H00bS/xQ2Io4SRfn1gbC75h3MUvmPNzytdmkKv5PXRkY4
 2oOaJbzvJ02DhKeUjTV0xewc0bc9XlexoqL6/saEe3hLUY3AUCBY33M6J2PtIGKoB07oA1c
 KKRyZNDMOhLH5Dn+cVDrjW9ZOmz5tKXmbckBrfGlT4fHxMTojTDkETQKA97A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1780676058; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=9hPQlir0LYpa42uuWLi8uH8JCnnafnPqkGo+wT4cuCU=;
 b=zJjPt6XnLkWfSmpGZ+nDP6p/LDagF6n9eQkI1x2gQoq0cf8EPC69YJZTpKYvAv9p9UhdQ
 2cIZktrYSlNQ6OmG4fLGETFZdt2KasITeO9iBD/K3NRa2GbTK7dfu4l6bWFyxJWCAbAU9t7
 pH1tCCCr4lkQtKjI9z/6ewC9NpkKKlDTkvoGeIhWfLMtTh5cWG0CgKuGEmq9mmFCMvcBrD+
 aKV/7B+40lcD67MRT2LhwFsJFaaT3xqeBVk4GM+RblKwly4XBvcvePZjIvHOJNmI89QMDdh
 7AVzOy5+cM+5EAbEn0yzthmy6M1R8T5EGF+LMezO9vbzugFxiOpW2cDkhwmA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=seu.edu.cn;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=seu.edu.cn
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=seu.edu.cn;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=seu.edu.cn policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id ACC5A4411E
	for <nouveau@lists.freedesktop.org>; Fri,  5 Jun 2026 02:00:51 +0000 (UTC)
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Fri, 05 Jun 2026 02:14:32 UTC
Received: from mail-m2411.xmail.ntesmail.com (mail-m2411.xmail.ntesmail.com
 [45.195.24.11])
	by gabe.freedesktop.org (Postfix) with ESMTPS id ADBF711A3B5;
	Fri,  5 Jun 2026 02:14:32 +0000 (UTC)
Received: from DESKTOP-SUEFNF9.taila7e912.ts.net (unknown [223.112.146.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 412814aef;
	Fri, 5 Jun 2026 10:09:26 +0800 (GMT+08:00)
From: Dawei Feng <dawei.feng@seu.edu.cn>
To: lyude@redhat.com
Subject: [PATCH] nouveau/firmware: fix memory leak on BL load failure
Date: Fri,  5 Jun 2026 10:07:52 +0800
Message-Id: <20260605020752.1707562-1-dawei.feng@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e958adbad03a2kunme8b1df4229401
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCHR0fVktOGB0aSR9MQ08eSlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVSkpJVUpPTVVKTUlZV1kWGg8SFR0UWUFZT0tIVUpLSU
	hOQ0NVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=G4y7xzCU87m6TM2r9nqttfnEpiwLXLmAUtmfJsKWNCxv2FIyJYSir3x5/iUP8pSqaa+aY9iIgL912ZjwsfFULxFMchyYUkPUhw90xVpfeHcY96zWxdGiTejHAeKcF2alBT9G+d7lUCcQrHWK3tFhXb3f3tp28LoWBKB7MIkwVtQ=;
 c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=9hPQlir0LYpa42uuWLi8uH8JCnnafnPqkGo+wT4cuCU=;
	h=date:mime-version:subject:message-id:from;
X-MailFrom: dawei.feng@seu.edu.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: DH3WUNOUPUIQ2JB52T33UGQAATECIBSS
X-Message-ID-Hash: DH3WUNOUPUIQ2JB52T33UGQAATECIBSS
X-Mailman-Approved-At: Fri, 05 Jun 2026 16:14:16 +0000
CC: dakr@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 simona@ffwll.ch, namcao@linutronix.de, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jianhao.xu@seu.edu.cn, Dawei Feng <dawei.feng@seu.edu.cn>,
 stable@vger.kernel.org, Zilin Guan <zilin@seu.edu.cn>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DH3WUNOUPUIQ2JB52T33UGQAATECIBSS/>
Archived-At: 
 <https://lore.freedesktop.org/20260605020752.1707562-1-dawei.feng@seu.edu.cn/>
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
state. Also clear the original 'blob' pointer after releasing it so the
final nvkm_firmware_put() remains balanced after a failed bootloader
reload.

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
 drivers/gpu/drm/nouveau/nvkm/falcon/fw.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/falcon/fw.c b/drivers/gpu/drm/nouveau/nvkm/falcon/fw.c
index 4e8b3f1c7e25..71f55c5b0837 100644
--- a/drivers/gpu/drm/nouveau/nvkm/falcon/fw.c
+++ b/drivers/gpu/drm/nouveau/nvkm/falcon/fw.c
@@ -278,10 +278,11 @@ nvkm_falcon_fw_ctor_hs(const struct nvkm_falcon_fw_func *func, const char *name,
 
 	if (bl) {
 		nvkm_firmware_put(blob);
+		blob = NULL;
 
 		ret = nvkm_firmware_load_name(subdev, bl, "", ver, &blob);
 		if (ret)
-			return ret;
+			goto done;
 
 		hdr = nvfw_bin_hdr(subdev, blob->data);
 		desc = nvfw_bl_desc(subdev, blob->data + hdr->header_offset);
-- 
2.34.1

