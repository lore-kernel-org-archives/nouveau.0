Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 774D3C4452B
	for <nouveau@archiver.kernel.org>; Tue, 21 Jul 2026 19:37:13 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2AAB710EB22;
	Tue, 21 Jul 2026 19:37:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="D2IyRNnm";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id F1F1D47287;
	Tue, 21 Jul 2026 19:21:43 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784661703;
 b=BJILLP+jv8Gqxk8ZfDynQ4hcKCoBpR76oc6lSRAs7Ofk5r0WoXbjVMEJ7Y7x9iXQnEgWR
 gEczd6PPYi4zSKV8NAxsURXWQrTeyCWaoRh4MBvYqBPNxcEDN+BxDR2aL+rC7/S6/ia9WeZ
 Ah0lj0WMijp7fR5/AVNITIGARsASGEhWxYumPtqJH3jPMNIH07qhQo21HlLQ9Mc4kdZYVtJ
 zVmfp4xAUmtqvJ6OPVjt71bl3WKx9vXiivR/bsUnz8NeMT83sf4BAOQP8zatzqBuVW4M9eu
 UWCRnvQ2doqowG+7SAIwn3J3fYyZX4+g3XZ6jSG2C8UQV/OE76NrWs+0IVfw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784661703; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=sOY7eReV4Z5bcCLysipftskzwGQCZFqDBhkocCq/BoY=;
 b=juNXfxfgsQnBsmMrGLoz1zb7ns6znJ5+M5wSPeZFgKHngoIB+naZBN8pXTWKa6wk6waF4
 tcG6ygFJHlB1wIIw6urHeFGzqPOi4I81CvCBrNWs6FZ8mX8LIwIjzHqYa6vZPGUHji7HobB
 wJ4doCpk2rGK6EJO/fTDMBEx+//fo5v9sMVmhCIEqb5wu7zAoR3So01i2EVM31OIC0JsEu4
 qqYU34EjDJ5msPjHE4BTy08eUOGANP26ikaYM6+4wem+x8sjzHzO7W3Idqbc5H/FyjLyEhh
 yiC5urN49b5QqMPpFN9YMTTrcJhWlKlWI9BLioIVZ6IwotCbC+y9MqWJ3Kiw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 40F6347287
	for <nouveau@lists.freedesktop.org>; Tue, 21 Jul 2026 19:21:41 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3F61610E3BA
	for <nouveau@lists.freedesktop.org>; Tue, 21 Jul 2026 19:37:10 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-c9ef3e1337fso7953497a12.2
        for <nouveau@lists.freedesktop.org>;
 Tue, 21 Jul 2026 12:37:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784662630; cv=none;
        d=google.com; s=arc-20260327;
        b=cs9TucljWedIFNxnUKALyrrvjNAQ6c2G+cHbrNvsjKHw6N54gkk8lUaX9VmwemYqQG
         W5rHj/6NHLgPTMLk4cMT5KblSbn4Xs9AGmowZJt1O0AzZhgPVhTTyvwgySehjFYCTEqw
         EkB70E7Jh+ZP3bGl71RxlE45EWiOEHNtAcBol6RBuV/M6Lv/DRoovp1Qf+eZwehyaG8E
         womiIoRUxsnIMSNr2OW/BubBCmemeA4URPmeaajn+ioiLcq5HS17vuBSR5W/eK4/QYKe
         GriBMw++X/5T1zsJ6G4JMHAKXrZAFyWLmMGMIJ9y+9bnuanwReo1wWUMA8M02+5/nafR
         hgNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sOY7eReV4Z5bcCLysipftskzwGQCZFqDBhkocCq/BoY=;
        fh=hc9G6u7hbwAn7Br3oc2JcM5IDrTsNZ8rqaSPK99aBQ8=;
        b=Q843zkMBp6YmZEpXo0WRi5rcw5r0lRiZMk7Qsqd6ly/H939BvBhcA3ONWiKovMfkwq
         vEsbE+UbfWBGE7Im+bESPU1aw/eNI+f4iZI8LBpdOPqmL1ItWLP3Nc2fbXEfiK2BUef8
         yLNLYrhuvRdMckMgQhnDc4Nn6g+2uBK5G0Tkv146J+N+j4BaiuMJaxLZmVRdbeyj0eO6
         X2u5y+c7Tmzz1mk3jSDV2y8dUGwMF68KE+EEadpqW9ftFErLnyFrF5X/4ieOFu07VriV
         yiTAkjRD7thwS146MrAP/c0RjdeDy7D+oc3yUQSDO5LTUldbjgsghgT5yhF6VeigSTJt
         MsQw==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784662630; x=1785267430;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sOY7eReV4Z5bcCLysipftskzwGQCZFqDBhkocCq/BoY=;
        b=D2IyRNnmFKcc7Q2EVeB0Rmt/KyPrcfZRi3V+G4na9g3nZhwKCvpcP1JKDRz2lnqh/E
         YSmWDcpKFN/OqlKxLmmrMm26AxwByMl5K041ezJ3y39yqJrrysRRAgcJP+1w/vmZ3kPz
         yK9lyIcILA2pDIfmvVR6lsZH9YkhonC/Tzglm2nhSt9A5LHc69GOOJyBU0607Vf0iSN/
         ACBHMLk/i3VvjIfegzsvPyYPIW4MB9bjeoxSJ7pl5rGyaF2/qjMaGg6bJYntVtS/2qUT
         5oMeLzYl9A0/Wrmv4HDNUVHEKKRnBFxe+ykDG6hlwoqfjdvYILnyFLQ27EXf8nS0DIb/
         zbMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784662630; x=1785267430;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sOY7eReV4Z5bcCLysipftskzwGQCZFqDBhkocCq/BoY=;
        b=NNa2e0E+o8spGXbDugRotMTSdMMejgmwYGhtQ/JT91UPjzs4UtiY8Jcye4k+kufox3
         EoXPpb8VQ30Qyz868RkRibXxBuOXwXC1O1zhA8pZS0Z7MKokxr80LjT6NUm+RKSzGoLy
         vtLScnoVCiS+3MW706agj16L+/qDrmCUt1WS0H6VfE+03adHy7CNxK/DYUjL4BqyaoAc
         uYl0V/SMuo8Udtrxq0T8nkJNiK2YKWO7MdpcdLSDrevcWFh//ujvFgr9THEFt5ZQGYSH
         +x0/M9viWP9v2GAM4ABIfeumtAcIxTb4nP39wjj9Ta4sbddnO+TGcNRmJfgY7O0qhErK
         lTfw==
X-Forwarded-Encrypted: i=1;
 AHgh+RoQ4peF9xA/kv7BMHz/CpHd3B//Tf7QbTGSPw/hNUjS5K7irrO0INjFBmgDs1LfycRx4L5m5QoS@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywhg8KJzYuaYLlCqx7fR/32A+bHWKEQXH/JYbGgPAlUjte/pSDk
	b+Xm+bShurwemtMq5tz9WKWhde17VBkOnTXWTX9vsi57hpPtTCDsuWCH/h9/brzv5Mo1+FrFakh
	gfymUC6gPyKKj/TeFqAIIzgcnSNDLfLc=
X-Gm-Gg: AR+sD12akWI1n087BGH1x04+yHdh/MEu1bMU5mpNRaJr9ErrO/3eKbabCMWyoQH9gvx
	eubcXMNIN+VT/jrnyTMe4Of07dro0F4JrlOPpgZWh319TemyG9OjqWHWM1azhX+QAXuTtXNKQH4
	5Y1H/tPPbRjAZdtJLf9B3CAGHgg3GXFvskZVF59prZ0ZokFN7jfcCtzYLS18Xa11AYxJaBjPlWZ
	NqGBTVlVNoa+qPSRp6stLacOQFJIM84UC0olA2t430EWt678Th/x12PM5EvzyeKNSf0KGmhpA77
	vkch
X-Received: by 2002:a05:6a20:7487:b0:3bf:6c05:ab with SMTP id
 adf61e73a8af0-3c3ad9d632bmr21640259637.58.1784662629564; Tue, 21 Jul 2026
 12:37:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260714211429.238355-1-mohamedahmedegypt2001@gmail.com>
 <20260714211429.238355-4-mohamedahmedegypt2001@gmail.com>
 <78ca5c308ce81465956e839c82e1bba46a9f0686.camel@redhat.com>
In-Reply-To: <78ca5c308ce81465956e839c82e1bba46a9f0686.camel@redhat.com>
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Date: Tue, 21 Jul 2026 23:36:58 +0400
X-Gm-Features: AUfX_mzGwUNpX520bsNPEhX1qvh744PJolN7Udftq3CicklwG3Y8nVM_WZ-pl_4
Message-ID: 
 <CAA+WOBuLgkKy_BAgEWgN7jgxDrJYchO1D+B44u6VVMPsGJ-AEA@mail.gmail.com>
Subject: Re: [PATCH 3/6] drm/nouveau: add GSP hwmon support
To: lyude@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 244NK7TBOA775LJZREOQBF42ECMIQ5CZ
X-Message-ID-Hash: 244NK7TBOA775LJZREOQBF42ECMIQ5CZ
X-MailFrom: mohamedahmedegypt2001@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Mary Guillemard <mary@mary.zone>, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/244NK7TBOA775LJZREOQBF42ECMIQ5CZ/>
Archived-At: 
 <https://lore.freedesktop.org/CAA+WOBuLgkKy_BAgEWgN7jgxDrJYchO1D+B44u6VVMPsGJ-AEA@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, Jul 21, 2026 at 10:36=E2=80=AFPM <lyude@redhat.com> wrote:
>
> On Wed, 2026-07-15 at 01:14 +0400, Mohamed Ahmed wrote:
> > +static int
> > +nouveau_power_read(struct device *dev, u32 attr, int channel, long
> > *val)
> > +{
> > +     struct drm_device *drm_dev =3D dev_get_drvdata(dev);
> > +     struct nouveau_drm *drm =3D nouveau_drm(drm_dev);
> > +     struct nvkm_iccsense *iccsense =3D nvxx_iccsense(drm);
> > +     struct nvkm_device *device =3D drm->nvkm;
> > +     struct nvkm_gsp *gsp =3D device->gsp;
> > +
> > +     if (nvkm_gsp_rusd(gsp))
> > +             return nouveau_rusd_power_read(drm_dev, gsp, attr,
> > channel, val);
>
> IMO - let's add braces to this conditional
>
> > +     else {
> > +             if (!iccsense)
> > +                     return -EOPNOTSUPP;
> > +
> > +             switch (attr) {
> > +             case hwmon_power_input:
> > +                     if (drm_dev->switch_power_state !=3D
> > DRM_SWITCH_POWER_ON)
> > +                             return -EINVAL;
> > +                     *val =3D nvkm_iccsense_read_all(iccsense);
> > +                     break;
> > +             case hwmon_power_max:
> > +                     *val =3D iccsense->power_w_max;
> > +                     break;
> > +             case hwmon_power_crit:
> > +                     *val =3D iccsense->power_w_crit;
> > +                     break;
> > +             default:
> > +                     return -EOPNOTSUPP;
> > +             }
> > +
> > +             return 0;
> > +     }
> > +}
> > +
>
> ...
>
> >  static int
> >  nouveau_temp_write(struct device *dev, u32 attr, int channel, long
> > val)
> >  {
> > @@ -667,13 +854,39 @@ nouveau_hwmon_init(struct drm_device *dev)
> >       struct nvkm_iccsense *iccsense =3D nvxx_iccsense(drm);
> >       struct nvkm_therm *therm =3D nvxx_therm(drm);
> >       struct nvkm_volt *volt =3D nvxx_volt(drm);
> > +     struct nvkm_device *device =3D drm->nvkm;
> > +     struct nvkm_gsp *gsp =3D device->gsp;
> >       const struct attribute_group *special_groups[N_ATTR_GROUPS];
> >       struct nouveau_hwmon *hwmon;
> >       struct device *hwmon_dev;
> > +     bool rusd_active =3D false;
> >       int ret =3D 0;
> >       int i =3D 0;
> >
> > -     if (!iccsense && !therm && !volt) {
> > +     if (nvkm_gsp_rusd(gsp)) {
> > +             /* Per-channel visibility is latched below from live
> > RUSD
> > +              * section validity, so wait for GSP-RM's first poll
> > of both
> > +              * requested groups (thermal, power). It is normally
> > completed
> > +              * long before we get here and this is a last
> > resort.
> > +              */
> > +             unsigned long timeout =3D jiffies +
> > +                     msecs_to_jiffies(2 * gsp->rusd.poll_ms);
> > +             bool thermal, power;
> > +
> > +             for (;;) {
> > +                     thermal =3D nouveau_rusd_ok(gsp,
> > NVKM_GSP_RUSD_TEMP_GPU);
> > +                     power =3D nouveau_rusd_ok(gsp,
> > NVKM_GSP_RUSD_POWER_GPU) ||
> > +                             nouveau_rusd_ok(gsp,
> > NVKM_GSP_RUSD_POWER_GPU_AVG) ||
> > +                             nouveau_rusd_ok(gsp,
> > NVKM_GSP_RUSD_POWER_CAP);
> > +                     if ((thermal && power) ||
> > !time_before(jiffies, timeout))
> > +                             break;
> > +                     msleep(20);
> > +             }
>
> Is it possible to use nvif_msec() here?
>

It can work but it's strictly worse than this. nvif_msec() does busy
looping, which would be overkill for this as it would be doing a lot
more reading for something that changes at most once per 500ms poll
cycle, and it keeps the CPU fully occupied with every read. It also
couples us to GPU timing while the main thing we are waiting here on
is whether the GSP's buffer writes are now visible in RAM so GPU side
time doesn't offer us anything. I actually wasn't sure at first how to
properly wait and did go over all the possible timing alternatives and
jiffies looked to be the best here.

That said, to address what Milos mentioned (the weirdness of files
being -ENODATA), I am going to have to move this into nvkm/rusd,
inside r570_rusd_supported()/r570_rusd_read() which doesn't have any
other alternative available to do a similar style waiting loop.

> > +
> > +             rusd_active =3D thermal || power;
> > +     }
> > +
> > +     if (!iccsense && !therm && !volt && !rusd_active) {
> >               NV_DEBUG(drm, "Skipping hwmon registration\n");
> >               return 0;
> >       }
>
