Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F64105F7A6
	for <nouveau@archiver.kernel.org>; Fri, 13 Mar 2026 13:24:33 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2AAC410EC23;
	Fri, 13 Mar 2026 13:24:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OI0Ulaf9";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 07C39450EA;
	Fri, 13 Mar 2026 13:13:53 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773407632;
 b=TOTSbXEUYsw9s78wNlC5oRd4JYBFaLuLANBVN19hMvG9/BtB3+B2Sm2o0fwzixdlABf3v
 E36BSF5zXS6AbrG4RSK5HDmg77D31N8OOb//d97Ogv64WTD28ESE6bkjLf46XwbM+sM0s4T
 hZuzTeVmi4o3vpX+Po2WXOEaoqcqeWiVKmXDc4xbMByp/dcmt4DY9INXIEZhpif7nAb95OE
 z9tMeoIcanYJkpEPLvGiLbRBrmBk0UDCg2azhz7IILAWnAklSbsXVsvd4O8oLvC7shkNWO0
 dRtnNGo0iMtRosw5JuUtcMkFSOtWSZS912LidFwfBzPpTWa/OgjAXdN45zgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773407632; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=omqdlqhqg9w8rP5QQ/+0ZYQHRwMpTry/COrsHclV4zI=;
 b=xmbfIdYZz9zV1Ng0rsStyM5yfCkPj5T36s3y9gLqH9RdFFDxOpLAirAQJGbgjQl/B2z9J
 TfFuZmo+jGExSOdT9XJW1RCDXrf0WQaRIgzZ5FFn8G7jZ+6q9iI8Nf0/W7lhNI+bmkBCa/r
 YZoMlZvbXlLKedIZgfO3Foy0jzmKngBSWw4V1g6nLaBzyOyfay/Sd9Lor7CKbFSYplOtZFA
 Nalh024XfmJVNtWs2/lIEKlGz4HEc8+BFYjP1e0ggxND3bESuN0oBnWXiIuQgpPhd84szXJ
 nIqiFMsrzpDmnrA9LW8y9dFHV19aKYg9hXXuNbcOswy0e/MG0h7AriCVmWMg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id E0C0E44DDC
	for <nouveau@lists.freedesktop.org>; Fri, 13 Mar 2026 13:13:49 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C5F8F10EC2C
	for <nouveau@lists.freedesktop.org>; Fri, 13 Mar 2026 13:24:29 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id
 5614622812f47-46704177543so1451356b6e.2
        for <nouveau@lists.freedesktop.org>;
 Fri, 13 Mar 2026 06:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773408269; x=1774013069;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=omqdlqhqg9w8rP5QQ/+0ZYQHRwMpTry/COrsHclV4zI=;
        b=OI0Ulaf9MBkuL8UHNfULduu+KrXKjJsEIpkkpzwthZOaB/jUt/HI5VxNXqC3g5stHo
         BVzKDTh3tHvsNdfLFLW3rJwKuE3u76XK+HN1Xx7ITnv7+8vxGxIDNkOu/ROULNSljE5Z
         2TvmxnBVrCjwbdlMJUGqBwB1dg8fq4Lkz7Usd22Mqaw8k1ufRrbbtouXRFkxCtyIM2E2
         y4Y8ItWCXeHlE2qDR5c0DUcLmlZHxV/cMcBNdS3KjSgZePxZ4IhpYDJOX/Xce/JJ1y8X
         4OgJsFhhP82cg+dwVudc26cunjG6PupJDZ8RJQWR8yZFWDA8Mr3P8aYbW8MOFWseB52e
         SYsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773408269; x=1774013069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=omqdlqhqg9w8rP5QQ/+0ZYQHRwMpTry/COrsHclV4zI=;
        b=T5OyTezdRS0pAEgngcaYXvnMVMNEOBedxtBhPvESHWz0xTs0U6gnGj6PxlSE0PMSrL
         cYxY1V60RglA0ykHvXaUxKW/Iw2S6h8qXi40KLoA7X7E6g3v/FiiQ+Spjo3nyr9rDuqO
         rbYV5Zysf9Nk0R6DqTvtH1bOHLXb1Ddfb8Mp4Cq2EfSh0Zjwq6NQrj23HyDg3TDzT3K4
         vMR5xrXW+A3NNppfmx626TU3DzMHBbxDmkA08v00i5LvQt1V29sDqrGaewZI440ho3VC
         uW/NO7CA7xv6wtscFJIoubVlmTAW8BQdJ/v60esYtxILAldpGtTdjK6Fxay6RuSui2M3
         rZVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8IkRaUX9BRtON+95Yt0C4vmltoNtSZ4I+bfAIKJOpNaHa/cKWkAS3cEwy+UfcJDQifUM9+a/Z@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxrbGy8XMVEcVD6teLXgsUmAB4YvMflfKj/EnAN77jcpuzeynwM
	Z05t+14pp167y2ySUtpLUhGnfghdPJ7m3KcylE1A/PbBlvPr2wQFNXQu
X-Gm-Gg: ATEYQzzBTka9Dw0SsH9SH4v+8uMwirxgfMGCr4hSJ3S4m1jz5dHWb58z8IdaCtSCblC
	HZwMU0sWoXU9kdPSGDKdsdnIGAysB+E9oNNa8kstmobYEOIkcEz8IlWa2gYCizokhsdcBfKLdR5
	Vjbd0iXSerol7c+oaWF3INyXUglC50/XKCM3iIl+wXjBhp/2DO33ve7aym9V0JFhOpxsr5hRxyN
	0UsbuCbtTTc6hpvhH+hkwOwmCqqcFhQQdhoNp3gzVGjNsKVrybGP4A/Im5LRZRwDGl1pnPFZzPe
	fXGprEJ7ZvBvrGOZvoim2/M7OrbLlvcyZSh2fnnNBOIGNzJypNs3rA4k5M9Zq8TX3ir5urA/R+q
	Ebqvrzxpv0SMfhJfdp0vFsW4kUZo1rm13tR0g6xx3ru6XTEUyhbc3YUoH62mCF+2lw61+lL2R7R
	mMwqkuJQd3wEqduWuM9Jfv80JQ83NnkLFg44o9mQsjcWArw5RU
X-Received: by 2002:a05:6808:2218:b0:467:cda:f189 with SMTP id
 5614622812f47-467572ede3dmr1790509b6e.32.1773408268910;
        Fri, 13 Mar 2026 06:24:28 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id
 5614622812f47-4673434a35csm4795987b6e.20.2026.03.13.06.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:24:28 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: airlied@gmail.com,
	simona@ffwll.ch,
	jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jim Cromie <jim.cromie@gmail.com>,
	dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v11 43/65] drm-dyndbg: DRM_CLASSMAP_USE in nouveau
Date: Fri, 13 Mar 2026 07:20:08 -0600
Message-ID: <20260313132103.2529746-44-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260313132103.2529746-1-jim.cromie@gmail.com>
References: <20260313132103.2529746-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VN6I2A2G7U3HHEMISSYC6OMB2WMYKPEH
X-Message-ID-Hash: VN6I2A2G7U3HHEMISSYC6OMB2WMYKPEH
X-MailFrom: jim.cromie@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 christian.koenig@amd.com, matthew.auld@intel.com,
 arunpravin.paneerselvam@amd.com, louis.chauvet@bootlin.com,
 skhan@linuxfoundation.org, pmladek@suse.com, ukaszb@chromium.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VN6I2A2G7U3HHEMISSYC6OMB2WMYKPEH/>
Archived-At: 
 <https://lore.freedesktop.org/20260313132103.2529746-44-jim.cromie@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Following the dyndbg-api-fix, replace DECLARE_DYNDBG_CLASSMAP with
DRM_CLASSMAP_USE.  This refs the defined & exported classmap, rather
than re-declaring it redundantly, and error-prone-ly.

This resolves the appearance of "class:_UNKNOWN_" in the control file
for the driver's drm_dbg()s.

Fixes: f158936b60a7 ("drm: POC drm on dyndbg - use in core, 2 helpers, 3 drivers.")

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 5d8475e4895e..d205b58aff70 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -74,17 +74,7 @@
 #include "nouveau_uvmm.h"
 #include "nouveau_sched.h"
 
-DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
-			"DRM_UT_CORE",
-			"DRM_UT_DRIVER",
-			"DRM_UT_KMS",
-			"DRM_UT_PRIME",
-			"DRM_UT_ATOMIC",
-			"DRM_UT_VBL",
-			"DRM_UT_STATE",
-			"DRM_UT_LEASE",
-			"DRM_UT_DP",
-			"DRM_UT_DRMRES");
+DRM_CLASSMAP_USE(drm_debug_classes);
 
 MODULE_PARM_DESC(config, "option string to pass to driver core");
 static char *nouveau_config;
-- 
2.53.0

