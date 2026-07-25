Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7C4C531C9
	for <nouveau@archiver.kernel.org>; Sat, 25 Jul 2026 03:50:01 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B58D010F4EC;
	Sat, 25 Jul 2026 03:50:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PnjQJFtU";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 14DA2473B0;
	Sat, 25 Jul 2026 03:34:24 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784950463;
 b=fCMvX2GzwJ/E1PnuTGJHSQo0WOme5cEI9bj1t/SsUN4tuEkpwpYBLNbKl7yVKnN2p3bNi
 kDA9sq28E0GKhsjU7Zzh/fjfPItHH9X5peGY26/MNNgbJslUvViNVUkTvA3wWp0BX5eZwto
 f4ATC7HkbGRxOelmSi8nK5yVsPNhTmbYe2PIyJXUgLHlomQTwALUX8cHb9+ak8waJ7XTJgx
 q/W+txNJwQJw3wDI7kaL8kGeNkRJklQfoJKfHtHy8X5WrB8kklSv+Qjfo/9oTXYvkLa0Ubs
 OKRE3LAI3dTlED0ybwkIvTTsoOo9gk6hzQ58zqkcnYTH78LHEtAKgZTI/SwQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784950463; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=+Auhbwa+a5TW5dJOagtosBZ5QlY30myaRTt31FDzvB8=;
 b=FkTuo/MJowxSre03CxXRRkg3W9Jc69JEXyrL0w4vlbmzXx5FVXwXHULTC3wWIv0tDoNzL
 BAKsTzfr+6sbAucldQqLgGWeuniFWwd64ymF0dLUPCAJrdp+eBMJeZaeJCYpcDr322yXq84
 2BPPUTiHoE2Xn5CHJ7eu4CaM8Ra2DR9sM2DGxAokQ359vkabPhnpIieFj9uWrF4wUKNakAS
 dWFnlzRRNikYFBi7keOqfK9uQy+7D9rRio+NBe4J0iPLRnL4MqJFgFDat6dE4ojZ0jKdrBT
 kK3jc3SdwT+ukbo7TpWMg4BDIy0hifzz0Kti+FMSGuQh51C1RL1fEtdYAeJQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 6E5E246F74
	for <nouveau@lists.freedesktop.org>; Sat, 25 Jul 2026 03:34:20 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D131710E0EF
	for <nouveau@lists.freedesktop.org>; Sat, 25 Jul 2026 03:49:56 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-81f3b227a4aso11551977b3.1
        for <nouveau@lists.freedesktop.org>;
 Fri, 24 Jul 2026 20:49:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784951395; cv=none;
        d=google.com; s=arc-20260327;
        b=RbYBnd2GX64OtlCOMeaXgFDNxK3AJ+3FlmRymSoeqlZWyalUyI87/kcKeH8fK04ROG
         rIuLjwt+1Ds6TIKyXGaCJ4+fF6TLqWh+G+tqlt4YcXpRZwn8L2L6KBAy3ckJlcaVpovW
         SFETBuVFzLcIoyusj5fRo1cdcvvBrcn6FS66w79vnh2LFZKbAk+by/diUSrDoXbztBTd
         QeRXds+ZE3XlbBsaFoWZsXXktwlgY7sbH4xZcJlpaOsLNDlxmC/nwcJFgSyDwA0KeDP2
         JI4i56sWtb8mqN2TrarOpmRdVf/1Amb/YDhjAwPDGIKCjNNQ+RWYHN40MdfHdKU29nxq
         5E8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+Auhbwa+a5TW5dJOagtosBZ5QlY30myaRTt31FDzvB8=;
        fh=cZlKxA4hcSAX2OQFR2Ctencxf4bdXJxnHCmFpNwMIiI=;
        b=p9edFgs+yyaobcRi7SLdc3dzzjh7FI0RhY/10LDVwEkIwahXlzLNokC78i6sHBme0p
         0XzR4Lbamt0rEpwqVhVXMuzYS8XTKObMfdYzABHG+j7wctP3+uIIdktHxA6keHvJqf5S
         xa1zw/bpy09Xo6ff6us1rGy5D+OWNH+5uZoKLDZPL9Svb8ulLU4WoSb9FnbtRcM9kPss
         CAPv1FotzAapRCeGo2imqYwkpQZCMHEJAOUZQ658XvLpOXzFDeEuih1kqVPnRu2++gCy
         lyLww+BnMoaHzPOsNCAvBFG8GBN0Ls1x3xLL8WoiiQViUwwRXLnx82VWrbhoHD8yXP/Q
         RE0A==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784951395; x=1785556195;
 darn=lists.freedesktop.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Auhbwa+a5TW5dJOagtosBZ5QlY30myaRTt31FDzvB8=;
        b=PnjQJFtUKH99KRojOWSIDYuUN0LlMUF8PhWvgucAo/SUKMt5eRHcX+3CG5oSuLk9T2
         aDW5LRs+WIwaD4KBFYsEi7bU5EVfcSDKmf/cvlKi1vfcKupp9hh2v1GD9uSogEozs1bK
         3Py3DUFo/z6vH0F/hffIUDGMJx8EA7nlMFulzHlIf4zRY2Ko5hDp6x0KSAWeO5Yc5yU2
         KAqrUg8s25pFLHVjXXKUaqgFw0tLcIDbZD1i676ul1xXaU5rv8o+FIPKO8YTk7sJvM1m
         Wmh55IKlkJ8hzkITnvI3ox+Z0/DKi117PjmnBZnmut15SfkYgs0AKDj0GT08hN7HBFSU
         UyGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784951395; x=1785556195;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+Auhbwa+a5TW5dJOagtosBZ5QlY30myaRTt31FDzvB8=;
        b=qnfAAgoKroGO5dfszrVsiXfDFO+iSWPK2kD7o0z/wfFHjWRl7M/nVKwuyQ2cwBBbWX
         dndIOOb0InE3rFP4CF8fL6izt8y/DEc0nP1B44vSFrh2VvwLcz9HVs81nZhxLwiXSh1c
         SUWq4mKvekBKziQlsAVkxi9mNOaluHFSt91lS5+NbGMfr96giI5DI5/S1LZlQmtmW2iA
         28TiuDyDcJbhvR7cJgE0f0yl3v2gRG5CibGX/33ATCivzU3ALCV+beCgVDH3KCepeL78
         Hr+9X2I5suFmZPJCyiao3voLu2BeYPm2193SsSMZLOhVS21rhQ8kxtYTEzRqT7qj+l7/
         5UsQ==
X-Gm-Message-State: AOJu0Yx5dNKr1YxxrHyQ9hpeyXlLMIGbYsbdiWaokUemfQQeugERLcYX
	YCZUdQ2aZRKkJMXEVkrfFxvmIwbWEFrB2FhN5SfQ0HSrCgnAiHsjAn4lSXR0/mjvdD6t3r5STOG
	86PGjgS2JwDbB7Ulk/zZFtuJ7J6Y07Qk=
X-Gm-Gg: AR+sD11iQ989eBoV/WeVQR+5jnLxJGgnTYqzrIVmvsGD6t8qowtvjj8uY5s9Lf1QLYm
	KLqkUlzpJGGRwUmyoUwLUcy8btz622oOALcUTiXXWQyJSsFJahyu8kHsffQusau+s8f0Awmrsok
	09MWdME2GrwVnXSfITMcdg0UArZZZKAG8KtWL14Jr5e6Fa1evSaOMELl//XChq/VbWG71TBE27u
	u2OQ0CQSKZuSXxV/71+h26rvxhJfQvt0/1UkS0f8rxlPfJQTy6Ii2Cm2PXSBHM14psFX0QkEisE
	L7Gg6FLiEUz3BFJzQRAAcm8pBpoe5sFqMv79PnyVSzy9ChQ=
X-Received: by 2002:a05:690c:84:b0:7fd:a7b6:8d87 with SMTP id
 00721157ae682-81f69ce0006mr3890967b3.25.1784951395636; Fri, 24 Jul 2026
 20:49:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260720215058.398210-1-lyude@redhat.com>
In-Reply-To: <20260720215058.398210-1-lyude@redhat.com>
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 25 Jul 2026 13:49:43 +1000
X-Gm-Features: AUfX_mzPtibcVs6rRbWkoM0g6rCCWwGuBSs4QpTCZpfNRuTtPlzDFCNiscVZkH8
Message-ID: 
 <CAPM=9txcOcnnxznq41z8+FA_V2BCqmRKFZBOt0oEhcHbBs8Fsg@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] drm/nouveau: Fix WARN_ON() from missing blend
 modes
To: Lyude Paul <lyude@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: S4JWV3WLX4OAEBUEIEZSYEKQSZNOQWWF
X-Message-ID-Hash: S4JWV3WLX4OAEBUEIEZSYEKQSZNOQWWF
X-MailFrom: airlied@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Faith Ekstrand <faith.ekstrand@collabora.com>,
 Dave Airlie <airlied@redhat.com>,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Kees Cook <kees@kernel.org>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Simona Vetter <simona@ffwll.ch>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Maxime Ripard <mripard@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Stone <daniels@collabora.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/S4JWV3WLX4OAEBUEIEZSYEKQSZNOQWWF/>
Archived-At: 
 <https://lore.freedesktop.org/CAPM=9txcOcnnxznq41z8+FA_V2BCqmRKFZBOt0oEhcHbBs8Fsg@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, 21 Jul 2026 at 07:51, Lyude Paul <lyude@redhat.com> wrote:
>
> Recently a change went into the kernel to ensure that drivers which
> expose color formats which have alpha channels. This would cause nouveau
> to hit a WARN_ON when setting up cursors, since they do support blending
> - but we never bothered trying to hook up the controls for it to
> nouveau.
>
> This fixes the issue by ensuring that nouveau always exposes a blend
> mode for any planes with alpha channels, regardless of whether or not we
> have control of the blend mode hooked up. If someone wants to add
> control for this in the future as well, it should be fairly easy to hook
> up with this.
>
> Previous version:
>         https://patchwork.freedesktop.org/api/1.0/series/170773/revisions/1/mbox/

For the series,

Reviewed-by: Dave Airlie <airlied@redhat.com>

>
> Lyude Paul (3):
>   drm/nouveau/kms/nv50-: Add .blend_modes to nv50_wndw_func
>   drm/nouveau/kms/nv50-: Introduce nv50_wndw_default_state()
>   drm/nouveau/kms/nv50-: Unconditionally create blend_mode prop for
>     wndws
>
>  drivers/gpu/drm/nouveau/dispnv50/base.h     |  6 ++++
>  drivers/gpu/drm/nouveau/dispnv50/base507c.c |  1 +
>  drivers/gpu/drm/nouveau/dispnv50/base827c.c |  1 +
>  drivers/gpu/drm/nouveau/dispnv50/base907c.c |  1 +
>  drivers/gpu/drm/nouveau/dispnv50/curs507a.c |  3 ++
>  drivers/gpu/drm/nouveau/dispnv50/disp.c     |  4 +++
>  drivers/gpu/drm/nouveau/dispnv50/wndw.c     | 40 +++++++++++++++++----
>  drivers/gpu/drm/nouveau/dispnv50/wndw.h     | 11 ++++++
>  drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c |  1 +
>  drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c |  1 +
>  drivers/gpu/drm/nouveau/dispnv50/wndwc67e.c |  1 +
>  drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c |  1 +
>  12 files changed, 64 insertions(+), 7 deletions(-)
>
>
> base-commit: b0a652436b892eb9a036a031b33099dca036faaa
> --
> 2.55.0
>
