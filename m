Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D35E3C982C9
	for <nouveau@archiver.kernel.org>; Wed, 16 Sep 2026 21:13:11 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE7E10E2D3;
	Wed, 16 Sep 2026 21:13:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LW0nbeam";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 531F84812F;
	Wed, 16 Sep 2026 20:55:35 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789592135;
 b=vFKY7F3IcveOB13O8+dcNTif9y696CgPHgGFNe0bv4sfLwkRox3Uc7D8RmyazkEKDU848
 7M+bgdKOCmYsfqiMmLqVgVnuy9wUw0DvO6Ezu8eSMz8PcwOZurtdEMYwh5EnUBcVuI+Bc4G
 2GdzojFeZaVrvL115mAXZgrD/IovWq/YD0o1PeOlKF8N4ggObwClyFqmYaVuO0L0cQtpp83
 cAQrgI37RMMRKipdUv2Fcd9Pw7bewghU023NM79GLbitvtbyYuItlD+rs+y0liTtIZLaz5a
 c4JAPIHSyeS7mWZsTApaJaoD8JvdZkZUPyr4IDTULoHh/Sppfvf1XHBzd5gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789592135; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=g2VZBiIhAndeip+NGRI8TveTvXF5sUhhIo3CK7DVi2o=;
 b=ZgIL5lD5qL/N0L/aW55KWhtzqpmT/zwwrs3fibNUiPWYqwAVry2wKb7BV02Y/oGQ4sSDv
 6PBwCU83HvZdo6dd+UAjC+2SvLXI0B29AQ0DCTzOaGnfYC+UZZuRlVoB9plPHxhwkCRxEJu
 +RJKrbl2GmGTqbeZ1Orr3s/+689Zgo3p2+INXdEZeMqJipscYXDFCiJxuCEZ5zeuz21+NQQ
 J4uHSUcPLIdIsQVIgv+Nim9PituGLGRGyKdgf+HzB0TGJ950MKnT9+3PtLMCbpSQxzRThXo
 UbcrkY8Hlr+NWTVcy40SyXrtN12vRVQT0YOxCDPwAIquWod0Az2QJ1qIbIHg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id D3823480F5
	for <nouveau@lists.freedesktop.org>; Wed, 16 Sep 2026 20:55:32 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6A78010E110
	for <nouveau@lists.freedesktop.org>; Wed, 16 Sep 2026 21:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789593187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g2VZBiIhAndeip+NGRI8TveTvXF5sUhhIo3CK7DVi2o=;
	b=LW0nbeamPdOxokyADdfJDKjjmLcKLgZV3xZSJMzZINNPevJRDkMPFw5gyw3a+Q7yzo4v4w
	sAsM916K6rw2Ne1VfB5+JHeWBndiMEx0RGDoeHvBxUGNZvYj2jPu3cLoAjFJDOfeAnf2h6
	5R0O4aVIOV8Mr4jp7lIRxSaTZaXD7B8=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-3pwEc-dwNlq9aV7ED1vPCQ-1; Wed, 16 Sep 2026 17:13:04 -0400
X-MC-Unique: 3pwEc-dwNlq9aV7ED1vPCQ-1
X-Mimecast-MFC-AGG-ID: 3pwEc-dwNlq9aV7ED1vPCQ_1789593184
Received: by mail-ua1-f72.google.com with SMTP id
 a1e0cc1a2514c-980c3b71002so106840241.3
        for <nouveau@lists.freedesktop.org>;
 Wed, 16 Sep 2026 14:13:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789593184; x=1790197984;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g2VZBiIhAndeip+NGRI8TveTvXF5sUhhIo3CK7DVi2o=;
        b=DEFAfRb8Mm2QYH2p6hBqdE9jILJXcHZbzUp2qGHaGgzvEMZ1CNAYMytSErdFjZHgtB
         Uw3wCQA5lBdJpyTPaOdyN+zW2+b7C6JTNaaHNW5d/JLA0zcBQhEJzYL76g1anX/xxZKP
         uAKqNLvTG9x2Jhq0ekIjMO8/7pu33r6o1kHIBTTvN7cJwUOg4pls9RwpZJOQ28gl/E0P
         +CHkSlPli5+QHfYtGzPF91ByAznxEEvf75sYu2vFfV31nmzaJOmniOfanDWH0wOy9uxm
         /FhY4szZHrWG2r3qKW9NFNHlEMdGyI1QPrcxjlRUjyEylYp10de0+rtOn+eGPJngfxdp
         0zsA==
X-Forwarded-Encrypted: i=1;
 AKwUvByOCB26SXW+QtlNAEnHNEAPV1fl2TEIQlaylIrbXPu9ryewbZOwuZ5HHC3eNA2FeLGiDnLFe3XF@lists.freedesktop.org
X-Gm-Message-State: AFuF++mzWOcjWs+stBFcHxlmdXvRCx4SvE3lG5fyG9U6y4Iv359IHAu6
	Q/Ls/7gmhhZA3O60YLmZqCVi8PqFj6sMGtBk/9KUvIyUGamLuaTwor01huc6NULa6m+SAgvxWUW
	B8/LA3+dSlnvcRhj+7etdlqYbzFDlseDamVynJtUEX/odG4TKnfRLGc3hKtxU8/D8dPk=
X-Gm-Gg: AYBFou2vZHUDdUGP9ZJy5HCKBUotYzMwTZh7QkirC/swanCbowSWbm14t1Oi69gABbs
	mn0EK8n4yIjHHcs86N4SAArcajsYHk5H3zWZR7MGf8j5NVA2H/rNRZ9tj46fhlAEujMsKTrWDRm
	LOybenkGfq/Bg3t7BIPIA5842Ng3umDzipnbQse2M7pMfoHIe1OceCTC71vwG8lTGmjI60/QEUT
	IGItaNE1w6Ly947N+7Dtsmlr2aLL3iFtD5wK3p+hfF3BmEvmRr0iLYtC4BHbZ85Ro6yuwyBmlpS
	6eXJRsdDcsq67UqIxdNuq0g2TaY4tZ5K//3+y0jAC9wBW48DhuTUjhtniGCKVaypVcVRBvlL
X-Received: by 2002:a05:6102:1628:b0:79b:f57e:ea17 with SMTP id
 ada2fe7eead31-7a201fa284dmr272256137.3.1789593183913;
        Wed, 16 Sep 2026 14:13:03 -0700 (PDT)
X-Received: by 2002:a05:6102:1628:b0:79b:f57e:ea17 with SMTP id
 ada2fe7eead31-7a201fa284dmr272241137.3.1789593183541;
        Wed, 16 Sep 2026 14:13:03 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-7a1e384dc10sm1123769137.11.2026.09.16.14.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 14:13:02 -0700 (PDT)
Message-ID: <b143ac7a1a911146f3569b934a8da54734610728.camel@redhat.com>
Subject: Re: [PATCH v3 1/5] drm/nouveau/gsp/r535: Add support for
 INTERNAL_GCX_ENTRY_PREREQUISITE
From: lyude@redhat.com
To: David Airlie <airlied@redhat.com>
Date: Wed, 16 Sep 2026 17:13:01 -0400
In-Reply-To: 
 <CAMwc25rP6u9=0PxN_OpYUs33cNqoiYYEFpwN4FKPQyHvNb+=Cg@mail.gmail.com>
References: <20260916001603.22394-1-lyude@redhat.com>
	 <20260916001603.22394-2-lyude@redhat.com>
	 <CAMwc25rP6u9=0PxN_OpYUs33cNqoiYYEFpwN4FKPQyHvNb+=Cg@mail.gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nLzzStlXr1Lg0KHKLXIMUZ1YwUhIPcybH_6Pg760j3E_1789593184
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 55JKM6DTTAF75A6O7INFA5XCARC35WAH
X-Message-ID-Hash: 55JKM6DTTAF75A6O7INFA5XCARC35WAH
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kees Cook <kees@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Hongling Zeng <zenghongling@kylinos.cn>,
 Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/55JKM6DTTAF75A6O7INFA5XCARC35WAH/>
Archived-At: 
 <https://lore.freedesktop.org/b143ac7a1a911146f3569b934a8da54734610728.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>



On Wed, 2026-09-16 at 10:42 +1000, David Airlie wrote:
> > +typedef struct NV2080_CTRL_INTERNAL_GCX_ENTRY_PREREQUISITE_PARAMS
> > {
> > +=C2=A0=C2=A0=C2=A0 NvBool bIsGC6Satisfied;
> > +=C2=A0=C2=A0=C2=A0 NvBool bIsGCOFFSatisfied;
> > +} NV2080_CTRL_INTERNAL_GCX_ENTRY_PREREQUISITE_PARAMS;
>=20
> Have you confirmed this struct didn't change in r570,
>=20
> Thanks,

It would appear I have made a mistake - this struct isn't even in r535,
which I could have sworn I explicitly checked. Glad I double checked
before responding, thanks for noticing this :)

