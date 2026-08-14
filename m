Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D86C5DF72
	for <nouveau@archiver.kernel.org>; Fri, 14 Aug 2026 20:36:26 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id ED0B810E850;
	Fri, 14 Aug 2026 20:36:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="aIuSW2Yc";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 66A31477F5;
	Fri, 14 Aug 2026 20:20:03 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786738803;
 b=CK5F9A1W1MVtg222FIsnjkmdC0NPZfXkC+IFW1Ug1K4PB5I48CB92EdqUcX2eNyuCfOYQ
 RIDvTQvrZnM3NaFP3bbslJRMarRQXTXCKVboDZeqtJNxWyXmszvZNbojjy0e52r9tOx1h6g
 /9Frqbl5W6xHFYuI0K6M0tt9xAtrRhOdBVST2wt6Fkl0/ij5VpCAFQoGYm8+FUsGYvn3MlV
 ZOzC3U4AzkX3akGBNLTqBLimWAtcrdyGBAZbxxvqMgflz7xlX/2uFuDhRZSOp/6Tp5gvZtv
 cGZ1WQ6QSmlgUwAMiDnF54zgo28kO4hWzNceULyY25hbBl/xAR7eVkyWxM3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786738803; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=UEzS7cgh0s3kpDJoSKFSaeUbfz26XKFwvX4uV6Y0kQg=;
 b=iGb+HhAKJquUVnoKD8xtYkix8khwkRYEP2nvZw64aXVXUoavbtsB8lAp34/n7f54ITEaT
 xjOw2NvYjHhp4jAyWbBwmDG1tgrX0WqMc2oOVejZ954o60UU+0eZ1Rw3H+f01Sh6zpDcP/g
 woyXcQix5l2hlOEIwXKuIQhXEJLKYRWHK7ORnI2nzdupWe2Ya52Jt0b+dQlqtYXhPFQqyEG
 jEpaI0SWLZTM+Vl8Te+WysIZh6XGrvKYVzAKE2wG/jldCuWAMG9JCA59WCRu8QO6D7XuArC
 vaQT+gjZmK4QZ8KWDxA6jDgExraeAJ/gCmfCDiLDC2H19ouoCOtg8iyc1rIQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=redhat.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=redhat.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 15F16477DD
	for <nouveau@lists.freedesktop.org>; Fri, 14 Aug 2026 20:20:00 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4617A10E93F
	for <nouveau@lists.freedesktop.org>; Fri, 14 Aug 2026 20:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786739781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UEzS7cgh0s3kpDJoSKFSaeUbfz26XKFwvX4uV6Y0kQg=;
	b=aIuSW2YcYbKcOASFqM3CuHW+dPBpE4EH9vohusOZLAswwdY5aY0M5RQZypE6mNIdu5dT7Q
	R6Sjv69VpVDpuiOfY86yWyvLu800YexTVwvn8jx/TT9pyeYafgLPJhGLQNx1bcEXjkZvXC
	+s76asttlkjW+vQOoNYWHzylMrh5TsQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-459-oqOvZT7bMEW5oR1aBhdpHw-1; Fri,
 14 Aug 2026 16:36:07 -0400
X-MC-Unique: oqOvZT7bMEW5oR1aBhdpHw-1
X-Mimecast-MFC-AGG-ID: oqOvZT7bMEW5oR1aBhdpHw_1786739765
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8FF7D195608A;
	Fri, 14 Aug 2026 20:36:04 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.64.233])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 94B5E197751A;
	Fri, 14 Aug 2026 20:36:00 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	nouveau@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-samsung-soc@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	intel-gfx@lists.freedesktop.org,
	linux-aspeed@lists.ozlabs.org,
	linux-rockchip@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-mips@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	spice-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	imx@lists.linux.dev
Subject: [PATCH 4/5] drm/vblank: Use drm_for_each_crtc() in drm_vblank_init()
Date: Fri, 14 Aug 2026 16:35:32 -0400
Message-ID: <20260814203542.1405135-5-lyude@redhat.com>
In-Reply-To: <20260814203542.1405135-1-lyude@redhat.com>
References: <20260814203542.1405135-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: 1xO0biEmLFIkLcXrnAhJSib_fh9zWJjdI1-YiKsHJRQ_1786739765
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: MPPSIWVWDGOLBM756VJGHOG6SYJNZJBT
X-Message-ID-Hash: MPPSIWVWDGOLBM756VJGHOG6SYJNZJBT
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MPPSIWVWDGOLBM756VJGHOG6SYJNZJBT/>
Archived-At: 
 <https://lore.freedesktop.org/20260814203542.1405135-5-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

No functional changes yet, we just should be using this iterator here
instead of manually counting the number of CRTCs anyhow.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/drm_vblank.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 17283e8920378..d57405050554f 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -547,19 +547,20 @@ static void drm_vblank_init_release(struct drm_device *dev, void *ptr)
 int drm_vblank_init(struct drm_device *dev)
 {
 	int ret;
-	unsigned int num_crtcs = dev->mode_config.num_crtc;
-	unsigned int i;
+	struct drm_crtc *crtc;
 
 	spin_lock_init(&dev->vbl_lock);
 	spin_lock_init(&dev->vblank_time_lock);
 
-	dev->vblank = drmm_kcalloc(dev, num_crtcs, sizeof(*dev->vblank), GFP_KERNEL);
+	dev->vblank = drmm_kcalloc(dev, dev->mode_config.num_crtc,
+				   sizeof(*dev->vblank), GFP_KERNEL);
 	if (!dev->vblank)
 		return -ENOMEM;
 
 	dev->has_hw_vblank = true;
 
-	for (i = 0; i < num_crtcs; i++) {
+	drm_for_each_crtc(crtc, dev) {
+		unsigned int i = crtc->index;
 		struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, i);
 
 		vblank->dev = dev;
-- 
2.55.0

