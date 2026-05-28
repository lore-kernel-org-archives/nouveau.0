Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA7ACD5BD5
	for <nouveau@archiver.kernel.org>; Thu, 28 May 2026 19:29:23 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6036210F5DF;
	Thu, 28 May 2026 19:29:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="iCQ4F+Fq";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 039FC46613;
	Thu, 28 May 2026 19:15:54 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1779995753;
 b=SRO5a6xIhPwOgm1PlZx3pv1U1k4ywpAMXFFCNMbtDFefw8ZAqZ6er3riec6onmMjyPFax
 bqgHK/n9BfHsFSNb2kejX9iIJzCU73OOUMWAwsq03dBdxwKB45LjDkU5n3rZ+d5o0oIfSpP
 ABrMOAcVIgSFKzR++eXkRX2UP9JbqK+qsc/nQIFvFxepZCT3uZ4UQ1OkF6M2+yRa7CBksah
 lQfYU3xd2/2TmEV2R/G7REXZ2Kq1YDf0r890c3LCiXva86l0sZSIDcebuVQf5HWXerHE2/8
 OsWAVQrpJ7aS6ayveWj9x2uOK9Xo9D0cS6r7aMJe7JFXgQ4w6wcbqRoO3kDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1779995753; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=/ZFeRDQvdk0/n+ezRcNVkmugoUqzLVYJWcPybXvPKog=;
 b=Z3HyVjkgf9ymUTukP3f88vHe1usB2s/HJhjv6J8iBVt+YvtzjKWdhyI5oImnMYWhFkdZm
 swG6iHK1O/f0+ZETIpYvOoO4cQavbkmAZ+rWIQGfqiIrWe++wbUpNW43X2rUOapIhHMoRCr
 e7l2L83FCnSktPXV+gHLDm9dKWiMFU7Uw6/+a/3FxEdAj3XEt7caNvultun5B+fCd5X1IwP
 ppL6ViKQUJokMF8Lbn1VEe3ovTXc/hCuHxJISW5cqvVlhtfs8YUZnZV4oeDusdHO55tPNnp
 7R8aLtgZ29rKKMUseTZ13BvrmNPhNyuPgbwAKV7Aao0s1/rUZ+c38aJs3ceA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=redhat.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=redhat.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 623F5401C5
	for <nouveau@lists.freedesktop.org>; Thu, 28 May 2026 19:15:51 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7E9FE10F5D4
	for <nouveau@lists.freedesktop.org>; Thu, 28 May 2026 19:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779996559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/ZFeRDQvdk0/n+ezRcNVkmugoUqzLVYJWcPybXvPKog=;
	b=iCQ4F+Fq/LLACb4yiE++E6CMVje62svmpC9mhbaDqpbaYhOcnAZGNoEvvWgr3OlGER1rLj
	uCeZqkCazq8d5zeE43aXybz6MsT6DSN4NynYnUxh+GxLxYa8u+DoFd59IgKU2SaSPSCH9o
	VBpyEov9fzC3rrVMrbH8g8HnqdCcKVY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-367-DRlzfwcQMhmCbgVmtlPQfg-1; Thu,
 28 May 2026 15:29:09 -0400
X-MC-Unique: DRlzfwcQMhmCbgVmtlPQfg-1
X-Mimecast-MFC-AGG-ID: DRlzfwcQMhmCbgVmtlPQfg_1779996547
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 343FB1800343;
	Thu, 28 May 2026 19:29:07 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.89.248])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 1F9B519560A3;
	Thu, 28 May 2026 19:29:05 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	Timur Tabi <ttabi@nvidia.com>,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] Revert "nouveau/gsp/rm: cleanup IS_ERR_OR_NULL in core
 implementation"
Date: Thu, 28 May 2026 15:27:16 -0400
Message-ID: <20260528192847.4077458-3-lyude@redhat.com>
In-Reply-To: <20260528192847.4077458-1-lyude@redhat.com>
References: <20260528192847.4077458-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: T5ZMsSgjePg1kzbIFAHkDDDmqhKek4GrYQpS19aHXGk_1779996547
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: SMJ33LY64TIHRL2HS3MRMMAKONINQ7KU
X-Message-ID-Hash: SMJ33LY64TIHRL2HS3MRMMAKONINQ7KU
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Dave Airlie <airlied@redhat.com>, Qianfeng Rong <rongqianfeng@vivo.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kees Cook <kees@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Hongling Zeng <zenghongling@kylinos.cn>,
 Danilo Krummrich <dakr@kernel.org>, Zhi Wang <zhiw@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/SMJ33LY64TIHRL2HS3MRMMAKONINQ7KU/>
Archived-At: 
 <https://lore.freedesktop.org/20260528192847.4077458-3-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This is probably too risky, see the discussion here:

  https://lists.freedesktop.org/archives/dri-devel/2026-May/570353.html

This reverts commit 67346c90ce275e835e93a4a13041afee47bd3f9e.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/alloc.c | 4 ++--
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/alloc.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/alloc.c
index 27f275d2e1510..46e3a29f2ad7f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/alloc.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/alloc.c
@@ -35,7 +35,7 @@ r535_gsp_rpc_rm_free(struct nvkm_gsp_object *object)
 		   client->object.handle, object->handle);
 
 	rpc = nvkm_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_FREE, sizeof(*rpc));
-	if (WARN_ON(IS_ERR(rpc)))
+	if (WARN_ON(IS_ERR_OR_NULL(rpc)))
 		return -EIO;
 
 	rpc->params.hRoot = client->object.handle;
@@ -60,7 +60,7 @@ r535_gsp_rpc_rm_alloc_push(struct nvkm_gsp_object *object, void *params)
 	void *ret = NULL;
 
 	rpc = nvkm_gsp_rpc_push(gsp, rpc, NVKM_GSP_RPC_REPLY_RECV, sizeof(*rpc));
-	if (IS_ERR(rpc))
+	if (IS_ERR_OR_NULL(rpc))
 		return rpc;
 
 	if (rpc->status) {
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
index 41301f19729cf..3ca3de8f43408 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
@@ -324,7 +324,7 @@ r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *retries)
 		u32 size;
 
 		rpc = r535_gsp_msgq_peek(gsp, sizeof(*rpc), info.retries);
-		if (IS_ERR(rpc)) {
+		if (IS_ERR_OR_NULL(rpc)) {
 			kvfree(buf);
 			return rpc;
 		}
@@ -333,7 +333,7 @@ r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *retries)
 		info.continuation = true;
 
 		rpc = r535_gsp_msgq_recv_one_elem(gsp, &info);
-		if (IS_ERR(rpc)) {
+		if (IS_ERR_OR_NULL(rpc)) {
 			kvfree(buf);
 			return rpc;
 		}
-- 
2.54.0

