Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59EE6C5DF7D
	for <nouveau@archiver.kernel.org>; Tue, 18 Aug 2026 19:10:40 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D49A610EC46;
	Tue, 18 Aug 2026 19:10:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FhoRbbHH";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8C055478F8;
	Tue, 18 Aug 2026 18:54:07 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787079247;
 b=OGYSepIE8cRdaQ6Bl/TPHgzWh7gxqIB8OTyCoz80R/SMr5s2gOyQTc3abBBBHtdjoSVzY
 piLM3jCcLSkPaiwzsB2PLa0Rrul/BFhbmTXSmcnzyRAnkyhxm6Pl4esrgATZPQFizQp3TLo
 qrPIJxK6rXG+IxAqlHSeswzbOw1wYFau5IpWScpp6BauUtR8ZjUBGXa0ud82wmPCNhVSvul
 7+OD0xbc7aVn0VU3gZSqnPIvYWXmuVOIuft8p4v70sEugJTAXjVbkU5FhcKzfJW9uEjaEuR
 AJC87gCFI7F9E7gQwzKkYE1+BksCUYXUPwba2DTS/om3GKHB5D+u+I9oXJ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787079247; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=1C21gLMhd/u+qmfcqS0pqk/SXD/LCoXj54HlBv66NyA=;
 b=MbZ/spK1UEhOZIqE0VBYDpAS11MuUm4gH5tRXG27dP5zx2ShXGT47nMiujwfmbV1JZb9m
 Aops7FoR/zCcrAAkekkJiB0HPWDQwIV0Q3Hic1y9qd92BIKBU3K2vjbQ0wukXTbG0xRSMZy
 I84GSB4XWKmzvNaYZ7YhX9J8eai3pKPUUn7Y2Nkplp6IRWRO+IaV08umqJ9oEHU7QpyD4Vg
 QnjK22wGgeae5aLRLe44kziosMwvoPr41bzeUXpUqGaW6QDFItjuKbnL2O2n4LbU0PqrtJM
 6t/MCTChW/Tt2dWjNH/GJljSw88q+v/jEjOJRa0AJIQdbAAa7Bd02QomFBuA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 515EB43E5F
	for <nouveau@lists.freedesktop.org>; Tue, 18 Aug 2026 18:54:05 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4EC9C10E525
	for <nouveau@lists.freedesktop.org>; Tue, 18 Aug 2026 19:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787080235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1C21gLMhd/u+qmfcqS0pqk/SXD/LCoXj54HlBv66NyA=;
	b=FhoRbbHHplQxPysKKhaTY0CzxnwxJaMXnzc0wevDSi5byQevQx6kmBEaFdmCGowUNQdRYR
	qDP6ANznthyc6EiRNAPvhbp0cbIlyzMVUNcBf9VNFx9B09mX1tx2irwEVeZKTpuQZKXEEJ
	an5FcWIFG/vFANqrZiV+/ABMD3oQR8w=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-HvitzIVJMMu5YNeTpsfM_w-1; Tue, 18 Aug 2026 15:10:33 -0400
X-MC-Unique: HvitzIVJMMu5YNeTpsfM_w-1
X-Mimecast-MFC-AGG-ID: HvitzIVJMMu5YNeTpsfM_w_1787080233
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-52b4f6ac06aso2666041cf.1
        for <nouveau@lists.freedesktop.org>;
 Tue, 18 Aug 2026 12:10:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787080233; x=1787685033;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9kbwhzYfa9+JR+FXCNWXDj5upifP6ZSYoTxSiBsZODs=;
        b=DKPtHBxDAJ82gkoFlUXVSpXQUSRRtEnVNHp7ie2h57OQ+8IVjgLVinUrA0W/Nd776T
         y2R/smnE0YLVXfoxh0Dr4e8IaNdBQjwjaYuP0zNLJJOT9sKq7X/4USvRbgeTgdsdYCyl
         s1NWjaGP3KdEJBEKxBRFmmLzAvNHRt6MllH5ku/CylDlb2Mx3FFOzZvDD3QNo88+jz/t
         WDbtE24J0gUbaC3G4XITLj8Bd3KCY5yjS9MmIgJ9pSOd/aTA1iH9HTw/xOTt5MThKJIR
         sA7rVgYUKRFG/klzCzXj/k5UVDfz+rpZ9EqcLIyLTMnUHrX3dNO9fSb5wFMoNq5QjTFg
         oRaQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoTbY/H1lFq6mg/1X5C726QpNleVJgwFlxDKB+H3fJD7H6j898Kc485+ic2KzNT4ndpfybA1Uxk@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzoana8MgAqGbN+dl3Bsrd8QMK70YXgOvaam0+i9HCK7UIjk3bQ
	bvcoR/2iNDeX6PmbwFyAtLp93TWSdhoZjYhW+2J95FpkRaC0GKRKAWBH9xtZ4kH1qy0QD7OkGcy
	LCBuQJLsS+StjMv/xaGO8UKYq2SX/72Pf9zJt5JwxF9saEKDCKRDbs9z8LJrz7fKOFM4=
X-Gm-Gg: AR+sD11+mPg+aR/PZG1BEOHXNOr0aFG85x5CMLThUGkULKStmuBVkzJfI35i6Aqv7oK
	aOSs8BBiWe3DzmBvslPd11V9OSzjMcbX9He+9pJRVwFS/L1M8gnaJ3g3vcbecUXr1+43aq9Kd+E
	RcLd1+aqqwM5UZUvAT9RSm2bTXGSzzvgyczugzCPAyz8TOrXiWCGitJbu2pJXWYbcpiFpTkgsqY
	ZVMeWjyh25dahzrNt/DdAwa2TBDHALQ5Dk+VC2N2vB9G2zDWvmjBcb66pTA79jyMNrCZ/LdktRY
	jtogeFgpIyqJfsfmvxZzQtSvBOuzijKbFIWOXwbjO6Y12tfzVcdLK3C7+VzaE6V1FkFO4RP4
X-Received: by 2002:ac8:5749:0:b0:52b:4e1f:941d with SMTP id
 d75a77b69052e-52dd30d0802mr3569141cf.6.1787080233377;
        Tue, 18 Aug 2026 12:10:33 -0700 (PDT)
X-Received: by 2002:ac8:5749:0:b0:52b:4e1f:941d with SMTP id
 d75a77b69052e-52dd30d0802mr3568331cf.6.1787080232870;
        Tue, 18 Aug 2026 12:10:32 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-52db623bfb0sm44781051cf.24.2026.08.18.12.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 12:10:31 -0700 (PDT)
Message-ID: <7ba5804dccefb1fde985f19242f6bad94aaefcc8.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau: reject zero-size notifier object allocation
From: lyude@redhat.com
To: Zhenhao Wan <whi4ed0g@gmail.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann	 <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter	 <simona@ffwll.ch>, Ben Skeggs
 <bskeggs@redhat.com>
Date: Tue, 18 Aug 2026 15:10:30 -0400
In-Reply-To: 
 <20260813-nouveau-abi16-notifierobj-zero-size-v1-1-20dee38077cb@gmail.com>
References: 
 <20260813-nouveau-abi16-notifierobj-zero-size-v1-1-20dee38077cb@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CG0loOpTTE4opg9-P0SxEuyobC7tSJ959DS9qSD8hkY_1787080233
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: CS2YI3ABJYVUFWM42WDEMELTHGGMXP5F
X-Message-ID-Hash: CS2YI3ABJYVUFWM42WDEMELTHGGMXP5F
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/CS2YI3ABJYVUFWM42WDEMELTHGGMXP5F/>
Archived-At: 
 <https://lore.freedesktop.org/7ba5804dccefb1fde985f19242f6bad94aaefcc8.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to drm-misc-fixes in a moment

On Thu, 2026-08-13 at 21:14 +0800, Zhenhao Wan wrote:
> nouveau_abi16_ioctl_notifierobj_alloc() passes the userspace-
> controlled
> info->size to nvkm_mm_head() as both size_max and size_min without a
> lower
> bound.=C2=A0 A zero size satisfies the allocator's "e - s < size_min" gat=
e
> (size_min =3D=3D 0 makes the unsigned comparison inert) and yields a
> zero-length node, after which
>=20
> =09args.limit =3D ntfy->node->offset + ntfy->node->length - 1;
>=20
> underflows (offset 0, length 0 -> 0xffffffff) into an oversized ~4
> GiB DMA
> window.=C2=A0 The dma object constructor only rejects start > limit, so
> the
> validly ordered [base, base + 0xffffffff] range passes and is
> programmed
> into the GPU DMA context.=C2=A0 The ioctl is DRM_RENDER_ALLOW, so any
> render
> node client can trigger this on pre-Fermi hardware.
>=20
> Reject a zero-size request before allocating anything.
>=20
> Fixes: ebb945a94bba ("drm/nouveau: port all engines to new engine
> module format")
> Reported-by: Yuhao Jiang <danisjiang@gmail.com>
> Assisted-by: Claude:claude-opus-5
> Cc: stable@vger.kernel.org
> Signed-off-by: Zhenhao Wan <whi4ed0g@gmail.com>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_abi16.c | 4 ++++
> =C2=A01 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> index 291203121f0c..8d139bbb2934 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> @@ -660,6 +660,10 @@
> nouveau_abi16_ioctl_notifierobj_alloc(ABI16_IOCTL_ARGS)
> =C2=A0=09if (unlikely(device->info.family >=3D
> NV_DEVICE_INFO_V0_FERMI))
> =C2=A0=09=09return nouveau_abi16_put(abi16, -EINVAL);
> =C2=A0
> +=09/* zero size yields a zero-length node, underflowing
> args.limit */
> +=09if (unlikely(!info->size))
> +=09=09return nouveau_abi16_put(abi16, -EINVAL);
> +
> =C2=A0=09chan =3D nouveau_abi16_chan(abi16, info->channel);
> =C2=A0=09if (!chan)
> =C2=A0=09=09return nouveau_abi16_put(abi16, -ENOENT);
>=20
> ---
> base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
> change-id: 20260813-nouveau-abi16-notifierobj-zero-size-5d3888d36b57
>=20
> Best regards,
> --=C2=A0=20
> Zhenhao Wan <whi4ed0g@gmail.com>

