Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44709C55ABA
	for <nouveau@archiver.kernel.org>; Wed,  5 Aug 2026 18:49:47 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6140710EF98;
	Wed,  5 Aug 2026 18:49:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DgMGd6oZ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id EE42D475FE;
	Wed,  5 Aug 2026 18:33:41 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785954821;
 b=hj9iUmrk2uo84wCd11VKsl6/a6CPksXTiEyxQtqXe+FqfSs7WZi5/p7j67ZMfQyAwCr4E
 ZYQZakQhGcgxQLLnJ7oUhMGUHwGE1Jt7XkAS6JZMl+BhGrMTvcR561F13CxgRV55npwDZmv
 pMGTSIE4LEQV6YRDkqOhTp0SkqoufwjRo+rOT6eqnuwhyAHM5l4yzuvGj8iHqKn2mHNPkYw
 LVXdMnuWkXi6inm86FoAUkUQFwqLWEw/6BaNptp9v3JET3NUPIBomKlnhK9EaTfpe59Pf39
 NeFMiWdIhI41rM1arEFtKUnVlBuVdA5FiLepa0en0opDbghs81jU6ZuTH9ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785954821; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=D/EU9EVSboKco9470bPT/jGMXPeGjUQzJn76uvcSda4=;
 b=rxUlwxEl4REJSwEzAMI9ExxDVF1McwRbuoCtEXukiocUB/1zqYY43CLkbQ8ll6L0z3lbz
 dOF56DCbKZ6gZCgUljkpbOEaIPb473FBTxV0FL32kZrB1nRqBAwyiFUv1Uk+eYj07leckHR
 DvfpIwKKppmpaRcg/GcdaHNGlpa6/G4X5plr6dlqgO8OJO7F/kAN1hmi0/KaPvjZZuGEzZY
 xGk/qRPvZRYwQkL5rz03Ge1AYBTAtAF8NZ1SVf22XFZJImraQRk2H95TkmHvnDG2QUaLRJs
 pSQVpiMRTzkuCOoRyDV1J8+wq9+UwXjuQureRUGxnsH4DijHpPSw3H3FgldA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B9D8F47580
	for <nouveau@lists.freedesktop.org>; Wed,  5 Aug 2026 18:33:39 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BCFD710E1C1
	for <nouveau@lists.freedesktop.org>; Wed,  5 Aug 2026 18:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785955780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D/EU9EVSboKco9470bPT/jGMXPeGjUQzJn76uvcSda4=;
	b=DgMGd6oZX+At9VfgYLcI5XlseJvU5vmWzmcX54YI1N+tMCBCUSpzLOx5xV4zsqbyT9Od/8
	4O4eWMeGcN7x2O5jgBr0/XfJcF+g4PvOdDjIWbQmxqdIwVa4nI/cLT7fNHV5aIjwppAtp7
	C/si1AAzCvyKWlTYjfBwRotrMddGlLQ=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-346-1_zLrF0FNI-87YWsBJ68wg-1; Wed, 05 Aug 2026 14:49:39 -0400
X-MC-Unique: 1_zLrF0FNI-87YWsBJ68wg-1
X-Mimecast-MFC-AGG-ID: 1_zLrF0FNI-87YWsBJ68wg_1785955779
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-92e55721a8cso128650685a.1
        for <nouveau@lists.freedesktop.org>;
 Wed, 05 Aug 2026 11:49:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785955779; x=1786560579;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3hJIV19g7hzV4U2eQYL2xphnDrR3wJqKfXXYljP96rg=;
        b=NC+m3Lo8m/FGQ22p1NgfDlWwGVE/zN3O0hqEEcdGhCdgMFXV62F3w+73wnpc54myqw
         kBP6o66jbqZ3oVu3FQjkH5+eWhCcTV9vfoK/lhi+VSApY9sNaKA70LozR4iONJRRsFUJ
         zQgHuaHbYo3fWzSFmKn5deJutAnb8OF2tVdNHaUxymJ0AX7T9PbJfLyZKME7EU7mh2+S
         Es8juHHdieJ4GwWGY5Q0+ZzOZhs+xK+/jQk3oHPRkGcwmer0PQz2UEmbUs8s11mOIusS
         UGc75TxiHOfw1XlJQGLvHQpIlo26RNG6QpDm1PnDOKouuKQkYQ002WdWgJuOlpAXO5ab
         ByNg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrZWYZ2O6/5MNEWDq1YEX6r6xsrpjs6AlGVIkY1nJNvR45BNYGelKDaFYOxYI/KFOPrHX4RCpZ8@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWPi0p/VxE8CFS5juGt/sym6yYQldPK51oUrqHzGC7az4FBx4k
	Js9rY3uULbZLyV+KIRIvKcbVsXUbkuMRkeBwHxnGd7vI1DD88HC00AWhyi5LNtnybjHSOYhSuFJ
	5WGoET8EafF1+HGCM3TaOivV/D775mO0YW49QXimkRBBY0dHlx1fhiTf3oFr7sPQlipQ=
X-Gm-Gg: AR+sD12NyAFcY42R0/Rt7MkvWLrSEvjjtjZTqJ0NIyRRcOD9EiIUzEdNbK7qg2nSH6Q
	EyOW/2eMEoDumVFeAEQjFZFSvgbsVNzxsKYj4mBGMdjMQvyQUhkdUy5yFHdBr2jQAf+lmWCUq3e
	ljQUn96Q+zHVOMhWqF0+xuAXsS/e4lajwdDIJty5x9GoAe7JUaBwo5q6zNYXkH/A+vzBs8bmD75
	yTDuQZxphje38S7xLHozS/vJQlkG/OFclWQyAAmxAVwmFhLN6M1q+aM3H/e7zOcGfZdVkS1D34f
	7VFIY4MUPpHwr58B1diy7Yqy5IfgSamViy3+YfswoiYZmfAy5a+jIehlPnEFJGnfjA+X1uAV
X-Received: by 2002:a05:620a:4090:b0:932:dd9a:cdd2 with SMTP id
 af79cd13be357-93649112c98mr804335385a.5.1785955779154;
        Wed, 05 Aug 2026 11:49:39 -0700 (PDT)
X-Received: by 2002:a05:620a:4090:b0:932:dd9a:cdd2 with SMTP id
 af79cd13be357-93649112c98mr804329385a.5.1785955778639;
        Wed, 05 Aug 2026 11:49:38 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9364a597e2asm215171585a.43.2026.08.05.11.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 11:49:38 -0700 (PDT)
Message-ID: <46aebd6a4caddf377d61dc251e7b4838f409de6f.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau: Wire up dmem cgroups
From: lyude@redhat.com
To: Natalie Vock <natalie.vock@gmx.de>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann	 <tzimmermann@suse.de>
Date: Wed, 05 Aug 2026 14:49:37 -0400
In-Reply-To: <20260410081322.5577-1-natalie.vock@gmx.de>
References: <20260410081322.5577-1-natalie.vock@gmx.de>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XS980egUthU609VeBvpbR8VMeY2CsUgHleWEJjE_P64_1785955779
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: QIHRN5SEVFC6LY74YUC6S5VBJARR6EUA
X-Message-ID-Hash: QIHRN5SEVFC6LY74YUC6S5VBJARR6EUA
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QIHRN5SEVFC6LY74YUC6S5VBJARR6EUA/>
Archived-At: 
 <https://lore.freedesktop.org/46aebd6a4caddf377d61dc251e7b4838f409de6f.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi! I'm sorry, I have no clue how this patch got overlooked. Thank you
for the contribution.

Reviewed-by: Lyude Paul <lyude@redhat.com>

I will push this upstream in just a moment

On Fri, 2026-04-10 at 10:13 +0200, Natalie Vock wrote:
> Userspace can now make use of memory protection via dmem cgroups. Let
> nouveau benefit from this as well by registering the vram region with
> the dmem cgroup controller.
>=20
> This patch adapts the approach amdgpu and Xe have taken for enabling
> dmem cgroups.
>=20
> Signed-off-by: Natalie Vock <natalie.vock@gmx.de>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_ttm.c | 5 +++++
> =C2=A01 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c
> b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> index ad01f922aa86a..860bca7e3ce28 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> @@ -188,6 +188,11 @@ nouveau_ttm_init_vram(struct nouveau_drm *drm)
> =C2=A0
> =C2=A0=09=09man->func =3D &nouveau_vram_manager;
> =C2=A0
> +=09=09man->cg =3D drmm_cgroup_register_region(drm->dev,
> "vram",
> +=09=09=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm-
> >gem.vram_available);
> +=09=09if (IS_ERR(man->cg))
> +=09=09=09return PTR_ERR(man->cg);
> +
> =C2=A0=09=09ttm_resource_manager_init(man, &drm->ttm.bdev,
> =C2=A0=09=09=09=09=09=C2=A0 drm->gem.vram_available >>
> PAGE_SHIFT);
> =C2=A0=09=09ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_VRAM,
> man);

