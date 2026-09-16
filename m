Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA099C982C9
	for <nouveau@archiver.kernel.org>; Wed, 16 Sep 2026 18:07:33 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C3CFC10ED31;
	Wed, 16 Sep 2026 18:07:33 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2E801480F9;
	Wed, 16 Sep 2026 17:49:58 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789580998;
 b=rVTLpWK8gdxmbsPsE8B2V9+fRt2I/vk2ZQ4iKhPvtz/04w7UkNXFjRRTWp5h/OO4r9VTM
 rVH5nrJT3tglC9sFpNdvyg8gyepYxD8YyB0NxMhd0fAZtbON7eDYvcBBJx38Idb1J0DOcwR
 xpOpjipzhXmQM9A8kONNX4LpkUhq+8eXJqN4jLRtz3lpwYn1GfTQg4FPMtDZmTBYvtBD+92
 cm6nFaBi9TujWi81HYZWX6HscBj2YRCTbZoKepFvvtJ6xnU6N275vaqnE2wyz9FIdYEXZNH
 /QEbcPsZB4KwkXjVxYEdvsfQbZonRQPCdc5PizE/INLSBCkfJCltOHMueGBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789580998; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ZtzaRv2D0DYEhcQKgY8/3K6GbAGmubSNL8/zKnKw56I=;
 b=VFtQM/yFCjWisVjndhuoLE4BwR4AeI4mEEQH22fsFEwdoue/e3JTXBRrJ2XTbG3Fu37lD
 oMeUyshVveAd/0O00wo/MGy+QOCtJ4AcsjNvTODlecDjOU3GL2udf4OUH476MUz0HupMcnB
 iQAPgmaP01kAhBJP6Nc+6n4xoI/7ctv6tsWuF9P0BqLUL5riLW3lrXJTChmBA2WeazosFej
 p7uRcozQdXlFtI8ephYF7+XBPeGHqNTBE2Ps0S0zKuLSCn+AcFoRiwZcbEks6uBfZAIrRGD
 74QHONLIpwVmux2CJhe9zySpTFBX7Dg4qK7ns+c7uU6gf8zcDQtIB0rTIiZw==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 8C11C480C5
	for <nouveau@lists.freedesktop.org>; Wed, 16 Sep 2026 17:49:53 +0000 (UTC)
X-Greylist: delayed 378 seconds by postgrey-1.36 at gabe;
 Wed, 16 Sep 2026 18:07:28 UTC
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 77E3010ECAF
	for <nouveau@lists.freedesktop.org>; Wed, 16 Sep 2026 18:07:28 +0000 (UTC)
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowADHMTxg2apqWRdvCA--.23293S2;
	Thu, 17 Sep 2026 02:01:04 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: airlied@gmail.com
Subject: [PATCH] drm/nouveau: Fix bridge reference leak in nv1a_ram_new()
Date: Wed, 16 Sep 2026 18:00:36 +0000
Message-Id: <20260916180036.2090118-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowADHMTxg2apqWRdvCA--.23293S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jry5CryDKrWkAr1DZrykuFg_yoWDXFX_C3
	W5ZFn3Gr10kr1DuFsFyrn3XrZ29wsrZFZ2qwnFq3s3G347Zrs3ur1avr1rXF98JF4FgF98
	Ja1kXr98WrnFgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb-xFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
	4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7Cj
	xVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4I
	kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
	WwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JF
	I_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG
	6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E87Iv6xkF7I0E14v26F4UJV
	W0obIYCTnIWIevJa73UjIFyTuYvjfUw5l8UUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwcMA2qqpVhw0AAAsS
Message-ID-Hash: J4JGFS7OFZOEWQ34M2R5IOBQNMQ4ZXRR
X-Message-ID-Hash: J4JGFS7OFZOEWQ34M2R5IOBQNMQ4ZXRR
X-MailFrom: vulab@iscas.ac.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dakr@kernel.org, dri-devel@lists.freedesktop.org, helgaas@kernel.org,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, nouveau@lists.freedesktop.org, okaya@codeaurora.org,
 simona@ffwll.ch, Wentao Liang <vulab@iscas.ac.cn>, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/J4JGFS7OFZOEWQ34M2R5IOBQNMQ4ZXRR/>
Archived-At: 
 <https://lore.freedesktop.org/20260916180036.2090118-1-vulab@iscas.ac.cn/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

pci_get_domain_bus_and_slot() takes a reference to the PCI device,
which is never released once the memory size has been read from its
config space.  Drop the reference before returning.

Fixes: 2fa6d6cdaf283c05 ("drm/nouveau: deprecate pci_get_bus_and_slot()")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv1a.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv1a.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv1a.c
index 18241c6ba5fa..4d52a158f320 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv1a.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv1a.c
@@ -51,6 +51,8 @@ nv1a_ram_new(struct nvkm_fb *fb, struct nvkm_ram **pram)
 		mib = ((mem >> 4) & 127) + 1;
 	}
 
+	pci_dev_put(bridge);
+
 	return nvkm_ram_new_(&nv04_ram_func, fb, NVKM_RAM_TYPE_STOLEN,
 			     mib * 1024 * 1024, pram);
 }
-- 
2.34.1

