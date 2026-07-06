Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1118DC43458
	for <nouveau@archiver.kernel.org>; Mon,  6 Jul 2026 16:45:05 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D3B2510E9EE;
	Mon,  6 Jul 2026 16:45:04 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2FDFC46EF1;
	Mon,  6 Jul 2026 16:30:09 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783355409;
 b=SMNVfqFrJrSCx2g3x2EJGU5p/uZWjURJ17OrhF1WBSyK+DSlE/xrgHwYQ2Oi8hK7bpL0R
 lBYG7z/MzBNksxn/Pm1E4GUkuaG3bcSNRgX2xRSmIvl3mmz6hgMiU/yEFkvf52sv2h1bIJH
 /5z43nTPSrXt61p5URTtChnNiOlyVcs9TpNqMM1GeBON9XRLq5VPsEkgddp6Mtpf4EJKHYn
 7VYRz0e5Itr070/X89k1xta/nvmgRz944RLTReTME0vZQLfXn3eKOFSdvPz4WGCe8zAyRGH
 c+mymoEGMmN9OaNM4Vh4NL/5eHLXMLXiFXHS5u8nAStDUPbFngKvDh7y1UsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783355409; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=XvlCjo+UNIMErfBCHlET/DeDlJtR1WPBsq2dlpYfVB8=;
 b=WXE7NglcSoSoaIZI2iLGdI5udLl48Af2lzebJyFzHarlzVsJbE+tiT0s+KqkroJm1Xtbw
 +jHhqW9uWSDJTm7iiOve6UDfkp/iQOYlVHGrFCJmWc83wpF9RnODgkvU7y2xGnnXqU2m2hU
 f3z7+H6Vn1q+ZFJ7iFkK7BWdqQ6smlvYM3bMEW4MXVh6YunRiBaagIU/F2ir3Zkozu04wN3
 uHoFDp0W4oV86mzAsJUBPdNVFKktv9iERO3dm4HmTn/pkaGc2ziqKh/CeTu0yIa5yBOhG5j
 +O0JoPG/KkFp9ALoWBemUKVh3wWACJ3DiYgiXSjDcGe4/rEeEqwJHGOhMWNQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id D7E8C45DA1
	for <nouveau@lists.freedesktop.org>; Mon,  6 Jul 2026 09:29:33 +0000 (UTC)
X-Greylist: delayed 325 seconds by postgrey-1.36 at gabe;
 Mon, 06 Jul 2026 09:44:28 UTC
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3E56C10E84E
	for <nouveau@lists.freedesktop.org>; Mon,  6 Jul 2026 09:44:28 +0000 (UTC)
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-01 (Coremail) with SMTP id qwCowADnitOxd0tqha3xBA--.35434S2;
	Mon, 06 Jul 2026 17:38:57 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Lyude Paul <lyude@redhat.com>
Subject: [PATCH] drm/nouveau: validate legacy BIT table bounds
Date: Mon,  6 Jul 2026 17:38:56 +0800
Message-ID: <20260706093856.81984-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowADnitOxd0tqha3xBA--.35434S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF45Xw4xWFy3GF4DZrW5KFg_yoW8ZrWfpF
	W7WFyqyr4Fyr4Sgr4Iyr4YyFyrZw4kWrZrGFy7Kr1Yqrn3t3W8K3W8Ar1Yg345JryUurWY
	yFn8Ka4UWF4UJw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9I14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr
	1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
	6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJb
	IYCTnIWIevJa73UjIFyTuYvjfU5byZUUUUU
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-MailFrom: pengpeng@iscas.ac.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: SGYQP64A6ATEOPSJ34APRA7F3WJYCLUS
X-Message-ID-Hash: SGYQP64A6ATEOPSJ34APRA7F3WJYCLUS
X-Mailman-Approved-At: Mon, 06 Jul 2026 16:30:07 +0000
CC: Pengpeng Hou <pengpeng@iscas.ac.cn>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/SGYQP64A6ATEOPSJ34APRA7F3WJYCLUS/>
Archived-At: 
 <https://lore.freedesktop.org/20260706093856.81984-1-pengpeng@iscas.ac.cn/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The legacy BIT parser finds the BIT signature and then reads the entry
size, entry count and entry array directly from the VBIOS image. The
signature only proves that the magic bytes are present. It does not prove
that the fixed BIT header, every directory entry, or the referenced table
range fits inside the VBIOS image.

Validate the BIT header, entry array and referenced table ranges before
returning a legacy BIT entry to the individual table parsers.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/gpu/drm/nouveau/nouveau_bios.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
index 38032bb95826..93b035905ca2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
@@ -972,24 +972,39 @@ bit_table(struct drm_device *dev, u8 id, struct bit_entry *bit)
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nvbios *bios = &drm->vbios;
-	u8 entries, *entry;
+	u32 entry_size, entries, offset;
+	u8 *entry;
 
 	if (bios->type != NVBIOS_BIT)
 		return -ENODEV;
 
+	if (bios->offset > bios->length || bios->length - bios->offset < 12)
+		return -EINVAL;
+
+	entry_size = bios->data[bios->offset + 9];
 	entries = bios->data[bios->offset + 10];
-	entry   = &bios->data[bios->offset + 12];
+	if (entry_size < 6 ||
+	    entries > (bios->length - bios->offset - 12) / entry_size)
+		return -EINVAL;
+
+	entry = &bios->data[bios->offset + 12];
 	while (entries--) {
 		if (entry[0] == id) {
 			bit->id = entry[0];
 			bit->version = entry[1];
 			bit->length = ROM16(entry[2]);
 			bit->offset = ROM16(entry[4]);
+
+			offset = bit->offset;
+			if (offset > bios->length ||
+			    bit->length > bios->length - offset)
+				return -EINVAL;
+
 			bit->data = ROMPTR(dev, entry[4]);
 			return 0;
 		}
 
-		entry += bios->data[bios->offset + 9];
+		entry += entry_size;
 	}
 
 	return -ENOENT;
-- 
2.43.0

