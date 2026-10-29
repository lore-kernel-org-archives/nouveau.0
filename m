Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32607606A326
	for <nouveau@archiver.kernel.org>; Sat, 31 Oct 2026 02:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ozyfDH3F
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 03A36112A9E;
	Sat, 31 Oct 2026 02:10:03 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 593F748C40;
	Sat, 31 Oct 2026 01:50:45 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793411445;
 b=koHN2Bi9EbmF+ZhcE21z/BvU+qwUcR1EAeMtPr8Imc5RWBBzJN8wnKvV/4PgCTceLLIrL
 WbH5Muk5Bg5QiZJ/H6QYOiuhy7k84Xjvw3uZHnE14GuBH5YuJyosdp4nXFmEK8/YkeKQEM+
 U4Inepa1Loui+PMpcisiWxiq5NOXgnXQ0aPRRQpPkOFnrQBZY3ec4a/i7RolJ79cHa3a7Ap
 3sCnvRKar7t3MiTU0IlWhJ+HMR6RxyQ//r0FdaWw8RwV80Q9smSybAMBtsxxdnsF/PH0AT7
 5XxliH56bxSpnGyX1tcEX+o7VMWbG8he1okZXiDs2mknNY5Ess8KOffbeDXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793411445; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ZswYnDpjiPQQjT78JVpuuL0hR+s+VPAsr78sVKkNA/E=;
 b=fUNYXNogZqllvch99TKDZP3wC1m8R7RsAp2wkWeSXYRosRg2u3sxZgKig4PgA8XTnxyfv
 7FOO0Q7ZAAYgC51GHjzJSpwSx8pRSKzuZUzp8G9Vcra3IEHld1sw5sZbFsEK593uVp+5RgV
 wj2DICLtrji+Sx+RpZR4XpRzjsndKfub0Wm8WYd3wMiAfTmHhLKwLvQo4awnIV7lwAPuMe5
 GYj0WbYkNXOh58bQgc7D4aQKHEsE9vAC/zOAAvi1K9VzZDyTFgzbIeHRn+pBbNGq3QtMPU7
 cDSzqTrM3EV2SswNWqTSmbhtoQa3YgYP3BCIZwACj0bfZuc79bx97j/emzrw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 1953D46CD7
	for <nouveau@lists.freedesktop.org>; Thu, 29 Oct 2026 09:59:29 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B6A7E1121A9
	for <nouveau@lists.freedesktop.org>; Thu, 29 Oct 2026 10:18:33 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-c247f6687dcso270273966b.2
        for <nouveau@lists.freedesktop.org>;
 Thu, 29 Oct 2026 03:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793269112; x=1793873912;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZswYnDpjiPQQjT78JVpuuL0hR+s+VPAsr78sVKkNA/E=;
        b=ozyfDH3FdbwDIpko2PaycEUgBDyeSZyfjretx9hffj0Q3mwFwWc91nL88u0IZX7p+8
         VTA3mKyebO4QNXIO/dq6jM8lzdLXTdkBcVq9ZutXfn0N/vzp+v9QWnBaViz8BQuQBarO
         T0YVnhHm3NxLoOO8A0VhbI1lDpHJf+T+Xer08doLcJi/eLieZufLPKEOMLjOx/AaJtml
         KCC4rnv9kMptgbKA3+9g2HwNXfUpFq2/bZPTu3VGDmC0jylbO/8m4pTiNRnRVSF0gYd3
         eBnlRllcJZWp9hFfT0q0nIyI3V3vBTlHcNKr86viXveAZPa4H15UJKLhf4gfmvsJ3Pq8
         pgKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793269112; x=1793873912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZswYnDpjiPQQjT78JVpuuL0hR+s+VPAsr78sVKkNA/E=;
        b=iR2yuVoFxBqJnYoFpozET20xBmb6Tu0r2PUH301x1yed81Gt2Qg2sRvXnlw8CF+Ouf
         ZQrU7RjXjvSAvWb2BCj26uKKaN81plib8ntISj/zAMBn0I6TgONUxR/QwGAycRVHXqBk
         QW9oHRcRnRsSJ+5sCc+XCXrzV1dZ5MCHWBLiiGV0eJCLHhT3OFn6IF2PZctNm86/Dtcb
         qeSC/n5rR5+W3EVsZC15HbZd55nS0JPLzWQs+g72dvxluY62zliBqJLqGHU9W52/klCG
         bzD/FPT+ZT+7z8X3Pqf9zcDmzYqyNCuN/lGFKgpeapdHwJimthTdin22zpI+C9NsXR3l
         QHdQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBx5RxgaKTW/0DDVtSC1Kssn6XBHFcpxbfQGyZphwLgxwrjK6NtZMK2fcGVMKk++20ozjiz+Y8CB@lists.freedesktop.org
X-Gm-Message-State: AFq9FYKrL9/uqGkUruVotnqe4o/5bzpjNP37JWzvA+TBIGE+14dEXDx3
	Fu4a/wfAwd8bfwOrsBRqFPnmDyqX/d/0+5fC4D8Nvshgr6P3w1DSk7Ng
X-Gm-Gg: AYBFou27U2tyeRq+JB3JBzqe8QuczEzDBz2JUdwMQj46RiNzdfv1JCSo8u2W4vZxL5l
	VEn3fuvuJcdDgLQBiC/NXWbkW2REjXuUHS+b2oEbR1J3dbiD4NAOUwWTKKJ8GAVKhIbogpgN/sK
	LOf5gWro0e5T1/To12f7aXlZS4Qds6wrfXfPnK9c/tpHADpFb6WIh+XrmUHH4HCH3KHjm14ydVM
	ztSJrjzwogiHmK8v27GtXNP+Hf3+Xnj28KkOYZUjmY2wzfYkRGHehLOWo/S6CAdJJah0Ehw2NII
	ifmqWtxmoJ7iy79BHkda6zYsbwtBl7lPH/Ga8exN/CZSDm7UeVjD4RMN7+pSE4z8nLbaZ/bE5ng
	4cW3PWvDwk74ZS5/+BP/OIl9XkDNdlyiqrfNpsvAvBXAJAX5bbh+L3XKTqrgj6pDCHjf9Xi+2vz
	FpOVb1EilIPa5EWXYSjLhZqdfFLxLaQrEGLX4jffiRPSpot91bt1fvD3w55K+Yu/BnvoPef3K4R
	5KIFS+HR+oy3hmfId8lFJmybl0O3DJnxC51pbwcagVxIL0x5ZAwaY4CDsxAAppAope8a1rC6eRm
	itggQswUQG+KGx2cfn8bCoJb094YeqB6mk/edvhDG8Wsqa2b1v/+v0xszYuOxYk=
X-Received: by 2002:a17:906:ef03:b0:c2d:c98f:4824 with SMTP id
 a640c23a62f3a-c49bdf32b3emr416211766b.30.1793269111958;
        Thu, 29 Oct 2026 03:18:31 -0700 (PDT)
Received: from localhost.localdomain ([46.205.195.0])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd66c6dbsm712145966b.59.2026.10.29.03.18.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 03:18:31 -0700 (PDT)
From: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/5] drm/bridge: cdns-mhdp8546: Use
 drm_dp_enhanced_frame_cap()
Date: Thu, 29 Oct 2026 11:18:23 +0100
Message-ID: <20261029101826.72773-3-dmitrymalovanyy@gmail.com>
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
Message-ID-Hash: XJES6H3TYEUP4TTHMA6CB3WIHHQGU2ZD
X-Message-ID-Hash: XJES6H3TYEUP4TTHMA6CB3WIHHQGU2ZD
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XJES6H3TYEUP4TTHMA6CB3WIHHQGU2ZD/>
Archived-At: 
 <https://lore.freedesktop.org/20261029101826.72773-3-dmitrymalovanyy@gmail.com/>
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
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index f47717bd1..8cab9a3e6 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -1375,7 +1375,7 @@ static int cdns_mhdp_link_up(struct cdns_mhdp_device *mhdp)
 	mhdp->link.rate = drm_dp_bw_code_to_link_rate(dpcd[1]);
 	mhdp->link.num_lanes = dpcd[2] & DP_MAX_LANE_COUNT_MASK;
 
-	if (dpcd[2] & DP_ENHANCED_FRAME_CAP)
+	if (drm_dp_enhanced_frame_cap(dpcd))
 		mhdp->link.capabilities |= DP_LINK_CAP_ENHANCED_FRAMING;
 
 	dev_dbg(mhdp->dev, "Set sink device power state via DPCD\n");
-- 
2.50.1 (Apple Git-155)

