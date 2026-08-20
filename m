Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97462C5DF81
	for <nouveau@archiver.kernel.org>; Thu, 20 Aug 2026 16:51:08 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7470910F126;
	Thu, 20 Aug 2026 16:51:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="B24uFRo3";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 07E0E479F8;
	Thu, 20 Aug 2026 16:34:33 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787243672;
 b=lPa7qavm0aiQtL4I0/MkT44EGPpW06sRiwTKRVTDAsX3F74GKzabsoZPSk35moHa9fWYE
 tQ55zgMbSCGySdR8M13BHk7qxFRBlzOlPwX4w+NT9MrajWsqGnztVomYbsb/hqTRGo71r6Y
 iSyt63LOLlK6wPEd7tIcmrar0Z2aouGYlGX988PGAejav1h4O7AkxZP9DB64Jkd70gC2B06
 L+AWjC6NglyUA9Q3ngJXx5Y66j509Y2BxpqiO2/5Sw3pJUXHh/WImblLHtM3lyct6r6BWHs
 KoIMgyREHwlWqglToB9Kya5YP67zRwvaAmX97yowQUDvMiFCmdwmxhzyrVZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787243672; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=xoij1rKhFdJD5+LmFn+9RDZC5MZ7psm+4aCRvb4W/Ds=;
 b=eY5ZPfj4ILBBZ6WSkNkR4okpEia7L2zqz5nX5iREVsrfudTS91k9YE+ORbL3ZRi3ne3Ny
 XXkXSG2DC2yczTA4DX26Z+T+47nJ1v7cPcLmVdq9l343dh9vlTSlvy1oc8vW0a/vDIcuAkA
 PpfbrmAnFC3mIdZmCKhDoUKI0iNILL05rheXEFVKBXyIB4MP9eRFvrbyq/qOKiSqn1/FZPL
 XdyuORZ1mky9iV43Bft4wUMIU99NxawASRXFtu42k8DmVG/z5xY5MDZFo9KvuDIfx4bYloN
 +TsMbcAqjPatKL9u9cnaLjj2I9ZMe8gdVfGu8FpXRgH7kjA5eaXc5z4r4bAA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C553647960
	for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2026 16:34:30 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 228A710F126
	for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2026 16:51:06 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4955aa106b1so564935e9.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 20 Aug 2026 09:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787244664; x=1787849464;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xoij1rKhFdJD5+LmFn+9RDZC5MZ7psm+4aCRvb4W/Ds=;
        b=B24uFRo3Hzxj/IeGZ+KSNWWzGUoQIp79kKLk0zHDNtq+Am8N3GIRhVEFOExKPgt/jL
         6peMJnGVd7PmZagDvlGrTtX1KiArenrfn6feANKRuHbPB0II3qel0mBGfr/zr+M9+Xy8
         ZLqeq5jwgrA2LINmRQprB+7uI8EEAX3Y5FQ8dKsCQegOaJwsaBH9cPUMsh6si5IFedvR
         Cfbshl/gbf2Vlf6BS1VvOgcwuleFEoVtc+TFVUYLZZNkLuFKDWjHn4cTs6gzHOisLQz6
         eL8I0ZZEDOHqUDdP5cSlYN4zkmINkGdh6h9VKe0bzw+ykq/U01Uadu5awHz9NSPvWzwn
         ahmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787244664; x=1787849464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xoij1rKhFdJD5+LmFn+9RDZC5MZ7psm+4aCRvb4W/Ds=;
        b=BxDxEcaWljWgkPFEPf7RCekEkOKVL3UMIWdAtYjAB3/OORgtD7F1LckshCy97uKCiJ
         2eGarJaEg3W+xZt+MUD2mzMuP2KW4RUZuEquyvffIZe5T9fMUqfyJy2zLBd3XwSzlZPH
         s5L8pSej1T7szFMp8FYgIL1Ze74NLiPy1wFLCYCpGQ8k/T31gEyiWAwxnF7XNG9dRv74
         YdWvJ+EToUj5KGDfrlbP8mj9+UWQORp41aZIImiJOoIEvDkjvz0XPOA3UWk4RjgjvSsn
         na1U4WBnHsxvuQmuqKrUYfw7GcF4GPGnsfbti9vGDXflHhBgsID6o96dL6tyqlpAk5Q1
         GLfg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rppe2Ty9eAz/43+LbwhvL2HXrc/MLSapiewOIcKN9ICF+jHgADjcB3KHpTb1iwTcH4QLaQsYqWj@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxM96zx6x8oihUc16TDQTcH75vAwqxoqQ5zcxlzkTF7bI9XpCCf
	r/sVfqNxQCfGdtWRssQLYwrF625TzQ4uuzykOpBqExNrEBIgXtNjrOlm
X-Gm-Gg: AR+sD11jyWQFErg9+zU99KNT+hFHoYwm3y/gpwm9QbAioo1jFuHAyvBgSLEQrvW0B8j
	zGXnOwihOMADB01Cog+RBy7epBxoM7w7CgnwEkozp/FJH8Bx+361ajsHlMG7AQILFKToUyXcjLG
	MULrF1k0rQjhnUYQ41aOcuX9HwXYmFsSRO4H0R4yI6bwA+UHzVew9nCo3qCvNqoSB1kP2IiLxtK
	r+Xx2NJs/aT6MivaExlNCnM4owxCY3hc6TjBy0wrYHDlVeRSy+L55cSNDhb2beTDk6UIkCsmDn6
	qerxidBBo94fGMo8UIiyWU/EG9xv986ax/Udc/Erg3gEcP+Z1O5CzmNM2vpGGEHFwsbyq4PM4ce
	MFHCLirtUS6iJ41BmJBinvvgutFdycKMKp7/joct9dzcUNstEUFfBXBSkQdBrs34T5OiiHXQ2Ya
	v6ZNLBxcTdtAkF3IcVtpjNb8Oq2R9pEJ0PveugkRijdThs/1W5Of+GA7rzBgTHJqas9TE=
X-Received: by 2002:a05:600c:c8c:b0:499:af7d:b759 with SMTP id
 5b1f17b1804b1-499b845c91cmr3249335e9.13.1787244664550;
        Thu, 20 Aug 2026 09:51:04 -0700 (PDT)
Received: from fedora ([5.31.134.170])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499aa1111b2sm205307545e9.5.2026.08.20.09.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 09:51:02 -0700 (PDT)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/10] drm/nouveau/dispnv50: program pixel clocks above
 2.147GHz on GB20x
Date: Thu, 20 Aug 2026 20:49:28 +0400
Message-ID: <20260820164929.17117-10-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260820164929.17117-1-mohamedahmedegypt2001@gmail.com>
References: <20260820164929.17117-1-mohamedahmedegypt2001@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TBYRTQID4NDC3PU7HETEVTKFDUAUSO36
X-Message-ID-Hash: TBYRTQID4NDC3PU7HETEVTKFDUAUSO36
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/TBYRTQID4NDC3PU7HETEVTKFDUAUSO36/>
Archived-At: 
 <https://lore.freedesktop.org/20260820164929.17117-10-mohamedahmedegypt2001@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The HEAD_SET_PIXEL_CLOCK_FREQUENCY(_MAX) methods carry only 31 HERTZ
bits. Starting with C97D the upper bits live in separate
HEAD_SET_PIXEL_CLOCK_FREQUENCY_HI(_MAX) methods, which nouveau never
programmed and headca7d_mode() computed m->clock * 1000 into the 31-bit
field. NVVAL's mask then silently truncates anything past 2^31 Hz, which
means that every mode scanned out at pclk modulo 2^31.

No mode nouveau can currently commit crosses the boundary (an
uncompressed HDMI FRL mode tops out around 1.78GHz at 8bpc), but this is
a prerequisite for the upcoming DSC work, which makes 2.147GHz+ modes
reachable.

Program the full value split across the low and HI methods, exactly
as OpenRM's EvoSetRasterParams9() does (nvkms-evo4.c, 31-bit low word
plus the 4 HI HERTZ bits, giving 35 bits of range).

Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
---
 drivers/gpu/drm/nouveau/dispnv50/headca7d.c   | 21 ++++++++++++++++---
 .../drm/nouveau/include/nvhw/class/clca7d.h   |  4 ++++
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/headca7d.c b/drivers/gpu/drm/nouveau/dispnv50/headca7d.c
index eeaeb15aa664..678cbc78ca9f 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/headca7d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/headca7d.c
@@ -219,10 +219,11 @@ headca7d_mode(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
 	struct nvif_push *push = &head->disp->core->chan.push;
 	struct nv50_head_mode *m = &asyh->mode;
+	const u64 hz = (u64)m->clock * 1000;
 	const int i = head->base.index;
 	int ret;
 
-	ret = PUSH_WAIT(push, 11);
+	ret = PUSH_WAIT(push, 14);
 	if (ret)
 		return ret;
 
@@ -245,11 +246,25 @@ headca7d_mode(struct nv50_head *head, struct nv50_head_atom *asyh)
 	PUSH_MTHD(push, NVCA7D, HEAD_SET_CONTROL(i),
 		  NVDEF(NVCA7D, HEAD_SET_CONTROL, STRUCTURE, PROGRESSIVE));
 
+	/* The FREQUENCY methods carry only 31 HERTZ bits; the upper bits
+	 * of anything past 2.147GHz live in the HI methods
+	 * (EvoSetRasterParams9()). Truncating would scan out at pclk modulo 2^31.
+	 */
 	PUSH_MTHD(push, NVCA7D, HEAD_SET_PIXEL_CLOCK_FREQUENCY(i),
-		  NVVAL(NVCA7D, HEAD_SET_PIXEL_CLOCK_FREQUENCY, HERTZ, m->clock * 1000));
+		  NVVAL(NVCA7D, HEAD_SET_PIXEL_CLOCK_FREQUENCY, HERTZ,
+			(u32)(hz & 0x7fffffff)));
 
 	PUSH_MTHD(push, NVCA7D, HEAD_SET_PIXEL_CLOCK_FREQUENCY_MAX(i),
-		  NVVAL(NVCA7D, HEAD_SET_PIXEL_CLOCK_FREQUENCY_MAX, HERTZ, m->clock * 1000));
+		  NVVAL(NVCA7D, HEAD_SET_PIXEL_CLOCK_FREQUENCY_MAX, HERTZ,
+			(u32)(hz & 0x7fffffff)));
+
+	PUSH_MTHD(push, NVCA7D, HEAD_SET_PIXEL_CLOCK_FREQUENCY_HI(i),
+		  NVVAL(NVCA7D, HEAD_SET_PIXEL_CLOCK_FREQUENCY_HI, HERTZ,
+			(u32)(hz >> 31)),
+
+				HEAD_SET_PIXEL_CLOCK_FREQUENCY_HI_MAX(i),
+		  NVVAL(NVCA7D, HEAD_SET_PIXEL_CLOCK_FREQUENCY_HI_MAX, HERTZ,
+			(u32)(hz >> 31)));
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/include/nvhw/class/clca7d.h b/drivers/gpu/drm/nouveau/include/nvhw/class/clca7d.h
index 0fec6fc21d44..5754878ddc69 100644
--- a/drivers/gpu/drm/nouveau/include/nvhw/class/clca7d.h
+++ b/drivers/gpu/drm/nouveau/include/nvhw/class/clca7d.h
@@ -734,6 +734,10 @@
 #define NVCA7D_HEAD_SET_CONTROL_CURSOR_COMPOSITION_BYPASS                       20:20
 #define NVCA7D_HEAD_SET_CONTROL_CURSOR_COMPOSITION_BYPASS_DISABLE               (0x00000000)
 #define NVCA7D_HEAD_SET_CONTROL_CURSOR_COMPOSITION_BYPASS_ENABLE                (0x00000001)
+#define NVCA7D_HEAD_SET_PIXEL_CLOCK_FREQUENCY_HI(a)                             (0x000020C0 + (a)*0x00000800)
+#define NVCA7D_HEAD_SET_PIXEL_CLOCK_FREQUENCY_HI_HERTZ                          3:0
+#define NVCA7D_HEAD_SET_PIXEL_CLOCK_FREQUENCY_HI_MAX(a)                         (0x000020C4 + (a)*0x00000800)
+#define NVCA7D_HEAD_SET_PIXEL_CLOCK_FREQUENCY_HI_MAX_HERTZ                      3:0
 #define NVCA7D_HEAD_SET_SURFACE_ADDRESS_HI_CRC(a)                               (0x00002150 + (a)*0x00000800)
 #define NVCA7D_HEAD_SET_SURFACE_ADDRESS_HI_CRC_ADDRESS_HI                       31:0
 #define NVCA7D_HEAD_SET_SURFACE_ADDRESS_LO_CRC(a)                               (0x00002154 + (a)*0x00000800)
-- 
2.55.0

