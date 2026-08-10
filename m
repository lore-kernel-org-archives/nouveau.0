Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0061C5B56A
	for <nouveau@archiver.kernel.org>; Tue, 11 Aug 2026 15:03:09 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C0F3A10EC81;
	Tue, 11 Aug 2026 15:03:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XzPMoDu6";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6D4F8476AE;
	Tue, 11 Aug 2026 14:46:53 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786459613;
 b=n+uD3SdOYopHPtRbqQSkgXWg7/fTtkxXymfPKa7G0jPACpd8eqyZV5UuKJG+ChJVz3Cy7
 vupY4sND/FhbcttwL8Oo7Ma027GclYXADZnojuovkG1QKwZTbSKPMbVVqXdg84tBXVEZqha
 nEI22r68TvE/2oAj+n3h2ptfq1B9a5YJSMb3K+0LKVIEuFDYGPgo1FUD4srQboWQPX4F06h
 FiILDfjQiinut67u7Z7VzBWEDlFAzXlUExgUERKhjtuB96fFgKs8o0XDhAiKCpVt4kpXate
 C4TgaHrz4NGYXooLe52VlIaCZFMgTrMZdCBw0DkuMKA6QG8chdAv6kDoPoWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786459613; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=vyASNIeLKFmcfAoI/F9+fyrmwfgxdyCWxlnFqPLO/WQ=;
 b=LDH8chVf/EL0W/6G6Cy3qUnQGFZ1vRMk2XDpoK83NUz2+HRfF8GMZtBWzfTsVSJ9TbhBS
 8H/IesmoSWLvQibJAd0aqqRz9/kM1r6eJSYLPADM+/Kg1VFDpasM1muVOv5/s8BmMFVfnU1
 f0iyWGDIO6A142LNpKZw5KMheHMeYiKBN4osFfBeVgWbIkIsMwCteFNUBJy8JFq90HPq5Qb
 GF1D6ApvAaVkyBmWdUJKUu0KK9rggTKXSswDS0I7195dDTWQ3vXtrMwuCId/PhjJuUSJ9Nt
 7I1kaUnd/PBfFOElLYUenYGbj5AA3OKz3W2SMEZnAOBrRwqZsmLEftRlCwLQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id DDB574767C
	for <nouveau@lists.freedesktop.org>; Mon, 10 Aug 2026 20:22:39 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 66CDE10E9A6
	for <nouveau@lists.freedesktop.org>; Mon, 10 Aug 2026 20:38:53 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-84536ecfc5bso2383007b3a.2
        for <nouveau@lists.freedesktop.org>;
 Mon, 10 Aug 2026 13:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786394333; x=1786999133;
 darn=lists.freedesktop.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vyASNIeLKFmcfAoI/F9+fyrmwfgxdyCWxlnFqPLO/WQ=;
        b=XzPMoDu6I42vwejZeVoIbw+7Z9UvIRy9fZJODsVEHGGFWc2l76Xpm1h58eB4yYmJQ0
         +Nu3RSCha741DEfvOFXIN+GkGowJa1tGisnMIqJG76VO7Nmned57eYqZCHdqruc5UttN
         YBbGvb/fNCl4VB9+DB0BPirfGW1U4LTfH0COiSOcWC5V9BrG9eRvGiM9PP7YCO/j5CpE
         8QTlLSBEVIgAtCnOj+knnNZVDbg4oWByizwXHymovPQdJ0e74xTV4kuYjDEQJsrFk3lp
         AFP9TnhfQ1Iuvfjez0Z1xmj1mPdX07/XpABW8+kPPELME7m8eGgSBU6C5u8GgmQBvu00
         dRUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786394333; x=1786999133;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vyASNIeLKFmcfAoI/F9+fyrmwfgxdyCWxlnFqPLO/WQ=;
        b=RbcqdA4mAaMg+G1w0Ufx/b4uj2w8vqylP7Ocz3oA6O/NJ8HHnr7zDw0cVkUi9E061w
         WNhMg7V6c8pvqOWPo7I4AH9Q9D/xf3rQFNRpTMJyQa7/Sum6fHBnaVXqhHxS2yaiZeFQ
         Q9lVmWDaI7zLt8Cy1pTHPZNSKiQSaEr9q347QsG7Aq0ew+rOa5hYk9GZYhKNRVxDgUKM
         ASK4EMQc3gxtw6bb3grogGqmUvqc6KomQnELzXtdvpRH2DAu7M3I9GmupnEFfTFE7cL3
         tvhdJeegAJPM2lPQWnt1+4CaKr3B2VSi0aCBTnCJ1aIacoKGLabpnyfvvGpGefZp9LRp
         px/A==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqs15722+mLaj01p6nv1YZ9SGsMTAe4Fs9NiVmvzGBetpWnq6kz/PjTDnfM467LAD6upHPV94E+@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9EoHYwVvCX1uZZ+xyE2CdFXpe2vuKN6F+Z5NRoUmPdmWo3/CV
	UaJpiqD3DorFyrkoc6fXH4+Z2nGJhp76MfssWcYmsyNk0e0LQkBDHHAVE5DyMkDqMf/ZDg==
X-Gm-Gg: AR+sD121LhsYGp/pSC6DCyj7q9MXfT/IJ59uRvZmTGviKZVOFEen7U1tdpNVz3WFz6/
	/d7Er/xgqPa79LlvF5BqflMDP1vGaecpyBhZWdrwPLT73YCisoYcj/pu2Ne780QY48PvQEfdP2l
	9yiRB5iNcBn4GIcKV4e2MmAZPNEW5I8H6ihej1Ukt73Qmv3lRF0j5TxGwS+JMWaLn1T8L0Ugptw
	iXhYP9AtjZdBCrgahR7v7ezeBJ+3NsdkUj22fKjM7WDM3s4v8Wsc+NadYft4tdng5uelT0mkCWo
	/o5gn0/NTddaoY/KGj/D2eIR98/xldCXYU6g1f+R+F08oG7D/bjBSMdA/lMqDmDyCsfLpzQykEi
	fXwZFsrPjoRn3N1Kus6b+Dds0w2Bhkyu+w/leR6LQyAOYThWR0lZqC1wvbpbluJTZL+j0gMTlFz
	67BmT4fMaTAuv+L4lLxkYFC88DJAiruKDQVLM1EtAwnokEZUEvpQaujk8mmgSl
X-Received: by 2002:a05:6a00:a16:b0:845:e9e8:645c with SMTP id
 d2e1a72fcca58-84f694201bemr23429295b3a.6.1786394332889;
        Mon, 10 Aug 2026 13:38:52 -0700 (PDT)
Received: from LAPTOP-N3B6U5LC.localdomain ([117.147.100.52])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84f5a553071sm4324001b3a.43.2026.08.10.13.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 13:38:52 -0700 (PDT)
From: Zhenhao Wan <whi4ed0g@gmail.com>
Date: Tue, 11 Aug 2026 04:38:19 +0800
Subject: [PATCH 1/3] drm/nouveau/uvmm: fix NULL deref unwinding an
 OP_MAP_SPARSE op
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-nouveau-uvmm-vmbind-fixes-v1-1-40df1c046b49@gmail.com>
References: <20260811-nouveau-uvmm-vmbind-fixes-v1-0-40df1c046b49@gmail.com>
In-Reply-To: <20260811-nouveau-uvmm-vmbind-fixes-v1-0-40df1c046b49@gmail.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786394315; l=1520;
 i=whi4ed0g@gmail.com; h=from:subject:message-id;
 bh=+VNmEkXChlpNLC2AYrdH2/Brvmpt3yR/AE4J9z9THqs=;
 b=2NVSFVBq7bbrQhlqYPoKCXTQi2womiUgrJtriPaq6KwXJpxK/aMIt6Q0SRgkjDUwQ4FsKnysG
 32+jbbJ1TuXArtF2le4b7Uu4n1tGts8GEPg7Dc/xL8VuPg1ju8U6qyn
X-Developer-Key: i=whi4ed0g@gmail.com; a=ed25519;
 pk=zRTKlstE0LmilshGwJsFYEVjiT6RiXMBXK8Og6VmuVQ=
X-MailFrom: whi4ed0g@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: ECDEQC34RLW4GJCO23LSM5R6BVNUHFJE
X-Message-ID-Hash: ECDEQC34RLW4GJCO23LSM5R6BVNUHFJE
X-Mailman-Approved-At: Tue, 11 Aug 2026 14:46:51 +0000
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Zhenhao Wan <whi4ed0g@gmail.com>,
 Yuhao Jiang <danisjiang@gmail.com>, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ECDEQC34RLW4GJCO23LSM5R6BVNUHFJE/>
Archived-At: 
 <https://lore.freedesktop.org/20260811-nouveau-uvmm-vmbind-fixes-v1-1-40df1c046b49@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Each bind_job_op is zeroed by kzalloc_obj() in bind_job_op_from_uop(),
and the OP_MAP_SPARSE case in nouveau_uvmm_bind_job_submit() only creates
a region, so op->ops stays NULL for a successfully processed sparse map.

If a later op in the same job fails, the reverse unwind loop revisits that
op and calls drm_gpuva_ops_free(&uvmm->base, op->ops) unconditionally.
drm_gpuva_ops_free() dereferences its argument right away
(list_for_each_entry_safe on &ops->list), so a NULL op->ops oopses. The
path is reachable by any render-node fd holder, since NOUVEAU_VM_BIND is
DRM_RENDER_ALLOW.

Guard the free with IS_ERR_OR_NULL(), as nouveau_uvmm_bind_job_cleanup()
already does for the identical free.

Fixes: b88baab82871 ("drm/nouveau: implement new VM_BIND uAPI")
Reported-by: Yuhao Jiang <danisjiang@gmail.com>
Cc: stable@vger.kernel.org
Signed-off-by: Zhenhao Wan <whi4ed0g@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_uvmm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 36445915aa58..849bf42c124e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1489,7 +1489,8 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job,
 			break;
 		}
 
-		drm_gpuva_ops_free(&uvmm->base, op->ops);
+		if (!IS_ERR_OR_NULL(op->ops))
+			drm_gpuva_ops_free(&uvmm->base, op->ops);
 		op->ops = NULL;
 		op->reg = NULL;
 	}

-- 
2.34.1

