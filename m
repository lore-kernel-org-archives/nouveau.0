Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2DAEC44508
	for <nouveau@archiver.kernel.org>; Wed, 21 Jan 2026 20:22:05 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 50A5C10E25C;
	Wed, 21 Jan 2026 20:22:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="c8pkWHbY";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 08ED9401CE;
	Wed, 21 Jan 2026 20:13:17 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769026396;
 b=IQ6+OCYa4jZzU+swuL0lAWsWrqZOwox/KlKX1P8kBhHFZUyYCwktePv3E12njGZApGRs/
 2IEKW3eDdDOp1BoBvu6LTiSv7eQRDktI1wQ7a0de+mz6xAZGbWl22I4vWD7b4P2/n6KxnVW
 pA3ggqBQN1ER8jC8WnreL1+DlD1lYx1mHb6O8rgmqBbY/C5l7aQKvivVehRRBT5/WI8wJbM
 05i5BfGQy6XL+CPC9jWhcEZv3nvpEfFtYsvavTY2d9Bst9RYBketPHbb69M6MyNemX8qezq
 4I3kU9afgZWl3gj6puxKLk9xvqzZZk5MtKus01PwmgEONaQGnwFzOYlJ2JxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769026396; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=n3XTOFlpwGo1Iv1YMspblfr7eDd74F18SQq+0rvrI4w=;
 b=rLSARB5Cb/meUOgTIRWc6POnJP1iFbqQP1rhant38AO4RHq4XiAV6zK1xC+MM6ZT0n8Gn
 lnl+FCbHeF8oCocuD+aUKShE2UIWkrjyigojSieHRcFnA1mBECzokQiVBnlL8+GwcKZN3IY
 5k3EaY+fNPELov80nT2Pqbm893gY6JPmNx9tGJoY56Gha9aW3QU9j1+tkPe6O5xGvbEEyfb
 1w799gBso/MBWCPAdpa7Tv9zgHHh/YjPjRG1b9NuEQgLO4/r+Ag2YXOZBjhH6vevZ7xrnhl
 IYwwa8PK07Aa7fuZPUsqXbvdeBds8WojhzTidDHJg3gH481n7wIdo4nIA34g==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 2E62F400A8
	for <nouveau@lists.freedesktop.org>; Wed, 21 Jan 2026 20:13:14 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 198C810E054
	for <nouveau@lists.freedesktop.org>; Wed, 21 Jan 2026 20:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769026920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n3XTOFlpwGo1Iv1YMspblfr7eDd74F18SQq+0rvrI4w=;
	b=c8pkWHbY1ubB/Eb5sOQ7GEOjf/DlJjSs7jr1CORRhSZXr/XA8+APir6JVi8qtXrfdYRe3+
	BGLhaTc/PmOQRl2enXBHV6ozbxvSrl+Z4vRP4YkOra+HpjPPzt/RRtM4CNDhIY6lwNCsUk
	sbeGIA7NyfWhTBwMljmrxS37mhlC1lU=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-hPgK33sGMi206ka3kjzd-w-1; Wed, 21 Jan 2026 15:21:58 -0500
X-MC-Unique: hPgK33sGMi206ka3kjzd-w-1
X-Mimecast-MFC-AGG-ID: hPgK33sGMi206ka3kjzd-w_1769026918
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c6cfd52556so62079685a.0
        for <nouveau@lists.freedesktop.org>;
 Wed, 21 Jan 2026 12:21:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769026918; x=1769631718;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+rntkyJ8zN04I9wyHcG7A38Hsm5eIPf8uOVFzzvGsAY=;
        b=kNFzHzivH0ZhxD7kkT/uXPry2yZqfVW2eY9ObelOPnX/DAV9fCI5Gt08+iFQj5O3to
         yJw02WZu6ylIKc0aVYcNm9w1+7PTnnbldWVsad6IACi7UbCUG5oFUmRG6H3yazIACEGR
         474dyH3RB00LKj6jUQET05vxJ7OeDuo8yjgur6Aof12tnVDgC4S67Yow2KzaxE73Zkrh
         w7fLewHXTrK1zTUknSPdB73fmeTe/Tqb+KYvt3Tk2w1iiWKZWsYUyIKBbagMvAyzfK7e
         tXuE1uFxDbE4hZTV8hVPvhNMoC0ylVNvBs8nOHsKtjmm08agCVD41dwOe8786Wq/cFw6
         Bpow==
X-Gm-Message-State: AOJu0Yy6kY75TyflosIN+g6csP3gVbUo1lthWZKzMmvY5ycQiNL+5LH2
	UnqdrK/7JYJz1tf1pcPH4G2ILG+amVfbegEgzISWCEoJCu+aBgJO+cVJACF2qhDlgMhttBn5/gy
	iNuht+v9O601hsm5uuxJjO4uXT8irzvq0RGTUxjdHFopRX3sk6fg9Xklmgy9G06aWJQU=
X-Gm-Gg: AZuq6aLLnt38CXuTOJOZRQlLLDHpQ+yJwDKGsiyooYZ89hbwv1xZ94GmeEu8mfR3oC9
	n1IdIqc3xtFCw1tJ8ErY8TBybEl2WUdgK9TxWhedtBa5ZWmvVJCzmAsKifH2iDzlAwwOqhiBqGf
	6SmypDRJKhYLdw5XRany8dqleNN25/k9J9odX4PKr/8H2036+Y8PRsAf2VuHPQSYXB3pJ4WT4aN
	nHOiIovjFVe8wXuVuTaBu8t5YXq+Cd24EArqKaIaFeW5VMUJRud4tjrTcaLCat76X9MBbtLa6Xr
	UhJJg3V8X8gYqCwVAN7sB3Sq2VeEbmy/q87FnTBlA8xi/ULmRZKCEykkmskCBalviH4VOmpsmVI
	GAIFxgg==
X-Received: by 2002:a05:620a:25d0:b0:8a9:eb31:1033 with SMTP id
 af79cd13be357-8c6da8afc27mr107518385a.30.1769026918207;
        Wed, 21 Jan 2026 12:21:58 -0800 (PST)
X-Received: by 2002:a05:620a:25d0:b0:8a9:eb31:1033 with SMTP id
 af79cd13be357-8c6da8afc27mr107514585a.30.1769026917659;
        Wed, 21 Jan 2026 12:21:57 -0800 (PST)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c6a72639fesm1325960685a.44.2026.01.21.12.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 12:21:57 -0800 (PST)
Message-ID: <73c3d481391bd630477d93c2d24c9931ea849f7b.camel@redhat.com>
Subject: Re: [PATCH v3 1/2][RESEND 2] drm/nouveau: add missing DCB connector
 types
From: lyude@redhat.com
To: lxrmrz732@gmail.com, dakr@kernel.org, airlied@gmail.com
Date: Wed, 21 Jan 2026 15:21:56 -0500
In-Reply-To: <20251213005327.9495-2-lxrmrz732@gmail.com>
References: <20251213005327.9495-1-lxrmrz732@gmail.com>
	 <20251213005327.9495-2-lxrmrz732@gmail.com>
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DxgFYceQSk-Kj4PFapCUqWLlq-MdGfiz3ZanzIoUhhk_1769026918
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: H5JPLDPL2742K5M24FKHEO7LP7Z6ZYMO
X-Message-ID-Hash: H5JPLDPL2742K5M24FKHEO7LP7Z6ZYMO
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/H5JPLDPL2742K5M24FKHEO7LP7Z6ZYMO/>
Archived-At: 
 <https://lore.freedesktop.org/73c3d481391bd630477d93c2d24c9931ea849f7b.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi! Sorry, this totally flew past my radar. This looks almost perfect,
just some small corrections below:

On Fri, 2025-12-12 at 19:53 -0500, lxrmrz732@gmail.com wrote:
> From: Alex Ramirez <lxrmrz732@gmail.com>
>=20
> * Add missing DCB connectors in conn.h as per the NVIDIA DCB
> specification.
>=20
> A lot of connector logic was rewritten for Linux v6.5; some display
> connector types
> went unaccounted-for which caused kernel warnings on devices with the
> now-unsupported
> DCB connectors. This patch adds all of the DCB connectors as defined
> by NVIDIA to the
> dcb_connector_type enum to bring back support for these connectors to
> the new logic.
>=20
> Fixes: 8b7d92cad953 ("drm/nouveau/kms/nv50-: create connectors based
> on nvkm info")
> Link:
> https://download.nvidia.com/open-gpu-doc/DCB/1/DCB-4.0-Specification.html=
#_connector_table_entry
> Signed-off-by: Alex Ram=C3=ADrez <lxrmrz732@rocketmail.com>
> ---
> =C2=A0.../nouveau/include/nvkm/subdev/bios/conn.h=C2=A0=C2=A0 | 84 ++++++=
++++++++---
> --
> =C2=A01 file changed, 63 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/bios/conn.h
> b/drivers/gpu/drm/nouveau/include/nvkm/subdev/bios/conn.h
> index d1beaad0c82b..538306522d9a 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/bios/conn.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/bios/conn.h
> @@ -1,28 +1,70 @@
> =C2=A0/* SPDX-License-Identifier: MIT */
> =C2=A0#ifndef __NVBIOS_CONN_H__
> =C2=A0#define __NVBIOS_CONN_H__
> +
> =C2=A0enum dcb_connector_type {
> -=09DCB_CONNECTOR_VGA =3D 0x00,
> -=09DCB_CONNECTOR_TV_0 =3D 0x10,
> -=09DCB_CONNECTOR_TV_1 =3D 0x11,
> -=09DCB_CONNECTOR_TV_3 =3D 0x13,
> -=09DCB_CONNECTOR_DVI_I =3D 0x30,
> -=09DCB_CONNECTOR_DVI_D =3D 0x31,
> -=09DCB_CONNECTOR_DMS59_0 =3D 0x38,
> -=09DCB_CONNECTOR_DMS59_1 =3D 0x39,
> -=09DCB_CONNECTOR_LVDS =3D 0x40,
> -=09DCB_CONNECTOR_LVDS_SPWG =3D 0x41,
> -=09DCB_CONNECTOR_DP =3D 0x46,
> -=09DCB_CONNECTOR_eDP =3D 0x47,
> -=09DCB_CONNECTOR_mDP =3D 0x48,
> -=09DCB_CONNECTOR_HDMI_0 =3D 0x60,
> -=09DCB_CONNECTOR_HDMI_1 =3D 0x61,
> -=09DCB_CONNECTOR_HDMI_C =3D 0x63,
> -=09DCB_CONNECTOR_DMS59_DP0 =3D 0x64,
> -=09DCB_CONNECTOR_DMS59_DP1 =3D 0x65,
> -=09DCB_CONNECTOR_WFD=09=3D 0x70,
> -=09DCB_CONNECTOR_USB_C =3D 0x71,
> -=09DCB_CONNECTOR_NONE =3D 0xff
> +=09/* Analog outputs */
> +=09DCB_CONNECTOR_VGA =3D 0x00,=09=09// VGA 15-pin
> connector
> +=09DCB_CONNECTOR_DVI_A =3D 0x01,=09=09// DVI-A
> +=09DCB_CONNECTOR_POD_VGA =3D 0x02,=09=09// Pod - VGA 15-pin
> connector
> +=09DCB_CONNECTOR_TV_0 =3D 0x10,=09=09// TV - Composite
> Out
> +=09DCB_CONNECTOR_TV_1 =3D 0x11,=09=09// TV - S-Video Out
> +=09DCB_CONNECTOR_TV_2 =3D 0x12,=09=09// TV - S-Video
> Breakout - Composite
> +=09DCB_CONNECTOR_TV_3 =3D 0x13,=09=09// HDTV Component -
> YPrPb
> +=09DCB_CONNECTOR_TV_SCART =3D 0x14,=09=09// TV - SCART
> Connector
> +=09DCB_CONNECTOR_TV_SCART_D =3D 0x16,=09// TV - Composite
> SCART over D-connector
> +=09DCB_CONNECTOR_TV_DTERM =3D 0x17,=09=09// HDTV - D-
> connector (EIAJ4120)
> +=09DCB_CONNECTOR_POD_TV_3 =3D 0x18,=09=09// Pod - HDTV -
> YPrPb
> +=09DCB_CONNECTOR_POD_TV_1 =3D 0x19,=09=09// Pod - S-Video
> +=09DCB_CONNECTOR_POD_TV_0 =3D 0x1a,=09=09// Pod - Composite
> +
> +=09/* DVI digital outputs */
> +=09DCB_CONNECTOR_DVI_I_TV_1 =3D 0x20,=09// DVI-I-TV-S-Video
> +=09DCB_CONNECTOR_DVI_I_TV_0 =3D 0x21,=09// DVI-I-TV-
> Composite
> +=09DCB_CONNECTOR_DVI_I_TV_2 =3D 0x22,=09// DVI-I-TV-S-Video
> Breakout-Composite
> +=09DCB_CONNECTOR_DVI_I =3D 0x30,=09=09// DVI-I
> +=09DCB_CONNECTOR_DVI_D =3D 0x31,=09=09// DVI-D
> +=09DCB_CONNECTOR_DVI_ADC =3D 0x32,=09=09// Apple Display
> Connector (ADC)
> +=09DCB_CONNECTOR_DMS59_0 =3D 0x38,=09=09// LFH-DVI-I-1
> +=09DCB_CONNECTOR_DMS59_1 =3D 0x39,=09=09// LFH-DVI-I-2
> +=09DCB_CONNECTOR_BNC =3D 0x3c,=09=09// BNC Connector
> [for SDI?]
> +
> +=09/* LVDS / TMDS digital outputs */
> +=09DCB_CONNECTOR_LVDS =3D 0x40,=09=09// LVDS-SPWG-
> Attached [is this name correct?]
> +=09DCB_CONNECTOR_LVDS_SPWG =3D 0x41,=09=09// LVDS-OEM-
> Attached (non-removable)
> +=09DCB_CONNECTOR_LVDS_REM =3D 0x42,=09=09// LVDS-SPWG-
> Detached [following naming above]
> +=09DCB_CONNECTOR_LVDS_SPWG_REM =3D 0x43,=09// LVDS-OEM-Detached
> (removable)
> +=09DCB_CONNECTOR_TMDS =3D 0x45,=09=09// TMDS-OEM-Attached
> (non-removable)
> +
> +=09/* DP digital outputs */
> +=09DCB_CONNECTOR_DP =3D 0x46,=09=09// DisplayPort
> External Connector
> +=09DCB_CONNECTOR_eDP =3D 0x47,=09=09// DisplayPort
> Internal Connector
> +=09DCB_CONNECTOR_mDP =3D 0x48,=09=09// DisplayPort
> (Mini) External Connector
> +
> +=09/* Dock outputs (not used) */
> +=09DCB_CONNECTOR_DOCK_VGA_0 =3D 0x50,=09// VGA 15-pin if not
> docked
> +=09DCB_CONNECTOR_DOCK_VGA_1 =3D 0x51,=09// VGA 15-pin if
> docked
> +=09DCB_CONNECTOR_DOCK_DVI_I_0 =3D 0x52,=09// DVI-I if not
> docked
> +=09DCB_CONNECTOR_DOCK_DVI_I_1 =3D 0x53,=09// DVI-I if docked
> +=09DCB_CONNECTOR_DOCK_DVI_D_0 =3D 0x54,=09// DVI-D if not
> docked
> +=09DCB_CONNECTOR_DOCK_DVI_D_1 =3D 0x55,=09// DVI-D if docked
> +=09DCB_CONNECTOR_DOCK_DP_0 =3D 0x56,=09=09//
> DisplayPort if not docked
> +=09DCB_CONNECTOR_DOCK_DP_1 =3D 0x57,=09=09//
> DisplayPort if docked
> +=09DCB_CONNECTOR_DOCK_mDP_0 =3D 0x58,=09// DisplayPort
> (Mini) if not docked
> +=09DCB_CONNECTOR_DOCK_mDP_1 =3D 0x59,=09// DisplayPort
> (Mini) if docked
> +
> +=09/* HDMI? digital outputs */
> +=09DCB_CONNECTOR_HDMI_0 =3D 0x60,=09=09// 3-Pin DIN Stereo
> Connector [for real?]

Yeah this one is weird and suspicious and seems very likely to be a
documentation typo.

I wonder if maybe it used to be DIN, but at some point nvidia
mistakenly reused the ID. Though I'm not sure how much sense that
actually makes, considering that I would have expected a connector like
this to then be in/near the 0x1-0x20 range like all of the other legacy
analog connectors in that case.=20

Since it's just a comment, I'll fix this up myself before pushing this
and add an explainer comment while I ask nvidia about this.

Reviewed-by: Lyude Paul <lyude@redhat.com>

> +=09DCB_CONNECTOR_HDMI_1 =3D 0x61,=09=09// HDMI-A connector
> +=09DCB_CONNECTOR_SPDIF =3D 0x62,=09=09// Audio S/PDIF
> connector
> +=09DCB_CONNECTOR_HDMI_C =3D 0x63,=09=09// HDMI-C (Mini)
> connector
> +
> +=09/* Misc. digital outputs */
> +=09DCB_CONNECTOR_DMS59_DP0 =3D 0x64,=09=09// LFH-DP-1
> +=09DCB_CONNECTOR_DMS59_DP1 =3D 0x65,=09=09// LFH-DP-2
> +=09DCB_CONNECTOR_WFD =3D 0x70,=09=09// Virtual connector
> for Wifi Display (WFD)
> +=09DCB_CONNECTOR_USB_C =3D 0x71,=09=09// [DP over USB-C;
> not present in docs]
> +=09DCB_CONNECTOR_NONE =3D 0xff=09=09// Skip Entry
> =C2=A0};
> =C2=A0
> =C2=A0struct nvbios_connT {

