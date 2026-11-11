Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15DB606A327
	for <nouveau@archiver.kernel.org>; Wed, 11 Nov 2026 08:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=OvOg4Ui6
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0C3A410F9A1;
	Wed, 11 Nov 2026 08:50:08 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A29EC49215;
	Wed, 11 Nov 2026 08:30:29 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1794385829;
 b=SnsRTszuVCiCBE/HBdx5n5m00nY82HygSUrovy23lxraWQUimaIkwsCMoz2qgWuJtPkko
 l0mrNYPny/X447PSEraAotxR6Xia91106eiLwnQy1IQzH5DAk/MwefyJlon5pcevrb9+ABi
 qmBNs1vzYiYw5L6XaZAN/sfvALNwuwrr6dpuOnZVWkB2I622WR2696/6uN8Iv+AbOgbOpbh
 o/xsHC/2WY8ve/AbT3jAC3QxbS0tzJCRkfbMEr+HAeGiUilu1TFXz6bsuN66VvGAHTO4n7/
 M3Q9EleGgIcHpzo9BJhM3Z4JYgoFXRzpRiojhPLU9k6ZAuYVJ/PEqoePKW+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1794385829; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=XGjaUCUyroQZIq89TXjBp9/oGz8PABPtNLqz5N0kwPI=;
 b=BLPxbTBna+JwSV6zncRzPFoLloO7bMwi8L9adEx7fIhQRvYBqep/1zGoW9NAxROR4arq0
 aeV/OqddFkElx7dmJvRVLu02StIbHu7C7heLc2rruAdQVpLveFnqOEtbGqQ2TA+8BN8tDIy
 ItFJhsWm1bbjK+Vq4+ZJiutEVh3WMNRuTBZSlXUpsZrnPrllDYZYFzb2/WKy38FDccPP5UB
 WnbndftQCpiMrhWaBFt12BPieYV+ZlwKEGx0heREvTNMC26JILfdfe/Eu8ZcpOmghrrtYYL
 kYTMuw+3fXo5vmk75p7Dahu+B1++ZM1CJ+N9sSdkSC1//xuIgagKWJW3wmsw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id D5DC44099B
	for <nouveau@lists.freedesktop.org>; Wed, 11 Nov 2026 08:30:25 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 062F010F98F
	for <nouveau@lists.freedesktop.org>; Wed, 11 Nov 2026 08:49:59 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-4919a880834so1773371f8f.0
        for <nouveau@lists.freedesktop.org>;
 Wed, 11 Nov 2026 00:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794386997; x=1794991797;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XGjaUCUyroQZIq89TXjBp9/oGz8PABPtNLqz5N0kwPI=;
        b=OvOg4Ui6w75lh3y9B8RgI42tdvhqg2fmRYyZFhvYnNoge89PVVNExhYJr+E5UGbQwL
         o/8tkxtJYwrEZpIEKXk6BygbXz+nY/dJH6J28Sczkc/RQhKwU7Rl/ydS3nU26QAklykM
         8I8IJ6tIzME80nq5z7+0OyhZSaLXPTU4msXyJZPczYS9+1dOLyps54OgoxOfW2lcV0l5
         qZsi0G8gC826cjV1B1Xj2LL09QZOJKSBpvYnLU7sIskJeCBF8ASWsZZhbun0aCXldvD3
         NNsDUu0gu4wEuAJxD/aI4ymyYTyGxvRiQonlGiY5n0B+W7/uvfAkcjTIwZYJ+rK1Aec1
         4HcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794386997; x=1794991797;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XGjaUCUyroQZIq89TXjBp9/oGz8PABPtNLqz5N0kwPI=;
        b=cg8GQrGVZhx9ZmPzvnK88KspD6VmFXRlW5dR2kZZTg/hpjGGWJ46LraZYhcpHcNw+V
         SD2v+9cfJNWmSs8b//yA+2CUJurw29ULG1htPEEj8njMI/GVQy3d/9BHG7FJzUBRgcN+
         gwuhq8sXbrbNUsPLFVufQUnByzhph3OwNU9t8Lqkf0LQoVk4ZfwGR7yQIE5mDGOrdf5x
         2W3b4Da3dhP3KN9keMYcPMfvIdMzx0b7+2s1uS+XwZOiAbn7sdLwuXf2ytiW6Clgcrwh
         hBcrM+irYwjG8WFGwWUtCPuqvlQWqh+NzMK0dvYrO4+t6Qx0J4HpC+yfXq0hHR5M0Z8E
         uLYg==
X-Forwarded-Encrypted: i=1;
 AL+hErHoV9AwipEYM8hv5Bl71j/4WsEnvtNyYz0BcUP9nfXQUUoCHt/aPNVnfM4AAeySK1LXPoNYS/uN@lists.freedesktop.org
X-Gm-Message-State: APuU4Z9xE5ux+ySJRUhNHJfR0/yW5EOlOroVesOhUF5AWUZoM9dpppZf
	kEUPhsIqvvwyWtheMx/7uY2GzzsebiDK136DlcqGrDBuKrYXMUQ/omYSbkcJVVXQPGw=
X-Gm-Gg: AYBFou3ryf4XRPTeNw2neTvT+oo6azPFYrnL9E9uJB+uClGvnqQ1yBkZsc2/NahLt8Q
	GLW7G1PlpT4U05vLh4HYpHCVW5NAHz8eclZ9drAiJ3OkggG94fJrSJeaA9GWD7bjiegn2B4KGYh
	KYOpAey+mACDNpEvS6AfQLNZB/RP8tt74dWbQBC0n+FZ9X9ORfh9XuAvEmtYFJB+tBQtQpKw4GP
	g4rn3JpzwsIyLIy6Ly5w5RQd58akxLMLb0clxGBNIHLiKtNYjNb9081+gLiJ/UPFDQF9rnA5KS7
	V7O+dW9Rvg+j7BFQm4hq8kbh4T8JLOH4sOLu1xHL9e3YFZuS6OOT/HO7RUUqaAxPJKBUE8H1MBQ
	DOpsXELfcjKd2L2BrRsZm13sKVjCxuJRGaBmPUO9rWO4hsMu4DazgCtVeJJIwoHsZrLky2euHb3
	3/KQSvg1GbCcAf98qTB3hHA31bw6laz7TeqdkfzSMXTgDEjeOUO8Vo8YeHDNPLbMmif0xMSN3/C
	ikA3zmj+6GehIYHi3FVMoJfmgLNf8Jp1BmXJyPEeKM1M1uFrQCAmbnSnj/WaZv16F2xj9rbda3N
	QnknpPn1L7X8yXSmgKXK8PuQQ4OKLk2strIpet+rAyVxA95YND+bvmhmwleP+ow/SiXK84apN6a
	3XNaQ+fSHG99LdA==
X-Received: by 2002:a05:600c:83cf:b0:4a1:88de:9e8b with SMTP id
 5b1f17b1804b1-4ba0935d26emr28180515e9.5.1794386997367;
        Wed, 11 Nov 2026 00:49:57 -0800 (PST)
Received: from localhost
 (p200300f65f19a90460510dd506fc51af.dip0.t-ipconnect.de.
 [2003:f6:5f19:a904:6051:dd5:6fc:51af])
        by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4ba01fba476sm148718735e9.2.2026.11.11.00.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:49:56 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?=
 <u.kleine-koenig@baylibre.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v3 0/2] drm: Use named initializers for arrays of
 i2c_device_data
Date: Wed, 11 Nov 2026 09:49:43 +0100
Message-ID: <cover.1794386771.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=793;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=4OKhZI7WlJ4g3SpBA2Ic0Zi5wRtesQaQ5X9mG3JF1mo=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq9CwqsDjTjvevC4e6nqty+iMT5kBDx/7rhbFyw
 dX0vM5YifiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavQsKgAKCRCPgPtYfRL+
 TndLB/9XYRxFcRT5EeOK0C8h0ylgXzyp4HwyoRcTzvGkjbbhSRaKbbjv3XKo5beiM9yhF5iYMPY
 v61j3vOV/ikOH+pqF9jZpbWuZL+cavvkeZkT/1wRXkr10Dp64jBs8fp91loD3e4KaKWAm+a0DgX
 LXV5eq4mLtURTcM/4oteHsE//tDQi0O6a/r87LJO+S+6fzesH4CWf+JuHkkAUQ5r3MY8HK6wZau
 BULo2/W2NXGVKnYTopIWeNIeCItEMQYA6waNFgzuFq0a+m5UObpapu9aJI6MZmFtgk9utk0tA6G
 1Osj6Y3KIfM8Q3k3WyPw3eoWLLYg/h5lLuKogol8RjstG9vq
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
Message-ID-Hash: POVNZB25X3MHA6V5HS7AW44XLM363F2X
X-Message-ID-Hash: POVNZB25X3MHA6V5HS7AW44XLM363F2X
X-MailFrom: ukleinek@baylibre.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/POVNZB25X3MHA6V5HS7AW44XLM363F2X/>
Archived-At: 
 <https://lore.freedesktop.org/cover.1794386771.git.u.kleine-koenig@baylibre.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

v2 is available at
https://lore.kernel.org/cover.1784545092.git.u.kleine-koenig@baylibre.com.
The first patch of the v2 series was applied, so this is a resend of the
two remaining patches with the collected tags added and (trivially)
rebased to v7.4-rc1.

Best regards
Uwe

Uwe Kleine-König (The Capable Hub) (2):
  drm/sitronix/st7571-i2c: Drop unused assignment of i2c_device_id
    driver data
  drm/nouveau: Use named initializers for i2c_device_id arrays

 drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_drv.c | 2 +-
 drivers/gpu/drm/nouveau/dispnv04/i2c/sil164_drv.c | 2 +-
 drivers/gpu/drm/sitronix/st7571-i2c.c             | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0.rc1

