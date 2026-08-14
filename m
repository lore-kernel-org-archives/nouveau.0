Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 681B1C5B572
	for <nouveau@archiver.kernel.org>; Fri, 14 Aug 2026 19:07:01 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3E10610E59A;
	Fri, 14 Aug 2026 19:07:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JQCgZScb";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C25CB400C5;
	Fri, 14 Aug 2026 18:50:38 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786733438;
 b=o/hAxhurKQojswv46L9g9R0n8oDomNEgfrefVRm+qLA99UxlL46IQ6sQV1B8CBIq7wzww
 +YQ3VCL0J3FAxR/z8c+6u9jvUkSvhdZaxqBVrS9KzuCJGZK753tI9gUxuA1S5Wca/DolilO
 3+KG/YqNBZYknK/z9+IwQZkclW2f4lKXOvORe4XkTaWC7gD/ThDKbuIssUcUI3gSxgl0pdE
 /06Ui2eCPMuY+LQ7WeiyW18GsaIcUXWk/Vd3qYUDxArgo8Lb6AThRwstdldycGWSEInCbwo
 CTiQjcRQeK6723zAD8GRiwJVQO9y9/StBbxkTsi3zsXYaArHHDRk75zv2Suw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786733438; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=EXbV03SglUAVYkcsiKdvgl4+VZ/gbiiscwVTQZEGVe0=;
 b=RXwfYHymm8T6753l4rwVNRxYa3/4QEMhUXG++k7iawxGhTL/M/HoBjr4LesVf2lmI0UEn
 DlcA/cIyDWBAB93XzNUtkfRYESkwBFSGE0JNE0b+mymvQGn8J80BQGC0U5iS5ubpsAIqPhW
 TNWKGFLaPf5tnyl5xgBpOdGMCWYwO+3BGxWOrqDLHfDj6X3q1rX1bmxZ557s82aYWZDUKbC
 hKWukyTDWu18VoO8xu8iWStI/EqC7mWHw5x6dKiRXuKYnxAoImSYrz1BuC9CcRifTJo89+F
 zprkE+OHv7cdAaJQ1be4/XpIX6KJdbBu43sVwUi7Cpu9OBTtTgRtzDa2nyhg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id BCF2C400C5
	for <nouveau@lists.freedesktop.org>; Fri, 14 Aug 2026 18:50:34 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D0DB510F6AF
	for <nouveau@lists.freedesktop.org>; Fri, 14 Aug 2026 19:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786734415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EXbV03SglUAVYkcsiKdvgl4+VZ/gbiiscwVTQZEGVe0=;
	b=JQCgZScbYTxoI8iRL9IcbsI6G3EXej73AEqZ7gYKpBq+ZlVnorcftqhNgZNNdLjPktEjQM
	bCZGnZX9rcGTNSsw4WQ2JgOcdLCn/R16UjryLUgKSpCe1T68rGprVav+LcjsxBl2PEOYrY
	3/ajNZjUEXgl62IAjAK3FCiiplTmcck=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-400-iKECiomwP6SyOaA8YN1hXw-1; Fri, 14 Aug 2026 15:06:54 -0400
X-MC-Unique: iKECiomwP6SyOaA8YN1hXw-1
X-Mimecast-MFC-AGG-ID: iKECiomwP6SyOaA8YN1hXw_1786734413
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-52769fc3f2eso17303561cf.0
        for <nouveau@lists.freedesktop.org>;
 Fri, 14 Aug 2026 12:06:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786734413; x=1787339213;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WxFTX0yOJLZlCl8/a3EJL4yygyDVspCJMhQ7vy8Km48=;
        b=RYdlNG8nb/7V0UNWfuhPZw42Yflq6mDqzBhcPpUshLyfGRbi9ryxUZLnf1HW3hC6Lr
         gBbvrqWZD9lMT8+dZ3APxrzkUQx5xGpj/U2rUq8VukZBE6mAhrB3yaW6ojZDFexqRmVt
         yb+DkoeYR98xTmUPOQCSF7pGbcIwG67S8XNAoDEAQndpEXz8BIH8PnbMl/HnMYXvDQL8
         XmGeBQIFMHIGY+830TxzHXpvjLsX5Z/d7wtsSpiawOEjWYfdWACJ66DSAQ0R4UncCejE
         tiE4R2kkYkreao33PiZqJvae6dqWp73/kyyewMnwcJvSgpFuXojk1hPdPgkZRmg1WKue
         sSbw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqL7S+t4LKi/c78/uzaIwkwQlyRIOncJ1/eLwfPj+bOMQIZov9V/RTmwHXj3VgHdu9PCcOsCw0t@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXgrh/8tq087Sc9dqFafuthFkjWktxGJJL8zNjKDBDyqSazJw2
	QFVvC75Ri8DI4k0KwHamCBhuYM61AA4V9XvfnP5ha5JeChjT5O5uiN3JmBnZ3iPSYdrFOMPzESB
	UQXSNfhPP+lfnuhQhUd/rYR8PjJDmyrBdqag9DljxMki7qP/KdpbCPGMcnTxyech+RxU=
X-Gm-Gg: AR+sD133OPtS7jljeky1etedqQ6dJ2axnPO0P7u3BoCtG4RIUV2Hn1l8xSsq3JgfO12
	6EBd+we5oONigeToLoeTIzvGZMQx8XqjZyLvs5Z2YedczTwVrDyn4GHgYCpuqYPyGFKyEc6w2s5
	ECfghHAd1Rx0D+8fAzpfIHi+fRd9Vc5nvxZTT2jR+ZsTAOmylGpCwFq+u+c9JRMl2lAOMV2mKXv
	JfVU+m9nc4DGAl6k9YgHp6+PuBfFl1Wv+npzfIoUZLXCe5zrKbrqkXfqLuYaZUaQlBgcF4OEFTp
	0KT4uXxhCjUve1O2KlDC5n7xdpsHKn7kGhNWHNIqZ/yG0iOpOWU5BpDjnj8tdOFdzA+IGTUi
X-Received: by 2002:a05:622a:98f:b0:516:d699:a99b with SMTP id
 d75a77b69052e-52d854dfe55mr100188821cf.40.1786734413324;
        Fri, 14 Aug 2026 12:06:53 -0700 (PDT)
X-Received: by 2002:a05:622a:98f:b0:516:d699:a99b with SMTP id
 d75a77b69052e-52d854dfe55mr100185681cf.40.1786734411401;
        Fri, 14 Aug 2026 12:06:51 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-52d83ef920csm27229611cf.8.2026.08.14.12.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 12:06:50 -0700 (PDT)
Message-ID: <fcfc05b3197c0318ecdd8e60597b618f366eb8d3.camel@redhat.com>
Subject: Re: [PATCH v2 51/61] drm/nouveau: Convert to atomic_create_state
From: lyude@redhat.com
To: Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>,  David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>
Date: Fri, 14 Aug 2026 15:06:49 -0400
In-Reply-To: <20260814-drm-no-more-plane-reset-v2-51-82d2963dd134@kernel.org>
References: <20260814-drm-no-more-plane-reset-v2-0-82d2963dd134@kernel.org>
	 <20260814-drm-no-more-plane-reset-v2-51-82d2963dd134@kernel.org>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VQ3d9ihqGj6L8r7XwMeAW8balW3uFwPf5AjBuEDkoOQ_1786734413
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: L7XW25SOICD764RZTTJEMYFIBGEWG5I4
X-Message-ID-Hash: L7XW25SOICD764RZTTJEMYFIBGEWG5I4
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: dri-devel@lists.freedesktop.org, dakr@kernel.org,
 nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/L7XW25SOICD764RZTTJEMYFIBGEWG5I4/>
Archived-At: 
 <https://lore.freedesktop.org/fcfc05b3197c0318ecdd8e60597b618f366eb8d3.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, 2026-08-14 at 16:57 +0200, Maxime Ripard wrote:
> The plane reset implementation creates a custom state
> subclass, but only initializes a pristine state without resetting any
> hardware. This is equivalent to what atomic_create_state expects.
> Convert to it.
>=20
> The conversion was done using the following Coccinelle semantic
> patch:
>=20
> @@
> identifier funcs;
> symbol drm_atomic_helper_plane_reset;
> symbol drm_atomic_helper_plane_create_state;
> @@
>=20
> struct drm_plane_funcs funcs =3D {
> =C2=A0 ...,
> - .reset =3D drm_atomic_helper_plane_reset,
> + .atomic_create_state =3D drm_atomic_helper_plane_create_state,
> =C2=A0 ...,
> };
>=20
> @match_struct_reset@
> identifier funcs, reset_func;
> @@
> struct drm_plane_funcs funcs =3D {
> =C2=A0=C2=A0=C2=A0 ...,
> =C2=A0=C2=A0=C2=A0 .reset =3D reset_func,
> =C2=A0=C2=A0=C2=A0 ...,
> };
>=20
> @reset_uses_helpers depends on match_struct_reset@
> identifier match_struct_reset.reset_func;
> @@
>=20
> =C2=A0void reset_func(...)
> =C2=A0{
> =C2=A0=09<+...
> (
> =C2=A0=09__drm_atomic_helper_plane_reset(...);
> >=20
> =09__drm_gem_reset_shadow_plane(...);
> )
> =C2=A0=09...+>
> =C2=A0}
>=20
> @match_struct_destroy@
> identifier funcs, destroy_func;
> @@
> struct drm_plane_funcs funcs =3D {
> =C2=A0=C2=A0=C2=A0 ...,
> =C2=A0=C2=A0=C2=A0 .atomic_destroy_state =3D destroy_func,
> =C2=A0=C2=A0=C2=A0 ...,
> };
>=20
> @script:python renamed_func@
> old_name << match_struct_reset.reset_func;
> new_name;
> @@
> if old_name.endswith("_reset"):
> =C2=A0=C2=A0=C2=A0 coccinelle.new_name =3D old_name.replace("_reset", "_c=
reate_state")
> else:
> =C2=A0=C2=A0=C2=A0 coccinelle.new_name =3D old_name
>=20
> @update_struct depends on match_struct_reset && reset_uses_helpers@
> identifier match_struct_reset.funcs, match_struct_reset.reset_func;
> identifier renamed_func.new_name;
> @@
> struct drm_plane_funcs funcs =3D {
> =C2=A0=C2=A0=C2=A0 ...,
> -=C2=A0=C2=A0 .reset =3D reset_func,
> +=C2=A0=C2=A0 .atomic_create_state =3D new_name,
> =C2=A0=C2=A0=C2=A0 ...,
> };
>=20
> @drop_destroy depends on update_struct && match_struct_destroy@
> identifier match_struct_reset.reset_func;
> identifier match_struct_destroy.destroy_func;
> identifier container_func;
> identifier P;
> symbol drm_atomic_helper_plane_destroy_state;
> symbol __drm_atomic_helper_plane_destroy_state;
> @@
>=20
> =C2=A0void reset_func(struct drm_plane *P)
> =C2=A0{
> =C2=A0=09...
> (
> -=09if (P->state) {
> -=C2=A0=09=09<+...
> (
> -=09=09drm_atomic_helper_plane_destroy_state(P, P->state);
> >=20
> -=09=09__drm_atomic_helper_plane_destroy_state(P->state);
> >=20
> -=09=09P->funcs->atomic_destroy_state(P, P->state);
> >=20
> -=09=09destroy_func(P, P->state);
> )
> -=C2=A0=09=09...+>
> -=C2=A0=09}
> >=20
> -=09drm_WARN_ON_ONCE(P->dev, P->state);
> >=20
> -=09WARN_ON(P->state);
> )
> =C2=A0=09...
> (
> -=09kfree(P->state);
> >=20
> -=09kfree(container_func(P->state));
> >=20
> =C2=A0=09// kfree is optional
> )
> (
> -=09P->state =3D NULL;
> >=20
> =C2=A0=09// plane->state clearing is optional
> )
> =C2=A0=09...
> =C2=A0}
>=20
> @drop_destroy_mtk depends on update_struct@
> identifier P;
> symbol __drm_atomic_helper_plane_destroy_state;
> symbol to_mtk_plane_state;
> @@
>=20
> =C2=A0void mtk_plane_reset(struct drm_plane *P)
> =C2=A0{
> =C2=A0=09...
> -=09if (P->state) {
> -=09=09__drm_atomic_helper_plane_destroy_state(P->state);
> -=09=09...
> -=09} else {
> =C2=A0=09=09...
> -=09}
> =C2=A0=09...
> =C2=A0}
>=20
> @transform_nv50_wndw depends on update_struct@
> identifier S;
> @@
>=20
> =C2=A0void nv50_wndw_reset(...)
> =C2=A0{
> =C2=A0=09...
> -=09if (WARN_ON(!(S =3D kzalloc_obj(*S))))
> +=09S =3D kzalloc_obj(*S);
> +=09if (WARN_ON(!S))
> =C2=A0=09=09return;
> =C2=A0=09...
> =C2=A0}
>=20
> @transform_kzalloc depends on update_struct@
> identifier match_struct_reset.reset_func;
> identifier P, S;
> statement ST;
> statement list STL;
> @@
>=20
> =C2=A0void reset_func(struct drm_plane *P)
> =C2=A0{
> =C2=A0=09<...
> =C2=A0=09S =3D kzalloc_obj(*S);
> (
> -=09if (S)
> -=09{
> -=09=09STL
> -=09}
> +=09if (!S) return;
> +
> +=09STL
> >=20
> -=09if (S) ST
> +=09if (!S) return;
> +
> +=09ST
> )
> =09...>
> =C2=A0}
>=20
> @transform_body depends on update_struct@
> identifier match_struct_reset.reset_func;
> identifier renamed_func.new_name;
> identifier S, P;
> expression PS;
> @@
> - void reset_func(struct drm_plane *P)
> + struct drm_plane_state *new_name(struct drm_plane *P)
> {
> =09...
> =C2=A0=09S =3D kzalloc_obj(*S);
> =09...
> (
> =C2=A0=09if (!S) {
> =09=09...
> -=09=09return;
> +=09=09return ERR_PTR(-ENOMEM);
> =C2=A0=09}
> >=20
> =C2=A0=09if (WARN_ON(!S)) {
> =09=09...
> -=09=09return;
> +=09=09return ERR_PTR(-ENOMEM);
> =C2=A0=09}
> >=20
> =C2=A0=09if (S =3D=3D NULL) {
> =C2=A0=09=09...
> -=09=09return;
> +=09=09return ERR_PTR(-ENOMEM);
> =C2=A0=09}
> )
> =09...
> (
> -=09__drm_atomic_helper_plane_reset(P, PS);
> +=09__drm_atomic_helper_plane_state_init(PS, P);
> >=20
> -=09__drm_gem_reset_shadow_plane(P, PS);
> +=09__drm_gem_shadow_plane_state_init(P, PS);
> )
> =09...
> }
>=20
> @update_early_return depends on update_struct@
> identifier match_struct_reset.reset_func;
> identifier renamed_func.new_name;
> identifier P;
> expression PS;
> @@
> =C2=A0struct drm_plane_state *new_name(struct drm_plane *P)
> {
> =09<+...
> -=09return;
> +=09return ERR_PTR(-EINVAL);
> =09...+>
> }
>=20
> @update_return_plane depends on update_struct@
> identifier match_struct_reset.reset_func;
> identifier renamed_func.new_name;
> identifier P;
> expression PS;
> @@
> =C2=A0struct drm_plane_state *new_name(struct drm_plane *P)
> {
> =09...
> =C2=A0=09__drm_atomic_helper_plane_state_init(PS, P);
> =09...
> +
> +=09return PS;
> }
>=20
> @update_return_shadow depends on update_struct@
> identifier renamed_func.new_name;
> identifier P;
> expression PS;
> @@
> =C2=A0struct drm_plane_state *new_name(struct drm_plane *P)
> {
> =09...
> =C2=A0=09__drm_gem_shadow_plane_state_init(P, PS);
> =09...
> +
> +=09return &PS->base;
> }
>=20
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
> Cc: dakr@kernel.org
> Cc: lyude@redhat.com
> Cc: nouveau@lists.freedesktop.org
> ---
> =C2=A0drivers/gpu/drm/nouveau/dispnv50/wndw.c | 15 +++++++--------
> =C2=A01 file changed, 7 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> index 15a322422f4e..378095138d12 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> @@ -750,22 +750,21 @@ nv50_wndw_zpos_default(struct drm_plane *plane)
> =C2=A0{
> =C2=A0=09return (plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY) ? 0 :
> =C2=A0=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (plane->type =3D=3D DRM_PLA=
NE_TYPE_OVERLAY) ? 1 : 255;
> =C2=A0}
> =C2=A0
> -static void
> -nv50_wndw_reset(struct drm_plane *plane)
> +static struct drm_plane_state *nv50_wndw_create_state(struct
> drm_plane *plane)
> =C2=A0{
> =C2=A0=09struct nv50_wndw_atom *asyw;
> =C2=A0
> -=09if (WARN_ON(!(asyw =3D kzalloc_obj(*asyw))))
> -=09=09return;
> +=09asyw =3D kzalloc_obj(*asyw);
> +=09if (WARN_ON(!asyw))
> +=09=09return ERR_PTR(-ENOMEM);

Should this be drm_WARN_ON() while we're at it?

Otherwise, this looks good to me:

Reviewed-by: Lyude Paul <lyude@redhat.com>

> =C2=A0
> -=09if (plane->state)
> -=09=09plane->funcs->atomic_destroy_state(plane, plane-
> >state);
> +=09__drm_atomic_helper_plane_state_init(&asyw->state, plane);
> =C2=A0
> -=09__drm_atomic_helper_plane_reset(plane, &asyw->state);
> +=09return &asyw->state;
> =C2=A0}
> =C2=A0
> =C2=A0static void
> =C2=A0nv50_wndw_destroy(struct drm_plane *plane)
> =C2=A0{
> @@ -835,11 +834,11 @@ static bool
> nv50_plane_format_mod_supported(struct drm_plane *plane,
> =C2=A0const struct drm_plane_funcs
> =C2=A0nv50_wndw =3D {
> =C2=A0=09.update_plane =3D drm_atomic_helper_update_plane,
> =C2=A0=09.disable_plane =3D drm_atomic_helper_disable_plane,
> =C2=A0=09.destroy =3D nv50_wndw_destroy,
> -=09.reset =3D nv50_wndw_reset,
> +=09.atomic_create_state =3D nv50_wndw_create_state,
> =C2=A0=09.atomic_duplicate_state =3D nv50_wndw_atomic_duplicate_state,
> =C2=A0=09.atomic_destroy_state =3D nv50_wndw_atomic_destroy_state,
> =C2=A0=09.format_mod_supported =3D nv50_plane_format_mod_supported,
> =C2=A0};
> =C2=A0

