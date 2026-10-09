Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E2ECA9EBE
	for <nouveau@archiver.kernel.org>; Fri,  9 Oct 2026 21:44:02 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3DE741122E2;
	Fri,  9 Oct 2026 21:44:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QgT/hw70";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7BE0148A1C;
	Fri,  9 Oct 2026 21:25:33 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1791581133;
 b=RGRkKxdH6lD2++0p8m87SshnJ3QardjTCX9chRdl93pQodFW8UnpTn0gbzusB8I65/KbO
 19OuueRXGKxfigKx6rSh7rTxqVOHm2hblK0km7p/Zb8Hj7wyEXaZakK4DWKYc6d83sFvCR4
 3NYFrozZiSfdZgIOQw4ojEw3sibTlruRhQyqTx+p4HtcOMpTd2v5Asigt0AmDDQFHzCUWUj
 j+/TQbR24CNcKP9Te0hDU5ARVmiaCGWVk9y8/XHCyX03lluEiwpCccYSa2c8xEsjNVMbUHz
 bvBv6s6BBxihewMSwswYKXYnQ9QKYQunJuDef5lggs8/sFKs7HDk8IQ/caSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1791581133; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=9+fG0/9M7RFD3O+uQHFvadJlGPM44bJAg3Gi/iApoV4=;
 b=E/x3vxkLkG/njAsY891P+G4Zzc270TwrCqEvtt/gzoayfD/703kkL2Y1xp3PR8CKqYX8A
 NiUHUKIjEf80ZUamBTBibMDqUsYuErQLeMtYOV6KwM/Liu/czCd4LIBcn11lPPwDUxlOBqF
 UnOo34Rw2uUYDsFJlqPerCmwvdzS9xnQR+LHeEqUXcTrA2O7fpD+Uu9bbFRA53be7lS/Qz4
 JzPuPiz2N3w8HncDL6alyNbQQRPhrVvUBGxpT6WGDoRuCHoM/RDDU5EGtdYnZm9tKNCLfDf
 5cmQBLJoNc4hWDPck7PUnksJDBzdD2FeH2LrcbzVpL6SRMvgGIeqSDS6E7xA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B566D48A15
	for <nouveau@lists.freedesktop.org>; Fri,  9 Oct 2026 21:25:31 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 25C7A1122CE
	for <nouveau@lists.freedesktop.org>; Fri,  9 Oct 2026 21:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791582237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9+fG0/9M7RFD3O+uQHFvadJlGPM44bJAg3Gi/iApoV4=;
	b=QgT/hw70xAyqtSa8dcYJQfJm7cpCp/5rC0Thq5lfSqF8xI2Y06+KHf2Z+Nnk9wEka9Ccqd
	kbg2wIEXy6RJXpBW+6DyhtbEQBmCj1SZYHV3a+kcHc9kPV1XvT2D1OrLAM06Mk/A3DvTnO
	09uxiaqNEfYmwSKqTNfwhLszhSlAvGU=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-20-dsljIPGUNuadEyFl-rYlww-1; Fri, 9 Oct 2026 21:43:56 +0000
X-MC-Unique: dsljIPGUNuadEyFl-rYlww-1
X-Mimecast-MFC-AGG-ID: dsljIPGUNuadEyFl-rYlww_1791582235
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-5338ff2cf14so2701671cf.1
        for <nouveau@lists.freedesktop.org>;
 Fri, 09 Oct 2026 14:43:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791582235; x=1792187035;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DlNSozwHWelaDwiAeqzmQRLEfEKU54b/1DRu7LW/zDY=;
        b=UYKqUkBsW9LPtNzbPffvgW698rmO3xQqPsdq/36gtI6lW2sAteVy6Yd+Ka+Kag5V61
         l2Ew1kCMSc7/Z7U36++5beTcB08UFFrlk0PcguJFhHT0V9YNXfnmRKqhfdp57+pvG7gS
         R178ZEYdll/uBz6tijj78BgOpS3IA+M1OMUExs/ehynKJvOy3mDzBIb2stARXLwR7w/2
         h/GNFFBDsgFeGjFHSIQ6XB2SBAcZY0aMtJ6tWuHjQOCXJwraNrClf5oPqmLc6MYIsS+K
         o3mTirss56mmagrTGi6R2UuwW6MODpvgoGa+aXFVZ3a0fOLvZ574d3yQ8rNaNNmKNL30
         LqDQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxewE/uwqHQ3tELSq2/sojqAbkgVHchkXCdPbm99seMVqqHThOfLP0oOHv2NrN/iUOfU6T7piJ4@lists.freedesktop.org
X-Gm-Message-State: AFq9FYLrej8PnqYi4LKr7+EGWq3ZfToxYS5OsMPG6b5wYUQzEuUss09W
	noyiGtTs/SCV5bDWLxdn9IexaBKb83EJ9IWHgStUrXW+9jh014NM2Yv2mxj4buIc/nW+ZJoCoC8
	v7HY0nWwMo4N1jLjEaEmS1Bh9/4A+ClCYS0XLbUVHQEsIU5qoX38tAPpMt2tF725d8mM=
X-Gm-Gg: AYBFou2TUku+2cPayfbr9TAZmKy5Uw2dY72dgaQBxUAYKjOn0UEh69Xs7EIcev5O41A
	XMrwJ3YrAf3dfPu4kxPoA2dYNEsFFgL4Ri73zmvfNfqA0Yu4205MljWCCYS4moYOjzD4xfGT3oP
	yV568IMszFYSmrei5GLfqSJX9XzCvW/p79j8HndzVUcJzTOrSO2d8BXNIyvGQnpx2fcIQfhauhZ
	V1c8g7OHQ/RT47RVTyEUikPcGj5ULVcctDbc/k24VsmD7TjV3tSnoDk0+80tDVOb9s8+1BjU5vt
	B9Lf1VS0pTJ3pfiZ/LuauWdSWh1STc8Ecz9W8V2ENFjGzdp+9HR66TzvBRo6dmTYA1QHCLM=
X-Received: by 2002:a05:622a:58c4:b0:535:a5fb:67fb with SMTP id
 d75a77b69052e-535a5fb8494mr34446401cf.71.1791582235458;
        Fri, 09 Oct 2026 14:43:55 -0700 (PDT)
X-Received: by 2002:a05:622a:58c4:b0:535:a5fb:67fb with SMTP id
 d75a77b69052e-535a5fb8494mr34446061cf.71.1791582234996;
        Fri, 09 Oct 2026 14:43:54 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91b55092856sm28672986d6.35.2026.10.09.14.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 14:43:54 -0700 (PDT)
Message-ID: <b4cd38b48d85298a7a99cf30fbd8cbbdb34a347f.camel@redhat.com>
Subject: Re: [PATCH v3] drm/nouveau: Fix memory leaks in debugfs and hwmon
 init error paths
From: lyude@redhat.com
To: Danilo Krummrich <dakr@kernel.org>
Date: Fri, 09 Oct 2026 17:43:53 -0400
In-Reply-To: <DM0MU0O43EB9.3EEKZ4C2IUP9J@kernel.org>
References: <ea9a1d374cf3127e5047bc73807ce821022e026e.camel@redhat.com>
	 <20261009115151.13877-1-liupeng01@kylinos.cn>
	 <25778dca265f58185917c5948490e76184c778d3.camel@redhat.com>
	 <DM0MU0O43EB9.3EEKZ4C2IUP9J@kernel.org>
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FUeWS2rr2n3fx-X3Syd_LfsWi8XJ5IUPt_SZXOQKA4w_1791582235
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 2Q2DBRJIAHPCIBYG42CYRK64OSZLQX3Y
X-Message-ID-Hash: 2Q2DBRJIAHPCIBYG42CYRK64OSZLQX3Y
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: liupeng <liupeng01@kylinos.cn>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, simona@ffwll.ch, linux@roeck-us.net,
 nouveau@karolherbst.de, bskeggs@redhat.com, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/2Q2DBRJIAHPCIBYG42CYRK64OSZLQX3Y/>
Archived-At: 
 <https://lore.freedesktop.org/b4cd38b48d85298a7a99cf30fbd8cbbdb34a347f.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, 2026-10-09 at 23:40 +0200, Danilo Krummrich wrote:
> On Fri Oct 9, 2026 at 11:35 PM CEST, lyude wrote:
> > Reviewed-by: Lyude Paul <lyude@redhat.com>
> >=20
> > Will push to drm-misc-fixes in a moment
>=20
> Please wait, those are two unrelated fixes with two different Fixes:
> tags, so
> those should be two separate patches.

Thanks, I think my brain just glossed over the tags while looking at
this.

liupeng, could you split these patches up?

>=20
> I'm also not sure this is -fixes material. A memory leak in an unwind
> path for
> -rc7 feels wrong.
>=20
> Thanks,
> Danilo
>=20
> > On Fri, 2026-10-09 at 19:51 +0800, liupeng wrote:
> > > In nouveau_debugfs_init(), if nvif_object_ctor() fails, the
> > > previously
> > > allocated drm->debugfs is leaked because the function returns the
> > > error code directly.
> > >=20
> > > In nouveau_hwmon_init(), if hwmon_device_register_with_info()
> > > fails,
> > > the allocated hwmon structure is leaked because the function
> > > returns
> > > the error code directly.
> > >=20
> > > Fix both by freeing the allocated memory and clearing the pointer
> > > on
> > > the error paths.
> > >=20
> > > Fixes: b126a200e9db ("drm/nouveau/debugfs: we need a ctrl object
> > > for
> > > debugfs")
> > > Fixes: b9ed919f1c8f ("drm/nouveau/drm/pm: remove everything
> > > except
> > > the hwmon interfaces to THERM")
> > > Cc: stable@vger.kernel.org
> > > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > > Signed-off-by: liupeng <liupeng01@kylinos.cn>
> > > ---
> > > Changes in v3:
> > > - Drop the extra return in nouveau_debugfs_init() as suggested by
> > > Lyude.
> > > - Add Reviewed-by tag.
> > >=20
> > > =C2=A0drivers/gpu/drm/nouveau/nouveau_debugfs.c | 14 +++++++++++---
> > > =C2=A0drivers/gpu/drm/nouveau/nouveau_hwmon.c=C2=A0=C2=A0 |=C2=A0 2 +=
+
> > > =C2=A02 files changed, 13 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> > > b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> > > index 47d5579c568d..338421e52f69 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> > > @@ -295,13 +295,21 @@ nouveau_drm_debugfs_init(struct drm_minor
> > > *minor)
> > > =C2=A0int
> > > =C2=A0nouveau_debugfs_init(struct nouveau_drm *drm)
> > > =C2=A0{
> > > +=09int ret;
> > > +
> > > =C2=A0=09drm->debugfs =3D kzalloc_obj(*drm->debugfs);
> > > =C2=A0=09if (!drm->debugfs)
> > > =C2=A0=09=09return -ENOMEM;
> > > =C2=A0
> > > -=09return nvif_object_ctor(&drm->client.device.object,
> > > "debugfsCtrl", 0,
> > > -=09=09=09=09NVIF_CLASS_CONTROL, NULL, 0,
> > > -=09=09=09=09&drm->debugfs->ctrl);
> > > +=09ret =3D nvif_object_ctor(&drm->client.device.object,
> > > "debugfsCtrl", 0,
> > > +=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NVIF_CLASS_CONTROL, NU=
LL, 0,
> > > +=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &drm->debugfs->ctrl);
> > > +=09if (ret) {
> > > +=09=09kfree(drm->debugfs);
> > > +=09=09drm->debugfs =3D NULL;
> > > +=09}
> > > +
> > > +=09return ret;
> > > =C2=A0}
> > > =C2=A0
> > > =C2=A0void
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> > > b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> > > index 726397ab035d..ffbe7f542ab0 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> > > @@ -697,6 +697,8 @@ nouveau_hwmon_init(struct drm_device *dev)
> > > =C2=A0=09if (IS_ERR(hwmon_dev)) {
> > > =C2=A0=09=09ret =3D PTR_ERR(hwmon_dev);
> > > =C2=A0=09=09NV_ERROR(drm, "Unable to register hwmon device:
> > > %d\n", ret);
> > > +=09=09drm->hwmon =3D NULL;
> > > +=09=09kfree(hwmon);
> > > =C2=A0=09=09return ret;
> > > =C2=A0=09}
> > > =C2=A0

