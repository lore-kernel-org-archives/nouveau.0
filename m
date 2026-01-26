Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B0DD19511
	for <nouveau@archiver.kernel.org>; Tue, 27 Jan 2026 02:36:38 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8677A10E19A;
	Tue, 27 Jan 2026 02:36:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="eIYxit/y";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8D46E40ACE;
	Tue, 27 Jan 2026 02:27:37 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769480857;
 b=g3Q0Q4tqm3Oib3YBLBVwz9QVz8ssdy+r7KzU9OfOiRcvF9Qk8RwtQP4UB+1HZ9ZlYLJtn
 9YxoaxpWmhMr4zH1NLzmBIvBPBoNGMzLwy3rs0kzZQ8ibDz9MjvCDSZ7u5ibL0pbBD+G9+5
 6viu67zYOQD3WFC3y/7KQnMZ4qrwsO2dHgdG3c282PNf8pcXOM9HdeTEL/+1AnK0DcvW72w
 //XhyFqkuuzR2SvYTreY1b54CnlAcYHZf/EzTEskx28fSNqLdEOS6A3m9EHWkEJEwm+GC5T
 +XM5CpX0NhIvfzINxzTCTKNpdE9OBQw5fq8Yl8r94zWBIYAlJurKTc5ENXkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769480857; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=8uzYSpMQ1AKqTcHbWZbcyjdl+RkqVx3ltMWWymBf5O0=;
 b=YhnULKy+fickUyWKlNUzMfGAW0cOt1PwguJWOjE/NFcfMfoYJzutU4iQpbqmp3IVfAJ3i
 UXQv1uXlklifmLZU/bMVvhIkD8vW12/Cbh3ZsB7IGYwhQDJWS3TDXxEoyJMcg/KWCauKkzX
 11L89L2BE1OMSZBAnUcDGSfwXd2wqSweWnpPhx/saJgGT4wNhXOfWePClGiORNNMp4PTHAQ
 o49IM/MV4rWVQg7deUJFWBJNkXmYyMXozxD2U5kcR9pHVRAGsdNTJ/oaCvc8UKWCMfSq5+N
 JJMA/Iae/T4DYNhzQBG9tHFbld7u/blEnNU1XKAoyNAvA6ebqzooI9XPaFPg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=seu.edu.cn;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=seu.edu.cn
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=seu.edu.cn;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=seu.edu.cn policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 282514031A
	for <nouveau@lists.freedesktop.org>; Mon, 26 Jan 2026 12:29:01 +0000 (UTC)
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Mon, 26 Jan 2026 12:37:57 UTC
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com
 [101.71.155.101])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF7D10E1D1;
	Mon, 26 Jan 2026 12:37:56 +0000 (UTC)
Received: from LAPTOP-N070L597.localdomain (unknown [223.112.146.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3200b3fcf;
	Mon, 26 Jan 2026 20:32:51 +0800 (GMT+08:00)
From: Zilin Guan <zilin@seu.edu.cn>
To: lyude@redhat.com
Subject: [PATCH] drm/nouveau: Fix memory leak in nouveau_channel_ctor()
Date: Mon, 26 Jan 2026 12:32:48 +0000
Message-Id: <20260126123248.164621-1-zilin@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9bfa4ae47903a1kunm8f0cf292523f
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaT08ZVk4ZQ0NNHUtLSBhJGFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJSUhVSkpJVUpPTVVKTUlZV1kWGg8SFR0UWUFZT0tIVUpLSUhOQ0NVSktLVU
	tZBg++
DKIM-Signature: a=rsa-sha256;
	b=eIYxit/y6p7SWGy1pZggvAgPpjfT1yrX9pCvMl5xLYgipmJ7vVBgm9r5z5PikCiPWeLH0CXgahoKqAWeVepNqmPD2ySRBP1WJDBTK94v4U8omj5s4R19PfHr8Jst+EKMUGJM8L8MhSm0bjGkrrLBUZZhFh+q5WrNIDTVCZz3cXg=;
 s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=8uzYSpMQ1AKqTcHbWZbcyjdl+RkqVx3ltMWWymBf5O0=;
	h=date:mime-version:subject:message-id:from;
X-MailFrom: zilin@seu.edu.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: 3HITCIRJXZTP3YXCWVSNDSNHONCJXJHW
X-Message-ID-Hash: 3HITCIRJXZTP3YXCWVSNDSNHONCJXJHW
X-Mailman-Approved-At: Tue, 27 Jan 2026 02:27:35 +0000
CC: dakr@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org, bskeggs@redhat.com,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jianhao.xu@seu.edu.cn, Zilin Guan <zilin@seu.edu.cn>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3HITCIRJXZTP3YXCWVSNDSNHONCJXJHW/>
Archived-At: 
 <https://lore.freedesktop.org/20260126123248.164621-1-zilin@seu.edu.cn/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

In nouveau_channel_ctor(), nouveau_channel_prep() allocates the channel
structure. If nvif_mem_ctor() fails to allocate the userd memory, the
function returns without freeing the channel, resulting in a memory leak.

Add nouveau_channel_del() to the error path to ensure the allocated
channel is properly freed.

Compile tested only. Issue found using a prototype static analysis tool
and code review.

Fixes: 06db7fded6de ("drm/nouveau/fifo: add new channel classes")
Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
---
 drivers/gpu/drm/nouveau/nouveau_chan.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index b1e92b1f7a26..a421c32fda02 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -322,8 +322,10 @@ nouveau_channel_ctor(struct nouveau_cli *cli, bool priv, u64 runm,
 		ret = nvif_mem_ctor(&cli->mmu, "abi16ChanUSERD", NVIF_CLASS_MEM_GF100,
 				    NVIF_MEM_VRAM | NVIF_MEM_COHERENT | NVIF_MEM_MAPPABLE,
 				    0, PAGE_SIZE, NULL, 0, &chan->mem_userd);
-		if (ret)
+		if (ret) {
+			nouveau_channel_del(pchan);
 			return ret;
+		}
 
 		args->huserd = nvif_handle(&chan->mem_userd.object);
 		args->ouserd = 0;
-- 
2.34.1

