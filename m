Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A81E2CD6E56
	for <nouveau@archiver.kernel.org>; Mon,  1 Jun 2026 09:54:24 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9FB7111312E;
	Mon,  1 Jun 2026 09:54:19 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 452D646709;
	Mon,  1 Jun 2026 09:40:42 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1780306842;
 b=C715DOWCQAif55P8jldW+UpV+fgzLSSLgDzctdTwnMsaOpdes7dotRwkT1iTbZuNhPdFk
 PDTIIhJ/5fAbsKp0HFDC4sy/gnCXUVm4eYwLmlKYbmd0vzEB8b87JfiKsqQtH7YR4wOv9F7
 sB1Ac5gi5p7j+wrUFUARcMcQ1/fm63JOiSy8aFhY17pN7bHot6bXG1KRhyOAYpsDMOSyIhA
 ZBSUWCdSI0c9jMNfY7igRyyk8qOmcD76T+EuyiwKx5r/Ro308B2t1KoxSOASLjB+a1HhfEf
 hCa9tJBnytVZFzaBnhC0Zrql3VSY8Y/ed4aNjbsX6plMtnWvCVst6NVOdHRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1780306842; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=irfoIXQfazqnqRwj+vrq/Lvxfgr+21DBPFk6AVIKw6Q=;
 b=D8f8XASt4Zrz5K/IEqBCg5jQn6gIsXIXNVrO4bP5uvEFyyJbv5QMdEjLR0o8cS6q9Rhuz
 NdMq1fgbUuhws5V7M0qpV40hgO+D5wWmlinmW+aX7rQ0XuG0FQZq0Wv6f4a/v5gVuGocpm8
 PJi+pHiXe6gn+8SAzomdpdNsZnm+TYrDW7AiuLJJ6RpW243puGcQp8uytsDQzEcYon6x6gA
 PJncLzTUevHPUH+9yooNFXa90QusMCtXrNNOEMudnokTePTVXAZ5KhkC7+6znZvgeEEfMUo
 hF75QRnwcoFMEt/p1P82OjTL6lZtvdns/sztTYEICrh9BZFX7ngmgYoge9Gg==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 0050D401CA
	for <nouveau@lists.freedesktop.org>; Mon,  1 Jun 2026 09:40:38 +0000 (UTC)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7A77711311C;
	Mon,  1 Jun 2026 09:54:14 +0000 (UTC)
X-UUID: d566ea345d9f11f1aa26b74ffac11d73-20260601
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:7efc5b99-d504-45d8-ba80-1caa6170d656,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:934be5458db68f516b88124068b5d83f,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|136|850|865|898,TC:nil,Content
	:0|15|50,EDM:2,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d566ea345d9f11f1aa26b74ffac11d73-20260601
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 172112090; Mon, 01 Jun 2026 17:54:08 +0800
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
Subject: [PATCH v2 1/5] nouveau/gsp/rpc: Document RPC function return value
  contracts
Date: Mon,  1 Jun 2026 17:53:59 +0800
Message-Id: <20260601095403.228220-2-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260601095403.228220-1-zenghongling@kylinos.cn>
References: <20260601095403.228220-1-zenghongling@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GCICO4JPEBVDX4J4W5KRNCEJQ7I6G4TC
X-Message-ID-Hash: GCICO4JPEBVDX4J4W5KRNCEJQ7I6G4TC
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GCICO4JPEBVDX4J4W5KRNCEJQ7I6G4TC/>
Archived-At: 
 <https://lore.freedesktop.org/20260601095403.228220-2-zenghongling@kylinos.cn/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Add kernel-doc comments to document the return value semantics of
RPC functions in r535/rpc.c. This clarifies which functions can return
NULL, error pointers, or both, helping maintainers validate future
changes.

Return value analysis:
- r535_gsp_msgq_peek(): Never returns NULL
- r535_gsp_msgq_recv_one_elem(): Never returns NULL
- r535_gsp_msgq_recv(): CAN return NULL (when RPC length invalid)
- r535_gsp_msg_recv(): CAN return NULL (queue drained/no matching message)
- r535_gsp_rpc_get(): Never returns NULL
- r535_gsp_rpc_handle_reply(): CAN return NULL (NOWAIT/NOSEQ policies)
- r535_gsp_rpc_send(): CAN return NULL (via handle_reply)
- r535_gsp_rpc_push(): CAN return NULL (via handle_reply)

Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
---
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
index 3ca3de8f4340..7dd43fa38c41 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
@@ -204,6 +204,15 @@ r535_gsp_msgq_get_entry(struct nvkm_gsp *gsp)
  *   The user is responsible for freeing the memory allocated for the GSP
  *   message pages after they have been processed.
  */
+/**
+ * r535_gsp_msgq_peek - Peek at next message in GSP command queue
+ * @gsp: GSP device
+ * @gsp_rpc_len: Expected RPC length
+ * @retries: Retry counter
+ *
+ * Return: Pointer to RPC message on success, or ERR_PTR() on error.
+ *         Never returns NULL.
+ */
 static void *
 r535_gsp_msgq_peek(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *retries)
 {
@@ -229,6 +238,14 @@ struct r535_gsp_msg_info {
 static void
 r535_gsp_msg_dump(struct nvkm_gsp *gsp, struct nvfw_gsp_rpc *msg, int lvl);
 
+/**
+ * r535_gsp_msgq_recv_one_elem - Receive one message element from GSP queue
+ * @gsp: GSP device
+ * @info: Message queue information
+ *
+ * Return: Pointer to received buffer on success, or ERR_PTR() on error.
+ *         Never returns NULL.
+ */
 static void *
 r535_gsp_msgq_recv_one_elem(struct nvkm_gsp *gsp,
 			    struct r535_gsp_msg_info *info)
@@ -283,6 +300,15 @@ r535_gsp_msgq_recv_one_elem(struct nvkm_gsp *gsp,
 	return buf;
 }
 
+/**
+ * r535_gsp_msgq_recv - Receive RPC message(s) from GSP queue
+ * @gsp: GSP device
+ * @gsp_rpc_len: Expected RPC length
+ * @retries: Retry counter
+ *
+ * Return: Pointer to received buffer on success, ERR_PTR() on error,
+ *         or NULL if RPC length is invalid.
+ */
 static void *
 r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *retries)
 {
@@ -450,6 +476,15 @@ r535_gsp_msg_dump(struct nvkm_gsp *gsp, struct nvfw_gsp_rpc *msg, int lvl)
 	}
 }
 
+/**
+ * r535_gsp_msg_recv - Receive RPC message from GSP message queue
+ * @gsp: GSP device
+ * @fn: Expected RPC function number (0 to accept any)
+ * @gsp_rpc_len: Expected RPC length
+ *
+ * Return: Pointer to RPC message on success, ERR_PTR() on error,
+ *         or NULL if queue is drained or no matching message found.
+ */
 struct nvfw_gsp_rpc *
 r535_gsp_msg_recv(struct nvkm_gsp *gsp, int fn, u32 gsp_rpc_len)
 {
@@ -547,6 +582,17 @@ r535_gsp_rpc_poll(struct nvkm_gsp *gsp, u32 fn)
 	return 0;
 }
 
+/**
+ * r535_gsp_rpc_handle_reply - Handle RPC reply based on policy
+ * @gsp: GSP device
+ * @fn: RPC function number
+ * @policy: Reply policy (NOWAIT, NOSEQ, RECV, or POLL)
+ * @gsp_rpc_len: Expected RPC length
+ *
+ * Return: NULL when policy is NOWAIT or NOSEQ (no reply expected),
+ *         pointer to reply data on success, ERR_PTR() on error,
+ *         or NULL if no message available.
+ */
 static void *
 r535_gsp_rpc_handle_reply(struct nvkm_gsp *gsp, u32 fn,
 			  enum nvkm_gsp_rpc_reply_policy policy,
@@ -574,6 +620,16 @@ r535_gsp_rpc_handle_reply(struct nvkm_gsp *gsp, u32 fn,
 	return repv;
 }
 
+/**
+ * r535_gsp_rpc_send - Send RPC message and handle reply
+ * @gsp: GSP device
+ * @payload: RPC payload to send
+ * @policy: Reply policy (NOWAIT, NOSEQ, RECV, or POLL)
+ * @gsp_rpc_len: Expected RPC length for reply
+ *
+ * Return: NULL if policy is NOWAIT/NOSEQ (no reply expected),
+ *         pointer to reply data on success, or ERR_PTR() on error.
+ */
 static void *
 r535_gsp_rpc_send(struct nvkm_gsp *gsp, void *payload,
 		  enum nvkm_gsp_rpc_reply_policy policy, u32 gsp_rpc_len)
@@ -601,6 +657,15 @@ r535_gsp_rpc_send(struct nvkm_gsp *gsp, void *payload,
 	return r535_gsp_rpc_handle_reply(gsp, fn, policy, gsp_rpc_len);
 }
 
+/**
+ * r535_gsp_rpc_get - Allocate and initialize an RPC message
+ * @gsp: GSP device
+ * @fn: RPC function number
+ * @payload_size: Size of the payload
+ *
+ * Return: Pointer to RPC payload data on success, or ERR_PTR() on error.
+ *         Never returns NULL.
+ */
 static void
 r535_gsp_rpc_done(struct nvkm_gsp *gsp, void *repv)
 {
@@ -628,6 +693,16 @@ r535_gsp_rpc_get(struct nvkm_gsp *gsp, u32 fn, u32 payload_size)
 	return rpc->data;
 }
 
+/**
+ * r535_gsp_rpc_push - Push RPC message to GSP and wait for reply
+ * @gsp: GSP device
+ * @payload: RPC payload to send
+ * @policy: Reply policy (NOWAIT, NOSEQ, RECV, or POLL)
+ * @gsp_rpc_len: Expected RPC length in the reply
+ *
+ * Return: NULL when policy is NOWAIT/NOSEQ (no reply expected),
+ *         pointer to reply data on success, or ERR_PTR() on error.
+ */
 static void *
 r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *payload,
 		  enum nvkm_gsp_rpc_reply_policy policy, u32 gsp_rpc_len)
-- 
2.25.1

