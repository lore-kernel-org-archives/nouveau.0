Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3208106ACE3
	for <nouveau@archiver.kernel.org>; Thu, 12 Mar 2026 19:55:53 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE2210EAAA;
	Thu, 12 Mar 2026 19:55:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="c78TC7Gx";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1DBF5450E3;
	Thu, 12 Mar 2026 19:45:13 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773344713;
 b=kk/PPdekMpUlkBoQdTktSanqlsfT2pZk6AMIC4DLcuQ8xLaofSZuJePLLMvnkJmIfXRT/
 uzLi8ghP0AyvHYAxIt4nO7Les404hDbY4ZsedGDa41LfMos7yZz1Mgt4jAel3Vabc0eAwKw
 fjgsOEBIwZ/OoZu1jADxtspZ8epKMOugLdiVTUgygWVp6bHLt8FFQwn1lBhRZe7yHM2p4IU
 b9QZ2DTSbMmVqs89+t4+NE590MrTlXQZ7uWbvBxhwCV1STOF9MLWGmH4oYHv3mUrs6v0B5K
 zIkjNLVjFrz+ltjoPzoEIFx94wV4CB+bliH5t5Y52ODGIZdmfiv/dVm/kwnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773344713; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=nM+VdCqvGkbedLjqKwSi2191Tu/5SDLEyyDq01MI7Kk=;
 b=ZujkPu6s187/oA+CCQI/P6l+34jX5NLVmUmslG7GMXkZPon30TZcB4kZIbT0GGLoLuoXj
 f/QaMuGkWQLygbOUitHUsA+lFWupyxGvFYAdC/7J6HaHpS6cx0oZ1MttRHuuJzvCvvjjhfU
 0iKQhSHwreG60vxUVfvBZsyPaiMaocNWY0hzhi21ci2sfPMskeHvVzql2rtvutT/gbx5VbG
 xTfRYIue/XuhxCqJ0BulP9fhyw+oX+8AR8E83Z9wwLcHtX+nb9BOsvEuG9Lco9289AA3Dnr
 lreNUoi4/EKEyGteQgiPOQ8w8Gz3pYF7THsc0226uv8grWo3dJuBiLWgeBBw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 1002440696
	for <nouveau@lists.freedesktop.org>; Thu, 12 Mar 2026 19:45:10 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4A23C10EAA0
	for <nouveau@lists.freedesktop.org>; Thu, 12 Mar 2026 19:55:48 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-82984c077b2so839729b3a.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 12 Mar 2026 12:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773345348; x=1773950148;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nM+VdCqvGkbedLjqKwSi2191Tu/5SDLEyyDq01MI7Kk=;
        b=c78TC7GxTfGF+UUekKb92eM3cuTlFvm9KwY5yLiHBAodzX8m1Zk1y4gwTy2Iz/WIow
         qF0faPrSBeeOPtrzEdVmuH6CB8/HZ00MnlY3QAoaLuHexYHEICw7YXKLBQJIbXInKiwf
         xpRfCwsiwQp84NhlDll+dhmYXOzz4ug1Gzq6ysLDObZEEDVkQiw3A2McgkWjdXlbt4/S
         W0vgjv6P1j0TMZSBGiEcB1q0SfxqMpGlVdYSzZd+GB7g+Ce7DG7mguJuXYrfAGTITZsb
         TOCN8YUxRvM1ZnQCDYP4vws/K0A94fYEE9HbMFU3ptYlo2qnnsEgkcPmGnVGD8zkz1pD
         mCyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773345348; x=1773950148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nM+VdCqvGkbedLjqKwSi2191Tu/5SDLEyyDq01MI7Kk=;
        b=faRHN05OYNu7nX+Gkp8ywTb+Arrkla2/IDQZ4JjQDO9CctBhvToLzLaAlxad1Nqk3o
         fQTO5aoKSPlPNom/FM3F4N/N0W9pM7Jlh7CB/riUXKFZVX8tWSPHt9n+GrARRl937NDS
         vzIG3ePZkzN42Vh0ICn+y6OMJH62n3ycp8PldYMA2egK4q4JUGMxCwCIniuAeXfKCA8o
         JS4fMXzEltuRvxgMU8oeHSgopCIPL4SBLBi80zYuFNbK1jbeLZmjOHaihP3TR3Ss+T4f
         DB58x+3XFq0eLWOi0C1rEezZsOzdnFn3fo5ckSyu06eexSayS4/WveGXrO20F6iOIX6I
         i5GQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTolOqTyDH0pF3Ql1SsLgrBBrxvjS+yuJhH+O05czZtnOX83KO8WeZR5WaSMFTpLBbl1hlIUWW@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2CuY7ZxVs5QqgfHlOiSSYvUV03iYFXuT8XH6rq7hOgSRDhqT1
	41ewemN759ZFnJpRIMrqLb1mvsN+e+QOZMwGUbBAl4B5EMs9UZwgHvXR
X-Gm-Gg: ATEYQzwkA/6X9G/0JtyG7o7i1L87darVVUvy530dCMlLQJM4qjeVjWB3IIUeEDJ7v7w
	SgzPKVwQP9vpa9JD0xbHHw01Ai46d8zczOLGTchqleVjZ4j3xK9C/qCtaY5BzcdCdl+0qnFMUpj
	5IpFIi+pySb87E13BMDlGzKoJZ1xnfPp68nnwhOqh/y5x1mi4sXQcktc+ZMtFU0Gxqz4bbB9HWn
	nEhK1TtOypYDXKzSau6beu0t65gtgmXwcUFZwKHhsoY3ZfwEMkL5LaqqdIgm/r06sCw9VevlrWF
	MayC34u2DlLPYkoUV25Rr6EhAq2K1yJ3pOJF467HXpJo9Aw4Wvz79D0r2mHHMRaw/X36gdVddrQ
	IU3lV/EbrDCPj+0YqBUnknysVwyCo/VGKxTRqPvCJH8KXOTigE6juSnfokth8lqOHcbAmjMy9GG
	CmOdTBLTtQreMoQLTAfbVJ2mte3xfMo/k9CoyugSAIq5B1K4W4r7/rHEiWzFZ55GGN
X-Received: by 2002:a05:6a21:6d88:b0:395:b6ff:fe57 with SMTP id
 adf61e73a8af0-398ece117a4mr430955637.63.1773345347582;
        Thu, 12 Mar 2026 12:55:47 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c73cdf0e99dsm5361786a12.7.2026.03.12.12.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 12:55:47 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] nouveau/vmm: use kzalloc_flex
Date: Thu, 12 Mar 2026 12:55:29 -0700
Message-ID: <20260312195529.13002-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WWF5FHP3B6S5JBMMRWSY7SP7H6OZKELD
X-Message-ID-Hash: WWF5FHP3B6S5JBMMRWSY7SP7H6OZKELD
X-MailFrom: rosenp@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/WWF5FHP3B6S5JBMMRWSY7SP7H6OZKELD/>
Archived-At: 
 <https://lore.freedesktop.org/20260312195529.13002-1-rosenp@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Use the proper macro do to these sizeof calculations.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
index 958fd78080bd..b9648290dffb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
@@ -53,7 +53,7 @@ nvkm_vmm_pt_new(const struct nvkm_vmm_desc *desc, bool sparse,
 		}
 	}
 
-	if (!(pgt = kzalloc(sizeof(*pgt) + (sizeof(pgt->pte[0]) * lpte), GFP_KERNEL)))
+	if (!(pgt = kzalloc_flex(*pgt, pte, lpte)))
 		return NULL;
 	pgt->page = page ? page->shift : 0;
 	pgt->sparse = sparse;
-- 
2.53.0

