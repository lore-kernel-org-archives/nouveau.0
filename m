Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF597CA6017
	for <nouveau@archiver.kernel.org>; Thu,  8 Oct 2026 21:50:30 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B343110FDA8;
	Thu,  8 Oct 2026 21:50:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RpboA2gY";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2E73B489CC;
	Thu,  8 Oct 2026 21:32:05 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1791495125;
 b=tbOnhCvXMI10WkTiWJO47HH6vmsstf6Iff668hEsvDgbQamIDPCzuehaAEHoVz0RrUJ30
 +NGu8kt32KKWMN1kPnYqsHb2xd+k2357XPD11kx359oOPb07N1mhjnG44DqOp1hhdv+WHHy
 02UFF84yv6k3zC5TK0CkTSigzIEUFOH84iegll5xnkaeECsSL85Kt6b+loMRxVJ9MLBMtR2
 oBnR/YAF/S65qtMJNGX7Y5ZCSpiXkmjTUoDNHCMCOZOwiGsjjoJ/cRiLDcfhBfq4MNtbZDa
 2+yoO9SWN96ecwOQAcUd2jecbl0qsQa4enLtl6nMybke23VXfPFlTR1zV6Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1791495125; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ePp3hoeNmkrVt/U9bUUOKdQrBVXEc7uic6P8CJcGdks=;
 b=Fi6LaIF2JME1Y4od4dJlxb4OlqqP3QWrwb47Y4VCQMRnTmJV+xpKE27KCyC6M5P7V994D
 jYG4HwBgeCtOKfMLrvEqm+uYkZLjzN8aI2Y0IiETY22e0pDsnC0H+vhUg6WyDd6fbfYYPUZ
 P63M+es+/BVsPBh9q8E4Y4CK6ZS1eqyprAgKyF/psP/ju/I74jNbFEAUHOSFnzKExX7WdnA
 PtED1NuYmbiwWa/X0P20x35n/cliiTQQEyyrZjNwzfwATm689WgesaD28Gn0hgOpsb8AkSt
 RZTQHVrNG5piDwPAJQkHbXaGxE8lrd4TwgTwW2kHrBVydiq0FHVoZZ1ZuQDQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id EB40A40634
	for <nouveau@lists.freedesktop.org>; Thu,  8 Oct 2026 21:32:02 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2B33610EA40
	for <nouveau@lists.freedesktop.org>; Thu,  8 Oct 2026 21:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791496226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ePp3hoeNmkrVt/U9bUUOKdQrBVXEc7uic6P8CJcGdks=;
	b=RpboA2gYBDvdePbfWHe31UiprRvGP1McagokK86JDsfFHJ0IKS1aZl203/lLAOHHQfreVu
	Chk9W8M4QBwoED3xJlpX3yw3i1IMdxsxV3d1uF6CbeL1bhwPMANjqIQpzaiPbinNMjWtlY
	J78prguKGWsUv6Twl6d++1wdtD1H/EY=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-278-jD1PzURQPgikBFCCl-ujkg-1; Thu, 8 Oct 2026 21:50:24 +0000
X-MC-Unique: jD1PzURQPgikBFCCl-ujkg-1
X-Mimecast-MFC-AGG-ID: jD1PzURQPgikBFCCl-ujkg_1791496224
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-917a7fffbe0so124830746d6.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 08 Oct 2026 14:50:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791496224; x=1792101024;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yj5+6LkgWgCIxY4tLK8pHE/X0tclHYwKwnVGo/2N7mk=;
        b=F0H95BR6TvmXto4/SshgfooWtQmkDftFmuWxqHXdnTD53OyZc1j2OHSPhr6VQJlrB6
         VwXwYd7WxbsSvs2yxSt34Yylpxjpii22UPOZomdLTB3+BvisqLYaBpTF7pAsbbnzzYTg
         vR+IGdicGqkrnUj3rt9A0thyYf5ZiTWd7FP77Csh+QwEYPYsNz4vGZWTNVBPGxLQwuaF
         kz8MphCkpMCAhCyyJPySFrc+A3IszBVSWqOJQD6eywCSPBX9U4ij7QrE3YBSKaLMV4lE
         wuMnDarupKou6QDTpqzxPP+oRnYpHvsdKn+3THS/Tjba3tpCjglOi4oZntTlI3gLUFOP
         IAzQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzFCX6RJL3hLpDioT+aqYSDbTEja+yssLG7cZVShLCkAUfiUlwzihXpc59aMJcdgAjyVO6Ac2ur@lists.freedesktop.org
X-Gm-Message-State: AFq9FYKRU3NQX0sgS7Bvw6C7uDqqxcdf5v5iIjVURyzrWEgjNC4Lm6k0
	X46nH/1qSxwyewHsEqHcgE09fHyNwf2S9k0wSFc3FB1gHXZs6bcJJJpKLGVopymb4oIwhOBX/6w
	D1vf7UuGzK+PYox4KnfMpBMsrd2cTwSonvUGhHJw9bG001j6IGEaqsZDnqlmS38Dj6lRAGAc2Yy
	M=
X-Gm-Gg: AYBFou1yYknIhCARAvTDMt+EQ0GDqxmCT1HYEEicjNMopEqVJBvOw0a66Qf7/NpjV2G
	6D6300MeG4/I0xyipw8e8axnt3FYS/oPL/lLEd5RJMdaeh/2veqMpzWGz//8h65BQqkLS57SJga
	/dgVyvKgFcQxRx/1w4Rm/ssxXTMUrkE2Dux5CXFaPyvIQrobDwfH0Altp6urwDyIYr+h3X6UEB3
	C6tYGgWjtBLnKCTRLXugO0PnZTCgYLkky7xGcenjP9nQvqyxUMclyhseIHgZBO7CMmfyySsoPJT
	rUHRkLOJLtNviGYpehTH16hU7aiScR8U2aTTvAesj+I+jobht7CI9E/TUr1YjvZgm5Qi9Mw=
X-Received: by 2002:a05:6214:4497:b0:917:edd4:d1d5 with SMTP id
 6a1803df08f44-91b557bd604mr849546d6.42.1791496223815;
        Thu, 08 Oct 2026 14:50:23 -0700 (PDT)
X-Received: by 2002:a05:6214:4497:b0:917:edd4:d1d5 with SMTP id
 6a1803df08f44-91b557bd604mr849236d6.42.1791496223367;
        Thu, 08 Oct 2026 14:50:23 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91b55120027sm1006706d6.49.2026.10.08.14.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 14:50:22 -0700 (PDT)
Message-ID: <728a8ff2bea09d6e35446bb13ac663f2c3a63ea8.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau: Skip the Turing CE workaround object for
 non-GR channels
From: lyude@redhat.com
To: Mary Guillemard <mary@mary.zone>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann	 <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter	 <simona@ffwll.ch>
Date: Thu, 08 Oct 2026 17:50:22 -0400
In-Reply-To: <20261007-turing-async-ce-fix-v1-1-12ee6ccd1a3c@mary.zone>
References: <20261007-turing-async-ce-fix-v1-1-12ee6ccd1a3c@mary.zone>
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: o0mhU37zDovFWGDv1-gnYC7NcmCzgi583GvSZu5E2XM_1791496224
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: SPHXKWWEGV7CDWBMIOIERP3AF2ZCJMZ5
X-Message-ID-Hash: SPHXKWWEGV7CDWBMIOIERP3AF2ZCJMZ5
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/SPHXKWWEGV7CDWBMIOIERP3AF2ZCJMZ5/>
Archived-At: 
 <https://lore.freedesktop.org/728a8ff2bea09d6e35446bb13ac663f2c3a63ea8.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to drm-misc-fixes in just a moment

On Wed, 2026-10-07 at 16:30 +0200, Mary Guillemard wrote:
> This workaround is here for the old Gallium driver and predate async
> CE
> and NVDEC.=C2=A0 Instead of only skipping it for NVDEC, let's only apply
> it
> in case of GR channels.
>=20
> This should make async CE work properly on Turing by stopping the
> assign
> of a GRCE. (here CE0)
>=20
> Signed-off-by: Mary Guillemard <mary@mary.zone>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_abi16.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> index e907c1d07887..e876f154963d 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> @@ -488,7 +488,7 @@
> nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
> =C2=A0=09=09=09goto done;
> =C2=A0=09=09break;
> =C2=A0=09case NV_DEVICE_INFO_V0_TURING:
> -=09=09if (engine !=3D NV_DEVICE_HOST_RUNLIST_ENGINES_NVDEC)
> {
> +=09=09if (engine =3D=3D NV_DEVICE_HOST_RUNLIST_ENGINES_GR) {
> =C2=A0=09=09=09ret =3D nvif_object_ctor(&chan->chan->user,
> "abi16CeWar",
> =C2=A0=09=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0, TURING_DMA_C=
OPY_A,
> NULL, 0,
> =C2=A0=09=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &chan->ce);
>=20
> ---
> base-commit: 70456f05d4b6396b22048c4b8cd3cb98ecf9f9e3
> change-id: 20261007-turing-async-ce-fix-42e179e27d4a
>=20
> Best regards,

