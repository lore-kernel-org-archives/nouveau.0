Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87CF2C43602
	for <nouveau@archiver.kernel.org>; Sun, 28 Jun 2026 14:32:56 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 19C4410E618;
	Sun, 28 Jun 2026 14:32:56 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5BAA046D3E;
	Sun, 28 Jun 2026 14:18:18 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782656298;
 b=Hoteon+6fee3FboDOfTmdmwXwJLBdf0xFnbNQF0ZZBt33q+iDuiJY7RmicrW/+NV2XAGb
 +LBnjX92cZ6ycX2PN7PFSB9QfRRKfSk04DnmuhBjnRy992UNc0GfsJ6Et9ZZOWJVD96P1r3
 DFAPaGxblLzhCEUExwCHLzkNG9AVKhb6G+LnaClGX0geOvM12oxMmjSoCos/vnTDCLKVUKU
 3mS1JZonInAG6NtMI2i4aeO0zJr1mTW8S47s/ck5cWrYMObwe6mV2E8LNs+9sMIpHkBBk7m
 5/jW2F0ERUZPgzCOa9OlmPHB4/oDgAPnHphJxsgB5BlrTTA4iioCHvgG4pmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782656298; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Xf6q3DbzaEZgeOxGfhDSFdqjLiODFiOuvbV8izusmEc=;
 b=zcwVT+fwd6RK5fcYotsDIOjqevMP40F5m6+qG3q1hEOsHxX5MQ7KhSe+59yvjwHy48aky
 5MLIexw4yZik7Ytyr7j92szqsmFRCi6eBjSWYJcYiAYRzUy39Sv19I5GJtCu4EKwLUKJtpC
 Ku3oVPvJ8LVFewsmCRZrsh7Y2pGimQ/FE2oGuf8lInWjGedeq0UMgtNS1TnPyC+IjB78Bdg
 jNT3MsFcLAZJKnt3jS/YiW/ca9ZOWx5vAfV5WAfJ2XLe+eea5NArG08ezehsihmFN5NNjNO
 Te6jf8mLyUkPeYQHrkRyvtK4lH/H99FjJ6MAScofFGGTXWWf7GjhWNOPZg4w==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id B1B6B460FA
	for <nouveau@lists.freedesktop.org>; Sun, 28 Jun 2026 14:18:14 +0000 (UTC)
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9036610E610;
	Sun, 28 Jun 2026 14:32:51 +0000 (UTC)
Received: from localhost.localdomain (unknown [117.182.74.7])
	by APP-05 (Coremail) with SMTP id zQCowABn8QSKMEFq8JXIFQ--.34453S2;
	Sun, 28 Jun 2026 22:32:45 +0800 (CST)
From: WenTao Liang <vulab@iscas.ac.cn>
To: lyude@redhat.com,
	dakr@kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch
Subject: [PATCH v2] drm/nouveau: fix GEM refcount leak in validate_init error
 paths
Date: Sun, 28 Jun 2026 22:28:21 +0800
Message-Id: <20260628142821.47290-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowABn8QSKMEFq8JXIFQ--.34453S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cw43XFyUGF4kJw1UWrWfKrg_yoW8XrWrpF
	ZxKr1jvrWUta17Krs2yF1DA3WS9a1vgFWxGFySy34Sgr1rJFy7Xry5Gw15XrWSyF4xC3yY
	qwnrtas2qFyYy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdYxBIda
	VFxhVjvjDU0xZFpf9x0JUQZ2fUUUUU=
X-Originating-IP: [117.182.74.7]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwcMA2pBLUUEtwAAs-
Message-ID-Hash: PNLSBIIGKEITXE5JWSFCZ2RG24LM5KXI
X-Message-ID-Hash: PNLSBIIGKEITXE5JWSFCZ2RG24LM5KXI
X-MailFrom: vulab@iscas.ac.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, WenTao Liang <vulab@iscas.ac.cn>,
 Greg KH <gregkh@linuxfoundation.org>, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PNLSBIIGKEITXE5JWSFCZ2RG24LM5KXI/>
Archived-At: 
 <https://lore.freedesktop.org/20260628142821.47290-1-vulab@iscas.ac.cn/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

drm_gem_object_lookup acquires a GEM object reference at the start of
each loop iteration. Two break paths (ttm_bo_reserve failure non-EDEADLK
and "vma not found") exit the loop without adding the gem to any cleanup
list and without calling drm_gem_object_put, causing a GEM object
reference leak.

Suggested-by: Greg KH <gregkh@linuxfoundation.org>
Fixes: 9242829a87e9 ("drm/nouveau: Keep only a single list for validation.")
Fixes: 19ca10d82e33 ("drm/nouveau/gem: lookup VMAs for buffers referenced by pushbuf ioctl")
Cc: stable@vger.kernel.org
Signed-off-by: WenTao Liang <vulab@iscas.ac.cn>
---
Changes in v2:
- Fix patch format based on reviewer feedback
---
 drivers/gpu/drm/nouveau/nouveau_gem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 20dba02d6175..c654256f4081 100644
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
@@ -523,6 +524,7 @@ validate_init(struct nouveau_channel *chan, struct drm_file *file_priv,
 			if (!vma) {
 				NV_PRINTK(err, cli, "vma not found!\n");
 				ret = -EINVAL;
+				drm_gem_object_put(gem);
 				break;
 			}
 
-- 
2.39.5 (Apple Git-154)

