Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 578D8C5DF8C
	for <nouveau@archiver.kernel.org>; Fri, 21 Aug 2026 20:51:28 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 008CE10F3B4;
	Fri, 21 Aug 2026 20:51:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QzK13/Mg";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D7DFA47ACB;
	Fri, 21 Aug 2026 20:34:49 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787344489;
 b=crGg4uAwGoqlkkdXwUo5K+S6b8MIMzgklpaiYtTPFe9NkCE1A7hSItjpnYa9sx4H3KyEh
 pyBxUNWqkq6nq4MrBUDCWdPHqcThnehFryyLpgQPKKc1jJs+/55uc6xxaMFaO3yZo3gQzxw
 4UDUMsKqsXqMTW9h+udb8Nr+RJS7JRT3sUKg84aBGoeiPPB3J+P5/wsi7yTtMqAUkhdNVHS
 wv/MDAMR9vpQyUisQ0Pnu/FXWLlL9YBSQF3Aqx2xvLntY0GtcgkjDwud/AcJ6SGWVlWDXoS
 NYzn5XLwSw4IWOoiH9hnAMIU0OX5UcLV0TlSYcUHYl08SZ/AFI+jZPIxsWNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787344489; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=PzCEUAktNVyTUwyGPW28kl433w6GLdC5R8ss5vQ/ovQ=;
 b=k5nmFK8f3zogIFhdiM0a6Wgio6MzuRrjbH9vilBVJdk13lMy7wl212Zy7h6YortVrOTpm
 71U5UjbrXhE208uw1Fceki3O6xgIEuhOZSQ6MzgsnYU8/jxcdsuoly9oFFE07y+DraNKL4g
 4FGJ2iVGStVPw4M0XALbcKgmnQdfx77WNFnWv/ZWTOkD1ZLi2Ht3WQT2r7HjPpXgcMtrkNc
 hwxTYnGs+zE2glB2SpoPbPcSB4UAuCCHmDZasvFKBTHKN/WX7J2nagXaUWpCxzokxiVa3eL
 ot3hAD3KmV/OTUqJs+g2nMfZw0Hb4m47Dzi49wHeIgRDqnGWkzVoIlO6C9fg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 577F647AC6
	for <nouveau@lists.freedesktop.org>; Fri, 21 Aug 2026 20:34:47 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0C67510F3AB
	for <nouveau@lists.freedesktop.org>; Fri, 21 Aug 2026 20:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787345484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PzCEUAktNVyTUwyGPW28kl433w6GLdC5R8ss5vQ/ovQ=;
	b=QzK13/Mg1q3WfAhUEqEVqCCv+UOYwEdL3RX7QBURLDRxnxZdOPYL+WUtNMsvxAoF3NSAOG
	4u2bk7JBctUH+T/ItUbHLsyKmPiE7ENRzIZAVsbDJCb8UrG7fMtCfVFarOwoExuLOH2e2u
	ZuqT2qYOjTaFtFa4QcR/7j1aK8nFX3U=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-iZGrhzyiMYCEjGEmsb65NA-1; Fri, 21 Aug 2026 16:51:22 -0400
X-MC-Unique: iZGrhzyiMYCEjGEmsb65NA-1
X-Mimecast-MFC-AGG-ID: iZGrhzyiMYCEjGEmsb65NA_1787345482
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-930b571432fso140284185a.0
        for <nouveau@lists.freedesktop.org>;
 Fri, 21 Aug 2026 13:51:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787345482; x=1787950282;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HuDs7Luw/ROxX0xq8KmbfLJDfZoplTUYH6mJcBNERqU=;
        b=I2z6Rby9CST1kp5hAHwuaB3NnN02E2ZVxaNTLwUgYoHEUxukXXTAymb2cBasyGIND+
         1LOVn7BZH3X2kcsNGnQClnhYwRkBhLUAzDGTIdaWaPL0pNUnLoL64QtRJX91Pb3M1TB7
         nm1ih6mn0d+wfImA0sEqM8R7honmodxZXGChkQRufA6emtdcMF7Xghph0zpgdYs3QWP9
         87Pq3rROWXmOGM3MlP+CyDbdJR+rDyLwo7dGMF/BXoGZ8qiZGZeu262oUKbXf+qrIW1A
         Nyy34dACyiGNqzGlPujLFMSzuhjMJlQsIWaBNe/hP9E6PuIlRlXOEisMKwlBMj5Sq1CP
         A2vg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqh1AX3NYnY5P0qKjNxFNFS6VkQ+shLkgvSydS/9c6myiqKKoda9kNxXsKbbryEDxP0D+NXGR/6@lists.freedesktop.org
X-Gm-Message-State: AFuF++ktNr/EuO5m2pyVGiyQtbftpGjalhTWBEYvyuPh3fW4sS5g0I3c
	bFY0g36H9cEnrANZZN5QbsyFx0czZWgBNt3mua2/iqFlon6FgyuffrtdEQXId0XahIRcDJB2+P5
	OuWC2Szoo2/qfnk9ByCuAZ3yjdNx+Mq5GPD86xvbGTUY8A3/BVi27iJS28w7Lw496xag=
X-Gm-Gg: AR+sD13zrZUxmKo7q56qGFVQV500TsGYuhzQEzSs89xhPjrV2MIXf/3cOBksklU/pOe
	VYoWfbou24ThbIJyYiIaMzrndYccOYCr8e6RWYDSVqfxskMa0MDfQJPuJXjX1L9kSsa01jVutcH
	W4O1YPdexxxiR1kAQsxdPwZV5RefgGsAloeTPaaqMvrC4k5kxrSJyiIXuWnf9zRyJs64S6/RwiN
	HdHx7p8koh8Yy8dcY6t/azKPdOcHpDBP4sndr35uNYDjwoR/owXWg2nCYxHQeMOdrQgirhAmSUM
	k6fwb5NUNBmgslgwkLPCEwKXSKSzhcUpCJmHoYkSGuDy3SptMVDG0an8gEIe6Va2YCU17/EL
X-Received: by 2002:a05:620a:3707:b0:936:a8a0:cdf0 with SMTP id
 af79cd13be357-937284a0c5dmr1631689985a.15.1787345481911;
        Fri, 21 Aug 2026 13:51:21 -0700 (PDT)
X-Received: by 2002:a05:620a:3707:b0:936:a8a0:cdf0 with SMTP id
 af79cd13be357-937284a0c5dmr1631686185a.15.1787345481490;
        Fri, 21 Aug 2026 13:51:21 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93720582185sm682233485a.37.2026.08.21.13.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 13:51:20 -0700 (PDT)
Message-ID: <07f751b262a74e9c5dffabcec78753ea7efd3805.camel@redhat.com>
Subject: Re: [PATCH 57/70] drm/nouveau: Convert to atomic_create_state
From: lyude@redhat.com
To: Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>,  David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>
Date: Fri, 21 Aug 2026 16:51:20 -0400
In-Reply-To: <20260821-drm-no-more-crtc-reset-v1-57-fb793475c05a@kernel.org>
References: <20260821-drm-no-more-crtc-reset-v1-0-fb793475c05a@kernel.org>
	 <20260821-drm-no-more-crtc-reset-v1-57-fb793475c05a@kernel.org>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xDVWAUAj0QW64aGbCqXGSUd6kOA7tFzb-40096wyNw0_1787345482
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: FCWQNPOL4Z2P2IAYSNH7X754M7KN7EGL
X-Message-ID-Hash: FCWQNPOL4Z2P2IAYSNH7X754M7KN7EGL
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FCWQNPOL4Z2P2IAYSNH7X754M7KN7EGL/>
Archived-At: 
 <https://lore.freedesktop.org/07f751b262a74e9c5dffabcec78753ea7efd3805.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Fri, 2026-08-21 at 16:39 +0200, Maxime Ripard wrote:
> The nouveau nv50 head implementation provides a custom reset hook.
> However, this hook only allocates the state, initializes it with
> __drm_atomic_helper_crtc_reset(), and frees the previous state. It
> does not perform any hardware reset.
>=20
> Since this is exactly what the atomic_create_state hook is meant to
> do, minus the old state cleanup which the caller handles, convert the
> implementation to use atomic_create_state with
> __drm_atomic_helper_crtc_state_init() instead.
>=20
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: nouveau@lists.freedesktop.org
> ---
> =C2=A0drivers/gpu/drm/nouveau/dispnv50/head.c | 14 ++++++--------
> =C2=A01 file changed, 6 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c
> b/drivers/gpu/drm/nouveau/dispnv50/head.c
> index 1affa0378bd0..6a3a93de0cbf 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/head.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
> @@ -489,22 +489,20 @@ nv50_head_atomic_duplicate_state(struct
> drm_crtc *crtc)
> =C2=A0=09asyh->clr.mask =3D 0;
> =C2=A0=09asyh->set.mask =3D 0;
> =C2=A0=09return &asyh->state;
> =C2=A0}
> =C2=A0
> -static void
> -nv50_head_reset(struct drm_crtc *crtc)
> +static struct drm_crtc_state *nv50_head_create_state(struct drm_crtc
> *crtc)
> =C2=A0{
> =C2=A0=09struct nv50_head_atom *asyh;
> =C2=A0
> =C2=A0=09if (WARN_ON(!(asyh =3D kzalloc_obj(*asyh))))
> -=09=09return;
> +=09=09return ERR_PTR(-ENOMEM);
> =C2=A0
> -=09if (crtc->state)
> -=09=09nv50_head_atomic_destroy_state(crtc, crtc->state);
> +=09__drm_atomic_helper_crtc_state_init(&asyh->state, crtc);
> =C2=A0
> -=09__drm_atomic_helper_crtc_reset(crtc, &asyh->state);
> +=09return &asyh->state;
> =C2=A0}
> =C2=A0
> =C2=A0static int
> =C2=A0nv50_head_late_register(struct drm_crtc *crtc)
> =C2=A0{
> @@ -523,11 +521,11 @@ nv50_head_destroy(struct drm_crtc *crtc)
> =C2=A0=09kfree(head);
> =C2=A0}
> =C2=A0
> =C2=A0static const struct drm_crtc_funcs
> =C2=A0nv50_head_func =3D {
> -=09.reset =3D nv50_head_reset,
> +=09.atomic_create_state =3D nv50_head_create_state,
> =C2=A0=09.destroy =3D nv50_head_destroy,
> =C2=A0=09.set_config =3D drm_atomic_helper_set_config,
> =C2=A0=09.page_flip =3D drm_atomic_helper_page_flip,
> =C2=A0=09.atomic_duplicate_state =3D nv50_head_atomic_duplicate_state,
> =C2=A0=09.atomic_destroy_state =3D nv50_head_atomic_destroy_state,
> @@ -537,11 +535,11 @@ nv50_head_func =3D {
> =C2=A0=09.late_register =3D nv50_head_late_register,
> =C2=A0};
> =C2=A0
> =C2=A0static const struct drm_crtc_funcs
> =C2=A0nvd9_head_func =3D {
> -=09.reset =3D nv50_head_reset,
> +=09.atomic_create_state =3D nv50_head_create_state,
> =C2=A0=09.destroy =3D nv50_head_destroy,
> =C2=A0=09.set_config =3D drm_atomic_helper_set_config,
> =C2=A0=09.page_flip =3D drm_atomic_helper_page_flip,
> =C2=A0=09.atomic_duplicate_state =3D nv50_head_atomic_duplicate_state,
> =C2=A0=09.atomic_destroy_state =3D nv50_head_atomic_destroy_state,

