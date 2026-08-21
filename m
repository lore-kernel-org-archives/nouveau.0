Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC7CFC5DF94
	for <nouveau@archiver.kernel.org>; Fri, 21 Aug 2026 22:09:21 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AC69C10F3D7;
	Fri, 21 Aug 2026 22:09:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="K+cJ1sKb";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6EE7647AF4;
	Fri, 21 Aug 2026 21:52:41 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787349161;
 b=0M75SIUKQu/KYJ4p6G0iVUDDjARudqpAoNYuGJkMSxFg/rpNk3U9DVwgK/aMdmhLYF/Fv
 hV2GPLmFuiEqoJOCf3KnLnkQo/hevGo5fPN44Rbli5rXiWOVc1umTkqO+aGf+yNpPTo8gBn
 N8SsTx35NfqTrHxrEoRx1e59veOzvGf9rl8SvpCxFLXVaxuZ1a8VpwYdDkT8EEc3Yj4k8fZ
 2MipyUGGahBdNkVwsfAYcqk87K4JIcm++j436hudGWtv28g5b68GqAiFrGePIyWbf9ozV0A
 olulYtymDzuvaTBBs1Ued4wWYBrnsP+aKxmwhKrT7hKyerKsXCH/aG1EKLDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787349161; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=cFfIR5UhN2LkGl7j0eqOn1txdEZUB1CTMDtNAizxGGM=;
 b=xrk9JQah0//ExwZRnkzcTq6LPzTtYNQOuAhhJMyLDJm5j/rt3kz0P4BYjhpvKISNb173x
 Ry+hHmja2giMKeK/hgtt8Vc77GAv7wNmGAttAvw9M/IjOVU7hy9ZTER5aSvk0wWnftKwmxF
 wVA4o/jqv1pEDVRee5X06bXeL32P8My8V9k/h1iMOr3Q/GyvwCP93Qzdp2LzVusrzZbCSY1
 MK6sSJ56nC40bbRffdoeHOOOFuEa1cvhGp4GyosLKWKWfyTbUJ+TMgyKVgC9TTY5HT3kdEP
 vKrkwuNjcOTAIf5/3d5MC0uUQKAbGKv78ZXb1Ji6gVc0D7YuRy+FitiAymKA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 5E13E47AB5
	for <nouveau@lists.freedesktop.org>; Fri, 21 Aug 2026 21:52:38 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 420AD10F3D1
	for <nouveau@lists.freedesktop.org>; Fri, 21 Aug 2026 22:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787350155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cFfIR5UhN2LkGl7j0eqOn1txdEZUB1CTMDtNAizxGGM=;
	b=K+cJ1sKbFA7dQLj+maKJfspB/3LDi4DfOy8sBkKBfQ07plUa2YlwlPhnPNaeEhlkHfa0de
	7J4Ai6kFrhR58mzOgIfNwTeX00/1XtWPhy4i+VWCSQNoMVbKW7I0xA4r0XthJ9ju4nzh6q
	NyIKOiX/RHipmcNwIz4Y3xIa+K6eCI0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-292-sBGQHQ7ONE-SPvj3mk5yZA-1; Fri, 21 Aug 2026 18:09:14 -0400
X-MC-Unique: sBGQHQ7ONE-SPvj3mk5yZA-1
X-Mimecast-MFC-AGG-ID: sBGQHQ7ONE-SPvj3mk5yZA_1787350153
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-9372b9db132so156321285a.2
        for <nouveau@lists.freedesktop.org>;
 Fri, 21 Aug 2026 15:09:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787350153; x=1787954953;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cFfIR5UhN2LkGl7j0eqOn1txdEZUB1CTMDtNAizxGGM=;
        b=cL/Rw1Eqwqxm4qwmrf6YgkhTalPo1ttVzKd1rnMkytJNuuwC94UgdKW4OqqYvfvydS
         BNoBukLkpCGT3pX/US9Q/sNCpIsK3c7TVfaR5UMoDTPP/1sxKPNuQ6XGvUZFehbC43wj
         NX90FMDF6fRnwoySnR+1t6xxwkM4UlloVog01m5LiCDp/Dj5gYenNbNhVp4ACMW8WNsL
         /Axi0tf4rQHqtfrhGcVViFZeUIUnO1OsSUlY4HEd8i++8USJNru6rW90jIugZAffNtTU
         wUakiM8wnZhG8Muj/H5vyRJlSFrxxq0ZZ5j/as1sAdh5ggFtpo7wtkcrgVgTE8XYZHJw
         0a5A==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro1rJQ3vNtl10AtIFXldI9vHg2bzX1VtaQo6GiZK0uGfuUTrJm9OEiMFvIKIs+VkYoMTgdbpHUe@lists.freedesktop.org
X-Gm-Message-State: AFuF++n0QtOwN/IkiLB63XGZDfRlOHyKA45/GOvBMx4HpCsUv8gNu/pd
	qNkO7FfbhLvYAT140/oSWjLxyPVhGpFEdep5MHnZaSwPOSDvx1qVR6wc9PxnhtMf8WgKRR93Enk
	OOxDqpJA24/qmS5lx+T9ifxZrGLVGLa0VDu6B53bAkxR/mo6DGCwyNS53C9oG6ATmadQ=
X-Gm-Gg: AR+sD11KLnHsf6QMNilfXdtDG6MnnBwIs3R174zs1u893hYiObfQIr4fNemBHGw8/TH
	tu7PyaXBhgnIe1EgN8MFaO4lqBqKQiGzfXgBbLCG4mu0+5BiBbA/bGxhaDH33GiiQd9cT2DAqRQ
	mq4sbz3DYX6kEMEcLKladzB188n+QK9WOYoL+Q4/8HBzAoHkybrvIlopuSL+8XOSuaRvkuXCl8F
	zmr2ySWkZjDsjjIZHohQ9WAklQxWQ+SKIHR4DjCI1fYYCEP8Wo0e1wXN+4nImbCWJUu9nEtPDaD
	lkbCYl7sBE1od6aMUVkLmFGo9jLvTu+t09rZ0RbRj4Tf2m/mseZ96AhiAuWPefue5zrnOMgo
X-Received: by 2002:a05:620a:29cf:b0:936:4c33:67f with SMTP id
 af79cd13be357-93739540c2dmr867037885a.19.1787350153366;
        Fri, 21 Aug 2026 15:09:13 -0700 (PDT)
X-Received: by 2002:a05:620a:29cf:b0:936:4c33:67f with SMTP id
 af79cd13be357-93739540c2dmr867031685a.19.1787350152909;
        Fri, 21 Aug 2026 15:09:12 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93749afc53bsm8846485a.21.2026.08.21.15.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 15:09:12 -0700 (PDT)
Message-ID: <2e733db917cf5a478fe65022f4708030acab384e.camel@redhat.com>
Subject: Re: [PATCH v2 00/10] nouveau: assorted display fixes (GB20x, r570
 DP_CONFIG_STREAM, HF-EEODB EDIDs)
From: lyude@redhat.com
To: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
	linux-kernel@vger.kernel.org
Date: Fri, 21 Aug 2026 18:09:11 -0400
In-Reply-To: <20260820164929.17117-1-mohamedahmedegypt2001@gmail.com>
References: <20260820164929.17117-1-mohamedahmedegypt2001@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1Ej18ICaOLQn6SdMEsYO_g0rV5uU3RnTk27eDrFzKok_1787350153
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: VNBYGZMKZ6GBTPOECWS6TOM6S56NND2D
X-Message-ID-Hash: VNBYGZMKZ6GBTPOECWS6TOM6S56NND2D
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VNBYGZMKZ6GBTPOECWS6TOM6S56NND2D/>
Archived-At: 
 <https://lore.freedesktop.org/2e733db917cf5a478fe65022f4708030acab384e.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Thinking about it more - we should probably cc patches 1-8 to stable.
Mind doing that on the next respin?

(unsure if you have done this before or not, but
https://drm.pages.freedesktop.org/maintainer-tools/committer/getting-starte=
d.html
dim is a good tool for fixes, if you have the commit a patch fixes you
can just run `dim fixes $COMMIT` and it will spit out a tag + some CCs.
I usually drop all but the stable cc, which gets a nice little comment
added on the side indicating which kernel version to backport against.

On Thu, 2026-08-20 at 20:49 +0400, Mohamed Ahmed wrote:
> Several fixes for GSP-driven displays consisting of four independent
> groups. These were created as part of ongoing HDMI 2.1 bring up and
> display handling clean-up work, so some of them are not issues now
> (e.g., the 2.147GHz pixel clock cap) but fixing them is required to
> get
> advanced features such as FRL, DSC, VRR, etc working properly.
>=20
> The v1 review asked for the RM vs register programming split to be
> made
> explicit instead of growing more per-chip code inside the RM layer,
> so
> patches 1-3 do that first. No functional change, and then each GB20x
> fix
> (patches 4-8) supplies its hook from a new engine/disp/gb202.c.
>=20
> Changes in v2:
> - Rebased onto drm-misc-next.
>=20
> - New patches 1-3: move the GSP path's direct MMIO helpers to
> =C2=A0 engine/disp/ and route them through a per-chip nvkm_disp_func.gsp
> hook
> =C2=A0 table. GB20x now has its own gb202_disp_new() instead of display-
> class
> =C2=A0 checks in rm/r535/disp.c.
>=20
> - Patch 4 (was 1+2): merged. Dropped a stray .frl_train reference
> that
> =C2=A0 broke the build, no longer drops .scdc, and fixed an undefined
> shift
> =C2=A0 when packing byte 3 of each infoframe data word.
>=20
> - Patch 5 (was 3): the GCP subpack write is now a masked write so
> =C2=A0 SB1_CTRL keeps its hardware-controlled default.
>=20
> - Patch 6 (was 4): the vcpi hook returns its control status like the
> =C2=A0 other RM API entries instead of WARN_ONs under the HAL.
>=20
> - New patch 7: the head-state readback fix is split out. The core
> channel
> =C2=A0 state mirror uses a 0x800 per-head stride on GB20x, fixing scanout
> pos
> =C2=A0 and timings readback for heads >=3D 1.
>=20
> - Patch 8 (was 5): reworked onto the new hook table. The low-latency
> =C2=A0 vector is exposed as a second DISP interrupt instance by the r570
> =C2=A0 engine index translation and re-armed after servicing.
>=20
> - Patch 9 (was 6): the two HI methods are pushed as one method pair,
> and
> =C2=A0 the class-header defines stay offset-sorted.
>=20
> - Patch 10 (was 7): OF EDIDs now go through
> drm_edid_connector_update(),
> =C2=A0 and all firmware provided EDIDs (OF, ACPI, VBIOS embedded) are
> =C2=A0 validated with drm_edid_valid(). ACPI reads are bounded by the
> length
> =C2=A0 _DDC actually returned. Fixed a runtime-PM reference leak when the
> RM
> =C2=A0 EDID read fails. No raw struct edid is kept anymore and all the ol=
d
> =C2=A0 raw struct edid consumers are converted to the new API (the SPWG
> =C2=A0 dual-link byte is cached at EDID-set time as there is no new drm
> API
> =C2=A0 alternative for it). get_modes() re-syncs the EDID property only
> when
> =C2=A0 the probe helper cleared it.
>=20
> - Commit messages reworded throughout.
>=20
> Link to v1:
> https://lore.kernel.org/all/20260814235705.59132-1-mohamedahmedegypt2001@=
gmail.com/
>=20
>=20
> Mohamed Ahmed (10):
> =C2=A0 drm/nouveau/disp: move GSP head-timing ISR and vblank helpers to
> =C2=A0=C2=A0=C2=A0 tu102.c
> =C2=A0 drm/nouveau/disp: move the GSP HDMI GCP AVMute write to engine/dis=
p
> =C2=A0 drm/nouveau/disp: route GSP-RM display MMIO through nvkm_disp_func
> =C2=A0=C2=A0=C2=A0 hooks
> =C2=A0 drm/nouveau/disp: fix HDMI vendor infoframes on GB20x
> =C2=A0 drm/nouveau/disp: fix HDMI GCP AVMute register offsets on GB20x
> =C2=A0 drm/nouveau/gsp: use per-version DP_CONFIG_STREAM params on r570
> =C2=A0=C2=A0=C2=A0 firmware
> =C2=A0 drm/nouveau/disp: fix head state readback on GB20x
> =C2=A0 drm/nouveau/gsp: fix vblank interrupts on GB20x
> =C2=A0 drm/nouveau/dispnv50: program pixel clocks above 2.147GHz on GB20x
> =C2=A0 drm/nouveau: honor HF-EEODB EDIDs by converting to struct drm_edid
>=20
> =C2=A0drivers/gpu/drm/nouveau/dispnv04/dfp.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 5 +-
> =C2=A0drivers/gpu/drm/nouveau/dispnv50/disp.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 4 +-
> =C2=A0drivers/gpu/drm/nouveau/dispnv50/headca7d.c=C2=A0=C2=A0 |=C2=A0 21 =
+-
> =C2=A0.../drm/nouveau/include/nvhw/class/clca7d.h=C2=A0=C2=A0 |=C2=A0=C2=
=A0 4 +
> =C2=A0.../drm/nouveau/include/nvkm/engine/disp.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 1 +
> =C2=A0drivers/gpu/drm/nouveau/nouveau_acpi.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 21 +-
> =C2=A0drivers/gpu/drm/nouveau/nouveau_acpi.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 10 +-
> =C2=A0drivers/gpu/drm/nouveau/nouveau_connector.c=C2=A0=C2=A0 | 147 +++++=
+++++----
> =C2=A0drivers/gpu/drm/nouveau/nouveau_connector.h=C2=A0=C2=A0 |=C2=A0 12 =
+-
> =C2=A0.../gpu/drm/nouveau/nvkm/engine/device/base.c |=C2=A0 10 +-
> =C2=A0.../gpu/drm/nouveau/nvkm/engine/disp/Kbuild=C2=A0=C2=A0 |=C2=A0=C2=
=A0 1 +
> =C2=A0.../gpu/drm/nouveau/nvkm/engine/disp/ga102.c=C2=A0 |=C2=A0 16 +-
> =C2=A0.../gpu/drm/nouveau/nvkm/engine/disp/gb202.c=C2=A0 | 192
> ++++++++++++++++++
> =C2=A0.../gpu/drm/nouveau/nvkm/engine/disp/head.h=C2=A0=C2=A0 |=C2=A0=C2=
=A0 3 +
> =C2=A0.../gpu/drm/nouveau/nvkm/engine/disp/ior.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 1 +
> =C2=A0.../gpu/drm/nouveau/nvkm/engine/disp/priv.h=C2=A0=C2=A0 |=C2=A0 20 =
++
> =C2=A0.../gpu/drm/nouveau/nvkm/engine/disp/tu102.c=C2=A0 |=C2=A0 81 +++++=
++-
> =C2=A0.../nouveau/nvkm/subdev/gsp/rm/r535/disp.c=C2=A0=C2=A0=C2=A0 | 121 =
++++++-----
> =C2=A0.../nouveau/nvkm/subdev/gsp/rm/r570/disp.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 64 ++++++
> =C2=A0.../drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c |=C2=A0=C2=A0 9 +
> =C2=A0.../nvkm/subdev/gsp/rm/r570/nvrm/disp.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A0.../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h=C2=A0=C2=A0 |=C2=A0=C2=
=A0 5 +
> =C2=A022 files changed, 637 insertions(+), 113 deletions(-)
> =C2=A0create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/gb202.c

