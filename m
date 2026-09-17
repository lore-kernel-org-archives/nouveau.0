Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31239C982D0
	for <nouveau@archiver.kernel.org>; Thu, 17 Sep 2026 20:56:53 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 081F210E856;
	Thu, 17 Sep 2026 20:56:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Lr/J5YVi";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id F2DD74823F;
	Thu, 17 Sep 2026 20:39:13 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789677553;
 b=zoy4t7AePsPozhFtHy8KFhWveZ0+27vLqbGocSppHLtvEZw3rNODSyUwyGC7L5ZNXmva2
 BOA+wkmNW9TX096NXXYHdBQ9qXCYu+2qQ2k8WsT3AlNWYASdk1TyhChr0vymKfReK4LizzL
 RGONvdiopovMGofgGmfLHAyYO8FxL9+hcXw1UtJfxa1r6QujaIveIzc97kZJKZQpiPwG0jV
 EKQQFm1CO7LzkVc/EWkST/kiUE60SQnQjvA3/M8XOM8kJAVKQKimmsUggtGMWipG+zqLFm/
 IZVfZSDN4ClvpsTzBq62gVCnZaje7Urohoay62jRB85ex7ltr91/qwwkavTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789677553; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=tuPRIeEUeSpx2M/Op+d04joFRM2fDL04NuKxDNyxZ5Q=;
 b=pVMgi219sW2KUYzHIc/i0oP8yXPiVAQLQxfQouK76Otp1Xb3KAuXkbfAW+zVJZgwozJ79
 Jvt6By01lW0zpd3ygvCXVPnZ8PPQnYGDMB9aMYJWhUy6FIrO3hW9ftzJRGCZgf/llanr88F
 i36jym98Lsg4UGLPij2zA+JlVK3v8ZJfDEnc/kkoGH3r5P/OWEEVqyCBWEIM3bvT7sfHhZp
 QEGtiMAAE81p+LR3ypcJIV/txXX4bpNof92xD82eGHarwD5wIiynqLvLdTjys+iyF3SKYcj
 SxU0HJ+RVHy908tmb62AWuyXI4C3Qi+avVw5f9xD3woh6A8zzvF8/LV0Q8rA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 90DF4481EA
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 20:39:11 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5C4A710E59C
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 20:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789678608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tuPRIeEUeSpx2M/Op+d04joFRM2fDL04NuKxDNyxZ5Q=;
	b=Lr/J5YVi7YQupe+YkVUiDTn4ZI3yrInunQ4xOrO0ZqCnK88vJ91MQSBjnx6xS8wIn9N5G8
	tXfc1ofFucXsgf+zRYyCVJhtFGZ6wrMakWP6pMpkiSJJa2vyRYQhSEos3HfEzsYqvXLlUP
	QOitl9YtFjT5T9DTT5k2go/14QC1FSo=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-195-1fsMAkGOPd2wb2-9falmRg-1; Thu, 17 Sep 2026 16:56:47 -0400
X-MC-Unique: 1fsMAkGOPd2wb2-9falmRg-1
X-Mimecast-MFC-AGG-ID: 1fsMAkGOPd2wb2-9falmRg_1789678607
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93bd22160bbso11852885a.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 17 Sep 2026 13:56:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789678607; x=1790283407;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K/Cg05CbpIvavYCVyx9/3zE/8H3+/AOemaPQ8wmlxF8=;
        b=dG2BAn+kwCdeeb+y8j7YrT2r2dOwZTg48DG01H2cDtT+IFOggTYePCkn4lU4PkK3H0
         DLRLPBtudhoC/cUvZuzQh5mHxfPGk0tZdeJF+h3r158mk1rggsETzlFa5FTT2pIXSa5S
         95a9axJXId8QyNd7drq15UWDpcyZfSwEaKyaFr3FDQXNjkzEzapD4+QnCB8SpWpfzs2A
         R6yLkAyERUgvZa7PQ162qbeN/d+B2IeMM8Ejh6L4lsSUxQ1QFJ4HTKvzvmn5S7Qx1mwp
         L/UHZFoKnh2NRQo0UDsOBC2YvMFB18J8LJSFaPbMrsdXM7Ycam9n8xT+mQB24InH5USA
         HyPQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwtC6w9FT8CHYm8Ny7AUGiM5fmGRLtq5brStc2tnrAsXfQpoyTXu5/BJyBp2i82ePU8wEgbZZ5J@lists.freedesktop.org
X-Gm-Message-State: AFuF++n820hpeRdozDubDT/ItZaDOhb1csJbstA/bbiSbXcViA5tbzUC
	FQvd30JPjh/hSAWxOBXX3/lpWGB8jZg2nLfXoxWWJtYRLvDHvyuOmqzP9iyDETAhOqalg2CTqt8
	j4Bzgaee60T/w6HRP2emWOdmevK+hDKN53o5oRWxhjTsGWTno42qQRuNoedZ76adofR8=
X-Gm-Gg: AYBFou2eZvuOuOdK+8dtz7+hk5XEqSeJZEYQQdHL+6FT8HSEoFBNCZccfk4w5jA2E4d
	rlj8k12gUOfSh9yhSI+R9Yt6hfN07s1x7iWaoSzaq7HiSA33W+OX0n09WnfEdgLKU7CcgeSl2Ly
	mhz5hyfX0TyBJoghUnlf3yAGgVvGRX/9TFYbnvBOaU0/0QVKOpU1Hl2OXuPq1zkTkF2IZz1NcCa
	yMDoxR5OvJUFz2Oj35A9i1i/8Aj8zL7v76DqJGRpfMN8bHpWrAZS3PLA2AQxVTEqqFfV46/GsM2
	8Z+B2DZLrb9t0IJouHV6WqVmRC5NPLVXniInknksKwQrxvtA7WDDx2AuINSvhjTtDBYblPl/
X-Received: by 2002:a05:620a:8086:b0:937:7836:1501 with SMTP id
 af79cd13be357-93bdc6a7a23mr29334285a.10.1789678606818;
        Thu, 17 Sep 2026 13:56:46 -0700 (PDT)
X-Received: by 2002:a05:620a:8086:b0:937:7836:1501 with SMTP id
 af79cd13be357-93bdc6a7a23mr29329085a.10.1789678606225;
        Thu, 17 Sep 2026 13:56:46 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93b781d94c0sm539461985a.10.2026.09.17.13.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 13:56:44 -0700 (PDT)
Message-ID: <ad023b5df1495ced25aa681d10f57628df41ac13.camel@redhat.com>
Subject: Re: [PATCH v2 1/4] drm/nouveau/clk: fix list cursor use after loop
 in nvkm_clk_ustate_update
From: lyude@redhat.com
To: Francesco Magazzu <postadelmaga@gmail.com>, Danilo Krummrich
	 <dakr@kernel.org>
Date: Thu, 17 Sep 2026 16:56:44 -0400
In-Reply-To: <20260712123616.1180830-2-postadelmaga@gmail.com>
References: <20260712123616.1180830-1-postadelmaga@gmail.com>
	 <20260712123616.1180830-2-postadelmaga@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MR8rDgnOrI3xSiK0peJ3iU92LhjMaUiL4h5oxu0F_BY_1789678607
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: HL3IKTANJ6SHT4S62HDKIL5KAE5KSMWU
X-Message-ID-Hash: HL3IKTANJ6SHT4S62HDKIL5KAE5KSMWU
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HL3IKTANJ6SHT4S62HDKIL5KAE5KSMWU/>
Archived-At: 
 <https://lore.freedesktop.org/ad023b5df1495ced25aa681d10f57628df41ac13.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This patch looks fine to me, but but if this was posted by Dan
Carpenter originally would you mind switching the authorship over to
their name?

On Sun, 2026-07-12 at 14:36 +0200, Francesco Magazzu wrote:
> If the requested pstate id is not present in the state list (or the
> list is empty, e.g. broken/missing perf tables), the
> list_for_each_entry
> cursor runs off the end of the list and the subsequent
> pstate->pstate !=3D req check dereferences the list head cast to a
> struct nvkm_pstate, which is an out-of-bounds read.
>=20
> Track whether the entry was actually found instead of inspecting the
> cursor after the loop.
>=20
> Fixes: 7c8565220697 ("drm/nouveau/clk: implement power state and
> engine clock control in core")
> Signed-off-by: Francesco Magazzu <postadelmaga@gmail.com>
> ---
> Note: essentially the same fix was posted by Dan Carpenter in 2022
> and
> never picked up; the bug is still present in drm-misc-next.=C2=A0 Credit
> for
> spotting it goes to him.
> Link: https://lore.kernel.org/dri-devel/YvSkKAdk8Pe0g2K9@kili/
>=20
> =C2=A0drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c | 8 ++++++--
> =C2=A01 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
> index 572e63846..42f3709e0 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
> @@ -479,13 +479,17 @@ nvkm_clk_ustate_update(struct nvkm_clk *clk,
> int req)
> =C2=A0=09=09return -ENOSYS;
> =C2=A0
> =C2=A0=09if (req !=3D -1 && req !=3D -2) {
> +=09=09bool found =3D false;
> +
> =C2=A0=09=09list_for_each_entry(pstate, &clk->states, head) {
> -=09=09=09if (pstate->pstate =3D=3D req)
> +=09=09=09if (pstate->pstate =3D=3D req) {
> +=09=09=09=09found =3D true;
> =C2=A0=09=09=09=09break;
> +=09=09=09}
> =C2=A0=09=09=09i++;
> =C2=A0=09=09}
> =C2=A0
> -=09=09if (pstate->pstate !=3D req)
> +=09=09if (!found)
> =C2=A0=09=09=09return -EINVAL;
> =C2=A0=09=09req =3D i;
> =C2=A0=09}

