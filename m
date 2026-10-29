Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960A6606A329
	for <nouveau@archiver.kernel.org>; Sat, 31 Oct 2026 02:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tut+Frw4
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2AA01112AA5;
	Sat, 31 Oct 2026 02:10:03 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A57A048C43;
	Sat, 31 Oct 2026 01:50:45 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793411445;
 b=CUEpsjL4cDl9+Uag/LI+WatZLxmh7ndHQIC8yqpiQP8P60Xc698ggPkTyER60WmMYF20X
 LsdwymaTU5lmr8DJNAuwBAq1iSiirJWTJLab/2dm6GYbkoT3A/SPwtmmZGOMrm1xdmurzRS
 mvQIjlMHsJI4Z50FWCcxeik0KGO0Oeivqqfz5R1uV98SpQ4a3Dia4qbFQ+qJXtCQe1TFBkr
 vtcvY9TrJzlri15DEaTJnlMhaq1ezMy6j0qFRmj1oHYC1v3lIpWMEiZUWLAbmeG/Go4haot
 qzBjlel0aFb9kLRJ+jPn3ChSPVZvqjnMr+zzfg/8oz7jvP+inwND2HEfbUHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793411445; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=7eDSUJln09vjqS6fT78Hrmt4ANao45wYJuBLIsNkp4w=;
 b=0uFC4ryj46jxH2GyqLa+yQZi0Ay3ASRsFFkKukhKvOtOX1LSMo3N+/OHtgBZjKHg38pEy
 5G/w8GaB0dm78itHJdmO5HFaph9Ez/80sfyQOnZ0UW/sE/fUE+NPaCeIODJh111Gc1yese1
 AzXGp5F+Pr9BPJMd4AhIATRr+GwbcWclihEiqruc/3fRS4Zv8MqQupVmwLesIxMSqFBxkiZ
 DfstebjrXjuHOpW5n9SiNxjp/esiJwHYyrokepKgeVyova+pjtX2WN9E98qsnBkVszk5o0x
 iLuavFrOdnvINTtNYB6+rigEO+lsVcou7g7Z0z/Yld4jPUmXtsQrxO0jilbw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A046B46CD7
	for <nouveau@lists.freedesktop.org>; Thu, 29 Oct 2026 09:59:30 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 49CDE1121B2
	for <nouveau@lists.freedesktop.org>; Thu, 29 Oct 2026 10:18:35 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-c418e215671so249523866b.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 29 Oct 2026 03:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793269114; x=1793873914;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7eDSUJln09vjqS6fT78Hrmt4ANao45wYJuBLIsNkp4w=;
        b=tut+Frw4Z0M7O1yE3o9ovwp+DClL/nNJDygxd/gJOoLA3bPIS1tNkB86/7iy/TpZYd
         1nUIGpi5rKFFeVuPCbAMF/8fdwd8Ro3NX7r9TmMhVPzOYTUg7NaKIeCCCU8iJDYStuWb
         9WlrQ7HEIxaVI5tMUMAUJwcmMmLXaG8qGwUUFWJ4P+NZIqiYDAhlHa9j2o8WZUU+p+V2
         AMxr1XgKKGxpOatbRfeMofsoeGtaDhLxJ5iFdE8bYn+Jcvy4SC3cO3zc06wDu6hkPsd7
         QU3VP0sViiboHaPf1ukqI0i+kTaqOU2UmxTUiU8mdA3hGj0ZpNnruKn9dJgMkE5jwIwW
         v3wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793269114; x=1793873914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7eDSUJln09vjqS6fT78Hrmt4ANao45wYJuBLIsNkp4w=;
        b=PV+w0yPd45GG30Eh6rVcYbC9Dgs+MzfHxeLo416fT5tt+uPCoy571dYNRbXfoafU5T
         hUS4kdDUzf48QA559YYzlp9NnBwi+EFqGB50BVv8/S5lUPRUHbFkexNzcfJxfVoJy9Hf
         xPeLmc9OdZIG9rB14fpsHiXmDBwu5eMfWwxG6yycrFT/dDeMij0UbObQEgvo0m71FbiW
         DAgakEHd6kg7+KuyoyIdGtmMfEzcQUfoL5w1JFp8ME20HDGDErYp5eyDdI5hfOd1aA8d
         2nwutQZS9+2i2zQ3RzoOx2FDEc4NnnL5mVT472e4zXY1+JTBN2YIK9MSnJSSQcL7EdOB
         U1ZQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzkO+eoxjVCeBGcS0/xDw75FoMPPBghfP7cDQuzWQt9vCm0Rn8x//4erx7Yt4iRUyHpWtrKArIj@lists.freedesktop.org
X-Gm-Message-State: AFq9FYIwdqpDPLulNzPzE7tcJywafFAPZZh/ZskIhrU8j8OuN4HAdoNI
	L+Rmbvq6AFsPoBDiF9JCBHeGNPSUSRcIBcxoV09+B17FvUjwNQs9nqoz
X-Gm-Gg: AYBFou3f/DptYbt3lIUxg7d++oy5KsS2/gCO/Pq7j9IZPGcARWd9SFzHGK8giIVxusI
	HiDAjMfHtix7REZCyDYze1iEXWUdmwd80EzK2fxGZZ+mThVReNCa57TXZJUZD0i9ax2oNvZwdPD
	HybBg9efBvJbZtlfCEifBkecHL3QRiDFYDkEHJj2aOBiMwusGThVQI5iwyu1S/BuXGg/Gg5w7TD
	cO+2Zf3fDFRR5g0W6+NijznSqtY1bp+XQ0IdIGyQDdP/jQM7joP6v7251n6ef6/OfhhTERvsKZc
	ucgs9Sz9F1d3XXl85+gRoS89QLyrt1G0ANjnGJcf4gQIuA0Tnhg4o8z0cIN9FQylEAjVDldE78S
	+9+7qxEaXP1v/aqDCm/LW0cjjP0bgl86UnH8ZfkIhr27uIPdbV7GSxd893zxNZsOMJY5IlEoP8C
	yo3HQf3rGfA5kl3zIrhUYNF0bgmzYT4OQDzNbq8pD+McRC6BL36Q4dvOPXwURGyXip7E3+pSIC0
	s4REqrTvzLPDFwqNQehZEj1slcaaxNDtJkDMTrZ1e6J8MPe+ToPeI9de9a3lifIJJCUVMYh48N7
	SPWoIaOypPmQjMP2TySOqb4xbDxW3UU8vJ3iAOo5dtm2bQhhbpFxHcW0e+KEbVc=
X-Received: by 2002:a17:906:f581:b0:c49:8fa2:4a22 with SMTP id
 a640c23a62f3a-c49bdf569b3mr418814266b.41.1793269113505;
        Thu, 29 Oct 2026 03:18:33 -0700 (PDT)
Received: from localhost.localdomain ([46.205.195.0])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd66c6dbsm712145966b.59.2026.10.29.03.18.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 03:18:33 -0700 (PDT)
From: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/5] drm/bridge: it6505: Use drm_dp_enhanced_frame_cap()
Date: Thu, 29 Oct 2026 11:18:24 +0100
Message-ID: <20261029101826.72773-4-dmitrymalovanyy@gmail.com>
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
Message-ID-Hash: M7DESYMW27PXWICTDMN3TO5HFK5R6Y4A
X-Message-ID-Hash: M7DESYMW27PXWICTDMN3TO5HFK5R6Y4A
X-Mailman-Approved-At: Sat, 31 Oct 2026 01:50:41 +0000
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/M7DESYMW27PXWICTDMN3TO5HFK5R6Y4A/>
Archived-At: 
 <https://lore.freedesktop.org/20261029101826.72773-4-dmitrymalovanyy@gmail.com/>
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

Use the helper instead of checking DP_ENHANCED_FRAME_CAP directly, so
enhanced framing is used for all DPCD r1.2+ sinks as the spec requires.

Compile tested only.

Signed-off-by: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index e136ac71e..d798a3db7 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -1651,7 +1651,7 @@ static void it6505_parse_link_capabilities(struct it6505 *it6505)
 	link->rate = drm_dp_bw_code_to_link_rate(it6505->dpcd[1]);
 	link->num_lanes = it6505->dpcd[2] & DP_MAX_LANE_COUNT_MASK;
 
-	if (it6505->dpcd[2] & DP_ENHANCED_FRAME_CAP)
+	if (drm_dp_enhanced_frame_cap(it6505->dpcd))
 		link->capabilities = DP_ENHANCED_FRAME_CAP;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "DPCD Rev.: %d.%d",
-- 
2.50.1 (Apple Git-155)

