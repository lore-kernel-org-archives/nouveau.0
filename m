Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476FC606A323
	for <nouveau@archiver.kernel.org>; Sat, 31 Oct 2026 02:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oj3sQTgg
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4BB50112AA8;
	Sat, 31 Oct 2026 02:10:03 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 077CE48C48;
	Sat, 31 Oct 2026 01:50:47 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793411446;
 b=eHVJjqprxtBFFgcTFsZeOzglxgrBWaA65wpLrW5LlJDv1tfvYyxrIC9zmVGb4SvKRTpG4
 Z4d/5VBgr1sijQNqFG6l82c0z5Yxwq1xv/pSYGVKXpJ+DjKM3B8Ga8QPdJ95ZgrU7bj6UTv
 IT9xRJf436lHRCEfsYntA960N27nVSuclMQThKnsz3lHruHrKqhwLJf9K9437i9lLdVfafD
 CQszZX3C1A6nX4N6ULBKUP9vafDVGGK8Sn+KWtdMofhJtoB4zcrCz7b/A41rBJKhLTudOJd
 bQ/jm6WeOYi2pR1ugOw2ygB+KATB9/Uy93EKFzwDkD5WmBLKrxb23xjQnjpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793411446; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=tLSIccFHorX+6O5ooGIFQ+bO/vHG9UJYFlcd1fhhBi4=;
 b=s6bQbKpK1/+Rsv/RpqLpPaBabrNQZ9OcW1CzbXjmUDxwr0Lq0wYwQ44B9BdOXm1WHRGXP
 pGUZRpyD4ZpFNo5q2M3xGJTeubYipxNmrFZrSIJZofmo6TuVHdkTvq9W5H+1u+SJEG8xybv
 Fp/xpVyVYRPLfglnHC0nEN3WzYpEb2dIPgSO/LzWjkWI4NDHcipnnklC7C6uRcRq91ljqgf
 Gg32d9EQBPEHwz9AcuGZmHYZQTLSO+Kfwq4mTwJx8mPbiA06beyUyRCbHDST0tAPHlCmRzp
 I1+soK61E6g5mWhHTBZyF63Z6KZ/vLttGZS2S+EaMqoOIp9aCGbNVSesaQsQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 6B64D46CD7
	for <nouveau@lists.freedesktop.org>; Thu, 29 Oct 2026 09:59:32 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 13407112195
	for <nouveau@lists.freedesktop.org>; Thu, 29 Oct 2026 10:18:37 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-c169ae1cb26so86601266b.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 29 Oct 2026 03:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793269115; x=1793873915;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tLSIccFHorX+6O5ooGIFQ+bO/vHG9UJYFlcd1fhhBi4=;
        b=oj3sQTggVxBTQb+EwMR674xBEYVqrgeeYxBTMEmU40N2bhWvmCDOTsJtB+pT5EHg8D
         SWHmView+pRyYj9pglW1CKjzTPotiynWyllf2XnFUs2yAGvLlJrsoecTY9/DHEGr0Rug
         n080YjxOkGDc5bEwIvcBUqlnqenjnkaKK8noPAjflki6q1gFXMy393y50dnPoRPUGM0V
         21L8Pg9VoBK9kEwTI+AWnfZxKVsAn6gk96Zt/qFpGUkh4xQymtMWi7VrrmDCqV/ynaJm
         LW6jWPftot8RtoxYaIyGQM+Q3hPLVPKaURl1WjXx62OM13yju1BTfR6wqF/D2e5CGbzN
         +grQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793269115; x=1793873915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tLSIccFHorX+6O5ooGIFQ+bO/vHG9UJYFlcd1fhhBi4=;
        b=jih/hYWN5GxtcrXoLZKw/S6kLR5cDsAArEeAjF4RxEJpS5eX3TGBS4doj4cJFEoB1K
         qtqFjfkKrtgWG7PHCszIfYsuVQgGt4mJOHTzihFHZovDA6bBQkfZzArezk/DvolZoXyU
         6uMD/aLA4uzkgUr4R/akRg2BaOd6NxHyOJhzFDNWpOo56gi/GRjr8aPgZ0HF1VHdJ0Br
         W1irzdZgcwQf0uPnji7Li4ZpAElx2ukrSEDl3bDBy9zmbzA794or/GKaH3qIKNqznZah
         BYcIIjpX32PGYzEpBikvyJqUGKqSjeXlnauZapWx6EPNVi7v8WM+0mtgyXs1v7Ud6Zvn
         a/9Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBwDdqF0Rmuy4C0hdy1scyFx8LigRdm3bxfZzXorvTmYvKtd/YXLwchIBfe6m9xAbeE2opXYmNDs@lists.freedesktop.org
X-Gm-Message-State: AFq9FYL6YiJMG6DvuawiHcpaGRBWf5caVIf6z6zrvfeud2o1VV2hgIMy
	0zP2c7X5v1DWKFTobIAQUTvgkSH9dvJ2WRKTQfNDPVPg2ZjuC/+WjmKA
X-Gm-Gg: AYBFou1dsGAk9+Q/nIwQsbHPDnHc1sVQPQoJkgVl2t4AB4IqD6M9Tev0j0tqi+h6+wV
	pj0B6mqJQa2OcqkZPT1Tl3ckpwXrE8quaU7yXFUEbKmzMdGwj2nkbyuOb02FyzEbILjyQ3VhPeH
	IOcqsGIgq1lLd3ohuD/WXKGpCT6x92ueH6d2HT/u4wIB6nxullz2OM6CUIXFeaCdGj24Q4SVodf
	kp1CK65K/B9tbVphoXCiS0cmyDMd1ouqBUq46fX1SVaZjlD+NDIihOchVVJmnbK3Vd90+KHHyGk
	A7MkiiGlaAFAxCUZ3rNN4nhQwRQQWRGBGMEcP+k2SC/uCvHFNl8YyJHhellynPYyxsrgGB/JyHY
	TjhfXG9WIOsEBNRarx9AX2Lb+wlRKmPo+k0Mq8OTvwEsT1x5JyEGkjMPfADEmzdkpIjfodtEpCd
	nZqm31o0CFaeYkSj4M1PPU82OaTeZ8xj7v+JQG9u1yhqOSK8+CedFmCC3Y/jpe9lY1OPHHa7Ozx
	5o1cudWWXl4DnDBgGzHb26kwzZZ95MIodw+UiBZ5LheCiGcP+tD+3QDCcsGATGvP1w23Vb1v88O
	gscTbKnbeRBIN1ZM4L/ooWu19kLrJIYfak9gqas9d3S2HC57DfqFq1alPjTszyM=
X-Received: by 2002:a17:907:80e:b0:c2e:62af:b6fe with SMTP id
 a640c23a62f3a-c49d11324e8mr178671366b.8.1793269115238;
        Thu, 29 Oct 2026 03:18:35 -0700 (PDT)
Received: from localhost.localdomain ([46.205.195.0])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd66c6dbsm712145966b.59.2026.10.29.03.18.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 03:18:34 -0700 (PDT)
From: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/5] drm/gma500: Use drm_dp_enhanced_frame_cap()
Date: Thu, 29 Oct 2026 11:18:25 +0100
Message-ID: <20261029101826.72773-5-dmitrymalovanyy@gmail.com>
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
Message-ID-Hash: 5LW6NSQ4PEB5SSDZVUTMQ7UERKEAQXSX
X-Message-ID-Hash: 5LW6NSQ4PEB5SSDZVUTMQ7UERKEAQXSX
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5LW6NSQ4PEB5SSDZVUTMQ7UERKEAQXSX/>
Archived-At: 
 <https://lore.freedesktop.org/20261029101826.72773-5-dmitrymalovanyy@gmail.com/>
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

Use the helper instead of open coding the check, so enhanced framing is
used for all DPCD r1.2+ sinks as the spec requires.

The helper takes DP_RECEIVER_CAP_SIZE bytes and gcc warns about reading
past dpcd[4] (-Wstringop-overread), so read the full receiver caps like
the other drivers do. That is 15 bytes, it fits in one AUX transfer.

Compile tested only.

Signed-off-by: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
---
 drivers/gpu/drm/gma500/cdv_intel_dp.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
index 8d0626ddf..0973598c7 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
@@ -262,7 +262,7 @@ struct cdv_intel_dp {
 	uint32_t color_range;
 	uint8_t link_bw;
 	uint8_t lane_count;
-	uint8_t dpcd[4];
+	uint8_t dpcd[DP_RECEIVER_CAP_SIZE];
 	struct gma_encoder *encoder;
 	struct i2c_adapter adapter;
 	struct i2c_algo_dp_aux_data algo;
@@ -1070,11 +1070,7 @@ cdv_intel_dp_mode_set(struct drm_encoder *encoder, struct drm_display_mode *mode
 	intel_dp->link_configuration[0] = intel_dp->link_bw;
 	intel_dp->link_configuration[1] = intel_dp->lane_count;
 
-	/*
-	 * Check for DPCD version > 1.1 and enhanced framing support
-	 */
-	if (intel_dp->dpcd[DP_DPCD_REV] >= 0x11 &&
-	    (intel_dp->dpcd[DP_MAX_LANE_COUNT] & DP_ENHANCED_FRAME_CAP)) {
+	if (drm_dp_enhanced_frame_cap(intel_dp->dpcd)) {
 		intel_dp->link_configuration[1] |= DP_LANE_COUNT_ENHANCED_FRAME_EN;
 		intel_dp->DP |= DP_ENHANCED_FRAMING;
 	}
-- 
2.50.1 (Apple Git-155)

