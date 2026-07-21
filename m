Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A83CC4452D
	for <nouveau@archiver.kernel.org>; Tue, 21 Jul 2026 18:36:20 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B124B10EB1A;
	Tue, 21 Jul 2026 18:36:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GvtmS48f";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 971CD4729F;
	Tue, 21 Jul 2026 18:20:48 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784658048;
 b=cOHy8QH2QwNOgfniRryryBiB783gcKqZVqPsTK4MYwQS8fppv2CJfgJYS1K7IpNKwK5Vb
 jgOrvikVwptvQKemtcFxhSZCh1Cxw1j3IEOviz1pbgsndGWJiCIWIQzFJCXVqxdUeiri1vY
 fJrnRhY7sP94H3tzCA4Fy9I2yGoCS3HMrgAyAJJPKibIIWl0ExHPb6vOunU52GMJEn0Nhjd
 Qrgx/IrtitUpiiBjtT207jev1N33awjs41NIPRC9tVVCXaWaw0Pfa/5Z5o7hBXrJZC6sGbt
 2AMZh4YHiTqkNo82VWNkwm8nRQoMWV6yn1LgjwssZpoHKACViwGzT37LVMtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784658048; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=P9P5vu0pXSNnYy1ZhJcG4vlkpcsOS3Vq5kYWiQ9nQWQ=;
 b=R0AJqxU6ssS13G5CV/zZJEPZ3HKw/cjm9Ja2e7TriH0IDHtjRdkdO7feftrV8B6STxYQY
 /RAjXZ8/pgoX2sjCppbCBTcz350jUkns9+16+RJ1+MYcdC4bPB/6XYJuYabPZmOY/4v4X+g
 HXlHi5fLJg4RgKYfOvfsgbmuEI9rxNz1esWBsrUB+dB0ejTNRKP6phZU5XfPkrcjtjpU0qR
 12p4bMNkzAt2ztPAqPHiSwvwExQiw0n9gbVJyJVmH3odkMjcRWwwzurHQqgb8EUljqCTevI
 2M2W9F3C6lDRLcWz6NDJGcmdBUldvJEwYf1w4YNxLsKbB59kELXOt5aRArPg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id EE5F8466F6
	for <nouveau@lists.freedesktop.org>; Tue, 21 Jul 2026 18:20:46 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B118710EB19
	for <nouveau@lists.freedesktop.org>; Tue, 21 Jul 2026 18:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784658974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P9P5vu0pXSNnYy1ZhJcG4vlkpcsOS3Vq5kYWiQ9nQWQ=;
	b=GvtmS48fLm6oQDm23xQQzRuiaiz72u1jb8yWHSpIdCK0vn625zNqxiZDMFtZlPbZpSYVSP
	zW321wx3ez/KOnc1Ny6Bs2MwyWU+RUsS+5vRNUkkQdS+djonhXXnk9SiKz3laVpAUuIC0Z
	BUDcMnRR+HhYpC9TBw9Eap5hUKAEZbw=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-436-jJ5diK9ON-KrkTLPOlpZrw-1; Tue, 21 Jul 2026 14:36:13 -0400
X-MC-Unique: jJ5diK9ON-KrkTLPOlpZrw-1
X-Mimecast-MFC-AGG-ID: jJ5diK9ON-KrkTLPOlpZrw_1784658973
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-92e5e38fbc5so165522085a.2
        for <nouveau@lists.freedesktop.org>;
 Tue, 21 Jul 2026 11:36:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784658973; x=1785263773;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Go1C81ar5fv4t+FHR7Abtxew7sOcjBDPFGnY7kzk9t0=;
        b=RgKjrhqWgcKXYyCxKgmZ+mFWtGz8M4cm9dQfMKGuE0JhAOIXwih/xJJnkHc5gUwN/L
         iTGqj3Tl8syYyhBxR5kLYanlcllxPgMzlWs9dwmQiHOl/uqcJU2CX3UNEHB5zCb/j9Ku
         MG5rcJ1KER4cPXBE8FCU8ZWtgf8y8yKCt1/PQmzNihOSOyhyoePChV6GhKfKaoK9Yk1S
         HdMV6xIeUF6ElEoFCBMaRJh1ifdhxaze7Vm9Wy+KfRQ5sTZrhcF2edhkjyeXKAsgBa9A
         eob5zWGcuREFwlE54n/CqWxtlW3CLQgb2OQEuEVebgcJz3p89JBni+CqXBZ/GU9hGTF5
         sFGg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqDZRnmrAXLKhNn9fNXh3y+KtWcOSiFSlk3mIeJQzWPOwyn4YcknT6rF+Q5FDJE+RMed+hw5p0v@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwV/SJFHGSoXVohOEjzDvfUDk/54vp/Uyoz4esAu6Wm8XF+di+d
	9uU0vV+OsFoXfOo/Qvda1aeb8n6eYiPQWgGRjb+UzjUc+nmFPy/Bxe2bPxZrGpqgB6T0xQh1nqZ
	LXPvKD1yCAqhGn0weLGtbpEG0QAgdRfbUnJePsAPs3acKwpyjjuz8X0ImdYYZediOKAU=
X-Gm-Gg: AfdE7ck7kFIKyz/MCAUuQVmGHlsB0qP2EqqhuSk4smV+IGw/fToTcVmf/uWMA5XSPhp
	F//Xjm7gp6L1AFC+TV7HjvUKJloFQKMZDW0y5KxtbgDVmT5wqMKEYcwgZ4f4Fnaueuao0Bh+Bre
	qCcN8bZUeBPGXkXJzWoykxOe/C5MFMEWoNgfrWWJhmm8JqujbDshiy8mEy/dzy4xCBEmKQPeH+1
	XGt4ETjWDcjetArzyoM6o0MfPnMSZIljrqGAUCo9KmrB78tohvuSTidXi0qP/Jbw3M8FYGriKHD
	qGDIfAn4EWFvwQp4097fTWhxc0GU46+iaVnjo4AdwqDxhUK9c1oHA8H59WXqy2/tTOYBnrbz
X-Received: by 2002:a05:620a:2905:b0:92e:8734:b833 with SMTP id
 af79cd13be357-930b416d543mr1930903785a.59.1784658972833;
        Tue, 21 Jul 2026 11:36:12 -0700 (PDT)
X-Received: by 2002:a05:620a:2905:b0:92e:8734:b833 with SMTP id
 af79cd13be357-930b416d543mr1930899885a.59.1784658972324;
        Tue, 21 Jul 2026 11:36:12 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-930b52faa8fsm1188355885a.12.2026.07.21.11.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:36:11 -0700 (PDT)
Message-ID: <78ca5c308ce81465956e839c82e1bba46a9f0686.camel@redhat.com>
Subject: Re: [PATCH 3/6] drm/nouveau: add GSP hwmon support
From: lyude@redhat.com
To: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
	linux-kernel@vger.kernel.org
Date: Tue, 21 Jul 2026 14:36:11 -0400
In-Reply-To: <20260714211429.238355-4-mohamedahmedegypt2001@gmail.com>
References: <20260714211429.238355-1-mohamedahmedegypt2001@gmail.com>
	 <20260714211429.238355-4-mohamedahmedegypt2001@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mFQRHys3qMxB9olGPgcuQkY10uXzznrw_7kNR4Ef6OE_1784658973
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: MSZXXUE52G4PGAKFQMI7PBCWPYGGABHQ
X-Message-ID-Hash: MSZXXUE52G4PGAKFQMI7PBCWPYGGABHQ
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Mary Guillemard <mary@mary.zone>, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MSZXXUE52G4PGAKFQMI7PBCWPYGGABHQ/>
Archived-At: 
 <https://lore.freedesktop.org/78ca5c308ce81465956e839c82e1bba46a9f0686.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, 2026-07-15 at 01:14 +0400, Mohamed Ahmed wrote:
> +static int
> +nouveau_power_read(struct device *dev, u32 attr, int channel, long
> *val)
> +{
> +=09struct drm_device *drm_dev =3D dev_get_drvdata(dev);
> +=09struct nouveau_drm *drm =3D nouveau_drm(drm_dev);
> +=09struct nvkm_iccsense *iccsense =3D nvxx_iccsense(drm);
> +=09struct nvkm_device *device =3D drm->nvkm;
> +=09struct nvkm_gsp *gsp =3D device->gsp;
> +
> +=09if (nvkm_gsp_rusd(gsp))
> +=09=09return nouveau_rusd_power_read(drm_dev, gsp, attr,
> channel, val);

IMO - let's add braces to this conditional

> +=09else {
> +=09=09if (!iccsense)
> +=09=09=09return -EOPNOTSUPP;
> +
> +=09=09switch (attr) {
> +=09=09case hwmon_power_input:
> +=09=09=09if (drm_dev->switch_power_state !=3D
> DRM_SWITCH_POWER_ON)
> +=09=09=09=09return -EINVAL;
> +=09=09=09*val =3D nvkm_iccsense_read_all(iccsense);
> +=09=09=09break;
> +=09=09case hwmon_power_max:
> +=09=09=09*val =3D iccsense->power_w_max;
> +=09=09=09break;
> +=09=09case hwmon_power_crit:
> +=09=09=09*val =3D iccsense->power_w_crit;
> +=09=09=09break;
> +=09=09default:
> +=09=09=09return -EOPNOTSUPP;
> +=09=09}
> +
> +=09=09return 0;
> +=09}
> +}
> +

...

> =C2=A0static int
> =C2=A0nouveau_temp_write(struct device *dev, u32 attr, int channel, long
> val)
> =C2=A0{
> @@ -667,13 +854,39 @@ nouveau_hwmon_init(struct drm_device *dev)
> =C2=A0=09struct nvkm_iccsense *iccsense =3D nvxx_iccsense(drm);
> =C2=A0=09struct nvkm_therm *therm =3D nvxx_therm(drm);
> =C2=A0=09struct nvkm_volt *volt =3D nvxx_volt(drm);
> +=09struct nvkm_device *device =3D drm->nvkm;
> +=09struct nvkm_gsp *gsp =3D device->gsp;
> =C2=A0=09const struct attribute_group *special_groups[N_ATTR_GROUPS];
> =C2=A0=09struct nouveau_hwmon *hwmon;
> =C2=A0=09struct device *hwmon_dev;
> +=09bool rusd_active =3D false;
> =C2=A0=09int ret =3D 0;
> =C2=A0=09int i =3D 0;
> =C2=A0
> -=09if (!iccsense && !therm && !volt) {
> +=09if (nvkm_gsp_rusd(gsp)) {
> +=09=09/* Per-channel visibility is latched below from live
> RUSD
> +=09=09 * section validity, so wait for GSP-RM's first poll
> of both
> +=09=09 * requested groups (thermal, power). It is normally
> completed
> +=09=09 * long before we get here and this is a last
> resort.
> +=09=09 */
> +=09=09unsigned long timeout =3D jiffies +
> +=09=09=09msecs_to_jiffies(2 * gsp->rusd.poll_ms);
> +=09=09bool thermal, power;
> +
> +=09=09for (;;) {
> +=09=09=09thermal =3D nouveau_rusd_ok(gsp,
> NVKM_GSP_RUSD_TEMP_GPU);
> +=09=09=09power =3D nouveau_rusd_ok(gsp,
> NVKM_GSP_RUSD_POWER_GPU) ||
> +=09=09=09=09nouveau_rusd_ok(gsp,
> NVKM_GSP_RUSD_POWER_GPU_AVG) ||
> +=09=09=09=09nouveau_rusd_ok(gsp,
> NVKM_GSP_RUSD_POWER_CAP);
> +=09=09=09if ((thermal && power) ||
> !time_before(jiffies, timeout))
> +=09=09=09=09break;
> +=09=09=09msleep(20);
> +=09=09}

Is it possible to use nvif_msec() here?

> +
> +=09=09rusd_active =3D thermal || power;
> +=09}
> +
> +=09if (!iccsense && !therm && !volt && !rusd_active) {
> =C2=A0=09=09NV_DEBUG(drm, "Skipping hwmon registration\n");
> =C2=A0=09=09return 0;
> =C2=A0=09}

