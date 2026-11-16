Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DB8606A32A
	for <nouveau@archiver.kernel.org>; Mon, 16 Nov 2026 09:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=X3LBCbS4
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0C20E10EDDA;
	Mon, 16 Nov 2026 09:12:35 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A1B224936A;
	Mon, 16 Nov 2026 08:52:45 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1794819165;
 b=V6Cxtv6bhvtrXEFccsvJ9/76pA1U4bTTl4N1FIo5O6lMeIHtXfjkSDUekO0vZgBZYPMuQ
 MiGLUg7pG7Dhw/2bZQTLjPswf9oW2u8AHevHoV87PHA0WU+IdC+23PbnYv1hx5MJEKkGfcP
 cQxmXy1KOcV+jWOyOyfIrPgVx6Yv5Sn2qVwt6iLczYRyw1KkXUACQwS9060ngz2Oh3h6gba
 1LO0laYh2NnKPxSVJI/2DTvsmgBSVuLYsDd17vPW/xt3oWi5SGmsFIDjGRirnOxOyNIMaFD
 ykPblC2Ie3junL0NpaD+nF1kD9viaRtrOqj26axB9fhHH63caI/ILze1Wqpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1794819165; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=TFvQP8aoubAPDYf0wglCKRKdVUTp2ONcSkD8GwBBfng=;
 b=Ai+RXZLYkvAMxWLIVHAzRIxzROzE1zOPwFOGe27MBhbK3CmKPuJ2VT34BoL20jckSlAhN
 mvO72IUORzZfJgYNkOzjUWC0HnzW8j8PUUUPLbfZVhfiYOh9AIcEEYfZXIaKJNI9ov/Xv+d
 UXWZULgQzA6Y99NI4zqw6xDFUOQsmFbkvuBjkm4hsouuRq8Go270IvzcSxR446ZeglV1bWb
 XUQEc3lQcHNqAvFBp1FGgCaEUAEp7NCtiwvZCx6Mvddw2Xw5AGmVgL3vUJzSrUWrhmB2aaj
 d0sf4xN2Q323xEGVsw8wVN4vQzQO/WkHJm1WGAInrwjOsVq78MJVupbHdiXA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=intel.com header.i=@intel.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used Org Domain Record) header.from=linux.intel.com
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=intel.com header.i=@intel.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used Org Domain Record) header.from=linux.intel.com
 policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id B22CB49336;
	Mon, 16 Nov 2026 08:52:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A5D3210EDA3;
	Mon, 16 Nov 2026 09:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794820347; x=1826356347;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JGdJovIRxiswmzQ/OVHyoYBXcmjw0GscVzdw8XDjrRY=;
  b=X3LBCbS4sc4JXyPJNWSe8/J34ohQ8mZ7K7tAc0pD8ozZfSc08+f3Cn/p
   LmPxaaoOpoLMPSQOrU6aoVwe8p7bWqdO7930toihQkyQSwgGnnz5Xji+9
   pnneD10fE8+lB6WY7XqOHxB/XjeM+TxWGdAvMqfdm4XCjbc0lWnyGtPmu
   KtM+piYQaNAAjiqXTF76gB6AmtsBIsyKWAIYWPUwjL76YFniuFLQpcviv
   7+I7VehdDPuTj/3dM0PXyC9WX8RnBphoDMvLaOw9sTHEExC4rXzCP8MvU
   LTT31YTfbfKGZTCm0rM0VVX5/9HHujbKffchXDjXlD4t++BjKFlQ80mS5
   A==;
X-CSE-ConnectionGUID: i5EYWpxoT6KS7KWP6tL0EQ==
X-CSE-MsgGUID: nmW9RUYzS16JBw1dW47a3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3590920"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400";
   d="scan'208";a="3590920"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 01:12:26 -0800
X-CSE-ConnectionGUID: J66DpBJ2RRW4yBSWi6jh6g==
X-CSE-MsgGUID: 0uoTtDp2RV+r35svTUE34g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400";
   d="scan'208";a="9826077"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.93])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 01:12:19 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 04/12] drm/atomic: Highlight that bypass commits need care
Date: Mon, 16 Nov 2026 11:11:22 +0200
Message-ID: <20261116091130.13950-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261116091130.13950-1-ville.syrjala@linux.intel.com>
References: <20261116091130.13950-1-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HIAJMC3VNBLS7GDW3ML5D73D7TTA2UQV
X-Message-ID-Hash: HIAJMC3VNBLS7GDW3ML5D73D7TTA2UQV
X-MailFrom: ville.syrjala@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Erwin Springer <aot.lerwin@gmail.com>, amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Christopher Snowhill <chris@kode54.net>,
 Dharma Balasubiramani <dharma.b@microchip.com>,
 Dmitry Baryshkov <lumag@kernel.org>, freedreno@lists.freedesktop.org,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Huacai Chen <chenhuacai@kernel.org>, Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 Jianmin Lv <lvjianmin@loongson.cn>, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 Maxime Ripard <mripard@kernel.org>, Mingcong Bai <jeffbai@aosc.io>,
 nouveau@lists.freedesktop.org, Qianhai Wu <wuqianhai@loongson.cn>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Simon Ser <contact@emersion.fr>, wayland-devel@lists.freedesktop.org,
 Xaver Hugl <xaver.hugl@kde.org>, Xi Ruoyao <xry111@xry111.site>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HIAJMC3VNBLS7GDW3ML5D73D7TTA2UQV/>
Archived-At: 
 <https://lore.freedesktop.org/20261116091130.13950-5-ville.syrjala@linux.intel.com/>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Document the fact that implementing bypass commits
need actual care and attention to make sure the
effective commit reordering is actually safe.

Cc: amd-gfx@lists.freedesktop.org
Cc: André Almeida <andrealmeid@igalia.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Christopher Snowhill <chris@kode54.net>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Dharma Balasubiramani <dharma.b@microchip.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: freedreno@lists.freedesktop.org
Cc: Gustavo Padovan <gustavo.padovan@collabora.com>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Cc: Jianmin Lv <lvjianmin@loongson.cn>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-tegra@vger.kernel.org
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Maíra Canal <mcanal@igalia.com>
Cc: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Mingcong Bai <jeffbai@aosc.io>
Cc: nouveau@lists.freedesktop.org
Cc: Qianhai Wu <wuqianhai@loongson.cn>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: wayland-devel@lists.freedesktop.org
Cc: Xaver Hugl <xaver.hugl@kde.org>
Cc: Xi Ruoyao <xry111@xry111.site>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 include/drm/drm_modeset_helper_vtables.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index d28d8ffc66b4..1036744b9922 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -1430,6 +1430,12 @@ struct drm_plane_helper_funcs {
 	 * given update can be committed bypassing the atomic commit machinery.
 	 * That is, if it can jump ahead of the state currently queued for update.
 	 *
+	 * Extreme care is needed to make this safe as the already queued commits
+	 * will not be aware of the bypass commit that overtook them. And the
+	 * state that the bypass commit will observe is the final already queued
+	 * state, not the current state at the point when the bypass commit
+	 * will actually execute.
+	 *
 	 * This function is also abused by drm_atomic_set_property() to determine
 	 * if the plane can be flipped in async. The flip flag is used to
 	 * distinguish if the function is used for just the plane state or for a
-- 
2.56.0

