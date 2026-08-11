Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 074E4C5CFE7
	for <nouveau@archiver.kernel.org>; Tue, 11 Aug 2026 15:03:17 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D71CA10ECA5;
	Tue, 11 Aug 2026 15:03:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="tCVDNob5";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 84AB2476C1;
	Tue, 11 Aug 2026 14:47:01 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786459621;
 b=JVpeeByE51tyVT9InJAhhHPDn1uwSGimvu76Ez26ZNVIZd4qpxzbeGxIxIQx6HTceda99
 yhcA4Mej0nmkS/mHptJInhJ1wIYCbDiDwAjTZw6MDk/VT3TkAQ0r/ta6usaaP/z0guybuYO
 Pv6Dq4VkSOkI9TXqEFtv5Z7eDmGjoKxPp9vtpo9tFmIKxOtD3grpqjKw05RiFDKLEtXCe5i
 w+1FGIId84tfdwN6FmqLytTlCc5b/z7dyvbU5BgKu+xGwy5j7m/zPZ3+H30mywJkzBOWlrF
 Qgk/GG1nNNK0ojI13iTSwSi0ZnGOnZVk2ht4OkeondEcr8KhIDmKHrsBo+cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786459621; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=mwCkWoypVWX0DUrD2GWalLqHhPmC5gYTzx+dm4HNg9s=;
 b=soEMthqX3KnIe3rGqnzQUiDaiCN46/C4/HwNg2xqeRJppEPR1PAIw4CjeJ9h3jce28jdp
 d2qXyzI49e85HicssvpTV8/DJggsidWb2dD8+lWq7VjeXvmIVbXn2SQXC3wwXx8trsbpWvR
 01OVost9RvK9I1wuuugUvkSj3eg8xnMNG6S0AFUvH0vb7q/jqD3Puts3nxquQSUpK7OSI7y
 qcHiptf7bwpAAL1zDqzhc16N3H4p+p8C9E2N+cNg7zCsOpVtArKqn/VqiB9tSqw16X2NkoD
 j9J19b1nDXeCKwVoIpqrSFhYC4p774UUjqA3e71Zw+6UzMqWeLMqHSZu6cUg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 458554769B
	for <nouveau@lists.freedesktop.org>; Tue, 11 Aug 2026 14:13:04 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 69A1910EC4F
	for <nouveau@lists.freedesktop.org>; Tue, 11 Aug 2026 14:29:19 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-84f77cc7302so724127b3a.3
        for <nouveau@lists.freedesktop.org>;
 Tue, 11 Aug 2026 07:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786458559; x=1787063359;
 darn=lists.freedesktop.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mwCkWoypVWX0DUrD2GWalLqHhPmC5gYTzx+dm4HNg9s=;
        b=tCVDNob5kmWLVR3TuRwUsyWdIR+7S/wY2jsp9YYlpezX03u+tosQJhsisdAPAChDi6
         yKkuuWoj007g53xI27CX5ry3ETrY70CVHjSBdB0v85ClKpR1In0lUTxoA9O+eiyqjjij
         2ssodFsmNtRmfcjZCpvSrY9bDDTv4Bbe9AlQcldXaZUxNdPBDbz0Vngr/av5t7oPTAc8
         xrxmpFiSWmPgkv6todEZCqpNlt0UgFc9qE+Y7ANrCnslPlUxO3tbglQaSodgCDa2ktXB
         7hDX1qJ+nEYMS9XoHshlACUTwvoqI5jCJOi6+euLsrSSiWmla/Dv8V2RJpHXkrAzMYg5
         lv1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786458559; x=1787063359;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mwCkWoypVWX0DUrD2GWalLqHhPmC5gYTzx+dm4HNg9s=;
        b=q/ouniIaxg071XXP7gQXl7BVFuSOKhC28zneohGAfDsMY7RaBqT6l6MFgBH1KxyLZ6
         qxfY1PNX9zwvsMxbn2am9ZqEGLNMjtPwiGl3qLsXM6Q+vHUq5hwn7qZKMNlEmt9wUGPX
         rxUGqqfljp/xfL96mHrCaMKDA2BM9g4YL5143LoPm3qtjRXFMzcFfdWrnWVrvpFm3IdX
         d1dt9IRQOTs40d3SRHN/1qRZeEvSVEX/ZDHeZfdUC3+NavJVrWmGnhpgRvKGzjqh7Hqm
         UsB/GykrZ8mz64KnR4/uGb/N2M2Q7Av1+srsUQuACUAskWqS0UIYXIeWTLiywGJGh/Qo
         gmcA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr6eT1ciEDKGXCgOvCciOQWvCCD8TbwE45sDYPMg/w35klMKS0abqrnChtvQr9JkBIXl1/qmWWm@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIA/4gJXolxrORa1gzc3K87MoQZ0GyTf960pgnUP16wlJ9SBoQ
	RYql+LnIwQsZqMuHuHxjiN36qK5JZSDvA07nhFb0quqavW7aa5W1A5vf
X-Gm-Gg: AR+sD13LQf/NcLbp4cATdFAquKdv44Zkb8zyYxUcwXm+Kxeh9OIkexM4/cqL5W5ZpAm
	LdJX9viA3gTta7mnPFaT5klCzLJ0dXNKmKzuUM/4nMj6zfYK42BeFqr9hmka4Mq0uWH55ni0e5i
	wTSg/yOwGaEUsGvCzRcVZyDsuJui2zAt5seg8xJyR0zVkBDhZdM75jdzVsyLQzTp5RMuGu9A1lO
	jX0bAc0Dwe3/dPsyCnd3VfHLXfaI+ikxjvYghnxml0Q2UwXv+SV/D+ZMKJnniQKNfVlXrckihfB
	PSzxgZmclfM9w/NnFTSUfPwsqrH2uQsEOFItuSGg3gs7MFEAAnsqP9afoZ+KCm5bevEG63hFZAR
	bJ6lam4KTTUpmsRhvXItI7mN8eqZSigLblm2fx8pvL9m7BZ2z6IW+RppFRV9lqX5otuuqqSO+fk
	UcuPr/H1dHsrQmD+aQHgWIK6877VlcaTezeTxjc9GAR2JYb4zQtp5xu+Ybc8s=
X-Received: by 2002:a05:6a00:848:b0:845:e8b5:8c49 with SMTP id
 d2e1a72fcca58-84fa86aa6f8mr3656519b3a.10.1786458558584;
        Tue, 11 Aug 2026 07:29:18 -0700 (PDT)
Received: from LAPTOP-N3B6U5LC.localdomain ([117.147.100.52])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84fa954fc8asm890209b3a.50.2026.08.11.07.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 07:29:18 -0700 (PDT)
From: Zhenhao Wan <whi4ed0g@gmail.com>
Date: Tue, 11 Aug 2026 22:28:51 +0800
Subject: [PATCH 2/2] drm/nouveau/dmem: fix callocated underflow on large
 folio split
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-b4-nouveau-dmem-thp-fixes-v1-2-2cdf9860af2a@gmail.com>
References: <20260811-b4-nouveau-dmem-thp-fixes-v1-0-2cdf9860af2a@gmail.com>
In-Reply-To: <20260811-b4-nouveau-dmem-thp-fixes-v1-0-2cdf9860af2a@gmail.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 Balbir Singh <balbirs@nvidia.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786458544; l=2343;
 i=whi4ed0g@gmail.com; h=from:subject:message-id;
 bh=25RfUnYCCAn500NPErkFHuNL6+Q3MhhwJRPB178c5V4=;
 b=KuT7Vz44ftGEbyMSNmyMs8gTFuhkVAnAk7FcqfCULSkaKx7+Tre0AqjyKJ+yRD05IFx+yF++P
 mhFHY/fO+knCTMRcui6xM+5LBLSBox31ZOFlheXXru87VbNIRBncJX0
X-Developer-Key: i=whi4ed0g@gmail.com; a=ed25519;
 pk=zRTKlstE0LmilshGwJsFYEVjiT6RiXMBXK8Og6VmuVQ=
X-MailFrom: whi4ed0g@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: D6IM36XL5WZTYBO5IQ4HA7FSCLHCUVJM
X-Message-ID-Hash: D6IM36XL5WZTYBO5IQ4HA7FSCLHCUVJM
X-Mailman-Approved-At: Tue, 11 Aug 2026 14:46:51 +0000
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Zhenhao Wan <whi4ed0g@gmail.com>,
 Yuhao Jiang <danisjiang@gmail.com>, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/D6IM36XL5WZTYBO5IQ4HA7FSCLHCUVJM/>
Archived-At: 
 <https://lore.freedesktop.org/20260811-b4-nouveau-dmem-thp-fixes-v1-2-2cdf9860af2a@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

nouveau_dmem_folio_free() drops chunk->callocated once per freed folio,
while a large (compound) device-private folio is only counted once when
it is allocated.  When such a folio is split, the mm core invokes
->folio_split() (nouveau_dmem_folio_split()) once for each new
sub-folio, but the hook only fixes up the sub-folio metadata and leaves
chunk->callocated unchanged.

Each resulting sub-folio is later freed separately, so after a split
the single allocation (+1) is met by N frees (-N), leaving
chunk->callocated short by N-1.  On the first split/free cycle it
underflows: WARN_ON(!chunk->callocated) fires, the unsigned counter
wraps and never returns to zero, so the chunk can no longer be
reclaimed (nouveau_dmem_fini() also warns on the leaked count).

Account for the new sub-folio in the split hook, under the same lock as
nouveau_dmem_folio_free(), so the count stays balanced.

Fixes: c32287471077 ("gpu/drm/nouveau: enable THP support for GPU memory migration")
Reported-by: Yuhao Jiang <danisjiang@gmail.com>
Assisted-by: Claude:claude-opus-5
Cc: stable@vger.kernel.org
Signed-off-by: Zhenhao Wan <whi4ed0g@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index d2abee3efb9a..ad4570c50be7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -279,11 +279,25 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 
 static void nouveau_dmem_folio_split(struct folio *head, struct folio *tail)
 {
+	struct nouveau_dmem_chunk *chunk;
+	struct nouveau_dmem *dmem;
+
 	if (tail == NULL)
 		return;
 	tail->pgmap = head->pgmap;
 	tail->mapping = head->mapping;
 	folio_set_zone_device_data(tail, folio_zone_device_data(head));
+
+	/*
+	 * The split hands out a new independently-freeable folio that will
+	 * later be released via nouveau_dmem_folio_free(); account for it so
+	 * chunk->callocated stays balanced.
+	 */
+	chunk = nouveau_page_to_chunk(&head->page);
+	dmem = chunk->drm->dmem;
+	spin_lock(&dmem->lock);
+	chunk->callocated++;
+	spin_unlock(&dmem->lock);
 }
 
 static const struct dev_pagemap_ops nouveau_dmem_pagemap_ops = {

-- 
2.34.1

