Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379E1C982D0
	for <nouveau@archiver.kernel.org>; Thu, 17 Sep 2026 20:00:08 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 05A4710F0F4;
	Thu, 17 Sep 2026 20:00:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VaEE3QFd";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0314948224;
	Thu, 17 Sep 2026 19:42:30 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789674149;
 b=LjGa7UKkjov7l8vjAyBB/tbPyBEhHWwvLkrqFTvqHyuKTJ1sE6WJLlIyjFD3an2VeYWz/
 M/wWaAY2j13n2aJBTC6bH29mKq0GH6kNhARovodvBG4ceehH+nVeGdt10Z6E0p3pNd17QQL
 6QcRNRRUEvdD5MWT+SnVTW8ZYP5wOx/9oGeEdwJDXR+qVDj3T9PIUh82POWS52ptykGOukC
 86tEYGwRQRVSRFZKFd8njcS08EVvfZQmSvLiQUWwrbrhCo1BkGoPSWyiZP2UOn2dhUo5HMD
 CxYgVXqyY6uoNe+2zAuBv+OoUB1075yOMJhTMdKlHDmiDgzss/0SJ3UdCMTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789674149; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=eTELubisesq0lEcB0pdFlOHAfxJaSpxoU32OmenWaKQ=;
 b=xzq1UmufIy1hz8dj9RybLTM/4ZNWQZJGzxH4tHauoV1M6pp3uu3fY61xyqRow2OuTNa6Z
 +3kRvCRt+XECSWaJtzXbdkqUWc3CDYcDKOGLaD+4Y5pNIPqFKFTzak5x/7DLHRC/i/sR0li
 rrqa3OrGvYMoU+QtdSlP7gwLXELPs0RKAyLKmtQibt1MPUh/stVH/AOP94nk2S06O85RSRk
 1fd8NWk3PotXyISEHwp7TYkSE52x0qN8rysJoJiRJm6r1iD0my7iCClQaT6QcxCf126/h99
 eEd4sq9aVOn01o++xynMdhYpocuNQJKBNImWsruRY3+41vUqP7vJh5eWGBhw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id EB6E4481EA
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 19:42:26 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE0210F0EA
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 20:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789675203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eTELubisesq0lEcB0pdFlOHAfxJaSpxoU32OmenWaKQ=;
	b=VaEE3QFddsRhW4eqc4YyD6e+4ClXuPNHJH1NdgVXEsAM+Vh1ivzQeokVV6wdCMNSTUGMLP
	yd9o0r+6MQPcDS3XmzqVASlahHCzBFQQ88K68kMmc/3lV2FFXqw0W43N2GOCRHA2nw9662
	2JRjQkfAsG8IHyDFG1qLrtc66GNox4g=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-152-7HzD9CY1OfK48a1xqS1MJw-1; Thu, 17 Sep 2026 16:00:02 -0400
X-MC-Unique: 7HzD9CY1OfK48a1xqS1MJw-1
X-Mimecast-MFC-AGG-ID: 7HzD9CY1OfK48a1xqS1MJw_1789675202
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-530d206e2b4so28591191cf.2
        for <nouveau@lists.freedesktop.org>;
 Thu, 17 Sep 2026 13:00:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789675202; x=1790280002;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QKJHwYoHwtxGXYRY1vkeptYjZQfzNjxi9ZIJDlWS3xE=;
        b=ZFE8UzcPlU7yZPc1/luo9oNk/H20TIM/GZa2FlvrFqOMrADGOlI8Q/oU7dauYe+2Ro
         Nkux9BLNDv0yYMjeQbURNi2x1Qottpxdm/r6PSozFbeK6CX+hFns7skXGpmzFaMzMEtQ
         cO9vhGT3kjmWdYcoimZAe0yG1okbkOOrNpYermgJO2tktxHA3iCGIZVL9ild4YOqfDpw
         6Zkk97KKIg/4vSJ/B7MwUt4qKf22s5YbLhoVEPjLRCR+TnLTFmM3Ae/Dkv4gNn3d1FTM
         LyAhyTWcUg58Yr+a/q/NF6RCJXeJt0l/7gxGOd8CWCACF1vhc32twq/W2foxLmvF+5iv
         ah8A==
X-Forwarded-Encrypted: i=1;
 AKwUvBzNeqQqlqhgn/36CU+tiMCdLKjwS5jGpkzL2zTyi7Tdu56qtupfMDnvug2xsf+6yQIGkAnAmKRN@lists.freedesktop.org
X-Gm-Message-State: AFuF++kkRphc912+bqBS7LnOE699li4wTs6mUOcbULdfs5PMJbSXXys2
	8WiPYS+lo5slKDBOKC9obTmR7wCmb69ucJP93OV32bmcS5Srj6lA9jXIFx90VJ/FMBqVLPg2meB
	sVMjmP80B0H7wpSIZTbjguchBdjwfmSDXmmYE7USuH9eD1sRQUfs68jOXJjKnodflSy4=
X-Gm-Gg: AYBFou1Dc9fMLXvI38/aEBTz+KuNez+ZK9zh0+pfIszu/GWIEUPYlc5Bw2FQ34cyjHh
	lbXU6OGViB92y2ObDKBsBmoi6Ho8ys9vmjrzZjmMxd+cnPEMSEjSz0OnNb6gRdFrlHcYcg3r0pO
	PrWLTEEHLby81wpuNlcz/Lz4FmerdUu4rlYk0PyQqltKAe3YWev+fZwHVtEQ3hD273pbIbtDEmT
	YtS1c3FoZwUf5iYJW1J4uGxq4DpY5zGmRV95bBw1oXEVUPpLTvXVOcKZxXIPHAqj3v7n3WtYmpM
	jB51vz/jBZFNgjYQMOBS60Ewg7ujrzAHK1ltLw2s5j/KhKhIKf8KnYuzZ+T6kH/+8fKmrupv
X-Received: by 2002:a05:622a:389:b0:530:dcc7:aede with SMTP id
 d75a77b69052e-5329e3d16c9mr5804021cf.30.1789675201610;
        Thu, 17 Sep 2026 13:00:01 -0700 (PDT)
X-Received: by 2002:a05:622a:389:b0:530:dcc7:aede with SMTP id
 d75a77b69052e-5329e3d16c9mr5803511cf.30.1789675200978;
        Thu, 17 Sep 2026 13:00:00 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-532620843dfsm59146421cf.22.2026.09.17.12.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 12:59:59 -0700 (PDT)
Message-ID: <41bd4250f6833a7aa8de54b84e182ce922281d24.camel@redhat.com>
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
Date: Thu, 17 Sep 2026 15:59:58 -0400
In-Reply-To: <20260817-nouveau-fixes-v1-1-f518d0c735f3@outlook.com>
References: <20260817-nouveau-fixes-v1-0-f518d0c735f3@outlook.com>
	 <20260817-nouveau-fixes-v1-1-f518d0c735f3@outlook.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EEJLUgxvaXaEycM5P4Zixbg0XfzznU4tYZjGCwPENdI_1789675202
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: VMOQPF7AOUQMIH3SB77ACNO5UIMF6MBL
X-Message-ID-Hash: VMOQPF7AOUQMIH3SB77ACNO5UIMF6MBL
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VMOQPF7AOUQMIH3SB77ACNO5UIMF6MBL/>
Archived-At: 
 <https://lore.freedesktop.org/41bd4250f6833a7aa8de54b84e182ce922281d24.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push patch 1 to drm-misc-fixes in just a moment

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

