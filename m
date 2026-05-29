Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01EE6CD5BD2
	for <nouveau@archiver.kernel.org>; Fri, 29 May 2026 04:43:55 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C6C2210F89A;
	Fri, 29 May 2026 04:43:51 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 89D4246698;
	Fri, 29 May 2026 04:30:21 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1780029021;
 b=c/nGimA/1htZHWihrMrp/mY+9xiSkgwML64wOvSoWoGqtolaOsOs5ZNY0kX/318CQ+otN
 XKL4mdx2oQdlQYTdAGuTDoxuF4Q3DOj1arhmYEHvuiWFjIycXeT9VZL+sqvrp7aqMuPr5YO
 BojLuMDi3RAUItWc0lZGotibNuazgnzvdeK/oOUYVvCpHpOdAJfKqfyO6n1mAWLwOfaDZuc
 VVvE+BANoOa2570cC+p6JWQUkQxMUbJnyxHn3EQjK8LHGylWrJn7RJlNWXU1S7Tkdo+yO7W
 e0+ksDQJY50FbkBJDU6LFjQYMO9ycWOxSuqny8h2/NCoiKj2k3uvvsXOvIyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1780029021; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=wMCECg+7lmJ/y/zrcGbULB0SOkhp96umLGI2wP36yiA=;
 b=zszibqz31jTRwAEDKdK9rbWd1QKbAjkpyfU/GG4zRNCG+3gqhGNfJrWINtRxLU7nONdhv
 xQl9cMjYpCrB41pvfqoiZgi+jsYv+7opHR5ky28Doi8FnAg5ngXcoJXMT9Qhf2FmIwaUA4x
 SqLgPkRbQhFJyVCp4iaMHXtSN5a5e9OXNu13whFsRIC7Qwg8WTEa4zTF1GjzSa7+tp2zuz9
 Jjboh2gi0YMUvmd6wYCEUjbloCywnVbAFmNkmcKM+S1mwsupX3z0XWJ48z/oVosQ8Z3ClOS
 cO76dYUIRWb069+LwqssJu9GXgwPpzC1A8YC2t0vZmvJswRUtbGEKH8kxnZQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 8619D46598
	for <nouveau@lists.freedesktop.org>; Fri, 29 May 2026 04:30:16 +0000 (UTC)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D318A10F87A;
	Fri, 29 May 2026 04:43:45 +0000 (UTC)
X-UUID: f5c118b05b1811f1aa26b74ffac11d73-20260529
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:4ab03f95-bbf8-4c5c-b48d-6121e5722e24,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:495d1e66de495f95137701a21807ed2f,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|865|898,TC:nil,Content:0|1
	5|50,EDM:2,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:
	0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f5c118b05b1811f1aa26b74ffac11d73-20260529
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 982248316; Fri, 29 May 2026 12:43:38 +0800
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
Subject: [PATCH 2/7] nouveau/gsp: Add documentation for RPC functions return
  values
Date: Fri, 29 May 2026 12:43:25 +0800
Message-Id: <20260529044330.96832-3-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260529044330.96832-1-zenghongling@kylinos.cn>
References: <20260529044330.96832-1-zenghongling@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OMGZR27QORAF4ZKQWWX4TGJ7BQY2XVCD
X-Message-ID-Hash: OMGZR27QORAF4ZKQWWX4TGJ7BQY2XVCD
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/OMGZR27QORAF4ZKQWWX4TGJ7BQY2XVCD/>
Archived-At: 
 <https://lore.freedesktop.org/20260529044330.96832-3-zenghongling@kylinos.cn/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Add kernel-doc comments to document the return value contracts for
GSP RPC functions. This clarifies which functions can return NULL,
error pointers, or both, making the codebase easier to maintain and
preventing future errors.

As per Danilo Krummrich's feedback: "the changes submitted by Hongling
can add the documentation for the places that are touched."

The following functions are documented:
- r535_gsp_cmdq_get(): Returns ERR_PTR on error, never NULL
- r535_gsp_rpc_get(): Returns ERR_PTR on error, never NULL
- r535_gsp_msgq_peek(): Returns ERR_PTR on error, never NULL
- r535_gsp_msgq_recv_one_elem(): Returns ERR_PTR on error, never NULL
- r535_gsp_msgq_recv(): Returns ERR_PTR on error, never NULL (fixed in
  previous patch)
- r535_gsp_msg_recv(): Returns ERR_PTR on error, never NULL (fixed in
  previous patch)

Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
---
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
index ce83a867dd36..9a9ac5e3017e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
@@ -204,6 +204,14 @@ r535_gsp_msgq_get_entry(struct nvkm_gsp *gsp)
  *   The user is responsible for freeing the memory allocated for the GSP
  *   message pages after they have been processed.
  */
+/**
+ * r535_gsp_msgq_peek() - Peek at a GSP message queue element
+ * @gsp: GSP device
+ * @gsp_rpc_len: expected RPC length
+ * @retries: retry counter
+ *
+ * Return: ERR_PTR on error, valid pointer on success, never NULL
+ */
 static void *
 r535_gsp_msgq_peek(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *retries)
 {
@@ -229,6 +237,13 @@ struct r535_gsp_msg_info {
 static void
 r535_gsp_msg_dump(struct nvkm_gsp *gsp, struct nvfw_gsp_rpc *msg, int lvl);
 
+/**
+ * r535_gsp_msgq_recv_one_elem() - Receive one GSP message queue element
+ * @gsp: GSP device
+ * @info: message queue receive information
+ *
+ * Return: ERR_PTR on error, valid pointer on success, never NULL
+ */
 static void *
 r535_gsp_msgq_recv_one_elem(struct nvkm_gsp *gsp,
 			    struct r535_gsp_msg_info *info)
@@ -283,6 +298,14 @@ r535_gsp_msgq_recv_one_elem(struct nvkm_gsp *gsp,
 	return buf;
 }
 
+/**
+ * r535_gsp_msgq_recv() - Receive a complete GSP message from the message queue
+ * @gsp: GSP device
+ * @gsp_rpc_len: expected RPC length
+ * @retries: retry counter
+ *
+ * Return: ERR_PTR on error, valid pointer on success, never NULL
+ */
 static void *
 r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *retries)
 {
@@ -450,6 +473,14 @@ r535_gsp_msg_dump(struct nvkm_gsp *gsp, struct nvfw_gsp_rpc *msg, int lvl)
 	}
 }
 
+/**
+ * r535_gsp_msg_recv() - Receive and validate a GSP RPC message
+ * @gsp: GSP device
+ * @fn: expected function number (0 to skip validation)
+ * @gsp_rpc_len: expected RPC length
+ *
+ * Return: ERR_PTR on error or validation failure, valid pointer on success, never NULL
+ */
 struct nvfw_gsp_rpc *
 r535_gsp_msg_recv(struct nvkm_gsp *gsp, int fn, u32 gsp_rpc_len)
 {
@@ -609,6 +640,14 @@ r535_gsp_rpc_done(struct nvkm_gsp *gsp, void *repv)
 	r535_gsp_msg_done(gsp, rpc);
 }
 
+/**
+ * r535_gsp_rpc_get() - Allocate and initialize a GSP RPC message
+ * @gsp: GSP device
+ * @fn: RPC function number
+ * @payload_size: size of the RPC payload
+ *
+ * Return: ERR_PTR on error, valid pointer on success, never NULL
+ */
 static void *
 r535_gsp_rpc_get(struct nvkm_gsp *gsp, u32 fn, u32 payload_size)
 {
-- 
2.25.1

