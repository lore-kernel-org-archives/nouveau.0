Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0875606A31C
	for <nouveau@archiver.kernel.org>; Tue, 17 Nov 2026 21:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VlA+jYUP
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5F38010F992;
	Tue, 17 Nov 2026 21:44:52 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A7497494D3;
	Tue, 17 Nov 2026 21:24:59 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1794950699;
 b=HSp0IbFGeCHZQtYBt5ycVjLETfeUc2FvfPhEed2ku1AmNzXUh0/x0KximcPHzMYKVGQyl
 ZVa5mZ5bseXvE5N+pV5QvavW0QL87j1BDKEojhmAYjrZze2n2gkK6qz4ZKB8KGJ+NYk2LoG
 juS38KekiN+ljAG7NOOQkWMMwP/tS6IbDC1j3ihNpl/nPtiUrIK9XdLOvFrOUi1AvoXS3BX
 v+FfPnJ1c/aG+AnC/u8qZ4byOoQh36c5976Qwf6pN7pVzvqq54mq3pA1ESApAnPHgW6iBL7
 vRGm5rnYm5PbOaPV0/ofNjs8P1apt+09Vz9M3169TgY9qYV42nRHwpV4usVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1794950699; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=DOc7qs5gpmxDny1UvV4waZXrE2n/TMggor9dB+wdMFA=;
 b=05EF2HzCGogFSGAHOi7jUeLUBbQhQZlCupNJN4crSlzNVuc4dfvJ/iAL/0bqKIIz1hx64
 jJgMsQwPTQOVLWrLIOzYXLDZZdYHYSrP4d+VepmxrwUmm/iUP/nH66ncWmLsYxsj8QdL++d
 8H/h5mmGbq+i7JCQio8b1t2xssJRpZqfy2m4F5Jt4CjgJcVqG2KLPnl4E+NDnumNw9cdLOj
 XUrA0TFh1Fy/f3QbTdeb2Kyh5cgxY043YDwck802zBvxaZmn8FovUWebOQnbGmLCsFihEp+
 7UikhsxwGW1HZgSPK5flw2NykF/9c6onIC3CxYoXtPZ9Ii1+zxW3TcloU9kQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A92D1494CA
	for <nouveau@lists.freedesktop.org>; Tue, 17 Nov 2026 21:24:56 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 448F210E6AC
	for <nouveau@lists.freedesktop.org>; Tue, 17 Nov 2026 21:44:44 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4bb64ef5a14so3425015e9.1
        for <nouveau@lists.freedesktop.org>;
 Tue, 17 Nov 2026 13:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794951883; x=1795556683;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DOc7qs5gpmxDny1UvV4waZXrE2n/TMggor9dB+wdMFA=;
        b=VlA+jYUPzmjbKrTUARdcEPztuOpLt7jsAtDNreq5Va3VXdLNuOZFxeoIz9fq645hcr
         3snq0nfz+kVCY18kD6R4ZLwcZMnUcRplbIQ6l/mxWYBWdmGI5owLCXiZPQOzE8GIKm6l
         lnRATCnQIwSoEcRMc7SjSm/aoWTe32zWtpkobXPaJX3mC8LZ2SImfZXd7mkgda4DhBEW
         fkHyYmbIrwTB5k+M06eHEDvrfCsVYeGbWuP8ZljLLXnUjP4WLYbm6gjKsM5RUYYFTo3J
         5UUECQT/I7q6H0PQFuEQo6suwJbxOsW78VBQKTquyF+q4iUxOVhJpuyupcZs6Q6Ev4Bz
         DAUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794951883; x=1795556683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DOc7qs5gpmxDny1UvV4waZXrE2n/TMggor9dB+wdMFA=;
        b=jqe+fslmwFbFbRf4lvQ/+3wM3tDrP6rYisqIfjWoZnKxFTl7pCI6pG2mBKcNk59MY8
         5N/5PL8U9N5vIURmyTeXLlpOXEVFfft+7bAQIOOJ01LVaWt47PEAeE65SVdz9bbcqhXZ
         5jCXYhNXUMlJJnypbpuD2uL7qQrXVtO9XWxU3bj9cx1hUL32BGha75zT8iySCvOy6uHc
         Cqr3lLcxPEx27MhiSSb2uYCYdS1kAASbOp3r0OdeDzPXx22DW5VjHRWCuVY0wL4+pEaI
         HZDRJJubWhn8TL+b1e/w2dicrZCyMehpcglv2xF7uCMCGMTt4GwHQqLTEF5kqKxsTVYY
         F1VQ==
X-Forwarded-Encrypted: i=1;
 AL+hErHvhxXuezkUz/XgEBsnS77VueFQyzWBpvOVW86g0p6PbB3oVOCq1DzXHufd1+S0gRLuESXMojV2@lists.freedesktop.org
X-Gm-Message-State: APuU4Z8bO5wMfzJIKB+Q9h+D+byWHs0stIPwvNhqH9LXPXzVa3z79C+5
	rsxhRmCMPUFcEy5RVASUiJYNdoySFP1bdLyKeSd6eoB7LGWM2bH3QVq6
X-Gm-Gg: AYBFou3HMta0rzn30kHUbju4vCnFc4L52orfKP2Y0KjIz5jg/f7o/c04qj7zZTz/Z/M
	DqKSFJWUuM1HP2oJEBBfhnC+/MiB7IOLNqRz3D2u2yUG6AomcybIcctkMs0pN7uF8ijpjOQ/0T4
	uqqA1f4rG8TO6YA5VAi6SpOYE7MX0NqZJ/lDnLU2B0jBF1By8YmgzQmoBMM7YYpdMN4uTsaMnpz
	qtJiBwlE1mWXncOVGHP6FhNWUFGjF7MjJ/KUUfWGOA+A3lu0TIWG703XOeGT7KScxFqmPgZEKaO
	BtjWH+E+qCN73WIRwP9z39szzzeWm+Jby+JTo6MYJyf1VJeRu6wC3mRZ2nA0W1zQ3GA+YGiNwfQ
	Rl5jBgTONuJ33COhUMF8Ntm3XPhDbmuq6jL8bSdzn3yXq9sKivKZtOfjskOwsf6sqJCoYSjt26t
	8Z7tJ1qioQa8hA5r3W3zTiXSqQCV80IcSgiod1VCEltA8ve/SPSNJ6oZKOtpPJjGF2PVVkLRbHj
	3Klq74h8bu6VUF14cjBUnKvoPMdAZH01pXiMhfvOVByWF1YzUvPdD/HG1nPQhl9hC4uvi0qSOqd
	v52H+X6RX2EpMB6dWBgwD0Bse7CnQrf9B/4v/thp5y/o4xwJD9BkFQUha4il1A==
X-Received: by 2002:a05:600c:608c:b0:4b6:267a:dd6e with SMTP id
 5b1f17b1804b1-4bb7da44047mr9350665e9.28.1794951882663;
        Tue, 17 Nov 2026 13:44:42 -0800 (PST)
Received: from fedora ([94.200.248.157])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb784231basm95069675e9.11.2026.11.17.13.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:44:41 -0800 (PST)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] drm/nouveau/instmem: map only the part of BAR2 that is
 used
Date: Wed, 18 Nov 2026 01:43:52 +0400
Message-ID: <20261117214352.337961-4-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261117214352.337961-1-mohamedahmedegypt2001@gmail.com>
References: <20261117214352.337961-1-mohamedahmedegypt2001@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6FABBM7DWCQBD7FQ2LKVY6USIF7JCAGF
X-Message-ID-Hash: 6FABBM7DWCQBD7FQ2LKVY6USIF7JCAGF
X-MailFrom: mohamedahmedegypt2001@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Mary Guillemard <mary@mary.zone>, nouveau@lists.freedesktop.org,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
 Thomas Andersen <phomes@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/6FABBM7DWCQBD7FQ2LKVY6USIF7JCAGF/>
Archived-At: 
 <https://lore.freedesktop.org/20261117214352.337961-4-mohamedahmedegypt2001@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The io_mapping covers the whole BAR2 resource. With GSP-RM and with
NvBar2Halve the BAR2 address space covers only its lower half. The
driver maps nothing in the upper half, and a mapping that already
exists there would give the io_mapping its type.

Size the io_mapping to the BAR2 address space. The range does not
change where BAR2 is not halved.

Fixes: 34e27b90552a ("nouveau/instmem: use iomapping interface for instmem handling")
Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Tested-by: Thomas Andersen <phomes@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
index 1b4be4b1f0bb..1e7d439c2d59 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
@@ -191,16 +191,17 @@ nv50_instobj_map(struct nvkm_memory *memory, u64 offset, struct nvkm_vmm *vmm,
 }
 
 static bool
-check_io_mapping(struct nv50_instmem *imem)
+check_io_mapping(struct nv50_instmem *imem, struct nvkm_vmm *vmm)
 {
 	struct nvkm_device *device = imem->base.subdev.device;
 
 	if (imem->iomap.size)
 		return true;
 
+	/* Map the part of BAR2 that its address space covers. */
 	return io_mapping_init_wc(&imem->iomap,
 				  device->func->resource_addr(device, NVKM_BAR2_INST),
-				  device->func->resource_size(device, NVKM_BAR2_INST)) != NULL;
+				  vmm->limit - vmm->start) != NULL;
 }
 
 static void
@@ -293,10 +294,10 @@ nv50_instobj_boot(struct nvkm_memory *memory, struct nvkm_vmm *vmm)
 	}
 
 	/*
-	 * boot is only called on BAR2, if we can't remap the complete
-	 * BAR it's unlikely things are functioning well.
+	 * boot is only called on BAR2. If we can't map it, it's unlikely
+	 * things are functioning well.
 	 */
-	if (check_io_mapping(iobj->imem))
+	if (check_io_mapping(iobj->imem, vmm))
 		nv50_instobj_kmap(iobj, vmm);
 	nvkm_instmem_boot(imem);
 	mutex_unlock(&imem->mutex);
-- 
2.56.1

