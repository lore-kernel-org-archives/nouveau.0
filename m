Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5434C43458
	for <nouveau@archiver.kernel.org>; Thu,  9 Jul 2026 15:51:53 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 823C110F629;
	Thu,  9 Jul 2026 15:51:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dkTkyH85";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4A4B64700D;
	Thu,  9 Jul 2026 15:36:51 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783611411;
 b=PYLeHXGjCZuXJoYwlZmAHfp6tb9vKEXhhpEUyejl4OKe3H6SXL4pChs17dw73Qx4kypDm
 7X/nsbjVZotmbFxMx1g5C2WN/I+9PZ1dMZe6mE36G0JI96WeRyLJKv7JDVikRYzLbEa8V0a
 +XG0iAa8WYVjawWI9JMmnr4fClauHNG1Hbt3JyqU9aYLoHYgUWm9Siod0jwdjgX2VPXALhu
 912XKQQ6eVVKBp2v4gv5DymFIIkrBEW7muPAXxvQTuaWhJ8ijhimIKm8QMRCdPEdnNa1Xiq
 NctOcNj4+UNQTgeT0Ee9Cy9/Zehq9SCxSrDIkwyuK+xzE5P4xwuEsD4HMA4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783611411; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=fU1uqDg4qTxMWuauQeSDTacxZRC0Mr8WsWfk9k2wgi4=;
 b=a7YC+GUohgWvXGopgcrENTeSLgTS1FqgCdANb0N+ZhUzYlWwhg6jloHnVQQM4vYmx/krv
 EbSWxgu0UWOIahawf8EbINiBqQgmsUQPVKnjjaR+NEgDfSlSYqKJpcnsJVEsKhtJWi8sC9r
 PBlFD485H7b5cGwFqlMJQMdPEHr/pzPQ0NrYcelw8yqLCHKS7ZhCpk+XNq82ljPumwlm//6
 3JNnVQjzpFeaa8NGQrr10S7O3S7MXzXW3uVAk6CwwYaLHm3F6HxmjGUCZMVHUELW70nZCcC
 ihubRUDZHCGaVwgYEOeLTzIpk+3JcD+nhKk+35l9q2KPu7A1SyRkA4wWm+mg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id DB3A346ADD
	for <nouveau@lists.freedesktop.org>; Thu,  9 Jul 2026 06:08:24 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 12E5910F38C
	for <nouveau@lists.freedesktop.org>; Thu,  9 Jul 2026 06:23:26 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-2cc7e86e7aeso15175585ad.2
        for <nouveau@lists.freedesktop.org>;
 Wed, 08 Jul 2026 23:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783578205; x=1784183005;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fU1uqDg4qTxMWuauQeSDTacxZRC0Mr8WsWfk9k2wgi4=;
        b=dkTkyH85Rq0SJmpAS3jldJTkckzyPbq2zY7dqohLuDZ0Ec2kVWq0UFNSK1QMi9aSN8
         8KZMbjO4E0tglO6kqTnJ+Zxwr2U+rdivo7OglJSop4lTSQNscD48AME/jIOwE6Ea1eTD
         EnFhbZSNFTHL2DPFRLjMPzWqmR5304xtqjsApLA2qX+nf0HAMGP/bMFASxOtYirlTRkG
         NL/BrM0lmC7M1L2cVP+SvQQoFfO50TMhgCPmymf+Mxhb4/tfEErFDuDjvMlPd/kNCVHt
         tkal+MzGRs/9dSy/lVAY5BvfwxF3P/KTACG3Z2cGwpMOUQPjpvaH5BjhFOUEtol1hIo7
         dOjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783578205; x=1784183005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fU1uqDg4qTxMWuauQeSDTacxZRC0Mr8WsWfk9k2wgi4=;
        b=lHAS6j8Gq1y+LTdbsDgP5tkAEedQ/g4NpI/AJJfNazmOzIhtSd7bkm02dktKd/99mJ
         JLnyYuY1k19FqAVr2482dGrPxdJtS0I8/O81mIvCghQkgKaD3x+z68bl8mVmsWt+hKdB
         V1/NILCjfORzFgyqoM1LpQSfYuC6bjWnN66N4CA9NW/NvApvBvKN0NrQomJfy8kELOkc
         KYnA0Q3YyQwY1nBzqGHX8Q3hFOO2FD5s9g7oiWL8pa3ZEKwwieh4sfMlnOtRdVTjLsY4
         IBqB/Nby2YYRHLyUsK5YW/8bFx0R2FZEe89NE7wmBNeLSfdo0m+4yXXdSyB993hkT0ku
         KboQ==
X-Gm-Message-State: AOJu0YzcBY28/ntM3WJexXm1oFEpgx9bTJjsF9M6sDZerR38VM/BFJNE
	kdzjPJ+cMDer2iqYWIX6YcFM8XRsEKAuEmMbwjZvmSNb5YVXkY/Ps+A/
X-Gm-Gg: AfdE7clVlAiD8ibfRP46g78JAh6hg+LNtWTC3hygHyMJ8A+2RWQAfi+3BiU6BfiPN2l
	1JHt+JHjeDSmGMZkC4ue9nUZT256aAps13HvzrUGASq9xYXTLdTqwB8ofJbJHqpgenZJB8+EZ+q
	N3XmPH2kOf2EjlrCgekHnkAuZWdhB9izoKSDGoVMMSHZ+IDhE/N+IFDzZHnDEfF0OCv6v8vEO7H
	a3/7z2AIeaWAyK1gZErcflFsCTtwi4Dh1eg7tf5ZES99u1iZW0eLl1AvKC1NIZSzs+7OrdIFFs5
	NiEW+uzKq5BDoc5S8AtkKms9UMoAvv/5OoJehM8R2YYgy8YONGzsyvBJDpj92JPLMx/xPbCFNgd
	gAGkSixUntGbeOH1/RRbHB9ss+1CLbkEo7arWTYDvSgMOqfFo45XBQKGjHjV5QOZSQh9B+BIwSl
	Lfrby/9KNKTlLnAUI/HNz1IJbWhCy4zR3/o3XqJBGANKg=
X-Received: by 2002:a17:903:298f:b0:2c0:b6c7:227e with SMTP id
 d9443c01a7336-2ccea3485b7mr72436645ad.5.1783578205434;
        Wed, 08 Jul 2026 23:23:25 -0700 (PDT)
Received: from haichao.tail057a43.ts.net
 ([2001:da8:e000:1206:ea9b:46f2:6d0c:46c7])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9bf8e9csm38501885ad.24.2026.07.08.23.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 23:23:24 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: karolherbst@gmail.com,
	lyude@redhat.com,
	danilo.krummrich@ffwll.ch,
	airlied@gmail.com,
	simona@ffwll.ch
Subject: [PATCH] drm/nouveau/gsp: Preserve BAR2 flush mapping on kmap failure
Date: Thu,  9 Jul 2026 14:23:18 +0800
Message-ID: <20260709062318.4169329-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: ruoyuw560@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: 2YVZYDBJK74RGOCUMZXGDBOD5MHQSFQP
X-Message-ID-Hash: 2YVZYDBJK74RGOCUMZXGDBOD5MHQSFQP
X-Mailman-Approved-At: Thu, 09 Jul 2026 15:36:49 +0000
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Ruoyu Wang <ruoyuw560@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/2YVZYDBJK74RGOCUMZXGDBOD5MHQSFQP/>
Archived-At: 
 <https://lore.freedesktop.org/20260709062318.4169329-1-ruoyuw560@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

r535_bar_bar2_init() warns if the FB zero object cannot be wrapped or
mapped, but then continues and maps bar->flushFBZero through nvkm_kmap().

If the object was not created, nvkm_kmap() dereferences NULL. If
nvkm_kmap() returns NULL, assigning the result to bar->flushBAR2 clears
the existing physical-mode flush mapping and later r535_bar_flush() can
dereference NULL after the generic BAR2 init wrapper marks BAR2 active.

Keep the physical-mode flush mapping unless the BAR2 flush mapping was
successfully acquired. In fini, call nvkm_done() only for an acquired
BAR2 flush mapping, because nvkm_done() is not NULL-safe.

This issue was found by a static analysis checker and confirmed by
manual source review.

Fixes: 5bf0257136a2 ("drm/nouveau/mmu/r535: initial support")
Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c  | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c
index fae08ac3b18c7..eb3a7ddfa3355 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c
@@ -71,8 +71,9 @@ r535_bar_bar2_fini(struct nvkm_bar *bar)
 	struct nvkm_vmm *vmm = gf100_bar(bar)->bar[0].vmm;
 	struct nvkm_gsp *gsp = bar->subdev.device->gsp;
 
+	if (bar->flushFBZero && bar->flushBAR2 != bar->flushBAR2PhysMode)
+		nvkm_done(bar->flushFBZero);
 	bar->flushBAR2 = bar->flushBAR2PhysMode;
-	nvkm_done(bar->flushFBZero);
 
 	WARN_ON(r535_bar_bar2_update_pde(gsp, vmm->func->page[0].shift, 0));
 }
@@ -86,6 +87,7 @@ r535_bar_bar2_init(struct nvkm_bar *bar)
 	struct nvkm_memory *pdb = vmm->pd->pt[0]->memory;
 	u32 pdb_offset = vmm->pd->pt[0]->base;
 	u32 pdbe_lo, pdbe_hi;
+	void __iomem *flush;
 	u64 pdbe;
 
 	nvkm_kmap(pdb);
@@ -106,12 +108,16 @@ r535_bar_bar2_init(struct nvkm_bar *bar)
 			ret = nvkm_memory_kmap(fbZero, &bar->flushFBZero);
 			nvkm_memory_unref(&fbZero);
 		}
-		WARN_ON(ret);
+		if (WARN_ON(ret))
+			return;
 	}
 
+	flush = nvkm_kmap(bar->flushFBZero);
+	if (WARN_ON(!flush))
+		return;
+
+	bar->flushBAR2 = flush;
 	bar->bar2 = true;
-	bar->flushBAR2 = nvkm_kmap(bar->flushFBZero);
-	WARN_ON(!bar->flushBAR2);
 }
 
 static void
-- 
2.51.0

