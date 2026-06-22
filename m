Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B3D8CDB475
	for <nouveau@archiver.kernel.org>; Mon, 22 Jun 2026 08:11:53 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6208810E520;
	Mon, 22 Jun 2026 08:11:51 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 81E3B46C35;
	Mon, 22 Jun 2026 07:57:27 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782115047;
 b=jDbSC1crJPffJ7Q8Lisbim0uu1xlg0ua725i9+J3tNDp+K0W2kJrowSj1FaHLhkTP4kI/
 mLiuDt5HCjXdaJOotQ1v9kjFymTGR+D+wgBtAJLjbjHqwfXd1TpvxQ9CnSW4YNPcctOv7sf
 3vQlfq2Vpx99CAZK8b3C5RkDR5b/TZ+NAYKdsx45TzbfG8ZCzgzzwwAecIozYrwbaRp0yjC
 Np/O5GcRMgTYRCs06K3EGK748sRFnRqofji7oHz4787wqQHo7q2MdZE95n2JuG7CHsv40mx
 qclXaZxOLb8vkYx9c7MS7YK65zXlbqZVEMUPVBYbZtfW5WN2IaSN8NADZWhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782115047; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=cRUXyiR038T6IS4/ruOXKGBsoiT3EckCxO1UCg7sZrI=;
 b=hC/jCMrug4V2Ylb39lvPihrxZmmQeD+9bLjtIAJUnWgtDML3yiGkdwqp9RxxJDshVWesC
 NhFUr3zLJYClUly5gJyA6GneclGOdok8y8YxbebnwDew/55RdNEeJ/NaoVaj+e4QDo3Le9C
 OJFguVWyvRHZfYKt2cc3nB7vs6CZDynFs8mxLovWp68sfOr+SNvGysUQ5ZBLJxqtdpOtzgQ
 p0bNG//1YwGVwdP0/wUw5HZxRNN8d65eVOS+SngUQxUa66JcjDfXpS95tEDavst+Smn6sdK
 Kb+maYph/Cto8W0+1N7sgh51UGvPvAVlL7J6mQ2F3a4JwjqT1jf+XBGodEfw==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id D623740AA6
	for <nouveau@lists.freedesktop.org>; Mon, 22 Jun 2026 07:57:24 +0000 (UTC)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BE92110E518;
	Mon, 22 Jun 2026 08:11:47 +0000 (UTC)
X-UUID: fff8b6d86e1111f1aa26b74ffac11d73-20260622
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:5bd37a21-658a-4cde-99c4-f31a6adefd33,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:5f5000d66a81ab37ee1d7ad362603bfd,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fff8b6d86e1111f1aa26b74ffac11d73-20260622
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 979842419; Mon, 22 Jun 2026 16:11:41 +0800
From: Hongling Zeng <zenghongling@kylinos.cn>
To: lyude@redhat.com,
	dakr@kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	airlied@redhat.com,
	ttabi@nvidia.com,
	bskeggs@nvidia.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 0/5] nouveau/gsp: Clean up IS_ERR vs IS_ERR_OR_NULL usage
Date: Mon, 22 Jun 2026 16:11:31 +0800
Message-Id: <20260622081136.61695-1-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: B2T5G76IG4HRPTAEKFY7XSSBEY7XGHOR
X-Message-ID-Hash: B2T5G76IG4HRPTAEKFY7XSSBEY7XGHOR
X-MailFrom: zenghongling@kylinos.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 zhongling0719@126.com, Hongling Zeng <zenghongling@kylinos.cn>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/B2T5G76IG4HRPTAEKFY7XSSBEY7XGHOR/>
Archived-At: 
 <https://lore.freedesktop.org/20260622081136.61695-1-zenghongling@kylinos.cn/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This series addresses feedback from Danilo Krummrich and Timur Tabi
regarding the use of IS_ERR() vs IS_ERR_OR_NULL() in the nouveau
GSP RPC code.

The key insight is that we should align error checking with the actual
return value contracts of each function:
- Functions that never return NULL should use IS_ERR()
- Functions that can return NULL should use IS_ERR_OR_NULL()

This version adds documentation to clarify the return value contracts,
making it easier for maintainers to validate future changes.

Return Value Analysis

After thorough code analysis, the RPC functions are categorized as:

Never return NULL (use IS_ERR):**
- r535_gsp_msgq_peek()
- r535_gsp_msgq_recv_one_elem()
- r535_gsp_rpc_get()

CAN return NULL (use IS_ERR_OR_NULL):**
- r535_gsp_msgq_recv() - returns NULL when RPC length is invalid
- r535_gsp_msg_recv() - returns NULL when queue drained
- r535_gsp_rpc_handle_reply() - returns NULL for NOWAIT/NOSEQ policies
- r535_gsp_rpc_send() - can return NULL via handle_reply
- r535_gsp_rpc_push() - can return NULL via handle_reply

Changes in v2

- Added kernel-doc comments documenting return value contracts for all
  RPC functions
- Cleaned up incorrect IS_ERR_OR_NULL() usage for functions that never
  return NULL
- Kept IS_ERR_OR_NULL() in places where NULL is actually possible
- Added Fixes tags to all patches

Testing

This fixes the NULL pointer dereference oops that occurs during
nouveau initialization on some systems.

Patches

Hongling Zeng (5):
  nouveau/gsp/rpc: Document RPC function return value contracts
  nouveau/gsp/rpc: Cleanup incorrect IS_ERR_OR_NULL in rpc.c
  nouveau/gsp/rm/alloc: Cleanup IS_ERR_OR_NULL usage
  nouveau/gsp/rm/bar: Cleanup IS_ERR_OR_NULL usage
  nouveau/gsp: Cleanup IS_ERR_OR_NULL in nvkm_gsp_rpc_rd()

 drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h   | 2 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/alloc.c | 2 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c  | 2 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c  | 81 ++++++++++++++++++-
 4 files changed, 81 insertions(+), 6 deletions(-)
