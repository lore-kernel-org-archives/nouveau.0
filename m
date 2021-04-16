Return-Path: <SRS0=1s4d=JN=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DA9CC433B4
	for <nouveau@archiver.kernel.org>; Fri, 16 Apr 2021 14:38:21 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAA9B6115B
	for <nouveau@archiver.kernel.org>; Fri, 16 Apr 2021 14:38:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAA9B6115B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=nouveau-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60B326EC18;
	Fri, 16 Apr 2021 14:37:53 +0000 (UTC)
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5926EC04
 for <nouveau@lists.freedesktop.org>; Fri, 16 Apr 2021 14:37:46 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id h10so32525414edt.13
 for <nouveau@lists.freedesktop.org>; Fri, 16 Apr 2021 07:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QN4aBNwxKOCABxwfpyuG0Xk/7oUm3WT2PgkGnXFzadY=;
 b=RwSZt871KIA+ZvsKOJpIutalCd3bcubnhe5yJ8ZZvr1njX2RG+VN1gGQd8B37zPJu/
 9xA9SobU/iCgxon/a79k928X3sbW/Xlu5UGL+KSDQSMWyyoR1EUGtMzfiGBEtSkoD/1w
 Yo0mDcvabfy77pd1QqB2qJ5Rzl8bv7Zums/J7av8dbzQpx+EpvLFCcpOa/wletkE0Kie
 oBgD09ElxbYvm/sK6ZwyTKhnXlWhwQZ+NuMTqJH6HpdEuGbMbz3uW47dPpvKl6eRimEL
 +PSoJBKs8IEUisnQOl+YPDBubofRWi0JVa2FAJ5reYSbOIBuEvIhhtHgC4D5T696N9FW
 O0Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QN4aBNwxKOCABxwfpyuG0Xk/7oUm3WT2PgkGnXFzadY=;
 b=AMj7v/ySVwSalyOlahTF+a6krqy1v0nM23pN0G/bqsDv3g3jQQlNAUFwl9UqDHWKUK
 kSzB4K3fU/i0Beq3n3sdG3+rMzriOwUMfzFpp0sW3IzP/LVwO3ZJ0gz3wwUw6B9eGgIL
 N8fCZdndfuty5QtOM2TpYOmioFCiYLvYQTgkk74Qwoe/x0r1/5+EtSu2Z6mRUJSIogjW
 WiGdjTmQafVvW+CcswJCFUeVsZSK/VveOkB4l0MgMwOQLKoBmND9SNgttL6SiGVmkPP1
 Tb2yNIkm+wpkmQrMewxXWNwUtBXZyctb+j6UqpxkIxdJJwj7xjWHg2D5EOTrRsXgTwZF
 WsPQ==
X-Gm-Message-State: AOAM532WOD1NuSPMgBPbB3IJ24CF3jJ+fYJJvK4GkfX6Kqcq7VjYGyW5
 ThDoKB7Y/niPUJErDWQtmfMifA==
X-Google-Smtp-Source: ABdhPJw0G9wVgPhyke4No6DirCQEXf+UVha822Lo3qpRPrJK540wDzZh2MuxAjhp/0+TJ35klHf7Tg==
X-Received: by 2002:a05:6402:31a9:: with SMTP id
 dj9mr10380014edb.343.1618583865142; 
 Fri, 16 Apr 2021 07:37:45 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 07:37:44 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 16 Apr 2021 15:36:59 +0100
Message-Id: <20210416143725.2769053-15-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210416143725.2769053-1-lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 14/40] drm/nouveau/nouveau_ioc32: File headers are
 not good candidates for kernel-doc
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/nouveau/nouveau_ioc32.c:2: warning: Cannot understand  * file mga_ioc32.c

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/nouveau/nouveau_ioc32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_ioc32.c b/drivers/gpu/drm/nouveau/nouveau_ioc32.c
index adf01ca9e035d..8ddf9b2325a42 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ioc32.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ioc32.c
@@ -1,4 +1,4 @@
-/**
+/*
  * \file mga_ioc32.c
  *
  * 32-bit ioctl compatibility routines for the MGA DRM.
-- 
2.27.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
