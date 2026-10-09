Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B995ECA9EBB
	for <nouveau@archiver.kernel.org>; Fri,  9 Oct 2026 21:25:40 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 94ACE1122C4;
	Fri,  9 Oct 2026 21:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GzG2cqAL";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D943B48A09;
	Fri,  9 Oct 2026 21:07:13 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1791580033;
 b=SFS7j6tRp5pAUKjbBJEOC8ii3DO9jna3bbehyubc7hGV17sJ53lHd3xuTX2AZC6ITJmca
 kGbxahiGudCoMuE37kD1nq7sabxnMWTAyyL8Hd5Qu96xfHIIWjE1hso8ajZNKxCdVHoT0Cy
 CBK5L8Bl+RKBmPPfWHlNi7izhSN2Z9BwAd6Aua0vkJK6b9DDJFQHclBCRVXF2udCNSuyZiv
 Tl5zYsRZ+mMkZr0lrq3pUZr6kPk+rZpFESOdfFUqyZ6ZJycyZHmbA10DacV9GXaw9sZj2l+
 LXluIfrjiDPl9tExWil0vmuxLJT1tg8A8JnD/ZbdR/HbqcagrOBUG0xlSJ1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1791580033; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=psL5p8+MFK4U9KNE7OIgkacUcKEzN5U0oHZT0YkzTS0=;
 b=XhZzU1DzfClV3pzwmxKF8yK/ug2XFeKSyH5swIyNegYau/xePTx8f+ZKwn4fASB3Zawr/
 irwRyNI97q9Eb4Hv61PkA7ZU/FEZAk45FFO+9h4TLc9EsKQtpIn3mXVj+F7wa2wMUEmGPJz
 Yyp0/01teTBr9XUZHaegSDysQHMejEfLYqAnUIdz+VhW/xKXgqR69VZxl/TT/OJXmw+XJ27
 r44+EF3u/63WEv/KbsJsEmVECvwEVLp8S0Cn08I19bhe7PUgOlrQ/qYC2ORi7kxJ/BAp0F3
 Q3UMiQh5ClJ49e44MGdjdHnilkKheH8mUx77VQgSrSS8jxRIFcatV4xWGZ/w==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 07EA0489E7
	for <nouveau@lists.freedesktop.org>; Fri,  9 Oct 2026 21:07:11 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6DDF21122AE
	for <nouveau@lists.freedesktop.org>; Fri,  9 Oct 2026 21:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791581136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=psL5p8+MFK4U9KNE7OIgkacUcKEzN5U0oHZT0YkzTS0=;
	b=GzG2cqALpnCLp3piNHVtNsJStRQBU+Uk4vK0V90jdc48qvaPd1lTRILWOtpQaLeZa4lI4V
	Ly+z2en3fRUWVaXLaof3GgI58Ck25I82rk6frKvVKauTserY/X2a+xeU2LdNl3OVhC1vuz
	8v0TC5WEVKjFsVjsvtNBcYK2SbbBUtA=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-81-UvoxkGjeNZ64fi3m1gIjvQ-1; Fri, 9 Oct 2026 21:25:35 +0000
X-MC-Unique: UvoxkGjeNZ64fi3m1gIjvQ-1
X-Mimecast-MFC-AGG-ID: UvoxkGjeNZ64fi3m1gIjvQ_1791581135
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-91961d4b31bso6350296d6.0
        for <nouveau@lists.freedesktop.org>;
 Fri, 09 Oct 2026 14:25:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791581135; x=1792185935;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4XVeputkPvs6515x7jeBdEMihAqSCocptjoH5SwkFZU=;
        b=ObaGy6tIVygwW1Dz/kIQLHgsrB4misktbgTdPt2lXISXHlikK4ruTUAdp/M7fbt9YR
         ER0yf/w7LoFwkwbQNEreCvE3guWoYMbnGSw48BjeaLizsf1HjBYXDmvJRZd/xWAoigsw
         YbEyAptYWtjtlHH49h273Toz9B+dzMJzuC9mM1F4errgK3HwJoP7vjML5zMWz1tuNzeK
         olF66/PXiQXNwEPwyLWTFnsSGdutmUeeggcAcn3IchPfZJyeB9m5MwM6ATjiwvDjAyAA
         zTDkOo7YrTDFH0qJpvwlAB8HtfIf4pch/5SpEVy474YMc+HDhP7i9ORWScovirz0B43W
         M6Wg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxlGd1bss9lNTJg3kDwUHMq47ibTp8HYOhx80zjps8PqI3PitwKAxWVtENqNtJe83+inKv6SW/0@lists.freedesktop.org
X-Gm-Message-State: AFq9FYKbP+ZXZFsOXmIggJJxaU2zPtmx0h4EceZVuiqEXDu4M7JpJEQg
	Neza4jjb01DJXXO4OM4hwEFihKmT1S/ExrgH2MLQ7j573tSzffJMU2LfV6Ptwo6+KPnNzLKgrlP
	84oOmJO6rtLDwRjFZsvTSxLPLm6ABYue493j0G1Ootu2o7b1Npy6M4sDBfAgss9H8Dpk=
X-Gm-Gg: AYBFou0XLxHgRkCeXPj8HydDl7vh247ZSSRB4ctLD9PbHEez8dUkMyVD7v3oEMqx/pP
	7LgxUnTrgIajQ50+wxf4l3BmqtO8WtFvzUveSYuWVdq2Cxl44ojk53yOdC0rb0218E+DLyNsina
	Sz/fKTR63WADl78i4ODHXxsSjARZQGMdMGYQcSeq9pULadoDKwLlXQo52AAyatwHKNRWanYRz/h
	9TNbSO2b6Gs7GfXPJd9pddN/gbmycyX4PvGnEa109iSItHDh/F8WXoJ9r8eIGlQ4rPIV1Zj9+hZ
	7LaHyTP1nGhGmV52THYn2kG29lQNX/8pagYO6RAcYyOPzTVwnNw/PhaZOac3wtX+5BtWv7k=
X-Received: by 2002:ad4:5deb:0:b0:917:bbf1:5323 with SMTP id
 6a1803df08f44-91b55793527mr54975606d6.38.1791581134809;
        Fri, 09 Oct 2026 14:25:34 -0700 (PDT)
X-Received: by 2002:ad4:5deb:0:b0:917:bbf1:5323 with SMTP id
 6a1803df08f44-91b55793527mr54975196d6.38.1791581134294;
        Fri, 09 Oct 2026 14:25:34 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91b550175e3sm28273536d6.11.2026.10.09.14.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 14:25:33 -0700 (PDT)
Message-ID: <c2bb04d3fcbfdfe3a92a794800dcb0331cc78a33.camel@redhat.com>
Subject: Re: [PATCH v2 2/3] nouveau: Fix NULL pointer dereference in
 GET_ZCULL_INFO ioctl
From: lyude@redhat.com
To: jim.cromie@gmail.com, Danilo Krummrich <dakr@kernel.org>, Maarten
 Lankhorst	 <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Dave Airlie	
 <airlied@redhat.com>
Date: Fri, 09 Oct 2026 17:25:32 -0400
In-Reply-To: <20261009-my-fixups-v2-2-839e2bbe514d@gmail.com>
References: <20261009-my-fixups-v2-0-839e2bbe514d@gmail.com>
	 <20261009-my-fixups-v2-2-839e2bbe514d@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RHEPbmN7U2iOmNy1WhTbEx5TDAhiWq9r1zxKeq2Ymfw_1791581135
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 3UAMOHK6QIFBFMRBE7FFTPIPSTR2MZCQ
X-Message-ID-Hash: 3UAMOHK6QIFBFMRBE7FFTPIPSTR2MZCQ
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Daniel Campos Ramos <Capitain_Jack@yahoo.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3UAMOHK6QIFBFMRBE7FFTPIPSTR2MZCQ/>
Archived-At: 
 <https://lore.freedesktop.org/c2bb04d3fcbfdfe3a92a794800dcb0331cc78a33.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Just for patchwork's sake, since the tags got stuck below the ---

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Fri, 2026-10-09 at 11:44 -0600, Jim Cromie via B4 Relay wrote:
> From: Jim Cromie <jim.cromie@gmail.com>
>=20
> When graphics engine firmware fails to load or initialization aborts
> early, nvxx_gr(drm) returns NULL. Calling
> DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO
> causes nouveau_abi16_ioctl_get_zcull_info() to dereference gr at
> offset
> 0xf0 without checking for NULL, triggering a kernel page fault.
>=20
> Validate that gr is non-NULL before inspecting gr->has_zcull_info.
>=20
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
> Aug 14 09:21:52 frodo kernel: BUG: kernel NULL pointer dereference,
> address: 00000000000000f0
> Aug 14 09:21:52 frodo kernel: #PF: error_code(0x0000) - not-present
> page
> Aug 14 09:21:52 frodo kernel: Oops: Oops: 0000 [#1] SMP NOPTI
> Aug 14 09:21:52 frodo kernel: RIP:
> 0010:nouveau_abi16_ioctl_get_zcull_info+0x17/0xa0 [nouveau]
> Aug 14 09:21:52 frodo kernel: Code: 00 00 00 90 90 90 90 90 90 90 90
> 90 90 90 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 48 8b 47 40 48 8b
> 00 48 8b 80 70 02 00 00 <80> b8 f0 00 00 00 00 74 72 8b 90 c0 00 00
> 00 89 16 8b 90 c4 00 00
> Aug 14 09:21:52 frodo kernel: Call Trace:
> Aug 14 09:21:52 frodo kernel:=C2=A0 <TASK>
> Aug 14 09:21:52 frodo kernel:=C2=A0 drm_ioctl_kernel+0xae/0x100
> Aug 14 09:21:52 frodo kernel:=C2=A0 drm_ioctl+0x2e0/0x560
> Aug 14 09:21:52 frodo kernel:=C2=A0 ?
> __pfx_nouveau_abi16_ioctl_get_zcull_info+0x10/0x10 [nouveau]
> Aug 14 09:21:52 frodo kernel:=C2=A0 nouveau_drm_ioctl+0x58/0xc0 [nouveau]
> Aug 14 09:21:52 frodo kernel:=C2=A0 __x64_sys_ioctl+0xb9/0x100
> Aug 14 09:21:52 frodo kernel:=C2=A0 do_syscall_64+0xe2/0x560
> Aug 14 09:21:52 frodo kernel:=C2=A0
> entry_SYSCALL_64_after_hwframe+0x76/0x7e
> Aug 14 09:21:52 frodo kernel:=C2=A0 </TASK>
>=20
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> Tested-by: Daniel Campos Ramos <Capitain_Jack@yahoo.com>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_abi16.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> index 3f130cd4fbcd..c7ddc54a3c4d 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> @@ -358,7 +358,7 @@
> nouveau_abi16_ioctl_get_zcull_info(ABI16_IOCTL_ARGS)
> =C2=A0=09struct nvkm_gr *gr =3D nvxx_gr(drm);
> =C2=A0=09struct drm_nouveau_get_zcull_info *out =3D data;
> =C2=A0
> -=09if (gr->has_zcull_info) {
> +=09if (gr && gr->has_zcull_info) {
> =C2=A0=09=09const struct nvkm_gr_zcull_info *i =3D &gr-
> >zcull_info;
> =C2=A0
> =C2=A0=09=09out->width_align_pixels =3D i->width_align_pixels;

