Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B198C5DF81
	for <nouveau@archiver.kernel.org>; Tue, 18 Aug 2026 20:28:29 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3A1B110ECDA;
	Tue, 18 Aug 2026 20:28:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bMUAMwpp";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B762347913;
	Tue, 18 Aug 2026 20:11:55 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787083915;
 b=B7u8jonLfYi020C6n2CwreG6ZI/5zW8TExcOSsL0HS/vfGphvYDPa4J6Es+xtJOBLy6ue
 Uslb2WsFSth27fAJqk0D0jFs/QBa0IlvsLaLtJ5IXM45hnd+yG2HgM6xlf+oCfZUVvGghud
 mK6umQz7psJcS1/1RXcR2qYsAjzFJ5GgAxI3nNBQleIZluH51zDe82D9mrLoc/b1YAyx+/H
 nnJdMEAR95DjP8yKnt3pUDkguw21a9YcZ8OtHY2dvyOPMVDHrSMtmOuKo0EEiA64+ouDpo5
 4Q7KNjA5ZJdlcyj3qAxZK+ViCT/+V2pPp0k+ZIfSTuGCDF6JFe+zzLKvMkdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787083915; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=U0ffqp7Xz/ZYVnnLDx+BG01wtPPh+Wbb40o+e3kNBjk=;
 b=jykP4ebda06G0UPRGZkaX/t95fxg52ecqD4fwAEvvvFQ8WBxvt1/VdwiTcROb4Ecg6BW0
 bFWamaadc7qcMz0RmF+h1Mm6/swVcwJEUIFJdQvgzMXHsTj2YiL1usDQYfAGaUJlznSjLDo
 GOvOuiGh3HeL/tWHlFvX708mrNWr78Rahs7KxaKr6Od6rq6fohfXQ8++tcu4zo0e39jOdOU
 6YaIoAdSOwdC2LKw1/sqqqL0Zkz9LRD641o3D143BgIeNJ9PLpA2jG7SI4POEPQdIH0q9yn
 5NkFxtTgXbJ8pAivzAxt3xxjT1JyQLNWlVCYzCIJsPG+Y/DsYBEhqWXIN2pQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 2FFE943E5F
	for <nouveau@lists.freedesktop.org>; Tue, 18 Aug 2026 20:11:52 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 42D4D10EC93
	for <nouveau@lists.freedesktop.org>; Tue, 18 Aug 2026 20:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787084902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U0ffqp7Xz/ZYVnnLDx+BG01wtPPh+Wbb40o+e3kNBjk=;
	b=bMUAMwppiC7dOU5aFWdxPHPRvv9bQHJFFJUgZtHhext4ug4Bc+c5VDyDyY3fTW0/xnOJOZ
	Pl+36PIjuD70G++5RZJh3W2QRrGfHj5oKW8VgVs89S1utd2Sxxf8mIn1Ebnb1CuB7yDSji
	0sDD+zyDS8li/C3Jc/cRu/nWGi9Tn9k=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-R5ydQSwdM7qGJtp4mcXCKQ-1; Tue, 18 Aug 2026 16:28:21 -0400
X-MC-Unique: R5ydQSwdM7qGJtp4mcXCKQ-1
X-Mimecast-MFC-AGG-ID: R5ydQSwdM7qGJtp4mcXCKQ_1787084901
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51bfe3fa93bso2521881cf.2
        for <nouveau@lists.freedesktop.org>;
 Tue, 18 Aug 2026 13:28:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787084901; x=1787689701;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g7sv2BOM2TPac5OT6sZnf4rDXBLeaI6F0QDOj1pWNlY=;
        b=Mwq5lyM4gemsdblSnUjwgKghyXwSTBcQPdVEV4KpXGrxifSWm0wPPNMTBUlQt0Ufd9
         HYhCXSFbmi7Brs3vpStJjHcaXZ3JjAxT+mqmplYvoRjg7clx4ne6dKI9Uhi15wIYo9MY
         XI4yqCzWuFT4Ook3N92Ptr9ZreXqZjIl1SknqO5oY0r6KklpKSn7ZvOsAnPKXx5E3s3a
         5opUr3X18KA2tIXXI1jFHW0XiSONCRJNf/7UpzGyXUVRAzQ1a/tzzf+suxzE7FUG6L7g
         WqQ3RbhTH6Jrl6QR2XAt7sPdWFKTPouX6L/EgxgRu7yJNjzykRpOO3P2AM3sFGemHUIU
         eSYg==
X-Forwarded-Encrypted: i=1;
 AHgh+RoGFsSnRfc6+SMocXcynUOybKdLbZJH2+WCHq6tgjGRe8UgLOTFviVoP6qp5alEWhsVPGFlVhzY@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRLDM8ATmkLdxiDWovIZVOV5u5wxn7i7ZOBolhRck8usrPobvU
	Ao2uyl35h4AF6qf1xYzb4dGnRC2XTLSUpVy/Fiblp3ndxX3M1G8it6E32Bmbs7WHVv8pV2+s4Zi
	iIFtNvl6qd6Q7l6nz8PX7X7uPC0Kblese7CJxe7cKxeH0skVlAKuwBQF1VxVn8Dq3kNk=
X-Gm-Gg: AR+sD10GxJ1xt89i+f1yzReSB4wkCtFxjJyDiBkNX8vlYBSbxKHl+07bvFY0fFsrN1l
	VycLytfg491FXqAiP38YdKlIAq1RDTUFasVEn8m3wUvtRoWE6DHYsKCcdmkRmEE3MhSmQjQphbj
	BcNBVp9s92sTH/vi/mpMDLTHoBf6aVQTzmAbz/0mRu0RM9wFbaOhKy1i4p21WAix/xN2iY09REE
	14WpDrSv9eTMv2QYk5RPpyW4E5kG1QPUPg7xGct7+qHk+stmb6fRxcZtoDs8/R8TXb8AurOPttG
	slf2Jobl7HLygv5WC/qCIoN2EYz4gqEEfwO+Bl9jIuhuhV/w2GQu3cK2+smlawItuG5svINK
X-Received: by 2002:a05:622a:1a99:b0:51b:fe30:b8da with SMTP id
 d75a77b69052e-52dd32cc365mr7489561cf.33.1787084900589;
        Tue, 18 Aug 2026 13:28:20 -0700 (PDT)
X-Received: by 2002:a05:622a:1a99:b0:51b:fe30:b8da with SMTP id
 d75a77b69052e-52dd32cc365mr7488991cf.33.1787084900104;
        Tue, 18 Aug 2026 13:28:20 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-52db60eb025sm47437921cf.5.2026.08.18.13.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 13:28:19 -0700 (PDT)
Message-ID: <70ff3bb7914899d845e884eea00b47621d295e3a.camel@redhat.com>
Subject: Re: [PATCH v4 1/2] drm/nouveau/pci: use config-space MSI rearm on
 MCP79/MCP7A (NVAC)
From: lyude@redhat.com
To: Marek Czernohous <mczernohous@gmail.com>, nouveau@lists.freedesktop.org,
 	dri-devel@lists.freedesktop.org
Date: Tue, 18 Aug 2026 16:28:19 -0400
In-Reply-To: <178688574401.522643.12812428444459119913@gmail.com>
References: <178688574400.522643.6695278742335367229@gmail.com>
	 <178688574401.522643.12812428444459119913@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZdUWHJLAIvYG0hSq75mZVx4qmm5NiGBPPPQZrqfe66o_1787084901
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: XESWKWCJJPJA3RKLSJZG5CFIUZANWNZS
X-Message-ID-Hash: XESWKWCJJPJA3RKLSJZG5CFIUZANWNZS
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Simona Vetter <simona@ffwll.ch>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XESWKWCJJPJA3RKLSJZG5CFIUZANWNZS/>
Archived-At: 
 <https://lore.freedesktop.org/70ff3bb7914899d845e884eea00b47621d295e3a.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Sun, 2026-08-16 at 15:09 +0200, Marek Czernohous wrote:
> From: Marek Czernohous <marek@czernohous.de>
>=20
> NVAC (MCP79/MCP7A) uses g94_pci_func, whose .msi_rearm is
> nv40_pci_msi_rearm(): a re-arm write through the MMIO mirror of PCI
> config space.=C2=A0 On this IGP that path is unreliable; when a re-arm is
> missed the interrupt line stays dead, command submission times out
> and
> the GPU appears hung until reboot.=C2=A0 On an Apple Mac mini (early 2009=
,
> MCP79, boot0 0x0ac080b1) this showed as sporadic fifo timeouts and
> GPU
> hangs under load unless MSI was disabled via config=3DNvMSI=3D0.
>=20
> Give NVAC its own pci func that re-arms through real PCI config space
> (nv46_pci_msi_rearm) instead.=C2=A0 This follows existing precedent:
> nv46.c
> documents the MMIO-mirror re-arm as broken on several related parts,
> and commit 5112abc6a433 ("drm/nouveau/pci/g92: Fix rearm") fixed g92
> the same way while moving the remaining chipsets, NVAC included, into
> the newly added shared g94 table, where NVAC stayed on the MMIO path.
> This change completes that fix for NVAC.=C2=A0 The sibling IGP NVAA
> (MCP77/MCP78) has MSI disabled entirely as "reported broken" in
> nvkm_pci_new_(); NVAC works correctly once the re-arm goes through
> config space, so disabling MSI is not necessary.
>=20
> Only NVAC is switched: that is the hardware this has been validated
> on.=C2=A0 The other users of g94_pci_func (G94/G96/G98/GT2xx and the
> MCP77/MCP89 IGPs) keep their current behavior; MCP77 and MCP89
> plausibly want the same treatment but were not tested.
>=20
> Tested on the Mac mini as a daily driver for two months with MSI
> enabled and zero fifo timeouts.=C2=A0 Independently confirmed stable on a=
n
> iMac9,1 (MCP79) running 6.12.90 with the v1 form of this change (the
> same one-line functional switch, applied to that kernel's g94
> implementation).
>=20
> Fixes: 5112abc6a433 ("drm/nouveau/pci/g92: Fix rearm")
> Cc: <stable@vger.kernel.org> # v6.16+
> Tested-by: Fab Stz <fabstz-it@yahoo.fr>
> Assisted-by: Claude:claude-opus-4-7
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Marek Czernohous <marek@czernohous.de>
> ---
> =C2=A0.../gpu/drm/nouveau/include/nvkm/subdev/pci.h |=C2=A0 1 +
> =C2=A0.../gpu/drm/nouveau/nvkm/engine/device/base.c |=C2=A0 2 +-
> =C2=A0.../gpu/drm/nouveau/nvkm/subdev/pci/Kbuild=C2=A0=C2=A0=C2=A0 |=C2=
=A0 1 +
> =C2=A0.../gpu/drm/nouveau/nvkm/subdev/pci/mcp79.c=C2=A0=C2=A0 | 35
> +++++++++++++++++++
> =C2=A04 files changed, 38 insertions(+), 1 deletion(-)
> =C2=A0create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/pci/mcp79.c
>=20
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/pci.h
> b/drivers/gpu/drm/nouveau/include/nvkm/subdev/pci.h
> index 112b674ed9c8..0172e0d200f8 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/pci.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/pci.h
> @@ -46,6 +46,7 @@ int nv4c_pci_new(struct nvkm_device *, enum
> nvkm_subdev_type, int inst, struct n
> =C2=A0int g84_pci_new(struct nvkm_device *, enum nvkm_subdev_type, int
> inst, struct nvkm_pci **);
> =C2=A0int g92_pci_new(struct nvkm_device *, enum nvkm_subdev_type, int
> inst, struct nvkm_pci **);
> =C2=A0int g94_pci_new(struct nvkm_device *, enum nvkm_subdev_type, int
> inst, struct nvkm_pci **);
> +int mcp79_pci_new(struct nvkm_device *, enum nvkm_subdev_type, int
> inst, struct nvkm_pci **);
> =C2=A0int gf100_pci_new(struct nvkm_device *, enum nvkm_subdev_type, int
> inst, struct nvkm_pci **);
> =C2=A0int gf106_pci_new(struct nvkm_device *, enum nvkm_subdev_type, int
> inst, struct nvkm_pci **);
> =C2=A0int gk104_pci_new(struct nvkm_device *, enum nvkm_subdev_type, int
> inst, struct nvkm_pci **);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> index ea62dc97f118..f7e02a16e5bc 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> @@ -1237,7 +1237,7 @@ nvac_chipset =3D {
> =C2=A0=09.mc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D { 0x00000001, g98_mc=
_new },
> =C2=A0=09.mmu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D { 0x00000001, mcp77_mmu_n=
ew },
> =C2=A0=09.mxm=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D { 0x00000001, nv50_mxm_ne=
w },
> -=09.pci=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D { 0x00000001, g94_pci_new },
> +=09.pci=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D { 0x00000001, mcp79_pci_new },
> =C2=A0=09.therm=C2=A0=C2=A0=C2=A0 =3D { 0x00000001, g84_therm_new },
> =C2=A0=09.timer=C2=A0=C2=A0=C2=A0 =3D { 0x00000001, nv41_timer_new },
> =C2=A0=09.volt=C2=A0=C2=A0=C2=A0=C2=A0 =3D { 0x00000001, nv40_volt_new },
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/Kbuild
> b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/Kbuild
> index a14ea0f7b1c8..90f03baeb22a 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/Kbuild
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/Kbuild
> @@ -9,6 +9,7 @@ nvkm-y +=3D nvkm/subdev/pci/nv4c.o
> =C2=A0nvkm-y +=3D nvkm/subdev/pci/g84.o
> =C2=A0nvkm-y +=3D nvkm/subdev/pci/g92.o
> =C2=A0nvkm-y +=3D nvkm/subdev/pci/g94.o
> +nvkm-y +=3D nvkm/subdev/pci/mcp79.o
> =C2=A0nvkm-y +=3D nvkm/subdev/pci/gf100.o
> =C2=A0nvkm-y +=3D nvkm/subdev/pci/gf106.o
> =C2=A0nvkm-y +=3D nvkm/subdev/pci/gk104.o
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/mcp79.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/mcp79.c
> new file mode 100644
> index 000000000000..e2ae242f1aa7
> --- /dev/null
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/mcp79.c
> @@ -0,0 +1,35 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2026 Marek Czernohous
> + *
> + * MCP79/MCP7A (NVAC): like g94, but MSI re-arm goes through real
> PCI
> + * config space.=C2=A0 The MMIO-mirror re-arm is unreliable on this IGP
> and a
> + * missed re-arm kills the interrupt line (see the nv46 comment; g92
> + * already re-arms through config space for the same reason).
> + */
> +#include "priv.h"
> +
> +static const struct nvkm_pci_func
> +mcp79_pci_func =3D {
> +=09.cfg =3D { .addr =3D 0x088000, .size =3D 0x1000 },
> +
> +=09.init =3D g84_pci_init,
> +=09.msi_rearm =3D nv46_pci_msi_rearm,
> +
> +=09.pcie.init =3D g84_pcie_init,
> +=09.pcie.set_link =3D g84_pcie_set_link,
> +
> +=09.pcie.max_speed =3D g84_pcie_max_speed,
> +=09.pcie.cur_speed =3D g84_pcie_cur_speed,
> +
> +=09.pcie.set_version =3D g84_pcie_set_version,
> +=09.pcie.version =3D g84_pcie_version,
> +=09.pcie.version_supported =3D g92_pcie_version_supported,
> +};
> +
> +int
> +mcp79_pci_new(struct nvkm_device *device, enum nvkm_subdev_type
> type, int inst,
> +=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct nvkm_pci **ppci)
> +{
> +=09return nvkm_pci_new_(&mcp79_pci_func, device, type, inst,
> ppci);
> +}

