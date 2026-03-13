Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C94107BCE2
	for <nouveau@archiver.kernel.org>; Fri, 13 Mar 2026 20:46:31 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A4DF610E47D;
	Fri, 13 Mar 2026 20:46:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ab9S3arQ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D3BC7450EB;
	Fri, 13 Mar 2026 20:35:50 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773434150;
 b=yN1n1VmMwuDt8LHxwVBhmCHjZYHSabm1fe1G4MkeVhqc9cujapv4O1ma1RSZCvBF0GV9C
 UGaiAUVodqrBI0g4AJNI70r2z9+yPOHZV10syITADorhScL41aeyqdkbkBYgUBI+CYp344P
 YSN8+gY9XxQx7+BRKsVNkZf/BjGLVtuA89ZIJodfWdFn6TpZ0py/PRc9hkTxIIKeTNO18yf
 jPETo9MJLibL6hYXfQRLUoXRRkAKGWBP15wWpGrnVUDemWQaXJBLL49OZhZqRgj6f4uLAWN
 GN4+XH7ucgcYdzbNee16Y/5MCEuTHXJIg/kREBNQ5l3Roa5MjP2mhTI4y8EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773434150; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=fl4H23Ge0Zsyj8n566Pf+v0tahs4AEuuruZIdW3bY9s=;
 b=HnrlDGHG49UvtFXi/GGI44nKcJ6YfGVMgxYJ+9NgvUqz0iUWywPu1aDT748ko5xWdOpXQ
 DK9RH7ZcX6k/+/u0IwBAn4lk6Lswm4c5u+HhjKn6B5CQSLOmaaQdEq9ln9oo73pMOeJm4VE
 YbFQMDQe4BL2Zm+l6pbKhuUaKgAgjPjkNcPOSUpEggGogK0oyhj57RRmquGsgvH7TDNs2vx
 YuX9gKivMkdJOru9IRY0oi06xjJZ6Jh8x8V4bXgbXiVSPASOjsD7V1VjXFgMnL+kxnoX5Wo
 +5NaxDeXg1uTGLPN1nRGWWr1EiN6DCh+pO8fDZVybTovEU7+iC76ZReHgQfg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C890F433F4
	for <nouveau@lists.freedesktop.org>; Fri, 13 Mar 2026 06:22:07 +0000 (UTC)
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com
 [74.125.82.45])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2131610E0B7
	for <nouveau@lists.freedesktop.org>; Fri, 13 Mar 2026 06:32:47 +0000 (UTC)
Received: by mail-dl1-f45.google.com with SMTP id
 a92af1059eb24-124a7216c9cso44158c88.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 12 Mar 2026 23:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773383566; x=1773988366;
 darn=lists.freedesktop.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fl4H23Ge0Zsyj8n566Pf+v0tahs4AEuuruZIdW3bY9s=;
        b=ab9S3arQFgx/5gHxJ15EuVNTbg4eHHkZ/TeB3xLxAtqc+obx+eoHqAy6qoNiaUsip6
         17nzeXEwPqpnW7mW5XXTXdeTNGmmT48iNDMQdVOaZ/rFIlT8ztex3zRiwczhpd//WHCu
         YLO+usaVAPA19DwdWCeCYn85wnMramr5TRi2bvh0LebnBR5RZ94WFz4iW5FOdRTz60Ei
         3a31Zyt70lN/uNFPoDVOWnF8ExWCUntw21ZbpLDFCXVtllr/NWEtAIFktbCmmQoYNq6k
         bZ6UNgVt85ZfEI/k5LSChQ3WmB0tAFFovtGcbTYCXGo84iFlfLlGH9IfztE1L9HnjDrQ
         hi7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773383566; x=1773988366;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fl4H23Ge0Zsyj8n566Pf+v0tahs4AEuuruZIdW3bY9s=;
        b=Emh8ELjDACQbbHELXhEbtopIfgI+/ElXEmUrsSx/Tpp4+SBWpdQBjKGg0l8xu6PYmx
         Co00GfMGGOscidMzseWQLA/M+gxn1JE0bHqI/OnoO7nCeXnRVHODLyzcIllLHuquc6KR
         X+IjGqLks5o0BDtLon7iT6B2ese7+ApU/yjiaVKMf32O/Tdu6MtMoxVOOTBvSbQosUIo
         r9H/9f4th/CrPP70VWbijap6lL1BB3aoWXfEn6hUvXDTddQMpTeYMWvYmjvKCZJIqHLP
         07ZRTVGcsr88t4KqP1rK4FPQyEo477ElUQkZF90EHKIaRirDJB6jcXZ0xEaViuKuXHJR
         hy5A==
X-Gm-Message-State: AOJu0YypxizmbYXABeV/jv3KBqHZyMluw7c+dHHNS9HCiLRKwddZMykt
	hHE9Fc4VjSNkqSxUvWbwWRhdJqBDbRZhuHgLXrD7b1JYATS2eYErwIIrqZBs4Q==
X-Gm-Gg: ATEYQzyUA/f6TDSBGE6izl83unk7FtylGLbG1fNOyaWwqIyNtOjarp23R6vl95zkT1M
	LJHgmDPkiaPPWahBuCNIGS+aOR3kJsIxBtc52IQY0ZPOCNK3a4lvUrP704OJrLnh85cmbt0kERX
	WEWYOQ6psQtJbD/cgyce7cyNgCSCWBxvcjTV9EDw7yggdOLW6xp9CTIgHhBuacg3oEE6D4R6mPT
	qtXAolG03paDbrvWJh7q1BNbrT0lzhWont+OJ9fxgOtRy87sQ/OzwSKbepkyXo3K4oo/SCZPz6P
	agaq/ApREDisyL0ZAu6OuHQYFngJ5l8/7s5KOW/s2Bu1xCTxiD9Y8nr112eD8zUh+n2bt+VRvWr
	CZFflta5SIDhLAAGkO7FBE5S6I/5vZ6NT/NxRH+O4WtWf51RgqWFEJU371zEiuoTroRtxDY/1gF
	R62oVev65Jph3/CMIGd2TU
X-Received: by 2002:a05:7022:f8c:b0:128:d81e:adb7 with SMTP id
 a92af1059eb24-128f3c6740emr553076c88.0.1773383565553;
        Thu, 12 Mar 2026 23:32:45 -0700 (PDT)
Received: from hobbes ([2600:70ff:f864:0:caf6:9140:4157:1e66])
        by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-128f62b2100sm1049160c88.8.2026.03.12.23.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 23:32:44 -0700 (PDT)
Date: Thu, 12 Mar 2026 20:32:40 -1000
From: Joey Pabalinas <joeypabalinas@gmail.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH] drm/nouveau: fix misleading indentation
Message-ID: 
 <6c1d96782664e4f491f23e8c73545fe4d8b9533a.1773383224.git.joeypabalinas@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="k7ogklrer7rk7odl"
Content-Disposition: inline
X-MailFrom: joeypabalinas@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: SZPTAQF35ZZERAQB55KPRGZNTANHG5EP
X-Message-ID-Hash: SZPTAQF35ZZERAQB55KPRGZNTANHG5EP
X-Mailman-Approved-At: Fri, 13 Mar 2026 20:35:49 +0000
CC: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Joey Pabalinas <joeypabalinas@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/SZPTAQF35ZZERAQB55KPRGZNTANHG5EP/>
Archived-At: 
 <https://lore.freedesktop.org/6c1d96782664e4f491f23e8c73545fe4d8b9533a.1773383224.git.joeypabalinas@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>


--k7ogklrer7rk7odl
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH] drm/nouveau: fix misleading indentation
MIME-Version: 1.0

Fix misleading indentation in if/else statements.

Signed-off-by: Joey Pabalinas <joeypabalinas@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_abi16.c | 49 ++++++++++++-------------
 1 file changed, 24 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouv=
eau/nouveau_abi16.c
index f9201f2e73a339a10b..3da75aa136d04faf3b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -425,14 +425,14 @@ nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
=20
 	if (device->info.family >=3D NV_DEVICE_INFO_V0_TESLA)
 		init->pushbuf_domains =3D NOUVEAU_GEM_DOMAIN_VRAM |
 					NOUVEAU_GEM_DOMAIN_GART;
 	else
-	if (chan->chan->push.buffer->bo.resource->mem_type =3D=3D TTM_PL_VRAM)
-		init->pushbuf_domains =3D NOUVEAU_GEM_DOMAIN_VRAM;
-	else
-		init->pushbuf_domains =3D NOUVEAU_GEM_DOMAIN_GART;
+		if (chan->chan->push.buffer->bo.resource->mem_type =3D=3D TTM_PL_VRAM)
+			init->pushbuf_domains =3D NOUVEAU_GEM_DOMAIN_VRAM;
+		else
+			init->pushbuf_domains =3D NOUVEAU_GEM_DOMAIN_GART;
=20
 	if (device->info.family < NV_DEVICE_INFO_V0_CELSIUS) {
 		init->subchan[0].handle =3D 0x00000000;
 		init->subchan[0].grclass =3D 0x0000;
 		init->subchan[1].handle =3D chan->chan->nvsw.handle;
@@ -579,21 +579,20 @@ nouveau_abi16_ioctl_grobj_alloc(ABI16_IOCTL_ARGS)
 				oclass =3D sclass[i].oclass;
 				break;
 			}
 		}
 	} else
-	if ((init->class & 0x00ff) =3D=3D 0x00b3) { /* msppp */
-		/* msppp: compatibility with incorrect version exposure */
-		for (i =3D 0; i < ret; i++) {
-			if ((sclass[i].oclass & 0x00ff) =3D=3D 0x00b3) {
-				oclass =3D sclass[i].oclass;
-				break;
+		if ((init->class & 0x00ff) =3D=3D 0x00b3) { /* msppp */
+			/* msppp: compatibility with incorrect version exposure */
+			for (i =3D 0; i < ret; i++) {
+				if ((sclass[i].oclass & 0x00ff) =3D=3D 0x00b3) {
+					oclass =3D sclass[i].oclass;
+					break;
+				}
 			}
-		}
-	} else {
-		oclass =3D init->class;
-	}
+		} else
+			oclass =3D init->class;
=20
 	nvif_object_sclass_put(&sclass);
 	if (!oclass)
 		return nouveau_abi16_put(abi16, -EINVAL);
=20
@@ -652,21 +651,21 @@ nouveau_abi16_ioctl_notifierobj_alloc(ABI16_IOCTL_ARG=
S)
 		args.target =3D NV_DMA_V0_TARGET_VM;
 		args.access =3D NV_DMA_V0_ACCESS_VM;
 		args.start +=3D chan->ntfy_vma->addr;
 		args.limit +=3D chan->ntfy_vma->addr;
 	} else
-	if (drm->agp.bridge) {
-		args.target =3D NV_DMA_V0_TARGET_AGP;
-		args.access =3D NV_DMA_V0_ACCESS_RDWR;
-		args.start +=3D drm->agp.base + chan->ntfy->offset;
-		args.limit +=3D drm->agp.base + chan->ntfy->offset;
-	} else {
-		args.target =3D NV_DMA_V0_TARGET_VM;
-		args.access =3D NV_DMA_V0_ACCESS_RDWR;
-		args.start +=3D chan->ntfy->offset;
-		args.limit +=3D chan->ntfy->offset;
-	}
+		if (drm->agp.bridge) {
+			args.target =3D NV_DMA_V0_TARGET_AGP;
+			args.access =3D NV_DMA_V0_ACCESS_RDWR;
+			args.start +=3D drm->agp.base + chan->ntfy->offset;
+			args.limit +=3D drm->agp.base + chan->ntfy->offset;
+		} else {
+			args.target =3D NV_DMA_V0_TARGET_VM;
+			args.access =3D NV_DMA_V0_ACCESS_RDWR;
+			args.start +=3D chan->ntfy->offset;
+			args.limit +=3D chan->ntfy->offset;
+		}
=20
 	ret =3D nvif_object_ctor(&chan->chan->user, "abi16Ntfy", info->handle,
 			       NV_DMA_IN_MEMORY, &args, sizeof(args),
 			       &ntfy->object);
 	if (ret)
--=20
Cheers,
Joey Pabalinas


--k7ogklrer7rk7odl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEx6b1SGGPTKxTmPDYqoHu9CTxowIFAmmzr4gbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJEKqB7vQk8aMCkVAQAJ148g2qWIqsAEqEqSkt
vAyVkxh4eqEF7hSJoRAD8zp1a3mMxjmZYwDzC3fvlEeyrTjcKSGU4ec28O+Ruu0L
sHng+ludg4a426Ofe4hLSeRC9HTQKpEvtC0+y3C8JIOdXfInRTZrccGU8/goyY9z
zVaVBBdLnpIXNc+2FxMdj9nrujZCd1uTGL+XOL1pxC6rjVgT5W5x/MKEGaLiK98X
m1CSsIH7I+g71nt/3XvFVkPwawHtlj6QFEJwSEOjTRcS1vpZcGr+nUiM1XXi0CKY
oJtmeOsYX7sTgOhKDml9LHxgeRu+J8iGcHOA6poke00bSB1pdvXYzOc3x/2lLZbW
tRk139aRXeNUUZznN+tCtyOScZQXPUJpis0b+0izliM5GtAPJIugnd/wjpKRg86z
EYIiPfY6AoDeQKCCvuTmoZqRIGm1naT4uUEkFAZc54GOFA4utFR7WXxGZ2T0RrZq
7Z1ntYwW8VCEKmVJxmYcXz/hUiDKe4ZRBPcwUagDW3WE4zmHXaFUOf6Fv8azgyCZ
INtvtUqn6N2WEc+IleKK1IzyqJjyq+OyZzSqyCofbq+WycCyLeSBaO4xWr/Fd5qu
S2KZf9GaCgUTlk9QD2qamVwANkRdkxZRUnH/UKyOKNdOciPIm/BGjhVEsPtXtiU9
BbCHq7coMN8hinzZLCdoi1it
=7+J+
-----END PGP SIGNATURE-----

--k7ogklrer7rk7odl--
