Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0B8C88E7F
	for <nouveau@archiver.kernel.org>; Wed, 16 Sep 2026 18:10:33 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 69F7F10ED3E;
	Wed, 16 Sep 2026 18:10:33 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CEBE048106;
	Wed, 16 Sep 2026 17:52:57 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789581177;
 b=lkZD5DiuRGsH2cKCMGEtZ82VMzFXWfAxEDg3hUXpSZrunkJt5TtQ6MUHY7sjwKaSXRTqM
 6WAgAlc6y8FfabKpt3FmJf7ai8tgh96oVmn6lWrw/nwYizp0UWwgUgpX9/Ai96WDnCIeEyP
 EAfDrqsySuUb8ln8BY9GgacGv94BTu/uKczrj/WS3nObWV4j5OTlvtJkiApKKsK6xqXLM9j
 5uvwoMmazJx+JmMrX9majXgfv3amsQ54D3c736++us5DlTM6s0aswM8jepD9q/EEZ+IUOTC
 GTpofKG5oqDI9v/mPs+xXzhTvZtRXWeQkkT+lYWxffUOZfLM+VsPU3ddbdyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789581177; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=v9kOhDroVQb5w6d5XlgV/Bry2JCViNrWumkW/bvPL00=;
 b=h49CTJmzbwAkXO4ykxCpvpO9kVlLIa4lsfcRQQ4ohMK8XgYd8LxjWa9Q/HZR6ALMdjYWp
 le1XUrBo1RMA8yQfHVlbNppqsO1RDxYBF7PZOi5EkDdwMU7Z/urOsZzFF5gyceprm0BT5b/
 5GCQ0ZXo4olfdEzIeeRWPkxbQAIk6H1e8TVKaOTgFp9KzSHfpGSkT16lX4bFpFjLyB2EN8S
 fKf28KZQSj0EsDPpWYw2jTMnY4aZ2zvYt7Uz62vfNkK4+1auVVCJdUswFIOVnqiksyPMGHj
 E+oFr6sJ+TjmI/YxSZNVjG2i9bvUEbCyqE2kXnN4a8U4nuAV4y4E5k/U9mgQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 782F648102
	for <nouveau@lists.freedesktop.org>; Wed, 16 Sep 2026 17:52:54 +0000 (UTC)
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6C5D510ED31
	for <nouveau@lists.freedesktop.org>; Wed, 16 Sep 2026 18:10:29 +0000 (UTC)
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowACXAz622apqvB1vCA--.23380S2;
	Thu, 17 Sep 2026 02:02:30 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: airlied@gmail.com
Subject: [PATCH] drm/nouveau: Fix gem reference leak in validate_init()
Date: Wed, 16 Sep 2026 18:02:02 +0000
Message-Id: <20260916180202.2090231-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACXAz622apqvB1vCA--.23380S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ar17Kw4rGFyfuFy3Gr1DGFg_yoW8Gr4rpr
	ZFkF1jyrWUGw4xKr4xtF1DA3Wakan2gry8GF9ay34agr4fAr1UXrW5Cw1YvrWayF4fC3ya
	qrnrtasFqryYyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9v14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
	WxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7
	v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF
	7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026x
	CaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_
	JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r
	1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0
	rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x0267AKxVWxJr
	0_GcJvcSsGvfC2KfnxnUUI43ZEXa7VU1VHq7UUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgUMA2qqok97cAAAsq
Message-ID-Hash: GIR36F3JYV7HMYPE5HB57ZNTXLH3TAWE
X-Message-ID-Hash: GIR36F3JYV7HMYPE5HB57ZNTXLH3TAWE
X-MailFrom: vulab@iscas.ac.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: bskeggs@redhat.com, dakr@kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, nouveau@lists.freedesktop.org, simona@ffwll.ch,
 Wentao Liang <vulab@iscas.ac.cn>, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GIR36F3JYV7HMYPE5HB57ZNTXLH3TAWE/>
Archived-At: 
 <https://lore.freedesktop.org/20260916180202.2090231-1-vulab@iscas.ac.cn/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On the ttm_bo_reserve() failure and "vma not found" error paths, the
loop breaks without adding the looked-up object to any validate list,
so the reference taken by drm_gem_object_lookup() is never released;
validate_fini() only walks the spliced lists.  Drop the reference
before breaking out on both paths.

Fixes: 19ca10d82e33bcfe ("drm/nouveau/gem: lookup VMAs for buffers referenced by pushbuf ioctl")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/gpu/drm/nouveau/nouveau_gem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 20dba02d6175..c2601b559947 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -513,6 +513,7 @@ validate_init(struct nouveau_channel *chan, struct drm_file *file_priv,
 			if (unlikely(ret)) {
 				if (ret != -ERESTARTSYS)
 					NV_PRINTK(err, cli, "fail reserve\n");
+				drm_gem_object_put(gem);
 				break;
 			}
 		}
@@ -522,6 +523,7 @@ validate_init(struct nouveau_channel *chan, struct drm_file *file_priv,
 			struct nouveau_vma *vma = nouveau_vma_find(nvbo, vmm);
 			if (!vma) {
 				NV_PRINTK(err, cli, "vma not found!\n");
+				drm_gem_object_put(gem);
 				ret = -EINVAL;
 				break;
 			}
-- 
2.34.1

