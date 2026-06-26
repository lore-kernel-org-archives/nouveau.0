Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 741C8C43327
	for <nouveau@archiver.kernel.org>; Fri, 26 Jun 2026 14:26:47 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 097FD10E3B5;
	Fri, 26 Jun 2026 14:26:47 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id BB22946D19;
	Fri, 26 Jun 2026 14:12:13 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782483133;
 b=c/iZrkCIHfAp/n10KGilEsOtomuehAT0B7FBcaVBhj3YhlmYYQwMC+Ud96pQkbqly49K3
 Qe80WrMn7sNEK99eYrpEBb/aAY+JDBlDIq1DWz+EPKHpY60q9zr+VEL7EBApPRT/TrghOsa
 AX9GhbWZSpvkoMfh7E8yNjW7GiyDvJ2+zOtyxgr54gVGCcxgq6WsGVruXKzT3kqqRN5lAxa
 p7mdjGnLFkCHcYYhcQJw+8Tu07P1J30ORKMXZnTDqwjCgHleNRjBuPOq9NH6stDeW9Ydxvl
 pGtH/HWk+WeYifyn7UYlyOmQG4w3kps7tn2xUtjgYrLHmjhH1jaVzkEhbPig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782483133; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=YLIoc5iXK+K02o942wQ4Bg9F94B3nNEX4zKiY1vjhIA=;
 b=AveR1x/m3A55DuCYszJNdu/mXTVVh7bzb+6DMC2y9o8BkHLQau2Kryn8lD47zUqN5rALl
 liCCejVSpljhwk+CO5HiafUNoLdEwfhpKyPyfy2Kmoi/LBdVKWynK9H2KvdYl0oerS2iNuC
 /f25KWpHjASSKNtDIWkxt5zv40VsE7CPIJY9camvI1GR21xiXXxpDEvp+Qxnk5NFUgt7ZpC
 AnfDf9TMg8pDWW28lrO5Ztx1J92BXKtdUYuMyx0DP9SGWssSiCb6/nFZyZOCoeroXWNhIS3
 7JPKHUcfc6cxl/nk33yjWrTcwdNGkcQMnalLPHBAG5GPYMN9D+Xfaxf/cNbg==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 8A96946CFC
	for <nouveau@lists.freedesktop.org>; Fri, 26 Jun 2026 14:12:09 +0000 (UTC)
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	by gabe.freedesktop.org (Postfix) with ESMTPS id ECA8710E312;
	Fri, 26 Jun 2026 14:26:41 +0000 (UTC)
Received: from localhost.localdomain (unknown [117.182.75.66])
	by APP-01 (Coremail) with SMTP id qwCowAD3mtMajD5qiQ1qAw--.16354S2;
	Fri, 26 Jun 2026 22:26:36 +0800 (CST)
From: WenTao Liang <vulab@iscas.ac.cn>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] fix: drm/nouveau: validate_init: break paths after
 drm_gem_object_lookup   leak GEM reference
Date: Fri, 26 Jun 2026 22:26:31 +0800
Message-Id: <20260626142631.48578-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAD3mtMajD5qiQ1qAw--.16354S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cw43XFyUGF4kJFW8Gw43GFg_yoW8GrWrpF
	ZxKryjvrWUKa17Kr4IyF1DA3WS9a1vgFWxGFySy34S9r1fAF17Xry5Gw15XrWSyFWfC3yY
	qwnrtasaqFyYyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUqeHgUUUUU=
X-Originating-IP: [117.182.75.66]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgEKA2o+h0EOmQABsK
Message-ID-Hash: F7OJCPAEO6NTJVYEZXVKIE4UBP3DYGME
X-Message-ID-Hash: F7OJCPAEO6NTJVYEZXVKIE4UBP3DYGME
X-MailFrom: vulab@iscas.ac.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org,
 WenTao Liang <vulab@iscas.ac.cn>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/F7OJCPAEO6NTJVYEZXVKIE4UBP3DYGME/>
Archived-At: 
 <https://lore.freedesktop.org/20260626142631.48578-1-vulab@iscas.ac.cn/>
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

Cc: stable@vger.kernel.org
Fixes: 9242829a87e9 ("drm/nouveau: Keep only a single list for validation.")
Fixes: 19ca10d82e33 ("drm/nouveau/gem: lookup VMAs for buffers referenced by pushbuf ioctl")
Signed-off-by: WenTao Liang <vulab@iscas.ac.cn>
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

