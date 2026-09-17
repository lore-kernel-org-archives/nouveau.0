Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6D3C982D0
	for <nouveau@archiver.kernel.org>; Thu, 17 Sep 2026 19:59:28 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8203010F0E4;
	Thu, 17 Sep 2026 19:59:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ex/iFKLL";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6FFC848221;
	Thu, 17 Sep 2026 19:41:49 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789674109;
 b=u2z3HM2OdINFgTgUdUTZw+l4/fzf05G/6gy+QY+SwddaU3NGgr5wnxL4zBmxBYEHxDINU
 akZ3PZ5EpBwKcPCeJWy1z3TIu5808TwX1dCRlCcGQQ5GsgtSQZwk4Lvev6Z0DGm//Xe+Gcs
 INR2WhG/rgfc2QB/BO8b9CkGnBXGo2TC1Z0zxGKZAJ62BZ57ySIFfLWTGr3kwxzWnbc2kbO
 hyt2ekXpmwXgZhzGZBVFsqTLsqykhEY97Bk2xTbKNFi3PWS0A8XySwYHQ9Ak4LyTndIta4s
 ueY3NVdKKLuiIqEm+B1B1dTearsWWa8tQXMiixgIWVcf837mztj8cNRH98Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789674109; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=oyk2K5+RCGfchw1Ej2mt2PF4h78M1vV4ssckCb7zVJA=;
 b=r/es2AqdeSgB1DbmpQF9iuNLvcLv7GuVJM/Fv567QK+VkfB8khgr9yuxAgBZTQYDCqgN6
 Mcjh6L8Sq4M2p0oWfUMikNlhjTbqSIkGGIUBcOb19NRwtyb6m6ZSRSGjDXSK3ptSexm2R+L
 TeQSk+XHHOWTFhpzZZTD1JyUCqhtiKCPFgrZP6GEZe578KLgsKtRQXVwqB7Bx2Ga79amadm
 flX64LIAMGM/1bNlz4kEenFo99PeZUmWRM21DKZ5oN7+payqUnnY1PWTbgfcX0oyHOZxZWY
 oDImNrKbs1zkRrgkyO7RCP4b3Z4xCG/90pO7ym0hKkggJ2w3MFaPJbB340Ag==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 8355B481EA
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 19:41:46 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3A14810F0D6
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 19:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789675163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oyk2K5+RCGfchw1Ej2mt2PF4h78M1vV4ssckCb7zVJA=;
	b=ex/iFKLL8rSSeJGmGNIiDPhGlqlZp1StAKcMYbKltLzX78SnIx/mr3cVf4r7+hO11EIfl8
	oa+R3T8Xy47ebf0xa66bDe8HjGYgWfCO0MB+f+1X65SPJUzHSvRSedkYlX68Y2vw0+o1rV
	2OZYnkj7JkRoK499dByEYer0yqE4/1M=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-499-ChLGYOdaN8-re8bmV3aUzw-1; Thu, 17 Sep 2026 15:59:22 -0400
X-MC-Unique: ChLGYOdaN8-re8bmV3aUzw-1
X-Mimecast-MFC-AGG-ID: ChLGYOdaN8-re8bmV3aUzw_1789675162
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93a2d361e1aso221885a.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 17 Sep 2026 12:59:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789675162; x=1790279962;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/9aXv8uRrrDfO592gJdgz9hZv2sNMllIL5UBHr09UAU=;
        b=uICFlTOz/wdcH9GmrVK0glXD4Bs7IyViRS7it9qlqSJv6x8d1EIYSWT6Arl/w8tSJb
         gR7Xdos2ogn4Pj/3Om8zZ3GsWMv3zAvmJFRF7e0yEJxpR3kuMRsK61UhCO4MZfUZ5fdU
         ULUTWZhIzw/D1h5V2RHwAokE4a1qg+C1MQUW/Kr8E+VykHvwO2sPs3l4AJOOizZQGo+m
         DRM2VaQxH6TkkUFqQ8EBISrAJ631JjKJEApQqZ421Grm3u8hIjZM140w3894pU4PYdEu
         +rchc4bUeFaY3miD02zrri1VNcSucbz1lHPHcRO84nxB97PYmEKRc5eONRCG0Ksi9pMg
         +JpQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxtBUt9ukroIVk3nw2hqQgVTtQfWZIsnIGM/p5iE7cttSwL+tivI+qXAvjjnHqsUwNUoIW9xsYV@lists.freedesktop.org
X-Gm-Message-State: AFuF++n0OAMDPab4zsAveTD4Q3zO2LplVKjbCvmPDx3DmP01taS1aDMe
	SD9zj7MXHqHN8PcNmyb1CCbTqglDYyyh0LGZlCF9pZ6LqYlpnEzKgEUbP6J9SkX7Azb3Ek9xV2+
	LItXT62vmeXN8GHIKZlZvxhyKFHB/aVI6/yrMvgqrU6hVu7A3yBhq6e1wQptSdm9Uoeo=
X-Gm-Gg: AYBFou3ZGbbQOVs0EDhU41u8sXan1LlHEg1orZ0Zrh5jdxqBGHoayrlN7UZ9AhmrG6y
	PsvAarllv6SQuewvIndVWgQ6DNmtpNmT3oSI3lrrPWYd2q22SywKPqcPifAI5xhw7Ed5eeuDR/P
	nAXxlVgRT6NS6Nv/ediAuJqpLAiVb1HcfjS0HbKC8nHSJc4wY1FLFziGO/UL41YdyrkKAarAlhb
	al3eZ3w86YreC+YGxOuPHsTZTF22yMqY0phht65EoFABJiqpp577mC6EtoJLZm4RYvUNkac/Rbg
	XLM6IJv/W0c7RO4J7YalAGQPHI0o5LCGvnjF8Oujs8wklY/S3FZCcdKTZza7OuZKmrrT7vml
X-Received: by 2002:a05:620a:800e:b0:937:1097:feb8 with SMTP id
 af79cd13be357-93bdc70b6b7mr2620785a.24.1789675161689;
        Thu, 17 Sep 2026 12:59:21 -0700 (PDT)
X-Received: by 2002:a05:620a:800e:b0:937:1097:feb8 with SMTP id
 af79cd13be357-93bdc70b6b7mr2616085a.24.1789675161049;
        Thu, 17 Sep 2026 12:59:21 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93b78243f77sm542694385a.25.2026.09.17.12.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 12:59:20 -0700 (PDT)
Message-ID: <495954974fdaf275d65ea8ae1b76f8e496c09b79.camel@redhat.com>
Subject: Re: [PATCH 1/2] drm/nouveau/dmem: pin VRAM for the whole registered
 range
From: lyude@redhat.com
To: moonafterrain@outlook.com, Danilo Krummrich <dakr@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann	 <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter	 <simona@ffwll.ch>, Andrew Morton
 <akpm@linux-foundation.org>, Balbir Singh	 <balbirs@nvidia.com>, Mary
 Guillemard <mary@mary.zone>, Mohamed Ahmed	
 <mohamedahmedegypt2001@gmail.com>, James Jones <jajones@nvidia.com>
Date: Thu, 17 Sep 2026 15:59:19 -0400
In-Reply-To: <20260817-nouveau-fixes-v1-1-f518d0c735f3@outlook.com>
References: <20260817-nouveau-fixes-v1-0-f518d0c735f3@outlook.com>
	 <20260817-nouveau-fixes-v1-1-f518d0c735f3@outlook.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PWX-hiQELxHIg1hMcl2ljNKwxt9Z3gS315dhUgdpqxY_1789675162
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: OUBWEIPKUURBGW7K4VMMSN3PSAHB7CYP
X-Message-ID-Hash: OUBWEIPKUURBGW7K4VMMSN3PSAHB7CYP
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/OUBWEIPKUURBGW7K4VMMSN3PSAHB7CYP/>
Archived-At: 
 <https://lore.freedesktop.org/495954974fdaf275d65ea8ae1b76f8e496c09b79.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Mon, 2026-08-17 at 14:50 +0800, Junrui Luo via B4 Relay wrote:
> From: Junrui Luo <moonafterrain@outlook.com>
>=20
> Commit c32287471077 ("gpu/drm/nouveau: enable THP support for GPU
> memory
> migration") grew the device-private region that
> nouveau_dmem_chunk_alloc() registers from DMEM_CHUNK_SIZE to
> DMEM_CHUNK_SIZE * NR_CHUNKS, but left the VRAM buffer object backing
> that
> region at DMEM_CHUNK_SIZE.
>=20
> nouveau_dmem_page_addr() returns chunk->bo->offset plus the page's
> offset
> within the registered region, so every page past the first chunk
> resolves
> to VRAM outside the buffer object.
>=20
> Size the buffer object to the region it backs.
>=20
> Fixes: c32287471077 ("gpu/drm/nouveau: enable THP support for GPU
> memory migration")
> Reported-by: Yuhao Jiang <danisjiang@gmail.com>
> Assisted-by: Claude:claude-opus-5
> Cc: stable@vger.kernel.org
> Signed-off-by: Junrui Luo <moonafterrain@outlook.com>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_dmem.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index 9442ec6e1f6c..356ff8f3c1b8 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -325,8 +325,8 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm,
> struct page **ppage,
> =C2=A0=09chunk->pagemap.ops =3D &nouveau_dmem_pagemap_ops;
> =C2=A0=09chunk->pagemap.owner =3D drm->dev;
> =C2=A0
> -=09ret =3D nouveau_bo_new_pin(&drm->client,
> NOUVEAU_GEM_DOMAIN_VRAM, DMEM_CHUNK_SIZE,
> -=09=09=09=09 &chunk->bo);
> +=09ret =3D nouveau_bo_new_pin(&drm->client,
> NOUVEAU_GEM_DOMAIN_VRAM,
> +=09=09=09=09 DMEM_CHUNK_SIZE * NR_CHUNKS,
> &chunk->bo);
> =C2=A0=09if (ret)
> =C2=A0=09=09goto out_release;
> =C2=A0

