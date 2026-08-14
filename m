Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46537C5B572
	for <nouveau@archiver.kernel.org>; Fri, 14 Aug 2026 23:59:01 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2588510F78F;
	Fri, 14 Aug 2026 23:59:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Sb0yci7t";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 47D6747817;
	Fri, 14 Aug 2026 23:42:38 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786750958;
 b=ZZD0R41Iapb49aLelm0RCkDTc4ZD8DEtVIvjWu3msHxYfHJ0toL30egE/LE58IqQ7v+NN
 ui6c2JXhx4x8chZY4motGd4j/gd9yj0CtTxJuaYm1OcCNTGsvZChBmXoyTX1xYkpchN+s5Z
 wWjhorUvlXLiKreGB/W3nLC+NX1gmL3ko6FhaP8pK4FAWQ6oyQOCmOhSRwGEPhL/sO9bIB6
 AlWVw1vgW6RI/HxXvHBzxivlAxDXAW2W2DJX21kvvVN0VnaUXYp1o8o1QfdXdG+xdeyU6vg
 vH7eohhFAmvTfr8dtTpjf9iPoWMNx/6qRDLd3ui/E7xDn8mSZMngYW/jeGuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786750958; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=/7LCFTWRnAeC5g1WvDew++pqFKHPtJ1vfgI1n3/PZ1c=;
 b=OyhlqG/pOejlLuDf6OncaXpLHk2JxIp9ghuP1t9S1G692PMzxfHF7u8L9PXV7+enD+xNy
 s5IujP981eOm+i2XxkaDTRL0ntXE9EWG5ETq8t5DyDcfq+sT7Pu6hQRK0LTI4yA8ZNc5+2q
 XFpxulO/+Jg4YjAviF63hdJQe9Q+XOhUO6vIfQF7mXQvYQGC0j+DE2rv3+jkpaPaLRSWtqB
 gQN22V21lVKQ4e0toRlBA+kettwITARyc/Oi3cAR+KWLK3631pdAC8eBcbvhPL8OZZK6+nE
 DM0YybhJAQvqShielNUxiiLkk4xUN7f3V8/ElS5d6G2bJGNjSS/rr3rmr/uQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 43BAA477E8
	for <nouveau@lists.freedesktop.org>; Fri, 14 Aug 2026 23:42:35 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F0D4410F786
	for <nouveau@lists.freedesktop.org>; Fri, 14 Aug 2026 23:58:57 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4998e0916faso1459185e9.2
        for <nouveau@lists.freedesktop.org>;
 Fri, 14 Aug 2026 16:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786751936; x=1787356736;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/7LCFTWRnAeC5g1WvDew++pqFKHPtJ1vfgI1n3/PZ1c=;
        b=Sb0yci7tdWp8Ul+JITTYAGmZGgNTp0ZeN1GYnBoH013F3v0XsxPKN/54MYi+X+3V+b
         To99TA6U1xadvAJs9Ju/55pLe3qhR60uuXgNHfzH6QjE6xiRxfVl3oNyt7SGHrgRaQLV
         iQir/Ub+ryBKo0USfKauFNf2OZzn+F65M6SAR+o0jZSy0NFxfR0ReKgLXslNXlGln9HH
         j4rl/C3JQ03RU7IN77OCZWTCjN9ROIeTN8LkexgqaXSueqU5xPD+0aUq9aEGs4bLAM3B
         znOqbkVN8a1YqD85zTmtc4TlH+CR5Uy8AAvZBs/sqe1fUnPfY4vxASqRSDCSXAI8JAKw
         DAEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786751936; x=1787356736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/7LCFTWRnAeC5g1WvDew++pqFKHPtJ1vfgI1n3/PZ1c=;
        b=smDG2d5AtAKmQGT+JdQj/lNJVbo4MiQTpTp9OkGApPFbMW0YbKWcc0Lkj8qaGVLe+9
         2KcSJFU9vSIbmXbWLRwZjal1NvLA0m3J+mw6ehjjdKNTMFe19aD16dIvm/hLGYDSAZN4
         Z58OhrAYkYqBSX86hG+5aqQgO/dyRcumJ+ScPfn6KGLgRr4mOOUqv7LJLTfk9kuNyj+E
         pRNOYvoyFC0p4s6+Ds9aCJMhwSZ00c8+pEGKzZ0Gcu3pHG87Uba8d2YBqIL9mDHLQ4Sx
         oAbSpGohSO8YsAtaCo/7h7qwEXabiPfyhSv68+2Oih8laiRxMKYudgZujCd8h/nlekw8
         Exkw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqgj3VEmEw/mdEYfOpzWbqmEHlAF/rOh2E676sEl0FdLv+PNVEWir6w/66vkRRGE70RYm3J5F/h@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNAk4zWNBdzbZvHO51tQiiafWyTLZhmsCzPCazlCkpbTtirnF+
	lU2jzmVlSQg4WreMbIbonQ5zBMcooUIFzrtdagDubu6jVHPCkm48/wCu
X-Gm-Gg: AR+sD11FZsxckuiT5+IoUjuNekFqKLs6D6SNnA/6fTI8P2qI7anIVxNl/TPdTzLkEjO
	TSk3S1Pj/0Qyrrnkyk/FYBk6eMdsDlebfsDDJJRa24MHzzCDUkliiOXYYwpRdFDrHX3VbFmWWqg
	M49aQNqqON0z9+KswI+shw3DnTHO17a75xuOkfWIjnJbXtO+9VYnZGZpsp2iLEkSBcCDf+f0+0D
	aTS/GcRv8bFN7Ni7eWjrcRHVUC0jgz6kZU0XuI18sZ0EIkGLxIXCcirlGSR2NNtkgLW069NhEd1
	8FPr6YjBJKGlX407lUqLMxFNb/eIAmBre0nvg1pRmHBx6R1/KHitVLT4iT5fWbmW9u5CB7ehCUM
	f4AHv8uIMchXdUYY+i/Jzj2qxTFuAkfiOR+NfGwCz/uscfwapuNvMeo3B+8x4B2nUXKE2or2Des
	ZhRCQ4xnjIVdvaI5oSeWeTNFxg12ZEFP/z+l5yacwhClX3Rtpj4pBb8VHkp8Bz7griSWM=
X-Received: by 2002:a05:600c:8714:b0:499:49f3:77b1 with SMTP id
 5b1f17b1804b1-49987938551mr142397245e9.3.1786751936320;
        Fri, 14 Aug 2026 16:58:56 -0700 (PDT)
Received: from fedora ([5.31.134.170])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499899753ccsm77751245e9.0.2026.08.14.16.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 16:58:55 -0700 (PDT)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] nouveau/gsp: use per-version DP_CONFIG_STREAM params on
 r570 firmware
Date: Sat, 15 Aug 2026 03:57:02 +0400
Message-ID: <20260814235705.59132-5-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814235705.59132-1-mohamedahmedegypt2001@gmail.com>
References: <20260814235705.59132-1-mohamedahmedegypt2001@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JMN44PF6WXKY3HMEOWOOWPSKBP4FHX7L
X-Message-ID-Hash: JMN44PF6WXKY3HMEOWOOWPSKBP4FHX7L
X-MailFrom: mohamedahmedegypt2001@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Mary Guillemard <mary@mary.zone>, nouveau@lists.freedesktop.org,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/JMN44PF6WXKY3HMEOWOOWPSKBP4FHX7L/>
Archived-At: 
 <https://lore.freedesktop.org/20260814235705.59132-5-mohamedahmedegypt2001@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

NVIDIA removed the deprecated actualPclkHz/linkClkFreqHz fields and the
whole Legacy{activeCnt, activeFrac, activePolarity, mvidWarEnabled,
MvidWarParams} block from the SST sub-struct of
NV0073_CTRL_CMD_DP_CONFIG_STREAM_PARAMS between the 535 and 570 releases
(compared in OpenRM tags 535.113.01 vs 570.144), shrinking the struct.

Everything nouveau writes sits at identical offsets in both layouts but
the size is wrong on r570, which means r535_sor_dp_sst() and
r535_sor_dp_vcpi() are sent with an incorrect size.

Route the .sst/.vcpi IOR functions through nvkm_rm_api_disp the same way
bl_ctrl and dp.get_caps/set_indexed_link_rates already are. Keep the
existing implementation for r535 and add an r570 implementation built
against the 570.144 layout, which already exists in r570/nvrm/disp.h but
was unused until now. Also add the NV0073_CTRL_CMD_DP_CONFIG_STREAM
define that was missing from the layout.

Other DP controls sent through shared r535 code did not change layout
between the tags.

Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
---
 .../nouveau/nvkm/subdev/gsp/rm/r535/disp.c    | 25 +++++++-
 .../nouveau/nvkm/subdev/gsp/rm/r570/disp.c    | 64 +++++++++++++++++++
 .../nvkm/subdev/gsp/rm/r570/nvrm/disp.h       |  2 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  5 ++
 4 files changed, 93 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
index f51ad7c754d8..dd632767aea5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
@@ -403,7 +403,7 @@ r535_sor_dp_audio(struct nvkm_ior *sor, int head, bool enable)
 }
 
 static void
-r535_sor_dp_vcpi(struct nvkm_ior *sor, int head, u8 slot, u8 slot_nr, u16 pbn, u16 aligned_pbn)
+r535_dp_vcpi(struct nvkm_ior *sor, int head, u8 slot, u8 slot_nr, u16 pbn, u16 aligned_pbn)
 {
 	struct nvkm_disp *disp = sor->disp;
 	struct NV0073_CTRL_CMD_DP_CONFIG_STREAM_PARAMS *ctrl;
@@ -434,9 +434,17 @@ r535_sor_dp_vcpi(struct nvkm_ior *sor, int head, u8 slot, u8 slot_nr, u16 pbn, u
 	WARN_ON(nvkm_gsp_rm_ctrl_wr(&disp->rm.objcom, ctrl));
 }
 
+static void
+r535_sor_dp_vcpi(struct nvkm_ior *sor, int head, u8 slot, u8 slot_nr, u16 pbn, u16 aligned_pbn)
+{
+	const struct nvkm_rm_api *rmapi = sor->disp->engine.subdev.device->gsp->rm->api;
+
+	rmapi->disp->dp.vcpi(sor, head, slot, slot_nr, pbn, aligned_pbn);
+}
+
 static int
-r535_sor_dp_sst(struct nvkm_ior *sor, int head, bool ef,
-		u32 watermark, u32 hblanksym, u32 vblanksym)
+r535_dp_sst(struct nvkm_ior *sor, int head, bool ef,
+	    u32 watermark, u32 hblanksym, u32 vblanksym)
 {
 	struct nvkm_disp *disp = sor->disp;
 	struct NV0073_CTRL_CMD_DP_CONFIG_STREAM_PARAMS *ctrl;
@@ -463,6 +471,15 @@ r535_sor_dp_sst(struct nvkm_ior *sor, int head, bool ef,
 	return nvkm_gsp_rm_ctrl_wr(&disp->rm.objcom, ctrl);
 }
 
+static int
+r535_sor_dp_sst(struct nvkm_ior *sor, int head, bool ef,
+		u32 watermark, u32 hblanksym, u32 vblanksym)
+{
+	const struct nvkm_rm_api *rmapi = sor->disp->engine.subdev.device->gsp->rm->api;
+
+	return rmapi->disp->dp.sst(sor, head, ef, watermark, hblanksym, vblanksym);
+}
+
 static const struct nvkm_ior_func_dp
 r535_sor_dp = {
 	.sst = r535_sor_dp_sst,
@@ -1828,6 +1845,8 @@ r535_disp = {
 	.dp = {
 		.get_caps = r535_dp_get_caps,
 		.set_indexed_link_rates = r535_dp_set_indexed_link_rates,
+		.sst = r535_dp_sst,
+		.vcpi = r535_dp_vcpi,
 	},
 	.chan = {
 		.set_pushbuf = r535_disp_chan_set_pushbuf,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/disp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/disp.c
index a96e31c2d80b..61f82e15ff39 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/disp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/disp.c
@@ -5,6 +5,7 @@
 #include <rm/rm.h>
 
 #include <engine/disp.h>
+#include <engine/disp/ior.h>
 #include <engine/disp/outp.h>
 
 #include "nvhw/drf.h"
@@ -74,6 +75,67 @@ r570_disp_chan_set_pushbuf(struct nvkm_disp *disp, s32 oclass, int inst, struct
 	return nvkm_gsp_rm_ctrl_wr(&gsp->internal.device.subdevice, ctrl);
 }
 
+static void
+r570_dp_vcpi(struct nvkm_ior *sor, int head, u8 slot, u8 slot_nr, u16 pbn, u16 aligned_pbn)
+{
+	struct nvkm_disp *disp = sor->disp;
+	NV0073_CTRL_CMD_DP_CONFIG_STREAM_PARAMS *ctrl;
+
+	ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
+				    NV0073_CTRL_CMD_DP_CONFIG_STREAM, sizeof(*ctrl));
+	if (WARN_ON(IS_ERR(ctrl)))
+		return;
+
+	ctrl->subDeviceInstance = 0;
+	ctrl->head = head;
+	ctrl->sorIndex = sor->id;
+	ctrl->dpLink = sor->asy.link == 2;
+	ctrl->bEnableOverride = 1;
+	ctrl->bMST = 1;
+	ctrl->hBlankSym = 0;
+	ctrl->vBlankSym = 0;
+	ctrl->colorFormat = 0;
+	ctrl->bEnableTwoHeadOneOr = 0;
+	ctrl->singleHeadMultistreamMode = 0;
+	ctrl->MST.slotStart = slot;
+	ctrl->MST.slotEnd = slot + slot_nr - 1;
+	ctrl->MST.PBN = pbn;
+	ctrl->MST.Timeslice = aligned_pbn;
+	ctrl->MST.sendACT = 0;
+	ctrl->MST.singleHeadMSTPipeline = 0;
+	ctrl->MST.bEnableAudioOverRightPanel = 0;
+	WARN_ON(nvkm_gsp_rm_ctrl_wr(&disp->rm.objcom, ctrl));
+}
+
+static int
+r570_dp_sst(struct nvkm_ior *sor, int head, bool ef,
+	    u32 watermark, u32 hblanksym, u32 vblanksym)
+{
+	struct nvkm_disp *disp = sor->disp;
+	NV0073_CTRL_CMD_DP_CONFIG_STREAM_PARAMS *ctrl;
+
+	ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
+				    NV0073_CTRL_CMD_DP_CONFIG_STREAM, sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	ctrl->subDeviceInstance = 0;
+	ctrl->head = head;
+	ctrl->sorIndex = sor->id;
+	ctrl->dpLink = sor->asy.link == 2;
+	ctrl->bEnableOverride = 1;
+	ctrl->bMST = 0;
+	ctrl->hBlankSym = hblanksym;
+	ctrl->vBlankSym = vblanksym;
+	ctrl->colorFormat = 0;
+	ctrl->bEnableTwoHeadOneOr = 0;
+	ctrl->SST.bEnhancedFraming = ef;
+	ctrl->SST.tuSize = 64;
+	ctrl->SST.waterMark = watermark;
+	ctrl->SST.bEnableAudioOverRightPanel = 0;
+	return nvkm_gsp_rm_ctrl_wr(&disp->rm.objcom, ctrl);
+}
+
 static int
 r570_dp_set_indexed_link_rates(struct nvkm_outp *outp)
 {
@@ -255,6 +317,8 @@ r570_disp = {
 	.dp = {
 		.get_caps = r570_dp_get_caps,
 		.set_indexed_link_rates = r570_dp_set_indexed_link_rates,
+		.sst = r570_dp_sst,
+		.vcpi = r570_dp_vcpi,
 	},
 	.chan = {
 		.set_pushbuf = r570_disp_chan_set_pushbuf,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/disp.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/disp.h
index 06e972835d77..742b25a2a12d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/disp.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/disp.h
@@ -256,6 +256,8 @@ typedef struct NV0073_CTRL_DP_CTRL_PARAMS {
     NvU32 eightLaneDpcdBaseAddr;
 } NV0073_CTRL_DP_CTRL_PARAMS;
 
+#define NV0073_CTRL_CMD_DP_CONFIG_STREAM                   (0x731362U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DP_INTERFACE_ID << 8) | NV0073_CTRL_CMD_DP_CONFIG_STREAM_PARAMS_MESSAGE_ID" */
+
 typedef struct NV0073_CTRL_CMD_DP_CONFIG_STREAM_PARAMS {
     NvU32  subDeviceInstance;
     NvU32  head;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index a9af94adf9ef..e0c10a7e3452 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -6,6 +6,7 @@
 #ifndef __NVKM_RM_H__
 #define __NVKM_RM_H__
 #include "handles.h"
+struct nvkm_ior;
 struct nvkm_outp;
 struct r535_gr;
 
@@ -93,6 +94,10 @@ struct nvkm_rm_api {
 		struct {
 			int (*get_caps)(struct nvkm_disp *, int *link_bw, bool *mst, bool *wm);
 			int (*set_indexed_link_rates)(struct nvkm_outp *);
+			int (*sst)(struct nvkm_ior *, int head, bool ef,
+				   u32 watermark, u32 hblanksym, u32 vblanksym);
+			void (*vcpi)(struct nvkm_ior *, int head,
+				     u8 slot, u8 slot_nr, u16 pbn, u16 aligned_pbn);
 		} dp;
 
 		struct {
-- 
2.55.0

