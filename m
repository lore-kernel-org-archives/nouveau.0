Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B0ECD4F3C
	for <nouveau@archiver.kernel.org>; Fri, 15 May 2026 18:48:15 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C2EB410F3BF;
	Fri, 15 May 2026 18:48:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ltyBb/RN";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3E5124290C;
	Fri, 15 May 2026 18:35:13 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1778870113;
 b=TQ4ytqRvcVnu5AMXzGDZA88+iuXbhcYX22pyGRJcQBo4NLXlYML1Y+qlKYNyiDVMG4F2o
 FZpWcvvxbsRo2ueFx/KRtQi/OfCAGVp99+NqgkE2ODg7jvisA2yGu0g4NtAU2n5FAtLxufT
 WyXIr8qtPgck1Y/wJLSas0NnjC4WXLXPNs+6RUcnIX8qOWNdgwnF6R/zShlAt5kadL7DfOs
 H0ZzTK4JJ6z+y3vkzVMvJ2dwWiZ2+FZ+Bclc64fG0XernCzXpkmzVX2c07Olp0/dbR3XXXx
 DQUaS+Ji/JsgIzukODgosiGjfxlgRX8e/oqvzX9r/BJAzE9zaQ8K3v6YyX+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1778870113; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=1l+SpR/UEyvWMAal4xyrEteWb4GfZNc3Ty6R5bexWb8=;
 b=XeDaiVRGl95msRX62ASu/NvShlcC354AYaoGhnwtbL+RFXRNUwyZEfxZSi+Kmi+BSQi9h
 UHukV2ugxPOvCRuMcQtmBkoTXdqpB2v9xtz7II/H5cRYjJB4YeSPqZY4hbURbDDmXKYh2XM
 zdTl2MxTt+TAw1kM/GWVHgTfKDWLpqR5hX6NQ7QKWW3sp+mXogKGmIv8IL412eaV8QvxLSF
 RxMd1vWdLfvq8+gaTgzwt94MdLki1xStkSvFLiAXmAtoExZmKt01QBon6TSnbgdABAZTH40
 oG8LPkzE2HoIVhI+ccGPtjP7gHUZG8Ms6ZvwCt5LdMZdP+CXrHPPcVwZgazA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id BFCC141C86
	for <nouveau@lists.freedesktop.org>; Thu, 14 May 2026 17:28:51 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AF87B10E4E6
	for <nouveau@lists.freedesktop.org>; Thu, 14 May 2026 17:41:49 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5a62f43b76aso7291253e87.3
        for <nouveau@lists.freedesktop.org>;
 Thu, 14 May 2026 10:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778780508; x=1779385308;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1l+SpR/UEyvWMAal4xyrEteWb4GfZNc3Ty6R5bexWb8=;
        b=ltyBb/RNrS0Lx0eUMykFWZQWSkMlqr4a1XfzaI+Jtga48yu+2bPGIN5tmQkejQR4Bq
         BwZmv53jremzcQxCevimW8/cIjH0ryIdRD10Nk0dvCYxSmglVDcSSfsv30XyCnv3TyM1
         oE7KSa1fA0LIsesXS9OTElxScLyHDF0mYIsvaqZnamRLehdlk+Wh6UrlPW9J2nKYveus
         QJvwJxGVaI2KKmBSVlN4jD9OHtieQjDlveYqymsPKphgvdFDlHe+gNJI57Nk6RpryZ8w
         RNFYI7SVf/eS8OdvVMyB5m3/zgxDAkNuN4N7QcpEmlxfQFTISQ72CKtUJp5tFo7IAWmS
         cIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778780508; x=1779385308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1l+SpR/UEyvWMAal4xyrEteWb4GfZNc3Ty6R5bexWb8=;
        b=aSHNjRURtW7qun4ISuG7ures069te3pyLGlGBCAVLuTTLsLzQceEHRmCRzgfbni3NS
         YvHMAzrRW0t5TInBxIklnxBRvRVjkneIP74T6SJ//vwW5lPlgSECZC2pIf1JIfllt+Xy
         r/VxkzMjdj3WkNanAOc8GXy8/I041DFpZWKMvg8OqhSfmUSMkeiAOmPthTdySrrCDoQ1
         Udk+HUSI/C04PSxA3EOOrLzxvRY0cubGBQAzyaCNFhcQDvvtGHl9zFjZQhF2aJL6mlak
         IKz75CU9MQaiQ7CtDxVLaOkGpWwETwekKF3AtCoeSNTBqvCkPu8rkQZ6wYWPHPLcMqG3
         jedg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+B2a7HjYJNme1sdBoV3LR3JwfKPIKzPRkC371vcg7RAO3t0D0uPQBvvHpANUrvzY1NpDQQT8Qn@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQfeCTu8oUuJv6g7Jbz8/uFoaIItThZzZD0kU7qfijLFxu5jWV
	Nan6Q+e1yn0eebawTFUXVydeIO10hX5g5q3Y4pnSuPNt12sqXgIa646z
X-Gm-Gg: Acq92OGLRZrL+S15v9CkdmAGDT2QyOrLJs/5mgu2jo7w9ywgSimqPx5H7bAW1AUD6vM
	kvgZRs+RxnqY5oOQF3eDoDFqCS8T26YGB3I2N1mho6vyltUcNgQWwirk9Qh6moq/fdieBh89XNR
	tWqp/+PXjeEJFX2NOmD9SD1v5sJ9VgPCPUXdKr9HOyxQvzc5ODIMXnO4XJpguE8sMOC0+B8yGo1
	bUzN3XVy//NRlj+Ga1Rk1CtQwV88Yd69hSNGDw+ZL4RyVf0dyq0RWzhSr9SixPrOnpuGpqCAdTU
	PpkYcVICHsRrmA09A11w3rMcoGu7PHqbY5LkH5BWzsTgggZlxhRPazyhJkD1pYVnEfNHKfxOIVB
	0eWwrWuFF5+cXKBLoEMG3KrrLxlFWy89H5Ggd4/S7Uj2Cu5oedYMNQskJolJEQ0CETK8TqraHmG
	YQkbEc6U0xh0nnH8mWxJ4BmaPSK5n8Kqk4OHQqq1sLZ+5W0UGDqFte79yw7/CW71RUZRE=
X-Received: by 2002:a05:6512:1287:b0:5a9:bdab:2d19 with SMTP id
 2adb3069b0e04-5aa0e5c3b4emr47624e87.0.1778780507399;
        Thu, 14 May 2026 10:41:47 -0700 (PDT)
Received: from localhost.localdomain ([217.107.127.207])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a90f10c84dsm613528e87.10.2026.05.14.10.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 10:41:46 -0700 (PDT)
From: Bulatov Mark <ms.bulatov7@gmail.com>
To: Lyude Paul <lyude@redhat.com>
Subject: [PATCH] drm/nouveau: handle nouveau_hw_get_clock() return value
Date: Thu, 14 May 2026 20:40:08 +0300
Message-Id: <20260514174008.4515-1-ms.bulatov7@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: ms.bulatov7@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: 3HA2WQ6R4LTAA4QA4AXSKYP7PEUIYSP5
X-Message-ID-Hash: 3HA2WQ6R4LTAA4QA4AXSKYP7PEUIYSP5
X-Mailman-Approved-At: Fri, 15 May 2026 18:35:11 +0000
CC: Mark Bulatov <ms.bulatov7@gmail.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3HA2WQ6R4LTAA4QA4AXSKYP7PEUIYSP5/>
Archived-At: 
 <https://lore.freedesktop.org/20260514174008.4515-1-ms.bulatov7@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Mark Bulatov <ms.bulatov7@gmail.com>

In the nv04_update_arb() function, MClk and NVClk are passed to
nv04_calc_arb() or nv10_calc_arb(), where they are used as divisors.
MClk and NVClk are calculated using nouveau_hw_get_clock(), which, via
nouveau_hw_pllvals_to_clk(), can return 0, resulting in division by 0.

The result of nouveau_hw_get_pllvals() in the nouveau_hw_get_clock()
function can also return -ENOENT, which is not checked anywhere.

Fix all this by adding a check.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 6ee738610f41 ("drm/nouveau: Add DRM driver for NVIDIA GPUs")
Signed-off-by: Mark Bulatov <ms.bulatov7@gmail.com>
---
 drivers/gpu/drm/nouveau/dispnv04/arb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/arb.c b/drivers/gpu/drm/nouveau/dispnv04/arb.c
index 1d3542d6006b..2f59b8739fc1 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/arb.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/arb.c
@@ -202,6 +202,9 @@ nv04_update_arb(struct drm_device *dev, int VClk, int bpp,
 	uint32_t cfg1 = nvif_rd32(device, NV04_PFB_CFG1);
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 
+	if (MClk <= 0 || NVClk <= 0)
+		return;
+
 	sim_data.pclk_khz = VClk;
 	sim_data.mclk_khz = MClk;
 	sim_data.nvclk_khz = NVClk;
-- 
2.39.5

