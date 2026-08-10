Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88CA6C5CFCF
	for <nouveau@archiver.kernel.org>; Tue, 11 Aug 2026 15:03:11 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 712FD10EC8F;
	Tue, 11 Aug 2026 15:03:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="f9LcVysp";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1512A476A4;
	Tue, 11 Aug 2026 14:46:55 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786459614;
 b=R/1VdjRdy4ez/nHmQcPpnnhKVdE8cnfY8uJOsV0Wo6tGVD5KG9/CFv3yaGdiayWwKfoKp
 u5EcoWMlFLOUC6HWK8VHNKYVPmJLwrrKUGvP2/pMKHRgIjwxuPo4dE3akgjeWylA0NSn5zM
 3bfTZZD0Gxrx5H61fHrSpL6FgHlxOyerFnAsOHUkRM4o85JAhNJuxsV/EuB7bW6xnDfFA0z
 Sh6DHbSXOk6eT9oMoQtOvvOBsjm8F1U7vXIZSE/IvK00JCsVTKgL1h1bFz/D+ZiFdAEDEsF
 WsuAzWysYW9sFqYrjdgca/CS0H9FGRKTOvXO8nUhp7+O/ZBLTH9sSKamfoTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786459614; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=eYLBNqXF1zNAZBvL6Z7VZZKJwlYWKUq5oR45TMWjugk=;
 b=HwVKQCmhXJ5dsBi4EvhrKtaMt39iJ7/a+m41a/lpREkEoNFK4rsvCc++fPiiOgD6Chk2l
 9b/Ma1oOE/pko4RhPPMFB47RodDCHY1rcnAM3tVJbVFIY45/JtmIm7qj6IuSaLx230QKrNZ
 8POF5H8bKWtNEUkJ36vIY+RQ8+JZgzhYiBadgvuAWwHowBcCo8u6FDozmY2zNkEMVckHyus
 4sUcpLZ/2Y6vTQaqkZoLj4KPY9t0WQoUUOG0GSLxZzlpCqxEMjVr7WGkLKCTMuADcEhdBxm
 hSc77qVHHyZgLRAKddXYCpjAU+EQ4Mu2yFgAW1AoZ2agCmrM7Tyvhd1D7fGQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 8A16C47680
	for <nouveau@lists.freedesktop.org>; Mon, 10 Aug 2026 20:22:54 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 134EF10E9A6
	for <nouveau@lists.freedesktop.org>; Mon, 10 Aug 2026 20:39:08 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-84eb992a881so1735094b3a.2
        for <nouveau@lists.freedesktop.org>;
 Mon, 10 Aug 2026 13:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786394347; x=1786999147;
 darn=lists.freedesktop.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eYLBNqXF1zNAZBvL6Z7VZZKJwlYWKUq5oR45TMWjugk=;
        b=f9LcVyspkVEniNaWLBeGbfpAISdH9p0x0bigwWnBOmf6O7nCpz/D819OXCaysQxOE+
         k9H7vOQMwxYwQkky9nvg3mzJzRYck8IRBDF5WlQcL2VlJi84xJWOoL3tVWs/nhAANCqb
         4Yb9by7NEcul2hgfSZo8/E+IUz9v4fB00yCBLWG6zdYAfNj6jqRCM+7qn9Q42o8+Kdo9
         06AhgcgItVwrpzlBfPFM7Fs3DThc8gD08kK1/zd5wTruaD6HgD/wOKOqKpQA65xXxXAw
         +rpoNjXKFg9WeVUmYrJpPK7E6Ewy007XV/mv4FBjZd0T2oqfvIbla40T5ykGGlqunNew
         TNvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786394347; x=1786999147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eYLBNqXF1zNAZBvL6Z7VZZKJwlYWKUq5oR45TMWjugk=;
        b=Bv9ACxhlPzi2HJ0jRBUbymif5sMiLZ3QSPYRO5JwB9+FBAwuewg3fxvazeoHLlpTyu
         kefkk9/MSq8jMRKMTEDiXdFw+wxMYrwkYZweun/dSpSV3wA+YpnputTCN9MsA8xXHilQ
         DdqRwtmjzFi9SqOt9xynM93hxsq+NeG+DRB6T6a7KL3+K0MzLdBwCfaoDYvafhREOPza
         YoVelMxH0zVXrcirvS5Qd9NIz4pWV5ul78zBFFV+0Z4YeIKg/bGisBEVol0mv1Beusts
         Eh5mqYsQaHRCY6wL7jL/uPpQdQSUhlFuZ7SHeMcYGMfBase1ZzBAYqYIOns7YKfJDvsQ
         t91g==
X-Forwarded-Encrypted: i=1;
 AHgh+RpCZDlm7XvCiR7iC7PjCMscJ2pfuvcS6aF8A/GZlahl+HYp7LFP9pciC+kar4mQCHk5Fn38GO5c@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1I9urEfPfvfygcH8Qbi35Ly1/vOYhVI5NttlL9cI5kLTF8fuq
	JP18ZaYzZfAurUAv6IHNxYqe0luZPZxpu8uKlUQTwahipPD/FaciqiDl
X-Gm-Gg: AR+sD13rWMdG7qdMydPlZIg9mS+C0/EUpJHvjGsIzFftRh3w3UtOrgFCT9wpCAWQhec
	oVgTD+5VifsXYDb3hYxBkAiYj7pQ6IE0fG35vX/7pxAcQebKpoOLNoQroMJaXlQAlac1t8IscqS
	9Ewso4mHxRFSHmw1HYSCfdr7fHgFYtjb2vfNw+wEhYJz39b4V8kw+Zpcc7d4RXOVFEEImPss/YS
	DUWcCjqrY/+2NP+8ZAUJs5clmB7Iz/R7kQD2/lZNvVW8ewPG5hN5NJHE+XGHTh6zoWf9R9HAvKO
	7YQNu3A4gO4DuCOORkV18VES16N1YF+HwYqAXArsDqsQjgrWz3SBGVJJH/FI0unMU9IkAiFc0Nm
	SINWuTn7c4FmiCOTNWzOFJ6/P4qM91Amj711PKJXen1sJPWSrr3U1F/sQy8BMlOImH99ikpiVom
	VfmgTaQWg0UNYFFIdjhNp16rpLjrqw0EGT6W7a/fMTh/tlDlUI+qCvkgBx8VM=
X-Received: by 2002:a05:6a00:399f:b0:848:42a7:1854 with SMTP id
 d2e1a72fcca58-84f4fee21bemr33610373b3a.39.1786394347422;
        Mon, 10 Aug 2026 13:39:07 -0700 (PDT)
Received: from LAPTOP-N3B6U5LC.localdomain ([117.147.100.52])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84f5a553071sm4324001b3a.43.2026.08.10.13.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 13:39:07 -0700 (PDT)
From: Zhenhao Wan <whi4ed0g@gmail.com>
Date: Tue, 11 Aug 2026 04:38:21 +0800
Subject: [PATCH 3/3] drm/nouveau/uvmm: clear the dirty flag when unwinding
 an OP_UNMAP_SPARSE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-nouveau-uvmm-vmbind-fixes-v1-3-40df1c046b49@gmail.com>
References: <20260811-nouveau-uvmm-vmbind-fixes-v1-0-40df1c046b49@gmail.com>
In-Reply-To: <20260811-nouveau-uvmm-vmbind-fixes-v1-0-40df1c046b49@gmail.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786394315; l=1588;
 i=whi4ed0g@gmail.com; h=from:subject:message-id;
 bh=EkPEKXF+/UaDvmD1DSJT1a9iDr68rR/Sq93UlMmDacU=;
 b=xvwCAsSALBfo+gvo3ZaHDs3yC6zp/pyKzQwwXyN0p3W5AseCOv1a26TdDXBFUuDwtF8D64GKY
 ptfwp0aTPmpDgfsO50bna4ltQAqDVyxcUVxtlWFJ9TQe4/CGG/JkW1W
X-Developer-Key: i=whi4ed0g@gmail.com; a=ed25519;
 pk=zRTKlstE0LmilshGwJsFYEVjiT6RiXMBXK8Og6VmuVQ=
X-MailFrom: whi4ed0g@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: APG5OE2TR4O6KFD2JNBP3L3QQSLHO36S
X-Message-ID-Hash: APG5OE2TR4O6KFD2JNBP3L3QQSLHO36S
X-Mailman-Approved-At: Tue, 11 Aug 2026 14:46:51 +0000
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Zhenhao Wan <whi4ed0g@gmail.com>,
 Yuhao Jiang <danisjiang@gmail.com>, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/APG5OE2TR4O6KFD2JNBP3L3QQSLHO36S/>
Archived-At: 
 <https://lore.freedesktop.org/20260811-nouveau-uvmm-vmbind-fixes-v1-3-40df1c046b49@gmail.com/>
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

