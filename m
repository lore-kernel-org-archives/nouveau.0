Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDC2CA9EBE
	for <nouveau@archiver.kernel.org>; Fri,  9 Oct 2026 21:25:04 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 508411122BC;
	Fri,  9 Oct 2026 21:25:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="h5ZQBgp9";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8949F48A05;
	Fri,  9 Oct 2026 21:06:34 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1791579994;
 b=rD+KhHnYtSpVlC67OpoxsClb31AVxSBXCI/RBwQV/yROqZuZpObhcVqyndwFfy/oMLaqp
 M+clJyJi1qo54FAzM6D+Qjhudx/C9tiMpewXwia9/ucQaM8kKZeI1zFw9VinO6oQ7x9Tmbb
 9LMDjBR6ewqafcSG6YGw5CmhTnG65oVGxm/p3ycl/fLoIwQLTdDi1cBCoJB++DUEGo6j1DT
 y8t3+8mH7/UdFqFnF0RHG4w0jm8L/WdOiBwPX1uVkEWNKjMpi7uKKQs7TrbuQKCzhz3p6aQ
 cBNFov8PLgJ1w+Wg3VWA57ZvhOUn+TsD383OfUf4perfh7FTger9GYQgxykg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1791579994; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=dl+DXyQwo+U7WhmX8/zjimRnBT3mFrwSzm2SztqXAbU=;
 b=0EC4bvsfh97eOq1ipXM5kgZvdDEvi4qXtyX6egX5tHYhu7+AWhndaYaGML4cVW68Vl1a5
 YgdFNNK8xKfE//3ZHx6oB+3QLgtfVF5xmMP9xSMyoTlAA9l8P57P1HqDQrlxUIZPwZqAjkY
 /U/5w656mrJwMuo234DHkkDqZ22wTrzrFVeoIsfB8LC2wPtdrp+sY0hn+Vpw0xabmRsMV4R
 MGUsJ0Yv7zPYNYjmkrH+ouDqHvUhBuUJxq2BzU8fAASWaJLfK2yjXTR166by/OH2XeIvsDu
 mVLeR/GsnR5KTR9YZCb3GY/Jub9yakBR5HmPYV5IurEiW0+iCQ/kHIH09zEw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 7465C489E7
	for <nouveau@lists.freedesktop.org>; Fri,  9 Oct 2026 21:06:32 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D3F2910EB0D
	for <nouveau@lists.freedesktop.org>; Fri,  9 Oct 2026 21:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791581097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dl+DXyQwo+U7WhmX8/zjimRnBT3mFrwSzm2SztqXAbU=;
	b=h5ZQBgp90qGiOQYpkv5fbM02tFuJaiVf3X9bsMM9f07+saMwSNUdM9CYAxYiBsObGSkPcq
	ZKCoZPVe8RJBP9am7pqjaEgc8f3LV7sfOxaCFvwd1aMS1G1i8hBHPbCm/BXVF1hk3TObzk
	ylTmUOWZVKtRS0GT8WTYzOqpk4/sfXE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-321-HYqV6R9ANracCpR_ArkNaw-1; Fri, 9 Oct 2026 21:24:50 +0000
X-MC-Unique: HYqV6R9ANracCpR_ArkNaw-1
X-Mimecast-MFC-AGG-ID: HYqV6R9ANracCpR_ArkNaw_1791581090
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-535252004e9so3210941cf.1
        for <nouveau@lists.freedesktop.org>;
 Fri, 09 Oct 2026 14:24:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791581090; x=1792185890;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z1Eu7EYQ+rpvHDotJhitil0lY6JFZjt2dgRaITNxGdo=;
        b=N9MWCSOuPdL5Gwne7FtzcnQ8lbjKJJm0bVX348fgD7AnHKNeVMoX/KOwD2hfY/NtCU
         9dF0CMaEtjjMbbFaeWUl3uYmCpXqPhuhjOg5X7NijdTQCA2KrkS5AY+pUK2ukxAt8cBP
         A18CaeA1pVSdb7WdCZiiVhO15hIIFchLKrDAcIv8ja+Ja56rdjpaaTScA2ysIljOSzXa
         5BnWN1+xxdD71PSL4g2IlKInkzFiR+vumdGwxzUGqwdJodtjKPHlJDEVaKJTjK3bLs/O
         2Hk/QDaGS1Kyw45MKDQ2ry6BvxJV192xMN1zUsu+5YisN6eu5zW03c7Rd8At+2kb0Z5V
         AaAA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwAxb9/u1JzYL0R9SkJbhZOi1HJ7l7QX10lPML1zNdJlXaHUS0ylFwugwD81qmHGk4uldtup5DC@lists.freedesktop.org
X-Gm-Message-State: AFq9FYLNIchZw+ge1Vgcyy4iLjIVbPB5ONscnL0+2i10gN4zinv2908O
	W+h1DRxlslJ5Wq+hWTQwjzbLupzlUsnKiw/1HCZP511UrqeGF1bD0B567hVjH6d4WrOkIQRqTNQ
	WJwaLNIXXxr+Q5iZ23ijcvEHxulTwLc77EekfNsvVbQCv6OZ529UNPC7FJHYiSuwXy3Q=
X-Gm-Gg: AYBFou1IvqCpVy7rIxIMaoBqcwzTufThGgqNv3zS+qJYkWPfThDzZJGgqjncaTlbBLr
	4YwazhTrrcKHgwIfOx4stY9ko7oBDcRzDTd0VSzODtNvwQpNgqYmwvqimiUkDjlTvTjaJpfBWUf
	0LTf389D7Lk/qFrOW9qiUBgenozSuM3HlZExZkvOqRqEpXvX2YJ/UW/14VUV14Q8Nhwue7xSlwC
	g1uasvX6aVhYPKozvoWO3xHtoZJQLguMeIyrgwjZADstCNYZg4OUB/Q7GyKqn1W8duVrOZRhiW0
	9p4eAf7jS59UL6m5VorzWJeTVZkQQJMNSoNrElefHTMmhI9vcd+YbjBY012I4cGmYgkzB/c=
X-Received: by 2002:a05:622b:97:20b0:535:a5f8:a5c9 with SMTP id
 d75a77b69052e-535a5f8b5bemr28651021cf.73.1791581089906;
        Fri, 09 Oct 2026 14:24:49 -0700 (PDT)
X-Received: by 2002:a05:622b:97:20b0:535:a5f8:a5c9 with SMTP id
 d75a77b69052e-535a5f8b5bemr28650791cf.73.1791581089326;
        Fri, 09 Oct 2026 14:24:49 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5359b7324c9sm27569011cf.12.2026.10.09.14.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 14:24:48 -0700 (PDT)
Message-ID: <7b1398c5deadc0225332b6259a278d4436973d8f.camel@redhat.com>
Subject: Re: [PATCH v2 1/3] nouveau: Fix NULL pointer dereferences in
 GETPARAM ioctl
From: lyude@redhat.com
To: jim.cromie@gmail.com, Danilo Krummrich <dakr@kernel.org>, Maarten
 Lankhorst	 <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Dave Airlie	
 <airlied@redhat.com>
Date: Fri, 09 Oct 2026 17:24:47 -0400
In-Reply-To: <20261009-my-fixups-v2-1-839e2bbe514d@gmail.com>
References: <20261009-my-fixups-v2-0-839e2bbe514d@gmail.com>
	 <20261009-my-fixups-v2-1-839e2bbe514d@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: M3sBOUcvxZQxqVzkfGw1S75ntiOp7bH6HpX7QbVKRPA_1791581090
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: VXYJOJUKGWCEW7P4RWPMLKSFDOYP3KK7
X-Message-ID-Hash: VXYJOJUKGWCEW7P4RWPMLKSFDOYP3KK7
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Daniel Campos Ramos <Capitain_Jack@yahoo.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VXYJOJUKGWCEW7P4RWPMLKSFDOYP3KK7/>
Archived-At: 
 <https://lore.freedesktop.org/7b1398c5deadc0225332b6259a278d4436973d8f.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, 2026-10-09 at 11:44 -0600, Jim Cromie via B4 Relay wrote:
> From: Jim Cromie <jim.cromie@gmail.com>
>=20
> When hardware or firmware initialization fails, the graphics engine
> (gr) or device functions may remain NULL. Attempting to access these
> during the GETPARAM ioctl (e.g., NOUVEAU_GETPARAM_GRAPH_UNITS)
> results
> in a kernel NULL pointer dereference, causing a crash when userspace
> (GNOME/Mesa) attempts to probe the device.
>=20
> Add safety checks for 'gr', 'gr->func', and 'nvkm_device->func' in
> the
> ioctl handler. Return -ENODEV to signal the missing hardware state to
> userspace, and use NV_ERROR_ONCE to provide diagnostic proof in the
> kernel log without risking a console flood.
>=20
> NOTE:
>=20
> I encountered these crashes while booting unrelated code (in
> dynamic-debug) on real HW.=C2=A0 There was also some fwupd updates around
> this time, so it could all be transient/unreproducible.=C2=A0 But it did
> happen, and could happen again in unforseen circumstances.
>=20
> @Capitain_Jack tested the error path in v1 by deleting the FW

I can just fix this up before pushing but JFYI - if you put comments
below the --- that's down below, they will show up in the email but not
the commit message.

Either way -

Reviewed-by: Lyude Paul <lyude@redhat.com>

>=20
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> Tested-by: Daniel Campos Ramos <Capitain_Jack@yahoo.com>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_abi16.c | 22 ++++++++++++++++++++--
> =C2=A01 file changed, 20 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> index 4542d5f4ded8..3f130cd4fbcd 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> @@ -306,6 +306,11 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
> =C2=A0=09=09getparam->value =3D 1;
> =C2=A0=09=09break;
> =C2=A0=09case NOUVEAU_GETPARAM_GRAPH_UNITS:
> +=09=09if (!gr || !gr->func) {
> +=09=09=09NV_ERROR_ONCE(drm, "GETPARAM_GRAPH_UNITS: no
> gr engine or func\n");
> +=09=09=09return -ENODEV;
> +=09=09}
> +
> =C2=A0=09=09getparam->value =3D nvkm_gr_units(gr);
> =C2=A0=09=09break;
> =C2=A0=09case NOUVEAU_GETPARAM_EXEC_PUSH_MAX: {
> @@ -315,10 +320,23 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
> =C2=A0=09=09break;
> =C2=A0=09}
> =C2=A0=09case NOUVEAU_GETPARAM_VRAM_BAR_SIZE:
> -=09=09getparam->value =3D nvkm_device->func-
> >resource_size(nvkm_device, NVKM_BAR1_FB);
> +=09=09if (!nvkm_device || !nvkm_device->func ||
> !nvkm_device->func->resource_size) {
> +=09=09=09NV_ERROR_ONCE(drm, "GETPARAM_VRAM_BAR_SIZE:
> no device func\n");
> +=09=09=09return -ENODEV;
> +=09=09}
> +
> +=09=09getparam->value =3D
> +=09=09=09nvkm_device->func-
> >resource_size(nvkm_device, NVKM_BAR1_FB);
> =C2=A0=09=09break;
> =C2=A0=09case NOUVEAU_GETPARAM_VRAM_USED: {
> -=09=09struct ttm_resource_manager *vram_mgr =3D
> ttm_manager_type(&drm->ttm.bdev, TTM_PL_VRAM);
> +=09=09struct ttm_resource_manager *vram_mgr =3D
> +=09=09=09ttm_manager_type(&drm->ttm.bdev,
> TTM_PL_VRAM);
> +
> +=09=09if (!vram_mgr) {
> +=09=09=09NV_ERROR_ONCE(drm, "GETPARAM_VRAM_USED: no
> vram mgr\n");
> +=09=09=09return -ENODEV;
> +=09=09}
> +
> =C2=A0=09=09getparam->value =3D
> (u64)ttm_resource_manager_usage(vram_mgr);
> =C2=A0=09=09break;
> =C2=A0=09}

