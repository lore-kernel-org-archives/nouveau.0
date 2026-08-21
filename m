Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040A2C5DF7D
	for <nouveau@archiver.kernel.org>; Fri, 21 Aug 2026 20:15:51 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CD3D410F3C0;
	Fri, 21 Aug 2026 19:22:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gTtaJq4A";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id EB35E47AB0;
	Fri, 21 Aug 2026 19:05:40 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787339140;
 b=jOnlf7Eao/iUli37IG8LGmFTd44pWt9zn4TUUuQsI9RVf+MGC+Ynf4ELdF6iwM8CE1+dC
 292f9u4jV0wzdI49Tru5EtCtYXA62KcqMJ7THcYedM0LDcv1FGLUGbNZDHQ98/Vxak59n4g
 VnM9ewBTYpiSXs/YlLZmc7cjmcbdZNkjb/YlzsSllqgvFP+7zSUeyoNB0sSj739zpavDwqs
 unxtaQ+TXDGwvWz8auNw7a0+iIi03km2rJItUsmk8Xo/u7G4DQEBdz2OGf+HkJdq7uU/601
 EY7hb4C+stkUiQv3MGydWozTuZlbVs0kB4nOz9B8iFw1xtLd0OPdLWQW+hIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787339140; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=pr8d0fOTk7HJ92WIwFvUNvFQngG76dHS9ck0/MtLkMs=;
 b=AaqGGAiJ4vPPfMcChLhD1u6ZweduYR9+LD4knyFvhEP+EKOJSUGfJoX4HWSlnVAZ4f85N
 xlqIOFY3gJrHLJqCiHM8Sd9CzkAHIHjyUMHz/SYbaY2rP8jZoFkjcucRbMGuTNPFv3cCi/Q
 cc9lyP0Fj5fViNhRpigsk+Rq2i6nE0RxfHoxhYA2LpLXnDlHLp6JnOKkpEf1IvGuX82FQQj
 a7CzCL9eWRIfw/wG1jwBucYyKFj7yBL5fuX5gn5HeRGX80Cs95XJ04EzckdSAKQcrqt/Sg3
 QqWQWb8oQlUhDKYbwRHwy/evDU3vwZHBpjVdC2fzKFkyBpB8CyS1KJX1uITA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=fail header.d=redhat.com;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail header.d=redhat.com;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C9D1245B17
	for <nouveau@lists.freedesktop.org>; Fri, 21 Aug 2026 19:05:27 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1EB6B10E301
	for <nouveau@lists.freedesktop.org>; Fri, 21 Aug 2026 19:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787340105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pr8d0fOTk7HJ92WIwFvUNvFQngG76dHS9ck0/MtLkMs=;
	b=gTtaJq4ATMRGFJV6AValO9ZZt1/dAYEb7WjMuEDXShf+k+NKXO5Hg1XK8bN7VbVkz0IqzO
	O/HGe3Z3tWDEZs89AS44VUjoOMU23LBSeptXZoNv4GN5vbmNrjW/Ns3n3dspcdiYxtGQdB
	nqNx2oh0zjrSQa/vNMImoNEosS6s+Rk=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-578-oYv1OPc_PG-cq7GCTzMT9g-1; Fri, 21 Aug 2026 15:21:43 -0400
X-MC-Unique: oYv1OPc_PG-cq7GCTzMT9g-1
X-Mimecast-MFC-AGG-ID: oYv1OPc_PG-cq7GCTzMT9g_1787340103
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-92ef13b61bcso201058885a.1
        for <nouveau@lists.freedesktop.org>;
 Fri, 21 Aug 2026 12:21:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787340103; x=1787944903;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+lJHW5Uuf0wtGywk/XA4axlvgeXcz2UVQQ73YnPogIk=;
        b=SP2QxmIh3aSJu+bZ2UKxCH/Gxf4nSxqDqHx0QjAqJ6D319RHfzFqiKQuaFXD4KqptK
         2lE7B/cXD1rbAMl9FYnr9wMVrngxvm9bGFYqFSZQoDYGsHbk76fX+AKwjF41rXQvY+FJ
         VrYaXab+R3vubar+kL8vaJsxng91N1jge0I/n8WOR65s3davRS6RuTSKG5JLs0gUk0vw
         B6OVeNESPkxE31CKtZRHczCyt8ZH/qTPqTpe1mXpF4pMsPIYQ9hw9xzblGJN7GJcYbVw
         20+tL2qsuElasuoY3TKNwW174O5Oy9p2UVFAcTJv/u7q6SW9Hm49tW65jaxkYqy9K4cy
         s7HA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rop69nJpl4tjWp8ZHOcaAH/oIEQRtNxYxy5SH6aC/itZCaoiAfhnJjjsknh4n9JKZKnhTMZleGz@lists.freedesktop.org
X-Gm-Message-State: AFuF++mP4pLPblIWAo54zh2vlI7/ZL0xkw3tWcFhQvtWqZFlbbKk9URm
	Hyk8eeGBRO5UtnQ/1eFbd2zNHaNwApX/pC65x0Ct9K7AJjYXtQDH/BbXwM0tYgAi0RuG0sw8BnA
	dE5hjX1fbwAZwxe3inMftdKEV2QbbsoEarKJQaswSIg8DIbcnennkby5FJh3oXOHx3KI=
X-Gm-Gg: AR+sD12GJbyCNq0odUwZS/3zgoGJM0sBiIpsr+Q2gpV+SjvmNLlESrDfF2lg+eTkTk+
	0Qu0jIPaqN0RyQ1wq0rE6dSUr2lgn+nTmwuooBRP8EJMCrCkoE2zSeMKbAGXTjHUevniYMDmaM2
	oamDQ/xwkXgPKv9VDEl7vN2WUQURU2rvzRqLwSRPcDbTsb6f4GtzxpBYl8jcEKSQ7ix8RJtKZfw
	za6mOeFMp+yaTkCSPxxEvw/kLNAPpJ2pZX6/byowHUn0afxZMAacgZ9EdyJGCprO9a/JrSUbj4M
	gFt+FfmnZUKZHD6pp/lGdjfx3xNNSeF/jTWQIEwcA0ktFF02yu4G5qjsL/tPN2spxihxTUiV
X-Received: by 2002:a05:620a:4546:b0:932:e9c2:f4fc with SMTP id
 af79cd13be357-937468bd408mr142341885a.16.1787340103194;
        Fri, 21 Aug 2026 12:21:43 -0700 (PDT)
X-Received: by 2002:a05:620a:4546:b0:932:e9c2:f4fc with SMTP id
 af79cd13be357-937468bd408mr142326185a.16.1787340101790;
        Fri, 21 Aug 2026 12:21:41 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-937204aa8a6sm666922585a.11.2026.08.21.12.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 12:21:40 -0700 (PDT)
Message-ID: <1d328d5bdc0750910aa2303cefb0848fb9d270c0.camel@redhat.com>
Subject: Re: [PATCH v2 01/10] drm/nouveau/disp: move GSP head-timing ISR and
 vblank helpers to tu102.c
From: lyude@redhat.com
To: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
	linux-kernel@vger.kernel.org
Date: Fri, 21 Aug 2026 15:21:40 -0400
In-Reply-To: <20260820164929.17117-2-mohamedahmedegypt2001@gmail.com>
References: <20260820164929.17117-1-mohamedahmedegypt2001@gmail.com>
	 <20260820164929.17117-2-mohamedahmedegypt2001@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -GJsMYxxIF9lUxsB2xdRCeK0hLrA3DVoIUsgI5GggJY_1787340103
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: UL7MPJEX7SI5K7FZEWO3YJ3W6IK44QGN
X-Message-ID-Hash: UL7MPJEX7SI5K7FZEWO3YJ3W6IK44QGN
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Mary Guillemard <mary@mary.zone>, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/UL7MPJEX7SI5K7FZEWO3YJ3W6IK44QGN/>
Archived-At: 
 <https://lore.freedesktop.org/1d328d5bdc0750910aa2303cefb0848fb9d270c0.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Thu, 2026-08-20 at 20:49 +0400, Mohamed Ahmed wrote:
> The GSP-RM display code in rm/r535/disp.c owns a handful of direct
> MMIO
> routines: the head-timing (vblank) interrupt handler and the per-head
> vblank enable/disable. They program display registers, not RM, so
> they
> belong with the rest of the per-chip register code in engine/disp/.
>=20
> Move them to tu102.c (Turing is the first GSP-capable generation) as
> tu102_disp_intr() and tu102_head_vblank_get()/put(), exported for
> rm/r535/disp.c, which keeps calling them by name for now. No
> functional
> change.
>=20
> Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
> ---
> =C2=A0.../gpu/drm/nouveau/nvkm/engine/disp/head.h=C2=A0=C2=A0 |=C2=A0 3 +=
+
> =C2=A0.../gpu/drm/nouveau/nvkm/engine/disp/priv.h=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0.../gpu/drm/nouveau/nvkm/engine/disp/tu102.c=C2=A0 | 50
> ++++++++++++++++++
> =C2=A0.../nouveau/nvkm/subdev/gsp/rm/r535/disp.c=C2=A0=C2=A0=C2=A0 | 52 +=
+---------------
> --
> =C2=A04 files changed, 57 insertions(+), 49 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/head.h
> b/drivers/gpu/drm/nouveau/nvkm/engine/disp/head.h
> index b642729c254f..986043e87554 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/head.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/head.h
> @@ -56,6 +56,9 @@ int gv100_head_new(struct nvkm_disp *, int id);
> =C2=A0void gv100_head_state(struct nvkm_head *head, struct nvkm_head_stat=
e
> *state);
> =C2=A0void gv100_head_rgpos(struct nvkm_head *head, u16 *hline, u16
> *vline);
> =C2=A0
> +void tu102_head_vblank_get(struct nvkm_head *);
> +void tu102_head_vblank_put(struct nvkm_head *);
> +
> =C2=A0#define HEAD_MSG(h,l,f,a...) do
> {=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> =C2=A0=09struct nvkm_head *_h =3D
> (h);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> =C2=A0=09nvkm_##l(&_h->disp->engine.subdev, "head-%d: "f"\n", _h->id,
> ##a);=C2=A0=C2=A0=C2=A0=C2=A0 \
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h
> b/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h
> index a3fd7cb7c488..722ec340e12a 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h
> @@ -72,6 +72,7 @@ int gv100_disp_wndw_cnt(struct nvkm_disp *,
> unsigned long *);
> =C2=A0int gv100_disp_caps_new(const struct nvkm_oclass *, void *, u32,
> struct nvkm_object **);
> =C2=A0
> =C2=A0int tu102_disp_init(struct nvkm_disp *);
> +irqreturn_t tu102_disp_intr(struct nvkm_inth *);
> =C2=A0
> =C2=A0void nv50_disp_dptmds_war_2(struct nvkm_disp *, struct dcb_output
> *);
> =C2=A0void nv50_disp_dptmds_war_3(struct nvkm_disp *, struct dcb_output
> *);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c
> index dcb9f8ba374c..7b70b466fa36 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c
> @@ -104,6 +104,56 @@ tu102_sor_new(struct nvkm_disp *disp, int id)
> =C2=A0=09return nvkm_ior_new_(&tu102_sor, disp, SOR, id, hda &
> BIT(id));
> =C2=A0}
> =C2=A0
> +/* The GSP-RM display path leaves head-timing (vblank) interrupts
> and their
> + * enables to us. These program the RM head-timing line (bit 1 of
> the
> + * per-head enable, not the bit nvkm's own gv100 path uses).
> + */
> +void
> +tu102_head_vblank_put(struct nvkm_head *head)
> +{
> +=09struct nvkm_device *device =3D head->disp-
> >engine.subdev.device;
> +
> +=09nvkm_mask(device, 0x611d80 + (head->id * 4), 0x00000002,
> 0x00000000);
> +}
> +
> +void
> +tu102_head_vblank_get(struct nvkm_head *head)
> +{
> +=09struct nvkm_device *device =3D head->disp-
> >engine.subdev.device;
> +
> +=09nvkm_wr32(device, 0x611800 + (head->id * 4), 0x00000002);
> +=09nvkm_mask(device, 0x611d80 + (head->id * 4), 0x00000002,
> 0x00000002);
> +}
> +
> +static void
> +tu102_disp_intr_head_timing(struct nvkm_disp *disp, int head)
> +{
> +=09struct nvkm_subdev *subdev =3D &disp->engine.subdev;
> +=09struct nvkm_device *device =3D subdev->device;
> +=09u32 stat =3D nvkm_rd32(device, 0x611c00 + (head * 0x04));
> +
> +=09if (stat & 0x00000002) {
> +=09=09nvkm_disp_vblank(disp, head);
> +
> +=09=09nvkm_wr32(device, 0x611800 + (head * 0x04),
> 0x00000002);
> +=09}
> +}
> +
> +irqreturn_t
> +tu102_disp_intr(struct nvkm_inth *inth)
> +{
> +=09struct nvkm_disp *disp =3D container_of(inth, typeof(*disp),
> engine.subdev.inth);
> +=09struct nvkm_subdev *subdev =3D &disp->engine.subdev;
> +=09struct nvkm_device *device =3D subdev->device;
> +=09unsigned long mask =3D nvkm_rd32(device, 0x611ec0) &
> 0x000000ff;
> +=09int head;
> +
> +=09for_each_set_bit(head, &mask, 8)
> +=09=09tu102_disp_intr_head_timing(disp, head);
> +
> +=09return IRQ_HANDLED;
> +}
> +
> =C2=A0int
> =C2=A0tu102_disp_init(struct nvkm_disp *disp)
> =C2=A0{
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
> index e77733a5d9c3..8e57bb6519e5 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
> @@ -608,29 +608,12 @@ r535_sor_cnt(struct nvkm_disp *disp, unsigned
> long *pmask)
> =C2=A0=09return 4;
> =C2=A0}
> =C2=A0
> -static void
> -r535_head_vblank_put(struct nvkm_head *head)
> -{
> -=09struct nvkm_device *device =3D head->disp-
> >engine.subdev.device;
> -
> -=09nvkm_mask(device, 0x611d80 + (head->id * 4), 0x00000002,
> 0x00000000);
> -}
> -
> -static void
> -r535_head_vblank_get(struct nvkm_head *head)
> -{
> -=09struct nvkm_device *device =3D head->disp-
> >engine.subdev.device;
> -
> -=09nvkm_wr32(device, 0x611800 + (head->id * 4), 0x00000002);
> -=09nvkm_mask(device, 0x611d80 + (head->id * 4), 0x00000002,
> 0x00000002);
> -}
> -
> =C2=A0static const struct nvkm_head_func
> =C2=A0r535_head =3D {
> =C2=A0=09.state =3D gv100_head_state,
> =C2=A0=09.rgpos =3D gv100_head_rgpos,
> -=09.vblank_get =3D r535_head_vblank_get,
> -=09.vblank_put =3D r535_head_vblank_put,
> +=09.vblank_get =3D tu102_head_vblank_get,
> +=09.vblank_put =3D tu102_head_vblank_put,
> =C2=A0};
> =C2=A0
> =C2=A0static struct nvkm_conn *
> @@ -1404,35 +1387,6 @@ static const struct nvkm_event_func
> =C2=A0r535_disp_event =3D {
> =C2=A0};
> =C2=A0
> -static void
> -r535_disp_intr_head_timing(struct nvkm_disp *disp, int head)
> -{
> -=09struct nvkm_subdev *subdev =3D &disp->engine.subdev;
> -=09struct nvkm_device *device =3D subdev->device;
> -=09u32 stat =3D nvkm_rd32(device, 0x611c00 + (head * 0x04));
> -
> -=09if (stat & 0x00000002) {
> -=09=09nvkm_disp_vblank(disp, head);
> -
> -=09=09nvkm_wr32(device, 0x611800 + (head * 0x04),
> 0x00000002);
> -=09}
> -}
> -
> -static irqreturn_t
> -r535_disp_intr(struct nvkm_inth *inth)
> -{
> -=09struct nvkm_disp *disp =3D container_of(inth, typeof(*disp),
> engine.subdev.inth);
> -=09struct nvkm_subdev *subdev =3D &disp->engine.subdev;
> -=09struct nvkm_device *device =3D subdev->device;
> -=09unsigned long mask =3D nvkm_rd32(device, 0x611ec0) &
> 0x000000ff;
> -=09int head;
> -
> -=09for_each_set_bit(head, &mask, 8)
> -=09=09r535_disp_intr_head_timing(disp, head);
> -
> -=09return IRQ_HANDLED;
> -}
> -
> =C2=A0static void
> =C2=A0r535_disp_fini(struct nvkm_disp *disp, bool suspend)
> =C2=A0{
> @@ -1708,7 +1662,7 @@ r535_disp_oneinit(struct nvkm_disp *disp)
> =C2=A0=09=09return ret;
> =C2=A0
> =C2=A0=09ret =3D nvkm_inth_add(&device->vfn->intr, ret,
> NVKM_INTR_PRIO_NORMAL, &disp->engine.subdev,
> -=09=09=09=C2=A0=C2=A0=C2=A0 r535_disp_intr, &disp-
> >engine.subdev.inth);
> +=09=09=09=C2=A0=C2=A0=C2=A0 tu102_disp_intr, &disp-
> >engine.subdev.inth);
> =C2=A0=09if (ret)
> =C2=A0=09=09return ret;
> =C2=A0

