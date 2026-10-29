Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE264606A31E
	for <nouveau@archiver.kernel.org>; Sat, 31 Oct 2026 02:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EKeVlcLf
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A190F112A87;
	Sat, 31 Oct 2026 02:09:52 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 38D1C48C2F;
	Sat, 31 Oct 2026 01:50:39 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793411439;
 b=e/o0hR5KnnUW7kDVHSla5+s89M7BXyPXyeU02I4WkiXnVwQ9881mpjhRjWEU3NIbFwPPw
 iZJAVSL5h7P/WVP0KA7/RSDtNTswvYMxujgjeULxdqpokhrVMm92/Aw4irJYklHkegBQYKL
 LtWwNFqMHMuokPxEdKpsapRGYE7n73rBkkicV6ua40s734Sg5d4cEjBnibTDscaeLnMqRgq
 X8oGbEMk99Mnjz9h2kvx4J8iQ5zxJiK4O/MsVkW8IVdy6JhJt7xdny1u9cMyDVskIBUQKHB
 bmBLjV2+649BEYN8liA8AdfjT9a4fxNnYaeeD5+KnEV47LIrKOqWEusepFbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793411439; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=KBF/n889W/0PSJDWRM61nGSK3OIoWxNCG5rQWJv9+Po=;
 b=xuh5YHD4sveOjWUSkdZ8r7X/ZbHpX3ViggL6z7ri05B+Qt5DVx91IMnaHMrDH1gMHLeYa
 ivcDgnt9OgzC/iJcYMX5/kgNC7NUNIchtSkOTFkb0sxLesEZ8tMPDUAqsGHSvxpUnEBSPWk
 iAUaz1OOIeU+Km9217vtY8fOvU2mQdojihVKaKI5Lywkuh/7h6xPy5vR6INcih4PmeqpB0H
 fhF/8z//zMsWw66EM9z2TPbS52nsnlqVLzDCJvkh499Zp1VyoZkJSsbqMEQVMfEIV9p3xQa
 zWjORrjZZwylbiE65EAt+zLcWudz09D53AZq9r0DuM4ckW3CkmHvCRMNLc6A==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 3B7E146CD7
	for <nouveau@lists.freedesktop.org>; Thu, 29 Oct 2026 09:59:34 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D3C681121A5
	for <nouveau@lists.freedesktop.org>; Thu, 29 Oct 2026 10:18:38 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-c445c95d553so269194666b.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 29 Oct 2026 03:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793269117; x=1793873917;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KBF/n889W/0PSJDWRM61nGSK3OIoWxNCG5rQWJv9+Po=;
        b=EKeVlcLf144jslT2fI27PW3UD2eNsbtKxOkthbyhK1++DgVJ5APsNslcEGImO7kUSJ
         PRvX5XvSjrtICw+n+Hrh+bDLkdRktxT8qiC3Wecf4MuhwaRA6E24EPSB5O8nhjXUKsST
         mXPP55HROvgI088HdKhr+/5iwv6hGxSLsE5uFnbQZmgNG5P+MK6UALnd4wkUw14F+hqE
         P4/9fqpaFttfP7gkiXehBgq/T9v0/6yLOd8e7kyQA/Z3A4jyAmX63W7Npv3HV/9aMiEs
         CyG6nf3ZaFaIWUseaHjjRtsd0U54Gv7kGR3wv+u0R0+qA4suyDLq/0JXNnBJUPHJ2epZ
         O8KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793269117; x=1793873917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KBF/n889W/0PSJDWRM61nGSK3OIoWxNCG5rQWJv9+Po=;
        b=fcUt5BAcmS9+0+l4Mo5C6zmNDBNwIsYQerDtjMSBflLiIec+18VC4lwldwmYAlNCfL
         T/fCrrPk8jiIcSgBv7nlNAu8YQu9WNU6bNWKUNl1l4DC30o7b60TYGpkSz1/F7Z3LSUB
         rg85n1FBv/MUGhXLADILtnGYQXHZMENo8QvKdVBAgNxrj4d8/rlOQ6YNDyQ3SfxrfuvS
         zWW0DbeKBljBlJyybynDrlG5HsiB2FEVud8R2WLKbXlCjpUT7MedyMq0bfUVfjJg5PXX
         +AV24M2l5gDeoCnYpJzKsuop12tafAHoqxk8pehEylKq24OqkEJrVCrmqhuDHsYg1MLF
         QT/Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBy/XLpkIgbCMzipwipLIjSHkH7ud7/5QvgU70Uh4pLLkAAbgzSnRZUc1J8oX7hJAYVXe5Og/BO4@lists.freedesktop.org
X-Gm-Message-State: AFq9FYJjc4a+kKl6qQaSmV0e6dA0afFq3QOsPpf2TTb80TJjnvMVJE1x
	qiX1gZ+DtUkHrZFFKh239J/arwNXhCMAiC2ofTLrSGksWBKacEBK0djp
X-Gm-Gg: AYBFou2JLW3LkGDM07cdwaOtjpA5uKa5qpHjJxOJzlFG+C2nLgm3mP9kJ0kNde8EGvu
	QmvBVZW7wue0r/WhGRKvIrP5C9fkKGf59mX8fSBViaxEGlZ0mi2wxR5jzwF+PU+hTWBMGAZlm3A
	7J6MK/sLz3VZirBaelzg3wSapPv2fa/cWBuXfmX1Ubo0IX379fdmZKdq+qoACoQWzJt3dp/X5kC
	HIjlwB6OgxKfz63glCVKfxALjAAHr0LBFZxZkbMuVOGCLYgiT+sFtfftLMxxZrEbLDOZi0qjWNu
	S3w4qmkewoOnVyq38Z+F+CHmXUJNNNi6Yikm08DRs3OvwxKeG0XBjLLHOeiUi9gY8B0utwdVu+s
	2Ov4PuK1GM9Vjo1iT1tJRMgVa3DTROr7kxpFJALfSdgC/GZPzui1bjK4HQD4M4Ed+td6Qvgtjfa
	qhCskYwujgAMO5r7qu02W3diC7gH6TL8O6G1LNS/do+jSukkwT/zf0UC92115waRU1ViMwmGzXk
	ccsy41A8XQstj+kV8ylQgj8oPO3yqfOQulIwlbWigmjE0FTBOXPMe8Q5Y59GsJDQWXx0yDkIsnb
	Gz+zn434/KwxiaqIdI84lwr66R9JSBMQ8ZMD4dRtyhoIf32Aaufzg1qMa8a1IoXBNjONCq2GyCD
	d0KExdVeO
X-Received: by 2002:a17:907:7251:b0:c46:8c16:a656 with SMTP id
 a640c23a62f3a-c49bdecf308mr430095466b.18.1793269117120;
        Thu, 29 Oct 2026 03:18:37 -0700 (PDT)
Received: from localhost.localdomain ([46.205.195.0])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd66c6dbsm712145966b.59.2026.10.29.03.18.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 03:18:36 -0700 (PDT)
From: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 5/5] drm/nouveau: Use enhanced framing for DPCD r1.2+
Date: Thu, 29 Oct 2026 11:18:26 +0100
Message-ID: <20261029101826.72773-6-dmitrymalovanyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261029101826.72773-1-dmitrymalovanyy@gmail.com>
References: <20261029101826.72773-1-dmitrymalovanyy@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: dmitrymalovanyy@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: KCMVGMQH4MPR5TN5SF6PAEJLOV5AY45H
X-Message-ID-Hash: KCMVGMQH4MPR5TN5SF6PAEJLOV5AY45H
X-Mailman-Approved-At: Sat, 31 Oct 2026 01:50:36 +0000
CC: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Danilo Krummrich <dakr@kernel.org>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KCMVGMQH4MPR5TN5SF6PAEJLOV5AY45H/>
Archived-At: 
 <https://lore.freedesktop.org/20261029101826.72773-6-dmitrymalovanyy@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

nv50_sor_dp_watermark_sst() checks DP_ENHANCED_FRAME_CAP for the
watermark calculation, but the actual enhanced framing enable is
decided in nvkm, in nvkm_dp_train(), nvkm_uoutp_mthd_dp_sst() and
r535_dp_train_target(), with its own copy of the check. Convert all of
them so they keep agreeing with each other.

dispnv50 uses drm_dp_enhanced_frame_cap(). nvkm does not include the
drm helpers, so add nvkm_dp_enhanced_frame_cap() with the same rule.

Compile tested only, I don't have nvidia hardware.

Signed-off-by: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c               |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c         |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.h         | 11 +++++++++++
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c      |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c    |  2 +-
 5 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index e91130f93..f965d4811 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1607,7 +1607,7 @@ static bool
 nv50_sor_dp_watermark_sst(struct nouveau_encoder *outp,
 			  struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	bool enhancedFraming = outp->dp.dpcd[DP_MAX_LANE_COUNT] & DP_ENHANCED_FRAME_CAP;
+	bool enhancedFraming = drm_dp_enhanced_frame_cap(outp->dp.dpcd);
 	u64 minRate = outp->dp.link_bw * 1000;
 	unsigned tuSize = 64;
 	unsigned waterMark;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
index a109348bd..fbd9935f4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
@@ -509,7 +509,7 @@ nvkm_dp_train(struct nvkm_outp *outp, bool retrain)
 	OUTP_DBG(outp, "training");
 
 	ior->dp.mst = outp->dp.lt.mst;
-	ior->dp.ef = outp->dp.dpcd[DPCD_RC02] & DPCD_RC02_ENHANCED_FRAME_CAP;
+	ior->dp.ef = nvkm_dp_enhanced_frame_cap(outp->dp.dpcd);
 	ior->dp.bw = outp->dp.lt.bw;
 	ior->dp.nr = outp->dp.lt.nr;
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.h
index 9a6be4391..e56acc162 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.h
@@ -23,6 +23,17 @@ void nvkm_dp_enable(struct nvkm_outp *, bool auxpwr);
 #define DPCD_RC10_SUPPORTED_LINK_RATES(i)                               0x00010
 #define DPCD_RC10_SUPPORTED_LINK_RATES__SIZE                                 16
 
+/* Same rule as drm_dp_enhanced_frame_cap() */
+static inline bool
+nvkm_dp_enhanced_frame_cap(const u8 *dpcd)
+{
+	if (dpcd[DPCD_RC00_DPCD_REV] >= 0x12)
+		return true;
+
+	return dpcd[DPCD_RC00_DPCD_REV] >= 0x11 &&
+	       (dpcd[DPCD_RC02] & DPCD_RC02_ENHANCED_FRAME_CAP);
+}
+
 /* DPCD Link Configuration */
 #define DPCD_LC00_LINK_BW_SET                                           0x00100
 #define DPCD_LC01                                                       0x00101
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index 377d0e0ce..b0158fc30 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -87,7 +87,7 @@ nvkm_uoutp_mthd_dp_sst(struct nvkm_outp *outp, void *argv, u32 argc)
 		return 0;
 
 	return ior->func->dp->sst(ior, args->v0.head,
-				  outp->dp.dpcd[DPCD_RC02] & DPCD_RC02_ENHANCED_FRAME_CAP,
+				  nvkm_dp_enhanced_frame_cap(outp->dp.dpcd),
 				  args->v0.watermark, args->v0.hblanksym, args->v0.vblanksym);
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
index f5f22173f..c62900320 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
@@ -972,7 +972,7 @@ r535_dp_train_target(struct nvkm_outp *outp, u8 target, bool mst, u8 link_nr, u8
 	if (mst)
 		cmd |= NVDEF(NV0073_CTRL, DP_CMD, SET_FORMAT_MODE, MULTI_STREAM);
 
-	if (outp->dp.dpcd[DPCD_RC02] & DPCD_RC02_ENHANCED_FRAME_CAP)
+	if (nvkm_dp_enhanced_frame_cap(outp->dp.dpcd))
 		cmd |= NVDEF(NV0073_CTRL, DP_CMD, SET_ENHANCED_FRAMING, TRUE);
 
 	if (target == 0 &&
-- 
2.50.1 (Apple Git-155)

