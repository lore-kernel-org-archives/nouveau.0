Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562C0C5DF81
	for <nouveau@archiver.kernel.org>; Thu, 20 Aug 2026 18:28:48 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2C58510F16A;
	Thu, 20 Aug 2026 18:28:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dtfMa6Q6";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 873B847A41;
	Thu, 20 Aug 2026 18:12:12 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787249532;
 b=Gwz5+8Q/i7h06J6UOxyltJUn3NsfSgQQgZRHPqEHeYrLRN1cwpCzjzy1vIv2YWtEs2tuR
 +OJufTbwUNB23OTTBpkr4RgoHeW3aN6yPDDXbWAJcDqEUMeKE+4WWfacdA7UwXDILrdYdx7
 EnKozCIR+cGWbLi1j4/0EdnliZY/YZbvAHgJpu2XB8lLeT3Ri+hjaFBPazuJ+bWanP4odpM
 61CM4ZgePnOjH9XW6bNxZCemcPW3RmCEL8flnFn0cThiGMdo0yIbNhqdJxcRbfK2Ly3sSSA
 Xs9+ZAvfeBhqJ5M61hRe/5zLQRa/PAK2qSOF6x3k6TMTxHq961HKrIL+t0YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787249532; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=02IMZbxlNo+CxyHurTZ+VFbVjMkSF2HhHDF+1YC6pG8=;
 b=LLdseSkyCCZSp4o30JmI5uUnOuVpWpI/00SLtkDdffX9/swhdwU2STuZI2c0YJkDScVj8
 PGJux5tjAtnLp33CH2Ef3Eudsu9pvdG50GfJbKHHOPpN8wFL6LjLzV15Cl33P86LfXr0sqy
 dybgV4PsuIYwzQujUhQeQ7periXAw+JcwUK2H9Sjx3fd0etJ6raTH6P9FqZhZxN4V6+tWoh
 pVn6iIy+EN1anoY4UrQhqB9ABSKnGkPcYQERz2KLoObrxIMa/hNOHqAie45E/7Xm8PVHFke
 kgr3OaIfhfiSApgGNMw3NAz6/khAdl0AfFApHnypcyU80pymgmLP6wCPVhYg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id D482547A41
	for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2026 18:12:09 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 31FF310EF06
	for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2026 18:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787250524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=02IMZbxlNo+CxyHurTZ+VFbVjMkSF2HhHDF+1YC6pG8=;
	b=dtfMa6Q6uThqc+zEQmslSG2goUmO+rQd1RdtyJYArHJB0XnxENjt1O0ObpUmLQZ1PBXjmM
	04pDN75NmB9zU+8cwDe/u7YO5ay0A5HEPDVXPYcEijrvcTCREVGt2jrPUeZpACzomzXq8n
	0MGkHHTYUFrRZL/2EuH1nNYS9KeL/NY=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-240-vdEfIy7QOWi6CR5ERmpPWg-1; Thu, 20 Aug 2026 14:28:37 -0400
X-MC-Unique: vdEfIy7QOWi6CR5ERmpPWg-1
X-Mimecast-MFC-AGG-ID: vdEfIy7QOWi6CR5ERmpPWg_1787250517
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-52d827597fbso1607801cf.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 20 Aug 2026 11:28:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787250517; x=1787855317;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fvFKAPRcQcLsGMFTo6jCZYlK8au7/chi2AjGH/KyknY=;
        b=hg2i3jGll13yJDwjxtNlFZRurrxk4V9pFiTxiv5BUXrj6TBZt/utsg6Eu9M9K78aCP
         3U6fHX6a4H12rkpjqBr3ryoGRkvei7LfLUuywFsNO4zqPMrJQ+c4IaATIqMKRwFfeIWr
         PCDOA91MDxXSGtahObKj4EKgJdJMwhGIuJe9pNaHkBuDE5jCc5NS8Eqmcy5R31sPIVYA
         vwD8NCfDO5lNEDV0jNokjEY7zL7n3EaJQMEkKEJ8XHDkDl5FnCf7bD94Mz43IPoOMjpt
         HqOpvquz7xBLNKz3lxMgqksbMCquA6KMJpvCgsPb1eJMnMwpOS7Eu1IWNIJhEwIsMCD4
         XkrA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoQve2WrKzH71JwgiphxSs9/02hFQBCqGbS5r44oHhMtvPNuh+o6yOm0KM/VLrhhDhLa1xaYUvx@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzfnn73EZjbsOIp5AnEGK5+Tv0huACUP7JgpRg98RHR2kEpAy8w
	LwRWTjbBOk2cIxY15emnAO2ao+N9VbGf1HeB2pYr/SF17jAp7bqtj9BIV6/qwh5e2v3RXpClzxg
	mVce5b9aBeC3ZTRtoBnct8+X15PaLehuj8zURfF4DZ3u0ch7QnXDqmTxYOn7ouqAEm7k=
X-Gm-Gg: AR+sD12X3r+ft+vD3dS2AFkrPhi50GZmplCExVxWC7pqeEAKAkCX+P410m84U01Zc4C
	p28/zX70mY1pyEsgo+7dogCrDrPocIIvuiaYD+hgzs0tAeXmPblsEkKbffb8VT2mLqU8JMgHr3L
	VjjC1TbscBYTpNndp44P354WIwPeKY8xguvjt8fesnND0y5ii8BfUSBnexejWgsgskSQd6mf6tK
	rPQ9jQWk6bvOoX9oqJdhtbi4BQCwrMz1RuXRfaLgaTsMbWgtcdh5vo0W/QwkDJU2NPfwfD2p4a4
	THVzvHbdSAKRsAmX3JOyUx5oZxlbrb7YUpbCZH6DNnW4YzSVrxft12TtN9P9oeORUZburWAl
X-Received: by 2002:ac8:5e06:0:b0:52d:4f43:d5b0 with SMTP id
 d75a77b69052e-52df5a07b41mr2811021cf.22.1787250516718;
        Thu, 20 Aug 2026 11:28:36 -0700 (PDT)
X-Received: by 2002:ac8:5e06:0:b0:52d:4f43:d5b0 with SMTP id
 d75a77b69052e-52df5a07b41mr2810391cf.22.1787250515984;
        Thu, 20 Aug 2026 11:28:35 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9372056b781sm421572785a.24.2026.08.20.11.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 11:28:34 -0700 (PDT)
Message-ID: <ad9b449657ab3abe4537ed8d8beb393101d46bda.camel@redhat.com>
Subject: Re: [PATCH 3/3] drm/nouveau: don't dereference outp before checking
 it in nouveau_dp_irq
From: lyude@redhat.com
To: Marek Czernohous <mczernohous@gmail.com>, nouveau@lists.freedesktop.org,
 	dri-devel@lists.freedesktop.org
Date: Thu, 20 Aug 2026 14:28:33 -0400
In-Reply-To: <178682366004.3748010.14933649768375463967@gmail.com>
References: <178682366001.3748010.7798811159846779765@gmail.com>
	 <178682366004.3748010.14933649768375463967@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: p75xt0wiD2Wpz7wW_J9WwII6nVtbaBwqv5zMSPdbvK0_1787250517
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: OT5BF6Q3UNJVAOCJNOKUQTNHQCC3UWFR
X-Message-ID-Hash: OT5BF6Q3UNJVAOCJNOKUQTNHQCC3UWFR
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Simona Vetter <simona@ffwll.ch>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/OT5BF6Q3UNJVAOCJNOKUQTNHQCC3UWFR/>
Archived-At: 
 <https://lore.freedesktop.org/ad9b449657ab3abe4537ed8d8beb393101d46bda.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Sat, 2026-08-15 at 21:54 +0200, Marek Czernohous wrote:
> From: Marek Czernohous <marek@czernohous.de>
>=20
> nouveau_dp_irq() looks the encoder up and dereferences it in the same
> breath, five lines before testing it:
>=20
> =09struct nouveau_encoder *outp =3D find_encoder(connector,
> DCB_OUTPUT_DP);
> =09struct nouveau_drm *drm =3D nouveau_drm(outp->base.base.dev);
> =09...
> =09if (!outp)
> =09=09return;
>=20
> find_encoder() walks the connector's possible encoders and returns
> NULL
> when none of them matches the requested type, so the NULL test is not
> decoration: it is the author saying this can happen. The initialiser
> above it dereferences the same pointer regardless.
>=20
> The NULL test predates the dereference. commit 773eb04d14a1
> ("drm/nouveau/disp: expose conn event class") turned nouveau_dp_irq()
> into a work callback, and since the drm pointer was no longer passed
> in
> as an argument it was recovered from the encoder in the declaration
> block, which put the dereference above the existing test.
>=20
> Move the drm lookup below the test. No functional change when outp is
> non-NULL.
>=20
> Fixes: 773eb04d14a1 ("drm/nouveau/disp: expose conn event class")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Marek Czernohous <marek@czernohous.de>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_dp.c | 4 +++-
> =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c
> b/drivers/gpu/drm/nouveau/nouveau_dp.c
> index 55691ec44aba..738802358d85 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dp.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
> @@ -486,7 +486,7 @@ nouveau_dp_irq(struct work_struct *work)
> =C2=A0=09=09container_of(work, typeof(*nv_connector), irq_work);
> =C2=A0=09struct drm_connector *connector =3D &nv_connector->base;
> =C2=A0=09struct nouveau_encoder *outp =3D find_encoder(connector,
> DCB_OUTPUT_DP);
> -=09struct nouveau_drm *drm =3D nouveau_drm(outp->base.base.dev);
> +=09struct nouveau_drm *drm;
> =C2=A0=09struct nv50_mstm *mstm;
> =C2=A0=09u64 hpd =3D 0;
> =C2=A0=09int ret;
> @@ -494,6 +494,8 @@ nouveau_dp_irq(struct work_struct *work)
> =C2=A0=09if (!outp)
> =C2=A0=09=09return;
> =C2=A0
> +=09drm =3D nouveau_drm(outp->base.base.dev);
> +
> =C2=A0=09mstm =3D outp->dp.mstm;
> =C2=A0=09NV_DEBUG(drm, "service %s\n", connector->name);
> =C2=A0

