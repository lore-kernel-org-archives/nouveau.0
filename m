Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D52C4EA71B3
	for <nouveau@archiver.kernel.org>; Mon, 20 Apr 2026 01:10:01 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AB68F10E0AD;
	Mon, 20 Apr 2026 01:10:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="Osnvv86a";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4FA57457EA;
	Mon, 20 Apr 2026 00:57:58 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1776646678;
 b=Yy1afh0jFZSx4TlFgRXzqtU+f3a4pEhGUtzYqI6WXh6Z2TPNETRSoqtcekR3rlDsdpfh9
 zpY5knFigHeHg2QJE2Ipb/kMlPnAVmksYmrRODTiwAXqrV3tGYPpG1J96XcFLkkro5qQGGF
 rtjO3ivQztynNLqYg0d3lY9WRzvP69vBKVtzPqFUJimlTaxvWDAvYuIdoCr7lWa9K6ky+CF
 KPQ0eVbxcQ1rv5AS8xp6zWLDVBlM2soYlP2EDnLHK39jPzBujORvzeMB5A/BRA+n2JZYT/5
 X4v0qSR09JDryHzSixIXiFzdu7L0OScj9UqrhWaNXSM2E391JMjedNMrPebw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1776646678; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=2YIChuj/xzLlQ/FzRUUTT1CABmjJDTZrcYGppYIN00M=;
 b=geZZvA8R+FQ1JhMR54/btdPvFJMbrqnmnLxpyYEDP54HBECbEWzZS2rocGrUd+uyt+bA3
 6pY59W6huNMdav+DZKowcvYLy8ZN8/GfaOJDcleHQt3ju1vehO3rybeezrioO09WElTA7K/
 mOQGWAHo0RWwajnKEwLa+7JLhpQJq21VN9MIrF0MDTEz0DxIL5W8V3g8qBRTwVSt5kgaNe6
 w1a5e20QFOhWODRF+TSAfzn/SnzxpuikoQdJwBNyGMnyR416mxP3PJziSkegF8KT+jcHN+F
 FL0wcEDYl820lGQz/tXHz7K0qJvkEbVCV/QDq/a4cW2C1WSaZJlJpGIVVB0g==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=linux.dev;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=linux.dev policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=linux.dev;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=linux.dev policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 792F143806
	for <nouveau@lists.freedesktop.org>; Mon, 20 Apr 2026 00:57:55 +0000 (UTC)
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com
 [95.215.58.181])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7D5A810E094
	for <nouveau@lists.freedesktop.org>; Mon, 20 Apr 2026 01:09:58 +0000 (UTC)
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776647386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2YIChuj/xzLlQ/FzRUUTT1CABmjJDTZrcYGppYIN00M=;
	b=Osnvv86aI+Uh5BzJC5hmnoa8du5qawpLCVeUsnt1WOt4bC/rdDmh/iwaqs/Jh9o7d7Z/un
	AdlWG14Z8dClDR22HHqXniw02WVikVTXKlGRUH3G0mW9gePH+U/j8GK8QA3unPUAVeEnWq
	BjtktXDH5d1lxOMdDHQAZdzz9WfOzAA=
Date: Mon, 20 Apr 2026 01:09:39 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: sunliming@linux.dev
Message-ID: <ea7bdf986e2c50c52d63de1d76eba3ca8c65ae17@linux.dev>
TLS-Required: No
Subject: Re: [PATCH] drm/nouveau/gsp: Fix possible NULL pointer dereference
 warning in r535_dmac_alloc
To: "Danilo Krummrich" <dakr@kernel.org>
In-Reply-To: <DHW9RZVWDN6Y.2G2RKSJMF5ESB@kernel.org>
References: <20260418071412.86022-1-sunliming@linux.dev>
 <DHW9RZVWDN6Y.2G2RKSJMF5ESB@kernel.org>
X-Migadu-Flow: FLOW_OUT
Message-ID-Hash: BWA7UY7SXDO26FD75QO3HCMX2XK3KE4W
X-Message-ID-Hash: BWA7UY7SXDO26FD75QO3HCMX2XK3KE4W
X-MailFrom: sunliming@linux.dev
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: maarten.lankhorst@linux.intel.com, mripard@kernel.org, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, sunliming <sunliming@kylinos.cn>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BWA7UY7SXDO26FD75QO3HCMX2XK3KE4W/>
Archived-At: 
 <https://lore.freedesktop.org/ea7bdf986e2c50c52d63de1d76eba3ca8c65ae17@linux.dev/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

2026=E5=B9=B44=E6=9C=8818=E6=97=A5 20:12, "Danilo Krummrich" <dakr@kernel=
.org mailto:dakr@kernel.org?to=3D%22Danilo%20Krummrich%22%20%3Cdakr%40ker=
nel.org%3E > =E5=86=99=E5=88=B0:


>=20
>=20On Sat Apr 18, 2026 at 9:14 AM CEST, sunliming wrote:
>=20
>=20>=20
>=20> From: sunliming <sunliming@kylinos.cn>
> >=20
>=20>  Fix below smatch warnings:
> >  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c:178 r535_dmac=
_alloc()
> >  warn: 'args' can also be NULL
> >=20
>=20Please write a commit description that explains also the underlying p=
roblem; see
> more below.
>=20
>=20>=20
>=20> Signed-off-by: sunliming <sunliming@kylinos.cn>
> >  ---
> >  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
>=20>  diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.=
c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
> >  index 6e63df816d85..6dec2623d0be 100644
> >  --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
> >  +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
> >  @@ -172,6 +172,8 @@ r535_dmac_alloc(struct nvkm_disp *disp, u32 ocla=
ss, int inst, u32 put_offset,
> >=20=20
>=20>  args =3D nvkm_gsp_rm_alloc_get(&disp->rm.object, (oclass << 16) | =
inst, oclass,
> >  sizeof(*args), dmac);
> >  + if (!args)
> >  + return -ENOMEM;
> >=20
>=20Are we sure that this can ever return NULL in the first place? I know=
 that
> nvkm_gsp_rm_alloc_get() internally checks for IS_ERR_OR_NULL(), but I c=
ouldn't
> find anything within the callchain that would actually return NULL.
>=20
>=20That said, I think IS_ERR_OR_NULL() checks are misleading.
>=20
I=20also believe that the nvkm_gsp_rm_alloc_get function will not return =
NULL. My patch=20
was=20merely intended to suppress a compiler warning and to guard against=
 possible future=20
changes=20in the implementation of nvkm_gsp_rm_alloc_get. Of course, the =
patch may be=20
unnecessary,=20and I will defer to the maintainers' review conclusion.

Thanks.
> >=20
>=20> if (IS_ERR(args))
> >  return PTR_ERR(args);
> >=20=20
>=20>  --=20
>=20>  2.25.1
> >
>
