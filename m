Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79FE2C5DF9B
	for <nouveau@archiver.kernel.org>; Fri, 21 Aug 2026 22:02:23 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D88E910F3D5;
	Fri, 21 Aug 2026 22:02:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fae0vF4x";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 926AA47AE7;
	Fri, 21 Aug 2026 21:45:44 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787348744;
 b=Yi+mswCuNfE8qaPOPhBLN+FrY+Di79cuI05dk9LeqbD/CKMFJBnBbBYU7AxUIjUrytO9p
 7rGvE49jhpIrlVZ4P0TozcdCG5ohouX7Nqs+BxKXLAsewKGC4OPtVChuFgT+R+7ywpPztPS
 m3lUv2hyx0zU65ERWvJs+OXGY/ve4YyrXBKaaZQx5bD7Wap6nGMq4YBy+NXm7Skp1xa2awx
 Hb9nEpGg1Tukqf9MPMzr6uT1wVpvkCQgmPp9YDl3h5qMvzu+f5Yaw67sqKsaxE38sRmL/O/
 W3X5ijlnX65kV3yjZcL7GNpUCMdQpAfaFlzfqL/bkhKQ5W3gxojCsiQsDh6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787348744; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=D+aF5SWpzj0IMMiUIe2sX0uwtLDyPi9UzPsNgctanKk=;
 b=ybngEKmozwn4u6HH1/ZSF0HRodTMr+hbFkevn8CKgAAkF6JthBI6af3IDgrrxybH7zXi8
 SGVO7v+5tE9suvFtqKrXHTkAPd71PjwFYk16Oy/3CLPhwqcSKaJVGtBzrfgbJzacHumxB1w
 AKeB/4196iQsQqj2lfIDmFuZ5k14+OgH4RPbf44lEb2dPL+UUuWsCrDCMpqlSGp5EhdID2l
 vIyHIxXj67U4fbnKHpqRlFkHoqe0zPs7eDbA+eQHnQwstk7jtDyj2t96ineWr/t+eKClD8v
 QSvfiQ9MlYRlBhK4fEME4+xvE76SiSJycJrrPw+x+5SASg9AVw6TGKxRU7Pw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id BA922474BB
	for <nouveau@lists.freedesktop.org>; Fri, 21 Aug 2026 21:45:41 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7C28F10F3C8
	for <nouveau@lists.freedesktop.org>; Fri, 21 Aug 2026 22:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787349738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D+aF5SWpzj0IMMiUIe2sX0uwtLDyPi9UzPsNgctanKk=;
	b=fae0vF4xhjxAQvPbLUxlJICsIAAtYV8MEzZXmZtJNdPqR0ablqSjMG/G0usDFG5xFDRHxZ
	OSIZfvI1K7shNiIMTDLAN95LjqckZY08ermcd3dEQRyfWik3OvqfwP8FqYZnBkelM8+Qpi
	tTmTu2f+Ea1/V1zqowROzJ2hy+hsbUE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-y0CDfetUMNKT5R2K47qFrg-1; Fri, 21 Aug 2026 18:02:17 -0400
X-MC-Unique: y0CDfetUMNKT5R2K47qFrg-1
X-Mimecast-MFC-AGG-ID: y0CDfetUMNKT5R2K47qFrg_1787349736
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51bf321d786so13552661cf.1
        for <nouveau@lists.freedesktop.org>;
 Fri, 21 Aug 2026 15:02:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787349736; x=1787954536;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7JvFgvcNT0JoaQlZJf2gAQv9c8TyqYAeQTsUG3MJuR4=;
        b=GFuOeAr4WHXzspsqOImf3T5TSqZJcSooyuObk73KeMx4r3bPY+usnDSeKDQx8Edz7C
         KlDRvZz3IpnuRZGMR5QbNVesaphtqJCjELjXy06U2zn8cEcDcaJz6N3fLFlK/LIOAvz7
         cLIJDa2ikwKjQe7fjLep+IiZRaTrwbA+BNRnpHZcC5DPkd0x+mvZtJkswos0KGwQKbOj
         XWUs7wrJ2F9UI9LIf4uKnjO4jZtHSNwZIUHPZjfRbfVvSrvWE1vVuu8vHFLwbrwfeqkz
         xRogWpYqgGUf57lJRWOUnhpG789b3Qy7PEZ0NBfiAaOqIlQNcOjPRNj5X/D9X0txWVu0
         AJ3A==
X-Forwarded-Encrypted: i=1;
 AHgh+RpQABTAC5k932/BmdZCRrWCWwb6cQGkkvX+AMBCVip9djfFIYzzGKjwAwrxuYHg9t3sOyBfmY+m@lists.freedesktop.org
X-Gm-Message-State: AFuF++mjCiBjtEENHBulomVZPWqLt0nfyRS2RoQX1NyawJTutWDzOq1G
	rle48ctQHDEc63xFSiF8Ch8Lq++3x9t1lCzrorKaZgPf8zzfHh//mVfzrkU47fALsxyF1RdaTqd
	aC/vxgHV/AX8awJgA7vr4IjhKZt3m8nPHXynqz5cfScYx7XIu7BytQug79XN2YmL28NI=
X-Gm-Gg: AR+sD136kzj+VNgpZ0u/3Ul7IbStwm8PKW7NTYJuCLti5VHOTcJUcdaVVT+6fLdfFbp
	FOCqNmT2ymR4VMna1x5WtIxmJ9NOlxkx+VnYMW0rRzWimqnMc4gsVbARdbHAcGShqu7chtQyVJs
	azxg3G6tjFTq0GQ7BTi3GbELlM6TLc2ZevorGUiHFtfYt+ANP6QSXVe4jHrcN5IpLhg3AGdz2i1
	zYZFrmPyVQ2Xazy+raxHTvMwq8mAo9EnFGpohfmfiNU9UIpUdA/3Q1uQmexLz+rkrejIrP976Rf
	EUQWrvmgADLAQ5DvGiyFhU4YrWG3Y9ZbbRSNiLxFGXsTQlOhSgh4E1u75Tzje1bP4tiF8jOE
X-Received: by 2002:a05:622a:5a12:b0:528:3882:386a with SMTP id
 d75a77b69052e-52df572d755mr93022671cf.11.1787349736359;
        Fri, 21 Aug 2026 15:02:16 -0700 (PDT)
X-Received: by 2002:a05:622a:5a12:b0:528:3882:386a with SMTP id
 d75a77b69052e-52df572d755mr93021811cf.11.1787349735880;
        Fri, 21 Aug 2026 15:02:15 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-52e099a8331sm3893421cf.9.2026.08.21.15.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 15:02:14 -0700 (PDT)
Message-ID: <b91ad24281d52efd681f24e7f954f684104a84a7.camel@redhat.com>
Subject: Re: [PATCH v2 06/10] drm/nouveau/gsp: use per-version
 DP_CONFIG_STREAM params on r570 firmware
From: lyude@redhat.com
To: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
	linux-kernel@vger.kernel.org
Date: Fri, 21 Aug 2026 18:02:14 -0400
In-Reply-To: <20260820164929.17117-7-mohamedahmedegypt2001@gmail.com>
References: <20260820164929.17117-1-mohamedahmedegypt2001@gmail.com>
	 <20260820164929.17117-7-mohamedahmedegypt2001@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wP_CB_s_K5vX-Lb60V7MAEtygrUMrtkhXDoasgXR3Tw_1787349736
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: DCPXMRNIIHXQNCAQO5EP444WNJOFT3II
X-Message-ID-Hash: DCPXMRNIIHXQNCAQO5EP444WNJOFT3II
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DCPXMRNIIHXQNCAQO5EP444WNJOFT3II/>
Archived-At: 
 <https://lore.freedesktop.org/b91ad24281d52efd681f24e7f954f684104a84a7.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

We should probably Cc this to stable. With that fixed:

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Thu, 2026-08-20 at 20:49 +0400, Mohamed Ahmed wrote:
> NVIDIA removed the deprecated actualPclkHz/linkClkFreqHz fields and
> the
> whole Legacy{activeCnt, activeFrac, activePolarity, mvidWarEnabled,
> MvidWarParams} block from the SST sub-struct of
> NV0073_CTRL_CMD_DP_CONFIG_STREAM_PARAMS between the 535 and 570
> releases
> (compared in OpenRM tags 535.113.01 vs 570.144), shrinking the
> struct.
>=20
> Everything nouveau writes sits at identical offsets in both layouts
> except the trailing SST.bEnableAudioOverRightPanel (written as zero),
> but
> the size is wrong on r570, which means r535_sor_dp_sst() and
> r535_sor_dp_vcpi() are sent with an incorrect size.
>=20
> Route the .sst/.vcpi IOR functions through nvkm_rm_api_disp the same
> way
> bl_ctrl and dp.get_caps/set_indexed_link_rates already are. Keep the
> existing implementation for r535 and add an r570 implementation built
> against the 570.144 layout, which already exists in r570/nvrm/disp.h
> but
> was unused until now. Also add the NV0073_CTRL_CMD_DP_CONFIG_STREAM
> define that was missing from the layout.
>=20
> Other DP controls sent through shared r535 code did not change layout
> between the tags.
>=20
> Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
> ---
> =C2=A0.../nouveau/nvkm/subdev/gsp/rm/r535/disp.c=C2=A0=C2=A0=C2=A0 | 33 +=
+++++++--
> =C2=A0.../nouveau/nvkm/subdev/gsp/rm/r570/disp.c=C2=A0=C2=A0=C2=A0 | 64
> +++++++++++++++++++
> =C2=A0.../nvkm/subdev/gsp/rm/r570/nvrm/disp.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 2 +
> =C2=A0.../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h=C2=A0=C2=A0 |=C2=A0 5 +=
+
> =C2=A04 files changed, 97 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
> index f3e55253bcbc..3a8ff621ed62 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
> @@ -400,16 +400,16 @@ r535_sor_dp_audio(struct nvkm_ior *sor, int
> head, bool enable)
> =C2=A0=09=09r535_sor_dp_audio_mute(sor, false);
> =C2=A0}
> =C2=A0
> -static void
> -r535_sor_dp_vcpi(struct nvkm_ior *sor, int head, u8 slot, u8
> slot_nr, u16 pbn, u16 aligned_pbn)
> +static int
> +r535_dp_vcpi(struct nvkm_ior *sor, int head, u8 slot, u8 slot_nr,
> u16 pbn, u16 aligned_pbn)
> =C2=A0{
> =C2=A0=09struct nvkm_disp *disp =3D sor->disp;
> =C2=A0=09struct NV0073_CTRL_CMD_DP_CONFIG_STREAM_PARAMS *ctrl;
> =C2=A0
> =C2=A0=09ctrl =3D nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
> =C2=A0=09=09=09=09=C2=A0=C2=A0=C2=A0
> NV0073_CTRL_CMD_DP_CONFIG_STREAM, sizeof(*ctrl));
> -=09if (WARN_ON(IS_ERR(ctrl)))
> -=09=09return;
> +=09if (IS_ERR(ctrl))
> +=09=09return PTR_ERR(ctrl);
> =C2=A0
> =C2=A0=09ctrl->subDeviceInstance =3D 0;
> =C2=A0=09ctrl->head =3D head;
> @@ -429,12 +429,20 @@ r535_sor_dp_vcpi(struct nvkm_ior *sor, int
> head, u8 slot, u8 slot_nr, u16 pbn, u
> =C2=A0=09ctrl->MST.sendACT =3D 0;
> =C2=A0=09ctrl->MST.singleHeadMSTPipeline =3D 0;
> =C2=A0=09ctrl->MST.bEnableAudioOverRightPanel =3D 0;
> -=09WARN_ON(nvkm_gsp_rm_ctrl_wr(&disp->rm.objcom, ctrl));
> +=09return nvkm_gsp_rm_ctrl_wr(&disp->rm.objcom, ctrl);
> +}
> +
> +static void
> +r535_sor_dp_vcpi(struct nvkm_ior *sor, int head, u8 slot, u8
> slot_nr, u16 pbn, u16 aligned_pbn)
> +{
> +=09const struct nvkm_rm_api *rmapi =3D sor->disp-
> >engine.subdev.device->gsp->rm->api;
> +
> +=09WARN_ON(rmapi->disp->dp.vcpi(sor, head, slot, slot_nr, pbn,
> aligned_pbn));
> =C2=A0}
> =C2=A0
> =C2=A0static int
> -r535_sor_dp_sst(struct nvkm_ior *sor, int head, bool ef,
> -=09=09u32 watermark, u32 hblanksym, u32 vblanksym)
> +r535_dp_sst(struct nvkm_ior *sor, int head, bool ef,
> +=09=C2=A0=C2=A0=C2=A0 u32 watermark, u32 hblanksym, u32 vblanksym)
> =C2=A0{
> =C2=A0=09struct nvkm_disp *disp =3D sor->disp;
> =C2=A0=09struct NV0073_CTRL_CMD_DP_CONFIG_STREAM_PARAMS *ctrl;
> @@ -461,6 +469,15 @@ r535_sor_dp_sst(struct nvkm_ior *sor, int head,
> bool ef,
> =C2=A0=09return nvkm_gsp_rm_ctrl_wr(&disp->rm.objcom, ctrl);
> =C2=A0}
> =C2=A0
> +static int
> +r535_sor_dp_sst(struct nvkm_ior *sor, int head, bool ef,
> +=09=09u32 watermark, u32 hblanksym, u32 vblanksym)
> +{
> +=09const struct nvkm_rm_api *rmapi =3D sor->disp-
> >engine.subdev.device->gsp->rm->api;
> +
> +=09return rmapi->disp->dp.sst(sor, head, ef, watermark,
> hblanksym, vblanksym);
> +}
> +
> =C2=A0static const struct nvkm_ior_func_dp
> =C2=A0r535_sor_dp =3D {
> =C2=A0=09.sst =3D r535_sor_dp_sst,
> @@ -1771,6 +1788,8 @@ r535_disp =3D {
> =C2=A0=09.dp =3D {
> =C2=A0=09=09.get_caps =3D r535_dp_get_caps,
> =C2=A0=09=09.set_indexed_link_rates =3D
> r535_dp_set_indexed_link_rates,
> +=09=09.sst =3D r535_dp_sst,
> +=09=09.vcpi =3D r535_dp_vcpi,
> =C2=A0=09},
> =C2=A0=09.chan =3D {
> =C2=A0=09=09.set_pushbuf =3D r535_disp_chan_set_pushbuf,
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/disp.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/disp.c
> index a96e31c2d80b..8a23837f356e 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/disp.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/disp.c
> @@ -5,6 +5,7 @@
> =C2=A0#include <rm/rm.h>
> =C2=A0
> =C2=A0#include <engine/disp.h>
> +#include <engine/disp/ior.h>
> =C2=A0#include <engine/disp/outp.h>
> =C2=A0
> =C2=A0#include "nvhw/drf.h"
> @@ -74,6 +75,67 @@ r570_disp_chan_set_pushbuf(struct nvkm_disp *disp,
> s32 oclass, int inst, struct
> =C2=A0=09return nvkm_gsp_rm_ctrl_wr(&gsp->internal.device.subdevice,
> ctrl);
> =C2=A0}
> =C2=A0
> +static int
> +r570_dp_vcpi(struct nvkm_ior *sor, int head, u8 slot, u8 slot_nr,
> u16 pbn, u16 aligned_pbn)
> +{
> +=09struct nvkm_disp *disp =3D sor->disp;
> +=09NV0073_CTRL_CMD_DP_CONFIG_STREAM_PARAMS *ctrl;
> +
> +=09ctrl =3D nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
> +=09=09=09=09=C2=A0=C2=A0=C2=A0
> NV0073_CTRL_CMD_DP_CONFIG_STREAM, sizeof(*ctrl));
> +=09if (IS_ERR(ctrl))
> +=09=09return PTR_ERR(ctrl);
> +
> +=09ctrl->subDeviceInstance =3D 0;
> +=09ctrl->head =3D head;
> +=09ctrl->sorIndex =3D sor->id;
> +=09ctrl->dpLink =3D sor->asy.link =3D=3D 2;
> +=09ctrl->bEnableOverride =3D 1;
> +=09ctrl->bMST =3D 1;
> +=09ctrl->hBlankSym =3D 0;
> +=09ctrl->vBlankSym =3D 0;
> +=09ctrl->colorFormat =3D 0;
> +=09ctrl->bEnableTwoHeadOneOr =3D 0;
> +=09ctrl->singleHeadMultistreamMode =3D 0;
> +=09ctrl->MST.slotStart =3D slot;
> +=09ctrl->MST.slotEnd =3D slot + slot_nr - 1;
> +=09ctrl->MST.PBN =3D pbn;
> +=09ctrl->MST.Timeslice =3D aligned_pbn;
> +=09ctrl->MST.sendACT =3D 0;
> +=09ctrl->MST.singleHeadMSTPipeline =3D 0;
> +=09ctrl->MST.bEnableAudioOverRightPanel =3D 0;
> +=09return nvkm_gsp_rm_ctrl_wr(&disp->rm.objcom, ctrl);
> +}
> +
> +static int
> +r570_dp_sst(struct nvkm_ior *sor, int head, bool ef,
> +=09=C2=A0=C2=A0=C2=A0 u32 watermark, u32 hblanksym, u32 vblanksym)
> +{
> +=09struct nvkm_disp *disp =3D sor->disp;
> +=09NV0073_CTRL_CMD_DP_CONFIG_STREAM_PARAMS *ctrl;
> +
> +=09ctrl =3D nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
> +=09=09=09=09=C2=A0=C2=A0=C2=A0
> NV0073_CTRL_CMD_DP_CONFIG_STREAM, sizeof(*ctrl));
> +=09if (IS_ERR(ctrl))
> +=09=09return PTR_ERR(ctrl);
> +
> +=09ctrl->subDeviceInstance =3D 0;
> +=09ctrl->head =3D head;
> +=09ctrl->sorIndex =3D sor->id;
> +=09ctrl->dpLink =3D sor->asy.link =3D=3D 2;
> +=09ctrl->bEnableOverride =3D 1;
> +=09ctrl->bMST =3D 0;
> +=09ctrl->hBlankSym =3D hblanksym;
> +=09ctrl->vBlankSym =3D vblanksym;
> +=09ctrl->colorFormat =3D 0;
> +=09ctrl->bEnableTwoHeadOneOr =3D 0;
> +=09ctrl->SST.bEnhancedFraming =3D ef;
> +=09ctrl->SST.tuSize =3D 64;
> +=09ctrl->SST.waterMark =3D watermark;
> +=09ctrl->SST.bEnableAudioOverRightPanel =3D 0;
> +=09return nvkm_gsp_rm_ctrl_wr(&disp->rm.objcom, ctrl);
> +}
> +
> =C2=A0static int
> =C2=A0r570_dp_set_indexed_link_rates(struct nvkm_outp *outp)
> =C2=A0{
> @@ -255,6 +317,8 @@ r570_disp =3D {
> =C2=A0=09.dp =3D {
> =C2=A0=09=09.get_caps =3D r570_dp_get_caps,
> =C2=A0=09=09.set_indexed_link_rates =3D
> r570_dp_set_indexed_link_rates,
> +=09=09.sst =3D r570_dp_sst,
> +=09=09.vcpi =3D r570_dp_vcpi,
> =C2=A0=09},
> =C2=A0=09.chan =3D {
> =C2=A0=09=09.set_pushbuf =3D r570_disp_chan_set_pushbuf,
> diff --git
> a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/disp.h
> b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/disp.h
> index 06e972835d77..742b25a2a12d 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/disp.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/disp.h
> @@ -256,6 +256,8 @@ typedef struct NV0073_CTRL_DP_CTRL_PARAMS {
> =C2=A0=C2=A0=C2=A0=C2=A0 NvU32 eightLaneDpcdBaseAddr;
> =C2=A0} NV0073_CTRL_DP_CTRL_PARAMS;
> =C2=A0
> +#define NV0073_CTRL_CMD_DP_CONFIG_STREAM=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0
> (0x731362U) /* finn: Evaluated from
> "(FINN_NV04_DISPLAY_COMMON_DP_INTERFACE_ID << 8) |
> NV0073_CTRL_CMD_DP_CONFIG_STREAM_PARAMS_MESSAGE_ID" */
> +
> =C2=A0typedef struct NV0073_CTRL_CMD_DP_CONFIG_STREAM_PARAMS {
> =C2=A0=C2=A0=C2=A0=C2=A0 NvU32=C2=A0 subDeviceInstance;
> =C2=A0=C2=A0=C2=A0=C2=A0 NvU32=C2=A0 head;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
> b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
> index 0fb0e67406c6..e9ac47d86b69 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
> @@ -6,6 +6,7 @@
> =C2=A0#ifndef __NVKM_RM_H__
> =C2=A0#define __NVKM_RM_H__
> =C2=A0#include "handles.h"
> +struct nvkm_ior;
> =C2=A0struct nvkm_outp;
> =C2=A0struct r535_gr;
> =C2=A0
> @@ -93,6 +94,10 @@ struct nvkm_rm_api {
> =C2=A0=09=09struct {
> =C2=A0=09=09=09int (*get_caps)(struct nvkm_disp *, int
> *link_bw, bool *mst, bool *wm);
> =C2=A0=09=09=09int (*set_indexed_link_rates)(struct
> nvkm_outp *);
> +=09=09=09int (*sst)(struct nvkm_ior *, int head, bool
> ef,
> +=09=09=09=09=C2=A0=C2=A0 u32 watermark, u32 hblanksym, u32
> vblanksym);
> +=09=09=09int (*vcpi)(struct nvkm_ior *, int head,
> +=09=09=09=09=C2=A0=C2=A0=C2=A0 u8 slot, u8 slot_nr, u16 pbn,
> u16 aligned_pbn);
> =C2=A0=09=09} dp;
> =C2=A0
> =C2=A0=09=09struct {

