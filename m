Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022F7C531D0
	for <nouveau@archiver.kernel.org>; Mon, 27 Jul 2026 17:54:53 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C983810E6B9;
	Mon, 27 Jul 2026 17:54:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YVTc5IRp";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 80B0447431;
	Mon, 27 Jul 2026 17:39:11 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785173951;
 b=WyEkjvvN2Y1XjbfbmO/fndvx4sah61VlbpoMQ2xxsTH4q9PBtLNswYMpkeYCIBpRi6xYS
 4gXwHVaKbZ1R0VC387QakVYtxahZQmtq6KUG2EXgygPy7QTtiNZaJZNO2a90SpYIY1AaJST
 VOPITGy8Oec0UuDOLRtr21I6ySBbiCkB05Ipo/VcUcJwmWvVP96ITBzxqSiivsi99sNe2yo
 dzEMOfpE7wcWuVL4k2sFWmay6keph+2lpRRs9YLjF6YWECxqEZe6f2ic//gU7cB3JGwYZyO
 sP1CSVxDqm6VgWJhQL0n61UL3ENfC0lbqEgzy5kSOpDE8fXMFdfR+e9mjJWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785173951; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ZrgkY1jQpK3iCUNdvMeIPJZAEEHnxvkl2Yl/lDzedUo=;
 b=brUujp0SxWOOCcqhO+U7lO5OCCbeFdNubCHbbkuuoJBWnZ5/9nyPWHuU6RryKoL81hlq0
 M+hxBSuYSG6Gzxf0vIIAL+z8L/zivnLdZz2psQww61N6jz8h9pdj7yVWtZ/qOaB/fgGOWWo
 FJRFa1fFgFBJkjcB/WlfvVzi2/CclOfs56YFRCPHVFsUXrNNms56W1xeFL8VwG9NDK3HYb4
 zbbessqz/p94dw522uss59JlIkADzBN5lQWoX0gOojJ7bdZm7THWy4A+Vf2eBtCvfWWcj+m
 3bSOGjJB4lqS9ZzMe/miH34CxC/6hRQC0s7fuPMWxWbsQh22HYMuF9q1AVGw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 93AF046B91
	for <nouveau@lists.freedesktop.org>; Mon, 27 Jul 2026 17:39:09 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9A28510E6B4
	for <nouveau@lists.freedesktop.org>; Mon, 27 Jul 2026 17:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785174890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZrgkY1jQpK3iCUNdvMeIPJZAEEHnxvkl2Yl/lDzedUo=;
	b=YVTc5IRpyJK2Gwn7Li/WA81MBO3/UMUMKORAZoQTvR/E/oDwsuK2J4bOU87LrlAlwWo8ec
	Gzt0wp07ptgk/iExV4Wcd8baxVqVQbsdVGK/H28O74DEktMb74zcVpdx+cME+cvK/XT0jZ
	yMmtBjmxvMH2ZxvSICRrGr0ngBw5DNc=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-ZWV8F2R8OUmT14jWzx7TZw-1; Mon, 27 Jul 2026 13:54:47 -0400
X-MC-Unique: ZWV8F2R8OUmT14jWzx7TZw-1
X-Mimecast-MFC-AGG-ID: ZWV8F2R8OUmT14jWzx7TZw_1785174887
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8ec45d9628aso63135496d6.1
        for <nouveau@lists.freedesktop.org>;
 Mon, 27 Jul 2026 10:54:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785174887; x=1785779687;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U3hTRi91CNq2ftIlTw2qCUxBc3lKuCHq2yzoU+61UwA=;
        b=Vm4NutkMYdWmYrxhToBkwiRir3D/AlbxX/P1SBvWJ4r8q4dCIYIjbgwjrgXSdarYTl
         PsIZGThoaucPr3hbcakuMFQGCYYwKKzrje1361sfiVJGmESGicFRHxcdMsqtjAv2bRC0
         iB7DZ1xB4QGUQsnhho+CmW3SaVREDLtE8PYE72GS2d/LhhE5ttGFo/beGZRKV3CFkZUI
         1A5CeGAnmFkM7F0HMoPQfWtdQB49NT/23xL5NoWcfvoi+eDRNXpwpZqB5f4AA9AliUoK
         2fQw3YoUEZZpTONmfokhbmB9/Q+1mhnpLMQzL9eA0LEGG2+yFlyFsB4z47sD7FexZ6ec
         mAWg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqnSCK4QRl52i+szql/oYU0tb+wvG8dza2X8qNaAFZp2wA31QrHWfdGVrFDYsLKVY++8TCv/bjW@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8zVrqNFkP/mZw6WYZkLzd8JmtyM1vIgCYOPfbeS3FrzUC2FtQ
	oTqgPjeWjPPQObIb6IKXGX9PXTizUHpAIvhXHgGhN/IdEPlu4H6rf9ZJZunxNPNre3y6MxubU2r
	IlBnCC/QiOUaMyFSRJ8fGSuafEIniO9S8lIW39w9CCh3QInR9qZZq8ozDf6SihboYJKo=
X-Gm-Gg: AR+sD10LdSn4C0Eum3z/D6dMhBHv+XCMCJ4H1qBLOHZ7tm06R1vwPL47VzUsVFj4yny
	roZhrA8BF3b56npfhkUjOvdIwJnimRkHxn9JAQH5R+z2LJZ8yu/0sf69RzLWiEfcD2gL6zcKB9q
	Q4og1HoyTghh7qsMM7XJgdlkvijiMnsEloxpkz9DNo3vYDuZOLo2t2t8FHOyfYU9k7UDAxokhxP
	p4Net+QdHlCtvpMaPlawYH7Mfc5zW1ioZlOprwWdSy7bpRxE3ARoQemrcoT18LFO+Q2dG3mfHXb
	fHZGNL3WaYVq7U5CPemHOGfQDX9IUuJLQm7TVgvt7kwET1PfDf3VOktZ3Gm/KXFaPPB9zoGX
X-Received: by 2002:a0c:f202:0:b0:8fd:6dc5:94a with SMTP id
 6a1803df08f44-907ec8d84a7mr125962356d6.63.1785174887225;
        Mon, 27 Jul 2026 10:54:47 -0700 (PDT)
X-Received: by 2002:a0c:f202:0:b0:8fd:6dc5:94a with SMTP id
 6a1803df08f44-907ec8d84a7mr125962086d6.63.1785174886773;
        Mon, 27 Jul 2026 10:54:46 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-907e8694197sm70197646d6.24.2026.07.27.10.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 10:54:45 -0700 (PDT)
Message-ID: <4c953dda5ca7ab96fc419f99f1e0019768ea05a0.camel@redhat.com>
Subject: Re: [PATCH v4 2/3] drm/nouveau/gsp/r570: Set GcOff = 1 in fbsr
From: lyude@redhat.com
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Date: Mon, 27 Jul 2026 13:54:43 -0400
In-Reply-To: <20260727175246.642071-3-lyude@redhat.com>
References: <20260727175246.642071-1-lyude@redhat.com>
	 <20260727175246.642071-3-lyude@redhat.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8xjNYYhiZ_aNUM5-ctltVrfrOSL_jegrdc5do7gbRaw_1785174887
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: ETX3EDCZ6AM5W3TZ3INH2QLGIO6HQTJR
X-Message-ID-Hash: ETX3EDCZ6AM5W3TZ3INH2QLGIO6HQTJR
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: stable@vger.kernel.org, Dave Airlie <airlied@redhat.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Kees Cook <kees@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ETX3EDCZ6AM5W3TZ3INH2QLGIO6HQTJR/>
Archived-At: 
 <https://lore.freedesktop.org/4c953dda5ca7ab96fc419f99f1e0019768ea05a0.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

aaaaand I completely forgot to change this from a 1 to 0 in the patch
title ._.

Reviewers - I will make sure this gets fixed before pushing it upstream

On Mon, 2026-07-27 at 13:47 -0400, Lyude Paul wrote:
> Previously, it looked as if we were able to fix suspend/resume on
> some
> desktops by setting Gcoff based on whether or not we were entering
> runtime
> PM. This was a mistake though - the only time suspend/resume would
> end up
> actually working was if Gcoff =3D 0.
>=20
> It seems like it's likely the main reason for this is the FBSR GcOff
> argument actually controls GSP's behavior with regards to which
> buffers it
> decides to save across suspend/resume. When GcOff =3D 1, RM reserved
> regions
> are saved unless they are marked as LOST_ON_SUSPEND, and RM channel-
> context
> and kernel-client buffers are also saved -including- when they are
> LOST_ON_SUSPEND. This means with GcOff =3D 1, we end up having GSP save
> and
> restore buffers that actually need to be reinitialized on resume -
> causing
> the failures we're setting.
>=20
> In the long term, we do want to have GcOff =3D 1 as there are still a
> handful
> of edge cases around broken runtime PM that I've seen on laptops -
> and I
> have a strong guess that actually properly implementing the required
> bits
> for enabling GcOff will probably address a number of those issues.
> For now
> though, disabling GcOff results in runtime PM being dramatically more
> stable then it was before.
>=20
> Thanks to John Hubbard from Nvidia for providing some background on
> what
> these options do in the GSP firmware do!
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Fixes: 53dac0623853 ("drm/nouveau/gsp: add support for 570.144")
> Cc: <stable@vger.kernel.org> # v6.16+
> ---
> =C2=A0drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
> index 2945d5b4e5707..af5aa5065c3dd 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
> @@ -81,7 +81,7 @@ r570_fbsr_init(struct nvkm_gsp *gsp, struct
> sg_table *sgt, u64 size)
> =C2=A0=09ctrl->hClient =3D gsp->internal.client.object.handle;
> =C2=A0=09ctrl->hSysMem =3D memlist.handle;
> =C2=A0=09ctrl->sysmemAddrOfSuspendResumeData =3D gsp->sr.meta.addr;
> -=09ctrl->bEnteringGcoffState =3D 1;
> +=09ctrl->bEnteringGcoffState =3D 0;
> =C2=A0
> =C2=A0=09ret =3D nvkm_gsp_rm_ctrl_wr(&gsp->internal.device.subdevice,
> ctrl);
> =C2=A0=09if (ret)

