Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554A5C5B572
	for <nouveau@archiver.kernel.org>; Tue, 11 Aug 2026 15:03:15 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2387410EC9B;
	Tue, 11 Aug 2026 15:03:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XDXY78ts";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C35FA476BF;
	Tue, 11 Aug 2026 14:46:59 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786459619;
 b=szgA+zO1rjAWrq4pwlLpBdk/8ch8j11RE+qJV2NPIhahlxKC9OwL8bMM2TKVtY+XovY3G
 8hXdeWPY43Y2v+LSp2nq2IDuKGnv5GpdRi4u7VCgqEAuScP+WzReb2Gh7NU126B97ZY1ZJ1
 T0y/ITiS0K4eiz5QlG0V6v4ssQZ7gfIErbeDd1TuY7aUYaY1L1NrmABxaTNLVAE+bDlLNe3
 EujDrWHPH/xm5S6bxqfT35T3zZri+cF6ZHV8eIRcuIG9wlFy53Ixy832ai7TIHX4XkgGizW
 ZkECcGd8mWeJT+SxgO6JU//m8kUle18DWOUBsn4JI0r0F1XYu5xCmuajxIDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786459619; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=FHAeoyo5cMJf1W0mZYzZjfd/SrG8usIZS6fsxweLRlk=;
 b=HbJqxebG1Eq2xglGOOEW3jDkIdAs5DkRQcFLlDCrHlKBz5w+AFldnjZ+l2hiJzbeMxzjr
 CGQjw0rXiK/aBOv1erWU5rx4t6OzpU9SAUue82IspBCHUUpzZP0RHNvb/rcB548jiIDlxmb
 0FC+zG8sQ6o18DPBQrHadlwD2z2sgzVij3noPOGhjQxNgwQIXhVJhIuOukxUBaOe7G3twJ9
 u64u+sF3neVsEaVdBYamY9V4noLbppAlFpJyhtBDTCbr3mv4CwoXsd4YwvviliMztCfrbfo
 kcnfJt+XmhwOnokvj347ZiwAFl79/arsQI8QGQtR8/Vj3IK48PXIa9/CHKTg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 6633E4769A
	for <nouveau@lists.freedesktop.org>; Tue, 11 Aug 2026 08:31:07 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0E04C10EAD8
	for <nouveau@lists.freedesktop.org>; Tue, 11 Aug 2026 08:47:22 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-38e58034d05so2986542a91.2
        for <nouveau@lists.freedesktop.org>;
 Tue, 11 Aug 2026 01:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786438041; x=1787042841;
 darn=lists.freedesktop.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FHAeoyo5cMJf1W0mZYzZjfd/SrG8usIZS6fsxweLRlk=;
        b=XDXY78tsSuCB3bE+Xe4roT083L/eKnhgGnAvHaDyIduGcjNWwtRM27YDfmRLf6bKy/
         5XyBIQhAdi8YMu+QR5ng4vruv+2ouq6qR4BKBXZz9NNiSnEDttXGKZN8hbKcI5ptpT8s
         4JdDf6mG1B4UFUOS7zA/Voa3mgDOhtoQvEA9nhkW9MP6cW9DDch/OGX0khi9bRUH1Ba/
         8WjzN2u92CGoNRFz4v7kcpAp7FgeBHq0L2GCHCGep7Lf0UktY+0xRmDxOHnyCn7whn/k
         TgtRlL55YlfTcaJDuOc6IsrvFvwTG/BPYR2tg3ZCHfdAZK96ADz1cJKhoxUw/15+MyZc
         3+EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786438041; x=1787042841;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FHAeoyo5cMJf1W0mZYzZjfd/SrG8usIZS6fsxweLRlk=;
        b=ioOVIQgO1Ns44X238NxCyor5JgF1H8ugG4bF1u7h0SWSFD3/LmMSqUVFJAvsNFQzo2
         4HvFuKtMEZy2bUA1IB8h3EComcT64CwX1G0P0u5sppQc6EopnBvsstedgPHMFxuxf0Un
         R3S90m/3+VnOxRUur25a/EzWm/8To9J/NTsFkwDqSqZPvCqfGBzA4dunpqbz2zLiaPYk
         4Ia7aGiyDBP34AytS1q6x8pK4O0/4GHvORLgKe3aC8doLdZg4xflFwb007RXkYsyqywE
         60DiQmvRu9/jdwo8E1Ym5v4KxIytaeyDhOQZFuj77OMRUS+JCyTrd1fuITvjlsmoDvP0
         IF1Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RrkHm7CdzgbLgv8rOvyUj4t1R43WBWnbtwrAznv+A/aFiKT4AagD1kiXyhSTxGxQhnNOqrnoqVr@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxsgt1sK+dc8xhZ8wHRGKr/m68gPoKplRCLmuZza6MwEFEdQb3y
	o3S+Jhv+96zvnHLnHb+enVehkTIZKGSXmdHqZjnQB0yXPAzcyhv1D1kr
X-Gm-Gg: AR+sD10kmi3mgK/OC6dEb4RlFROuhVgxP6J0KRwoJK0uU+AV8xDb/oApKuw5avWbEjC
	J7AxsrBLlJL4KAwj9kuci5RPmbYvBXQpkyYAZT+SrsuqIXUBqJgf0666DOV2vehO5D5YGS3tS2/
	3VjkcLXtT7/TpDCgpsKHqSBd6+cyVvKrl33/ZRI6T7z1RDadMi2J0aUKLMD6RdyzUPGfcF94fx0
	arl4LSRfLiGQiwr8kVeH6AQ8Kai5l/PXH+aWIpzqPhwOPH+EEuWxl9LQ0zYnysqzz2JJYY+ZD1w
	XXqS1wCrXfjezO4W7ti+gFi9zmKaZVRs5yI7phgp3aqmRCGqsF/XbUMZGPrxLFuC1qUCTrvw3Ay
	mVozeLaipfqeU7Zw7Tmx0/U1vQA25EmSlrwJ1Lvl3HmPuLWzB2BhRykzY6AZThHeAiMrlZMXJnU
	TwF9AJGt4jkuTMZfWPFP91+/1AksQfarWkLkxXA7QCo3+bDzsOnTXwH4AG5Dg=
X-Received: by 2002:a17:90b:5483:b0:36d:9e0b:3801 with SMTP id
 98e67ed59e1d1-392ec4cf8e2mr1886740a91.8.1786438041538;
        Tue, 11 Aug 2026 01:47:21 -0700 (PDT)
Received: from LAPTOP-N3B6U5LC.localdomain ([117.147.100.52])
        by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-392e58a94aasm633058a91.4.2026.08.11.01.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 01:47:21 -0700 (PDT)
From: Zhenhao Wan <whi4ed0g@gmail.com>
Date: Tue, 11 Aug 2026 16:46:30 +0800
Subject: [PATCH v2 3/3] drm/nouveau/uvmm: clear the dirty flag when
 unwinding an OP_UNMAP_SPARSE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-nouveau-uvmm-vmbind-fixes-v2-3-aaee4b395d04@gmail.com>
References: <20260811-nouveau-uvmm-vmbind-fixes-v2-0-aaee4b395d04@gmail.com>
In-Reply-To: <20260811-nouveau-uvmm-vmbind-fixes-v2-0-aaee4b395d04@gmail.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786438000; l=1623;
 i=whi4ed0g@gmail.com; h=from:subject:message-id;
 bh=lIptHHN9gxorlm/NvGtJXIbFnkM/mVFweQW+foQRg4s=;
 b=BbY3eudDUU3rCJhubXR1NqITi9+XwlsZJYkYbjnHMrEnfLQTsJ3piqBsNjdoamVkGcHZ/Oh66
 8ZouVLyJEukCAvYeXRa06MN6LzT6WFM2hlbqZHknRlcvNwKCxLz3JDA
X-Developer-Key: i=whi4ed0g@gmail.com; a=ed25519;
 pk=zRTKlstE0LmilshGwJsFYEVjiT6RiXMBXK8Og6VmuVQ=
X-MailFrom: whi4ed0g@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: NNT2IKHPL3M64IYNSY45AA4IAG2YTT3M
X-Message-ID-Hash: NNT2IKHPL3M64IYNSY45AA4IAG2YTT3M
X-Mailman-Approved-At: Tue, 11 Aug 2026 14:46:51 +0000
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Zhenhao Wan <whi4ed0g@gmail.com>,
 Yuhao Jiang <danisjiang@gmail.com>, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NNT2IKHPL3M64IYNSY45AA4IAG2YTT3M/>
Archived-At: 
 <https://lore.freedesktop.org/20260811-nouveau-uvmm-vmbind-fixes-v2-3-aaee4b395d04@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

A successful OP_UNMAP_SPARSE marks its region dirty with
nouveau_uvma_region_dirty() and defers the teardown to
nouveau_uvmm_bind_job_cleanup(); it does not remove the region from
uvmm->region_mt.

If a later op in the job fails, the unwind path never clears reg->dirty
(set in one place, cleared nowhere) and sets op->reg = NULL, so cleanup
skips the teardown. The region is left in the tree with dirty set and its
completion never signalled. Later binds over that range then fail
permanently -- -ENOENT or -EINVAL from the dirty checks, or an unkillable
wait_for_completion() in bind_validate_region() -- for the lifetime of
the uvmm.

Clear reg->dirty when the unwind reverts the sparse unmap, restoring the
region to the state it was found in.

Fixes: b88baab82871 ("drm/nouveau: implement new VM_BIND uAPI")
Reported-by: Yuhao Jiang <danisjiang@gmail.com>
Assisted-by: Claude:claude-opus-5
Cc: stable@vger.kernel.org
Signed-off-by: Zhenhao Wan <whi4ed0g@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_uvmm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 3412200b21fd..76ab377f0e2c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1475,6 +1475,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job,
 						    op->va.range);
 			break;
 		case OP_UNMAP_SPARSE:
+			op->reg->dirty = false;
 			__nouveau_uvma_region_insert(uvmm, op->reg);
 			nouveau_uvmm_sm_unmap_prepare_unwind(uvmm, &op->new,
 							     op->ops);

-- 
2.34.1

