Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD7B606A32F
	for <nouveau@archiver.kernel.org>; Wed, 18 Nov 2026 12:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=j+aYmhUQ
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CA8CF10FBA9;
	Wed, 18 Nov 2026 12:08:51 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C1A7349507;
	Wed, 18 Nov 2026 11:48:57 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1795002537;
 b=zlbq4mWmPXaSc/aamxPqpQS73jW8KfS9BmcANYL3KlR8jJnWa+tXCUiDGsZJY+DYE3Vdq
 9s7FJ8cSAo45KlDRjfG/mY9d1fVYR+FwlGcXfCxA6y69NsHyhz2ROnHbhm9ruThsQ57U1vj
 Wbpu/mem9f8QkLseORBLzZB21Q4zatxmN2qpwB5scv/FYCGLfqESJlFSD7W+vuRSvIsAL/T
 +S5Rs4lwOzlnR5Eob1mgIA3bLGPXZCGVZ0qXy7SsbuQ3DOX5akciHyPA3exzF60ldV1VDoT
 yV7gA2PuErDYjDWq/OqfCNQXyRAAUc7l0YUyGucrbxxuWKSpjpcLMmzs17CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1795002537; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ziv2NlTRI30TM8LVv4R5YtX1fTjU8SYVeoKSZhByl3k=;
 b=YZY4n+e3Idm+SAEpdbAAr79XL2eXEukFzH9ZktG7zMzdFwsO4XWVoUvnoAs4z5mpMDlnf
 yu49/UwvcnD7O5fqYItCF2mU7RYVGF8NVxksVo4Qa/y1vGtTQizEkGk9DTbvVYMER/swyuH
 JA/DbtBx+lxMSlBSOmxVeMh0xxIFokwRC9wHWin6kuyuqcrXgmoUzklWpMqmvK5TJwDizcW
 oSbjcQub4RCJXugszWS6OZpbaXjAdGdu0nGYo5nkHBEd4P5b9EgGVa6xVfKXkjREIhg+/qW
 PB5mDfqsBH6rOd7fj7wXQTO8KPh2nU37kYiXwvNmHnZFsGQIzwRPQTV1B1bg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id CFFB34801A
	for <nouveau@lists.freedesktop.org>; Wed, 18 Nov 2026 11:48:53 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B9AB310FB8F
	for <nouveau@lists.freedesktop.org>; Wed, 18 Nov 2026 12:08:42 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4a207b02a2cso6132035e9.1
        for <nouveau@lists.freedesktop.org>;
 Wed, 18 Nov 2026 04:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795003721; x=1795608521;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ziv2NlTRI30TM8LVv4R5YtX1fTjU8SYVeoKSZhByl3k=;
        b=j+aYmhUQmfsffXPYWXD44K0feCNtiEZ/9gVyYGhReDCEQQgA/2LLJQvypVNBmoYGY0
         wCB7IRuq4dqs3y7U/s0TEGgGiyghBZLRqZP3I69SVLjmPuigI9Q98M6rZtCqcqjoa8Ed
         YGCt8dXfEooVmlBQNKVeun3ovtd1vE6WG+YmXrsf0UFI5iR2RK1IJOkJn1LRwuFMq3/+
         ZIsuQOlAs5XU9DlFy5YqPUML3kqJbI0wnzpI0XcMekCVHcLyArhX+szQIyMkOtamwCid
         7ecwk0S0+k/sN3k227gtQWI4wSy9LjAFxgEuAsfrN/o7ONRHUKoNRhxoX+z16Wz1h1/b
         BNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003721; x=1795608521;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ziv2NlTRI30TM8LVv4R5YtX1fTjU8SYVeoKSZhByl3k=;
        b=brCEFBKR2z3Bdyu44zezCX9ZKQDMbIpikF06jnll+85Z1bc00zDp/z184sJ7gfRTdy
         Ww6RyHJI5t9+u+aCrrmb9DeVi+pFEpVEIBkoSXi3hrXciN9Kb9G3jnrZRaciS1TKdPS/
         MbGseiDNh/cwxxgQ03srvciinMLdd5D1K5ZL79AwTptdVVNiLWvg13Obnkt3y8trEXBi
         j0AAKljNYI9bdQi9c+4dVgYGNnd81tW5B3SLXgUiCe8cpRd1gdPJzs1EwYKQthPEmHOr
         gU3JThtGm+0AOI+DuXWWal5vZIrPVn5+TXuswYKEeJ7zfdBD2Kc0jSbjk9Q7d7ucU6Wz
         9WPg==
X-Forwarded-Encrypted: i=1;
 AL+hErGNseSvQCAS/wfNR6nlzbrgoxKQcOtNNhJrOPzbCblqijIuY2ioD2Kc1OzqRs66WDYnu9kykNyf@lists.freedesktop.org
X-Gm-Message-State: APuU4Z/I1gFlKwUdy9j8H3pZ7gpO864VSU+KMFa6B+Tc4VYn+1niL6b9
	pgRajrksuQQnPozvUiqsgZDQPIq80J8YH+oSgHXqXpioCqWUwIrem5O6tgXU65yJX8Q=
X-Gm-Gg: AYBFou2gvxlK9vcDN3aVpqUs/XwtW/Hp7UrxIANkduDR92UML1C1yPOHoKuXqIdvxU1
	IniMs0UTp7SohNBPxzIJ59283OsIN31iT73LaadbhHUO7AgAEl+cRfmDMmu9AfyEVUOmAAxlu6e
	55nYnyp4e3hekTWDl+lW1NQ6ax4TcuS+oBk1Rl0XaHkTDiLC7GqTOtS4K7HXGWii4COwonOuftM
	DEI8wp730G8kPRSMm6n/sUEgoF80HUU1YzOBLNhTFU1+4xNqvYx4lPwDGjDrPMG3DfZQkvJSXrt
	6BPpn71PZWYWdNMcx8NEem0MnJAMR61oKJpSHl8OUxWEFkUTci7Hd0dA8ChlRB2uFfdny4pmYTu
	gzFyb2hUH52sALEK9ASwo8Lb5M05Vhvc96JY3GwdR1Fd0YRsQKzVSWEl2Eh5zjZjAFqAc/31Xau
	uSFixx6BeCA48L3l76zAm+uysJbWSs63qirtrO0a8vDfu0r1Isa4UETqG+RsTNHfsE+H5vgT9WK
	pcPl562EMt4XmAPeeIEWlW+qm6VandRMXfHf6YzXlGQAtZ4rTO8UOCGSXK/K44BENWuhbCT6JCD
	ilAz02b2Eju83G0m14dO+/7n07470wxKndoz1SjCbGXZAvCIVANlA4iVujmO5rSM1LqBo8BYfHJ
	J9DwOp5fpKiA5/94=
X-Received: by 2002:a05:600c:4fc6:b0:4bb:6823:3d3c with SMTP id
 5b1f17b1804b1-4bb7da26fc7mr46277215e9.20.1795003721097;
        Wed, 18 Nov 2026 04:08:41 -0800 (PST)
Received: from localhost
 (p200300f65f19a904dea20c2220232395.dip0.t-ipconnect.de.
 [2003:f6:5f19:a904:dea2:c22:2023:2395])
        by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4bb7d2cfce7sm62975535e9.14.2026.11.18.04.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:08:40 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v1 5/9] drm: Use designated initializers for i2c_device_id
 arrays
Date: Wed, 18 Nov 2026 13:08:12 +0100
Message-ID: 
 <11a5c3e4a62d43f88266b1c90cd5e0664a13ab19.1795002467.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795002467.git.ukleinek@kernel.org>
References: <cover.1795002467.git.ukleinek@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1471;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=mDLMtyJGFJJyd8ezKBIhdp20gdAl9VX7cmcNszox8rU=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq/ZUz1dIhyPLZdkKgPQxFgUCg+Lxh0woqC34/q
 8jkLAviwt6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCav2VMwAKCRCPgPtYfRL+
 TocgCACBQk4rf4X6R5KlkmydUmCCOKHlnrm1KXhKhJsPzswKggtDSjB9ylufN3rYaK+BtUUOT3H
 NSUGUT/zhpxV5Q+OLP0IC1C+t+zZTNQE/0wN+eYpoXtxyZGq/MKhx4llu5Zg8qPhtAjnmmooAJ5
 h/EIbxy1CKfXjWJc7y9FdLgbZxXvc3o8jwzCeYHTtr9GjtOEzuR66wHIsGmNLaaXWz84PjDzyXw
 8v2VJ+gbbl1SJ6yMi3K1uMrzaI4RqHLcAIj6hkqNRasgRvofWHCSs60bqVqSzQxjU6sY4QV70YY
 VDzffGGIhIDRy7W0v999Sa+tokPfLwR9zFyI0F/AKUxFHHRU
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3Z3Q6QCRWYHDLGJNERJ7J4X56AZLRAO7
X-Message-ID-Hash: 3Z3Q6QCRWYHDLGJNERJ7J4X56AZLRAO7
X-MailFrom: ukleinek@baylibre.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org,
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3Z3Q6QCRWYHDLGJNERJ7J4X56AZLRAO7/>
Archived-At: 
 <https://lore.freedesktop.org/11a5c3e4a62d43f88266b1c90cd5e0664a13ab19.1795002467.git.ukleinek@kernel.org/>
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Named initializers are better readable and more robust to changes of the
struct definition. This robustness is relevant for a planned change to
struct i2c_device_id replacing .driver_data by an anonymous union.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
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

