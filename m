Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A65C5B572
	for <nouveau@archiver.kernel.org>; Mon, 17 Aug 2026 22:05:27 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E315110E96C;
	Mon, 17 Aug 2026 22:05:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gVkJgeOV";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 897B2478A7;
	Mon, 17 Aug 2026 21:48:56 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787003336;
 b=q4wTGc4qYZFy4y01xATdnzDRz1woFcq7zLyGEvaq893281XKlPxvlHUjSFWd6Z3DDDgCW
 epO7O/KxXrmfx8ukKV4ARCCAToGG1K8deFplTdWmMoiDBkfy0l9N+lnaT0wSKiqcbN4Te3j
 MqI6CpgUQiTRq/6sqF6yAVBAdppoK1rnVUGhvWHVhTpvFltkZLftEtSzsIicUyxhQiUBZBQ
 E21G9E887XBlPmPcZWnTUIVO8EVk+leZTU3Y8doFh92aN6Qh8K/gLX6XdQWEKkaBgxYuMk5
 TNkM95MajGrdjCRXDLt7QQ8SAbtjxqrlJP9sGr/VQdQy1iE1AvTu3XBbaLsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787003336; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Q0zCqEWjUtp6OA82xeCDRDufI5MEj5TbGUEaLnvhhSo=;
 b=VmKeMBPlNwCJoGMg5accza2ky9fbfbX4mlRcURd5W+T0SVahHlkUMAAJXjvIv0AKw9Pvs
 tw/5+k/9U4wkBmfOmGWaM/2zC3OMz0mJoC16dwFtWkbIrf6caJrYIRJAz4v/3d6FKXZ1gqh
 H1Bv4HTSr/pWFNKzRV6yfo/g6IP4NEWigXIZmiMxX4r1rW+HmRBb1T1yb50+nEI7DLcgYEI
 XZ5pX94OmN24lHPvB1Ub5KCveRaWaguBBqUgDrTAt2syeFkKvwbi1idIe6dGLyEeEV3mDik
 h5u6mCP3mVxifSuSyZCPMMKtpmEIHLY2OQfonLas9POYtr0OZ5EF5z7JJC0Q==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 5531147475
	for <nouveau@lists.freedesktop.org>; Mon, 17 Aug 2026 21:48:54 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD5D10E47F
	for <nouveau@lists.freedesktop.org>; Mon, 17 Aug 2026 22:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787004322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q0zCqEWjUtp6OA82xeCDRDufI5MEj5TbGUEaLnvhhSo=;
	b=gVkJgeOVYjsGEM4LOttv+OjIY3irU/GiFPW6L95k/Amy9GP88mgbYbNXChpDDp6STaRdHI
	I+7YD1/x91Zhw6LPyIIxMYTPYxGxW+ozvH53UWEmeosPF13FhELfBoTscoC+GnvDczHuVj
	iPrejyCk/yptNaI4agUjkB3HKlXYuCI=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-jhGMqoIoO_2171AxR7PMTw-1; Mon, 17 Aug 2026 18:05:21 -0400
X-MC-Unique: jhGMqoIoO_2171AxR7PMTw-1
X-Mimecast-MFC-AGG-ID: jhGMqoIoO_2171AxR7PMTw_1787004320
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-933023a5980so659300185a.3
        for <nouveau@lists.freedesktop.org>;
 Mon, 17 Aug 2026 15:05:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787004320; x=1787609120;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E766Td4gI7Jjb64efynVnNkp8ShDWVNTDmV+hJtlk18=;
        b=esMbn1PnLVbR7wLP7EGLcv7guqkhSdBaTN2Zf5KuoPgYsOtt3x2zTGPbOgpimH1mfh
         f6ZVKwNuvL5uJ0hPWzlOC2H3U9Vw2RG0x6VD/nJfC4IlvGag4vB6MuZVgGEUGlhhLUKw
         iBWGIYk/XwHIbGB+vr0GOZCyrcE2nVAROgQ/It4tGyuZPdYgUC7Cy4ekSLy/po1WNv6r
         Ewi9mmWYAibw7biZj9Tnn9G9JsK8mt/YJrfPGQpIfl+3dDifh/wFMT1aXVLCUIc+Uyow
         YW8v6T7tPZ4iVf2ly5CwRm1CVt04cWJq9Zbl7q2Ce/dPPJ0pYvqfl7WP0OWqvKub+OSH
         y6yg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpVjpPtoXvNugm5otaXPCSrsh49tyoIQEoa40fkTDAUbjwLJvNO/3GV5GlWoK3z0uFvMw6AVOQa@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtSG1jw2BrGP/EpyByQMXHIRPb7l8XlF/rfywyndTWknQsYOH4
	zX1KPFJf/uV964u7JA7pIWyd8bLWKOS6bNeBR5ryuLRRS+UvFsbonekn052eQ6joWYJp9L5X088
	2hH95JARXJgoj9OwJU5W/wd7g7dYNe5rXkfcjy1tzfMdACophmUsaZMWhSXrW4wWh/3g=
X-Gm-Gg: AR+sD10RTsiDc6uAZi/PI3fR2Y7+xoiBgyCa0qA6yYgrp638apQOnXwiMmCQU6Nk2mZ
	D7mSymDVYap7lsAxSHfQV73QFY2Vata7HBnvKFNJ9b0oXgiZd+hp/i22UJKrzTp4N47yzVc+PWY
	LG43ultGkpyq2VE2A417tN3ZH/OdlW33aYeo48iOL9OjH14bsxHfT10wlTFt1vBJgmSqYbSarN4
	vzHyf05fvfgVRBJsDANv3mV3t313RNdR3lB9nGNi9Apkziq5odCseM0CiC/BYHKIhY+8e2ejivW
	o7ndNq0plNFhvgDLU4tswAb+y/FkNf20n2leiZs63/BwJDFr72wre3gUtuKm3KaL5U+fIDbw
X-Received: by 2002:a05:620a:5698:b0:926:e8e6:3c34 with SMTP id
 af79cd13be357-936d22aa9e8mr2397229485a.21.1787004320079;
        Mon, 17 Aug 2026 15:05:20 -0700 (PDT)
X-Received: by 2002:a05:620a:5698:b0:926:e8e6:3c34 with SMTP id
 af79cd13be357-936d22aa9e8mr2397223685a.21.1787004319557;
        Mon, 17 Aug 2026 15:05:19 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-937033ce024sm145372885a.25.2026.08.17.15.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 15:05:18 -0700 (PDT)
Message-ID: <b5842d14094d858d875d480648ae368100102abb.camel@redhat.com>
Subject: Re: [PATCH 4/7] nouveau/gsp: use per-version DP_CONFIG_STREAM
 params on r570 firmware
From: lyude@redhat.com
To: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
	linux-kernel@vger.kernel.org
Date: Mon, 17 Aug 2026 18:05:17 -0400
In-Reply-To: <20260814235705.59132-5-mohamedahmedegypt2001@gmail.com>
References: <20260814235705.59132-1-mohamedahmedegypt2001@gmail.com>
	 <20260814235705.59132-5-mohamedahmedegypt2001@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jXPTxmCrdbafny43nLmNNSXG8KHXC5Ta8C_tXKRAZJ8_1787004320
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: MTAP4SAOCSU65XG2L2QA4BOGNFBK5BB2
X-Message-ID-Hash: MTAP4SAOCSU65XG2L2QA4BOGNFBK5BB2
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MTAP4SAOCSU65XG2L2QA4BOGNFBK5BB2/>
Archived-At: 
 <https://lore.freedesktop.org/b5842d14094d858d875d480648ae368100102abb.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat, 2026-08-15 at 03:57 +0400, Mohamed Ahmed wrote:
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
> =C2=A0.../nouveau/nvkm/subdev/gsp/rm/r535/disp.c=C2=A0=C2=A0=C2=A0 | 25 +=
++++++-
> =C2=A0.../nouveau/nvkm/subdev/gsp/rm/r570/disp.c=C2=A0=C2=A0=C2=A0 | 64
> +++++++++++++++++++
> =C2=A0.../nvkm/subdev/gsp/rm/r570/nvrm/disp.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 2 +
> =C2=A0.../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h=C2=A0=C2=A0 |=C2=A0 5 +=
+
> =C2=A04 files changed, 93 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
> index f51ad7c754d8..dd632767aea5 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
> @@ -403,7 +403,7 @@ r535_sor_dp_audio(struct nvkm_ior *sor, int head,
> bool enable)
> =C2=A0}
> =C2=A0
> =C2=A0static void
> -r535_sor_dp_vcpi(struct nvkm_ior *sor, int head, u8 slot, u8
> slot_nr, u16 pbn, u16 aligned_pbn)
> +r535_dp_vcpi(struct nvkm_ior *sor, int head, u8 slot, u8 slot_nr,
> u16 pbn, u16 aligned_pbn)
> =C2=A0{
> =C2=A0=09struct nvkm_disp *disp =3D sor->disp;
> =C2=A0=09struct NV0073_CTRL_CMD_DP_CONFIG_STREAM_PARAMS *ctrl;
> @@ -434,9 +434,17 @@ r535_sor_dp_vcpi(struct nvkm_ior *sor, int head,
> u8 slot, u8 slot_nr, u16 pbn, u
> =C2=A0=09WARN_ON(nvkm_gsp_rm_ctrl_wr(&disp->rm.objcom, ctrl));
> =C2=A0}
> =C2=A0
> +static void
> +r535_sor_dp_vcpi(struct nvkm_ior *sor, int head, u8 slot, u8
> slot_nr, u16 pbn, u16 aligned_pbn)
> +{
> +=09const struct nvkm_rm_api *rmapi =3D sor->disp-
> >engine.subdev.device->gsp->rm->api;
> +
> +=09rmapi->disp->dp.vcpi(sor, head, slot, slot_nr, pbn,
> aligned_pbn);
> +}
> +
> =C2=A0static int
> -r535_sor_dp_sst(struct nvkm_ior *sor, int head, bool ef,
> -=09=09u32 watermark, u32 hblanksym, u32 vblanksym)
> +r535_dp_sst(struct nvkm_ior *sor, int head, bool ef,
> +=09=C2=A0=C2=A0=C2=A0 u32 watermark, u32 hblanksym, u32 vblanksym)
> =C2=A0{
> =C2=A0=09struct nvkm_disp *disp =3D sor->disp;
> =C2=A0=09struct NV0073_CTRL_CMD_DP_CONFIG_STREAM_PARAMS *ctrl;
> @@ -463,6 +471,15 @@ r535_sor_dp_sst(struct nvkm_ior *sor, int head,
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
> @@ -1828,6 +1845,8 @@ r535_disp =3D {
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
> index a96e31c2d80b..61f82e15ff39 100644
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
> +static void
> +r570_dp_vcpi(struct nvkm_ior *sor, int head, u8 slot, u8 slot_nr,
> u16 pbn, u16 aligned_pbn)
> +{
> +=09struct nvkm_disp *disp =3D sor->disp;
> +=09NV0073_CTRL_CMD_DP_CONFIG_STREAM_PARAMS *ctrl;
> +
> +=09ctrl =3D nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
> +=09=09=09=09=C2=A0=C2=A0=C2=A0
> NV0073_CTRL_CMD_DP_CONFIG_STREAM, sizeof(*ctrl));
> +=09if (WARN_ON(IS_ERR(ctrl)))
> +=09=09return;
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
> +=09WARN_ON(nvkm_gsp_rm_ctrl_wr(&disp->rm.objcom, ctrl));
> +}

Should we maybe just update this function so that it has a return value
rather than doing the WARN_ONs explicitly under the HAL? Seems more in
line with what we do elsewhere, even if the only action the caller ends
up taking in response is printing a kernel warning.

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
> index a9af94adf9ef..e0c10a7e3452 100644
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
> +=09=09=09void (*vcpi)(struct nvkm_ior *, int head,
> +=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 u8 slot, u8 slot_nr, u16 pbn,
> u16 aligned_pbn);
> =C2=A0=09=09} dp;
> =C2=A0
> =C2=A0=09=09struct {

