Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32AE0C5DF81
	for <nouveau@archiver.kernel.org>; Tue, 18 Aug 2026 20:09:46 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1ACDC10EC66;
	Tue, 18 Aug 2026 20:09:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TiFRc4Xo";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B096C47908;
	Tue, 18 Aug 2026 19:53:13 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787082793;
 b=j9OtxlGPkH8/VB3SEVna0I161ALH0se8Urjsmc5VFEaRCl+stoiV1ayXGbabbwoS8XXxR
 +Iv4BRj/iwFfoEX4ku5CjXcZmkJInx+ql1TdLnOzbbE5LF43RzfR9dGl7H3m+ylIBnnRFA8
 TGMI1ozbNyg/GxI3trcpVTApi9PJqt8w1V3xD0EPHBIO2Fbu+yXjCTZVgf1hmEPQiP6TI2x
 1Zpf3zzuKUxls3972dYloyu3n6vHYeVDKJVmHkPTGnnGh+2k1+EL0fRTKmk+b66rs1tYBDG
 yESaVdo0drJsCGkGH1gSvgN69oV5QBBKRUvBeZ0h7BugddaziihWd8NJtzJA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787082793; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=jZYskyW08zgMImgX0YFcFXsxVtNqFp2DmI9fJNn8/bM=;
 b=WIkyQOISdx/5adfTADOMdDhWYm5xLPIfDd1HqDUk0f6Ykl+Uii8g6tlE9rDzHBuksPOa2
 7haFfNwuLfJVXmHqMn6yT3r9BHIM+Y2degioyS7+4L8GrC6NLJzWCjhsV16w49RLl8P6rz2
 WpAabNbsq5AFjo0WlAHiG53l0eVLnR8pYPklYmmjryD+eaDCzXvOXxvhdFoOPnjSO20GNuX
 MZGIzsdh03ysYy+N/eGGpIXk+1qfYG5X/FBeO+P6/m4izB7PBsONTdEuHD1hT7wqfyYIs+l
 disZJlYfr+Y5CfzlxOM1XQNVUAd02vyPl/9U+3Qt3zZPmjsb76tMMOp5TACw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 03817478F2
	for <nouveau@lists.freedesktop.org>; Tue, 18 Aug 2026 19:53:11 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 36F7010E4E0
	for <nouveau@lists.freedesktop.org>; Tue, 18 Aug 2026 20:09:42 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-2cee9b74ee1so1706685ad.3
        for <nouveau@lists.freedesktop.org>;
 Tue, 18 Aug 2026 13:09:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787083782; cv=none;
        d=google.com; s=arc-20260327;
        b=EZbohVd6WeKguSwnqacT6eARMe3HoCZT7B+JMO/LqtwqUicIxDLYhSNKmXM+bplWEZ
         BWNUFu5TohXA3e8e7PCoV/u7mCbd+WOX2F/2ZPGzIwXYcCsooANA1weQEMZKCGwG7TCf
         kfxVRmNyAhWHi+M9M6DjhmfVUX6xZxxfp1LFqvjEQGvixYbrxg5/q1mdpzZM83SD4RtZ
         mGrGIQUUBsFNBbEUJREOs5+HPnhhkc3xvIPGG25hYNmWiLzkToeXajG+TaFjWV0LBWtn
         pHKu4m+VMyAHzrGbadrE/aO06jb5JFFD0cqjV6CDkCr0uHnSj3GF5Tgu1kkliH4Kfd9C
         fcjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jZYskyW08zgMImgX0YFcFXsxVtNqFp2DmI9fJNn8/bM=;
        fh=xoO6+oTC5OZLvTooHY4IA3zDhA8YZP30G6b+n610WjE=;
        b=LOZqXG60O5xAzTk5SCDKZTssTrQgiBaEj5so3psEVGJB1odwwH/nL+8XNROHCciVt+
         BVLBs0iXl1flKw1VixjvdplnNxT0l0+3LactrD/gHbLxpu2sFJ/wvDGyNqFCAFTUNLWN
         GOBs2+7JDajGnZf0BEXRFvmwV5WVbXJ/taOrW/jEq/EHkuVTna+h1xjAWiJJ86uoK4H6
         hmzKUZRVDmCMvCDCnO6+vqOdlryEH+R5OvOheUqbPkziVpiyxpSnXNv5xEZGZBTWJO7Q
         a9iKBReM0Yl1QtArNbP4VmOcTByGWIiSjaOuYqAoCo6ljy4hJTAjhCNDIjPXeIY0tfL8
         rwIg==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787083782; x=1787688582;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jZYskyW08zgMImgX0YFcFXsxVtNqFp2DmI9fJNn8/bM=;
        b=TiFRc4XobPJsuHx+Dx/yoR0QCN53Tv9jXqvQ3x1jalZW4edRoycvyDfEbvdP/bwcIu
         wA6TOl/OuVOLRuxOtWpmTnYL3EIhlAscH301ResNNwUE/LHteP963E1AINUyZrCDwb3j
         A+QMm6rYhtB3aN5qamxYJL6XiJPmQicWKBaRlmDdzDk+W1zhjV6ziYF3oEEdLCwf6/7+
         VS/kFlQX6Qn6EowECS+gp2zlG34jOQmfyROul7GPzDHOCTBmXib7YtjFQeRoatTlu05p
         RLmjgHG7VAEn08Hju6SktTa5yS4z1sOMNz2qUnwcP/8jR+G2P+6ZmChpu2i86joXrsGi
         DQ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787083782; x=1787688582;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jZYskyW08zgMImgX0YFcFXsxVtNqFp2DmI9fJNn8/bM=;
        b=GhJ6pIkCP0q6JEA+lCD+Sw7Y5/MhMGwf11U69sq0e76kFcg7vUZb5P16mYl5XuGcbR
         DFdU/PvvvwmsMNePUJKomvlZ1Lbyxrne2t1wRUP5bjS5DAeWA21d7JPQAPrq0POKokvF
         74qn9Fg5C1OVgXm7h141B7KGf3sOOUGsDQ4Z0fCIoUTkYRHLUUOvQPfOYPuRODTFYGL8
         yw0jSgV/vhZLJqmMYHyWFkNAraFWSJInPiGguwNptw3rwFtqYL/8aZ8lpwOZf3cFfggd
         ZIDdy5Ni/3rrl5NVhRloiN7Nb5YNFJjKTguPEVofhiK/cL1nIdWIKrYqYrfvSluvw6/K
         TcNw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq1q7oxe/P3K6nL8T1AtlR6DN7eHHtoogCFc0EGNF1BxU0AcHfFVag/Wdo4PrbM4iK7XzO3lhIQ@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEwzaFse/YGfEHNyVuKQzBKksOwQbkO+MZRs2DUejE2GIdYmvx
	+4i/I+QFMyJw+gHM7UqUfJY0y3gvZQFvTIc20JilGXYWKnF9ua7+SptexWuZMSUyfDDqj9RDgh2
	MpjKEhq2mtAL64qayyHU3/qEfuI1taLU=
X-Gm-Gg: AR+sD11/H94NKxDa51HkELJevRSt3K2BgGXJRGF4hYkekOHWLLEJ0sraEiH1VU5sAxf
	VZ6QNRGmU0D9BAALL40lE7B93orpbD5/firjQV0bgV7rUr/Ewu6VQjBhUGGMp7xFKNTLmmexCWZ
	1hwsYm3Cm9kMyXYj3cQZYYxJGLZQdNb9ZPLQNPnmbkRfYHqZcIda0BU658TsTsOwk1gJS51ylLF
	bQVYLNnosfM5s0QZ9lR1q6ViOGYDAUcuhTC7Btz/tQRY1T9qj/cNPs6rzQbkvIRQKHg3DEttVCI
	3buapesN3koaATTAKUy0AmCDpbDNDlGTDGRmDSr9T4y4ELjoYfiP6g==
X-Received: by 2002:a17:90b:4490:b0:393:288:29e3 with SMTP id
 98e67ed59e1d1-3957b2527c3mr403834a91.10.1787083781624; Tue, 18 Aug 2026
 13:09:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260814235705.59132-1-mohamedahmedegypt2001@gmail.com>
 <20260814235705.59132-6-mohamedahmedegypt2001@gmail.com>
 <996d2033b1522090867e50f181e9b4daaab19861.camel@redhat.com>
 <CAA+WOBvj2Q3-P9F5JgA4S+C0E46Zkyt6bLcVzWhfvaWWmTH7Vg@mail.gmail.com>
 <6a9619f71c1f033044ba01c6ff6ba78af4a0aff1.camel@redhat.com>
In-Reply-To: <6a9619f71c1f033044ba01c6ff6ba78af4a0aff1.camel@redhat.com>
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Date: Wed, 19 Aug 2026 00:09:29 +0400
X-Gm-Features: AcwNN1W_auS0i7vhE5u1Af6pg4eCo3cKJPP2Rl5vF5JZ1RJWuxPIS13GyvwK7hI
Message-ID: 
 <CAA+WOBtbC176yVMZ1OZHQANNdNhHuGVtNMdiDLeSvHKmsD3L-A@mail.gmail.com>
Subject: Re: [PATCH 5/7] nouveau/gsp: fix vblank interrupts on GB20x
To: lyude@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: RXAMEHVXRUBI263FXCJKE2XUM6U7Y55O
X-Message-ID-Hash: RXAMEHVXRUBI263FXCJKE2XUM6U7Y55O
X-MailFrom: mohamedahmedegypt2001@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Mary Guillemard <mary@mary.zone>, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/RXAMEHVXRUBI263FXCJKE2XUM6U7Y55O/>
Archived-At: 
 <https://lore.freedesktop.org/CAA+WOBtbC176yVMZ1OZHQANNdNhHuGVtNMdiDLeSvHKmsD3L-A@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Aug 19, 2026 at 12:06=E2=80=AFAM <lyude@redhat.com> wrote:
>
> On Wed, 2026-08-19 at 00:02 +0400, Mohamed Ahmed wrote:
> > On Tue, Aug 18, 2026 at 2:59=E2=80=AFAM <lyude@redhat.com> wrote:
> > >
> > > On Sat, 2026-08-15 at 03:57 +0400, Mohamed Ahmed wrote:
> > > >
> > > > +
> > > > +static const struct nvkm_head_func
> > > > +gb202_head =3D {
> > > > +     .state =3D r535_head_state,
> > > > +     .vblank_get =3D gb202_head_vblank_get,
> > > > +     .vblank_put =3D gb202_head_vblank_put,
> > > > +};
> > > > +
> > >
> > > You should probably add these two as well:
> > >
> > >         .state =3D gv100_head_state,
> > >         .rgpos =3D gv100_head_rgpos,
> > >
> > > I don't think they've actually changed in blackwell, but it's
> > > possible
> > > maybe they do change in GB200x so you probably want to double check
> > > so
> > > we don't lose precise vblank timestamps again.
> > >
> > The head state changed actually (but RG position didn't), so adding
> > this in would be a regression. I have some work to wire it up
> > properly
> > (part of VRR bringup) but I wasn't sure whether to include it in this
> > series or not. We don't have precise vblank timestamps for anything
> > GSP atm and everything falls back to the interrupt path, so it would
> > technically be a new feature rather than fix ups.
>
> Actually we definitely do now! We didn't used to for ages, but I wrote
> a patch that got upstreamed for it a few weeks ago, you can see it
> here:
>
> static const struct nvkm_head_func
> r535_head =3D {
>         .state =3D gv100_head_state,
>         .rgpos =3D gv100_head_rgpos,
>         .vblank_get =3D r535_head_vblank_get,
>         .vblank_put =3D r535_head_vblank_put,
> };
>
> If the patch for adding this to blackwell is already ready I wouldn't
> mind taking it as part of this series, but that's up to you
>
Ohh woops, sorry. I missed that. Yes, I'll rebase on top of the latest
then and re-test.
> > > >  static struct nvkm_conn *
> > > >  r535_conn_new(struct nvkm_disp *disp, u32 id)
> > > >  {
> > > > @@ -1496,6 +1523,20 @@ r535_disp_intr(struct nvkm_inth *inth)
> > > >       return IRQ_HANDLED;
> > > >  }
> > > >
> > > > +static irqreturn_t
> > > > +gb202_disp_intr(struct nvkm_inth *inth)
> > > > +{
> > > > +     struct nvkm_disp *disp =3D container_of(inth, typeof(*disp),
> > > > engine.subdev.inth);
> > > > +     irqreturn_t ret =3D r535_disp_intr(inth);
> > > > +
> > > > +     /* The FE interrupt vectors are message-based on NVD5.0.
> > > > Re-
> > > > arm the
> > > > +      * low-latency vector so it fires again for any event that
> > > > latched
> > > > +      * while we were servicing.
> > > > +      */
> > > > +     nvkm_wr32(disp->engine.subdev.device, 0x611f34,
> > > > 0x00000001);
> > > > +     return ret;
> > > > +}
> > > > +
> > > >  static void
> > > >  r535_disp_fini(struct nvkm_disp *disp, bool suspend)
> > > >  {
> > > > @@ -1568,7 +1609,9 @@ r535_disp_oneinit(struct nvkm_disp *disp)
> > > >       struct nvkm_device *device =3D disp->engine.subdev.device;
> > > >       struct nvkm_gsp *gsp =3D device->gsp;
> > > >       const struct nvkm_rm_api *rmapi =3D gsp->rm->api;
> > > > +     const struct nvkm_rm_gpu *gpu =3D gsp->rm->gpu;
> > > >       NV2080_CTRL_INTERNAL_DISPLAY_WRITE_INST_MEM_PARAMS *ctrl;
> > > > +     nvkm_inth_func intr_func;
> > > >       unsigned long mask;
> > > >       int ret, i;
> > > >
> > > > @@ -1722,7 +1765,12 @@ r535_disp_oneinit(struct nvkm_disp *disp)
> > > >               nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
> > > >
> > > >               for_each_set_bit(i, &disp->head.mask, disp-
> > > > >head.nr)
> > > > {
> > > > -                     ret =3D nvkm_head_new_(&r535_head, disp, i);
> > > > +                     const struct nvkm_head_func *func =3D
> > > > &r535_head;
> > > > +
> > > > +                     if (gpu->disp.class.root >=3D GB202_DISP)
> > > > +                             func =3D &gb202_head;
> > > > +
> > > > +                     ret =3D nvkm_head_new_(func, disp, i);
> > > >                       if (ret)
> > > >                               return ret;
> > > >               }
> > > > @@ -1766,12 +1814,21 @@ r535_disp_oneinit(struct nvkm_disp *disp)
> > > >       if (ret)
> > > >               return ret;
> > > >
> > > > -     ret =3D nvkm_gsp_intr_stall(gsp, disp->engine.subdev.type,
> > > > disp->engine.subdev.inst);
> > > > +     if (gpu->disp.class.root >=3D GB202_DISP) {
> > > > +             /* GB20x deliver head-timing interrupts on the
> > > > display's
> > > > +              * separate low-latency vector (interrupt table
> > > > instance 1).
> > > > +              */
> > > > +             ret =3D nvkm_gsp_intr_stall(gsp, disp-
> > > > > engine.subdev.type, 1);
> > > > +             intr_func =3D gb202_disp_intr;
> > > > +     } else {
> > > > +             ret =3D nvkm_gsp_intr_stall(gsp, disp-
> > > > > engine.subdev.type, disp->engine.subdev.inst);
> > > > +             intr_func =3D r535_disp_intr;
> > > > +     }
> > > >       if (ret < 0)
> > > >               return ret;
> > > >
> > > >       ret =3D nvkm_inth_add(&device->vfn->intr, ret,
> > > > NVKM_INTR_PRIO_NORMAL, &disp->engine.subdev,
> > > > -                         r535_disp_intr, &disp-
> > > > > engine.subdev.inth);
> > > > +                         intr_func, &disp->engine.subdev.inth);
> > > >       if (ret)
> > > >               return ret;
> > > >
> > > > diff --git
> > > > a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
> > > > b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
> > > > index 996941c668ba..2590b22663cb 100644
> > > > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
> > > > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
> > > > @@ -44,6 +44,14 @@ r570_gsp_xlat_mc_engine_idx(u32 mc_engine_idx,
> > > > enum nvkm_subdev_type *ptype, int
> > > >               *ptype =3D NVKM_ENGINE_DISP;
> > > >               *pinst =3D 0;
> > > >               return true;
> > > > +     case MC_ENGINE_IDX_DISP_LOW:
> > > > +             /* GB20x+ report a separate low-latency display
> > > > vector, used
> > > > +              * for head-timing interrupts. Expose it as a
> > > > second
> > > > DISP
> > > > +              * interrupt instance.
> > > > +              */
> > > > +             *ptype =3D NVKM_ENGINE_DISP;
> > > > +             *pinst =3D 1;
> > > > +             return true;
> > > >       case MC_ENGINE_IDX_CE0 ... MC_ENGINE_IDX_CE19:
> > > >               *ptype =3D NVKM_ENGINE_CE;
> > > >               *pinst =3D mc_engine_idx - MC_ENGINE_IDX_CE0;
> > >
>
