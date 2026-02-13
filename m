Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F99EEEA84E
	for <nouveau@archiver.kernel.org>; Fri, 13 Feb 2026 17:14:06 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CC43B10E301;
	Fri, 13 Feb 2026 17:14:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IF5PWLRw";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9531342DA9;
	Fri, 13 Feb 2026 17:04:25 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771002265;
 b=jdt0+byI/b6vOEzm5jZ4Osj9QWfBIQjcB9kdXg6/57kCnHriJVdOu47bbDDCV2mxwUcjS
 VqVv6ynKeFmAQP/8nQFodMIp9O1+oTc4AECQe8E4PyrVtBovVYOrtQwv73eU+ZyOZ3CGfQs
 khJWelUcYhVlfzguK8zAu977zLsjFlqOWzGGUzH0TanCHSqrjfG1SvSufey9v+PIoQLwYMV
 2328+aPit/1edkNMFZvv3YhqSTS37lqKzZyu3DLrhWnZUfntCKxZ+5EQ8kFH+YPIDgPEapP
 2ufsz76QOCWFRHGy1j8+Nwo9CbSrru3IUPTJ3cKM8zrZYO1fqjG+rOv07jYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771002265; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=YqeUfSXr+h3uHWIUJ4OfsDIIb7hEXYJAEBWt0ETAMUY=;
 b=vFAVay9b2v4zBNEahIJAjE4iNqZ3waDwnNGTov8BZlYcVbk+xhKEH0a3/+C1NkYQoTOws
 Spf4XWlT43wseXBodE1ukOfrWz5o6Xl0wxxDd/LkaO68lotW74Ti5+/C+/Ot3N8nT/0pny0
 hGszS2JYmmt1yo2FY/pXzIwW0DLV2S6YEGArbX4h/k3izBbe2EnseYQWVX+kAb4znw07QvM
 DlmY+9eTjCUqFqsq9guIpTw2wAuvHHBRuSLzYOt+Yl31bOPNnypQ2uUu40wU7SorS3N3ubv
 Hdx6bk80C9HhzclVEsMRsm5PN3LCwnSowwevqZf8MpwJQAf4D67sBZX0yKmw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id DFE6D41CAA
	for <nouveau@lists.freedesktop.org>; Fri, 13 Feb 2026 17:04:22 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A63EB10E128;
	Fri, 13 Feb 2026 17:14:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6AC0743D67;
	Fri, 13 Feb 2026 17:14:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BFBCC116C6;
	Fri, 13 Feb 2026 17:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771002840;
	bh=TQL4yAmfHTFRfL0Xxlqlv5cDS//+iCUzmjzvprvGhzA=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=IF5PWLRwZ3W8kZnVR/YrM2BhpdTTWg2n95CZgpkjQeDbyZ7hFIz9Ag8w8glsCTe8e
	 wYJsg9V9KpwJXzJKlWDdpiotnJ4nfLbailIpA3EUGoDspzGm67IeEkhPbgLxdVWEGE
	 mUtxl/6sih/k9ZTvYOQ3kLl8Aj37o8Mx+jWIlBk3gvk/2U7ayrh8d1TRHxOHyHXZJ4
	 lnADxY203WtyVlW8hL/OGI9wp1RaGuvPfez2tXhGLw62RF6Oby0M+Y67onCWv5SgkW
	 x+r2sY+iYeEdofBnOHXwbWpUMzThTaexKLtL+wexg12k6Y38yVku70oEQ3X1uecVtc
	 JtkatWQH2uOVQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Feb 2026 18:13:56 +0100
Message-Id: <DGE03Z9YNGAW.3RUQ7P7L93HEE@kernel.org>
Subject: Re: [PATCH v2 2/2] drm/nouveau: Add
 DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO
To: "Mel Henning" <mhenning@darkrefraction.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260205-zcull3-v2-0-ac572f38cc7b@darkrefraction.com>
 <20260205-zcull3-v2-2-ac572f38cc7b@darkrefraction.com>
In-Reply-To: <20260205-zcull3-v2-2-ac572f38cc7b@darkrefraction.com>
Message-ID-Hash: O2RZQXOWYO4BO5JSJUWIINUMUF2RAHA7
X-Message-ID-Hash: O2RZQXOWYO4BO5JSJUWIINUMUF2RAHA7
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Mary Guillemard <mary@mary.zone>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/O2RZQXOWYO4BO5JSJUWIINUMUF2RAHA7/>
Archived-At: 
 <https://lore.freedesktop.org/DGE03Z9YNGAW.3RUQ7P7L93HEE@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu Feb 5, 2026 at 7:56 PM CET, Mel Henning wrote:
> +int
> +nouveau_abi16_ioctl_get_zcull_info(ABI16_IOCTL_ARGS)
> +{
> +	struct nouveau_drm *drm =3D nouveau_drm(dev);
> +	struct nvkm_gr *gr =3D nvxx_gr(drm);
> +	struct drm_nouveau_get_zcull_info *out =3D data;
> +
> +	if (gr->has_zcull_info) {
> +		const struct nvkm_gr_zcull_info *i =3D &gr->zcull_info;
> +
> +		out->width_align_pixels =3D i->width_align_pixels;
> +		out->height_align_pixels =3D i->height_align_pixels;
> +		out->pixel_squares_by_aliquots =3D i->pixel_squares_by_aliquots;
> +		out->aliquot_total =3D i->aliquot_total;
> +		out->zcull_region_byte_multiplier =3D i->zcull_region_byte_multiplier;
> +		out->zcull_region_header_size =3D i->zcull_region_header_size;
> +		out->zcull_subregion_header_size =3D i->zcull_subregion_header_size;
> +		out->subregion_count =3D i->subregion_count;
> +		out->subregion_width_align_pixels =3D i->subregion_width_align_pixels;
> +		out->subregion_height_align_pixels =3D i->subregion_height_align_pixel=
s;
> +		out->ctxsw_size =3D i->ctxsw_size;
> +		out->ctxsw_align =3D i->ctxsw_align;
> +
> +		return 0;
> +	} else {
> +		return -ENODEV;

ENODEV usually means that that device fell off the bus, I think ENOTTY woul=
d be
a better fit.

> +	}
> +}
