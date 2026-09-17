Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC74C982D0
	for <nouveau@archiver.kernel.org>; Thu, 17 Sep 2026 21:52:00 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 48A8D10EAAD;
	Thu, 17 Sep 2026 21:52:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XRbfhgr7";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 24E0848275;
	Thu, 17 Sep 2026 21:34:22 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789680861;
 b=uAhe7tooqk9D6/CVdF4ZhT30d714WKG6RM/wrGy/jR2bjVLvhxZ20mVVtvVJZRgzV32WP
 YEC5lP1mAIXfnIOC9mekmR3lpuJ5H0TGujFsMVJv4e5RdXDgqllrXb3WlwAP3Ybr1bmAA9y
 OBEHiaPdMpetTfGRmsaZtHx6GTmiZGn3VlouMMAAfZ4YPbMqGj4O9jryjgYrJ0drqP7lAy+
 VIhBQWDmyeAgQKgbaTWRRlcH8EBr9qkEvQHsMBDWbjGY2eZdzeCpxlN1vaMw72Bz3qyK80q
 2WiqAyfldJi42LfOtY3Jb7zjoW+D29mu1D01PQRvLlu8lv+IxzENxsr+0hVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789680861; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=OBna6qkqR2LOIJTkCDKUQXTi19qvcho2o29JezHr6+M=;
 b=BrGdzlVTZ9xB3NCwtzrZ7MmQcdmOt/UnaTPnqSlVlagw3m0TFsrOWz721RIcONHyWtSn9
 yk+Xdu6o2F4bpNoJJoYIiRfdktyZlz7Q+bkuEXcgwrZPnTA6FHM7ImvvR+hfvrStBF/6XRS
 cj8ZwmKyUpi0NaUMDaGX3hHW099wCfXo1qidqQsk2YOhNtwEBX9We00qEy+osR/DSrFumyR
 WzYHQcG7/YO3USK451Id6EQGYUJzckc/j8USncKaE9WNVOr7a3c97EeIVRr1TUb7K+/lyxx
 gBrEGvger0YqHWpc8MxQ63Sk56tqlVFyB18/vXcfK3w5K5JgU3Xi/AxRnGuQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 80F1148233
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 21:34:20 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com
 [74.125.225.76])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 754C410E942
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 21:51:58 +0000 (UTC)
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-48449f62b93so15851f8f.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 17 Sep 2026 14:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789681917; x=1790286717;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OBna6qkqR2LOIJTkCDKUQXTi19qvcho2o29JezHr6+M=;
        b=XRbfhgr7bdYuO8sJ7G/dzE/mr4+LgSeGWJlRjE8FNtOBfzd8zltapgnZXct+acrbYG
         vPFBCkixINyBzv2I7Z+67y/A6n2xnzNT9+4UIKf+3sA7qFtknaQnDQI+D6Hgqa2nmTtL
         UkbRYCH1EnoyhHHMdJG23SGd7Ct33kFcOYD4LxIeBqRuA94UxM16PeQrsu1Lkw+dlZHV
         sVmOS2IzqrvCDyyf8mzksPNbtrvlQeL6CAoFk/BrnaIg+yz1lnOV4Jo5U+Ipc3cZxD5p
         HFhbyUQbuF7elmplVqwxjgt1nvFiK9Yff12ld/9+dr6Z/OeTM/yqAMolZ+p3nAElbxvE
         KRrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789681917; x=1790286717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OBna6qkqR2LOIJTkCDKUQXTi19qvcho2o29JezHr6+M=;
        b=WcFDR5U8icZe1WjrdSPPxaviAltIj+M7gbAiJ3B7lbyHB7JgkQcMi3xR2JLSHPW00f
         GWE6EHJZGZS+0+qFKo6A3MeH1GFUkMBu11o9fX6vRbaxSJO5EPyKpZQFW7MC6FkOM+oD
         ZQkfmXSoQG1m4+TknPYU+GvULCvM9OZDC8P+F/QVyCmRR65RczBHYcQooU314SW8ZylS
         uyPrLRTDlVEV7gIYcu418b94hHr+K6Pq+BvfgF5j3C8dY3TZYZ5gYwyvHSoHsMud8X1c
         OQJbXfTuwWDqQe/EeZ82yQ1AK4cUFUzbti+PjZqzg/TY5YzRWKrIXK37GtyYcZDZXjN9
         6Q/Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBwDv/MWz+1v3bylCD9aC72hYOrGFK8GO85esv5JnucKi9W4MlV9/UZG2swQfkOYh6p9fE19ZOVF@lists.freedesktop.org
X-Gm-Message-State: AFuF++nqRYJrCsm0igheey8p8L+wogXxTywuJ6XIzYm+in8hd0mq3hP5
	BlblfMRKH7g6tumKY6vB4IA3otvtlJmvwpSQWi2/lUEfFIXLpBM1FGVZ
X-Gm-Gg: AYBFou0ATKkAsFmYctTcVgX2g8lKfPaQaBv/tVHd3wCBJp7m8X0EiWjDnnafAIPLFec
	szOyYchpe0cOWPpv1yCuCgq+uluknB1MWVJCxe1/GaLU6bXj5x5eGd1vNXX5m1wtcMQzfrqrF57
	g8/+h3CLSJ3TKEdNb+XEOAaruV33I6UyoavMdWlSgqUVScrjj/8UquzFWcIJU8gVppac5o2Nezw
	eRjlmvnwrJ6KVFBeV8q8eqxqcxpTMcDQrMm9/g9fBrvuU+5q5/2qGRVmvcmbJyIJTm8o3ingru1
	31J91P4jrnbzoPri8VkBrrcz29cc9KICGlb+8JHYI1vZCAGy6d1O2JKLg4nvDhVlUHcesg1zm0t
	GfkEuLCvTAWvWiJ70vR+cUhOhw7K4ziWnWKSdHEl+rVbLOsArDWnR9SfvIH7Tqyygj+9kiXZ35Q
	FyWyZFfBE+d2HmAOxV98OPo9uOdNCfYy03dbD03nGXI5usmhmOu/jRsQuZa8ElmkqOIKekf7TcY
	bgYxBze3G5UhKP4WmFRhsFUp9mj6WDbNWwJefvt1TJPTWlYGKZcCBy7U9JPcg==
X-Received: by 2002:a05:6000:2505:b0:485:8ea0:da8c with SMTP id
 ffacd0b85a97d-4871dafc15bmr673423f8f.16.1789681916606;
        Thu, 17 Sep 2026 14:51:56 -0700 (PDT)
Received: from kbuild.local ([46.10.181.108])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4870bf344fcsm19736579f8f.26.2026.09.17.14.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 14:51:56 -0700 (PDT)
From: Tano Dzhinski <tano.dzhinski@gmail.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2] drm/nouveau/disp: don't reject HDMI config on cards
 without SCDC
Date: Thu, 17 Sep 2026 21:51:14 +0000
Message-ID: <20260917215114.1136715-1-tano.dzhinski@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917135051.47683-1-tano.dzhinski@gmail.com>
References: <20260917135051.47683-1-tano.dzhinski@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CGFFXQXWEEYHQFOWBSZQ7WPH6OJIRZQB
X-Message-ID-Hash: CGFFXQXWEEYHQFOWBSZQ7WPH6OJIRZQB
X-MailFrom: tano.dzhinski@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Giuseppe Ranieri <giuseppe@ranieri.dev>, Simona Vetter <simona@ffwll.ch>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Tano Dzhinski <tano.dzhinski@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/CGFFXQXWEEYHQFOWBSZQ7WPH6OJIRZQB/>
Archived-At: 
 <https://lore.freedesktop.org/20260917215114.1136715-1-tano.dzhinski@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Giuseppe Ranieri <giuseppe@ranieri.dev>

nv50_hdmi_enable() passes the sink's SCDC capability from its EDID
straight through to nvif_outp_hdmi(). On pre-Maxwell-2 cards there is no
hdmi->scdc callback, so nvkm_uoutp_mthd_hdmi() rejects the whole
configuration with -EINVAL, and nv50_hdmi_enable() returns before
hdmi->ctrl() runs and before the AVI and VSI infoframes are sent.

The result on such a card driving an SCDC-capable HDMI 2.0 sink is that
HDMI audio silently stops working. Video is unaffected, and nothing is
logged, which makes the failure hard to attribute.

SCDC is optional, and the hdmi->scdc() call further down is already
guarded against a missing callback. Requesting it on a card that cannot
do it need not invalidate the rest of the HDMI configuration, so drop
that term from the condition and let the existing guard skip SCDC alone.

Fixes: 6c6abab20b99 ("drm/nouveau/disp: add output hdmi config method")
Signed-off-by: Giuseppe Ranieri <giuseppe@ranieri.dev>
Co-authored-by: Tano Dzhinski <tano.dzhinski@gmail.com>
Signed-off-by: Tano Dzhinski <tano.dzhinski@gmail.com>
Tested-by: Tano Dzhinski <tano.dzhinski@gmail.com>
---
v2: restore Giuseppe Ranieri's original authorship and Signed-off-by
    (he posted this fix to the nouveau list on 2026-01-17,
    https://ratatoskr.run/nouveau/2026/01/16963412), per Lyude's
    review of v1. Added Co-authored-by and Tested-by.
    Tested on GK104 (GTX 670MX) with BenQ PD2700U and EW2790U.

 drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index 377d0e0cef84..9887b3898505 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -253,8 +253,7 @@ nvkm_uoutp_mthd_hdmi(struct nvkm_outp *outp, void *argv, u32 argc)
 
 	if (!ior->func->hdmi ||
 	    args->v0.max_ac_packet > 0x1f ||
-	    args->v0.rekey > 0x7f ||
-	    (args->v0.scdc && !ior->func->hdmi->scdc))
+	    args->v0.rekey > 0x7f)
 		return -EINVAL;
 
 	if (!args->v0.enable) {
-- 
2.43.0

