Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12FECC5B572
	for <nouveau@archiver.kernel.org>; Fri, 14 Aug 2026 23:58:56 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DD88E10F789;
	Fri, 14 Aug 2026 23:58:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="V7X5mDzC";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 05C4B47812;
	Fri, 14 Aug 2026 23:42:33 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786750952;
 b=YLM2qrYGtZLQJOywigxeI3kkYX/BZlpJS5o/YClDE+psWfwoC8BdeHQse6HV9GiP6vd0s
 BHDlLoSMOb/pxpTGyMcE+tZjgEBihRdBDtjSwUxMvv/cXbtSchHnvjoAvnVPKMIuodkJUJr
 lMvdxvktVHylwXVRmNSFJjLrjEk6Z7zQa7Odial3Gj12ZaKY/SyKehwK3MsfR/AWJ+uxfRz
 qETP5pbtqWRwNh3noOc4dlycwL6KjO9ayRXBBUp5ckitZyDMbcucqVEKKx4K5/1sZUYlqTM
 WYBg2hhJSd/GgCIVJvxqb1fKz23vKSPUlzObkGSye7QWOOh97y1SnqGOGwIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786750952; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=R6DVPxscTkaYxlbTz2TUJ+2+zTnJDWDA7fd5WXD5WOU=;
 b=QlBmezDf2KqW5SdDZPABaLIsaOAywN4Jy/HUbbcuG5ZF0vNJgu8kyOr20x69psMbOkYli
 a/9Y8NZ04OxRL3Yxg1SC7s6m5hUxJWYCxG0Q0/jrMwTXhXvXDmZlgxdQm34fnmE+3hdG9Xk
 qDzXNG97OZgtncGc3UUXl7Mwh3a95sHIHGtWj/x7g7ovmRJfDga8AztY00snmT7wvQw5/6A
 forOogENh/kJXK7X9yLdtvC5wZST9o0pTyPs6XrfMVA5pwDOie/zToIhs6IrLTrKBRZPfBa
 qUpjt+cf8bFPF/8bBksa2XeQ7lPTICJMELpdilpN/XXt1reLedMqinO9NU7g==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 2E284477E8
	for <nouveau@lists.freedesktop.org>; Fri, 14 Aug 2026 23:42:30 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DAA5B10F781
	for <nouveau@lists.freedesktop.org>; Fri, 14 Aug 2026 23:58:52 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4955aa106b1so13315055e9.0
        for <nouveau@lists.freedesktop.org>;
 Fri, 14 Aug 2026 16:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786751931; x=1787356731;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R6DVPxscTkaYxlbTz2TUJ+2+zTnJDWDA7fd5WXD5WOU=;
        b=V7X5mDzCFJhxqnW3HOb8nYQvY/ka5zfN7DV6/dsbRZiPFb5uww52bsvC4wjHpFB9hm
         BAscpsDHMzhLWHyVRslwRYB647wEW/WrLVb8yJUs6rYO7QVca65XTX0j5x4I+GvhzmVo
         I6Qw5O8+7pbsQwuns100y5Z77fufsWQMCLcwEADO5qt3kj+kjLdZY2eZmStRn4OrR2eZ
         DcvQaJNWghZ/hLJEi49aF8UxNJ0I11DJx0tt3XfKKsKmZl+3xD3tNzq+Djtx57WIzyha
         7xDHV4ickCm1xSju4tLCrahpKdBBx8is7OF4Vn0JhyUQJba4kjx7mR6R65GH/s9eTOox
         EkCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786751931; x=1787356731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R6DVPxscTkaYxlbTz2TUJ+2+zTnJDWDA7fd5WXD5WOU=;
        b=TKB0LCD/3SSqA/0qt5Vui7koGVJfSO4CPTgiKuoXD/EPkNHsUsJ+O9vossbvJThdFE
         LAVyRfGmg0hrJPwW9YGOPFJ0aMmDdSAgMuwkJ0TeMJXeOeHI+X3cD0pZN7T9psG9Jw36
         7QPCUKDs2pPiApIL53SJk3BoX5iOdUEScgkpjbqiV1stIrjP77lPFJ9rsRbX17TsGRxq
         VRPfMbH5PuYrJ5As635AXp4d1y4fmAo+PywAymLGAojk68q7DjVnn/Bd9bvno3MKO6MW
         XufrIFbFuviOCpLPOQ9Izw5gBQ4oFpGBXD3Kc8IvtxyvGs+hPVE9uOHiBjRhKkHNoWdw
         HG6g==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpt40i8gxHbDlPULTFL1P99xcbdTmXmMRRlkY87KuDDixV+fbKCaEO/XV/mtEhtXQ6IP0b+Q6S9@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywrk7b0f9CnozWDa6UJA7qSwTgs5Ks8/YbRJu1cx3dDG+7+Ag6x
	V0CRHmlkBSpGmpRAQEcG/hprPwTIHnI0g1TTPEgGO7lDubRd8k7rrsbe
X-Gm-Gg: AR+sD13F0z6LQ5MjPdrwjIBDOdF+mvA8c7ugN/0QnQZ2ir6S9ifG0XPxJch2ZE1SAy9
	5d8RwK3mRbAiML2ujCyoOrQ8XGswa6SqBbTIuINbebYuDYuzdEdHm9E8un8o8Bzg+/i++gU72wj
	lDQLGp93If0ywNJMG+6ll27fjT/VeojOLCU0PqGDc9iR/UJkYtvN72gHQEl9DN9fHB96ra0Bmry
	5Yl/vP+W/Ec6ni29TSu3UkEFayINqQ1QpZZKTFf8cbiqYFTLOENemEMrA24qLlCRw/rZLXGylUm
	+JfnTRRRRt/3GG3vT81x7kERXEwtwSMLlKU0APq86RrCKHVo2ZWTyR7h6Jp0PhHelMxskS661ub
	TYPu3dZKXc7G5yBpChOhbgJAFbA5ycVg3ggmlNPUCB1IFhpxHld5H1PbXRq82BTote1uGpPQrXe
	s4nRiDsF+pgefGnAVJud4/gAh3tU0IeC8oe212RCPXk5+BzngeSZ1Mk5BByU+n+R1MzqU=
X-Received: by 2002:a05:600c:b99:b0:496:c379:b2a1 with SMTP id
 5b1f17b1804b1-49987929903mr128849405e9.2.1786751931136;
        Fri, 14 Aug 2026 16:58:51 -0700 (PDT)
Received: from fedora ([5.31.134.170])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499899753ccsm77751245e9.0.2026.08.14.16.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 16:58:50 -0700 (PDT)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] nouveau/gsp: fix HDMI GCP AVMute register offsets on
 GB20x
Date: Sat, 15 Aug 2026 03:57:01 +0400
Message-ID: <20260814235705.59132-4-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814235705.59132-1-mohamedahmedegypt2001@gmail.com>
References: <20260814235705.59132-1-mohamedahmedegypt2001@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YQVO6D267EDMZYD4GQL75DOM2MFJDD7C
X-Message-ID-Hash: YQVO6D267EDMZYD4GQL75DOM2MFJDD7C
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YQVO6D267EDMZYD4GQL75DOM2MFJDD7C/>
Archived-At: 
 <https://lore.freedesktop.org/20260814235705.59132-4-mohamedahmedegypt2001@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

r535_sor_hdmi_audio() brackets audio enablement with a General
Control Packet AVMute toggle written through the legacy GCP unit at
0x6f00c0/0x6f00cc. On GB20x the SF packet units were compacted and the
old generic and audio-infoframe units are gone and the GCP unit moved
from slot 3 to slot 1 (control 0x6f0040 and subpack 0x6f004c from
NVIDIA's published clc971.h. The same offsets are also used by OpenRM's
hdmiWriteGeneralCtrlPacketC871() on these chips). The old addresses are
reserved on GB20x, so the AVMute writes were silent no-ops and mitigated
only by the equivalent GCP this function already sends through the
SET_OD_PACKET RM control.

Add a GB20x variant of the audio function using the new offsets,
keeping the direct MMIO path in sync with the hardware as on
earlier chips.

Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
---
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c  | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
index 96febd01da78..f51ad7c754d8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
@@ -559,6 +559,21 @@ r535_sor_hdmi_audio(struct nvkm_ior *sor, int head, bool enable)
 	nvkm_mask(device, 0x6f00c0 + hdmi, 0x00000001, 0x00000001);
 }
 
+static void
+gb202_sor_hdmi_audio(struct nvkm_ior *sor, int head, bool enable)
+{
+	struct nvkm_device *device = sor->disp->engine.subdev.device;
+	const u32 hdmi = head * 0x400;
+
+	r535_sor_hdmi_ctrl_audio(sor->asy.outp, enable);
+	r535_sor_hdmi_ctrl_audio_mute(sor->asy.outp, !enable);
+
+	/* General Control (GCP): the unit moved to slot 1 on NVD5.0. */
+	nvkm_mask(device, 0x6f0040 + hdmi, 0x00000001, 0x00000000);
+	nvkm_wr32(device, 0x6f004c + hdmi, !enable ? 0x00000001 : 0x00000010);
+	nvkm_mask(device, 0x6f0040 + hdmi, 0x00000001, 0x00000001);
+}
+
 static void
 r535_sor_hdmi_ctrl(struct nvkm_ior *sor, int head, bool enable, u8 max_ac_packet, u8 rekey)
 {
@@ -595,7 +610,7 @@ gb202_sor_hdmi = {
 	/* The legacy AVI unit is unchanged on GB20x. */
 	.infoframe_avi = gv100_sor_hdmi_infoframe_avi,
 	.infoframe_vsi = gb202_sor_hdmi_infoframe_vsi,
-	.audio = r535_sor_hdmi_audio,
+	.audio = gb202_sor_hdmi_audio,
 	.frl_train = r535_sor_frl_train,
 };
 
-- 
2.55.0

