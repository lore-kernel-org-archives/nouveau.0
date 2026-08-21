Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C420DC5DF94
	for <nouveau@archiver.kernel.org>; Fri, 21 Aug 2026 22:36:25 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 49E1E10F3E6;
	Fri, 21 Aug 2026 22:36:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="rM/wJVSJ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id EE1FE47B0C;
	Fri, 21 Aug 2026 22:19:45 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787350785;
 b=q7thqZUh3ergp1HEluDSzHsL+2x0DQMJWGZHQgDPZAgQ6AZ7llF4oDHtX03NzejIF7AmX
 5WzYlFPgKSCiE4w2aGraL6WJXj9bSghGPOAkpYln9mVjh056sOciphW1or5LQ8mpIrtGled
 oS4c/uQeJLMzla3rW6klst0UoeabFj93wwK+fOBiYh+sfNI4WbFIZRTpxfKej0nCdPamIiD
 MaKw+PqI8xGTuKVvNRMgNnp6Qz0acKTyLxXkIRihyroWbQXDvjiR7yrtUxW9Xu5owPat2/z
 xIB3xtSfeEdcU/b5FDuzCSqPqBW6G0uabWFGp8+0D75CePEUo8lVbnJXcUdQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787350785; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=jaWf+hmaqddnDUOtsPaTRUJjDHClz1pfmQFe8O2ji+4=;
 b=bpHQvp1fxgAN4+4wdC5WO2uzUcjs/78zsSH4ZZLocusYIunzgwZ0EsCdKdLuPsn3vV+7d
 3kPa9Kd78xtgB3Da8w6omOLFCWrDz+2ieHOENJ5vgdt6KKrNlnWtCQJBgEGjHQU4DXrQnKc
 mlahmLrq2pGZbCtPELX0wriR2MKTMzLAiXmZ7H+fijCiqvauvYxPjDxsFrBra/xrcFLlMsb
 b8Qsri8tyYKMJfIc+GNpnvSoobZljD4yLdPeYtzGE/trq8bR5cTn8MJn1thyly13raSY46C
 9JNMCfhI2AF5PosQvtg79ID+8seKIzlnjlcjGUblSWa2j7VkKinH/d4oTrxg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id B5A1E47AFC
	for <nouveau@lists.freedesktop.org>; Fri, 21 Aug 2026 22:19:42 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BF77610F3E0
	for <nouveau@lists.freedesktop.org>; Fri, 21 Aug 2026 22:36:20 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-84f3ab8750cso1113058b3a.0
        for <nouveau@lists.freedesktop.org>;
 Fri, 21 Aug 2026 15:36:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787351780; cv=none;
        d=google.com; s=arc-20260327;
        b=BIl8wtDplk8zYBiG2pKGclweCd7A/aMN8rf+YRj4WWGuaRbNQXaZDFn4V4OfXOxy3E
         67zVEW+DQT6O/l51z4f4yJ2ENQ61vssEu1MAZXRdut6foEucZgwFkOFJ+4BABG0KGt4i
         3CQxEVx7Vodjz9AGvFCRwbUMo+32Pkif+jVOwRPn78IsUp8CcT2KD2aayuQR0pTdsx/g
         5spXWmGMWuZUO4GYbDKRPXplwV45B/jwdCS0SlWNu29QcOPx+L6hCWucANwR1vFK1Y7+
         iz+ELsdhsYsq0QzWqpq0B/r47ljZmOgAynccyxECgp2JAMShlos5rCvIwmZTYevYkztN
         loCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jaWf+hmaqddnDUOtsPaTRUJjDHClz1pfmQFe8O2ji+4=;
        fh=5ci8zirCXfX9zAtnOfqTdn+lEqCOl53CB1f4azr3ChU=;
        b=r8ooSum0bvQXgRnZHFoPx96/x66rsJBCp7F+5h7NRHhu02A522Ad3vAOX9iejvL54U
         bxOsYvwv6XTGyY3JuH0MnYb8dR2kj0hzHhJycSZ72ipvx3b0x4CXshEC9tCgsrN38k5P
         /3j9e6DMDKppi6x1BYp7H+txiXjv2twQ3+nzuI6lgB6N95LzSQYCDHvkqnCjUksvrM4G
         ueSqXDVIj0Usl07QkD5ZG1t+9hVVgVfnxrq1DhnqRAq34rl1HGYhMdhQwJ3AjUDa9iSq
         4DNusnh1XByFlXqSt2pEI+h8549juYbx1hIBEfke8vfPpkMP58OinK0mng8m1qXkoM/Y
         4cIQ==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787351780; x=1787956580;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jaWf+hmaqddnDUOtsPaTRUJjDHClz1pfmQFe8O2ji+4=;
        b=rM/wJVSJmRYisR8xrOeuuMeVKgxSLeOWAc8LpgaeLkq2Y30kyxl61EJgeIzdGwUOJx
         Vto7/egh5bJnsxk5YzmyMsFA79b3VYSztJsbW5MB+xHMn+mPKrSMYA7pHz5LEUTZHjaI
         oet5366O4XZM1YLZsP5RRH0gizJyBgn20BOvTS5BgsFm4frjjEFzKCaxm+JUrCOzq9Hl
         8snSF0d8Wtf8qUSQVsxYujaO3MDKEGe8KaV/5noQ9KHJ+0T3w7GpOXrH4XVWCFf2xYsV
         s1T/oJLruGqL5uzQJMTM7zD/F5iW3YYubZIup3a1CBRWGIAUvP+HAM3nAkU4almHfkNr
         HDmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787351780; x=1787956580;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jaWf+hmaqddnDUOtsPaTRUJjDHClz1pfmQFe8O2ji+4=;
        b=XSU3afVukb/5hpCv/rZL929H5/JdS0KjT3EnYoQekh9Deo6vgWWW2iRwz+lVmzkdu/
         zqDfna7hAybdNrVjm94uOgM311zZqRw7EqycAgEYwe7yr0Xx+huglaLzvdp5M10u+QQc
         3MvvcK7FZ1etUw5YdjRiWp6YS6sE54NAHCIqQCI81DRPzLrBXkYlAw+YLkeoFVbK06zX
         QLkX/8pBPpydKGyclIKOpGjDZz63ucSLYckjriEReWCMxPQFbnzLlZ+A0208Fg4DdNmK
         KIGdc74BIKoeR02cWIf5Df/j4iLFhZ7+vtgTvsnmV2Be2j77GV6T7W6JLm7hewifHRz6
         hdog==
X-Forwarded-Encrypted: i=1;
 AHgh+RoHS7JGx/YSQvkdFLUXnd1oDG0mYCVoH04KrtFXNBDORTjNBaeFAhqEjpSbgoO2vTKjVPIYa9rd@lists.freedesktop.org
X-Gm-Message-State: AFuF++lQ8jFz0/Mqrt6USsi3OFPc1JbYIkVD7amuDgJSoaC5HEbdReho
	p2W3iKxJmC3LU5eLB0hoHwqMcbwI1AtH5VyszpzFVS0VY2pKDrKzGJ29rUaWcejDv7qvfv5AvJC
	xmlItkmvTCD7IJ9ejrgcIwZ0JviSH86s=
X-Gm-Gg: AR+sD13FeWXyOS+P1XDNlVh1FRdzD8Q2LbxFgn59LzXc/9PEgKybVfPQ6BL5ajSRJJv
	vQbyS+AaCG2e5K3WWHUqyjhq+XLQeWHvBZYW2Sha7Vdo9rh3Bq35OKb5iVj6dE3GuIKc/YpMm9m
	0wljQ4fNfv6oRYOmtqrMifNkSDAfcZ644fLfDIPsHueETzdvw9TQXx8UVWGJpcqXxYzDM8b2K+x
	PV4gsAS+UWB25UUw5QlefJ2+fpE7DguXhBFFXpXYzzSLWsWb5TKemQlE2Cvpzh7MIvVanAPpcDQ
	8vdwpPIzRXWl9Dyl6t2KP53BkNYSVlkXa7DKMyTHP34=
X-Received: by 2002:a05:6300:67c8:b0:3cc:3d08:da3e with SMTP id
 adf61e73a8af0-3cd2fdd1cfcmr18173591637.2.1787351780221; Fri, 21 Aug 2026
 15:36:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260820164929.17117-1-mohamedahmedegypt2001@gmail.com>
 <20260820164929.17117-9-mohamedahmedegypt2001@gmail.com>
 <33cd07ffe8f6a9c525f9d9b6d646efbf09cf76e9.camel@redhat.com>
In-Reply-To: <33cd07ffe8f6a9c525f9d9b6d646efbf09cf76e9.camel@redhat.com>
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Date: Sat, 22 Aug 2026 02:36:08 +0400
X-Gm-Features: AcwNN1XoSU5CB0z4SMYc1EoD_kRVt6P6sfxebC3gSSHsnE-BOyDGF2vp96trW_M
Message-ID: 
 <CAA+WOBsNkoL_fx48fL_hQ+Lg7ErG8cLZx0gUrqrKVA73RAoZGA@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] drm/nouveau/gsp: fix vblank interrupts on GB20x
To: lyude@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 3AZXEK62ERRQTSEE73IPAHL4BJJRAKBD
X-Message-ID-Hash: 3AZXEK62ERRQTSEE73IPAHL4BJJRAKBD
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3AZXEK62ERRQTSEE73IPAHL4BJJRAKBD/>
Archived-At: 
 <https://lore.freedesktop.org/CAA+WOBsNkoL_fx48fL_hQ+Lg7ErG8cLZx0gUrqrKVA73RAoZGA@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat, Aug 22, 2026 at 2:12=E2=80=AFAM <lyude@redhat.com> wrote:
>
> Some comments regarding both patch #2 and this patch below:
>
>
> On Thu, 2026-08-20 at 20:49 +0400, Mohamed Ahmed wrote:
> > The GSP path programs per-head timing (vblank) interrupts the same
> > way on
> > every generation. NVD5.0 (GB20x) reworked the FE interrupt frontend
> > around four message-based kernel vectors (high latency, low latency,
> > PMU,
> > and GSP) and moved RM head-timing interrupts to the dedicated low-
> > latency
> > vector:
> >
> >  - The enable is NV_PDISP_FE_RM_INTR_EN1_HEAD_TIMING, 0x611ef0 +
> >    head*4 (570.144 kernel_head_0501.c, renamed kernel_head_0502.c
> > from
> >    575.51.02 on, and v05_01 dev_disp.h).
> >
> >  - The vector is reported as a separate interrupt table entry,
> >    MC_ENGINE_IDX_DISP_LOW (intr_gb202.c, intrCacheDispIntrVectors).
> >
> >  - The vector must be re-armed through NV_PDISP_FE_INTR_RETRIGGER(1)
> >    at 0x611f34 after servicing (kdispServiceInterrupt ->
> >    kdispIntrRetrigger_v05_01).
> >
> > The event latch (0x611800), per-head status (0x611c00), and dispatch
> > summary (0x611ec0) the interrupt handler uses are unchanged on GB20x
> > (kheadReadPendingVblank_v03_00 and kheadResetPendingLastData_v03_00
> > remain for DISPv0502+).
> >
> > On GB20x the old code enables head timing onto the legacy vector,
> > leaves
> > its handler there, and never re-arms the message-based vectors. Page
> > flips still complete (nv50 sends those events from the commit path),
> > so
> > the desktop looks fine while DRM vblank waits and vblank sequence
> > queries
> > are affected.
> >
> > Supply GB20x vblank enables and an interrupt handler that re-arms the
> > vector after servicing through gb202_gsp_disp, translate the low-
> > latency
> > interrupt table entry as a second NVKM_ENGINE_DISP instance, and flag
> > the table so r535_disp_oneinit() attaches the handler to that
> > instance.
> >
> > Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
> > ---
> >  .../gpu/drm/nouveau/nvkm/engine/disp/gb202.c  | 42
> > +++++++++++++++++--
> >  .../nouveau/nvkm/subdev/gsp/rm/r535/disp.c    |  5 ++-
> >  .../drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c |  9 ++++
> >  3 files changed, 52 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gb202.c
> > b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gb202.c
> > index a66c820be9fe..f78669bafd64 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gb202.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gb202.c
> > @@ -130,6 +130,40 @@ gb202_head_state(struct nvkm_head *head, struct
> > nvkm_head_state *state)
> >       }
> >  }
> >
> > +/* NVD5.0 (GB20x and later) moved the RM head-timing interrupt
> > enable to
> > + * the low-latency vector's EN1 block. The event latch is unchanged.
> > + */
> > +static void
> > +gb202_head_vblank_put(struct nvkm_head *head)
> > +{
> > +     struct nvkm_device *device =3D head->disp-
> > >engine.subdev.device;
> > +
> > +     nvkm_mask(device, 0x611ef0 + (head->id * 4), 0x00000002,
> > 0x00000000);
> > +}
> > +
> > +static void
> > +gb202_head_vblank_get(struct nvkm_head *head)
> > +{
> > +     struct nvkm_device *device =3D head->disp-
> > >engine.subdev.device;
> > +
> > +     nvkm_wr32(device, 0x611800 + (head->id * 4), 0x00000002);
> > +     nvkm_mask(device, 0x611ef0 + (head->id * 4), 0x00000002,
> > 0x00000002);
> > +}
> > +
> > +static irqreturn_t
> > +gb202_disp_intr(struct nvkm_inth *inth)
> > +{
> > +     struct nvkm_disp *disp =3D container_of(inth, typeof(*disp),
> > engine.subdev.inth);
> > +     irqreturn_t ret =3D tu102_disp_intr(inth);
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
> >  /* GB20x is GSP-only. This table supplies the register programming
> > the
> >   * GSP-RM display path needs from the chip.
> >   */
> > @@ -137,11 +171,13 @@ static const struct nvkm_disp_func
> >  gb202_gsp_disp =3D {
> >       .uevent =3D &gv100_disp_chan_uevent,
> >       .ramht_size =3D 0x2000,
> > -     .gsp.intr =3D tu102_disp_intr,
> > +     /* Head timing arrives on the dedicated low-latency vector.
> > */
> > +     .gsp.intr =3D gb202_disp_intr,
> > +     .gsp.intr_low_latency =3D true,
> >       .gsp.head_state =3D gb202_head_state,
> >       .gsp.head_rgpos =3D gv100_head_rgpos,
> > -     .gsp.vblank_get =3D tu102_head_vblank_get,
> > -     .gsp.vblank_put =3D tu102_head_vblank_put,
> > +     .gsp.vblank_get =3D gb202_head_vblank_get,
> > +     .gsp.vblank_put =3D gb202_head_vblank_put,
> >       .gsp.hdmi_gcp =3D gb202_sor_hdmi_gcp,
> >       /* The legacy AVI unit is unchanged on GB20x. */
> >       .gsp.hdmi_infoframe_avi =3D gv100_sor_hdmi_infoframe_avi,
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
> > b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
> > index 3a8ff621ed62..a95f78c4502f 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
> > @@ -1705,7 +1705,10 @@ r535_disp_oneinit(struct nvkm_disp *disp)
> >
> >       /* Chips that raise head-timing interrupts on a separate
> > low-latency
> >        * vector report it as a second DISP interrupt table entry,
> > exposed
> > -      * as instance 1 by the RM engine-index translation.
> > +      * as instance 1 by the RM engine-index translation (see
> > +      * r570_gsp_xlat_mc_engine_idx()). Their high-latency vector
> > +      * (instance 0) is left unhandled as no event nouveau
> > enables is
> > +      * routed to it, and without a handler it stays masked.
> >        */
>
> I didn't notice it until I got to this patch, but is it possible you
> mistakenly added the intr_low_latency stuff a little early with patch
> #2 and meant to add it here?
>
> (doesn't matter to me too much either way, whatever you intended works
> fine with me)
>
Yeah it was a rebase mistake and then I figured I could salvage it as
a bit of future-proofing in #2. I can try to fix it properly though.
> Otherwise:
>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
>
> >       ret =3D nvkm_gsp_intr_stall(gsp, disp->engine.subdev.type,
> >                                 disp->func->gsp.intr_low_latency ?
> > 1 : disp->engine.subdev.inst);
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
> > b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
> > index 3e391646d8f7..b45781cd0dfd 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
> > @@ -44,6 +44,15 @@ r570_gsp_xlat_mc_engine_idx(u32 mc_engine_idx,
> > enum nvkm_subdev_type *ptype, int
> >               *ptype =3D NVKM_ENGINE_DISP;
> >               *pinst =3D 0;
> >               return true;
> > +     case MC_ENGINE_IDX_DISP_LOW:
> > +             /* GB20x+ report a separate low-latency display
> > vector, used
> > +              * for head-timing interrupts. Expose it as a second
> > DISP
> > +              * interrupt instance. r535_disp_oneinit() attaches
> > the
> > +              * handler to it when the chip's
> > gsp.intr_low_latency is set.
> > +              */
> > +             *ptype =3D NVKM_ENGINE_DISP;
> > +             *pinst =3D 1;
> > +             return true;
> >       case MC_ENGINE_IDX_CE0 ... MC_ENGINE_IDX_CE19:
> >               *ptype =3D NVKM_ENGINE_CE;
> >               *pinst =3D mc_engine_idx - MC_ENGINE_IDX_CE0;
>
