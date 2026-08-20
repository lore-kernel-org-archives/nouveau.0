Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCCE1C5DF85
	for <nouveau@archiver.kernel.org>; Thu, 20 Aug 2026 16:50:23 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7E4A110F10D;
	Thu, 20 Aug 2026 16:50:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="M7zfuCNx";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 10F6A479CD;
	Thu, 20 Aug 2026 16:33:48 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787243627;
 b=STA0nYYKNc5QI0UH6A3fyRivSOlWjuJvScvpzLd4X5MsQU2S0wpK1o1MvljuujX3IV9Hy
 V9kTg2cBO/jdNMRJF+gYmbmTOTCLVR+0F+fjtb+lZfyTYNLXILmOl7q7NcoYPfKfpmcneDp
 Kqy1IZX5fVTy88OHosJTkHuJXJuan5nKlkmltbJRK2EUS65P2IYO4D3dIWOY/6MPV6/QwI+
 yoMuHvLRSmgTVGZrm7sPtYx7gB5DApPbcTiaX3FroRNmupCV3i+MfsTgRUFWWvLBiPX3+s0
 Ak5s+OGuE/yHjN9mvExQXPtk9cy7CMQ0zPtoKZY+CivvLfkkWFTkUZe0d7aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787243627; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=rT8aU54Ao2Sd1OnFQ2SWEU+B+UCoOzmBSCO9Ey1DwWE=;
 b=KstDLFT8v+IXMHvZvqFZnrEfPTNI6wvTWv/06bAHvweYZiRqm/eMxEb3ZcZhbEi1axT2T
 B7UYKkgyYatmFjDuO/tqCmqaDEPf+J6KO7IUhqnh/uFOyrGe5AgBb53uC26X3HwX9stxeA3
 2g2mYxPU7wPmo0pCW/LfBo8D+eZ8ZgEcDiT0WcjH68f/QHEu4KVaEfWi+4XrRStRspCUGg1
 eJD1KhK1GMkEMPrrMpNOqXkZo8xWCqBUAQ+mBe5RxlONi/wGHVKFzJffNfIuXgUEvgonpuy
 WPHUryLj5p9zcqHKOojTAgePhL0XxbCr1anjZvQcUp9tSxlEVBQFqFUT6nFg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 9DD2047996
	for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2026 16:33:45 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EEB6F10F106
	for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2026 16:50:20 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so461125e9.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 20 Aug 2026 09:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787244619; x=1787849419;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rT8aU54Ao2Sd1OnFQ2SWEU+B+UCoOzmBSCO9Ey1DwWE=;
        b=M7zfuCNxEXNeHc6+5iLr6b1GxrdsGAogTspr7PcrckvwhrkQXTaqIPlM34EP6U7AzF
         SMb3V97KRFGJ0Qi4vf4dSCgDWNj3fFCsNue5++bILV7yuDNxEzKUQ+AEHjPXvVAjjMmU
         cN/bYmN3zfWeDvVVlXvxsSgCmTQQ9fpwK/e2+jAhShThwd4G88W4NpMjHUlcF8I6uwEQ
         iETreohz3B4oxqoJB4eKeIcbj6n1MyekoNa0yZdltQlHTKrOrHtPhPjQS7PpVv85isYl
         2n2xs1YxCW3nMyHraHQQaAZreX1VE5uMQulfANAn8OBAXxiEb3lLgJd+s/6BeXqokYEl
         aF0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787244619; x=1787849419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rT8aU54Ao2Sd1OnFQ2SWEU+B+UCoOzmBSCO9Ey1DwWE=;
        b=Qm1LJbFCTBibqY7ZUt7ux+S/3SdqUCphvtPoC3AkUFJ2ypRzb3e9GNPwpoKfkxMauF
         OZl2pbgSXJOKS9F3IXR7zvRLzHLDUvY/x0dk0Wj7boRGchpyqbPyxZRD8xotPQlgoE5C
         2v2h5HUauXKmAFoY8C02jR7+FGQ1aSIigvodCjqapMQvq9UQD9CS4GjKNXA3B/QHmdRK
         txRviA9yRne7l/cxGI7wfFELA066PTbkWUDe2/8WwnqcvmD1IT0Jx2wEULZapoZxMEmb
         hSnHGFDchmLjV063V2Dao8EiirytyB46/aBuKBOXLbdsqDpzKUUO/XI1cbodJ5Y9aeUE
         51jA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp+zAk/UV8gSTH0Cg7Z7v/Mn+OJ98ThPzEmTSAcSpReIbbqDg/3XyZR/9iVZWx87rjlz46PI1oc@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzb5JCi2H3zr7vnUrN6aZVGz4L6kHdOTw1QiTsJrA3fSLuVktSk
	YQTL7JnjgLT5I3i5is4ND0enpG5Zd+eRZeGn6wswajM/He6YM37F2sBn
X-Gm-Gg: AR+sD12eD7CBZMCcWAjQO+nteB77LxGAlRU8VC4n3eJ5Uk74FR87Inq1x6MzdsVVlC6
	HALCGTZs69qhFdu5aUeiFNiIGEa7UpFCXJj6k0BFng9HrWL9qz4wVe607v5S60Y8KRmbSIxTP1A
	wJWD8FqlCvqCH4W0IR+kZD4HHxfEXSKjOi2x2AbC27bPsi/BhlgfvPkfZH2b9WlXitwfs4TG+mM
	O1CBzA7Hadu5F5bqz7Jt2DNFasBZy34BMHcHyi+jHYRx318tlkAZsZbwDvpjp5WHfduXnH9pLYU
	7FSl9CGLnyxm5F6eIgbrLA7suQjcjNtu9RrgLBxrmRAPvn2H48pPmhO8ILeJZQdSTNiVItEykTO
	D4i5rfaHEo8KEx4bcDPr9L5auBpwFzS8dAQ1PL7ha7BUKvG1QraYaMr6ZisnVaFSB89z7nMTDDY
	Ras0bk6o/gTbsB2QsgMkU1hEQMvve6XyURG45bP8dtOQjplbyngKKW2GosKrmwuJHv+FQ=
X-Received: by 2002:a05:600c:a087:b0:499:a760:722f with SMTP id
 5b1f17b1804b1-499b8461acfmr3397515e9.13.1787244619109;
        Thu, 20 Aug 2026 09:50:19 -0700 (PDT)
Received: from fedora ([5.31.134.170])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499aa1111b2sm205307545e9.5.2026.08.20.09.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 09:50:17 -0700 (PDT)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/10] drm/nouveau/disp: move the GSP HDMI GCP AVMute write
 to engine/disp
Date: Thu, 20 Aug 2026 20:49:21 +0400
Message-ID: <20260820164929.17117-3-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260820164929.17117-1-mohamedahmedegypt2001@gmail.com>
References: <20260820164929.17117-1-mohamedahmedegypt2001@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EIWLEQCCG62NYXH5NIQPKZDKI6BJOZDY
X-Message-ID-Hash: EIWLEQCCG62NYXH5NIQPKZDKI6BJOZDY
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/EIWLEQCCG62NYXH5NIQPKZDKI6BJOZDY/>
Archived-At: 
 <https://lore.freedesktop.org/20260820164929.17117-3-mohamedahmedegypt2001@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

r535_sor_hdmi_audio() pairs two RM controls (a SET_OD_PACKET carrying
the same General Control Packet, and the audio mute-stream toggle)
with a direct write of the GCP AVMute bit through the SF GCP unit.
The controls are RM and stay, but the direct write is register
programming and moves next to the other per-chip display code as
tu102_sor_hdmi_gcp(). No functional change.

Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h    |  1 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c  | 15 +++++++++++++++
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c    |  9 +--------
 3 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h
index 3ba04bead2f9..5d682a774f2d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h
@@ -194,6 +194,7 @@ void gv100_sor_dp_audio_sym(struct nvkm_ior *, int, u16, u32);
 void gv100_sor_dp_watermark(struct nvkm_ior *, int, u8);
 extern const struct nvkm_ior_func_hda gv100_sor_hda;
 
+void tu102_sor_hdmi_gcp(struct nvkm_ior *, int, bool);
 void tu102_sor_dp_vcpi(struct nvkm_ior *, int, u8, u8, u16, u16);
 
 int nv50_pior_cnt(struct nvkm_disp *, unsigned long *);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c
index 7b70b466fa36..6cfd52c9056f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c
@@ -30,6 +30,21 @@
 
 #include <nvif/class.h>
 
+/* General Control Packet: bracket an audio enable/disable with AVMute
+ * through the legacy GCP SF unit. Used by the GSP-RM path, which sends the
+ * equivalent packet via RM as well but keeps the direct write in sync.
+ */
+void
+tu102_sor_hdmi_gcp(struct nvkm_ior *sor, int head, bool enable)
+{
+	struct nvkm_device *device = sor->disp->engine.subdev.device;
+	const u32 hdmi = head * 0x400;
+
+	nvkm_mask(device, 0x6f00c0 + hdmi, 0x00000001, 0x00000000);
+	nvkm_wr32(device, 0x6f00cc + hdmi, !enable ? 0x00000001 : 0x00000010);
+	nvkm_mask(device, 0x6f00c0 + hdmi, 0x00000001, 0x00000001);
+}
+
 void
 tu102_sor_dp_vcpi(struct nvkm_ior *sor, int head, u8 slot, u8 slot_nr, u16 pbn, u16 aligned)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
index 8e57bb6519e5..cd4451e62512 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
@@ -545,16 +545,9 @@ r535_sor_hdmi_ctrl_audio(struct nvkm_outp *outp, bool enable)
 static void
 r535_sor_hdmi_audio(struct nvkm_ior *sor, int head, bool enable)
 {
-	struct nvkm_device *device = sor->disp->engine.subdev.device;
-	const u32 hdmi = head * 0x400;
-
 	r535_sor_hdmi_ctrl_audio(sor->asy.outp, enable);
 	r535_sor_hdmi_ctrl_audio_mute(sor->asy.outp, !enable);
-
-	/* General Control (GCP). */
-	nvkm_mask(device, 0x6f00c0 + hdmi, 0x00000001, 0x00000000);
-	nvkm_wr32(device, 0x6f00cc + hdmi, !enable ? 0x00000001 : 0x00000010);
-	nvkm_mask(device, 0x6f00c0 + hdmi, 0x00000001, 0x00000001);
+	tu102_sor_hdmi_gcp(sor, head, enable);
 }
 
 static void
-- 
2.55.0

