Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00AF2C44506
	for <nouveau@archiver.kernel.org>; Wed, 21 Jan 2026 20:26:08 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9E1B410E25C;
	Wed, 21 Jan 2026 20:26:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="SoYgEswB";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 572A4401CE;
	Wed, 21 Jan 2026 20:17:20 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769026640;
 b=zIWwyU454MQ/GZVwPES8FDtx5d7rvmumS158Xpqyi4y/BfaGnCgwlDt6tKw3pjiVdmscy
 OZZs19c6U6hfNWov4/72k3+0YEzTiiY+kUL/b2YH9Rr7uHPbzes79WsAzwUwlN/RmqNrfTf
 6EbqrvILAmX4SQo3hyRx20wTrwDEKE7c8wKyoLshVZ54g2LxcEQJ1NhhYv4agVRh2VflrXa
 XMrxgg84C+FLeVIhau/eQpv/St+uyPfTzsPqbe44d/QjH/o9aVOB81+FYU+QclHuo8mINKH
 eqcz9jztEs6OJnwN/cpJSc2KCczGz5947kpSnuOCw1/8Zp1WkkD4dOhQgVqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769026640; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=r+01FFGo+A6JVvXrDS8Ldc/AgRsbyGoqoa/payqyJ6U=;
 b=irQKBxeCtVXC65QSntRv/pZ3WjoHSi3yZvQxRDUWwJqvwAq/StpREng+3sj3sxs6Nzy4a
 EVCrZ9KoaZ1i131AUEV/1eOHScgR8kBSvzrhbtJAWmHuOZP/3nVX4tgQuR39HJujhZbgCAV
 Gf+QF//bKBcmOA6AoV4P3lR+lVx23rx/80FAgAFVLdXiOY51wKX1AO/hvAE2erOD7tF9INZ
 qiryLpS/mSbVtdGG2YxsWGR6ahq54oDIqehn2F38MFYM03roQgf/tnUmKSrv3UFb+YEaGgX
 TJNo0UP98F7v78aCftrZ2qyxVUxv1kH1IfGpfmoJT0PcKvIcVt1Dsn6fHOtA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id AFCEB400AA
	for <nouveau@lists.freedesktop.org>; Wed, 21 Jan 2026 20:17:17 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A9C2A10E054
	for <nouveau@lists.freedesktop.org>; Wed, 21 Jan 2026 20:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769027163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r+01FFGo+A6JVvXrDS8Ldc/AgRsbyGoqoa/payqyJ6U=;
	b=SoYgEswBNsmAqYLcEW6rbtw73ifCpqwlfC/h3bRXrpcU5rr98wt1CU2RtmsMsdbYq3okVH
	b2vkjdj4hcCY/DAAYuQcLfFfDokDE6KWHp2WEheima8sy2b3PMOobaXlu3gKgGjcCbuSgL
	zpzipDy4jz3tDqP6U4M9IrYg/lHudyg=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-kxWZeHZtOHihCS_0r6a5FA-1; Wed, 21 Jan 2026 15:26:02 -0500
X-MC-Unique: kxWZeHZtOHihCS_0r6a5FA-1
X-Mimecast-MFC-AGG-ID: kxWZeHZtOHihCS_0r6a5FA_1769027162
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c6a291e7faso77854285a.3
        for <nouveau@lists.freedesktop.org>;
 Wed, 21 Jan 2026 12:26:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769027162; x=1769631962;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iZ//0Rqi/kD663+yK8nouQpryClAHW/0OdWgpHiF4Ak=;
        b=OBoOIw4l4V2WfszXiyxi4xLbq6qVewlZC8OTuGZjOz5+2lgK/QA/JH+Q421D23mnjD
         06pwpe5tC4PZqUs+tvLOSt4oRwpwc1doo6q7j9Tr/pZnlRHKIMXUjuMhKwDDetcCnQch
         a9N2IRx7/cXhwLqJNx9DQEmbn28e/UjZGk1cAJMPRy4fHDfLtCUWVSgsUcKekAktl63g
         z3816Pv69H+8iENHfV7R2HCh0ZCj9Sr1rMYe5PqAxtmsK5RS+BSY5qBOmwI6Np1D2+uY
         Ji4GO/ZnYl20fETdMuyiykgQxOK9+FuQPN6BwW/L1tSmEXVW2Zkmab8gjMuTKEUhzHf5
         t3pQ==
X-Gm-Message-State: AOJu0Yy9sYzAhVCQgH1/OGq2iqVKUuDAyGYCzwCZq6EUoAJNyTBMNZX8
	YqiRtXap7RSf7j1D6Emz2nMHS7+Zsfd5DanbjB/OiAQrm2umSbnbS7RSklSMFZ8dqa3lJEfpK3E
	bVeilUkF9dCnXilIHH3j8fXDutnNPe+4nNkOcZJ9uZGSZj+eCO1dz9+v5k0tVxGawCJs=
X-Gm-Gg: AZuq6aK2Xl4QQIo7UI1YB0NXIgJv+ImkDV5q9/DtFxVmOM+VPNTSh5JCy4nHzJTCUUl
	TJdd0ski1o5seaXl3e0K4SOV9VT1MyDdeT6ZkN7ZDOT7l/yXCBNI3LOY3nhWx+uIH/VeToX9Glv
	ytxs8BOQFun0DGfLAKtV06UjEMoaBOMPtwLEhd7fVUcOCUi/8qi14YMV43EFqRQgCZxVsWWgZ9h
	NhEOaFyKBAywfPc3hIIA8zy7Bfaql7+9h6fCVMfVFXY1walQL9zRQDGUW4SJlBVc5xmZsiVWCdc
	VWlxORBfgecG3uxKxWs7EYtMvrXvNf8yYIjt4SdQvB2bTK4AKXTxWWpZsmzKD6Lo2c/79541g2J
	NSCWcoQ==
X-Received: by 2002:a05:620a:2996:b0:8c5:38d1:7733 with SMTP id
 af79cd13be357-8c6a6979865mr2531685085a.83.1769027162074;
        Wed, 21 Jan 2026 12:26:02 -0800 (PST)
X-Received: by 2002:a05:620a:2996:b0:8c5:38d1:7733 with SMTP id
 af79cd13be357-8c6a6979865mr2531681985a.83.1769027161725;
        Wed, 21 Jan 2026 12:26:01 -0800 (PST)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c6a724eadcsm1330824085a.29.2026.01.21.12.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 12:26:01 -0800 (PST)
Message-ID: <84d85163d167139c25da2faa60ec73ce0c3cbc09.camel@redhat.com>
Subject: Re: [PATCH v3 2/2][RESEND 2] drm/nouveau: implement missing DCB
 connector types; gracefully handle unknown connectors
From: lyude@redhat.com
To: lxrmrz732@gmail.com, dakr@kernel.org, airlied@gmail.com
Date: Wed, 21 Jan 2026 15:26:00 -0500
In-Reply-To: <20251213005327.9495-3-lxrmrz732@gmail.com>
References: <20251213005327.9495-1-lxrmrz732@gmail.com>
	 <20251213005327.9495-3-lxrmrz732@gmail.com>
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8cuhye8P8Ha7yCD5WpIxBdwXL6cFmJChchSrjYrMGPs_1769027162
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 4WVHUR6B2OXAQWHGYA257G27V3SESJZQ
X-Message-ID-Hash: 4WVHUR6B2OXAQWHGYA257G27V3SESJZQ
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4WVHUR6B2OXAQWHGYA257G27V3SESJZQ/>
Archived-At: 
 <https://lore.freedesktop.org/84d85163d167139c25da2faa60ec73ce0c3cbc09.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

I will push these upstream in a moment

On Fri, 2025-12-12 at 19:53 -0500, lxrmrz732@gmail.com wrote:
> From: Alex Ramirez <lxrmrz732@gmail.com>
>=20
> * Implement missing DCB connectors in uconn.c previously defined in
> conn.h.
> * Replace kernel WARN_ON macro with printk message to more gracefully
> signify
> =C2=A0 an unknown connector was encountered.
>=20
> With this patch, unknown connectors are explicitly marked with value
> 0
> (DCB_CONNECTOR_VGA) to match the tested current behavior. Although
> 0xff
> (DCB_CONNECTOR_NONE) may be more suitable, I don't want to introduce
> a breaking change.
>=20
> Fixes: 8b7d92cad953 ("drm/nouveau/kms/nv50-: create connectors based
> on nvkm info")
> Link:
> https://download.nvidia.com/open-gpu-doc/DCB/1/DCB-4.0-Specification.html=
#_connector_table_entry
> Signed-off-by: Alex Ram=C3=ADrez <lxrmrz732@rocketmail.com>
> ---
> =C2=A0.../gpu/drm/nouveau/nvkm/engine/disp/uconn.c=C2=A0 | 73 +++++++++++=
+++---
> --
> =C2=A01 file changed, 53 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
> index 2dab6612c4fc..d1fed2beee63 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
> @@ -191,27 +191,60 @@ nvkm_uconn_new(const struct nvkm_oclass
> *oclass, void *argv, u32 argc, struct nv
> =C2=A0=09spin_lock(&disp->client.lock);
> =C2=A0=09if (!conn->object.func) {
> =C2=A0=09=09switch (conn->info.type) {
> -=09=09case DCB_CONNECTOR_VGA=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : args->v0.ty=
pe =3D
> NVIF_CONN_V0_VGA; break;
> -=09=09case DCB_CONNECTOR_TV_0=C2=A0=C2=A0=C2=A0=C2=A0 :
> -=09=09case DCB_CONNECTOR_TV_1=C2=A0=C2=A0=C2=A0=C2=A0 :
> -=09=09case DCB_CONNECTOR_TV_3=C2=A0=C2=A0=C2=A0=C2=A0 : args->v0.type =
=3D
> NVIF_CONN_V0_TV; break;
> -=09=09case DCB_CONNECTOR_DMS59_0=C2=A0 :
> -=09=09case DCB_CONNECTOR_DMS59_1=C2=A0 :
> -=09=09case DCB_CONNECTOR_DVI_I=C2=A0=C2=A0=C2=A0 : args->v0.type =3D
> NVIF_CONN_V0_DVI_I; break;
> -=09=09case DCB_CONNECTOR_DVI_D=C2=A0=C2=A0=C2=A0 : args->v0.type =3D
> NVIF_CONN_V0_DVI_D; break;
> -=09=09case DCB_CONNECTOR_LVDS=C2=A0=C2=A0=C2=A0=C2=A0 : args->v0.type =
=3D
> NVIF_CONN_V0_LVDS; break;
> -=09=09case DCB_CONNECTOR_LVDS_SPWG: args->v0.type =3D
> NVIF_CONN_V0_LVDS_SPWG; break;
> -=09=09case DCB_CONNECTOR_DMS59_DP0:
> -=09=09case DCB_CONNECTOR_DMS59_DP1:
> -=09=09case DCB_CONNECTOR_DP=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :
> -=09=09case DCB_CONNECTOR_mDP=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :
> -=09=09case DCB_CONNECTOR_USB_C=C2=A0=C2=A0=C2=A0 : args->v0.type =3D
> NVIF_CONN_V0_DP; break;
> -=09=09case DCB_CONNECTOR_eDP=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : args->v0.ty=
pe =3D
> NVIF_CONN_V0_EDP; break;
> -=09=09case DCB_CONNECTOR_HDMI_0=C2=A0=C2=A0 :
> -=09=09case DCB_CONNECTOR_HDMI_1=C2=A0=C2=A0 :
> -=09=09case DCB_CONNECTOR_HDMI_C=C2=A0=C2=A0 : args->v0.type =3D
> NVIF_CONN_V0_HDMI; break;
> +=09=09/* VGA */
> +=09=09case DCB_CONNECTOR_DVI_A=09:
> +=09=09case DCB_CONNECTOR_POD_VGA=09:
> +=09=09case DCB_CONNECTOR_VGA=09=09: args->v0.type =3D
> NVIF_CONN_V0_VGA; break;
> +
> +=09=09/* TV */
> +=09=09case DCB_CONNECTOR_TV_0=09=09:
> +=09=09case DCB_CONNECTOR_TV_1=09=09:
> +=09=09case DCB_CONNECTOR_TV_2=09=09:
> +=09=09case DCB_CONNECTOR_TV_SCART=09:
> +=09=09case DCB_CONNECTOR_TV_SCART_D=09:
> +=09=09case DCB_CONNECTOR_TV_DTERM=09:
> +=09=09case DCB_CONNECTOR_POD_TV_3=09:
> +=09=09case DCB_CONNECTOR_POD_TV_1=09:
> +=09=09case DCB_CONNECTOR_POD_TV_0=09:
> +=09=09case DCB_CONNECTOR_TV_3=09=09: args-
> >v0.type =3D NVIF_CONN_V0_TV; break;
> +
> +=09=09/* DVI */
> +=09=09case DCB_CONNECTOR_DVI_I_TV_1=09:
> +=09=09case DCB_CONNECTOR_DVI_I_TV_0=09:
> +=09=09case DCB_CONNECTOR_DVI_I_TV_2=09:
> +=09=09case DCB_CONNECTOR_DVI_ADC=09:
> +=09=09case DCB_CONNECTOR_DMS59_0=09:
> +=09=09case DCB_CONNECTOR_DMS59_1=09:
> +=09=09case DCB_CONNECTOR_DVI_I=09: args->v0.type =3D
> NVIF_CONN_V0_DVI_I; break;
> +=09=09case DCB_CONNECTOR_TMDS=09=09:
> +=09=09case DCB_CONNECTOR_DVI_D=09: args->v0.type =3D
> NVIF_CONN_V0_DVI_D; break;
> +
> +=09=09/* LVDS */
> +=09=09case DCB_CONNECTOR_LVDS=09=09: args-
> >v0.type =3D NVIF_CONN_V0_LVDS; break;
> +=09=09case DCB_CONNECTOR_LVDS_SPWG=09: args->v0.type =3D
> NVIF_CONN_V0_LVDS_SPWG; break;
> +
> +=09=09/* DP */
> +=09=09case DCB_CONNECTOR_DMS59_DP0=09:
> +=09=09case DCB_CONNECTOR_DMS59_DP1=09:
> +=09=09case DCB_CONNECTOR_DP=09=09:
> +=09=09case DCB_CONNECTOR_mDP=09=09:
> +=09=09case DCB_CONNECTOR_USB_C=09: args->v0.type =3D
> NVIF_CONN_V0_DP; break;
> +=09=09case DCB_CONNECTOR_eDP=09=09: args->v0.type =3D
> NVIF_CONN_V0_EDP; break;
> +
> +=09=09/* HDMI */
> +=09=09case DCB_CONNECTOR_HDMI_0=09:
> +=09=09case DCB_CONNECTOR_HDMI_1=09:
> +=09=09case DCB_CONNECTOR_HDMI_C=09: args->v0.type =3D
> NVIF_CONN_V0_HDMI; break;
> +
> +=09=09/*
> +=09=09 * Dock & unused outputs.
> +=09=09 * BNC, SPDIF, WFD, and detached LVDS go here.
> +=09=09 */
> =C2=A0=09=09default:
> -=09=09=09WARN_ON(1);
> +=09=09=09nvkm_warn(&(disp->engine.subdev),
> +=09=09=09=09=C2=A0 "unimplemented connector type
> 0x%02x\n",
> +=09=09=09=09=C2=A0 conn->info.type);
> +=09=09=09args->v0.type =3D NVIF_CONN_V0_VGA;
> =C2=A0=09=09=09ret =3D -EINVAL;
> =C2=A0=09=09=09break;
> =C2=A0=09=09}

