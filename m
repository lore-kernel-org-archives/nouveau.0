Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64161C5DF97
	for <nouveau@archiver.kernel.org>; Fri, 21 Aug 2026 21:52:24 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AA65C10F3D0;
	Fri, 21 Aug 2026 21:52:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YKxmkSFp";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 67A3547ADB;
	Fri, 21 Aug 2026 21:35:45 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787348145;
 b=FDFfcE5hXokYHokRDMfB5urI8AAqZFMios2QGnIB7DJFDgpmdvtyvvEFaCrguiuj+IWij
 Zqq2jzZoqAFWD0bp9pykVzEalvtz11OJCs877Dcr3zfow1B3hDk5sh4W5UgH3heVSjdNkL5
 VNqZxvwQmpyDD8QB1+UxvjgC8PjkjmCIhqFG7AiQgzKCcJwLTFQ1Ic/G/NvCto0hNQcCEI7
 gHGsmxROGs0tHmprIG9jI2H2AlG9Wrvk4KcYkoyEt+HbB9Gsrb4Y6E6O16b19oZk2gnrNAF
 N3XJU6LwKUu7L3NHkgoHQ2PFZFUgu02oLR8UfmvCvIK6uK6TqJEqACxziA+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787348145; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=dxTIrj5toN2wZbiMOEAp8/1FtnWPmkO2zwot3SvJAQ4=;
 b=cFTqsQhnUvmXOfKkyh8VysJGes/EbmCB/tq/A6SE6tExoK/6Z/Qm8XJibl8MFA1IVBv4U
 hUaO8oS6nuQtsrsbbetb+CdhsnxJkn5CLpWcbPS/Rkr+PiCWkrc8VBmC+qYbE5jBCnRRB02
 qCCQsfO/04FF2/hGxwNM3Hk0bU4VzHep/CJ/lQtp/+wCgqPVXWJhA6OyRm9e5z+AEnyhCch
 GRZm8FFsT7PY76e55Gal/IGkTSxQ9htsKXMbI9tkYntqIlP4d7s1nA6A/9bVNufMl7G4ZY3
 TtNzcy3Wd4smHuAzvQxL6j37cepZfZTd5oDDQXviUg6q8jeuSy6LxnTZWeFA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A92DD474BB
	for <nouveau@lists.freedesktop.org>; Fri, 21 Aug 2026 21:35:41 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6A17A10F3C4
	for <nouveau@lists.freedesktop.org>; Fri, 21 Aug 2026 21:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787349138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dxTIrj5toN2wZbiMOEAp8/1FtnWPmkO2zwot3SvJAQ4=;
	b=YKxmkSFppHTQQWO1l4+B1s2rMJ0zbdtauTwhJKciqYV8uKC07d4sQcqsh8Yz5HbD2hRUjG
	1n7xRtvXNMImnogV2vXQ8wo/8hh/YZ2K/KZfE0XlRbeLyC9sOKdzOgRG0CMBkyNmt5RAIY
	oFMdB2yfnCeJqKbMVvSOQKhfeUCkQ50=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-TZQy2EGcOfW1QiDngDof4w-1; Fri, 21 Aug 2026 17:52:16 -0400
X-MC-Unique: TZQy2EGcOfW1QiDngDof4w-1
X-Mimecast-MFC-AGG-ID: TZQy2EGcOfW1QiDngDof4w_1787349136
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93494527488so242506085a.3
        for <nouveau@lists.freedesktop.org>;
 Fri, 21 Aug 2026 14:52:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787349136; x=1787953936;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KWxHNd99XGX0A91OcehYQd0todjKC95ynNoZwWY1F3w=;
        b=DlVF4fOM2yHa2J0iHBxWRksIGwM08BFy/gW1Ei7bU+bseNm3jHFrvJLh+ONZLFTO4n
         rwpyhAUvnQm3H4mp1ci8z7XONXcfNdX5Koui6VZDfdHj+isa+fr7FF/5BTEC9tKLNVM4
         mSxyl6ZUbA6rpucFG5mQhjXJKB7AqX5JLQXw8sNjcxA9FHiO+1/nC5YLOYc+yC5asUTB
         xkNz33GZS+1cLuoubXdUPkTFAm+S2EpJhHlYXppA3qSfp6GZ97w6InHQjF0so1EE2RrL
         pw/ztSDbI1E5AtWx/NxQwfAeX5QRKrOdrTeJLFEUEET7MFPf5rmXTHcLVANE7aH/zF+J
         QI7A==
X-Forwarded-Encrypted: i=1;
 AHgh+RouV4J6hHJiwJt6bT+2UrIFvaP9BPuboVWGhhRI4FUAof0XGdRJ3mJLhLPEJAbTZsgDweq3JV7S@lists.freedesktop.org
X-Gm-Message-State: AFuF++neTxjf3yHNuPNgm/eSZ0JSyNY+Zsq6rOmeBiaA/B/E5gryuztk
	rRlPDlpgWO5EbybZJGIfidpsGDULlYnyxoD4NLZd2uJptiykco0V3tiOwr0jOzvuYHTGQ51H4jd
	VU711LOLXmYOTRo2Pk50WosLmftLLQxsCIEUF1COI1kW/nBPCcGIIfRGBgfms5Iz3JUw=
X-Gm-Gg: AR+sD13tTilj+UUy2xYRLnSNpSe0jTBmWKNRwK4pKCHufmsbOrq5qO2ad3XbECOnexm
	RXaAHHSKqYsQEPvRy4HaUvWoMyj9ynJSnve75zThXTDgZEpkI/XiFkSyPFdupKiIxuifdHfWj5O
	TH6+s17UiJVgrJrI28F/TXGe7u9KPY6WbTlzqzIj557jxGc6tGF+GfFoUPeQlScz3fJIj+pPVhj
	HRYQN9bxUYmq5/ArViUOXEUDvRKALjISGPQNrhx2uyNiOlsnW32JzVaSKXUHH2lmACxnRLviuvo
	KiDFIMq09/2dhWNBSCvxwG/4oNmSM+pX6HF/U0qoxQu4Zb+buFZqqKKVROwnMpN7u7uExE3P
X-Received: by 2002:a05:620a:1d0d:b0:937:1710:f839 with SMTP id
 af79cd13be357-937395f9133mr938555685a.47.1787349135745;
        Fri, 21 Aug 2026 14:52:15 -0700 (PDT)
X-Received: by 2002:a05:620a:1d0d:b0:937:1710:f839 with SMTP id
 af79cd13be357-937395f9133mr938550485a.47.1787349135161;
        Fri, 21 Aug 2026 14:52:15 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93749e9f94bsm5008085a.37.2026.08.21.14.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 14:52:14 -0700 (PDT)
Message-ID: <66c8492e4018fa32c59aaef767a975fdc8887b41.camel@redhat.com>
Subject: Re: [PATCH v2 04/10] drm/nouveau/disp: fix HDMI vendor infoframes
 on GB20x
From: lyude@redhat.com
To: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
	linux-kernel@vger.kernel.org
Date: Fri, 21 Aug 2026 17:52:13 -0400
In-Reply-To: <20260820164929.17117-5-mohamedahmedegypt2001@gmail.com>
References: <20260820164929.17117-1-mohamedahmedegypt2001@gmail.com>
	 <20260820164929.17117-5-mohamedahmedegypt2001@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: guk9Y9NoBgYB2_rGQT1jq8TEMNh_6D7nqe826fvAP00_1787349136
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: SHPEIY5RJH4BBZBRRHBFDB5LM5UQNEW2
X-Message-ID-Hash: SHPEIY5RJH4BBZBRRHBFDB5LM5UQNEW2
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/SHPEIY5RJH4BBZBRRHBFDB5LM5UQNEW2/>
Archived-At: 
 <https://lore.freedesktop.org/66c8492e4018fa32c59aaef767a975fdc8887b41.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Thu, 2026-08-20 at 20:49 +0400, Mohamed Ahmed wrote:
> The GSP path reuses the GV100 direct-MMIO infoframe writers on every
> chip. On GB20x that is only half right as while the legacy SF AVI
> unit is
> unchanged, the legacy VSI unit at 0x6f0100 was removed, so
> gv100_sor_hdmi_infoframe_vsi() writes into a reserved area and no
> vendor
> infoframe ever reaches the HW. This affects HDMI-VIC signalling which
> can impact some 4K modes for legacy HDMI 1.4 sinks.
>=20
> GB20x (NVDisplay 5.0+) reorganised the SF HDMI packet units. Per
> NVIDIA's
> published C971/CA71 DISP_SF_USER class headers, only three legacy
> units
> remain (AVI at +0x000, GCP at +0x040, ACR at +0x080), and vendor
> infoframes must instead be sent through the shared generic infoframe
> units at +0x130, whose 9-dword packet slots are loaded through the
> shared data port at +0x3f0/+0x3f4.
>=20
> Add a VSI writer using the same programming sequence OpenRM uses on
> these chips (nvhdmipkt_C971.c, programAdvancedInfoframeC971()):
> disable
> the unit and wait for it to idle, clear the SENT status, write the
> packet
> through the data port with a zero inserted in HB3 after the three
> header
> bytes, then enable the unit for every-frame transmission during
> vblank.
> Generic unit 1 is used for the VSI, matching the slot assignment in
> NVIDIA's nvkms (NVHDMIPKT_TYPE_SHARED_GENERIC2, unit 0 is reserved
> for extended metadata packets and unit 2 for the HDR DRM infoframe,
> if those are wired up later).
>=20
> GB20x so far shared GA10x's display entry point. Give it its own,
> gb202_disp_new(), with a gb202_gsp_disp table that supplies the VSI
> writer to the GSP path and otherwise carries the same hooks as GA10x.
> The following fixes fill in the rest of the GB20x differences there.
>=20
> Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
> ---
> =C2=A0.../drm/nouveau/include/nvkm/engine/disp.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0 1 +
> =C2=A0.../gpu/drm/nouveau/nvkm/engine/device/base.c | 10 +-
> =C2=A0.../gpu/drm/nouveau/nvkm/engine/disp/Kbuild=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0.../gpu/drm/nouveau/nvkm/engine/disp/gb202.c=C2=A0 | 91
> +++++++++++++++++++
> =C2=A04 files changed, 98 insertions(+), 5 deletions(-)
> =C2=A0create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/gb202.c
>=20
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h
> b/drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h
> index 7903d7470d19..01145db32c53 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h
> @@ -87,4 +87,5 @@ int gp102_disp_new(struct nvkm_device *, enum
> nvkm_subdev_type, int inst, struct
> =C2=A0int gv100_disp_new(struct nvkm_device *, enum nvkm_subdev_type, int
> inst, struct nvkm_disp **);
> =C2=A0int tu102_disp_new(struct nvkm_device *, enum nvkm_subdev_type, int
> inst, struct nvkm_disp **);
> =C2=A0int ga102_disp_new(struct nvkm_device *, enum nvkm_subdev_type, int
> inst, struct nvkm_disp **);
> +int gb202_disp_new(struct nvkm_device *, enum nvkm_subdev_type, int
> inst, struct nvkm_disp **);
> =C2=A0#endif
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> index ea62dc97f118..96c8a5b29999 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> @@ -2846,7 +2846,7 @@ nv1b2_chipset =3D {
> =C2=A0=09.pci=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D { 0x00000001, gh100_pci_n=
ew },
> =C2=A0=09.timer=C2=A0=C2=A0=C2=A0 =3D { 0x00000001, gk20a_timer_new },
> =C2=A0=09.vfn=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D { 0x00000001, ga100_vfn_n=
ew },
> -=09.disp=C2=A0=C2=A0=C2=A0=C2=A0 =3D { 0x00000001, ga102_disp_new },
> +=09.disp=C2=A0=C2=A0=C2=A0=C2=A0 =3D { 0x00000001, gb202_disp_new },
> =C2=A0=09.fifo=C2=A0=C2=A0=C2=A0=C2=A0 =3D { 0x00000001, ga102_fifo_new }=
,
> =C2=A0};
> =C2=A0
> @@ -2862,7 +2862,7 @@ nv1b3_chipset =3D {
> =C2=A0=09.pci=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D { 0x00000001, gh100_pci_n=
ew },
> =C2=A0=09.timer=C2=A0=C2=A0=C2=A0 =3D { 0x00000001, gk20a_timer_new },
> =C2=A0=09.vfn=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D { 0x00000001, ga100_vfn_n=
ew },
> -=09.disp=C2=A0=C2=A0=C2=A0=C2=A0 =3D { 0x00000001, ga102_disp_new },
> +=09.disp=C2=A0=C2=A0=C2=A0=C2=A0 =3D { 0x00000001, gb202_disp_new },
> =C2=A0=09.fifo=C2=A0=C2=A0=C2=A0=C2=A0 =3D { 0x00000001, ga102_fifo_new }=
,
> =C2=A0};
> =C2=A0
> @@ -2878,7 +2878,7 @@ nv1b5_chipset =3D {
> =C2=A0=09.pci=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D { 0x00000001, gh100_pci_n=
ew },
> =C2=A0=09.timer=C2=A0=C2=A0=C2=A0 =3D { 0x00000001, gk20a_timer_new },
> =C2=A0=09.vfn=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D { 0x00000001, ga100_vfn_n=
ew },
> -=09.disp=C2=A0=C2=A0=C2=A0=C2=A0 =3D { 0x00000001, ga102_disp_new },
> +=09.disp=C2=A0=C2=A0=C2=A0=C2=A0 =3D { 0x00000001, gb202_disp_new },
> =C2=A0=09.fifo=C2=A0=C2=A0=C2=A0=C2=A0 =3D { 0x00000001, ga102_fifo_new }=
,
> =C2=A0};
> =C2=A0
> @@ -2894,7 +2894,7 @@ nv1b6_chipset =3D {
> =C2=A0=09.pci=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D { 0x00000001, gh100_pci_n=
ew },
> =C2=A0=09.timer=C2=A0=C2=A0=C2=A0 =3D { 0x00000001, gk20a_timer_new },
> =C2=A0=09.vfn=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D { 0x00000001, ga100_vfn_n=
ew },
> -=09.disp=C2=A0=C2=A0=C2=A0=C2=A0 =3D { 0x00000001, ga102_disp_new },
> +=09.disp=C2=A0=C2=A0=C2=A0=C2=A0 =3D { 0x00000001, gb202_disp_new },
> =C2=A0=09.fifo=C2=A0=C2=A0=C2=A0=C2=A0 =3D { 0x00000001, ga102_fifo_new }=
,
> =C2=A0};
> =C2=A0
> @@ -2910,7 +2910,7 @@ nv1b7_chipset =3D {
> =C2=A0=09.pci=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D { 0x00000001, gh100_pci_n=
ew },
> =C2=A0=09.timer=C2=A0=C2=A0=C2=A0 =3D { 0x00000001, gk20a_timer_new },
> =C2=A0=09.vfn=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D { 0x00000001, ga100_vfn_n=
ew },
> -=09.disp=C2=A0=C2=A0=C2=A0=C2=A0 =3D { 0x00000001, ga102_disp_new },
> +=09.disp=C2=A0=C2=A0=C2=A0=C2=A0 =3D { 0x00000001, gb202_disp_new },
> =C2=A0=09.fifo=C2=A0=C2=A0=C2=A0=C2=A0 =3D { 0x00000001, ga102_fifo_new }=
,
> =C2=A0};
> =C2=A0
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/Kbuild
> b/drivers/gpu/drm/nouveau/nvkm/engine/disp/Kbuild
> index e1aecd3fe96c..98d6ca5ac311 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/Kbuild
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/Kbuild
> @@ -27,6 +27,7 @@ nvkm-y +=3D nvkm/engine/disp/gp102.o
> =C2=A0nvkm-y +=3D nvkm/engine/disp/gv100.o
> =C2=A0nvkm-y +=3D nvkm/engine/disp/tu102.o
> =C2=A0nvkm-y +=3D nvkm/engine/disp/ga102.o
> +nvkm-y +=3D nvkm/engine/disp/gb202.o
> =C2=A0
> =C2=A0nvkm-y +=3D nvkm/engine/disp/udisp.o
> =C2=A0nvkm-y +=3D nvkm/engine/disp/uconn.o
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gb202.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gb202.c
> new file mode 100644
> index 000000000000..fa83aee35ae7
> --- /dev/null
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gb202.c
> @@ -0,0 +1,91 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2026 Valve Corp.
> + */
> +#include "priv.h"
> +#include "head.h"
> +#include "ior.h"
> +
> +#include <subdev/timer.h>
> +
> +/* GB20x (NVD5.0) reorganised the SF HDMI packet units. The AVI unit
> is
> + * unchanged from GV100, but the legacy VSI unit is gone. Vendor
> infoframes
> + * are sent through the shared generic infoframe units instead.
> Register
> + * layout per NVIDIA's clc971.h/clca71.h, programming sequence per
> + * nvhdmipkt_C971.c:programAdvancedInfoframeC971().
> + */
> +static void
> +gb202_sor_hdmi_infoframe_vsi(struct nvkm_ior *ior, int head, void
> *data, u32 size)
> +{
> +=09struct nvkm_device *device =3D ior->disp-
> >engine.subdev.device;
> +=09const u32 hoff =3D head * 0x400;
> +=09/* Generic infoframe unit 1, the slot NVIDIA's driver uses
> for the VSI. */
> +=09const u32 ctrl =3D 0x6f0138 + hoff;
> +=09u8 buf[36] =3D {};
> +=09int i;
> +
> +=09/* Disable the unit and wait for it to go idle. */
> +=09nvkm_mask(device, ctrl, 0x00000001, 0x00000000);
> +=09if (nvkm_msec(device, 2000,
> +=09=09if (!(nvkm_rd32(device, ctrl) & 0x00400000))
> +=09=09=09break;
> +=09) < 0)
> +=09=09return;
> +
> +=09if (!size)
> +=09=09return;
> +
> +=09/* Clear SENT status, and point the data port at unit 1's
> slot. */
> +=09nvkm_mask(device, ctrl, 0x00800000, 0x00800000);
> +=09nvkm_wr32(device, 0x6f03f0 + hoff, 0x00000001);
> +
> +=09/* The data port takes the raw packet, except that a zero is
> inserted
> +=09 * in HB3 after the three header bytes. A slot is 9 dwords
> (HB0-3 plus
> +=09 * up to 32 payload bytes). An HDMI infoframe carries at
> most PB0-27,
> +=09 * so the tail stays zero, and we always write the whole
> slot.
> +=09 */
> +=09size =3D min_t(u32, size, 31);
> +=09memcpy(buf, data, min_t(u32, size, 3));
> +=09if (size > 3)
> +=09=09memcpy(&buf[4], (u8 *)data + 3, size - 3);
> +
> +=09for (i =3D 0; i < 36; i +=3D 4) {
> +=09=09nvkm_wr32(device, 0x6f03f4 + hoff, buf[i + 0] |
> buf[i + 1] << 8 |
> +=09=09=09=09=09=09=C2=A0=C2=A0 buf[i + 2] << 16
> |
> +=09=09=09=09=09=09=C2=A0=C2=A0 (u32)buf[i + 3]
> << 24);
> +=09}
> +
> +=09/* No flip ID or scanline matching. */
> +=09nvkm_wr32(device, 0x6f013c + hoff, 0x00000000);
> +
> +=09/* ENABLE | RUN_MODE=3DALWAYS | LOC=3DVBLANK | OFFSET=3D1 |
> SIZE=3D0. */
> +=09nvkm_wr32(device, ctrl, 0x00000041);
> +
> +=09/* Audio priority low (the init value). */
> +=09nvkm_wr32(device, 0x6f03f8 + hoff, 0x00000002);
> +}
> +
> +/* GB20x is GSP-only. This table supplies the register programming
> the
> + * GSP-RM display path needs from the chip.
> + */
> +static const struct nvkm_disp_func
> +gb202_gsp_disp =3D {
> +=09.uevent =3D &gv100_disp_chan_uevent,
> +=09.ramht_size =3D 0x2000,
> +=09.gsp.intr =3D tu102_disp_intr,
> +=09.gsp.head_state =3D gv100_head_state,
> +=09.gsp.head_rgpos =3D gv100_head_rgpos,
> +=09.gsp.vblank_get =3D tu102_head_vblank_get,
> +=09.gsp.vblank_put =3D tu102_head_vblank_put,
> +=09.gsp.hdmi_gcp =3D tu102_sor_hdmi_gcp,
> +=09/* The legacy AVI unit is unchanged on GB20x. */
> +=09.gsp.hdmi_infoframe_avi =3D gv100_sor_hdmi_infoframe_avi,
> +=09.gsp.hdmi_infoframe_vsi =3D gb202_sor_hdmi_infoframe_vsi,
> +};
> +
> +int
> +gb202_disp_new(struct nvkm_device *device, enum nvkm_subdev_type
> type, int inst,
> +=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct nvkm_disp **pdisp)
> +{
> +=09return r535_disp_new(&gb202_gsp_disp, device, type, inst,
> pdisp);
> +}

