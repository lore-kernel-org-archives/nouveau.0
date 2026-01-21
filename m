Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D990C44506
	for <nouveau@archiver.kernel.org>; Wed, 21 Jan 2026 20:39:51 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8E32F10E87C;
	Wed, 21 Jan 2026 20:39:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G/StD5B/";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 45B31401CE;
	Wed, 21 Jan 2026 20:31:01 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769027461;
 b=C0e0vgbv9nmKwqvPYMn6jlT+pdo5i62xVxNpRlIC70OkyZGRbHFtgSduLTCGbl6p+sg/3
 Dej8CESQo40slqk5NTQVK2xZ6Jf0YTLXHmkgFJaHb5zFAHdGJEfIxGhreHIFViOgg2APeo9
 tX4VuB75xWafeOHKKwDk/LzaR4ZiFUDkBiUsGP1qvChZ2SeKRsajgguQjohLGZIvmXUPb+u
 G3g9SdqYlLtgjkDAN+CJgw9wUSUN42oSlkFPSrmQWHG8mVq0izuwUpw9k2LIY4njLIEj+hp
 xRe1xuwytb+ocdaVLH8ElTg/Y+9Kk9yUQ9fqq5ulFEt09xhmBLQPVDNbniBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769027461; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=IsKbMXb87YbdFAxJ8k3qkHdu+oabtMAOpKXMPv5pVTM=;
 b=jsOqGuWt4NpyRkIQevNVf/tp3J3QppLSaePjaGqBmWldwPXSDp3Ziqjk9nn468tGW4kW9
 dWgEsH6Bc5pW5l8N0k98BL0EKRd/CBqMKj3f+x4QrbE7QhOglEet7TF5rGAQsLNDProhRit
 5sENrF0ZTIdUJQGYfzDMAxf31isuKDp9kf3r0Yl6GEeUf7l490fuUaC0VoVQY0ZJViicJh0
 GRqz0kF6NQcXQgVqyw1+o5YkiwKafbVmUaFFmbnIE10EzUjsRxP982FB5Hc7mJWencDvCIe
 5GsVyQefwHRLzW7ALIV6KkipLN45mB+kfWc5f0pJUY/m/S/Ua9Nxih5rI+yw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 3E5F4400A8
	for <nouveau@lists.freedesktop.org>; Wed, 21 Jan 2026 20:30:59 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4F74B10E25C
	for <nouveau@lists.freedesktop.org>; Wed, 21 Jan 2026 20:39:46 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-88a288811a4so3184426d6.3
        for <nouveau@lists.freedesktop.org>;
 Wed, 21 Jan 2026 12:39:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769027985; cv=none;
        d=google.com; s=arc-20240605;
        b=MPKYMIKgtCJncO+IxrEkKgN02SuX6X9sqX1kmvZ0yTdmicUwjK5GNO1XUq0TgdSOZ1
         UAawvDYbIUbsROJ35zdK1vR0tjgVbZWK1H6hcJu6CGweU9piAFsQaOlLS61DmNHGhM4H
         21Je0jiRPksBvFk4yQhSOezBuz9EvwQv8p6TS2lvCt//6sHb315iMozTNUzvwR92pAMK
         feYPmMsNywlUuVPLiQy51J0k1BtZYi3+Nqh8t0XMHnzfgHLRv2Gc3jFRTDN2hTGJZaYw
         C+im0IisFdqw4wz3d1LGsYlbbNxUGtbidHKtu00wu9XPxMFNQn6W2nM5UoCcc8WN01+J
         +2rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IsKbMXb87YbdFAxJ8k3qkHdu+oabtMAOpKXMPv5pVTM=;
        fh=6CRRsqO3mAdaCRCwi1aBRD8sy5G12rSlutr99i22nT0=;
        b=W/Mm9fmHSGYphef8SJyqmQHymNZHPp/xmH9/pME+RuE971C939YHTex5JC5l0fwMdf
         ICNxyQBH2IdwfBsmG0je1Xz2EMfrwmngKTjScTb9VtvrUwvG1lieN76GSvXASqrrrtiA
         M8TWedycMlBwhvqGLrV+O5tNV7R/VpnbQktBpIaLYCFFzMLtXc3FVWGdW6M9jCcE6/Mv
         iR4gEcVObhOr7Y/KjViDsAKp83JfZURWkyiAPbYIjGl0KE9AnA99xuVTdoIYpiZ12iOi
         qv8LIX5qEopeP+ajYZmbAYJf4zwOdwKCecK6yYBEGPv6lN47hu4uXqwCDkf2sVgMjUyG
         IlEQ==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769027985; x=1769632785;
 darn=lists.freedesktop.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IsKbMXb87YbdFAxJ8k3qkHdu+oabtMAOpKXMPv5pVTM=;
        b=G/StD5B/TYER3g3hk8sGJgHVPBLNGr5zybb153AeyE+qTt+Q3dvnDsup4z7NcC0WE6
         DtPuQChiC4vX3McLQV+iwJDu0iAdArG0N4IjpIy6zQr2cUseQkh8aaKKPgcicprmUMG1
         QB/11iJczPDyuSvCaJADKPZo7M7/rjfVrCnvhk1vkNYf21lEt0WUN+87+o1TnaKTcBDE
         hrXGA/KehH7VAK8Jk46rv+pruCiSKGDVHuaG3pymsNFKeKRmRdSJjgjAn6Q2iqmvu277
         rwJWYOwyjLkR/PPGECdq7X/YEj8QNjHA2T7WyOMVTlR84C5+P4JJebvW5+3e+GjNrJDv
         y4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769027985; x=1769632785;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IsKbMXb87YbdFAxJ8k3qkHdu+oabtMAOpKXMPv5pVTM=;
        b=I9HRbFGhO8IbZ9heqRGonCFPCL5NTGyeoZhq47qzUcgfyLvIMsuzEaTHnQ8s67tnmI
         XbHQBHeSKl6ebM3qeB+DEirZgEyaIgRywYpBNLmP6mT4iGuv52wfj8FsCQYlRRuC8/dO
         2qoBtDOoiSbzteMi9+VmGP5aQkyp7lgNWQf8KgnzUJFuU204K4HzvJ9WbpLeV7mRPsWK
         H+YYLCh3t5g/T+ituo6VJTyLz3NZROQx7xA4r3Me7RuJ/M1BQlydSehC9aNEzSlSSPWn
         XV88tpIPFj4tm3cc3yeUVKR3MNg5sGuUy0GJNfBOLKrISGDoSo8Vn6VN6oXSokdF7f94
         Dkng==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrPsIrPQIkTHreF5T2FpdYdfqifl9Hr00jp38hwbWmxHZMk2f6tJqz9mnuCFL6OD7KwZK2gIr9@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIBnDa232jJClvDzdRtMTIaicRHSnkZlJNJlRk8cTwnnUtwa7A
	ejPHO1ZMNLFgtJo9BU7kwiUYaOgaZLOOwEyYahZK7XEE+Ogvis3r+w8d9GRlfXoSpB4YGdlJIBi
	GEZeaaDO4p7hVeMndEb1e7R/IWOUraf4=
X-Gm-Gg: AZuq6aLS6GnWxhvjWDp6ppM5RbLJvkoOGLAD3KwyR4pvGUCdIWG1knoSnC5iYiyJLJM
	kBWEwswK/pGC0Bawt9gm12tBHpTgGR92rM/4Ra9+s7A+iuyafHogSA4bg28FLEgXLpcPOH08uat
	H6hF/BGb1X4MRCZ0i1foBoNV8muZjbj/143n5DboV2gh4xPsT0lm6naKeYHXxCD4cBRUs7+seze
	SuyFojj+YLFHP0Qn8RswNlX/k8QlenFnK8B0EwDE0MkMuzduYpH6w5UhfTDtfd3/z+e2glGKWA5
	DgiKMP5mGxc4QxiOkTdEFCrSBb84PWsd1+mo7E4QHmenOndgRuhkprI=
X-Received: by 2002:a05:6214:2681:b0:88a:529a:a53a with SMTP id
 6a1803df08f44-894638f61camr101162636d6.51.1769027985195; Wed, 21 Jan 2026
 12:39:45 -0800 (PST)
MIME-Version: 1.0
References: <20260121191320.210342-1-lyude@redhat.com>
In-Reply-To: <20260121191320.210342-1-lyude@redhat.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 22 Jan 2026 06:39:33 +1000
X-Gm-Features: AZwV_Qh1FXsbPqa-FcyvA6O5iQiCl9rMUe_JWAej1pc4cnRhG7fKxVLa5VZf6Dc
Message-ID: 
 <CAPM=9tzrCNH3DgRyJ0=KkeQ+=ENtev8UOYLXqHO+X7uK93dJNg@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/disp: Set
 drm_mode_config_funcs.atomic_(check|commit)
To: Lyude Paul <lyude@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: IWC7E3KYHJJJPWMCZGZUZLDY77HJTRG7
X-Message-ID-Hash: IWC7E3KYHJJJPWMCZGZUZLDY77HJTRG7
X-MailFrom: airlied@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, stable@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/IWC7E3KYHJJJPWMCZGZUZLDY77HJTRG7/>
Archived-At: 
 <https://lore.freedesktop.org/CAPM=9tzrCNH3DgRyJ0=KkeQ+=ENtev8UOYLXqHO+X7uK93dJNg@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, 22 Jan 2026 at 05:13, Lyude Paul <lyude@redhat.com> wrote:
>
> Apparently we never actually filled these in, despite the fact that we do
> in fact technically support atomic modesetting.
>
> Since not having these filled in causes us to potentially forget to disable
> fbdev and friends during suspend/resume, let's fix it.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Dave Airlie <airlied@redhat.com>
> Cc: stable@vger.kernel.org
> ---
>  drivers/gpu/drm/nouveau/nouveau_display.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
> index 00515623a2cc7..829c2b573971c 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> @@ -352,6 +352,8 @@ nouveau_user_framebuffer_create(struct drm_device *dev,
>
>  static const struct drm_mode_config_funcs nouveau_mode_config_funcs = {
>         .fb_create = nouveau_user_framebuffer_create,
> +       .atomic_commit = drm_atomic_helper_commit,
> +       .atomic_check = drm_atomic_helper_check,
>  };
>
>
>
> base-commit: 68b271a3a94cfd6c7695a96b6398b52feb89e2c2
> --
> 2.52.0
>
