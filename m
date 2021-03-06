Return-Path: <SRS0=nAgs=IF=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3930C433E0
	for <nouveau@archiver.kernel.org>; Sun,  7 Mar 2021 19:19:50 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81CB66516B
	for <nouveau@archiver.kernel.org>; Sun,  7 Mar 2021 19:19:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81CB66516B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=nouveau-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 311F86E1BE;
	Sun,  7 Mar 2021 19:19:50 +0000 (UTC)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B926E500;
 Sat,  6 Mar 2021 11:17:58 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id s16so2687100plr.9;
 Sat, 06 Mar 2021 03:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xdaYIHbo42EzW4+tTrCCIBJZrl43XKwjfdhXKE79QkI=;
 b=OU8IkoIgBcGiyXFXs7IFjfZBTGGs0bWhDh2k3i2p+t5/sRh2gppxbcqpCrkBP/7Lne
 Dp0G+U77bTBi4eAhBRLbDSjcd6glcsaLr9G0ohROwCRG1diGuR7pp1U7UoQeaA2BE0zf
 x3zEuKMokoALIZ7dgB4wqajTb7GTVjLo+ocBnn6BeYOUqgNYlYxgSTv31GuDJ0kVQ6Lh
 go5XkMfJBomHLOvtZzTo1gDKE/iBCo9C78UGgbHxepzHYRDuEVr+W6DCwqgGaG12weBS
 uDDfYHxABSD2akfNtdqx15BmZcqQ2ezXQHhiYfIVTd+wZL66l3gQY191krzaNGOJsoyP
 3aPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xdaYIHbo42EzW4+tTrCCIBJZrl43XKwjfdhXKE79QkI=;
 b=dUx76KaPRXr2l4NUSb/Qm+TjQ9BH4AizJy+Pq/lmJLh8rMB/qZERnYJ6ThisOTRuuI
 kwpuGB8kE/RoOhLi8dLYmO6GG8i+F6B3DOCbbZD8XvwrvJVibPD9G7pbj61TCjue3jQ6
 C+E5qf88b1jfUbNnxuspPH95IL/04PZ4JKjYy44TBNAuj3pHSZDroGwdLywMglcgrAjc
 tT8Zg68iZrigHDVs+/EqrdXkx/0tBu56VYmMo95vtbQKXBXsVvjJyQ7wpOSl+URVq0j6
 tcNrS3b18F6K1loYRez6Rceh/RY5dWl0Pw4FIOLbjGQ89IMaw9iHo9NVw9d5cechmEMj
 II5w==
X-Gm-Message-State: AOAM533gsW+KOwpSTuPFBeSHZM2P1dJ92JAvXQem1xfjrQLSEibBx9Hg
 scV+DbGp1hD/64q3KiI74yI=
X-Google-Smtp-Source: ABdhPJx4gWaZVfPNcXcXFDwquU8hwFVxF7LWE6D2TVf8jy2qAw7j6kTV29gabrWD9ercYIzdRabKrg==
X-Received: by 2002:a17:90a:6286:: with SMTP id
 d6mr15012274pjj.234.1615029478197; 
 Sat, 06 Mar 2021 03:17:58 -0800 (PST)
Received: from localhost.localdomain ([178.236.46.205])
 by smtp.gmail.com with ESMTPSA id u15sm4925194pfk.128.2021.03.06.03.17.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 03:17:57 -0800 (PST)
From: menglong8.dong@gmail.com
X-Google-Original-From: zhang.yunkai@zte.com.cn
To: bskeggs@redhat.com
Date: Sat,  6 Mar 2021 03:17:51 -0800
Message-Id: <20210306111751.216932-1-zhang.yunkai@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 07 Mar 2021 19:19:49 +0000
Subject: [Nouveau] [PATCH] drm/nouveau: remove duplicate include in
 nouveau_dmem and base
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
Cc: airlied@linux.ie, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 zhang.yunkai@zte.com.cn, daniel@ffwll.ch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Zhang Yunkai <zhang.yunkai@zte.com.cn>

'if000c.h' included in 'nouveau_dmem.c' is duplicated.
'priv.h' included in 'base.c' is duplicated.

Signed-off-by: Zhang Yunkai <zhang.yunkai@zte.com.cn>
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c           | 1 -
 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.c | 2 --
 2 files changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 92987daa5e17..f5cc057b123b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -33,7 +33,6 @@
 #include <nvif/if000c.h>
 #include <nvif/if500b.h>
 #include <nvif/if900b.h>
-#include <nvif/if000c.h>
 
 #include <nvhw/class/cla0b5.h>
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.c
index c39e797dc7c9..09524168431c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.c
@@ -20,8 +20,6 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 #include "priv.h"
-
-#include "priv.h"
 #include <core/firmware.h>
 
 static void *
-- 
2.25.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
