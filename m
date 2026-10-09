Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53DCDCA9EBE
	for <nouveau@archiver.kernel.org>; Fri,  9 Oct 2026 21:35:23 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 65F381122CE;
	Fri,  9 Oct 2026 21:35:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bFmsylpo";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A795548A13;
	Fri,  9 Oct 2026 21:16:54 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1791580614;
 b=oMNaCdyoivMoQ+8WNb2J8F3rBVx+xVKcJlSF+q2Daw5MCeARa+AU5eTPCkLobe85F8/Tu
 gMpTGlIf5ZR/A3GZjUAP8rHecMTGaWdFRR6XB4ONVU7JhurhVLPcIDHhZz+B4eu8JgQFzjB
 IkuzgB8HeW2Z/3z6MrSl0/K7xTd6sSuQos+l+lKm215FgiOVwLsZn+uEVnadrVFUggM5W+0
 iPGLF6drTcgYuVrztpuq61fmzBAStGJ+g3po4k5VW/09uHZ4b+dEbZDAn1AIi/oRJo2m/v9
 in1zjBLft4mt5+SoO3/H6AbObtZRQypEmV0qfvkv0+JwfxTEKnnosfbapKxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1791580614; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=6R4EFUAHUDCX8d6aulmc7ko33547TuiAQEh+npBg0W0=;
 b=APvpnfoWZpEGC6eOkeQs18veV4Pjon+gQ6+8k4KMg20Wihw6I5ttDchYj+sXzwHQooyrW
 ODUnIrZr/0bGWJIjWXN7A7+ktsDVDVg0jSK68VUnCxpF5gF+oppWiTIDjwV9v/tiSD4hcw0
 tTOu+O3pnEiI1IVqdDBEPuB4R1LTZ61yt/YzX3Hvy9rfuJG2s0aCyPIIUY3DPMjp9QoJ9cv
 xsNWwiKuc0a47/Utt3YwOCUK+SFCSvZACLXLrhx4A0ro6aa++UAMbHVS6gnFBdGDZ8VpnqS
 ZwwP0GkmFK23Ev/HLPq4I3/z0BzZOllUbipueItCNK+yYGWsjbnWybHwOZRA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 08E72489E7
	for <nouveau@lists.freedesktop.org>; Fri,  9 Oct 2026 21:16:52 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6C27D10EB56
	for <nouveau@lists.freedesktop.org>; Fri,  9 Oct 2026 21:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791581717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6R4EFUAHUDCX8d6aulmc7ko33547TuiAQEh+npBg0W0=;
	b=bFmsylpoBcEZBKa+Qs/ey1CAicj6oE2cWSdfUQbxH1MpzaQDMtEuPryr65IIS5fwEmNeZt
	T3rRCUNmkuxqnHJCqAAQmaQHaBtY7szV1WSj7OkBbWSt9TnO8ZRKc2CevYv4zM5BUvFJ10
	1psATC33qS03c+mymk4aW1sXdC75P3c=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-U877zQxtMTCTyeh8ddSLzg-1; Fri, 9 Oct 2026 21:35:16 +0000
X-MC-Unique: U877zQxtMTCTyeh8ddSLzg-1
X-Mimecast-MFC-AGG-ID: U877zQxtMTCTyeh8ddSLzg_1791581716
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-53390e79a19so2769291cf.0
        for <nouveau@lists.freedesktop.org>;
 Fri, 09 Oct 2026 14:35:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791581716; x=1792186516;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NZbd6xFkyNScCfIhKBOuLvqJ7Rh/HkXO4uKgVfA+mJo=;
        b=f13Dv/Q28esUxqmmcN5z2R8O9BwsHDx4z1c/PbWwBvsHg+9JfRyP+iksfITAtPj+L6
         LuL5Crj5diFePHz5qozcq3jdTvqHcr6QGcPF5DdCfvsILq9cXrdhmePY8xQZYXoYV5n/
         4CEgRLGbyHEVUYbTh9Xm6VaIo2uPSGSw5ii0NxB9chgtkbfmzn69u3/Obal5r+2jFYPO
         MvRZFc/5uM0rjIG2k/7RLIYPjtYXw/evrjHDV2ar8mdHnZT1oy+JnKA71x9IZzKtWImh
         S23BvOj31wFuRq8hMRYMYhdg48opIAxxiAlcuesRyHwlOtCPedzR1EogtPj4fg8r5t+9
         oDGQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwupIfkqmhKlWeY07J8+spzR5iwl4bvK3/I37f+IZXgB4A7yCLRjGF4Pwlp0dRoyKDiaQjN7gIP@lists.freedesktop.org
X-Gm-Message-State: AFq9FYJEjenTWqzOg3T5DyOy0KkrgrtwHY5beiq3R3ksaSR2mkma/hS4
	NsmHXL9WbtmBLKZWQlNmAuk7LAP/uUCxoM0+MAvxtw98rO9JaxMpYInkE2wlc6zBFJGmwcHLg7V
	GKwnUHwJYC39yVPVC8Qbzd7/RbrKX1XA11F3z7tpmR5xbOLSRlwMFLHfH3xfI/Zz8zRw=
X-Gm-Gg: AYBFou1h617fA/Nodesj5Q/8RIMHHLfBcTK9CGLDmVo+1rJFVc4d1pDWQJc7vRBynsE
	GX/ZcpIahU2LXdAwq+9TCSjedi0o48D16GKE6kroDW1LLh0CkFPPQIsd+OXM8DQ8PqvC3hTLVrr
	4GfRsnUK5e9KoVJ11GGOAhrSmTAWs6frf55TGxrkPJ4G4nCt9BEZBwJyvwOLI6/t+gqVXAcDMIS
	tOjutQqrfZeoAUUOObg9UVk6WIJcMZOhug+Kv0QEAuCtMiltv9EjS4LQEjIRU1kBAVMdQ+lnQqJ
	0lvlKv7guaDCKJJBSOV/YqJDxX7o1OsO7L1nuSEfNeYwmauYrbjYeJH+Q01oX2d2b+aL6+0=
X-Received: by 2002:a05:622a:58c4:b0:535:a5fb:67fc with SMTP id
 d75a77b69052e-535a5fb850cmr34635031cf.72.1791581715805;
        Fri, 09 Oct 2026 14:35:15 -0700 (PDT)
X-Received: by 2002:a05:622a:58c4:b0:535:a5fb:67fc with SMTP id
 d75a77b69052e-535a5fb850cmr34634721cf.72.1791581715415;
        Fri, 09 Oct 2026 14:35:15 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5359b6fa0f9sm27073771cf.8.2026.10.09.14.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 14:35:13 -0700 (PDT)
Message-ID: <25778dca265f58185917c5948490e76184c778d3.camel@redhat.com>
Subject: Re: [PATCH v3] drm/nouveau: Fix memory leaks in debugfs and hwmon
 init error paths
From: lyude@redhat.com
To: liupeng <liupeng01@kylinos.cn>, dakr@kernel.org
Date: Fri, 09 Oct 2026 17:35:12 -0400
In-Reply-To: <20261009115151.13877-1-liupeng01@kylinos.cn>
References: <ea9a1d374cf3127e5047bc73807ce821022e026e.camel@redhat.com>
	 <20261009115151.13877-1-liupeng01@kylinos.cn>
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: m5J6O6FPZEZyBadLABCpXJEk52U2sCNWO9b8U4T-lRg_1791581716
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: HW7EZ4KQDWGORYSM3RAYFGVR7W6SILV3
X-Message-ID-Hash: HW7EZ4KQDWGORYSM3RAYFGVR7W6SILV3
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: maarten.lankhorst@linux.intel.com, mripard@kernel.org, simona@ffwll.ch,
 linux@roeck-us.net, nouveau@karolherbst.de, bskeggs@redhat.com,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HW7EZ4KQDWGORYSM3RAYFGVR7W6SILV3/>
Archived-At: 
 <https://lore.freedesktop.org/25778dca265f58185917c5948490e76184c778d3.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to drm-misc-fixes in a moment

On Fri, 2026-10-09 at 19:51 +0800, liupeng wrote:
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
> Fixes: b126a200e9db ("drm/nouveau/debugfs: we need a ctrl object for
> debugfs")
> Fixes: b9ed919f1c8f ("drm/nouveau/drm/pm: remove everything except
> the hwmon interfaces to THERM")
> Cc: stable@vger.kernel.org
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> Signed-off-by: liupeng <liupeng01@kylinos.cn>
> ---
> Changes in v3:
> - Drop the extra return in nouveau_debugfs_init() as suggested by
> Lyude.
> - Add Reviewed-by tag.
>=20
> =C2=A0drivers/gpu/drm/nouveau/nouveau_debugfs.c | 14 +++++++++++---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_hwmon.c=C2=A0=C2=A0 |=C2=A0 2 ++
> =C2=A02 files changed, 13 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> index 47d5579c568d..338421e52f69 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> @@ -295,13 +295,21 @@ nouveau_drm_debugfs_init(struct drm_minor
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
> +=09}
> +
> +=09return ret;
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

