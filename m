Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF8DC44506
	for <nouveau@archiver.kernel.org>; Wed, 21 Jan 2026 20:51:39 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CDA3C10E88C;
	Wed, 21 Jan 2026 20:51:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Z117oDTN";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 849E8401CE;
	Wed, 21 Jan 2026 20:42:51 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769028171;
 b=FI90fjAUOckEL79i3//hx1WwHS3mwHV0EL00GwclB3gjLgMnLMifl4HFHuvgfVrPz8lFI
 py2FtJwpiT8C4lMZSo15GU0m5qVB5WR2B6JXPNPInLYnjDk+43rL5LNq9YHVCHDvFnxJoni
 q8K5pWLZ5vmSX9gPDaTJ3Tr1nT4St1O+Qt4lEXRVqrFY2aM/3YGWYECCFFNvGQa1/9pAvb8
 oY6uN7fqRp4KfgRvGt0gdlu2/U6YJhHOo/YUHE33ps4eJe7QIFVxippanJFI6numrEHhDhi
 iuY8wKRZmxqVezEwPFuPG39qc/zMz1VoeBnpywks2aaU2723tyYPEMuXA/xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769028171; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=VNBRhY5AEdHe1o4YiVQUpWoWvWsaZ+wkvtXcS+jEzEs=;
 b=YiHc89p1Ag8MwsR0f3+e5Zp/BflRvG8EA4ghTmbSQXRTDUnwtbB273HkCIhSMZpxMFHnL
 tAhCwJHE8e4ySAX6EhYwRrDF6HJdSLLpDNgWsKu3AscsgtUAmkCuiL+ncehJixBVcOOW2xS
 SCk+JGPhYLCX+3Il4RxgjrPCaocU0b6FYz71epSOrXSWj+unWuz+0O1A54iWugeFEKll+P9
 YVk+kq73Y51PT7QvDVupcEFemprxSwe2Mt4F1ynEXU6ePuaMXQgPquR9/bRyptitISNXzC3
 nWhRFvRgSoWT5FOjXJSN/Cj97BiKcjOkZ3m9PGqvAmLdonilndFgzTsyPyYQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id BB0EA400A8
	for <nouveau@lists.freedesktop.org>; Wed, 21 Jan 2026 20:42:48 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BF33410E888
	for <nouveau@lists.freedesktop.org>; Wed, 21 Jan 2026 20:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769028694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VNBRhY5AEdHe1o4YiVQUpWoWvWsaZ+wkvtXcS+jEzEs=;
	b=Z117oDTN3LWna8i469AjY/aQ5ED+g6L4nt0ZdZhsgLEnK7GVwmtJ+NVC6REMQxrd+mRjAt
	EXOzo7RAumE5T8tU1YcO8BHuhZlxZFTYLNHDbicYlsah0N78vFvDRiZYM5kPQCRkCmBwMO
	pcO7IuBHpg9XolPtO3mQ6QGcJ4atrpg=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-345-IoPBTWHWPcSxxAVe6GRnuQ-1; Wed, 21 Jan 2026 15:51:31 -0500
X-MC-Unique: IoPBTWHWPcSxxAVe6GRnuQ-1
X-Mimecast-MFC-AGG-ID: IoPBTWHWPcSxxAVe6GRnuQ_1769028691
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-50148a2a5baso7560221cf.2
        for <nouveau@lists.freedesktop.org>;
 Wed, 21 Jan 2026 12:51:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769028691; x=1769633491;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0iKPsynfeV/AFagJnudOoLK5V6XHpi66PHwvXdnyCgA=;
        b=MwX9dCD34wGgapFHli9V4gmE1h7h1p0XiOkJUZ89rrB7ti05iwvLmdSia5F1g/RTz2
         dqMMs6g0HzKMwGVsP0GhYQDwN4x7dzLCFcTOxTIfy9k3Mb79D8QuJIVIxcs1uFmW1IeT
         mCDVQVQVrHHlQ/SL8Ejj7jewYN5/+7nMeSGFuM0+n868W2KjxGM3CYFaJtSkM1JNAQBe
         nJgqMpNdtWo3I7KPyc59nXXP0jaVJ32FE3Vc2HQWGwNX4TATtDJcKQA0HKss4D3xS96G
         6hxtpQpqa4UY0CfMJBZjx9rPEXUAZ5ocjLIUadZaZOP5lP+0LLvw01YC3imjHxkzv7Q1
         bWWQ==
X-Gm-Message-State: AOJu0YxfLYzH8eoymLhBw8I2rbQbbjVq6IPSrl4SwiKFE97/PfAt6r3F
	SKwCMpWAz2HF06cZjwKgkb1hKtf+LwcgqhechEs88yhFI/vDdkK2AeThHCw9d5tXXKjzEjMlwVp
	MWOFByZhFmXKe6oihAxiRmufSpjE9J5apcBPLArYCkR9ihboMfEqxXUVH/89tVMK5bEY=
X-Gm-Gg: AZuq6aIBvn8D2yE5B5J8D5TOHxI6bqj8yuzRRgR9v+cOEic0omAWeZ9j4dc0f9ifPx6
	VRvmCPbpvmvmyKlX/Sylhnh2azyvDnUQ85WFLJJcCF7RYLuj5DV1uICPfwZfN0UOI9w41xhHUMT
	WnYdgwydT+TnjZ/WeBKx2Aad1F74C0LurrMhKJPI8bOt9bM//0HI98GFXX4T2znPpcm1wnDoM+P
	DUkPaB6/Y9TupOoM9gZ8Mgw7B53SuHVbNBHfsGEUFvs+aAddRy9eUgAUCvvrgjCVrkCqpUEW8Sk
	+StYSn+gsKabvlNlhFDx7nChz2GGv4SoTLfIwnw9oshHnAi8AaM+owjSX2xM5LlnvHZqD/uXoHC
	VeJx0Qw==
X-Received: by 2002:a05:622a:1a8d:b0:501:4ca3:7420 with SMTP id
 d75a77b69052e-502a163bfcamr297013601cf.36.1769028690727;
        Wed, 21 Jan 2026 12:51:30 -0800 (PST)
X-Received: by 2002:a05:622a:1a8d:b0:501:4ca3:7420 with SMTP id
 d75a77b69052e-502a163bfcamr297013371cf.36.1769028690277;
        Wed, 21 Jan 2026 12:51:30 -0800 (PST)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-502a1f1abb9sm115759991cf.30.2026.01.21.12.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 12:51:29 -0800 (PST)
Message-ID: <4ef0c88438476fd0e46cb4df79ddcd85d3f9df21.camel@redhat.com>
Subject: Re: [PATCH v3 2/2][RESEND 2] drm/nouveau: implement missing DCB
 connector types; gracefully handle unknown connectors
From: lyude@redhat.com
To: lxrmrz732@gmail.com, dakr@kernel.org, airlied@gmail.com
Date: Wed, 21 Jan 2026 15:51:29 -0500
In-Reply-To: <84d85163d167139c25da2faa60ec73ce0c3cbc09.camel@redhat.com>
References: <20251213005327.9495-1-lxrmrz732@gmail.com>
		 <20251213005327.9495-3-lxrmrz732@gmail.com>
	 <84d85163d167139c25da2faa60ec73ce0c3cbc09.camel@redhat.com>
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yjeex5HPY4SnmrdHcCsZnWRr02B9nsNMP0nVaBcM0P0_1769028691
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: D4DQVRQ46WOBNCL5IHD2BQATH5FMEMYP
X-Message-ID-Hash: D4DQVRQ46WOBNCL5IHD2BQATH5FMEMYP
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org, lxrmrz732@rocketmail.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/D4DQVRQ46WOBNCL5IHD2BQATH5FMEMYP/>
Archived-At: 
 <https://lore.freedesktop.org/4ef0c88438476fd0e46cb4df79ddcd85d3f9df21.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Just a heads up - I pushed this to drm-misc-fixes, but dim checkpatch
was complaining about the difference in authorship vs. S-O-B ("Alex
Ramirez" vs. "Alex Ram=C3=ADrez") so I updated the commit authorship to
"Alex Ram=C3=ADrez". In the future you probably want to make sure it uses
the the same name :).

Either way, thank you for the fixes!

On Wed, 2026-01-21 at 15:26 -0500, lyude@redhat.com wrote:
> Reviewed-by: Lyude Paul <lyude@redhat.com>
>=20
> I will push these upstream in a moment
>=20
> On Fri, 2025-12-12 at 19:53 -0500, lxrmrz732@gmail.com=C2=A0wrote:
> > From: Alex Ramirez <lxrmrz732@gmail.com>
> >=20
> > * Implement missing DCB connectors in uconn.c previously defined in
> > conn.h.
> > * Replace kernel WARN_ON macro with printk message to more
> > gracefully
> > signify
> > =C2=A0 an unknown connector was encountered.
> >=20
> > With this patch, unknown connectors are explicitly marked with
> > value
> > 0
> > (DCB_CONNECTOR_VGA) to match the tested current behavior. Although
> > 0xff
> > (DCB_CONNECTOR_NONE) may be more suitable, I don't want to
> > introduce
> > a breaking change.
> >=20
> > Fixes: 8b7d92cad953 ("drm/nouveau/kms/nv50-: create connectors
> > based
> > on nvkm info")
> > Link:
> > https://download.nvidia.com/open-gpu-doc/DCB/1/DCB-4.0-Specification.ht=
ml#_connector_table_entry
> > Signed-off-by: Alex Ram=C3=ADrez <lxrmrz732@rocketmail.com>
> > ---
> > =C2=A0.../gpu/drm/nouveau/nvkm/engine/disp/uconn.c=C2=A0 | 73 +++++++++=
+++++-
> > --
> > --
> > =C2=A01 file changed, 53 insertions(+), 20 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
> > b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
> > index 2dab6612c4fc..d1fed2beee63 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
> > @@ -191,27 +191,60 @@ nvkm_uconn_new(const struct nvkm_oclass
> > *oclass, void *argv, u32 argc, struct nv
> > =C2=A0=09spin_lock(&disp->client.lock);
> > =C2=A0=09if (!conn->object.func) {
> > =C2=A0=09=09switch (conn->info.type) {
> > -=09=09case DCB_CONNECTOR_VGA=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : args->v0.=
type =3D
> > NVIF_CONN_V0_VGA; break;
> > -=09=09case DCB_CONNECTOR_TV_0=C2=A0=C2=A0=C2=A0=C2=A0 :
> > -=09=09case DCB_CONNECTOR_TV_1=C2=A0=C2=A0=C2=A0=C2=A0 :
> > -=09=09case DCB_CONNECTOR_TV_3=C2=A0=C2=A0=C2=A0=C2=A0 : args->v0.type =
=3D
> > NVIF_CONN_V0_TV; break;
> > -=09=09case DCB_CONNECTOR_DMS59_0=C2=A0 :
> > -=09=09case DCB_CONNECTOR_DMS59_1=C2=A0 :
> > -=09=09case DCB_CONNECTOR_DVI_I=C2=A0=C2=A0=C2=A0 : args->v0.type =3D
> > NVIF_CONN_V0_DVI_I; break;
> > -=09=09case DCB_CONNECTOR_DVI_D=C2=A0=C2=A0=C2=A0 : args->v0.type =3D
> > NVIF_CONN_V0_DVI_D; break;
> > -=09=09case DCB_CONNECTOR_LVDS=C2=A0=C2=A0=C2=A0=C2=A0 : args->v0.type =
=3D
> > NVIF_CONN_V0_LVDS; break;
> > -=09=09case DCB_CONNECTOR_LVDS_SPWG: args->v0.type =3D
> > NVIF_CONN_V0_LVDS_SPWG; break;
> > -=09=09case DCB_CONNECTOR_DMS59_DP0:
> > -=09=09case DCB_CONNECTOR_DMS59_DP1:
> > -=09=09case DCB_CONNECTOR_DP=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :
> > -=09=09case DCB_CONNECTOR_mDP=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :
> > -=09=09case DCB_CONNECTOR_USB_C=C2=A0=C2=A0=C2=A0 : args->v0.type =3D
> > NVIF_CONN_V0_DP; break;
> > -=09=09case DCB_CONNECTOR_eDP=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : args->v0.=
type =3D
> > NVIF_CONN_V0_EDP; break;
> > -=09=09case DCB_CONNECTOR_HDMI_0=C2=A0=C2=A0 :
> > -=09=09case DCB_CONNECTOR_HDMI_1=C2=A0=C2=A0 :
> > -=09=09case DCB_CONNECTOR_HDMI_C=C2=A0=C2=A0 : args->v0.type =3D
> > NVIF_CONN_V0_HDMI; break;
> > +=09=09/* VGA */
> > +=09=09case DCB_CONNECTOR_DVI_A=09:
> > +=09=09case DCB_CONNECTOR_POD_VGA=09:
> > +=09=09case DCB_CONNECTOR_VGA=09=09: args->v0.type =3D
> > NVIF_CONN_V0_VGA; break;
> > +
> > +=09=09/* TV */
> > +=09=09case DCB_CONNECTOR_TV_0=09=09:
> > +=09=09case DCB_CONNECTOR_TV_1=09=09:
> > +=09=09case DCB_CONNECTOR_TV_2=09=09:
> > +=09=09case DCB_CONNECTOR_TV_SCART=09:
> > +=09=09case DCB_CONNECTOR_TV_SCART_D=09:
> > +=09=09case DCB_CONNECTOR_TV_DTERM=09:
> > +=09=09case DCB_CONNECTOR_POD_TV_3=09:
> > +=09=09case DCB_CONNECTOR_POD_TV_1=09:
> > +=09=09case DCB_CONNECTOR_POD_TV_0=09:
> > +=09=09case DCB_CONNECTOR_TV_3=09=09: args-
> > > v0.type =3D NVIF_CONN_V0_TV; break;
> > +
> > +=09=09/* DVI */
> > +=09=09case DCB_CONNECTOR_DVI_I_TV_1=09:
> > +=09=09case DCB_CONNECTOR_DVI_I_TV_0=09:
> > +=09=09case DCB_CONNECTOR_DVI_I_TV_2=09:
> > +=09=09case DCB_CONNECTOR_DVI_ADC=09:
> > +=09=09case DCB_CONNECTOR_DMS59_0=09:
> > +=09=09case DCB_CONNECTOR_DMS59_1=09:
> > +=09=09case DCB_CONNECTOR_DVI_I=09: args->v0.type =3D
> > NVIF_CONN_V0_DVI_I; break;
> > +=09=09case DCB_CONNECTOR_TMDS=09=09:
> > +=09=09case DCB_CONNECTOR_DVI_D=09: args->v0.type =3D
> > NVIF_CONN_V0_DVI_D; break;
> > +
> > +=09=09/* LVDS */
> > +=09=09case DCB_CONNECTOR_LVDS=09=09: args-
> > > v0.type =3D NVIF_CONN_V0_LVDS; break;
> > +=09=09case DCB_CONNECTOR_LVDS_SPWG=09: args->v0.type =3D
> > NVIF_CONN_V0_LVDS_SPWG; break;
> > +
> > +=09=09/* DP */
> > +=09=09case DCB_CONNECTOR_DMS59_DP0=09:
> > +=09=09case DCB_CONNECTOR_DMS59_DP1=09:
> > +=09=09case DCB_CONNECTOR_DP=09=09:
> > +=09=09case DCB_CONNECTOR_mDP=09=09:
> > +=09=09case DCB_CONNECTOR_USB_C=09: args->v0.type =3D
> > NVIF_CONN_V0_DP; break;
> > +=09=09case DCB_CONNECTOR_eDP=09=09: args->v0.type =3D
> > NVIF_CONN_V0_EDP; break;
> > +
> > +=09=09/* HDMI */
> > +=09=09case DCB_CONNECTOR_HDMI_0=09:
> > +=09=09case DCB_CONNECTOR_HDMI_1=09:
> > +=09=09case DCB_CONNECTOR_HDMI_C=09: args->v0.type =3D
> > NVIF_CONN_V0_HDMI; break;
> > +
> > +=09=09/*
> > +=09=09 * Dock & unused outputs.
> > +=09=09 * BNC, SPDIF, WFD, and detached LVDS go here.
> > +=09=09 */
> > =C2=A0=09=09default:
> > -=09=09=09WARN_ON(1);
> > +=09=09=09nvkm_warn(&(disp->engine.subdev),
> > +=09=09=09=09=C2=A0 "unimplemented connector type
> > 0x%02x\n",
> > +=09=09=09=09=C2=A0 conn->info.type);
> > +=09=09=09args->v0.type =3D NVIF_CONN_V0_VGA;
> > =C2=A0=09=09=09ret =3D -EINVAL;
> > =C2=A0=09=09=09break;
> > =C2=A0=09=09}

