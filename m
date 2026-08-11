Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34175C5B56A
	for <nouveau@archiver.kernel.org>; Tue, 11 Aug 2026 15:03:13 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 645BF10EC6C;
	Tue, 11 Aug 2026 15:03:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="r8sq8LUs";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 030B047691;
	Tue, 11 Aug 2026 14:46:57 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786459616;
 b=c+9A17XWFRprzdlFZpDsh5a/vu0kerO65PFsExIYxPnarNQH+i4pES1L3E3yXggdWg1Zu
 yo1eFIfkbbvSwdzaNS4wkJV6xeQ31oCbG7k4QewT9HeAmiUTOL3kQ7wADxFcZvY+iD/mZzz
 KhAHxlxfstORBwBPFDNZoi9AfrL0wHb8ehUjhlUVC2VaG2X1hYjQjGHyyi8AzyENMByHlw8
 jBLCkQLdMbxkQtcV9J+U0IJpGA8bog3pKZ2hryrfEhaoDcg4P8PO4ph6K6TtMlCjRCgWGp7
 1dPBr3c8ihw51zS41Mgb5zqBeAZeyFeBNPAD+khQbY6kxgT/1GWiaxdKoyqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786459616; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=KkN28cbnuxaTZnJUJR8D84k2R0Wy2RMXuquI0epiuqE=;
 b=eSNXnQsLALYC0EvA9jy97YBbX/hOcTkPNDMo7mXTDb384ihT1wfdvFm/F0pUz/k1uwohK
 qUyTY6a4fycdwQ7jh1HrccalXqcqusrqgkKBMQmgN83i7/LdLcK0ubX8tgoQ0GQALXp2ar2
 LjBJN2cNkv0PC0eVYrlYESWz9cLJBVUasDA6BGPQis31i7EQtfvZhHYNT9fv9eeipUkHa6P
 w/z2pc5cYqph1MsTyGRyXhHtAKcI72oXdSV2aDo3h5AnmbrUJhAjVoGe1FrEmJLFCZbSf8f
 YH/K1N08SD1svBBSZgTc1bfdMGQAFbg/l/l04p7h5UyVVYLmA1+vrmISkSNQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B4B794768C
	for <nouveau@lists.freedesktop.org>; Tue, 11 Aug 2026 08:31:00 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA1510EAD8
	for <nouveau@lists.freedesktop.org>; Tue, 11 Aug 2026 08:47:15 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-38e347638adso3147715a91.0
        for <nouveau@lists.freedesktop.org>;
 Tue, 11 Aug 2026 01:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786438035; x=1787042835;
 darn=lists.freedesktop.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KkN28cbnuxaTZnJUJR8D84k2R0Wy2RMXuquI0epiuqE=;
        b=r8sq8LUs6xw7K+cF3IQIrCMrZyINzE3Tr74pCX+UljnueSsKq1Kjx0qRta72yq2jS+
         mikq9exIlwEOcz0Q32EgsziPpWb10PWx3raUmlW1DzsoXzQ5xQrp4BFW6G6pzyTAz+tC
         JovWXc4O4yLYOSyM96NXb3mGLs3jq7UlRKOzZiRrzE4yPkj7+rEbJXiTnlhjmC+58JAD
         clAcWxtA8v2Dibm1fOW+esWS10qSbrCGPKbB3BW65sWdlFwt3YNkaO80dv5vNB051pQw
         MGu3x3AAH4mW/toaoxDmiWLamWAhE49nFet7I9ypYLhkfsaDSi4nTXxHfzPk++061i1G
         FRXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786438035; x=1787042835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KkN28cbnuxaTZnJUJR8D84k2R0Wy2RMXuquI0epiuqE=;
        b=iVED7aP7rZ4Xrnmnrl6RlBCbLZ3L6o4x9Td2ioR6oW+1VVXkY2FNXnSYkAZuwcXrPr
         hHe/hcSTvbf3D10/nnmj9HqTd6h+0yn38aIIMth+8gaqTg5GIDaomzWtQlh9fHbJvQDD
         qKxeMH9dxK7gdK+tKzIjYRnVFN1eLoBG6+AKGWr6bdXtVY7Y/alQ8H7jRexVdX6187tD
         9eamdsJh3BW6S5scIH9lzhntjNJ0bw1ZDof36BABFp87e41/R8MtDbj6NwzjuYNcUqGq
         zXLo6C7VEGzSOXPJssZhtYV08iNRZhcwP4/f3XskMbjRVdanq9Dyuhw/ESmIudQk/OLO
         OJGQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqmVzy7ehKpa4wP2vEkkhKEr1UlXZiuc+byGA36tnWdidmWhrpT1/CUMMIMx5EjxSvhB+ns6GaH@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZIgE/WPef3JuMQNqaTSHGMy4E9loZmucJ3EZE72/C47LRII8v
	SfVWa7OpVaLFGac/vGw/t5K0e767yPh3APWBomdmG7Euy4D5HqMY10Hs
X-Gm-Gg: AR+sD11hSkQiZeGdTFCtXGnrzI13a4qwxVDhK+OoAX3/IUdw5ASfP8z71iUWrspZaaQ
	8Q7YxuxIJ1DcFfuz4us1DOgmpep41ZXPYJpSRaW28sOV26R60c8Z11WKkQKHrZiRDlItMNDBN1t
	+jlmTDH0bAfum54GiAe9TFxPg3z0NXqL7w4Mn0haY7yx6lVoCqmSz9SVBvqg3nV8osWMR4tXise
	OuKtJ+2K3zkqRZZPF+1TdRMRAxjc3fbq1tyFjId/l5fGKUG7WtTefds4Ck0gfKDqon6iFSF0as0
	xhv7tVleDeMdIYW2FetJfxYH53xM/NiUMtQdyhwAKklu2GazGMRVoLLsFCCaavwxLncMtsKPkUf
	SMQfCBeZBWZQb/f6mmb95f+aDAwj47AA6Ldc0MvB4iaI01tzvd8ZVIxgJfgHtzascSkESUW4dyE
	OPMpeh3DTwisA+ig74ncOKYs3VkfNA6+yMMcyAOuX0hJf0NDpY28Dh+JbOOKARDIYvDPxwVQ==
X-Received: by 2002:a17:90b:4c85:b0:381:c500:b0d1 with SMTP id
 98e67ed59e1d1-392ec721e34mr1597056a91.20.1786438034735;
        Tue, 11 Aug 2026 01:47:14 -0700 (PDT)
Received: from LAPTOP-N3B6U5LC.localdomain ([117.147.100.52])
        by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-392e58a94aasm633058a91.4.2026.08.11.01.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 01:47:14 -0700 (PDT)
From: Zhenhao Wan <whi4ed0g@gmail.com>
Date: Tue, 11 Aug 2026 16:46:28 +0800
Subject: [PATCH v2 1/3] drm/nouveau/uvmm: fix NULL deref unwinding an
 OP_MAP_SPARSE op
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-nouveau-uvmm-vmbind-fixes-v2-1-aaee4b395d04@gmail.com>
References: <20260811-nouveau-uvmm-vmbind-fixes-v2-0-aaee4b395d04@gmail.com>
In-Reply-To: <20260811-nouveau-uvmm-vmbind-fixes-v2-0-aaee4b395d04@gmail.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786438000; l=1555;
 i=whi4ed0g@gmail.com; h=from:subject:message-id;
 bh=aTMGC8jjrMAmwoT5PX4XMFYEw8rXZ5oYEJn7jPDkksQ=;
 b=09+Yjqqdood4dmBPaNI3zbuyE6yGr25iSeGlJ5xSWwhUElspOvJ/vCMx+lzUAZY2pEewE1dB5
 vJ9nHlmaFQyCawnfpg4WkYn3EBEqRGtDwKFngsk5epJfxu5IZAgYp4B
X-Developer-Key: i=whi4ed0g@gmail.com; a=ed25519;
 pk=zRTKlstE0LmilshGwJsFYEVjiT6RiXMBXK8Og6VmuVQ=
X-MailFrom: whi4ed0g@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: FSCO4K6FAW6WSFICFVLSRQJLVXZELILY
X-Message-ID-Hash: FSCO4K6FAW6WSFICFVLSRQJLVXZELILY
X-Mailman-Approved-At: Tue, 11 Aug 2026 14:46:51 +0000
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Zhenhao Wan <whi4ed0g@gmail.com>,
 Yuhao Jiang <danisjiang@gmail.com>, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FSCO4K6FAW6WSFICFVLSRQJLVXZELILY/>
Archived-At: 
 <https://lore.freedesktop.org/20260811-nouveau-uvmm-vmbind-fixes-v2-1-aaee4b395d04@gmail.com/>
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
Assisted-by: Claude:claude-opus-5
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

