Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50AB7C43458
	for <nouveau@archiver.kernel.org>; Sun, 12 Jul 2026 12:37:46 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 19B7C10E45E;
	Sun, 12 Jul 2026 12:37:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CYwxQdeA";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 81A4D40EF3;
	Sun, 12 Jul 2026 12:22:37 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783858957;
 b=xl03LZ4N4e+Sfng1VbyGVOUzlxl71YGCK/GDdguZ7mKAasLnZgpC/h3Hlbs2SaDpXTX40
 1rSzBa48wKreQ922eTFzJx0AwbhlxTVhWW3mNMakupkJx+dpTM6rBbtEUQodw9KDtGsuF9U
 L7QPeNIHmK7bDjeNdt+6s1W00QqmG1xHtRa3HEIJJv5IZ+HxI0WD+6tPkavV1muadsXMvbm
 r0tMxhY0FKMbYedoX60MNS6WloJtrCfe7BhqJ7NZVOq6/uPKRGSA4HAVYZIji72xVpDlqXG
 TmFWP56YrvVOG2a/Vhn4VoukYbMPAwUGxnrAnkIjgID5MYN7v89rO9xdQpCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783858957; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=hNARwloA3rbnFq4jTz32GunvMhdlXc/eq0tF3XfoMbU=;
 b=p85w3JcmhcvGPmJTjA1X2CmGXtfl5Y1xrOsJPYpVmPeHzSmV/cDKX8EC27TGNttfE5RNH
 JeogGmq8d99zR0j6wkp4Po9rOaBUGLwPYOvhd2nlMDpLNlCFWY6P44BkSuG0sIvB7DvbFk5
 JifG6RMM/qJE9xWFGLFE2L4tKVpd8EAUlxdSY4ublL+0H2OUwjkoC1li3ci9ss3Ma5vrbLG
 53oZIx+E6V5EV1eXIaXuCWoY6H097uucMaCLta26IRxK4OPV2NY9zxl4W/4wL+Cbp2mKTfi
 SFT6Ie3OarapALaGjXGw3eWMKziu80KGVlXtyK6Vs8hhP2HWp5ImyjghyGrA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C418740720
	for <nouveau@lists.freedesktop.org>; Sun, 12 Jul 2026 12:22:34 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 37A3C10E473
	for <nouveau@lists.freedesktop.org>; Sun, 12 Jul 2026 12:37:43 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-493e8d4f4dcso18020105e9.0
        for <nouveau@lists.freedesktop.org>;
 Sun, 12 Jul 2026 05:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783859862; x=1784464662;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hNARwloA3rbnFq4jTz32GunvMhdlXc/eq0tF3XfoMbU=;
        b=CYwxQdeAggOpWcxPa2TRVDSn8pzqQPd0hZJPOUqaM7MAMWe5aNqH9Qn75pkzYjB7O2
         U6W/JLVQRcPomdIIU5p+H3jYVdvDDGE893bYRU+3Au/fcjY1E9nfeB2abXBBNsPS6r+G
         Ks7J9KwKq+1VaB3GVdPu4ZcW/e1vIGQ+PAVljbez1/bmTCqq+UmyKW0H9JWb8B2vwNAH
         BClj/i+aE5QGrG3UdouyE/LmaF6CKkZtpJXFkCwJ3N/DBZroc2MBnwkVg7HIbzBLw4gx
         n7Asc66NpncDPzyQ4DsM04VfvbdBuheI/3VJilqjYtwAkJuJ7z8tjL8dvYx9HoOX9VCG
         hUHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783859862; x=1784464662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hNARwloA3rbnFq4jTz32GunvMhdlXc/eq0tF3XfoMbU=;
        b=E0Z4kQe7xo9IGNKXsDkZskVj3nAsh3O/gof/QJyCI5fpEHAsiVmFho6SukVR+XnmOl
         yTraDYdGIvHx5ecyB/PJKe0BorUKQQGYQrGJhJE/Y3H1+6C0pJknC6C4a41CgSDPedsa
         lDZAptcNky+68svyEY99jrJVzU0e+fyn8yWOZ8PjBrpuDutJoQ0xxu9edwHXkVVdgrGc
         VCPRIokBGwQOV5cY20E0OKqCeEE9w/Y3NQ804+oGGWMgTTOHsIEdpmLPrvJiiUiTmbcd
         jbuxSQM/RPzWiVH47Mw2MlvKyfNGcdY12JDSPVZpFr/oq9WpIY1hI+vzQ3YKoNLZtjE7
         wNow==
X-Forwarded-Encrypted: i=1;
 AHgh+RqU4Y7ICvcGAY7crwmNFbBFCd0/aqrfuKLeXWWL1mj0UM5xjPpEZFgkNDwaBYJUa8t6ectZCAuQ@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzv8i9aztb2TJy2KCZXShRaqQMkV69JTOxQ7Fmw4p7cHfjWefzB
	uagBtdls17xz3cW0BkCn2D+h37K6c5r6zGwBNsLRCYhHjeemAUKO3/ZQ
X-Gm-Gg: AfdE7ck+s/vQiQ+RUA5qGjVLC9Y3IRzKTyR+5VFVcXVGhkPwNpLGGf7ywUZqjd/UsW8
	OM2WdJYHPFbICGfiO1uo8CN4rjw2U5FUhteoReKmfX0pWJ3nx0UGyS6r+0OUmDSljM39323LH3b
	blhm9w1A396slViegm9mhaEZbsut6eI5OLndkqq4c+5yiXAMj1Zt3npEJ6bERQ75G5/9kR76io8
	j6VkdKMNnFGPJ8IIg6BZKlDRy2PxYDU5g+HWAYKC6IMMWAvPLRwNxAsyvVLQni4eYU5shZx8DbW
	yIMSxdMqqA5Krb0dy5GENH2KleQEawGn1H7PE+WISO8HNdP6SguAwvJ3rLDaQaI6vdc0FD7oRPt
	B2K6NeR4ceFLAYzPZiGsu1h7pDlAFl7tbkhC8kAGxCzwShemHW8zzCSIgepEUprLltNyumqL44A
	p2EabKUIrQY9k70+HU44jeMt4aXw==
X-Received: by 2002:a05:600c:45d4:b0:493:a966:d5b5 with SMTP id
 5b1f17b1804b1-493f87dc5d3mr55586175e9.2.1783859861600;
        Sun, 12 Jul 2026 05:37:41 -0700 (PDT)
Received: from fra-x8664 ([2a01:e11:8000:43b0:96d6:566b:35c:7b8c])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6f3c42sm280280485e9.1.2026.07.12.05.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 05:37:41 -0700 (PDT)
From: Francesco Magazzu <postadelmaga@gmail.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 4/4] drm/nouveau/clk: don't clobber reclock status when
 restoring volt/fan
Date: Sun, 12 Jul 2026 14:36:16 +0200
Message-ID: <20260712123616.1180830-5-postadelmaga@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260712123616.1180830-1-postadelmaga@gmail.com>
References: <20260712123616.1180830-1-postadelmaga@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IOWBD5CNZ5J7ZTNEZOSAU24GAUEDDPEL
X-Message-ID-Hash: IOWBD5CNZ5J7ZTNEZOSAU24GAUEDDPEL
X-MailFrom: postadelmaga@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/IOWBD5CNZ5J7ZTNEZOSAU24GAUEDDPEL/>
Archived-At: 
 <https://lore.freedesktop.org/20260712123616.1180830-5-postadelmaga@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

nvkm_cstate_prog() reuses 'ret' for the voltage and fan-speed restore
calls it makes after reprogramming the clocks.  Those calls almost always
succeed, so the status of the reclock itself is overwritten and the
function reports success even when clk->func->calc() or clk->func->prog()
failed.  The converse is also true: a successful reclock is reported as an
error if the final restore call fails, even though that failure is only
logged and otherwise ignored.

The only consumer of the return value is the error message in
nvkm_pstate_work(), so in practice a failing reclock is simply never
reported.  Nothing else changes, but a function that returns success on
failure is a trap for the next caller.

Keep the calc/prog status in 'ret' and use a separate local for the
restore calls.

Fixes: 3eca809b3c05 ("drm/nouveau/clk: cosmetic changes")
Signed-off-by: Francesco Magazzu <postadelmaga@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
index 4d546b07f..05336fc7d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
@@ -199,16 +199,18 @@ nvkm_cstate_prog(struct nvkm_clk *clk, struct nvkm_pstate *pstate, int cstatei)
 	}
 
 	if (volt) {
-		ret = nvkm_volt_set_id(volt, cstate->voltage,
-				       pstate->base.voltage, clk->temp, -1);
-		if (ret && ret != -ENODEV)
-			nvkm_error(subdev, "failed to lower voltage: %d\n", ret);
+		int err = nvkm_volt_set_id(volt, cstate->voltage,
+					   pstate->base.voltage, clk->temp, -1);
+
+		if (err && err != -ENODEV)
+			nvkm_error(subdev, "failed to lower voltage: %d\n", err);
 	}
 
 	if (therm) {
-		ret = nvkm_therm_cstate(therm, pstate->fanspeed, -1);
-		if (ret && ret != -ENODEV)
-			nvkm_error(subdev, "failed to lower fan speed: %d\n", ret);
+		int err = nvkm_therm_cstate(therm, pstate->fanspeed, -1);
+
+		if (err && err != -ENODEV)
+			nvkm_error(subdev, "failed to lower fan speed: %d\n", err);
 	}
 
 	return ret;
-- 
2.55.0

