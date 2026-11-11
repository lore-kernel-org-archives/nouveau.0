Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D18E606A327
	for <nouveau@archiver.kernel.org>; Wed, 11 Nov 2026 08:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=kZ0X45s7
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1F96410F9B8;
	Wed, 11 Nov 2026 08:50:13 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E1FDA49218;
	Wed, 11 Nov 2026 08:30:31 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1794385831;
 b=rs0R4GrtbVxbMaB3gEOwXYtTh4dZIR/NXm9b4NDAf4ihTqxldYKtwECC1Yd58o0Z43zdm
 p/hYaJ7/YJ1DAayW+XuH67X+PFLXrQdEYjoqFU1pY2idCYWrV6wFMTI7LHttOb89NkRJTB3
 AU4e5safaKnUCTXBKe/KAufpn8apMcBC/t0VuzYx/I1/gxlKgp7T9ZxKNVSOrEtdoI10RNE
 pY5yuGpc0bvvHbfK9WmT+XM423bOK98H9kX5nbsVCwDFALxuXjVHWoe8YhnyOpwNLlUM9Dh
 NSLl0NL7ElIauBzPNbR+eKDx33xtJW+eNu8CpJEEhDULO2KpDJ0ELo794CqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1794385831; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Mcw8tiKH/WX7VEn2tZaWKJlFFwouAMdTGd/w0+U3Fi0=;
 b=DqYGf+tdnZB1wbMy2+ksOYy2tE5qxC1DT3FNPgAme4anwDIhJ1HCdggS3gS7sBV6JTQgX
 ZpcxDl7DAMd3cdmZbPeyz1ibQSRHPGFY6RSHxQru3ALwm0MB2mPWUAjCwcLutCpB/nYJzxx
 ks8KEGPDXeFVLxuGqTOCrOxtCzuMr8ndJwGQIrjHUeqZyFucM7Nco435TikcUIIP3Xj1sfN
 uGEPDQytHpWWlvDNXhTGGWOyWrXS3RILGkrZ++f1IpktM2tSVO+ZTQXDCE75phAJJsytxj4
 nL+awxEUXk25PRIFrvP9S1X8yq8t9vrP7D6rcteKtQkeuPOM+DNKXRl0ZWXA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=baylibre.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=baylibre.com
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=baylibre.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=baylibre.com
 policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 72B114099B
	for <nouveau@lists.freedesktop.org>; Wed, 11 Nov 2026 08:30:29 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9DFCA10F9A1
	for <nouveau@lists.freedesktop.org>; Wed, 11 Nov 2026 08:50:02 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4a59100fa83so25451515e9.0
        for <nouveau@lists.freedesktop.org>;
 Wed, 11 Nov 2026 00:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794387001; x=1794991801;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mcw8tiKH/WX7VEn2tZaWKJlFFwouAMdTGd/w0+U3Fi0=;
        b=kZ0X45s7YZAeveGJ1ijZYfE4YT7gpMqGBSI/VEMMHOKOMexBaTTU1wLdrA/7uE9yRg
         6bZ94oupjRtpxrfdG7hBSmMAZaiLk+Az9SAOubFOJXeKHoudqiM3DRl8GzK3NGTzCUYq
         1TL1iw0BSwZy8Am9fGwUcv2J+SNaBclD+5ZUtkW+/vmxtb7ub3AusDb2vmck4s6QXgms
         7stPwpjWXP4uo1wdbPkuZTuBDSQo/mUV4G0eq14yijWyKp5aLMWg+AVw1WwJSQiSXZuS
         B4o3JuNC8MLDcHQIj79tMm7ZC0LbVGrtX41A0HlkLlHN56OGAegSlcO2V0H294MlB+U+
         M0Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387001; x=1794991801;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mcw8tiKH/WX7VEn2tZaWKJlFFwouAMdTGd/w0+U3Fi0=;
        b=E+uJy6ZS0lMXxPvxTsRLJGrWV6W45vt5FN4k1d0lD4xfKNzKPsJRHy7R3N8pSQ8RSn
         qzWgtPZqBoOLnPPLDA1QvpHEkGXB/SgfajeV2YLgpNk856shesrl6gvYCY4X2deqX0HL
         R6cHcbqdkyxA64HCZrrt7DG8b+vc+xnYDfrQA85z2wlQ+u616i7xiTVYWxfi/ASJaGSJ
         5hIvxhLzj5xRIRUemWbkX2ifNlleEX2D50oNfI2NigAlT7L5ywc6E4/26KAZGO4pNXkI
         JG9dHcACmMloy0mELY0pIVsXOVLkg3mawE5DvnnQbxrNIDju08m5ENqrYmAMbmZ12Bnn
         zK2Q==
X-Forwarded-Encrypted: i=1;
 AL+hErE469uGoAKvzlqQy4tW1u4ypiM3QUg3/8eAtxf2nw1Mr0sQm8ydpTG6Zqn2w/7EZSundLdTB/SG@lists.freedesktop.org
X-Gm-Message-State: APuU4Z9CGyI1J4bC4fsQhwhqTl5RQsQRpxTmbmwkxii+8vP2a4rUu1t7
	r27yXBDf0Ne2uriZUrrWzQ08urrWbHsQr92F5blweFlXwrYij1N734GyQJuaYuTDuVo=
X-Gm-Gg: AYBFou3JCp6ffXfDYL3Drmsae0k3nlX0ratXO0FtQUBI44B0SCMtyka7jTt0UngPHkm
	YlnIjGTTgbf23R9VPPnoTmjn1mKofEWci+SVvhq8eOacuJC3et9T724USZPo2HQjwV2b8CYeSDw
	Ci7FE7Zb/DPrLYvp4yqFamacVLL6Py6Wv8IEDaBoFYARr2z9nPY3Dnf/X3QVRdMVZHgIGq48WzL
	Ps1rWXH7uMaRuwfzMft//p/onLnWDMIoNLYSgolP/PH4JL3g4qUUjsFPod9SFrJZMBAbsdxIZ3j
	eemnYHztxU/8GpvrGp5y9hf6Y+zgJu1B8V/8TyY3+dQDWl9mdkxfqK2Vbix0z+S2VG1mc1ktdyc
	UW1dRm4xDKKfXd7xgCludGh6UQYacLHLnQ3a/0C+ejb/nAAgqwmQHYsxuwlfDa2RcOKZRgqumit
	CfBsHjqy5C2+7r+vSjq27r08cnG16fl3kBx1mtzENXhD6tUayUgpe5B/8F4/vgC2P1T4AJpAFIX
	gm7yNewhC6JanRLebO0M0kOag4rtLb+zRmyrnMy/2M7yHgLOJOpWLgOoW69FGgLeJyShg7GQTb3
	g9xntC3ywt4t4ExyMG4LKEDiw6YxL/ITaoTsLhwndfDxBFVfrox/mRC+IpDWtG+BEBaXc1pNEmc
	CW87AecKzPapEOw==
X-Received: by 2002:a05:600c:1d28:b0:4a1:e6c8:ff74 with SMTP id
 5b1f17b1804b1-4ba0939db75mr30427005e9.29.1794387001054;
        Wed, 11 Nov 2026 00:50:01 -0800 (PST)
Received: from localhost
 (p200300f65f19a90460510dd506fc51af.dip0.t-ipconnect.de.
 [2003:f6:5f19:a904:6051:dd5:6fc:51af])
        by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4ba01ff3428sm142236795e9.15.2026.11.11.00.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:50:00 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?=
 <u.kleine-koenig@baylibre.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v3 2/2] drm/nouveau: Use named initializers for i2c_device_id
 arrays
Date: Wed, 11 Nov 2026 09:49:45 +0100
Message-ID: 
 <3dd75434da3c0e4b5ade3b802b4ab00a404e8bba.1794386771.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1794386771.git.u.kleine-koenig@baylibre.com>
References: <cover.1794386771.git.u.kleine-koenig@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1714;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=L8VndumebZ2MRoqro0RnaUijRD3vijSdtnwN+w0pZyc=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq9Cwv5LPQnzIxzz7hUpMPuIVPQccUHI3t5AUhf
 LUDPxo2ybGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavQsLwAKCRCPgPtYfRL+
 Tkl9B/4tAll/ivGhonm0x9hqXABDz27C1LzXwKQ99PbJYQrZBYY+O5PpHY1m1fFVrWzFGedo6Yk
 vDO7Up0laCDvG4i2E38rwthFyFcoYsodI0MyYiHrxekWaiOO3klqdFkhUdwZq5f2MDuibrXoIf8
 AeP0wNKhbojgXXe3ZP9MB6HugJr+1doDFSrs1wRPHewnh6pZoyww2mhXKwWyTXgv43vvRj8rEHz
 cWyarlxT7ZQT8MaLjkYzS/F68BnIcYoUaKiTJazI1g6s4G3su8PDhFAP5h4tndnxvLJ/OjOmYhZ
 kH+cA4S+D7FFwqJTuWKVmNQChQwkbcuI86iBs5x5T8BIyn2Z
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DORKMLARVX3LVV5K5JL5R5G3Q5CGFATU
X-Message-ID-Hash: DORKMLARVX3LVV5K5JL5R5G3Q5CGFATU
X-MailFrom: ukleinek@baylibre.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DORKMLARVX3LVV5K5JL5R5G3Q5CGFATU/>
Archived-At: 
 <https://lore.freedesktop.org/3dd75434da3c0e4b5ade3b802b4ab00a404e8bba.1794386771.git.u.kleine-koenig@baylibre.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Named initializers are better readable and more robust to changes of the
struct definition. This robustness is relevant for a planned change to
struct platform_device_id replacing .driver_data by an anonymous union.
(Though these drivers don't use .driver_data, so this patch isn't
strictly needed, but still good for consistency.)

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Acked-by: Danilo Krummrich <dakr@kernel.org>
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
2.56.0.rc1

