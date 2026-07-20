Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B38BC44520
	for <nouveau@archiver.kernel.org>; Mon, 20 Jul 2026 11:26:13 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DBFFD10E8B9;
	Mon, 20 Jul 2026 11:26:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=baylibre.com header.i=@baylibre.com header.b="gOcpCDff";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id AF3F447240;
	Mon, 20 Jul 2026 11:10:46 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784545846;
 b=AwAJ2/BTpRPOBkahrIAnXQQ+ofJzUrSTdufmqI30yI8F2qKj6gfNMHGU6CwkAfoZsS9O9
 EEKtJMX5CoPPuv8xJFrxwnEeJO/v6bPC4530j88nWREBqd9nZ3twsq067gplcIanlMEIWfE
 YS0a0PXyJm/A/7nb0X0YMDNVVE8hCNhaMwuerKfmBZt86VS16o6I1IAh17Dd43WoLI0HhTo
 qGybB4FxqB3Hq374jwL4pwPxPMmJCk5Im2Q/3nVoy3ff9sF0bHHUXKEkIITVsmhwbuS5Xnp
 v3E5wba0oDjQmtUNVVAxGF2n3ebH4R4QPVoogYyOyalkBRBfbBct68Bwpuyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784545846; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=yj0kJxzJSZM6leFPQr41NPOQEAzzRxTMU/d+FHoaNn0=;
 b=dByo+EAdQ57CGbtRaPGEw3j1EWYXPQQ+NR2OfrgN/VIFt50BqQCHKmGMQZgOAi3em/uBi
 oVyjJIe3eFWiyTApNtgWBT8sZDlAjMZB7qkjzqEnNVRW7c8J54q2Qk+6fP3wH6WavpvkkUV
 ssPqgAhBkqo0GgDBIy5aWvOUPg2U0kMY0WBmcwapiBcf4JDio5HFnRRRU50PyKFZEH/saiO
 G9uK+BNQYaH7KX4SNILOOPl90lpTP0dAqO9CcOy1Mf5TNWVDfk4NmIsb9/0fJV7sDulWxjS
 wIZf4L8SvLHHiuRg/V0rQUklzIbuoYLpdyKHQ6HOgaDNLzlSUtCdpQRRafhA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=baylibre.com;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=baylibre.com;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id A050640408
	for <nouveau@lists.freedesktop.org>; Mon, 20 Jul 2026 11:10:43 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A796210E8B4
	for <nouveau@lists.freedesktop.org>; Mon, 20 Jul 2026 11:26:09 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-49548e01d02so13146325e9.0
        for <nouveau@lists.freedesktop.org>;
 Mon, 20 Jul 2026 04:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784546768; x=1785151568;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yj0kJxzJSZM6leFPQr41NPOQEAzzRxTMU/d+FHoaNn0=;
        b=gOcpCDff1FkBsxq6tQLGEJnpfYpAE4efRwLAeXa2ExqSXOiV6H1ssek4uxtLZ8e/1U
         B2xP6jcDoBrBYj65ZzPzn2efviXLuJAsccKFNA5RcrCd0E55vE/JBp15lARnKbo1svMx
         RxmAn9Q8gbUarnDK2OC9l9kmwTXG27qj8MNoK2uiT27vhkkI2WRXj3xpfwp9b7RJT9Mf
         ZAmUBTVxCnhDNqi2QOXbY8K+QF03KnKC45F+xuEej6SnCoRoRe7IPjGfzI0N1eiExZa2
         pUIgn0D4cBg2WOZJzw2Lq01WjrBELDySDbaDhn53+f7t+UYMmbi7TsGb8JMHnt7o7gjF
         ZnGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784546768; x=1785151568;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yj0kJxzJSZM6leFPQr41NPOQEAzzRxTMU/d+FHoaNn0=;
        b=s8/nVYlDP/7czSUiaYC5/afmDfgXcLv3wkVqim9oeyy6h4WKJe4Dwg0UwgrJyMm06h
         aGtLhAupuTXYPenrISeVD6ukBSzl+ZogZdpctWdQK9z2LzzWisH6az4YujSskI/clkYq
         HQW3wIDJxJeVe00fdQdgC+C26oyZXe5kbOvNFmGIGtmaE0gYwVoMjsjBfldnMm+Uuohk
         FtvxU/thTanEG/TXVMvn3+//WeHbv8AF2CgOe8d+Wkj2Kc3EzxEEAtdB+MIRfrsqqeJ/
         rD6ThUuuVU/GB68DZrQoZ6BhIoZATH/TOFdrdzve7LtQrb/ho0cO9IS6LHFdkC3sm37G
         OzlQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrh0Qq+VXwbcMDnF8AHdmFBIACTVKOYcjDe1DEBfw4cMI8F/oacFCVUvK542MWtcc2YJvjDE5p+@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUC9h4QCso7mXP/p3bhOBKAHXQBqTZ75dMq+rsdRYQgX4QArSs
	MmWr5dzPLmve3M8Wq7kminDR3kVXEZvCqOoPAghfDSC8oJP2dcuA4uLLwFB/wx/KnU4=
X-Gm-Gg: AfdE7ckPjOCjk/u1Et/HfpqlHJOKGyA9GlSd/lD/6N3Awmzxut1rz/vWzd4r9mzinvG
	Hwd1+6uOxaIanEldYJ8GwtCM7lzgPf5AthTQNI+RthN3xCIIIemI85gSsnYBcbNlKeyHJIKjWa1
	mve0CZTHtJzylhCYVg8r1wlpd9eBDj/A55KAUI7HQ6r9sh3t8ptl7hXu3hvisnmmwQ5JqHJqRDz
	3wUEl7zsBly7N31KgTPN2mQ4dYxoVz+M1ih3qkGDvgMv+VihzSsqxkjhz3yEcUJJc1+Vv0yuyeh
	MA0S1V8YEsxKqX/ZU7ywCtSGFznXx7MZ7bYBVpGjVi2Cteqmpu3DluvDtQNqjtfqt6aIQ2govxH
	mmLZkjWU9Evu1fGS60Zi8bk8ndkR4eIY6y4Pwnja2qcrho+R1fPW+p8/iReV2NKlEPv41YWS283
	dpst17AW6a3s2E3bBcgBO3oXyGrsUDA2JpWmth8PHKyXcLRkFZ5WpHPtC4z560/1jxDTEBevkKU
	J8B
X-Received: by 2002:a05:600c:3b03:b0:493:e52f:6ee1 with SMTP id
 5b1f17b1804b1-4954a38d27bmr130686685e9.0.1784546768031;
        Mon, 20 Jul 2026 04:26:08 -0700 (PDT)
Received: from localhost
 (p200300f65f47db048587886ecb5b26b2.dip0.t-ipconnect.de.
 [2003:f6:5f47:db04:8587:886e:cb5b:26b2])
        by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-49549a3e56fsm267803265e9.5.2026.07.20.04.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 04:26:06 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?=
 <u.kleine-koenig@baylibre.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH v2 3/3] drm/nouveau: Use named initializers for i2c_device_id
 arrays
Date: Mon, 20 Jul 2026 13:25:49 +0200
Message-ID: 
 <7d6033270daf9ff409b427897cb8218f9a69048a.1784545092.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1784545092.git.u.kleine-koenig@baylibre.com>
References: <cover.1784545092.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1681;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=aGE1vCQRPqHHuoXxkUDmiLkcQhSQQsTaegC9eIXSikQ=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqXgXCksDjGVj9HqXCVaRdDwGQP8qhkcHNaEqPq
 s8FEfd5KfuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCal4FwgAKCRCPgPtYfRL+
 TsFzB/0QKxyxmhMP/45nRTLxxVTfuBzwoJyIRuZbViNPZZ0+cMrSp0hAUlpFiRL8MnZ3Azw7Apv
 8dekmjP6V9A34O5WlhW6tgupyagrYBZHwJVjegyMoJE4/ZBV7HjKHaIWfsKX13hx2MaQz8CihFX
 xORbie0Tmiyl3MF/LzY+R693IPH/ue/wlQ/0vGQs+CisxUauyRTuTJpWVrHimMduv1N1As8J/ag
 dgBY4u4uCeh9HXX5E2PD9kqlV5Q/YYkuJj3F6yqgDf/ePgo4X1EsTfI/rOBSLrAX3BCT41th0/6
 Ro6o+Cx3HFel5JSfTfs0a3zDkzSogFT4gzgaODqXetRqs0ux
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ABBIMI6WXMP3ENE6YFJDZDWBEFFYY63J
X-Message-ID-Hash: ABBIMI6WXMP3ENE6YFJDZDWBEFFYY63J
X-MailFrom: ukleinek@baylibre.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ABBIMI6WXMP3ENE6YFJDZDWBEFFYY63J/>
Archived-At: 
 <https://lore.freedesktop.org/7d6033270daf9ff409b427897cb8218f9a69048a.1784545092.git.u.kleine-koenig@baylibre.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Named initializers are better readable and more robust to changes of the
struct definition. This robustness is relevant for a planned change to
struct platform_device_id replacing .driver_data by an anonymous union.
(Though these drivers don't use .driver_data, so this patch isn't
strictly needed, but still good for consistency.)

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_drv.c | 2 +-
 drivers/gpu/drm/nouveau/dispnv04/i2c/sil164_drv.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_drv.c b/drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_drv.c
index 976ed59a86e4..96dabdb38c4b 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_drv.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_drv.c
@@ -486,7 +486,7 @@ static int ch7006_encoder_init(struct i2c_client *client,
 }
 
 static const struct i2c_device_id ch7006_ids[] = {
-	{ "ch7006" },
+	{ .name = "ch7006" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ch7006_ids);
diff --git a/drivers/gpu/drm/nouveau/dispnv04/i2c/sil164_drv.c b/drivers/gpu/drm/nouveau/dispnv04/i2c/sil164_drv.c
index 7f402b901977..2324507eb5f3 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/i2c/sil164_drv.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/i2c/sil164_drv.c
@@ -414,7 +414,7 @@ sil164_encoder_init(struct i2c_client *client,
 }
 
 static const struct i2c_device_id sil164_ids[] = {
-	{ "sil164" },
+	{ .name = "sil164" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, sil164_ids);
-- 
2.55.0.11.g153666a7d9bb

