Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693B5C4452B
	for <nouveau@archiver.kernel.org>; Mon, 20 Jul 2026 11:26:08 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A00CE10E8B2;
	Mon, 20 Jul 2026 11:26:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=baylibre.com header.i=@baylibre.com header.b="ofzioy2+";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 67CB64723F;
	Mon, 20 Jul 2026 11:10:41 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784545841;
 b=L/9As7/ENC4zjbq4SiTAs53t2BVlfr2VMNAvwGn3ATIYnCkDbRG1kSAdJgakgdJhEV5L4
 KYo2X/vf7/gEX1txJAbAX8+W4c+IdnFUVfrJhDnV1M8IPqSSV9wnZMpirfd+rIKj5ZLbQhR
 szFyOmBGJX+jqg1CtARDQparh1yGUKalKXD3/RNra/SHsBIpP2GrhmfuM+Q1pkN3hVMOUAd
 NPDhY2gHQY9dtorqPkFbJihORG2grWPdNLDyySqTIXXEnWRujyHLBimWoJvOk6zuYltYD27
 jLRb5t7gbhv8dvU4lguEcxMWqJLlHLabillq2gr1IshNphdlMO8Xpti++8uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784545841; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=0kZaE29KZfxfDEOFCh44C3Vpuraa0Raea1WRcoaoqWA=;
 b=oDsGGt5VhfXA38PbFe5EFiHB+/mKcW1O9QGXtmsAOkmplChnD8e4ff3HPcfDr/6v5E8Or
 3I5ddhMvQcoOAu01yEabAWiJ/MsSbAYA9RigsAppxNOvf6FNGEzhUeRPZZNa7FZnKQe1f7q
 bZgTEuSttlNzrls5+Jz2Ol2eRIX7+BubxGidkZn/icmrMpGdHwAA2qUX9xxU9iOLj2GbgPv
 wOFUI5FRmUrVGSDMqUaxQwWmB28EEt6B4Nj3G4isDMgrTp9NecvQLvaM+aIE6vC7OOdkXdq
 i3oleugHLQW2x/t23FHGzbZIj8Pe5vgYb/DkI6AGqW+n43lrpucCmlLvCKkA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=baylibre.com;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=baylibre.com;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 100B140408
	for <nouveau@lists.freedesktop.org>; Mon, 20 Jul 2026 11:10:38 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 148A410E893
	for <nouveau@lists.freedesktop.org>; Mon, 20 Jul 2026 11:26:03 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-47362928f65so9058103f8f.2
        for <nouveau@lists.freedesktop.org>;
 Mon, 20 Jul 2026 04:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784546762; x=1785151562;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0kZaE29KZfxfDEOFCh44C3Vpuraa0Raea1WRcoaoqWA=;
        b=ofzioy2+tClJXdJQVp6Tz9bNz757M3Q4gLH6H5hPN0kNYQ92GYxvZE2FzkectraBGQ
         9yytZkuo8ADeCwCD81Sciai5bI/+zkI1IsS+hGuY6YdtnDEMDkmY+KLf1ZPtYbO/5FWe
         5PgAxXv9Jy0h0l0h14NyatQ4WcBJpXkK/ltcttLXlc6xugSp2/Pf/PJHNp4atnuJedaH
         IOOSN4MgQfckPaSio32dKpzQuV9Cdln2UbZu9cOwjwkAzZlv8QoqyHpxeL/H5S3ycAmq
         n5/7EEILFC2m6Zw5zbxXyYJKnWz/hHSEF2GELwt1uFvJuTLPER8XELALFt3KqmQ97Xsx
         KnEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784546762; x=1785151562;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0kZaE29KZfxfDEOFCh44C3Vpuraa0Raea1WRcoaoqWA=;
        b=nIvumq9pr+dQHrZqv3L3IxhdQ85NGhyUeMaUdwXaeY/silXPo0oiDolbV0QyL0C5W9
         AGJTCVxFv5sXmqN+LG1Ire8bMbGMhH5zY7DHVCZO/Ru8k0XhlKyvMsTgWdUr70aTg90R
         ZRzJMiBf3XqLqIRsocPFadNJXj1x6O3e1p408zxq4zbS3usxlT0FAWsMzLuJnLPIlM2S
         tC2xdtsyhzcz/JBZDHHsUD7qGZMxyKYyhq25oHucknPmIsnIuZcS0p/2A3EaLdzWU9SK
         XSMaxIYfH47+tNcKLNdmKGAJSUdRoKgh+w4tfqfxUNcFEY97MnQdorVTW2vYXCNHnq56
         snsg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpHdpxvKyTzFhARyryYMP9hTBZWvyklSZpOMTrrzsw9+LhDi64SXOEwzIqBM3V/rgcGLpWGStdb@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzwJoCMJlfjUkJVLZ8qLUrZTSfEBEU7UajWeid7rTTfn2tM3jdR
	x7qDjOfkeh+lgzeXB3Avze2+kpF27jTBeVlQ/JfcoESeDT1Oh/XXsrO9M1VMcrl8Ipw=
X-Gm-Gg: AR+sD11yLIb65tpe0nCOR5e+lf/51t9LpV+WQIqqv/GpHRpd8WrNqDOdywlq0I1XeDD
	XFcfKo2Zd83/mNyfa+8lrfip+6NXpcZdnMyUiat1fbmeSiF2eC0c2pkVWBQiAlbjgj5YNdhmbJF
	THwSKWIeEy8BdkpJtxj5JKAjEUN7gfgp9zQuZ4eOEXT51VV7DOCzEg2TkLSX0BxXbgVxs5TPgTx
	wrZl2L4IIe3sWo1XxqOF67zwtvpyG4reMqDIudI8f0t+MfBFllSycwGmtsHQ06fjIV6WnvZObx9
	IgtyLug10FL6EwNDkSEbHUzDta1R1p4nTXG6xFzditsHk11pTYmM4DJYMDGTKRDEfk6og3KnLrx
	VpaWFFB3Jc1eAaZXW9SatbxriYvwoSw8QDEHIDQ7mx3+Jq2bybdvPCdBmoAo/PrJo1/d9TvsAqi
	4f2JdI6OpLbM+Koo7+WSXBS41Q3QFHn2l9iRnjP0hifBafeLRQ+0lW9bwyl4Tf8QuwBQ==
X-Received: by 2002:a05:6000:2084:b0:47e:4379:a4fd with SMTP id
 ffacd0b85a97d-47f6230e6e8mr16385810f8f.19.1784546761738;
        Mon, 20 Jul 2026 04:26:01 -0700 (PDT)
Received: from localhost
 (p200300f65f47db048587886ecb5b26b2.dip0.t-ipconnect.de.
 [2003:f6:5f47:db04:8587:886e:cb5b:26b2])
        by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-47f6980582csm21915987f8f.13.2026.07.20.04.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 04:26:00 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?=
 <u.kleine-koenig@baylibre.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Liu Ying <victor.liu@nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Peter Senna Tschudin <peter.senna@gmail.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Martyn Welch <martyn.welch@collabora.co.uk>,
	Russell King <linux@armlinux.org.uk>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Xin Ji <xji@analogixsemi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Marcus Folkesson <marcus.folkesson@gmail.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH v2 0/3] drm: Use named initializers for arrays of
 i2c_device_data
Date: Mon, 20 Jul 2026 13:25:46 +0200
Message-ID: <cover.1784545092.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3145;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=DXHsMDsmw7OPrQMasfuuVj90fwlpF7W2mtp2LHUpCd0=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqXgW7gpMZ25NHhb69GDKSEdwCHXzn3kK+CL6GQ
 YEYOEYraPyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCal4FuwAKCRCPgPtYfRL+
 TsRrB/9HH4ICrBdcptv8zk9/ja89r2p4MVgyQqpVESitnWboEdmXu76hkkMrDIezARlH0zh27bM
 KHi2NKla4E4G+m0Id7jCnnqCJpJ+IpM7B7Om8rRZOx+Ma7oL9qGFS7Y7nnNz4pJgnMreSiqtnTk
 201oXhn/mZSy8BELrZk3b0WQ9jjX5BBqxRp4VSo61PWOCNBX/+Qmhd0FQOclDr5fjGJ1tE1wBYo
 NBlvms2YI562rbIyXQR1AWJ6dLfEbAtm5djiVuaJxqCOrzuOyznOyQL/96kV0qkNOouaJpnF3r+
 cQKziezR+2biFbt1cn8e8BF52gllfIQzS8I70AumtH/2E53H
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NGOKPCSQYOUECPE32CIR4YSF5QQECJZQ
X-Message-ID-Hash: NGOKPCSQYOUECPE32CIR4YSF5QQECJZQ
X-MailFrom: ukleinek@baylibre.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NGOKPCSQYOUECPE32CIR4YSF5QQECJZQ/>
Archived-At: 
 <https://lore.freedesktop.org/cover.1784545092.git.u.kleine-koenig@baylibre.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hello,

the objective of this patch set is to prepare drm for a change to
i2c_device_id. See
https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/
for the details.

(Implicit) v1 is available at
https://lore.kernel.org/dri-devel/20260518100401.631351-2-u.kleine-koenig@baylibre.com

I was asked to split the patch, so that is what is done here.

The first submission received a few review tags (by Liu Ying, Danilo
Krummrich, Laurent Pinchart and Luca Ceresoli). I only added Luca
Ceresoli's tag here as he explicitly noted that I can when splitting.

The patches are pairwise independant and thus can be applied by whoever
feels responsible for it. They are only grouped here because they used
to be one patch and are about the same objective.

Best regards
Uwe

Uwe Kleine-König (The Capable Hub) (3):
  drm/bridge: Use named initializers for arrays of i2c_device_data
  drm/sitronix/st7571-i2c: Drop unused assignment of i2c_device_id
    driver data
  drm/nouveau: Use named initializers for i2c_device_id arrays

 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c           | 10 +++++-----
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c     |  2 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c              |  4 ++--
 drivers/gpu/drm/bridge/chipone-icn6211.c               |  4 ++--
 drivers/gpu/drm/bridge/chrontel-ch7033.c               |  2 +-
 drivers/gpu/drm/bridge/ite-it6263.c                    |  2 +-
 drivers/gpu/drm/bridge/ite-it6505.c                    |  2 +-
 drivers/gpu/drm/bridge/lontium-lt8713sx.c              |  2 +-
 drivers/gpu/drm/bridge/lontium-lt8912b.c               |  4 ++--
 drivers/gpu/drm/bridge/lontium-lt9211.c                |  4 ++--
 drivers/gpu/drm/bridge/lontium-lt9611.c                |  4 ++--
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c             |  2 +-
 .../gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |  8 ++++----
 drivers/gpu/drm/bridge/nxp-ptn3460.c                   |  4 ++--
 drivers/gpu/drm/bridge/parade-ps8622.c                 |  8 ++++----
 drivers/gpu/drm/bridge/sii902x.c                       |  2 +-
 drivers/gpu/drm/bridge/sii9234.c                       |  2 +-
 drivers/gpu/drm/bridge/sil-sii8620.c                   |  2 +-
 drivers/gpu/drm/bridge/tc358767.c                      |  2 +-
 drivers/gpu/drm/bridge/tc358768.c                      |  4 ++--
 drivers/gpu/drm/bridge/tc358775.c                      |  4 ++--
 drivers/gpu/drm/bridge/tda998x_drv.c                   |  2 +-
 drivers/gpu/drm/bridge/ti-dlpc3433.c                   |  2 +-
 drivers/gpu/drm/bridge/ti-sn65dsi83.c                  |  6 +++---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c                  |  4 ++--
 drivers/gpu/drm/bridge/ti-tfp410.c                     |  2 +-
 drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_drv.c      |  2 +-
 drivers/gpu/drm/nouveau/dispnv04/i2c/sil164_drv.c      |  2 +-
 drivers/gpu/drm/sitronix/st7571-i2c.c                  |  4 ++--
 29 files changed, 51 insertions(+), 51 deletions(-)


base-commit: 0718283ab28bc3907e10b61a6b4be6fefa1cbb2f
-- 
2.55.0.11.g153666a7d9bb

