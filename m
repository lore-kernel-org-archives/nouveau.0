Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C64CEC982C9
	for <nouveau@archiver.kernel.org>; Wed, 16 Sep 2026 22:35:29 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8399B10E40C;
	Wed, 16 Sep 2026 22:35:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JLW7QuSt";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 867CE4814E;
	Wed, 16 Sep 2026 22:17:53 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789597073;
 b=BuFiP138ETI4omIHmCJHmPHWeZbwxHXv9HNSSBuvvHgWF1FgoyR0eIAD7l8LQTHh/+7Zt
 WQDjXstGLZicOR3w5Z0gAuTDMsna3N9TONcdwQiS0ROYJrbzYS9lC7UW2ll4/1Gc21l5fOG
 wyeTagAZkdMQ77DGcZP5FOtLEbhHU1knQkHa2ShTmxeHMNPkF2m5CXi9+2wUjYZCWVLUbhQ
 hC4LjFdQ0b0LsMmIFFvOzJ56IyZOC4jD0Hxz0EGJTKDEU5GQ9rF/2OK6z7SCuRVYW4SLqqS
 zCNbWF9SkJP/paCKpNS1CKzvQwu06EkuraC/1MUdccRZp1usKJ8Nxwluq5sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789597073; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=0T27VJXBNT5i27bHtRIevAkS2qzTZDfP50zhtvs5qyw=;
 b=jBs9tkDhUkN3hPVpIkpoeXJJhOFbgSpSc5o0pWyHOzJlFTfUcQJl9pV6b9OsJ6snzsiXD
 andSRK5KUmMLivULPjEWekxMMcHdFYCuAllKiwMUlWoCXWX9Ox3N95mT2bH4k9glc6jTneE
 W3uds73fhqhUytoWvebxy+cqrcJ5QvRASIMnYJRCcI4EsukDljuqO7adI+u8HLI4coBofss
 iy4SvMSg/iB83RTCLwHqPeItVlmNGlLXPcZbpvmvm+qaa3nCExH+6+xmMW7jgWlapBUSuyc
 admfJ496ZjP1/SPyDDT40f4RNeMk9IgZcw+kDAJtQmTNu/9Q67Rsd1OHA3hg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 58FB4480F6
	for <nouveau@lists.freedesktop.org>; Wed, 16 Sep 2026 22:17:51 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 12F4B10E367
	for <nouveau@lists.freedesktop.org>; Wed, 16 Sep 2026 22:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789598126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0T27VJXBNT5i27bHtRIevAkS2qzTZDfP50zhtvs5qyw=;
	b=JLW7QuSt0UzsJ+3xx07UuBWhJwj2n9tA8EzudKWs2MYViXBCL13EqKlNmcf+iDSOab4kk6
	T3HYscweWrqTo9bJzFW+yDBPH8lVaQBmZPDxaDM1Eru9FQKHVhe9lmBIsy6pnIohn/AUea
	A+ArqreXsFRlh3cFokFbLD6+fx4CMDc=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-433-fe96gVYNMZy4aQ5PRckPrQ-1; Wed,
 16 Sep 2026 18:35:22 -0400
X-MC-Unique: fe96gVYNMZy4aQ5PRckPrQ-1
X-Mimecast-MFC-AGG-ID: fe96gVYNMZy4aQ5PRckPrQ_1789598121
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A08C11855890;
	Wed, 16 Sep 2026 22:35:20 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.64.52])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 33F31180036E;
	Wed, 16 Sep 2026 22:35:18 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/5] drm/nouveau/gsp/r535: Add support for
 MEMSYS_GET_STATIC_CONFIG
Date: Wed, 16 Sep 2026 18:25:06 -0400
Message-ID: <20260916223358.507351-3-lyude@redhat.com>
In-Reply-To: <20260916223358.507351-1-lyude@redhat.com>
References: <20260916223358.507351-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: Le3ltVLczHZ6LzSO-sh2jGpvnxG3kFhRyltZj2dTV3s_1789598121
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: JHETRISW7E6Q36I4OEZ2ZTJOQ45DJWRU
X-Message-ID-Hash: JHETRISW7E6Q36I4OEZ2ZTJOQ45DJWRU
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Dave Airlie <airlied@redhat.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kees Cook <kees@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Hongling Zeng <zenghongling@kylinos.cn>,
 Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/JHETRISW7E6Q36I4OEZ2ZTJOQ45DJWRU/>
Archived-At: 
 <https://lore.freedesktop.org/20260916223358.507351-3-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This is a GSP structure describing various characteristics of the memory
management system that GSP provides. Start by fetching it during driver
load, but don't do anything with the information we get from it just yet.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---
V3
* s/nvkm_gsp_rm_ctrl_get()/nvkm_gsp_rm_ctrl_rd()/
V4:
* Remove mistakenly duplicated struct

 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  4 ++
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 17 +++++++
 .../nvkm/subdev/gsp/rm/r535/nvrm/gsp.h        | 45 +++++++++++++++++++
 .../drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c |  8 ++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  1 +
 5 files changed, 75 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index cd10c37053695..ed5c6e0e68d3c 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -156,6 +156,10 @@ struct nvkm_gsp {
 		struct sg_table fbsr;
 	} sr;
 
+	struct {
+		bool use_raw_mode_comptagline_alloc;
+	} memsys;
+
 	struct {
 		struct nvkm_gsp_mem mem;
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index 94925f1590ea4..63aa30f947471 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -1782,6 +1782,23 @@ r535_gsp_fini(struct nvkm_gsp *gsp, enum nvkm_suspend_state suspend)
 	return 0;
 }
 
+int
+r535_gsp_get_static_memsys_info(struct nvkm_gsp *gsp)
+{
+	NV2080_CTRL_INTERNAL_MEMSYS_GET_STATIC_CONFIG_PARAMS *ctrl;
+
+	ctrl = nvkm_gsp_rm_ctrl_rd(&gsp->internal.device.subdevice,
+				    NV2080_CTRL_CMD_INTERNAL_MEMSYS_GET_STATIC_CONFIG,
+				    sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	gsp->memsys.use_raw_mode_comptagline_alloc = ctrl->bUseRawModeComptaglineAllocation;
+
+	nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, ctrl);
+	return 0;
+}
+
 int
 r535_gsp_init(struct nvkm_gsp *gsp)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/gsp.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/gsp.h
index fd1170037c030..fee5418a72a68 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/gsp.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/gsp.h
@@ -789,6 +789,51 @@ typedef struct NV2080_CTRL_INTERNAL_GCX_ENTRY_PREREQUISITE_PARAMS {
     NvBool bIsGCOFFSatisfied;
 } NV2080_CTRL_INTERNAL_GCX_ENTRY_PREREQUISITE_PARAMS;
 
+typedef struct NV2080_CTRL_INTERNAL_MEMSYS_GET_STATIC_CONFIG_PARAMS {
+    /*! Determines if RM should use 1 to 1 Comptagline allocation policy */
+    NvBool bOneToOneComptagLineAllocation;
+
+    /*! Determines if RM should use 1 to 4 Comptagline allocation policy */
+    NvBool bUseOneToFourComptagLineAllocation;
+
+    /*! Determines if RM should use raw Comptagline allocation policy */
+    NvBool bUseRawModeComptaglineAllocation;
+
+    /*! Has COMPBIT_BACKING_SIZE been overridden to zero (i.e. disabled)? */
+    NvBool bDisableCompbitBacking;
+
+    /*! Determine if we need to disable post L2 compression */
+    NvBool bDisablePostL2Compression;
+
+    /*! Is ECC DRAM feature supported? */
+    NvBool bEnabledEccFBPA;
+
+    NvBool bL2PreFill;
+
+    /*! L2 cache size */
+    NV_DECLARE_ALIGNED(NvU64 l2CacheSize, 8);
+
+    /*! Indicate whether fpba is present or not */
+    NvBool bFbpaPresent;
+
+    /*! Size covered by one comptag */
+    NvU32  comprPageSize;
+
+    /*! log32(comprPageSize) */
+    NvU32  comprPageShift;
+
+    /*! RAM type */
+    NvU32  ramType;
+
+    /*! LTC count */
+    NvU32  ltcCount;
+
+    /*! LTS per LTC count */
+    NvU32  ltsPerLtcCount;
+} NV2080_CTRL_INTERNAL_MEMSYS_GET_STATIC_CONFIG_PARAMS;
+
+#define NV2080_CTRL_CMD_INTERNAL_MEMSYS_GET_STATIC_CONFIG        (0x20800a1c) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_INTERNAL_INTERFACE_ID << 8) | NV2080_CTRL_INTERNAL_MEMSYS_GET_STATIC_CONFIG_PARAMS_MESSAGE_ID" */
+
 typedef union rpc_message_rpc_union_field_v03_00
 {
     NvU32      spare;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
index dfda6b0b910a2..dff2081ed764f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
@@ -138,6 +138,14 @@ r570_gsp_get_static_info(struct nvkm_gsp *gsp)
 		}
 	}
 
+	ret = r535_gsp_get_static_memsys_info(gsp);
+	if (ret) {
+		nvkm_error(&gsp->subdev, "Retrieving static memsys info failed\n");
+		return ret;
+	}
+	nvkm_debug(&gsp->subdev, "memsys: Use raw mode for comptag allocations? %s\n",
+		   str_yes_no(gsp->memsys.use_raw_mode_comptagline_alloc));
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 86970129ad96a..17480d4e527ac 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -176,6 +176,7 @@ int r535_gr_promote_ctx(struct r535_gr *, bool golden, struct nvkm_vmm *,
 			struct nvkm_memory **pctxbuf_mem, struct nvkm_vma **pctxbuf_vma,
 			struct nvkm_gsp_object *chan);
 int r570_gsp_gcx_ready(struct nvkm_gsp *gsp);
+int r535_gsp_get_static_memsys_info(struct nvkm_gsp *gsp);
 extern const struct nvkm_rm_api_engine r535_nvdec;
 extern const struct nvkm_rm_api_engine r535_nvenc;
 extern const struct nvkm_rm_api_engine r535_nvjpg;
-- 
2.55.0

