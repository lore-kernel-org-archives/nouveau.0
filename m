Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D38C7C5DF81
	for <nouveau@archiver.kernel.org>; Tue, 18 Aug 2026 20:02:22 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2803010E4E0;
	Tue, 18 Aug 2026 20:02:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LoxO+cUA";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C20B2478FE;
	Tue, 18 Aug 2026 19:45:50 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787082350;
 b=UtxitxCFA33Fjy0AnPZtme0zrCDnIfYS7AWMbsY/xZ24VLQIE7Op4+ajLVcHbjcSmbop3
 F30voF0oPbmtBUj2b5vEhzmIAnMRJjRqWRO3VL+gbOQ31njaj/TMwu5oX1OZls6xJLPQLfm
 v8Fqz10NJ0DTc/32YYn3D8cI1DrD8Y2k0Z8Pv8RPzOXquXS0/Fet7/K4nMDZz54ZYMFtZDu
 VLr2hgLI6ST35uhF35VBksIL0JtTs54di+7FdfdIBCDiw3fX12mZ8+3svDOBT48qDemSYUD
 qoBHK+uPs07mPdMGR3v+oATpDXrDqsaVkja0Y1Pn8+5OOY9mZHVAO2BSuQoQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787082350; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=bALn7f+Zopw3SX8ojVaX++nOpa4KFELG4NTJqBbG5+c=;
 b=ZWCohCFg3VY0nUazcubY8tBPxebTGs9z9R+DAfBuxCKUyigjnJ5mxegLxQSWdYib56Ltp
 r2sUr/aoZh50t9CRiKXCJQPinXRTcZr/yXCVSGP47Jv7EYOpg0J9QXPLcPO4cZxYhSKTQmz
 jGG68y97XngTPQ/zmRc2Pn4542duJ9TIaYza91QaVSz3S1xubWi3Mc2BJmnMn9HSZwLUAve
 h7LDGd41HdnlRsAYNOoaUFGl/XzwjO8koaS8bvKwTWSjGneTzUrokREPxO9YmETP3lUJz58
 WgK37x0gRMPFNmsbcHgTRKD+/GKmwXgX2LefH1jMCQ0LEhUy1pI2g1d6rrHg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id DB52D478F2
	for <nouveau@lists.freedesktop.org>; Tue, 18 Aug 2026 19:45:47 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0245E10E05E
	for <nouveau@lists.freedesktop.org>; Tue, 18 Aug 2026 20:02:18 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-cc11a30a259so168075a12.3
        for <nouveau@lists.freedesktop.org>;
 Tue, 18 Aug 2026 13:02:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787083338; cv=none;
        d=google.com; s=arc-20260327;
        b=V0FAIXiBYacATvErcmtwRexTwFdsjVmoxbINqwdl0a28csUo8WCfrKnqFuD1N5g8zI
         U5V20rLcfZUfPPMC50FsaEHNnGl2wQXtuhwY6fIbcAInsDAFPWvP3hKC9a8jqDkV1gcs
         LeOYyiwZPmVkks1WM+jeh/dJ17iPcxFuGKgADA+4ZhcKBEnPhVa70tFAcQUCGGSEW5up
         VUurIM38Ga4cJWC27XzwxOU+zZU06bNId7X9Z/i9LUJsWgcATnTbh0vv1uhDLcyIbWSc
         9xidqM871m3wqF4RyN89lM4k1nkxePo85AJ+IDQGvyIDYGUGrainppngnIkzYI7o4V58
         MGcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bALn7f+Zopw3SX8ojVaX++nOpa4KFELG4NTJqBbG5+c=;
        fh=cyRbq9uWgE4/3HuBzZRolAObQqybztB7XMLXRX8b1+I=;
        b=V63K5WoM6dTa273hAXeYpjpIzRpUkpU05EjGz5UypPFyw3ncPsEE01IHjbvWkDzgcR
         sN5SrspBxzb15QrHEhjMaLozf2NDhBgKiLlg8XHAotAN72KxvfOhXUj4JH3acUj4hTXB
         Ciu37GavnFUbpxH8/pv1530kP+A+HetrGHonKESpx1JP6tU/YivwZCDall0JFMWB/ksT
         PTZHVLaylXv4LGOmJcAoVd1o9mWwVHDnssk9ysKplydV5KBko0w6WsDfF1YVse99EbKz
         e6yWZajmonDg4RXDJXpZKXi59cUr3MHrrGQd+TgROitonTbaD5wTjmlxgQGUrM3n5oco
         2rSg==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787083338; x=1787688138;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bALn7f+Zopw3SX8ojVaX++nOpa4KFELG4NTJqBbG5+c=;
        b=LoxO+cUA6iByrlyrrZe8l2oszKIObwvyaxf7sA93rVrqJrKwYE5NA82Lqdw/UyVBAD
         HLnKuCH9qJ/Keag1eyXUMs1hzt2xDAYgUV59/a9Azlo5ed2nyYgpg/yl0KDlDRPkcLpL
         3VEeimp+PGy1yLetWmxtgNu7TmUkdcQu7dY2Z5a8qgIIaSUYuBT1EqYWXKhTMz9HaTKG
         LA+kTA1JOKeQTiyrSy87qCa5tg1xQ4JpJkVTKNsfEx6KHGyyqDppCDVHEHuUUWgrq8Iy
         o8LrIKfg84ugA8EIj2YcEyCD9gdZN3IebTQNNda5RiZgPutidTwc6fTRLZ3Jbyr9wXx6
         nppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787083338; x=1787688138;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bALn7f+Zopw3SX8ojVaX++nOpa4KFELG4NTJqBbG5+c=;
        b=Eqjsdy1hHbatP5VYyIWXcp+CyhX9F0H7ydLvmlbqLGn/sz2EPNsCoy/yi6b7KD2EZ/
         ul9ja874ACYsRcBdORyap6r5msIjYMmu7AeSPOqdyYMHVh+b1FjfiFu8Maw9M7+A4rdx
         jARFSBArKHjMODIh2MjErV+2z36SnExFvUIuZMUUZyxr2sHosUXu8VOzsx8KMeLOfsh/
         WDPcgFwQ4aX2yBBg1eCz0VMrAJJAp33TI6AAEC7dFsSB+JGeo/Hqu3quO5Bh9VcsAKbr
         0d9ryrk+eBOmU3bG8+qMJcQlIpphvoFYQI5x6Dv9KNP0+mC6x4579vgegZfrYeT7oXrN
         bovA==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro1+4rQYl9i4rGJZDvSC6/KKFeNyasngXWR8SV0p3dG3Y98h/E8J9I/iCZ306OYBcajS6MPt4G+@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYj8BgjF1Zjuhv5MxmCsSjE1BE2NLiu645fWVD9I5Yqmlt8kwX
	m3W2rfweUQyVFHemte+ci0EdAFpmaBq59FGvO1MoKkDAfrffc6D5MLXyB9I6nUR5Ymw9f+z599R
	J9npPVkqdEDMbwjej4IsRSLahNxNe1Fc=
X-Gm-Gg: AR+sD11ifCntNIIf85Cr/8A/TQ9qIae4kUQdDPtlkPne8zxYrmtMWHSOSRbdP8WZfdG
	K/AXUVybRM0XKeVjJjfvSvCcNtP4LKtEXQN432OEPpC04ncI07MIXnPZze7L/dWVxGKok8LMjTG
	bTa6H2zb0v+RAWYb/JBvj07LY1UmhCpEYFSG3ViqO/udXJenE3eu1HaV1k0OX8aPzvJBzXM1gCw
	5UlB7OY5tnYMWiah0WJXcy1eLNZpqkpBQp+Xbh4UetypZj/pCKKaH57sg+7tM8zOdbLcr7wUm4j
	NaTFE0dfuyUPRd/kA7s9AutAUNLHgaSnxXDMjMkcCnyxV4I4++tneu0=
X-Received: by 2002:a05:6a21:7a9b:b0:3c3:791e:5e0c with SMTP id
 adf61e73a8af0-3ccff09f2damr481284637.19.1787083338276; Tue, 18 Aug 2026
 13:02:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260814235705.59132-1-mohamedahmedegypt2001@gmail.com>
 <20260814235705.59132-6-mohamedahmedegypt2001@gmail.com>
 <996d2033b1522090867e50f181e9b4daaab19861.camel@redhat.com>
In-Reply-To: <996d2033b1522090867e50f181e9b4daaab19861.camel@redhat.com>
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Date: Wed, 19 Aug 2026 00:02:06 +0400
X-Gm-Features: AcwNN1VxU2BifjzzAG5-T_Vb2L4L4_OCcG96ymxk6orVp3OjMs6asBXgKb_Hs-k
Message-ID: 
 <CAA+WOBvj2Q3-P9F5JgA4S+C0E46Zkyt6bLcVzWhfvaWWmTH7Vg@mail.gmail.com>
Subject: Re: [PATCH 5/7] nouveau/gsp: fix vblank interrupts on GB20x
To: lyude@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: GRASQBH75M3G5NZULGWZ66UJBDCUFF27
X-Message-ID-Hash: GRASQBH75M3G5NZULGWZ66UJBDCUFF27
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GRASQBH75M3G5NZULGWZ66UJBDCUFF27/>
Archived-At: 
 <https://lore.freedesktop.org/CAA+WOBvj2Q3-P9F5JgA4S+C0E46Zkyt6bLcVzWhfvaWWmTH7Vg@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, Aug 18, 2026 at 2:59=E2=80=AFAM <lyude@redhat.com> wrote:
>
> On Sat, 2026-08-15 at 03:57 +0400, Mohamed Ahmed wrote:
> >
> > +
> > +static const struct nvkm_head_func
> > +gb202_head =3D {
> > +     .state =3D r535_head_state,
> > +     .vblank_get =3D gb202_head_vblank_get,
> > +     .vblank_put =3D gb202_head_vblank_put,
> > +};
> > +
>
> You should probably add these two as well:
>
>         .state =3D gv100_head_state,
>         .rgpos =3D gv100_head_rgpos,
>
> I don't think they've actually changed in blackwell, but it's possible
> maybe they do change in GB200x so you probably want to double check so
> we don't lose precise vblank timestamps again.
>
The head state changed actually (but RG position didn't), so adding
this in would be a regression. I have some work to wire it up properly
(part of VRR bringup) but I wasn't sure whether to include it in this
series or not. We don't have precise vblank timestamps for anything
GSP atm and everything falls back to the interrupt path, so it would
technically be a new feature rather than fix ups.
> >  static struct nvkm_conn *
> >  r535_conn_new(struct nvkm_disp *disp, u32 id)
> >  {
> > @@ -1496,6 +1523,20 @@ r535_disp_intr(struct nvkm_inth *inth)
> >       return IRQ_HANDLED;
> >  }
> >
> > +static irqreturn_t
> > +gb202_disp_intr(struct nvkm_inth *inth)
> > +{
> > +     struct nvkm_disp *disp =3D container_of(inth, typeof(*disp),
> > engine.subdev.inth);
> > +     irqreturn_t ret =3D r535_disp_intr(inth);
> > +
> > +     /* The FE interrupt vectors are message-based on NVD5.0. Re-
> > arm the
> > +      * low-latency vector so it fires again for any event that
> > latched
> > +      * while we were servicing.
> > +      */
> > +     nvkm_wr32(disp->engine.subdev.device, 0x611f34, 0x00000001);
> > +     return ret;
> > +}
> > +
> >  static void
> >  r535_disp_fini(struct nvkm_disp *disp, bool suspend)
> >  {
> > @@ -1568,7 +1609,9 @@ r535_disp_oneinit(struct nvkm_disp *disp)
> >       struct nvkm_device *device =3D disp->engine.subdev.device;
> >       struct nvkm_gsp *gsp =3D device->gsp;
> >       const struct nvkm_rm_api *rmapi =3D gsp->rm->api;
> > +     const struct nvkm_rm_gpu *gpu =3D gsp->rm->gpu;
> >       NV2080_CTRL_INTERNAL_DISPLAY_WRITE_INST_MEM_PARAMS *ctrl;
> > +     nvkm_inth_func intr_func;
> >       unsigned long mask;
> >       int ret, i;
> >
> > @@ -1722,7 +1765,12 @@ r535_disp_oneinit(struct nvkm_disp *disp)
> >               nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
> >
> >               for_each_set_bit(i, &disp->head.mask, disp->head.nr)
> > {
> > -                     ret =3D nvkm_head_new_(&r535_head, disp, i);
> > +                     const struct nvkm_head_func *func =3D
> > &r535_head;
> > +
> > +                     if (gpu->disp.class.root >=3D GB202_DISP)
> > +                             func =3D &gb202_head;
> > +
> > +                     ret =3D nvkm_head_new_(func, disp, i);
> >                       if (ret)
> >                               return ret;
> >               }
> > @@ -1766,12 +1814,21 @@ r535_disp_oneinit(struct nvkm_disp *disp)
> >       if (ret)
> >               return ret;
> >
> > -     ret =3D nvkm_gsp_intr_stall(gsp, disp->engine.subdev.type,
> > disp->engine.subdev.inst);
> > +     if (gpu->disp.class.root >=3D GB202_DISP) {
> > +             /* GB20x deliver head-timing interrupts on the
> > display's
> > +              * separate low-latency vector (interrupt table
> > instance 1).
> > +              */
> > +             ret =3D nvkm_gsp_intr_stall(gsp, disp-
> > >engine.subdev.type, 1);
> > +             intr_func =3D gb202_disp_intr;
> > +     } else {
> > +             ret =3D nvkm_gsp_intr_stall(gsp, disp-
> > >engine.subdev.type, disp->engine.subdev.inst);
> > +             intr_func =3D r535_disp_intr;
> > +     }
> >       if (ret < 0)
> >               return ret;
> >
> >       ret =3D nvkm_inth_add(&device->vfn->intr, ret,
> > NVKM_INTR_PRIO_NORMAL, &disp->engine.subdev,
> > -                         r535_disp_intr, &disp-
> > >engine.subdev.inth);
> > +                         intr_func, &disp->engine.subdev.inth);
> >       if (ret)
> >               return ret;
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
> > b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
> > index 996941c668ba..2590b22663cb 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
> > @@ -44,6 +44,14 @@ r570_gsp_xlat_mc_engine_idx(u32 mc_engine_idx,
> > enum nvkm_subdev_type *ptype, int
> >               *ptype =3D NVKM_ENGINE_DISP;
> >               *pinst =3D 0;
> >               return true;
> > +     case MC_ENGINE_IDX_DISP_LOW:
> > +             /* GB20x+ report a separate low-latency display
> > vector, used
> > +              * for head-timing interrupts. Expose it as a second
> > DISP
> > +              * interrupt instance.
> > +              */
> > +             *ptype =3D NVKM_ENGINE_DISP;
> > +             *pinst =3D 1;
> > +             return true;
> >       case MC_ENGINE_IDX_CE0 ... MC_ENGINE_IDX_CE19:
> >               *ptype =3D NVKM_ENGINE_CE;
> >               *pinst =3D mc_engine_idx - MC_ENGINE_IDX_CE0;
>
