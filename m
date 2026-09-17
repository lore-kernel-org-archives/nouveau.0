Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DA8C982D0
	for <nouveau@archiver.kernel.org>; Thu, 17 Sep 2026 18:19:40 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5311110F049;
	Thu, 17 Sep 2026 18:19:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IvT+JaMK";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6A722481E1;
	Thu, 17 Sep 2026 18:02:00 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789668120;
 b=tUW1TAGCNDbeUL/omxNZ8aKHjzcS9oj1nxiQuaSavqL5dd0u2D4M2Gwd3vIQlxY0kGdyq
 Dh+sCrVvyDshsZfDEfiw5msOhc882y32JezPvtJRn4UnUbRUuiixsmAVcx4cd5S72X3eyaK
 dWB2j1//lQ2wOqsNwVNAVZiXB9yI10hgQkf1lk0WxF+gtVMEtlz3GgXMvJJYP++eDJXec33
 uAmpOXhynNMbihGC6X+4PEos6IZ1Wf2OkDM8tPs/3JejDO7adjNzEHBVuNfe9b8zfMEfiLh
 RUyRriyo4z2wSl82V4wH0uInk1J3ovJn1L1rzUBlPY6L4sLSJ/8VFwkO88/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789668120; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=zghduFgZwDIIypwl6PQd6HNgjS/ywXtiQKQuJdsOiRw=;
 b=CK5SHJMIUZLlz/AL/DY5YEevQ1CPYE5KhcLcnryr6l38A5dSWYEXu289abMgKzYjfjlNX
 35xE5dwA6QI8kAHjzz1GRwY/3qny3ZuJoggUc9hrE+w+iQCjV8NV/RN6si1jgmgYOkhvEtB
 WHNIH1qsDRWhEKh7cctKTQ8MYJkrPpmB+naA0Ku4itIRV7DMwdjJ12heEEjAViLcEmRJIJN
 NARegp5uBHH8s5Qnw7KAEr0C/jBLaSf685UoiT5zpr56eesQPy1dwyHD2C/SI4eb1Q2yNoj
 HWQc8IIGTyI6Lw0i97bPUPx4y/UR/SMgPTMnUFl2+BFhp0Gx4AYhy7ATXLRg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id CFEC5481A1
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 18:01:56 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 35B7510EC68
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 18:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789669173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zghduFgZwDIIypwl6PQd6HNgjS/ywXtiQKQuJdsOiRw=;
	b=IvT+JaMKvsid338KVVEvqILbb4SDms+ljAVclaTtkJKpF23PwDWQtt46/ed/+/QViosdrW
	q/4tgtshT7UqiznI+8aJHom175MTNChaayBvbTLKEzTMdADwKZLGTCfc2EoP+HQhlEcxxC
	qTPjDbRBcleQ5SoXYnlbcKFYLrNNrTU=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-189-TPEv-g4YP9ik5wrYULNUKg-1; Thu, 17 Sep 2026 14:19:32 -0400
X-MC-Unique: TPEv-g4YP9ik5wrYULNUKg-1
X-Mimecast-MFC-AGG-ID: TPEv-g4YP9ik5wrYULNUKg_1789669171
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-79630cb8723so340572137.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 17 Sep 2026 11:19:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789669171; x=1790273971;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6EVrUJFQJF3dnaOQZb2Gx1UGobWA2s6Fo3aIIPVgJwM=;
        b=d/Q9AKsGTx1sVwf/bjUpHlncItna+i+iFbId5jeTowuNFbQHRhQhfv+Qz/TScHPSik
         NVDdKoTRPKyH4AqmStD3guzxdQVQFw3BlvlasmDNqfDV1+qCdcuV1pxSHxlq87p+Et1X
         cOYc6li3F2v8qwGHObg/a6b5Vufh8OjsXk8MwDeLiXRPIDdMIg1p1NzlzIAplT0BMy8S
         ckESYNY9Qzm6pdsN7aKIh+SMEMw/bghJib4wnY1s62SY7lDCLskIhrVftXv3Hxu4hcz9
         RakPQ5CGqD4EaBbXbJfTEtH3NYPzFA4l3wYcw4tSOvzTRrhPsFN2NzslsbODe+DrbQbG
         UTvg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxuvJPKDNzAz1L8AKGGl5Uwx72vLbRNTVLbPXkgZL36RsIVOYevXnxlGmb7QRSqbeJ8koTO1IBK@lists.freedesktop.org
X-Gm-Message-State: AFuF++k5wG2vXSfNUUainZsNimPZ1umlei8UbzH8E7P+4eUPPl5/6sra
	0aa08Wqd0ZlcfRr4vUdo6ePG7lP/sCrHFmfDON1eXXlNHn5bie1ccWfse2SV4Rg7RD6v6/JgqVB
	FLgdU8ywsEUZ0dAxSj1S0EiiumX49q2/dkzvYZjEAqfeRWChXOmfrjHN+/qa2Tbgqzhg=
X-Gm-Gg: AYBFou1QxR+t9kvqGjCmWjapqzlghvFx40kWaFeE7njvFoXoqYUR5eBD5ygEtkCUcPP
	3jmpmw455EmWfDUVtJ85hBa49Mk29MjcgjeM249JkclVa95e+Lsr2iojbMeIaYBsDQYeaW4+U4Y
	0c01IHFv/LuxVb4MBRyF5nc03RM+dpVWQTOu1mXQfVDWZmaJ4FMkXGabdBGjiKRVW1isvIuk1/6
	/E1cluqpp+0Xs5yKfFCSs3RAYZJowUKbLYil5yzT7LVx2NHt3EcUaNpDpFOmP/anENRJdFHyh0U
	KT0bKf2cgfBDCIpalJhDqbhFayq5xJna4nVyR/aG6mLLNmHZnS8TQahy5euDHRj2kPbb22vN
X-Received: by 2002:a67:e708:0:b0:797:e5aa:61c2 with SMTP id
 ada2fe7eead31-7a024dcd2e6mr7627695137.3.1789669171526;
        Thu, 17 Sep 2026 11:19:31 -0700 (PDT)
X-Received: by 2002:a67:e708:0:b0:797:e5aa:61c2 with SMTP id
 ada2fe7eead31-7a024dcd2e6mr7627685137.3.1789669170960;
        Thu, 17 Sep 2026 11:19:30 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-7a1e292ee59sm4120534137.6.2026.09.17.11.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 11:19:30 -0700 (PDT)
Message-ID: <d43ff56c010c83fc4cbef634e7a632940f5d20f7.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau: Fix gem reference leak in validate_init()
From: lyude@redhat.com
To: Wentao Liang <vulab@iscas.ac.cn>, airlied@gmail.com
Date: Thu, 17 Sep 2026 14:19:29 -0400
In-Reply-To: <20260916180202.2090231-1-vulab@iscas.ac.cn>
References: <20260916180202.2090231-1-vulab@iscas.ac.cn>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Xyx-Y6r-6YwIzzJp00L4Bfi7QT4NkX3-kdGE2k6H8pI_1789669171
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: TNLMTHX224QYMKYU2I5U7NARHAMAD47I
X-Message-ID-Hash: TNLMTHX224QYMKYU2I5U7NARHAMAD47I
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: bskeggs@redhat.com, dakr@kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, nouveau@lists.freedesktop.org, simona@ffwll.ch,
 stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/TNLMTHX224QYMKYU2I5U7NARHAMAD47I/>
Archived-At: 
 <https://lore.freedesktop.org/d43ff56c010c83fc4cbef634e7a632940f5d20f7.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to drm-misc-fixes in a bit

On Wed, 2026-09-16 at 18:02 +0000, Wentao Liang wrote:
> On the ttm_bo_reserve() failure and "vma not found" error paths, the
> loop breaks without adding the looked-up object to any validate list,
> so the reference taken by drm_gem_object_lookup() is never released;
> validate_fini() only walks the spliced lists.=C2=A0 Drop the reference
> before breaking out on both paths.
>=20
> Fixes: 19ca10d82e33bcfe ("drm/nouveau/gem: lookup VMAs for buffers
> referenced by pushbuf ioctl")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_gem.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c
> b/drivers/gpu/drm/nouveau/nouveau_gem.c
> index 20dba02d6175..c2601b559947 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -513,6 +513,7 @@ validate_init(struct nouveau_channel *chan,
> struct drm_file *file_priv,
> =C2=A0=09=09=09if (unlikely(ret)) {
> =C2=A0=09=09=09=09if (ret !=3D -ERESTARTSYS)
> =C2=A0=09=09=09=09=09NV_PRINTK(err, cli, "fail
> reserve\n");
> +=09=09=09=09drm_gem_object_put(gem);
> =C2=A0=09=09=09=09break;
> =C2=A0=09=09=09}
> =C2=A0=09=09}
> @@ -522,6 +523,7 @@ validate_init(struct nouveau_channel *chan,
> struct drm_file *file_priv,
> =C2=A0=09=09=09struct nouveau_vma *vma =3D
> nouveau_vma_find(nvbo, vmm);
> =C2=A0=09=09=09if (!vma) {
> =C2=A0=09=09=09=09NV_PRINTK(err, cli, "vma not
> found!\n");
> +=09=09=09=09drm_gem_object_put(gem);
> =C2=A0=09=09=09=09ret =3D -EINVAL;
> =C2=A0=09=09=09=09break;
> =C2=A0=09=09=09}

