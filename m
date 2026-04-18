Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 898E5F99C7F
	for <nouveau@archiver.kernel.org>; Sat, 18 Apr 2026 12:12:34 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BC02810E339;
	Sat, 18 Apr 2026 12:12:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="m1yjrDgC";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D65BD45A47;
	Sat, 18 Apr 2026 12:00:32 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1776513632;
 b=rFuX26GlxZm3o7ycczY4FBfZfoXIIjY9LafR5i5tZDAjC/xy1Q0GIUzP7svm4DmBGpCca
 AJI8/d00pDKgC6wTOFXAV8i4C6mbexl+eKpqKo2PIoEE9U4aob5qEk3tPzWRjpylOkzCirE
 DC/3sUUTgiwh/AwGdB+5VOgo/n2zq2axyAthkMlA3dOGHcN6xogTkE6m6cKsqp+rz/HZWuo
 zUyy2zzo0ZSnSCeSNOHMSZJjZSK50mjWD6SjJS2PUop+nhCxj4LOJw9+L5Cq2fYG2i/weuz
 ChNKjiWfviWdxrn0MHcPps2zu/zdrG8CIxmSpWuknZbKGXmCs2vAqL/R4u3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1776513632; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=4Tchk66mi+1nkox945Yk2SQtZZyqk2yVtStWrQDB5ak=;
 b=fr1aMwQWRUgt2UBTMvBey4MKKUdln3Bcj15zuMdepr5Hr7+yJwX7gMLjUNfjjlXtE/f2q
 ZA86l6mUCi4Y+o7gZQdCK75qcGi3YbWtAm4Aa/CSE31uRLowK2cz+pTHHTiM93MOoRoLE3F
 QB7jgrYZW3sc+2GQF2Z8BSOBQoSDuZmbrn2ADPO1CM0d3MlLvjWut9ZIJ6pNLzAE3wkPmhr
 gvhUGHJ82ndoARisVaZ4nsqHDrPVg6hc6QxPMCk/ES0zL7crJLwczvOEl4WW/BOxLvylvXZ
 RgZ/3FkO0Wck4LhBGY6ObQgxjjnwxEANYghHTTFyE41XHbp0H5vYFkchpE/w==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 97B0845A2B
	for <nouveau@lists.freedesktop.org>; Sat, 18 Apr 2026 12:00:30 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4160C10E0B9;
	Sat, 18 Apr 2026 12:12:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D1C3A43832;
	Sat, 18 Apr 2026 12:12:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86DDCC19424;
	Sat, 18 Apr 2026 12:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776514349;
	bh=b9PenJjHaSudWajbzycGmt+Iph3cnRU02bJt70Fh7Eg=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=m1yjrDgC2Vp3S9i2v6ibSL2JFghRG5C7W0hZT+LalgTRV1d7OnryWOSB6nnndhnYp
	 dCbOL2num5eSmqu1bDi587r/2SOMZZa1nqWxhLf7M7JjN94lkCjoVu93rtzCfiuyzO
	 NrF+DTMCzFGk+MYZGmNkqPxPJR+4SfVS4d7MdRsFaZuPBJoj53dseGveTtyZHtHA5e
	 NKuYe8ftmP7kAh+2zEn9XPYZOL/ffb/0+53Ko/kcS2f4XDAplXWcFI2Ca0k5t57/xE
	 CckFwhX1B9mrP2MOo7YpWRCfuj+3OuukgNtaYIFU785F7YAIjUnmC3XCOP4qKcb0pF
	 Xg5ix46JWpC5A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 18 Apr 2026 14:12:25 +0200
Message-Id: <DHW9RZVWDN6Y.2G2RKSJMF5ESB@kernel.org>
Subject: Re: [PATCH] drm/nouveau/gsp:  Fix possible NULL pointer dereference
 warning in r535_dmac_alloc
To: <sunliming@linux.dev>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260418071412.86022-1-sunliming@linux.dev>
In-Reply-To: <20260418071412.86022-1-sunliming@linux.dev>
Message-ID-Hash: D4GZTQ7D6VQJEQOVJX5Y4W34LCXNMTUE
X-Message-ID-Hash: D4GZTQ7D6VQJEQOVJX5Y4W34LCXNMTUE
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: maarten.lankhorst@linux.intel.com, mripard@kernel.org, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, sunliming <sunliming@kylinos.cn>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/D4GZTQ7D6VQJEQOVJX5Y4W34LCXNMTUE/>
Archived-At: 
 <https://lore.freedesktop.org/DHW9RZVWDN6Y.2G2RKSJMF5ESB@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat Apr 18, 2026 at 9:14 AM CEST, sunliming wrote:
> From: sunliming <sunliming@kylinos.cn>
>
> Fix below smatch warnings:
> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c:178 r535_dmac_allo=
c()
> warn: 'args' can also be NULL

Please write a commit description that explains also the underlying problem=
; see
more below.

> Signed-off-by: sunliming <sunliming@kylinos.cn>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c b/dri=
vers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
> index 6e63df816d85..6dec2623d0be 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
> @@ -172,6 +172,8 @@ r535_dmac_alloc(struct nvkm_disp *disp, u32 oclass, i=
nt inst, u32 put_offset,
> =20
>  	args =3D nvkm_gsp_rm_alloc_get(&disp->rm.object, (oclass << 16) | inst,=
 oclass,
>  				     sizeof(*args), dmac);
> +	if (!args)
> +		return -ENOMEM;

Are we sure that this can ever return NULL in the first place? I know that
nvkm_gsp_rm_alloc_get() internally checks for IS_ERR_OR_NULL(), but I could=
n't
find anything within the callchain that would actually return NULL.

That said, I think IS_ERR_OR_NULL() checks are misleading.

>  	if (IS_ERR(args))
>  		return PTR_ERR(args);
> =20
> --=20
> 2.25.1

