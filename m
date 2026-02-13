Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A51EEF99DD
	for <nouveau@archiver.kernel.org>; Fri, 13 Feb 2026 21:49:25 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 55AF810E83D;
	Fri, 13 Feb 2026 21:49:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="bd/vYS/0";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B0FA242DA9;
	Fri, 13 Feb 2026 21:39:44 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771018784;
 b=LBrg5hfEqDDXEwI9hJSr+ZtABDlylS1HFTjaDQcjekU+tCiCjZWaMbEZCy95osgbfYq+D
 y2HA6nU5g+Q66/qqQusJbfeLF+RISXDc6OnI7fWEZLSnvYj8qHU+7F1nzg+/vs1S7BLzuLA
 yWba7i8y7q/KyiHkw8IXmLLF15Bg3GsET1HSdCy/HcKtHj46UozPMVvD/QfcRJCHoZp5jNF
 J/l07ZljZcw7rHmivg8bat8b5TEuMy2nLbT8OrxrMAWn7NWvxUMm10K+iDpLEK7z8Go8kgR
 Xg7YI/ht2GsftdRNhisrYo7MTjjvlJqKJYsWrx6+0p8uwxS3m8H6+cIJPLQQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771018784; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=GyC9E7ts1e/n857OQHO3aAn+NxSA5AMAMHg/+1FV/ts=;
 b=IIa7utkGusY0EcUx6R2nevv/ybXoNjzNz4G/CiMtowwWjZsB0GttP5Tdt4shzadKvv5he
 80Xr328+6EEsSO0XrtkCBF/sUkLR/3FbQM6ZUUHStHgoEgkFdwR1MDSmbPiEo+FTPlmFpYV
 Zzd6TAY1Tw43Erg2gJylTwI7DCkDECQ62XHj6hkhPdUUw7tCEObM5MJtaCJVV8gep9bRdKw
 3bT9Lit3+Ha3d+TLghBZ2D59xpj+vIkHdHbOd4lKQvCME6s6YJusAps4BFkS0bI+MvWrUxq
 6C/O312jtx1FbbRF9ZEK6ZfUJMU74epUjASn3rIpeq1lSIO/uVUjoNAMZNDA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=darkrefraction-com.20230601.gappssmtp.com;
  arc=pass;
  dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=darkrefraction-com.20230601.gappssmtp.com; arc=pass;
 dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 4B4D740686
	for <nouveau@lists.freedesktop.org>; Fri, 13 Feb 2026 21:39:41 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 74E8910E325
	for <nouveau@lists.freedesktop.org>; Fri, 13 Feb 2026 21:49:19 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-b88593aa4dcso155539766b.3
        for <nouveau@lists.freedesktop.org>;
 Fri, 13 Feb 2026 13:49:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771019358; cv=none;
        d=google.com; s=arc-20240605;
        b=c7ETxcmz3guoGksp/kfa6QTM1zaE4siwG7AST4JCpdRCKpEqYA3kq8nhTEkrXelNH/
         hUtoXepRBRai/rjL05EAK4qLx6j4qprLWYUR9jjgDPtIeJDjyuED9Dgj/BSFtSsmUIPD
         abQTr1harVpWBDPYgx05wK6923DB7UmbW8KKt8Wvk8OfbyCJ6WXw4D6oLXxQo7wNW6Jv
         2MszY+BETsl6fZY1Vuz+ioB9JAM3nAKzxkI9X+7tP2prIQQHtXSWhOOC4yjkgN4o1jbL
         I/mil8u6NKZqFSqyg+V1WsTf4ihdnCyssrBbS5ggqisQcffyQ8TgRI3JEdWTK+HG0KOG
         o2Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GyC9E7ts1e/n857OQHO3aAn+NxSA5AMAMHg/+1FV/ts=;
        fh=W1zz1GP86t8D1O/0rigDS1d6ly+5TpcWAfGCXS7z4JI=;
        b=jUlojYLMRcFR1Gt8ZMgIQ09tDha2vcyzZFN2FKIv/D1bFELtjFJZuzucTe/dafWNDk
         QU7ykxWcQH+2+dHsULBrmMgJOHgN6PiCES4yw6xMLRHIlhqAwAcUD5g53pqlPrI9pkZy
         2tqR7ZnSQhw18ZmtN6oezpOgbfURx9HPS5SR8BbGgB70JEpS4audQWsttZVJxHC4wUiM
         dPqyYlr9KTmKXsbGzTABbvhJwFNE0+PSMIxsQLJF5ANgGfhzD2hA1b1jMJ+vJCic7K9i
         ubs7DT1FqSUvOx6qRIiUNf4AWfsGbTvd+wDxQMCrpHKOlFjMfRzqn8Q3EGGTF4hs2ZQ1
         qDPw==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1771019358;
 x=1771624158; darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GyC9E7ts1e/n857OQHO3aAn+NxSA5AMAMHg/+1FV/ts=;
        b=bd/vYS/0AyVOIo2CcaF62Bq1jnDSQfKSTty5AHzQtN8ztNXCMs9bKKox8Uacq549lo
         xRqp9zoCcAQGshP/KIQ/WD4aJqzVdO0MqokgxCCqrpQtevTkIKIUHwpMD/Gz5izXHn88
         vqfSLMfBZtXyO2y5ri4TeeMaWPGCMq6/nRUAi3RLreBnIaxpYxRHgoq5qsfQZS0W4DSa
         0EijMsbZhZF3VxmbQEnU/8oxRvIGvWzBHG0/1yZoRFmAQnKTUZi52YEGPIzmCCHtHgi1
         yVRm3ADiw98df4vBzEEGF/jrUPkBzuDTIsSuNEiKBS6nieLhepLf3bf8xehk8LnPt4Cu
         s3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771019358; x=1771624158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GyC9E7ts1e/n857OQHO3aAn+NxSA5AMAMHg/+1FV/ts=;
        b=iE3fLtXfhoiuBwAZHLHFYATmXFqpnVs8x5C4Z/BOHWGAAuV5CNCBkGXmpq+5jd3DAA
         QgCHKT8PjLqdSDaGwG2Zv2iC8zTBQFefPlZ4SRFYkcHoVwNzPatJID+U3QsJuyi4IfIX
         x1fH+mnqWqMkaVCXsBONBZMBcYkzVkqwHWvvfslytDNlVK7FylmZXIcmPIBAeua3IFYo
         uLccAgiFuMgvx4UvsewR9FFdO7sd0AYiN0X1jwvd10qJlHp092J7FB0jwweGef+mz0ri
         gHU1vBGPjRZhcK5X7mT6kALptlE6UXOYq6CKvZT916pETF4+JmE4H+IHXXEPFgHyRdfb
         mwYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3DUCgRpqcWDY+vQ5DssUsWFZ142WbELwFBHiXyv4WlBOAh03/T/ADyUtXE6XWqJzj25eSwEAL@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4kRxePfmdesbA3SAeqFvhtz2TmMbivt6jG2hVMybme0DwO3Kf
	y9R3pDO0gCviyXs5vX39/hNHmTrxL99W7WSwDyyUFtmDBGSweoHBVs4c6cwaxyxQL+ii6OuKWE6
	5hdh+dvpcYSHu1IKwW3/iP6EBtvlMd7OApAisBv7oLA==
X-Gm-Gg: AZuq6aJKUM55jToEgmPLaKG5IrYj9KX49jrxT4axal/21M25/Z4o30Byl+CYXSf3wYY
	kjW7knHQFH3cggho/FCmzVnaoNN8k8fAB13anHPghbj/g0poCH4hY+ZYe/m/cy/hMEF3REvDwSA
	gzxHKLdAekVy3lGKelLWMeD7PGUWAGl4MAhfydJ1RxrE3EuVt5DNBGYKknUfGCog+PS0pVznzq1
	seRNqA223pdX0xeeeukUYLefruZf9CLGqCqzy+iRDzopvvsB1KR2NIpYLIzbguIh4lVoeRg98Nz
	DxKAefyRVNHWwfo=
X-Received: by 2002:a17:906:6a16:b0:b83:b7c5:de2c with SMTP id
 a640c23a62f3a-b8fb41937e5mr203073966b.10.1771019357548; Fri, 13 Feb 2026
 13:49:17 -0800 (PST)
MIME-Version: 1.0
References: <20260205-zcull3-v2-0-ac572f38cc7b@darkrefraction.com>
 <20260205-zcull3-v2-1-ac572f38cc7b@darkrefraction.com>
 <DGE036OEW8ZK.1PX0DRV8R9EVB@kernel.org>
In-Reply-To: <DGE036OEW8ZK.1PX0DRV8R9EVB@kernel.org>
From: M Henning <mhenning@darkrefraction.com>
Date: Fri, 13 Feb 2026 16:48:51 -0500
X-Gm-Features: AZwV_Qg-n6EvKH2NT0I2bWESDP3lTEHQVgOx9h5-JlkkGBzb6bhJS8FquRFVMEw
Message-ID: 
 <CAAgWFh0zX=u7OZYq3QBrs0ySve897LXb1PN9QFzhYg0gtHy5wQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/nouveau: Fetch zcull info from device
To: Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: CX6VLF3RUAEBVHDXRTRMJ4HDZ43ZRECC
X-Message-ID-Hash: CX6VLF3RUAEBVHDXRTRMJ4HDZ43ZRECC
X-MailFrom: drawoc@darkrefraction.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Mary Guillemard <mary@mary.zone>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/CX6VLF3RUAEBVHDXRTRMJ4HDZ43ZRECC/>
Archived-At: 
 <https://lore.freedesktop.org/CAAgWFh0zX=u7OZYq3QBrs0ySve897LXb1PN9QFzhYg0gtHy5wQ@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, Feb 13, 2026 at 12:12=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> On Thu Feb 5, 2026 at 7:56 PM CET, Mel Henning wrote:
> > This information will be exposed to userspace in the following commit.
> >
> > Signed-off-by: Mel Henning <mhenning@darkrefraction.com>
>
> For someone looking at this commit, this commit message is not very usefu=
l.
>
> Please add at least a brief explanation of what the patch does and - even=
 more
> important - why it does it. See also [1].
>
> [1] https://docs.kernel.org/process/submitting-patches.html#describe-your=
-changes

What I'm struggling with is that I don't know how to do this without
repeating myself. If you want, I can copy-paste my explanation of
zcull here too and then it will appear three times, once in each
commit and once in the cover letter. But that kind of repetition
doesn't seem very helpful to me.

> > ---
> >  drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h   | 19 +++++++++++++
> >  .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c   |  9 ++++--
> >  .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c   | 32 ++++++++++++++=
++++++--
> >  .../drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gr.h  | 19 +++++++++++++
> >  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h    |  2 +-
> >  5 files changed, 75 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h b/drivers=
/gpu/drm/nouveau/include/nvkm/engine/gr.h
> > index a2333cfe6955..490ce410f6cb 100644
> > --- a/drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h
> > +++ b/drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h
> > @@ -3,9 +3,28 @@
> >  #define __NVKM_GR_H__
> >  #include <core/engine.h>
> >
> > +struct nvkm_gr_zcull_info {
> > +     __u32 width_align_pixels;
> > +     __u32 height_align_pixels;
> > +     __u32 pixel_squares_by_aliquots;
> > +     __u32 aliquot_total;
> > +     __u32 zcull_region_byte_multiplier;
> > +     __u32 zcull_region_header_size;
> > +     __u32 zcull_subregion_header_size;
> > +     __u32 subregion_count;
> > +     __u32 subregion_width_align_pixels;
> > +     __u32 subregion_height_align_pixels;
> > +
> > +     __u32 ctxsw_size;
> > +     __u32 ctxsw_align;
> > +};
> > +
> >  struct nvkm_gr {
> >       const struct nvkm_gr_func *func;
> >       struct nvkm_engine engine;
> > +
> > +     struct nvkm_gr_zcull_info zcull_info;
> > +     bool has_zcull_info;
> >  };
> >
> >  u64 nvkm_gr_units(struct nvkm_gr *);
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c b/dri=
vers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
> > index ddb57d5e73d6..73844e1e7294 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
> > @@ -249,7 +249,7 @@ r535_gr_get_ctxbuf_info(struct r535_gr *gr, int i,
> >  }
> >
> >  static int
> > -r535_gr_get_ctxbufs_info(struct r535_gr *gr)
> > +r535_gr_get_ctxbufs_and_zcull_info(struct r535_gr *gr)
>
> Why did you combine those two callbacks? Why not extend struct nvkm_rm_ap=
i_gr
> with another callback?

ctxsw_size and ctxsw_align come from
NV2080_CTRL_CMD_INTERNAL_STATIC_KGR_GET_CONTEXT_BUFFERS_INFO, which is
already called by r570_gr_get_ctxbufs., while the rest of the zcull
info comes from
NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_ZCULL.
If we add another callback then we either need to:

1) Call GET_CONTEXT_BUFFERS_INFO twice, once for each callback. This
is a little slower and more verbose than calling it once.
or
2) fill out zcull_info partially in r570_gr_get_ctxbufs and partially
in the new callback. Since we fill out only some of the info in each
we now need to handle edge cases where one function is called but not
the other as well as them being called in an arbitrary order.

Because of this, I decided that it was simplest to combine them in a
single call, which avoids repeated rpc calls to the gpu without the
complexity of handling partially complete states.

> >  {
> >       NV2080_CTRL_INTERNAL_STATIC_GR_GET_CONTEXT_BUFFERS_INFO_PARAMS *i=
nfo;
> >       struct nvkm_subdev *subdev =3D &gr->base.engine.subdev;
> > @@ -265,6 +265,9 @@ r535_gr_get_ctxbufs_info(struct r535_gr *gr)
> >               r535_gr_get_ctxbuf_info(gr, i, &info->engineContextBuffer=
sInfo[0].engine[i]);
> >
> >       nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, info);
> > +
> > +     gr->base.has_zcull_info =3D false;
> > +
> >       return 0;
> >  }
> >
> > @@ -312,7 +315,7 @@ r535_gr_oneinit(struct nvkm_gr *base)
> >        *
> >        * Also build the information that'll be used to create channel c=
ontexts.
> >        */
> > -     ret =3D rm->api->gr->get_ctxbufs_info(gr);
> > +     ret =3D rm->api->gr->get_ctxbufs_and_zcull_info(gr);
> >       if (ret)
> >               goto done;
> >
> > @@ -352,5 +355,5 @@ r535_gr_dtor(struct nvkm_gr *base)
> >
> >  const struct nvkm_rm_api_gr
> >  r535_gr =3D {
> > -     .get_ctxbufs_info =3D r535_gr_get_ctxbufs_info,
> > +     .get_ctxbufs_and_zcull_info =3D r535_gr_get_ctxbufs_and_zcull_inf=
o,
> >  };
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c b/dri=
vers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c
> > index b6cced9b8aa1..3e7af2ffece9 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c
> > @@ -164,9 +164,10 @@ r570_gr_scrubber_init(struct r535_gr *gr)
> >  }
> >
> >  static int
> > -r570_gr_get_ctxbufs_info(struct r535_gr *gr)
> > +r570_gr_get_ctxbufs_and_zcull_info(struct r535_gr *gr)
> >  {
> >       NV2080_CTRL_INTERNAL_STATIC_GR_GET_CONTEXT_BUFFERS_INFO_PARAMS *i=
nfo;
> > +     NV2080_CTRL_GR_GET_ZCULL_INFO_PARAMS *zcull_info;
> >       struct nvkm_subdev *subdev =3D &gr->base.engine.subdev;
> >       struct nvkm_gsp *gsp =3D subdev->device->gsp;
> >
> > @@ -179,13 +180,40 @@ r570_gr_get_ctxbufs_info(struct r535_gr *gr)
> >       for (int i =3D 0; i < ARRAY_SIZE(info->engineContextBuffersInfo[0=
].engine); i++)
> >               r535_gr_get_ctxbuf_info(gr, i, &info->engineContextBuffer=
sInfo[0].engine[i]);
> >
> > +     NV2080_CTRL_INTERNAL_ENGINE_CONTEXT_BUFFER_INFO zcull =3D info->e=
ngineContextBuffersInfo[0]
> > +             .engine[NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_EN=
GINE_ID_GRAPHICS_ZCULL];
> > +     gr->base.zcull_info.ctxsw_size =3D zcull.size;
> > +     gr->base.zcull_info.ctxsw_align =3D zcull.alignment;
> > +
> >       nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, info);
> > +
> > +     zcull_info =3D nvkm_gsp_rm_ctrl_rd(&gsp->internal.device.subdevic=
e,
> > +                                      NV2080_CTRL_CMD_GR_GET_ZCULL_INF=
O,
> > +                                      sizeof(*zcull_info));
> > +     if (WARN_ON(IS_ERR(zcull_info)))
>
> What justifies this WARN_ON()? To me this seems like normal error handlin=
g, i.e.
> it is not a violation of some API invariant, etc. Also, this is in the dr=
iver's
> probe() path.

I was just copying the error handling that already exists in this function.

I do think these are weird error cases though - they mean that the gpu
was partially but not fully initialized which shouldn't happen during
normal usage. The only cases I can think of that would trigger this
warning are a kernel bug or an intermittent PCI link, which I think
are both reasonable to warn on.

> > +             return PTR_ERR(zcull_info);
> > +
> > +     gr->base.zcull_info.width_align_pixels =3D zcull_info->widthAlign=
Pixels;
> > +     gr->base.zcull_info.height_align_pixels =3D zcull_info->heightAli=
gnPixels;
> > +     gr->base.zcull_info.pixel_squares_by_aliquots =3D zcull_info->pix=
elSquaresByAliquots;
> > +     gr->base.zcull_info.aliquot_total =3D zcull_info->aliquotTotal;
> > +     gr->base.zcull_info.zcull_region_byte_multiplier =3D zcull_info->=
zcullRegionByteMultiplier;
> > +     gr->base.zcull_info.zcull_region_header_size =3D zcull_info->zcul=
lRegionHeaderSize;
> > +     gr->base.zcull_info.zcull_subregion_header_size =3D zcull_info->z=
cullSubregionHeaderSize;
> > +     gr->base.zcull_info.subregion_count =3D zcull_info->subregionCoun=
t;
> > +     gr->base.zcull_info.subregion_width_align_pixels =3D zcull_info->=
subregionWidthAlignPixels;
> > +     gr->base.zcull_info.subregion_height_align_pixels =3D zcull_info-=
>subregionHeightAlignPixels;
> > +
> > +     nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, zcull_info=
);
> > +
> > +     gr->base.has_zcull_info =3D true;
> > +
> >       return 0;
> >  }
