Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD2BCC982D0
	for <nouveau@archiver.kernel.org>; Thu, 17 Sep 2026 22:10:15 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7B76410E4E6;
	Thu, 17 Sep 2026 22:10:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="EcZ1oSDL";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 433B948284;
	Thu, 17 Sep 2026 21:52:35 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789681955;
 b=y3SNm1s8MwqdU2p88zNuwfOxPqL6QCN3F3/8+en/CRaglt8Gk0fJc7UZy2z+HIl9kNRtL
 JSxNDyfz3ZP96sA0jdIDXKZfVKVrVnraX4GlaAG4LThiMfdd0bfgu0zNyBEiOGYkO83UZt3
 nK+G1x0RDgtJIbZQChTGKIyQyagk7wHI2mzJDeA+/VN9pXk7gPyTIujiiKCNfWpxLCheZ22
 ab9qqdjwfT34ik61ajSnKa9XEQ4WP2d16vw6A0AUXYkFSXPuQb+EcTzHgaAb5e5B0VduRn3
 Dby/kToXeoHvbCXCVAOtQF1yR+rJ1RSmNep7XZldzV3jqSuLcnVIV9QSAiqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789681955; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Ud4TYwbWHYsVK5PwKqeeWvh3vyT9zE8Y/zwj3gXwLMk=;
 b=YdTuLtFcC7ftW1FRrHoJJyDX7knkVLRftTDD6eCBLA4cxdv97fJZIo2o4CPbMNTxKACsA
 CTmW/Cm81yoR9GuJNT/f79n3Ay/8sa1Xqf0tcMX1qQziMKORgX86npAu+c+ZqVikES44ob4
 a9kL4z8Tb1KNAAhw18E7IuA830bRWmRgOYsUr7zl4fiooRpq4GWR6JZ0VNnEVtvmXAkU+L1
 5/Zqh98Nx4J9sX9EkzfvcGOg8vcLG61RO4iZTi1RkZFEVURbm7Q+dUgUvK/RBkc8iW+XekR
 4m2xxUiNjZn10jzmYEkkzecFqLwqntBZBzCIlcRo9f9vg1fm+d2s/PFI9Jqg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B9CA448233
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 21:52:32 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9896D10E4C5
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 22:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789683009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ud4TYwbWHYsVK5PwKqeeWvh3vyT9zE8Y/zwj3gXwLMk=;
	b=EcZ1oSDLZAStU9v/LLLJAZtazjMdGRvJ678CiDpmIP/LXH7v2BT4NFxmnIcTGGZGV6s7E3
	p1YfS156nQxlOWI46l726nQfRBhW1CZmoQEHKFt11MU42dsfWc1C1zmRcrrhMxBL2IsUsG
	Pb2ho5ocUbvdTJHcmxZeMty9DgHYY94=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-387-ex74Eb8jPCmX54DaGCarEw-1; Thu, 17 Sep 2026 18:10:08 -0400
X-MC-Unique: ex74Eb8jPCmX54DaGCarEw-1
X-Mimecast-MFC-AGG-ID: ex74Eb8jPCmX54DaGCarEw_1789683008
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-912330dd4dbso29469226d6.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 17 Sep 2026 15:10:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789683008; x=1790287808;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8z7jGkncFvYX44ONKGgmNu9yUifGbhbRMAl3u7dsO+Y=;
        b=fSWlV7ZT9PG139YBF32jDzT/d4CDvFeV5u2NZuqPmlhHA/8MIdqCfmyEGv0w+7oYyw
         11NBDfXFrgg9tttWFFX7sMAlHxFhu/GE1mVGdbdOTGApgxJZUGYo3f8z050DuKONzJwt
         LeW2anhO68dfXPMWKklLKnmjjDmIRmpqEpUoLidtD2zSUabjA99e9sf/ydvFdOpXb8iv
         zrrLzN56gudm0W6kzBIP98hxarujwBGPDM/ER9ky3vZPFVumYsgu0u4L/7XPnjYTwGGW
         F+YsF04pgnlNS+WGd4w1y+uEYh+DN8DvKlPtDNTTMZceoUQ7Kv/deKtkQASvUu74dJr9
         x6ag==
X-Forwarded-Encrypted: i=1;
 AKwUvBzCUf0u1VnIJM391Bptse+j09IOQy/YlgmXGUL/eaqlngVVAwkqw48HkEnWfLcu1IX9yEjdVKNl@lists.freedesktop.org
X-Gm-Message-State: AFuF++lG74KW3R5rQ/JndgoCqiC7lPP778oF2FgxBxSvJfwBrBPaod6F
	bVljmyzPnRnK/6bWeo6aQRMfg7X7JIuxNRq0rxMm8GXmf1Ujh+sgq2ZwtUnK1HtKRGysvjz0+MY
	2Nv/q4iTvbeMyCUciR8k7p29fqb13MT+XLX2wqg5bPk8X+X8vH0C7L84OwwirAv4h6Oc=
X-Gm-Gg: AYBFou2RO/kq0BogmTiE9QOmalQPaoe+jT2Bp19fktf8yyRSvyUWtGsy5uKoV5tQWce
	wi3U3xqZef1cn7Rjm5Ziw9DXEc+kUEhpINPOga357RhZ1+zI26VtIUXsW7cCsP25HjeUjVMkx7p
	zcl3vnyGS9ibh1aBo9HjPg+1lCoHqrd3vE4jPOYMlF+NW0J6VqzDP2tfhnneT2ATbt+K+b8AkXg
	5ZEoJBP8C1BJYLJqNH2CO4dHx85TeXLamlqX5r+NDZc6EUbHQh1wCUWCz8MalQR0339PsnZeSx/
	b8ipRva/5PQA5piNHfhvM8VtTSqVqwx20wDqtbYzmXhLobBVyoJhV34D+id16hmLQlLT384c
X-Received: by 2002:a05:620a:1a17:b0:93a:1091:e692 with SMTP id
 af79cd13be357-93bdbaa321dmr92011685a.7.1789683007868;
        Thu, 17 Sep 2026 15:10:07 -0700 (PDT)
X-Received: by 2002:a05:620a:1a17:b0:93a:1091:e692 with SMTP id
 af79cd13be357-93bdbaa321dmr92006185a.7.1789683007243;
        Thu, 17 Sep 2026 15:10:07 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93b781dfde3sm572372785a.12.2026.09.17.15.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:10:06 -0700 (PDT)
Message-ID: <ff3015a1c4b08088b0638b00670e86d612a27978.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau: Fix memory leaks in debugfs and hwmon init
 error paths
From: lyude@redhat.com
To: liupeng <liupeng01@kylinos.cn>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann	 <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter	 <simona@ffwll.ch>, Guenter Roeck
 <linux@roeck-us.net>, "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
	 <dri-devel@lists.freedesktop.org>, "open list:DRM DRIVER FOR NVIDIA
 GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>, open list
 <linux-kernel@vger.kernel.org>, "open list:HARDWARE
 ""MONITORING:Keyword:(devm_)?hwmon_device_(un)?register(|_with_groups|_with_info)"
	 <linux-hwmon@vger.kernel.org>
Date: Thu, 17 Sep 2026 18:10:05 -0400
In-Reply-To: <20260824090505.49913-1-liupeng01@kylinos.cn>
References: <20260824090505.49913-1-liupeng01@kylinos.cn>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Mva6S30jtblNCF38pB81dLGTBILizASIWcsm5VUm-Ys_1789683008
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: GNIVVTHBT4PPUNETN2VVSLI7J7ID5AEU
X-Message-ID-Hash: GNIVVTHBT4PPUNETN2VVSLI7J7ID5AEU
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GNIVVTHBT4PPUNETN2VVSLI7J7ID5AEU/>
Archived-At: 
 <https://lore.freedesktop.org/ff3015a1c4b08088b0638b00670e86d612a27978.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Mind adding the proper Fixes: tags and Cc: tags here?

On Mon, 2026-08-24 at 17:05 +0800, liupeng wrote:
> In nouveau_debugfs_init(), if nvif_object_ctor() fails, the
> previously
> allocated drm->debugfs is leaked because the function returns the
> error code directly.
>=20
> In nouveau_hwmon_init(), if hwmon_device_register_with_info() fails,
> the allocated hwmon structure is leaked because the function returns
> the error code directly.
>=20
> Fix both by freeing the allocated memory and clearing the pointer on
> the error paths.
>=20
> Signed-off-by: liupeng <liupeng01@kylinos.cn>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_debugfs.c | 15 ++++++++++++---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_hwmon.c=C2=A0=C2=A0 |=C2=A0 2 ++
> =C2=A02 files changed, 14 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> index 47d5579c568d..88223931f382 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> @@ -295,13 +295,22 @@ nouveau_drm_debugfs_init(struct drm_minor
> *minor)
> =C2=A0int
> =C2=A0nouveau_debugfs_init(struct nouveau_drm *drm)
> =C2=A0{
> +=09int ret;
> +
> =C2=A0=09drm->debugfs =3D kzalloc_obj(*drm->debugfs);
> =C2=A0=09if (!drm->debugfs)
> =C2=A0=09=09return -ENOMEM;
> =C2=A0
> -=09return nvif_object_ctor(&drm->client.device.object,
> "debugfsCtrl", 0,
> -=09=09=09=09NVIF_CLASS_CONTROL, NULL, 0,
> -=09=09=09=09&drm->debugfs->ctrl);
> +=09ret =3D nvif_object_ctor(&drm->client.device.object,
> "debugfsCtrl", 0,
> +=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NVIF_CLASS_CONTROL, NULL, =
0,
> +=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &drm->debugfs->ctrl);
> +=09if (ret) {
> +=09=09kfree(drm->debugfs);
> +=09=09drm->debugfs =3D NULL;
> +=09=09return ret;
> +=09}
> +
> +=09return 0;
> =C2=A0}
> =C2=A0
> =C2=A0void
> diff --git a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> index 726397ab035d..ffbe7f542ab0 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> @@ -697,6 +697,8 @@ nouveau_hwmon_init(struct drm_device *dev)
> =C2=A0=09if (IS_ERR(hwmon_dev)) {
> =C2=A0=09=09ret =3D PTR_ERR(hwmon_dev);
> =C2=A0=09=09NV_ERROR(drm, "Unable to register hwmon device:
> %d\n", ret);
> +=09=09drm->hwmon =3D NULL;
> +=09=09kfree(hwmon);
> =C2=A0=09=09return ret;
> =C2=A0=09}
> =C2=A0

