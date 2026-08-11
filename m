Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789B0C5AC67
	for <nouveau@archiver.kernel.org>; Tue, 11 Aug 2026 21:14:30 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A5BC310E2F4;
	Tue, 11 Aug 2026 21:14:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hbl06fgc";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id ACC84476E1;
	Tue, 11 Aug 2026 20:58:13 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786481893;
 b=XjHS0V73SJ+plDTwLBXi2+sWzflT1zDJzGi49NSAlHLCaufsqiKzpVgKTKh8XwqBxLjHT
 1sbxu9H4QLK1KikvSQewuRya/AdkpAgYKZIBqM+E60rSgslF8pPxaWUKiv2uzg8etLcisy2
 Mk+v158skCnTuTJkmm4T6u49pWO4ssDT8tryFVDYa0n6ASb9omlgQ1pZvsKhPmJb2InURkK
 tgs/0UlVy7Ir8M8Ao/ygA6o/YFNmC19wU1WqaxwEIFLAbDARqWGy6fPRgdhs0e4i4uYLmnU
 KKn04ESF5TYe2fiWfAArpNjvtuBZvCCiYc8ClpJ+ZSg4c0mj4OvgAqjdF/ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786481893; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=CasrwAeU4zNExmdvqxolJrRbP1xj2cuvMnUIVD1Umt8=;
 b=geeWOuWCS3LmN5WYqwE6Uu3oGLhoj+HNXOG7Gm5NV4J8r2PeTNL4wzLdW+mtvAbiB4hQw
 PSEiyETrVz9cWBU3xeSLGywWctr/RRVTkWxKAu7UXu3Mng04C4PIQgUo5un1BRtyEDMiyHb
 gRcozSTdVL/YC73saQTT0kyUKhZew4uo/6SrTH/KmWmyBjB/A31py4SvatTMmmXlhx3YrSQ
 fJ0vsF64Fz6UIgTZqQFHPp3gKuj3SD9SBp5z2i1hJeGq2TaxJ/6nUyVgXmwWjaxR2z/KZei
 bqFJluGBCejH3izFfxEvf4jEt3eZQvU3dp2hr+T8kjEO0CcAaawi4OUFC4PA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=redhat.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=redhat.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id A3F9E476A0
	for <nouveau@lists.freedesktop.org>; Tue, 11 Aug 2026 20:58:10 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 33BDD10E263
	for <nouveau@lists.freedesktop.org>; Tue, 11 Aug 2026 21:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786482865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CasrwAeU4zNExmdvqxolJrRbP1xj2cuvMnUIVD1Umt8=;
	b=hbl06fgcNRQIQysRSvdU7qhRl9x4tjskO/Rvyx/bU37Phl17IX/Nh2q3CI86569hKSDoS9
	y8Gvj8v0Sp98ZDDJRdkhSwU0zU1IbcqlWzxC1UcerGfc6ZBnIrtXyYRlCgaxDrKnm84Yte
	2OVzxGjhihDQDg7aPJ8FscBz3RWnj6o=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-J0v58HL8NvODeEkIrmrXiA-1; Tue, 11 Aug 2026 17:14:24 -0400
X-MC-Unique: J0v58HL8NvODeEkIrmrXiA-1
X-Mimecast-MFC-AGG-ID: J0v58HL8NvODeEkIrmrXiA_1786482864
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-9349c5af52bso69149185a.0
        for <nouveau@lists.freedesktop.org>;
 Tue, 11 Aug 2026 14:14:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786482863; x=1787087663;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ouhsGoLziLRHCm+hWwEcaYZBRlXQpJLyEgr0LCF275A=;
        b=OKdksxjEAZU3oVKY4595kfGPEsnaG3XrecqH64l1it0i0/wEKe8Ub3YOKpReTNKMk2
         u6qVc69/zFSfUEB9akunimAzPjxdwe3DPcGLAv++rQGD9NfRN6aB1V+B3KvBq6PNThu2
         JyRrUPiN/iX+wgN6HS0xiZ/HMAqf0YCHWPIBi20YVHIC2odo1wUVfUmDRPkMEmphDEWA
         UWTEXoh/iHgmWG+9G6fAIdWJSAQHDLhs657B7clXQMO1HwpmkTlF57k8dPwEWOEkveDV
         1RY90G0uZ97dUZjVRzC4evQDn0288BU/g7YS0dkehqx66tL0/d+mB66dMm0yBwj9r8Ae
         FuLA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqlIN/rp889NjG+865CqZuw5DxmsV9uFAUyfIZrkPOlMOEPpzsDx5ZcFxf4YM652A8vgcgV8ORt@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxrLg7yZcEAMEZS12vt68i6P5qbxQJXhFhWUfjg/Qe7VilISYAB
	sNKFCXVfRh6s4MtvUWxOGQttr8jVToc4i9I4ftW5tAsuySw+Yd1AFqb5Lwkv1sYmTGLSmoUmuzI
	rNFddxGYiU9ogUzczLdrtuzEgjdCy/DvluLd62SkofGbpDw/U9EqNzLkdZmB8K5ChDbM=
X-Gm-Gg: AR+sD10EF/MxGCGGwwehZIEgpY+P86zVwNkmMF6QUiAl4nWWnHpxlhaxqnre3CWX0Ke
	upsV1W8G5wqzRUry1jL7rXbqDABeK8hi3vGIbQxfIDTRy1qosDDIk2ZZqMgb5AVjv1xjsmNNM3x
	rc2FriNajsYazI/2V5dTxjAQBFvBBCk8m0ffpnNheY0eJ8CWFAcJeEaucbhm/UU6X+YoOU46s5S
	NftgesLAB+hSHkDheS0xuYjY7/euugTcFF0ix+25cvGcBhCtj0Y2OoPyC79VQ/DQ40qLlCGXfMY
	rTClL1h/yaUf9Ur47iKD+XEZX0O4gtXWd8yA/OvxrA3lqQLB4AwbRZLT1XrLZitsR5LCCMQJ
X-Received: by 2002:a05:620a:25cf:b0:930:a718:bafb with SMTP id
 af79cd13be357-936b3a4201dmr39431785a.10.1786482863545;
        Tue, 11 Aug 2026 14:14:23 -0700 (PDT)
X-Received: by 2002:a05:620a:25cf:b0:930:a718:bafb with SMTP id
 af79cd13be357-936b3a4201dmr39428185a.10.1786482863056;
        Tue, 11 Aug 2026 14:14:23 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-936a848e7ecsm196988185a.11.2026.08.11.14.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 14:14:22 -0700 (PDT)
Message-ID: <a24ff71ff94630ec818477ce6c590215ac3839e0.camel@redhat.com>
Subject: Re: [PATCH 2/2] drm/nouveau/dmem: fix callocated underflow on large
 folio split
From: lyude@redhat.com
To: Zhenhao Wan <whi4ed0g@gmail.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann	 <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter	 <simona@ffwll.ch>, Andrew Morton
 <akpm@linux-foundation.org>, Balbir Singh	 <balbirs@nvidia.com>
Date: Tue, 11 Aug 2026 17:14:21 -0400
In-Reply-To: <20260811-b4-nouveau-dmem-thp-fixes-v1-2-2cdf9860af2a@gmail.com>
References: <20260811-b4-nouveau-dmem-thp-fixes-v1-0-2cdf9860af2a@gmail.com>
	 <20260811-b4-nouveau-dmem-thp-fixes-v1-2-2cdf9860af2a@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: I1Yka_mlLyumd_HIr-y1ErAcXh-c3WxV8UGtNY-0rTY_1786482864
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: XCDSPNUR3FQZJF35KENLRAASGD7IVMXH
X-Message-ID-Hash: XCDSPNUR3FQZJF35KENLRAASGD7IVMXH
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Yuhao Jiang <danisjiang@gmail.com>,
 stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XCDSPNUR3FQZJF35KENLRAASGD7IVMXH/>
Archived-At: 
 <https://lore.freedesktop.org/a24ff71ff94630ec818477ce6c590215ac3839e0.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This patch looks suspiciously human written (or at the very least, the
commit message sure does). FWIW: if the code wasn't itself generated by
an LLM, it's fine by me to avoid adding the tag. Most of us are
concerned about generated LLM code that gets submitted, not human
written code written to fix a legitimate issue that an LLM managed to
help find. If we were concerned about the latter, I think anything
sashiko touched would end up having an assisted-by tag on it :).

Either way, this whole patch series is:

Reviewed-by: Lyude Paul <lyude@redhat.com>

Issue looks quite legitimate, fix seems fine to me.

On Tue, 2026-08-11 at 22:28 +0800, Zhenhao Wan wrote:
> nouveau_dmem_folio_free() drops chunk->callocated once per freed
> folio,
> while a large (compound) device-private folio is only counted once
> when
> it is allocated.=C2=A0 When such a folio is split, the mm core invokes
> ->folio_split() (nouveau_dmem_folio_split()) once for each new
> sub-folio, but the hook only fixes up the sub-folio metadata and
> leaves
> chunk->callocated unchanged.
>=20
> Each resulting sub-folio is later freed separately, so after a split
> the single allocation (+1) is met by N frees (-N), leaving
> chunk->callocated short by N-1.=C2=A0 On the first split/free cycle it
> underflows: WARN_ON(!chunk->callocated) fires, the unsigned counter
> wraps and never returns to zero, so the chunk can no longer be
> reclaimed (nouveau_dmem_fini() also warns on the leaked count).
>=20
> Account for the new sub-folio in the split hook, under the same lock
> as
> nouveau_dmem_folio_free(), so the count stays balanced.
>=20
> Fixes: c32287471077 ("gpu/drm/nouveau: enable THP support for GPU
> memory migration")
> Reported-by: Yuhao Jiang <danisjiang@gmail.com>
> Assisted-by: Claude:claude-opus-5
> Cc: stable@vger.kernel.org
> Signed-off-by: Zhenhao Wan <whi4ed0g@gmail.com>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_dmem.c | 14 ++++++++++++++
> =C2=A01 file changed, 14 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index d2abee3efb9a..ad4570c50be7 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -279,11 +279,25 @@ static vm_fault_t
> nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
> =C2=A0
> =C2=A0static void nouveau_dmem_folio_split(struct folio *head, struct
> folio *tail)
> =C2=A0{
> +=09struct nouveau_dmem_chunk *chunk;
> +=09struct nouveau_dmem *dmem;
> +
> =C2=A0=09if (tail =3D=3D NULL)
> =C2=A0=09=09return;
> =C2=A0=09tail->pgmap =3D head->pgmap;
> =C2=A0=09tail->mapping =3D head->mapping;
> =C2=A0=09folio_set_zone_device_data(tail,
> folio_zone_device_data(head));
> +
> +=09/*
> +=09 * The split hands out a new independently-freeable folio
> that will
> +=09 * later be released via nouveau_dmem_folio_free(); account
> for it so
> +=09 * chunk->callocated stays balanced.
> +=09 */
> +=09chunk =3D nouveau_page_to_chunk(&head->page);
> +=09dmem =3D chunk->drm->dmem;
> +=09spin_lock(&dmem->lock);
> +=09chunk->callocated++;
> +=09spin_unlock(&dmem->lock);
> =C2=A0}
> =C2=A0
> =C2=A0static const struct dev_pagemap_ops nouveau_dmem_pagemap_ops =3D {

