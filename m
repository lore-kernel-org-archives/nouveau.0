Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C1B0CA6016
	for <nouveau@archiver.kernel.org>; Thu,  8 Oct 2026 21:45:53 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5670D10EA53;
	Thu,  8 Oct 2026 21:45:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QmTvg/jS";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C9AAB489C7;
	Thu,  8 Oct 2026 21:27:28 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1791494848;
 b=hpdL+61uFUJ4Ujt9SwET6LmNCnPvM6y1BRAuVHmR8MaXdS5cFepnbesInyoutvzC3rqK6
 JGVgFa0Flq3V646VNQOpB/O7QH9YqJj8/bgK2zy4YYaFwNrLgyxwM6cr/lP+9XNhZN5ws05
 O33eNmZieNmRagwNQu0PVpN0BgTeS3YpCGMDg0kiKV/cZgWEg1sa6L0KFiyYCJEoO7d2W6Q
 cElG6LD2oWOVuJDgSa5CfWTe5wSYHyqF64b/QVuk4Hw5xyDmrTkBYWKApuChku54WB7aq0/
 e3795tv/ktDYgt/NXXeD8Ulp5Z1DJstjTqdy2S1rCoJw7qKh8XJx7WalGAGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1791494848; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=EyNzZz6RcBzpojw9dgyUDFR/P3xHcOkXjGk7Z+KkOWc=;
 b=dz2HyRUC8B/VqJS9Aqx2mWt2I4KSmN0sHohxaCX0sXjD1Q5D3XqQB2MoubibkH/SR7KhR
 M5HJ4mmpKEX3HThKJ+6sLt/7OD9bE3dKZSowUWMYkEu1EFo+FmjndERIAFq/iqhM0a0UXAw
 vm0tOLkcZqUaHlRsed98ENJaEvcIH8iPFRwHrbhtPy1FqP1uBtdodAsg8Jg7eCM6Oob0aTo
 RqGK1axbzDG2MCw7ipXXlSQ8o898GzLnn2/27oy0VCAqddHocllasfGxxK9hJsWq57gCwMs
 +opcF3INSVMz1IJ0T+8Cl+U+AWGlPEJcWVSKOugKAiLo5iRfwNDTVg3z1jKw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 622A140634
	for <nouveau@lists.freedesktop.org>; Thu,  8 Oct 2026 21:27:25 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 88A5710EA47
	for <nouveau@lists.freedesktop.org>; Thu,  8 Oct 2026 21:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791495948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EyNzZz6RcBzpojw9dgyUDFR/P3xHcOkXjGk7Z+KkOWc=;
	b=QmTvg/jS2vRNBIv851kxuYwA2VyI68I4HGymtN4JDcFYnK4OpoZvjylBxSSc8YQCULaezf
	Hx0e/MqHNiZU4c7vZdP9BDqQMGC4tzHAog7cANr3w+R7zgJyI2MUtnCQIUh9QBvagmPFmI
	Gy2YVrxbHOd1yoAFl+4R8mk0Gjsk//8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-118-RqpEUaG3M3O4nMnWCtGunA-1; Thu, 8 Oct 2026 21:45:47 +0000
X-MC-Unique: RqpEUaG3M3O4nMnWCtGunA-1
X-Mimecast-MFC-AGG-ID: RqpEUaG3M3O4nMnWCtGunA_1791495946
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-9179d9cde17so61012766d6.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 08 Oct 2026 14:45:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791495946; x=1792100746;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JS+En9JyGsTr3AjbcaJ6blNY5U2s+JVwhjESLMBOqZQ=;
        b=e7rbcS3t/nhgRT5TKtXrQ76uA8e0kHzTdc04lzzK37+laG0wYETYKgFNkPIZwhJuQD
         bLSWwINW36y7ZQuApF2Yf+yAwgENCN7Yd/OtAETP8kDBomfzfEq5VmYt17cGxanlzS2X
         LP5bb+52WoH0XFeh8zN8glnIOFptk7BdUR8NQH0AcYb90DxEb/4Wrr5mMB73mBix4VZC
         4XPajsfcUlOMC4cuEJcxuh9VuMQeYlNtALE98d+vYKhFW2szmHErIRfst6eKFS5h8Igg
         z03HM8jqt2VH/2CyInU8voiPd/xTmF5EtXJUtSfllCLjWBowvBfqmXJmNW0yPnQIZolf
         KTHQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwiW3zfPQkTiafRV9UkEcsz23YFFHSQtkyKq+7g/J0LswCqZhvsBl2bpOgHRR5KalVwpXQA4qLH@lists.freedesktop.org
X-Gm-Message-State: AFq9FYLPd1c3OvQSW2njRUjnCAW00Qs9+dRP3RmrwcggTe7NlBTgjVAp
	pFC2cG/udewJNXvAyqJb3Bmyr44wg/i7tjFtmXeO/KIy2oKr1VWl+284exniGr/7X4Ve6cbrheP
	WhAGgNIPetvNjdvhaKfxWKxkM7H2N5+R3dU4BO9f0fGRvkwrD6gQ3TFm49ekWVGpq1IM=
X-Gm-Gg: AYBFou0H3mYj+bRZCoedQYihag9Vudle/c/wG111UP5bXbWUs7f/Fg5X2gtdtCmW7YV
	Gdly4djN6mR63kDbw2J1u5VGQvF3PnCNYE6xJeOqYQbuGUexXoRSXaZ7PmQ7zlBcnJZrukkKVIY
	3xH4BC62pG2NIYG+wj2dLdtGzl45U4Yp+beH7H5YnjmU1BHQ8N4vz8O94FkqzGxqk2n2dgWBnkK
	4BLdFVuBgfYefBxlm4Ji0WkC6++VBqQ3g17dVKEy+BqS42occ1vv84yA14Bxqs/kcx/WvJ0CPPO
	BlmRngei+boszBDkXTYFzB1eZB5aNDThyRjoBC5M4NHTO34XJjIaNK0QDfQ6glsWGyowS30=
X-Received: by 2002:a05:6214:1d0d:b0:918:d743:fd92 with SMTP id
 6a1803df08f44-91b555354f7mr894346d6.24.1791495946475;
        Thu, 08 Oct 2026 14:45:46 -0700 (PDT)
X-Received: by 2002:a05:6214:1d0d:b0:918:d743:fd92 with SMTP id
 6a1803df08f44-91b555354f7mr893776d6.24.1791495945817;
        Thu, 08 Oct 2026 14:45:45 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91b550ca9a7sm949466d6.38.2026.10.08.14.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 14:45:45 -0700 (PDT)
Message-ID: <ea9a1d374cf3127e5047bc73807ce821022e026e.camel@redhat.com>
Subject: Re: [PATCH v2] drm/nouveau: Fix memory leaks in debugfs and hwmon
 init error paths
From: lyude@redhat.com
To: liupeng <liupeng01@kylinos.cn>, dakr@kernel.org
Date: Thu, 08 Oct 2026 17:45:44 -0400
In-Reply-To: <20260922044044.21442-1-liupeng01@kylinos.cn>
References: <ff3015a1c4b08088b0638b00670e86d612a27978.camel@redhat.com>
	 <20260922044044.21442-1-liupeng01@kylinos.cn>
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wF-DZ2EY_RIkMQaPDyVaHoNBf3i2oXF7tOFcEhCWF4o_1791495946
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 3B5JYIW6EGQYKZ32F2QZHPQOJI5LMSUA
X-Message-ID-Hash: 3B5JYIW6EGQYKZ32F2QZHPQOJI5LMSUA
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3B5JYIW6EGQYKZ32F2QZHPQOJI5LMSUA/>
Archived-At: 
 <https://lore.freedesktop.org/ea9a1d374cf3127e5047bc73807ce821022e026e.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

One nit-pick below:

On Tue, 2026-09-22 at 12:40 +0800, liupeng wrote:
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
> Signed-off-by: liupeng <liupeng01@kylinos.cn>
> ---
> Changes in v2:
> - Add Fixes: tags for the commits that introduced the leaks
> - Add Cc: stable@vger.kernel.org=C2=A0for stable backporting
>=20
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

^ We could get rid of this extra return=E2=80=A6

> +=09}
> +
> +=09return 0;

=E2=80=A6and just return ret here

With that fixed:

Reviewed-by: Lyude Paul <lyude@redhat.com>
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

