Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4E6C5CFE7
	for <nouveau@archiver.kernel.org>; Tue, 11 Aug 2026 15:03:10 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1BFF710EC88;
	Tue, 11 Aug 2026 15:03:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="oSTkiUwA";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B6952476B2;
	Tue, 11 Aug 2026 14:46:54 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786459614;
 b=rHbq5y9wW5XIqhpQxo2aTC2duasK+zXEJtS8GHu1zjp3q0/EbOm//0hRPr2yyuhxF+OS/
 g0kP0p3e2JYoMZCixyw1Pyxy2wH/pQTJOeDll+4z5UBLWhGmTiN5DPBnpO8G+dcJDsCVl/X
 9fxe9KiO2NjWMWDU/kIcgj32ZCqeuUeSP3k2VUYJhC1HtPlWHu3Ttayonba1YvH8Awc2NCI
 9/tK05xOq7nQ53zGr9Gk+mH0OEsuJUxQuG/fhVS7DuLyg6wkUsMJ7fpOJ4aMhbhz5eaivCa
 o8QGYrS2WtHC5yOSsK0NdOyljAM/RvP8aQQBJPkxwAQM1PAIoI4lN5KGGdUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786459614; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=qGxAuLzZZuFS+OONE5xJE8lS88pl+UeA90EgJEUUW6g=;
 b=V7sooLZx8mJPn67Ahiy/S13n3WZXYC7rdDFH414RI94NcigmOvPFofoMCPpIna8BSf65o
 Sm1ZC2ZbDIRM16MOLGvjPo+J8zytFUDUAdb26skFeTkf0oSm4aQw6dPpYjVJuToBz782WdN
 YS2ktablnbdtV9OS0f7Oelgr6VIftdCzEddx5U3Gs5If7wN2DcbY6k7ki9RCx9MOZ92X3+c
 twLGIm7DiaYpfnzwbek2JsnCQ25IIzaK7BdmfcOSv+pyee+RGNncolIyN797o51to+09a5U
 ghoQUZLfEVyBeK0cu0peyO7y20WJWPwZMmAPWc5Ob1BnQKCA94XevE84o7lQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 4650D4767E
	for <nouveau@lists.freedesktop.org>; Mon, 10 Aug 2026 20:22:47 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C33DE10E9A6
	for <nouveau@lists.freedesktop.org>; Mon, 10 Aug 2026 20:39:00 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-ca97d139d5fso1998098a12.0
        for <nouveau@lists.freedesktop.org>;
 Mon, 10 Aug 2026 13:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786394340; x=1786999140;
 darn=lists.freedesktop.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qGxAuLzZZuFS+OONE5xJE8lS88pl+UeA90EgJEUUW6g=;
        b=oSTkiUwAnMFX654k7ytDSRcWWCUnDQxSxiNsEpAeOzNGUpSiUXoCgDnDjMgIG5OD4w
         k8LaEuFSqxnYbQJHQCIQq6DrelEcvSf1Q3mJ4zLSZaB4QcD7fDRQV/GpoM4jiMElHaUR
         7C4CiSUKGnI61SSzPcrfkgb73+ERWtBJkCc8tQ0w/jcKjwb4viS43q+ASPGx5fy/tXdd
         RuO3CBvC7vU2uBbv6BcX2pCSOtDUyXvpOYoWyWpPun7oL84me7dDVktaCMdcZLOURoRT
         +Rezp+B5lrskGaxR2ZUbA6DaekDv2xlV28uMvmej+js/DHyy4DBi6uS5PgxBQeNAmnMv
         BtCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786394340; x=1786999140;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qGxAuLzZZuFS+OONE5xJE8lS88pl+UeA90EgJEUUW6g=;
        b=DQdX2nGy0NSkZyMuTVLCWUi6FERTxHpfCNTP5Ni5vPp3KaylUgct6DaCjgFIzAQOe+
         ISzzGbZUDZIcd2NZoTIleZQw5pJ7J0fPOIfDWO4qBDzx+11OdwWy9E/kpr5ZR3Zo9RIQ
         89JlJoe6OlpISvMM80CwiQPNnXwJUEPwy1T0LQNMcd/NxYm8zn5QTeUZqOQ1QRgvBgdu
         s8XcV9WJ8D5HB6L0EHfTKhLFn0++Ju+3Hm4Y44hFUSzUPbtFGx4ShC4G2aToi7jiDiX5
         y7TyUB1yadUQKDlSUiI4aU8ChauZHXq73oU0yS4wiER5/A342ywsY7XnrWZXinaD5z5j
         VIJA==
X-Forwarded-Encrypted: i=1;
 AHgh+RooDDYm6sohrbRfBRLaNhiK05R+sQI9KjN096o2fNDTxemDWTrn7ne/5Qjg7e79ff84mEdRXQGy@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywq7Urt00QX/Q3oSJeLHjlg40wRi8/azSBFOK26hD6mk5ERxZe6
	Rny4t84ssM/QzE/flq2RAvGjr+P9zhuD5D2FAq5h4Ul0H2gKpazwJ/qH
X-Gm-Gg: AR+sD13+ARqOp4YFNS5Ijs6XS7n+LVO5sUen2yz70yk8DUG//+XPTKbiizB6NRd8ghf
	ueWjWRIOtMAyXm9KPsWs6loZcjXIBa/omMqXlHDCkcis2tfKWAL4OReU5PsBQgLpewBj1QR8LZY
	jVnx+09dHZ9zjqBiqN6UjdzgXG2HfguaS0kBKgKt0A0EDfu3gKGF83pFUoNiXA+tQ8SZbiZMw1L
	BsmH96pccpam9jlFdwUYYKEISn1VR2DAqhGgEeX+Mbqwsf1DclMGw4eHl2VKUvii3HOMvppzGaj
	gD7lMduGTjfdzO8DEHAkP8jWn03e9kgRAdbnI/cQSy3gpzb+mxG4vwSucC5kBdZuM4QwBw0iYou
	TpDu0+bQ99BB+ZHLJTp2Snx6jPrg3bvV61VpVMTUUJm3dU1vGMTgFoPxAw8Xo2JgnCdxD+mNjKM
	/rDq76942Uewg6fD6kYvt9mQ/UNMQqYG+muE27zUianqV9SO09fEjUDj88aa4iLu0b+4OGGQ==
X-Received: by 2002:a05:6a00:809:b0:84e:915:d7eb with SMTP id
 d2e1a72fcca58-84f9c9b2da1mr4339437b3a.37.1786394340150;
        Mon, 10 Aug 2026 13:39:00 -0700 (PDT)
Received: from LAPTOP-N3B6U5LC.localdomain ([117.147.100.52])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84f5a553071sm4324001b3a.43.2026.08.10.13.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 13:38:59 -0700 (PDT)
From: Zhenhao Wan <whi4ed0g@gmail.com>
Date: Tue, 11 Aug 2026 04:38:20 +0800
Subject: [PATCH 2/3] drm/nouveau/uvmm: fix premature region free on failed
 OP_UNMAP_SPARSE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-nouveau-uvmm-vmbind-fixes-v1-2-40df1c046b49@gmail.com>
References: <20260811-nouveau-uvmm-vmbind-fixes-v1-0-40df1c046b49@gmail.com>
In-Reply-To: <20260811-nouveau-uvmm-vmbind-fixes-v1-0-40df1c046b49@gmail.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786394315; l=2150;
 i=whi4ed0g@gmail.com; h=from:subject:message-id;
 bh=Os1DpKb5DvVXnV4vccSHoH512pnwHk/C+aJ0z4dVEGA=;
 b=02MtHdx4r3dcWF4OJYpzk/u7l1R5qAALQu/9EvZjdicY+x1blHF50oc+amQtWtok05bowqco2
 GB8XXhKK5NaCpHbdzLxx9r4Ic66enivHaHfyhRMZvNxhLhbx+KR24fL
X-Developer-Key: i=whi4ed0g@gmail.com; a=ed25519;
 pk=zRTKlstE0LmilshGwJsFYEVjiT6RiXMBXK8Og6VmuVQ=
X-MailFrom: whi4ed0g@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: YQ2V5GL3NA4UDU46UO7HXHXXPJ7CR74A
X-Message-ID-Hash: YQ2V5GL3NA4UDU46UO7HXHXXPJ7CR74A
X-Mailman-Approved-At: Tue, 11 Aug 2026 14:46:51 +0000
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Zhenhao Wan <whi4ed0g@gmail.com>,
 Yuhao Jiang <danisjiang@gmail.com>, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YQ2V5GL3NA4UDU46UO7HXHXXPJ7CR74A/>
Archived-At: 
 <https://lore.freedesktop.org/20260811-nouveau-uvmm-vmbind-fixes-v1-2-40df1c046b49@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

In nouveau_uvmm_bind_job_submit()'s OP_UNMAP_SPARSE arm, op->reg is set
from nouveau_uvma_region_find(), which only looks the region up and takes
no reference; a region's sole reference is its membership in
uvmm->region_mt. Two failure paths leave op->reg set: the -ENOENT check
when the region is busy, and the drm_gpuvm_sm_unmap_ops_create() failure.
The sibling nouveau_uvmm_sm_unmap_prepare() failure just below clears
op->reg; these two do not.

unwind_continue steps back one op, so the failing op is skipped by the
unwind loop and its op->reg stays set. nouveau_uvmm_bind_job_cleanup()
then enters its if (op->reg) branch and calls nouveau_uvma_region_remove()
and nouveau_uvma_region_put() on it, dropping the tree's sole reference
and freeing a region this job never created. The comment above the
cleanup loop documents the broken invariant: op->reg must be NULL on
submit failure.

This frees a live region on an unrelated failure, reachable single-job
when drm_gpuvm_sm_unmap_ops_create() returns -ENOMEM; if another job owns
the same region, its cleanup then removes and puts the freed region, a
use-after-free. Clear op->reg on both failure paths.

Fixes: b88baab82871 ("drm/nouveau: implement new VM_BIND uAPI")
Reported-by: Yuhao Jiang <danisjiang@gmail.com>
Cc: stable@vger.kernel.org
Signed-off-by: Zhenhao Wan <whi4ed0g@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_uvmm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 849bf42c124e..3412200b21fd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1319,6 +1319,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job,
 							   op->va.range);
 			if (!op->reg || op->reg->dirty) {
 				ret = -ENOENT;
+				op->reg = NULL;
 				goto unwind_continue;
 			}
 
@@ -1327,6 +1328,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job,
 								op->va.range);
 			if (IS_ERR(op->ops)) {
 				ret = PTR_ERR(op->ops);
+				op->reg = NULL;
 				goto unwind_continue;
 			}
 

-- 
2.34.1

