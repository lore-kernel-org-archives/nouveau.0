Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61AC7F436BC
	for <nouveau@archiver.kernel.org>; Sat, 18 Apr 2026 07:20:54 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C1BD110E309;
	Sat, 18 Apr 2026 07:20:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="V5rT1sNt";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4411045A3E;
	Sat, 18 Apr 2026 07:08:53 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1776496133;
 b=Z18Vo7dFPcxXexDl9atSCjx5DesjjzXT0jcrOgBslb/oyN5nEyu5EzEDw/JooGEggRLpQ
 Lnc0LN3e+gyRXIxdtyxooFf5xYUf/HSlwfI5W0ZFC4TcLd1YpPiPbBD5QitcMzrJg12+3N8
 ECjEx0yIk8DmE+x6NfzJz6H6m+4Biak3blneyJrF5cdJo+wPf0TnnrRiUJcj+AZgGkjRxKY
 LDQ1hfybZkvHbHkCPosnniqmJJCF4pFqAUSFza+v6hJrYjKEpO2WenOfTZh91ArR1avIl7z
 6Q++Au75T4ZrbKakF3fzYieEE96MH/+ocCLipxVVSaj0L+8QYR2Hrb/nb/tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1776496133; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Js94wbc4pDN53oPKaEyr9Z/xYgd7eeyMz4Yr23dqCSM=;
 b=z39P03HifdfKnzTt4dylUI8xwzWmY72PxeGHgdDDTXmjfcLtN3dNPt5cXgyMVNKOGQBAc
 E2Coc72x7a/ilzAYJwdidGyiTYcpTRvO3q7zl4QqamgWVO/seN+w/jCuzZ0vc7olosswEap
 0DRf6YmkQpt4Ent7k91nTy2BC6og76VUcckB9hmWgynWlg/Vcy+4srwmLPatSqAvQVtJvof
 nVL67vuGcbvP2lzfEIPIAo6VD1FKjUJUE0H/KQHlQSmGRvFeO55REnhmZJfJBui+M581XL4
 86Yv7jdpU8XT5ZoPITTJ+C2LLQlWkwUHrrqhEvu0T+7mnmWdChwb3r/z1s9Q==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=linux.dev;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=linux.dev policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=linux.dev;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=linux.dev policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 30B1D44DDF
	for <nouveau@lists.freedesktop.org>; Sat, 18 Apr 2026 07:08:49 +0000 (UTC)
X-Greylist: delayed 321 seconds by postgrey-1.36 at gabe;
 Sat, 18 Apr 2026 07:20:47 UTC
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com
 [95.215.58.172])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B4FA910E300
	for <nouveau@lists.freedesktop.org>; Sat, 18 Apr 2026 07:20:47 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776496514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Js94wbc4pDN53oPKaEyr9Z/xYgd7eeyMz4Yr23dqCSM=;
	b=V5rT1sNtYq39uWtlNmRaLQvaNfkD0N8WwuMXIQX6FCbbsCVkbC8neQ5FGWp5btlJBHWr5V
	SCcHuvnn+eSgLjm5CHDN1UZCIRalfwNePFJwNdDY75ws053wG4uv7rB5pa0NRuIFAN0dVm
	siHy633Z3M0GRNtz+B7QXXDmaCLKbRU=
From: sunliming@linux.dev
To: lyude@redhat.com,
	dakr@kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch
Subject: [PATCH] drm/nouveau/gsp:  Fix possible NULL pointer dereference
 warning in r535_dmac_alloc
Date: Sat, 18 Apr 2026 15:14:12 +0800
Message-Id: <20260418071412.86022-1-sunliming@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Message-ID-Hash: 76PUJJ2VKAHWW56TA5OLMWMOSEXPJPNH
X-Message-ID-Hash: 76PUJJ2VKAHWW56TA5OLMWMOSEXPJPNH
X-MailFrom: sunliming@linux.dev
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, sunliming <sunliming@kylinos.cn>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/76PUJJ2VKAHWW56TA5OLMWMOSEXPJPNH/>
Archived-At: 
 <https://lore.freedesktop.org/20260418071412.86022-1-sunliming@linux.dev/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: sunliming <sunliming@kylinos.cn>

Fix below smatch warnings:
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c:178 r535_dmac_alloc()
warn: 'args' can also be NULL

Signed-off-by: sunliming <sunliming@kylinos.cn>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
index 6e63df816d85..6dec2623d0be 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
@@ -172,6 +172,8 @@ r535_dmac_alloc(struct nvkm_disp *disp, u32 oclass, int inst, u32 put_offset,
 
 	args = nvkm_gsp_rm_alloc_get(&disp->rm.object, (oclass << 16) | inst, oclass,
 				     sizeof(*args), dmac);
+	if (!args)
+		return -ENOMEM;
 	if (IS_ERR(args))
 		return PTR_ERR(args);
 
-- 
2.25.1

