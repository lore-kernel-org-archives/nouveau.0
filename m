Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D7AC5B56A
	for <nouveau@archiver.kernel.org>; Tue, 11 Aug 2026 15:03:15 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9C7D910EC65;
	Tue, 11 Aug 2026 15:03:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YsroEjYB";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 48150476BA;
	Tue, 11 Aug 2026 14:47:00 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786459620;
 b=uYRKbZYwBPZv2NdEQWx4hchJS3rhgl+JJnTnmnpwivwLhElL183SfOUDUUto9/VXNflii
 Q8Y/2nlp0LScqCvC0MilVcoeD7587TdR7d2hGryE4yUWeyKqd5ygLZGBCw9pGU2WoREVxx7
 AGFh0aXJvwq2j3z7tbVLOjuzSg8KaXqyj8AP90LlIVpFmCG+8b+8NAjcN1YDcZphd02iRZg
 s9rHYXaCk/mFTihfhUpUiaFSsBciaTwtO4286dTFR6ik6eR5FELBvibg/GLNQ6RyCGzGQPA
 N+n+mkyuEfpvUsofcIyITy3mvKIK2EVhpvBk6ItWMC12kN7OipOEfU/3xy7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786459620; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=QkL6quPpYZOmrSZlgR7q8t7HlM3bpCXuTHsi56o560Y=;
 b=l1VxUt5SU947k4I9Fvn9Y1UxTSqHhxUez4/PcKdPDqxcUm6c6OF+bvBTj+u4O/GHT69SN
 RwcHUnJx/VN2pBILFHTyWjDtaMG0ZanJMFjGpdBLZ30ifCI7UYXLgdKAQ5D3iEKkdCztCHb
 rXJ+5oWvyDUBxjX03sTrNuLRI2KTwAH5Hua6AXp2JpwY0+OCPkc4EWrcn0BQeNSpHGrWLrD
 V1DRaw2w6aTZxxOYN7QEqSBoZ9pGkVGXumIREgU4t7ld9ycEqUnHoSQ4rPJVq0VQlWXAFRp
 6H7Vbd69US/EtWMaKxeOm3OpN9NeI5XgjZWBuFrkKtfuoUuMj7FuyHKguZBA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B426040996
	for <nouveau@lists.freedesktop.org>; Tue, 11 Aug 2026 14:12:54 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D2C0D10E461
	for <nouveau@lists.freedesktop.org>; Tue, 11 Aug 2026 14:29:09 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-848643382fcso942442b3a.1
        for <nouveau@lists.freedesktop.org>;
 Tue, 11 Aug 2026 07:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786458549; x=1787063349;
 darn=lists.freedesktop.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QkL6quPpYZOmrSZlgR7q8t7HlM3bpCXuTHsi56o560Y=;
        b=YsroEjYBwY2TXjLfrD53ZhmNnFN81aZZohuicr3GFsxodQdZI4Fme66mgPrFKLdjys
         q8ZJ2D96rMjDVBea2AdPBMpGENCNZatL8/aOjKKcc7Dhr/C+zPZZSKh19638a6JGmT6+
         oRUTgXcW3LXZUgGBE1j/f17l0iXxVNRLunELrom2KnefB04/+JR3c7tU9HxpH4gNEzWC
         63B+yJavtU7QwPUx/idWOdN/xkHkv7mxhu4E3WnsNpAP4UBzPh7jq6ZBbF6y7qcPQIc9
         mu97LehUlVvdELkDdY7Bk7OwjMj+6cmSbNIIEnN4B+agzZAx/6Q6CZAhxhW1h9k3JYAj
         aEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786458549; x=1787063349;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QkL6quPpYZOmrSZlgR7q8t7HlM3bpCXuTHsi56o560Y=;
        b=Ykko+DO1i1VQZ2okMGxOz3m+bnugbHPaPCuIHNUXiPzujx2nB8CYx6ME/d22x0LdGN
         vI7t9EdEEpF0kr/oZH3l4ObOguLyYw8L8xCxLypcI2RfLu08bs3KkwBYuZIuwVQLz/s5
         5wNZ/rqTX3OHAUocRhl/4RJPoFEtFAu4g+YuhM+g6XLPJoRJn6+go4bjzAPjFvST7SFx
         pXYfemNB7MqWqFJq/Rvg7ji5a80blEdKsXbiUQQLTXXU3N/dVuL8ohTg68E6PMkcfdmh
         2KEJAujhDrKX3RICjYIDycCYS+hqUmj8R7oXnqGw5vejsswQiKxVMm6KPl1w/+EAUPPB
         SUqw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpnm1ws6u9zHQ2oHlR7EnsPlvxc2P7qiLn5MO90IOUpSrnuPKTznL5shSmaSkH/EP60USsiQMat@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywg6cOJ0eohxywZT2h/99PA2/i8kDR8GcTOr8nYsZXOmIdKMCOx
	0J11NB5jg0vLluklglmTSRvrNUwPg1sVhZNp13SL0gcZ0p9aKznHmgub
X-Gm-Gg: AR+sD10H6I0NOumbBxR67cawWiviJgeSVpqTEl3E5kXPj2eN9hTduxNzxPrZJX9IRiz
	KlGIwKDPbqeJLrVNMTCYUseYnqHgsBadweWZk5Y1ntcyETK+dxW83vlj4CuGurofjZpDxKxInVa
	rweKLaizS/G8NYeRlpASWnpWF3+v1bjkhLQp28gIJdn8x/OAhj6EORzx61Bwse345HmLgn3wmre
	SeEOaXpoESddCua43hlJQLCGKQqKemMfTI6SQsMUFak4e6l8VFABQnNZ6tvjrtFuVx+I3oxnRGM
	Qs5fkhlMKmBC7HQ4eD0vwLtHvS5FHzxqqImCmIGoeqDQKgmNKVBo4tmaIXvexnynrddNp7Sv/jZ
	LxyGKRqjCFsFaL8xqko3JjETmfsAWgOWZJ5AmgQ68NjbeoqO1WJ5uWtF8fJ3T9304qTmvgZxqdV
	qZzFGhaSTy8yiK7HpF4x9/Yhw9F90t4WYAASHr0YNOgZdDxvwd8/BW+Ls9+10=
X-Received: by 2002:a05:6a00:138e:b0:848:8619:c149 with SMTP id
 d2e1a72fcca58-84faf42c2efmr824043b3a.2.1786458549054;
        Tue, 11 Aug 2026 07:29:09 -0700 (PDT)
Received: from LAPTOP-N3B6U5LC.localdomain ([117.147.100.52])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84fa954fc8asm890209b3a.50.2026.08.11.07.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 07:29:08 -0700 (PDT)
From: Zhenhao Wan <whi4ed0g@gmail.com>
Subject: [PATCH 0/2] drm/nouveau/dmem: fix DMA unmap size and callocated
 accounting for THP
Date: Tue, 11 Aug 2026 22:28:49 +0800
Message-Id: <20260811-b4-nouveau-dmem-thp-fixes-v1-0-2cdf9860af2a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKExe2oC/yXMUQqDMBCE4avIPnfBhFJCr1L6EHW2bsEoWSOCe
 Pem7ePH8M9BhqwwujcHZWxqOqcKd2moH2N6gXWoJt/6Wxuc4+7KaS4bYuFhwsTruLDoDmMEiIs
 i4oOn2i8Zv6Hmj+ffVro3+vV7SOf5AWu1zIh9AAAA
X-Change-ID: 20260811-b4-nouveau-dmem-thp-fixes-e8ef1afff282
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 Balbir Singh <balbirs@nvidia.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786458544; l=1559;
 i=whi4ed0g@gmail.com; h=from:subject:message-id;
 bh=ZMKglCqVFXjvtgIXuZifnh47ei+nnVi+BRmkcnYy+sQ=;
 b=BoaoApiS8sm/+sfuksuoGEKYu0rzRHDSGrA0yNMo6P0a/eAtz2lAgOnDDCgBuQuP0XlJFp1Dp
 j8eAjUVMULPBHmIZgK5qC2TH5H0uqNmEN6oKiq7Z6bRRZADtjalkaaJ
X-Developer-Key: i=whi4ed0g@gmail.com; a=ed25519;
 pk=zRTKlstE0LmilshGwJsFYEVjiT6RiXMBXK8Og6VmuVQ=
X-MailFrom: whi4ed0g@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: YSGV3BYZFXGW3VPZZHV76KEFEWMPW2BD
X-Message-ID-Hash: YSGV3BYZFXGW3VPZZHV76KEFEWMPW2BD
X-Mailman-Approved-At: Tue, 11 Aug 2026 14:46:51 +0000
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Zhenhao Wan <whi4ed0g@gmail.com>,
 Yuhao Jiang <danisjiang@gmail.com>, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YSGV3BYZFXGW3VPZZHV76KEFEWMPW2BD/>
Archived-At: 
 <https://lore.freedesktop.org/20260811-b4-nouveau-dmem-thp-fixes-v1-0-2cdf9860af2a@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Two independent, stable-worthy fixes to the device-private THP migration
path in nouveau, both introduced by commit c32287471077 ("gpu/drm/nouveau:
enable THP support for GPU memory migration") and still present in
mainline.

Patch 1 fixes two dma_unmap_page() sites that pass a literal PAGE_SIZE
instead of the mapped page_size(). For an order > 0 folio this unmaps
less than was mapped and leaks the remainder of the IOMMU/IOVA mapping.

Patch 2 accounts for large-folio splits in the ->folio_split() hook,
which previously left chunk->callocated unchanged. A folio counted once
at allocation (+1) is later freed as N sub-folios (-N), so the unsigned
counter underflows on the first split/free cycle and the chunk leaks.

Both are confined to nouveau and orthogonal to the in-flight "Remove
device private pages from the physical address space" rework, which
touches nouveau_dmem_page_addr()/nouveau_dmem_chunk_alloc()/
nouveau_dmem_fini() rather than these teardown/accounting sites; they
apply and are needed independently.

Signed-off-by: Zhenhao Wan <whi4ed0g@gmail.com>
---
Zhenhao Wan (2):
      drm/nouveau/dmem: fix mismatched DMA unmap size for large folios
      drm/nouveau/dmem: fix callocated underflow on large folio split

 drivers/gpu/drm/nouveau/nouveau_dmem.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)
---
base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
change-id: 20260811-b4-nouveau-dmem-thp-fixes-e8ef1afff282

Best regards,
--  
Zhenhao Wan <whi4ed0g@gmail.com>

