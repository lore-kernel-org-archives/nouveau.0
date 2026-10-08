Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 405C8CA6016
	for <nouveau@archiver.kernel.org>; Thu,  8 Oct 2026 22:18:44 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 16ED210EA40;
	Thu,  8 Oct 2026 22:18:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Z3Wt53Xs";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7CBE1489D4;
	Thu,  8 Oct 2026 22:00:19 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1791496819;
 b=ZPyaI351Mi3rONsK/c8BOOYupTgwVlxYIQgcBdtn9b/3cJW2ngnTCgPxLl58Igql9vsfH
 iWX/Z1ab8bZMP2gm5AuVCzD8vCzb9rCmWbrnEOrhiawwDJh5SRLV3mhQCDzmlRtoOMt+glJ
 UCG/SZFHkBsazg2C8RMt5LeNW+zr+P6U7mZKwpKA47vNQ+noVOKEZCC9RfNGHcqsxUftcGn
 wN+ociwBqJoDYbnQSkU8/Pnk/Ir7rk4okEYw01M3vZVRROxEr9BSJEC9Q4HynB3Yv7h8tt/
 yA/KEw0Ctbbq0jV0tHVfzeD/VJv94oyEDxmVWQxHbLvOwvdilSio1vrBJfFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1791496819; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=WtbOZ4eCfsngvv2Aa3m2P0rWvfn9a/Va6ZO3mHSay2Q=;
 b=NTsNbQt70svaMp4fXkKtKiy3VAnj8fbRaV8+srRiKpP+hfvRz1deF57hOJ5cAOiEJpZG+
 csR+KUAPSXl2BWNYTT4suBFgsWw3Ch98fuBH9tOy3NLSzMDAMXZZaqqFteebSZKDq7l2+mv
 7Ain/qhuHXvxgODWxJyeuEnf1ZSEkmNbSpwkufl1SthPCpBBtl1IRR72EM0cWKUR9aQ6fvI
 okh2J3spt1Hcv/iTlY3VTZ4keL9DZzmh7koAgQQwKjAEFdkGulx/m5aGH03sARBMkZl/+Im
 QFQFKtbxu4H90Prn2dSgEAnf4TWiuxWgDWaGOn7l9AhsOdNl+J176sLlYvcg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 72CD448890
	for <nouveau@lists.freedesktop.org>; Thu,  8 Oct 2026 22:00:17 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B294210E155
	for <nouveau@lists.freedesktop.org>; Thu,  8 Oct 2026 22:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791497920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WtbOZ4eCfsngvv2Aa3m2P0rWvfn9a/Va6ZO3mHSay2Q=;
	b=Z3Wt53XsRYLR8xu/+CIFXjz3aiLsYYlA2a1kkca01jvzCS9RF9TRFCfLnZoVEijExomynM
	h0/li8xg7MZOs9TTcxBlciFwE3FNQyg478KtGG9NQUN4AYzQyMh/7lr4Lt9UglPzBpTUoy
	fspwdw0d5au3JXyhHeApnnBzYtALd3c=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-UfiC_LpsOjW6edpyhe4FGw-1; Thu, 08 Oct 2026 18:18:39 -0400
X-MC-Unique: UfiC_LpsOjW6edpyhe4FGw-1
X-Mimecast-MFC-AGG-ID: UfiC_LpsOjW6edpyhe4FGw_1791497919
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-9104eedb5b0so167483736d6.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 08 Oct 2026 15:18:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791497919; x=1792102719;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S516mKsihJvGMAbQN1NJPExU5zniQAE3QbqOLbNkeRI=;
        b=p1FRho+Ba+WlpClbFTJJmpScck9qAwgI7CZjoRaIUXDK+bxtsikyJEnhK0tmcOpO5M
         jQnnn2JrJQWJw70tbO56dSyN1B8z3P3ccpZWlBQtiJZBsZJ4g3aaOgHS+znZljHvR5am
         tu+E5dwDWojFCkEa3xZARP21HmY0oRnR4RpKs6yzldZMTrCuI/Ok9/tbzeyzNxBY0Iwe
         XxUhsq/iAnji5ecPNgP4i5AxyzCLoykVajCxw1Uy88HIfQUEFnkjy+UKhlkZGI5Sp9kg
         Gmi3PuapsCWP6Dkp46/xRzuzmKKahOWYYtFqwe1VO9xJYziu3SX1J+XEJMxqTZEioXMy
         672g==
X-Forwarded-Encrypted: i=1;
 AKwUvBw/1m5s5UeTQR1RCZWQWECuzFFxsZVQlS1gaCaWc+dodcLZ9GWet4z7TEs2Uv+K/GWxuwyOKarL@lists.freedesktop.org
X-Gm-Message-State: AFq9FYJpZoQ5ZeY0deYcPicPl9JWNqQw2VqZV3E6bogGb++DcAvvgkwN
	EFV0NKctkMb4AowGaL+xy9atWYifP1PuSTjyNFXreK8eQxqWlQDBWpvvusYK9oiXqPti/XU+pvy
	HMQsBnjm/6o1T9F0LeyKlfLsQKpz4ZUe9ykQGJGnTZRnnPhOSpjNQVCvHJOy4Mkx/fac=
X-Gm-Gg: AYBFou00G//hLYZm21xpE4m9lcOFD4ThuTMVik3448ggO9BPCFk+ZyFYKHfNULNQvaW
	ESWduoD/S3mepv7aHSatpqxEu8Jc7K5YK5Oa+rzvbsDOKatCbNOa+u2M8PpgMlJOxpgpLl/A0Q1
	LhfWDrj08LQe2qAJhuJcdHilTVkJINwcQ/0ao0fdzFHuLpLCVDucjg9baI8IsDJHD6SqcFUgHGJ
	uTnhHv8wHBSyI7KYM421kBup/Ibk9eyLfcMcufGcNOLjZEqVRV90egmW9N9Rbj64ThYz/dymai2
	Migz4wgEoWd2Jh4fTlw+7yjknc9SYPPh9l0Rog7x1DAhyOIn7BSKD/abcvef42XSiS3aa6U=
X-Received: by 2002:a05:6214:451f:b0:919:952d:3b86 with SMTP id
 6a1803df08f44-91b557e0914mr2148756d6.49.1791497919076;
        Thu, 08 Oct 2026 15:18:39 -0700 (PDT)
X-Received: by 2002:a05:6214:451f:b0:919:952d:3b86 with SMTP id
 6a1803df08f44-91b557e0914mr2148316d6.49.1791497918471;
        Thu, 08 Oct 2026 15:18:38 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91b5501757bsm1712146d6.13.2026.10.08.15.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 15:18:37 -0700 (PDT)
Message-ID: <d601d2ee6e47fe1b624697cf5b0f4129c97b62d2.camel@redhat.com>
Subject: Re: [PATCH 1/3] drm/nouveau: Fix NULL pointer dereferences in
 GETPARAM ioctl
From: lyude@redhat.com
To: jim.cromie@gmail.com, Danilo Krummrich <dakr@kernel.org>, Maarten
 Lankhorst	 <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Dave Airlie	
 <airlied@redhat.com>
Date: Thu, 08 Oct 2026 18:18:37 -0400
In-Reply-To: <20261002-my-fixups-v1-1-a83d20f9d3fe@gmail.com>
References: <20261002-my-fixups-v1-0-a83d20f9d3fe@gmail.com>
	 <20261002-my-fixups-v1-1-a83d20f9d3fe@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: p9RQTlOBoLS5Uw3B3kOOvLE1_Iq_r-vYDF7YGcxB6Wc_1791497919
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 53LVUXQMDRKYMGLC7FKHCERFHNOMQ3X7
X-Message-ID-Hash: 53LVUXQMDRKYMGLC7FKHCERFHNOMQ3X7
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/53LVUXQMDRKYMGLC7FKHCERFHNOMQ3X7/>
Archived-At: 
 <https://lore.freedesktop.org/d601d2ee6e47fe1b624697cf5b0f4129c97b62d2.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, 2026-10-02 at 12:09 -0600, Jim Cromie via B4 Relay wrote:
> From: Jim Cromie <jim.cromie@gmail.com>
>=20
> When hardware or firmware initialization fails, the graphics engine
> (gr) or device functions may remain NULL. Attempting to access these
> during the GETPARAM ioctl (e.g., NOUVEAU_GETPARAM_GRAPH_UNITS)
> results
> in a kernel NULL pointer dereference, causing a crash when userspace
> (GNOME/Mesa) attempts to probe the device.
>=20
> Add safety checks for 'gr', 'gr->func', and 'nvkm_device->func' in
> the
> ioctl handler. Return -ENODEV to signal the missing hardware state to
> userspace, and use NV_ERROR_ONCE to provide diagnostic proof in the
> kernel log without risking a console flood.
>=20
> NOTE:
>=20
> I encountered these crashes while booting unrelated code (in
> dynamic-debug) on real HW.=C2=A0 There was also some fwupd updates around
> this time, so it could all be transient/unreproducible.=C2=A0 But it did
> happen, and could happen again in unforseen circumstances.
>=20
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_abi16.c | 25 +++++++++++++++++++++-=
-
> --
> =C2=A01 file changed, 21 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> index 4542d5f4ded8..cb1810dee8e5 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> @@ -306,7 +306,12 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
> =C2=A0=09=09getparam->value =3D 1;
> =C2=A0=09=09break;
> =C2=A0=09case NOUVEAU_GETPARAM_GRAPH_UNITS:
> -=09=09getparam->value =3D nvkm_gr_units(gr);
> +=09=09if (gr && gr->func) {
> +=09=09=09getparam->value =3D nvkm_gr_units(gr);
> +=09=09} else {
> +=09=09=09NV_ERROR_ONCE(drm, "GETPARAM_GRAPH_UNITS: no
> gr engine or func\n");
> +=09=09=09return -ENODEV;
> +=09=09}
> =C2=A0=09=09break;
> =C2=A0=09case NOUVEAU_GETPARAM_EXEC_PUSH_MAX: {
> =C2=A0=09=09int ib_max =3D getparam_dma_ib_max(device);
> @@ -315,11 +320,23 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
> =C2=A0=09=09break;
> =C2=A0=09}
> =C2=A0=09case NOUVEAU_GETPARAM_VRAM_BAR_SIZE:
> -=09=09getparam->value =3D nvkm_device->func-
> >resource_size(nvkm_device, NVKM_BAR1_FB);
> +=09=09if (nvkm_device && nvkm_device->func && nvkm_device-
> >func->resource_size) {
> +=09=09=09getparam->value =3D
> +=09=09=09=09nvkm_device->func-
> >resource_size(nvkm_device, NVKM_BAR1_FB);
> +=09=09} else {
> +=09=09=09NV_ERROR_ONCE(drm, "GETPARAM_VRAM_BAR_SIZE:
> no device func\n");
> +=09=09=09return -ENODEV;
> +=09=09}

For both of these I would just invert the conditionals like this:

if (!nvkm_device ||
    !nvkm_device->func ||
    !nvkm_device->func->resource_size) {
=09NV_ERROR_ONCE(drm, "blah blah");
=09return -ENODEV;
}


> =C2=A0=09=09break;
> =C2=A0=09case NOUVEAU_GETPARAM_VRAM_USED: {
> -=09=09struct ttm_resource_manager *vram_mgr =3D
> ttm_manager_type(&drm->ttm.bdev, TTM_PL_VRAM);
> -=09=09getparam->value =3D
> (u64)ttm_resource_manager_usage(vram_mgr);
> +=09=09struct ttm_resource_manager *vram_mgr =3D
> +=09=09=09ttm_manager_type(&drm->ttm.bdev,
> TTM_PL_VRAM);
> +=09=09if (vram_mgr) {
> +=09=09=09getparam->value =3D
> (u64)ttm_resource_manager_usage(vram_mgr);
> +=09=09} else {
> +=09=09=09NV_ERROR_ONCE(drm, "GETPARAM_VRAM_USED: no
> vram mgr\n");
> +=09=09=09return -ENODEV;
> +=09=09}
> =C2=A0=09=09break;
> =C2=A0=09}
> =C2=A0=09case NOUVEAU_GETPARAM_HAS_VMA_TILEMODE:

