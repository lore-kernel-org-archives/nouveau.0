Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17DD5C5DF74
	for <nouveau@archiver.kernel.org>; Mon, 17 Aug 2026 21:49:16 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4B9C810E962;
	Mon, 17 Aug 2026 21:49:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CU3M5wG1";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id EF372478A0;
	Mon, 17 Aug 2026 21:32:44 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787002364;
 b=MgMHumgxJghmrwV9UkOXp8yE5psJ7aG+qR+rDCenY6rlDINZrSGXqFY++1KxziTuegyZ7
 Mbl3Z5YpIYBk+ZZ118L6n2Z0CVS8YngpOODCNOyXlxeIsUCCx2qPOeDqpDMWJXJYZmUX13K
 4oFAmgLCnC7Mto25pGn1L1EfeWQnOh976yzTfmyz9xKO8PZOgtDfqAkXMtdF7WuG/wvd/az
 gHFBjeXndsIc6OTWeYPy4pNMoPrHoxA2PTXqZnB2OhWVTopWndYY04tGoyYO+piVUuZHvyQ
 6pYLUDTJfq3fYc+i3biYm1wYjH0DtlHPoMv3tBDcPMB7tv+8fglVLbBRJxmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787002364; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=WHPjAdant6tOQFGJyuVUkwr23uGSJGxYlerIeOqc1ls=;
 b=sdwzmljhcFnHAaQNK7thZEn2GiO+ABaBsqfuCwP1otLHTf5wZtFEfifwpKZ1m3X5zbA/k
 7ldXi9zShFpueVq/AMWTHAPqmqWwL01YpstsDprNO7Bv2klOVuVdgGDYV1ul9q5gx5awotO
 CMkUMNeIhCINN0sZn1M4kF9Yfq3Q35bQLdqDXpdqQT7Q91jh8weNKSe1gxyG+QF/ROoMxcR
 AFdkp3GDKyq5o+buLbQoVWsz29ETnkcED9A9ZJE3f+UKcmFNT561m6M+HcQtpH6+DHbXPOq
 OoQP5lKU1sHFOSLktSobvK+hI6enw6XtD4N7jE68AZm+3GMEPyjdskoNVKuw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B7F5E470D3
	for <nouveau@lists.freedesktop.org>; Mon, 17 Aug 2026 21:32:41 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B130810E952
	for <nouveau@lists.freedesktop.org>; Mon, 17 Aug 2026 21:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787003349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WHPjAdant6tOQFGJyuVUkwr23uGSJGxYlerIeOqc1ls=;
	b=CU3M5wG13HytjWldEEAEkyQBSl7f6Xnqr5ahZi7Zn8rjNbsaUCEzJcefUKKoBcn126GyoA
	7JITSnZT2jAs2gHmiPfJ6XFbJS/a5jZpBGbSTXOs5zM02RuYCq3kVtBmlSFYc+170QOaDO
	MjKV+CJUdMjX58oEmGE/f3NuUZcqK24=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-aYvFuiz8NTOU2cGXFF-DJQ-1; Mon, 17 Aug 2026 17:49:08 -0400
X-MC-Unique: aYvFuiz8NTOU2cGXFF-DJQ-1
X-Mimecast-MFC-AGG-ID: aYvFuiz8NTOU2cGXFF-DJQ_1787003348
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c1d30035dso30055171cf.2
        for <nouveau@lists.freedesktop.org>;
 Mon, 17 Aug 2026 14:49:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787003348; x=1787608148;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+NpT6IBbEDn6Pvgvg7L8CX+UbCOJ8acjU28kPL1GyDs=;
        b=bX1fUCbtZccXhD7U2miORRNT5EASQg2m0D/pxvBHawWGzq1LjfTzDeg95LU1oixYe4
         HbxXq1Vax7xZXIrpQTS42eGM8hYhkwwjgEXZH9fZMUWBlYCu+EaYTnWJf/JlSCpTud4w
         qqegI2HxdNqi/dHftTN3mH4+uPw5SS7nTLJQZknng8bc/MszbdYzY4ayBrQ+l6OxlZWQ
         6a089/Gi5OYkapQkp2m0F1/6FDowD64HYbkBgBTRX/gIdTeH43tZdUNkP+f8v9OZ+Pjl
         4jmxQppb+dMqIXpvcvPHDmoo0cy/L8Qj/c29q1ppW29HSnz1xly7X7zMQWBAJwezt4rR
         ui9A==
X-Forwarded-Encrypted: i=1;
 AHgh+RogNdktJq3HvtJS7RyxRabC2b0a93owOKoZiVp/BYDbLBVF3uuQrZowRVjpz6zdYgIYGcC4CauJ@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxW/QPnRWLnybhy5Q8ph0TSQs4He2in0jJNTu0G+mKaStslWQv
	NHwkj8Wj0b2f17jL643/z8++O9Nv9j786b7T1FfnLx+z5ZxkLZypoVrxh1bTv37sVo/fcrOQqbs
	umbPfTlc31wqCadyfM6B2sTGKBlp0JEm8dHLtFiwfmJYPuZJyEutybT8FECTCRVbwIFE=
X-Gm-Gg: AR+sD13z0vroJJXNJTPsWKcUd+2omiYraf7xHpxx53QCqSTEpy4SwF0VXbvBmuQ85LW
	vYQbe7GQmMJ9TadYs11CPc5RBIlO8l7aB/iO8zO5dcpalEK9lg9jjVaL8fFokA2wF6E2E3S3wDC
	V2KCc0y7Zg18+TgDr2DhC/4VqbSccZPvMv4nVKJK1ouNXDreq/+dJ0wNIfyWelEdV3yFR5ig8il
	h2T7PY3c15QPEFRgx1w3mgF3MAb07a+o0V86w75m51/t8ypiWS6gQaCZMc/Si6w3e6X5jj7SYee
	BG0cD4iQw2zdBs0xARYTXA/W/TRx70YdkfhJhKSmNnDem//2kPTCyUf3hn1oej93CZ2XsgJO
X-Received: by 2002:ac8:5ccf:0:b0:528:22:8c61 with SMTP id
 d75a77b69052e-52d854f3ce2mr312378091cf.38.1787003347729;
        Mon, 17 Aug 2026 14:49:07 -0700 (PDT)
X-Received: by 2002:ac8:5ccf:0:b0:528:22:8c61 with SMTP id
 d75a77b69052e-52d854f3ce2mr312377741cf.38.1787003347331;
        Mon, 17 Aug 2026 14:49:07 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-52db625c90csm24270971cf.27.2026.08.17.14.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 14:49:06 -0700 (PDT)
Message-ID: <2e606cab65a7c7134ade630b17c52aaa4017dca8.camel@redhat.com>
Subject: Re: [PATCH 2/7] nouveau/gsp: fix HDMI vendor infoframes on GB20x
From: lyude@redhat.com
To: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
	linux-kernel@vger.kernel.org
Date: Mon, 17 Aug 2026 17:49:05 -0400
In-Reply-To: <20260814235705.59132-3-mohamedahmedegypt2001@gmail.com>
References: <20260814235705.59132-1-mohamedahmedegypt2001@gmail.com>
	 <20260814235705.59132-3-mohamedahmedegypt2001@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BvR6vjDmrjwi2F29ZVINDcGd57Mgxtatc0erWKQuKVQ_1787003348
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: KCYF7YMTJB26HMALF7SYAH2TH6IYI7H3
X-Message-ID-Hash: KCYF7YMTJB26HMALF7SYAH2TH6IYI7H3
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KCYF7YMTJB26HMALF7SYAH2TH6IYI7H3/>
Archived-At: 
 <https://lore.freedesktop.org/2e606cab65a7c7134ade630b17c52aaa4017dca8.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat, 2026-08-15 at 03:57 +0400, Mohamed Ahmed wrote:
> The GSP path reuses the GV100 direct-MMIO infoframe writers on every
> chip. On GB20x that is only half right as while the legacy SF AVI
> unit is
> unchanged, the legacy VSI unit at 0x6f0100 was removed, so
> gv100_sor_hdmi_infoframe_vsi() writes into a reserved area and no
> vendor
> infoframe ever reaches the wire. This affects HDMI-VIC signalling
> which
> can impact some 4K modes for legacy HDMI 1.4 sinks.
>=20
> Select the SOR functions per GPU family in r535_sor_new(), keyed on
> the display root class from the RM GPU table and use the new
> generic-infoframe VSI writer on GB20x. Everything else stays on the
> r535 table.
>=20
> Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
> ---
> =C2=A0.../nouveau/nvkm/subdev/gsp/rm/r535/disp.c=C2=A0=C2=A0=C2=A0 | 29
> ++++++++++++++++++-
> =C2=A01 file changed, 28 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
> index 1155f079b0c3..96febd01da78 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
> @@ -36,6 +36,8 @@
> =C2=A0
> =C2=A0#include <rm/gpu.h>
> =C2=A0
> +#include <nvif/class.h>
> +
> =C2=A0#include <nvhw/drf.h>
> =C2=A0
> =C2=A0#include "nvrm/disp.h"
> @@ -587,6 +589,16 @@ r535_sor_hdmi =3D {
> =C2=A0=09.audio =3D r535_sor_hdmi_audio,
> =C2=A0};
> =C2=A0
> +static const struct nvkm_ior_func_hdmi
> +gb202_sor_hdmi =3D {
> +=09.ctrl =3D r535_sor_hdmi_ctrl,
> +=09/* The legacy AVI unit is unchanged on GB20x. */
> +=09.infoframe_avi =3D gv100_sor_hdmi_infoframe_avi,
> +=09.infoframe_vsi =3D gb202_sor_hdmi_infoframe_vsi,
> +=09.audio =3D r535_sor_hdmi_audio,
> +=09.frl_train =3D r535_sor_frl_train,
> +};
> +

This is the right approach, but I think this might make more sense to
move into drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb202.c and then
reference it back here.

> =C2=A0static const struct nvkm_ior_func
> =C2=A0r535_sor =3D {
> =C2=A0=09.hdmi =3D &r535_sor_hdmi,
> @@ -595,10 +607,25 @@ r535_sor =3D {
> =C2=A0=09.bl =3D &r535_sor_bl,
> =C2=A0};
> =C2=A0
> +static const struct nvkm_ior_func
> +gb202_sor =3D {
> +=09.hdmi =3D &gb202_sor_hdmi,
> +=09.dp =3D &r535_sor_dp,
> +=09.hda =3D &r535_sor_hda,
> +=09.bl =3D &r535_sor_bl,
> +};
> +
> =C2=A0static int
> =C2=A0r535_sor_new(struct nvkm_disp *disp, int id)
> =C2=A0{
> -=09return nvkm_ior_new_(&r535_sor, disp, SOR, id, true/*XXX:
> hda cap*/);
> +=09const struct nvkm_rm_gpu *gpu =3D disp->engine.subdev.device-
> >gsp->rm->gpu;
> +=09const struct nvkm_ior_func *func =3D &r535_sor;
> +
> +=09/* NVD5.0 (GB20x and later) reorganised the SF HDMI packet
> units. */
> +=09if (gpu->disp.class.root >=3D GB202_DISP)
> +=09=09func =3D &gb202_sor;
> +
> +=09return nvkm_ior_new_(func, disp, SOR, id, true/*XXX: hda
> cap*/);
> =C2=A0}
> =C2=A0
> =C2=A0static int

