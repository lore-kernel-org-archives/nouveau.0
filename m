Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF0CC88E73
	for <nouveau@archiver.kernel.org>; Mon, 14 Sep 2026 21:31:31 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 67C6D10F2E7;
	Mon, 14 Sep 2026 21:31:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DxP/RsrB";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 996AD48070;
	Mon, 14 Sep 2026 21:13:59 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789420439;
 b=XJgLHsa88P/DuaZx4+X3dhYh+TrVg2mofpjZvI5ZFA6Xg6zcxbiTMMaGQWV6Ej0e7YO3w
 bZEAnS0D6B1/33neuJwPguuXDstD5oXkRr0Q7psIlrwEtK8ReR+B5GR0qbK94A2+gXuziX1
 phf9b+/UANHouD6LGhZ4SrwfhrFh4jafia6/kCY0BdFZErhKALI+CKvXFaf7kigE0Ggfo2J
 nv0t6zUsWuGOr48fRzrYtNdd9TUcwBN7BTNFicHisiBxxXitgi4+y3JybMkxhvGmxeVXWBT
 k14fKHlluGoKGV4Iv8MTKOARYfDyfnnLAdrhk5ck8eJ8YA1F3t3ym1CUusMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789420439; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=EsmO2zfEEKb36HKkQkCui6azWFUjL6ObkO4dSpEE9uc=;
 b=qrB88xFxZ2lp86mlXmTF36Cgq38DjwJ3prP6sfzmOBGzsFwUxNQ+K2cQ2wFSIwPdTL8Qu
 9OkhsS0lGwQbWTdiOOdb62408BA1fezhsCPkW/CYnkApIDP8Qcdekq0q5O8nqxAI658RmCI
 NTONmOo0L8783Gb4HrKr8aHqaz2JXa/mNG5JQ5yTy9pWN8gVrwYTGGdXyWeE1/f6yjf6kY0
 axB2lqmRFvFyO5ugBiTCZ0s5tCaMRCYdgjlVyw87VWyiGn9OAUQHGMwxPwq4s349mw1MiIs
 iC2/W+az6ZJMdRs8u1x6f4vA/XBJZejBLPTSShWhuxTtDcAT0ZfeMPdF7S/Q==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 0B53746817
	for <nouveau@lists.freedesktop.org>; Mon, 14 Sep 2026 21:13:56 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2F2C610F2AA
	for <nouveau@lists.freedesktop.org>; Mon, 14 Sep 2026 21:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789421486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EsmO2zfEEKb36HKkQkCui6azWFUjL6ObkO4dSpEE9uc=;
	b=DxP/RsrBuBylf0iVgvggbZaxHUV8vOscqWrQhY1e5SrxJjSu74ddIgZg88NeeywBOP/vYX
	Sk1LOXyD1XQiTmRfGw3oXPWUFBfnTrIKRn5J1LZgl1KbS1nemgSc1Lv5BK4Efb8goGn7Xp
	FAPxzqf1LYg7N7OREIp/tnwUugUUo8I=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-9kT0HzEGNYSGrIb4NzF6Sw-1; Mon, 14 Sep 2026 17:31:25 -0400
X-MC-Unique: 9kT0HzEGNYSGrIb4NzF6Sw-1
X-Mimecast-MFC-AGG-ID: 9kT0HzEGNYSGrIb4NzF6Sw_1789421484
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-79630cb8723so404037137.0
        for <nouveau@lists.freedesktop.org>;
 Mon, 14 Sep 2026 14:31:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789421484; x=1790026284;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mSH/LADfNS5wRI0PeO6aTM3mQmTKjHC2Ckp9c3le0T0=;
        b=uWP6M9BP0jFjFSmo6zDr9bAMmq/ORCttUOnkMVzD7yJQIAiB4agOlm83A9DNwW0gfo
         uUn5lcthhNOnsbazW8zDtAFqA1Noi0Gy9x4ZVEqONbY54kXTl/uYNP3l1msNbTSuTrEY
         DNBpZktZ7x4+JSfgGsf26maJMTeWEn9RhO3wfcdM9PC0HhxdoqtL7i+uq/g8mR7RiQOe
         Gvjq0ujnTUvDHGhVS3KJbEroNjxdfX9tl7mXHtE2MVSCpwvp0Y1gZh6tAHGlxRtSDbHN
         bvTC3SSbnYs4RjDIUwdTTp2jTXRqPv9w7lhdUAJ8iLDmnC5vUr7ef+HlYTUg9diHNX2I
         b9Ow==
X-Forwarded-Encrypted: i=1;
 AKwUvBzGR359KwM0euBvVGHC4I9QKU9gjvBwrugW55cQ/jMc+9Hd4xugsB1UytoZ5fwK0r+Q0959Lotp@lists.freedesktop.org
X-Gm-Message-State: AFuF++k0aXOR0mBGus8vwcg1wzNenAcsyai1NcFYUrZdTG4O+TZTjlat
	gUW5ibcrTmjHLy+iWO/hMXmm2m3nIwliyuQrkcu4VyxCGlrdEyRQArYEpIMYGre1tG5q7Ubfvsp
	4FI8+IXuXD6ZXhGe0erE1jkhj5bJdqmCW0qiaUWVmHsXqxAHBcVUsZdEaYlQCHFej3+c=
X-Gm-Gg: AYBFou1YSzYXPQhSs2Mg23oky5dGfwoVWaEQ1fVsyfc1fXgOBpYlyzPZ3PqLyjbzaN7
	7V2wJ3CHBHH91KO+NeqqBDxkP463kd820iEXgGRUPnzTneh7MpMop0WIk59R+O5OfTY4n+YxX2x
	2BemUZI5ZWh2oR2JRoYkV81aZdxL+jEsiz5uVdGa3izQzNoBh7p3/TPLCY2gOId9AZQz/ZczfyY
	mT22FOtWaTsSm5V1T93YgpjEMBXl8y/bHwlM2rEsmvVRkPKIsW/CeeHxrMyCgAWFs/HNV3Cnc5q
	ZzaQeReALTLvxMALLBRKHpaxaaGRTR8+bb3mSiDvbnYTU1C4cIlwgQ0cdCzV1eYE3Ya4aZEO
X-Received: by 2002:a05:6102:54a9:b0:79a:7895:c36a with SMTP id
 ada2fe7eead31-79b5c700594mr4686146137.13.1789421479593;
        Mon, 14 Sep 2026 14:31:19 -0700 (PDT)
X-Received: by 2002:a05:6102:54a9:b0:79a:7895:c36a with SMTP id
 ada2fe7eead31-79b5c700594mr4686037137.13.1789421478991;
        Mon, 14 Sep 2026 14:31:18 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-9120f2032d4sm104280926d6.5.2026.09.14.14.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:31:18 -0700 (PDT)
Message-ID: <3bc92cd6aa88e52c2645b00b97c9d75a112b5d16.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau: validate required NET_img regions
From: lyude@redhat.com
To: Slavin Liu <bolin.liu@seu.edu.cn>, dakr@kernel.org,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 	airlied@gmail.com, simona@ffwll.ch
Date: Mon, 14 Sep 2026 17:31:17 -0400
In-Reply-To: <20260913125228.110071-1-bolin.liu@seu.edu.cn>
References: <20260913125228.110071-1-bolin.liu@seu.edu.cn>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Vi1XT5dXv5HpCB86kbElpwE5qPyB-Z6t-U2IC2379Xw_1789421484
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 6K7HL25GKGUGEKABU75C3WLSRJ6LFRC3
X-Message-ID-Hash: 6K7HL25GKGUGEKABU75C3WLSRJ6LFRC3
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/6K7HL25GKGUGEKABU75C3WLSRJ6LFRC3/>
Archived-At: 
 <https://lore.freedesktop.org/3bc92cd6aa88e52c2645b00b97c9d75a112b5d16.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi. What bug are you fixing here?

On Sun, 2026-09-13 at 20:52 +0800, Slavin Liu wrote:
> The NET_img parser can finish without all FECS and GPCCS regions.
> Reject missing required regions before computing their data
> addresses,
> and release the firmware on both validation and ACR loading failures.
>=20
> Detected by static analysis and reviewed with AI-assisted source
> auditing.
>=20
> Fixes: c4bdac754ca0 ("drm/nouveau/gr/ga102: initial support")
> Assisted-by: LLM
> Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c | 12 +++++++++---
> =C2=A01 file changed, 9 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c
> index 2b51f1d0c281..bfd1e00537b8 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c
> @@ -317,6 +317,11 @@ ga102_gr_load(struct gf100_gr *gr, int ver,
> const struct gf100_gr_fwif *fwif)
> =C2=A0=09=09}
> =C2=A0=09}
> =C2=A0
> +=09if (!fecs_inst || !fecs_data || !gpccs_inst || !gpccs_data)
> {
> +=09=09ret =3D -EINVAL;
> +=09=09goto out_firmware;
> +=09}
> +
> =C2=A0=09ret =3D nvkm_acr_lsfw_load_bl_sig_net(subdev, &gr-
> >fecs.falcon, NVKM_ACR_LSF_FECS,
> =C2=A0=09=09=09=09=09=C2=A0=C2=A0=C2=A0 "gr/fecs_", ver, fwif-
> >fecs,
> =C2=A0=09=09=09=09=09=C2=A0=C2=A0=C2=A0 fw->data + fecs_inst-
> >data_offset,
> @@ -324,7 +329,7 @@ ga102_gr_load(struct gf100_gr *gr, int ver, const
> struct gf100_gr_fwif *fwif)
> =C2=A0=09=09=09=09=09=C2=A0=C2=A0=C2=A0 fw->data + fecs_data-
> >data_offset,
> =C2=A0=09=09=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fecs_data-
> >data_size);
> =C2=A0=09if (ret)
> -=09=09return ret;
> +=09=09goto out_firmware;
> =C2=A0
> =C2=A0=09ret =3D nvkm_acr_lsfw_load_bl_sig_net(subdev, &gr-
> >gpccs.falcon, NVKM_ACR_LSF_GPCCS,
> =C2=A0=09=09=09=09=09=C2=A0=C2=A0=C2=A0 "gr/gpccs_", ver, fwif-
> >gpccs,
> @@ -333,12 +338,13 @@ ga102_gr_load(struct gf100_gr *gr, int ver,
> const struct gf100_gr_fwif *fwif)
> =C2=A0=09=09=09=09=09=C2=A0=C2=A0=C2=A0 fw->data + gpccs_data-
> >data_offset,
> =C2=A0=09=09=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gpccs_data-
> >data_size);
> =C2=A0=09if (ret)
> -=09=09return ret;
> +=09=09goto out_firmware;
> =C2=A0
> =C2=A0=09gr->firmware =3D true;
> =C2=A0
> + out_firmware:
> =C2=A0=09nvkm_firmware_put(fw);
> -=09return 0;
> +=09return ret;
> =C2=A0}
> =C2=A0
> =C2=A0static const struct gf100_gr_fwif

