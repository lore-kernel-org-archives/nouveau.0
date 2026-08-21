Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F45DC5DF97
	for <nouveau@archiver.kernel.org>; Fri, 21 Aug 2026 21:30:48 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2252910F3B1;
	Fri, 21 Aug 2026 21:30:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Q4aAc7FR";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id DFC8247AD0;
	Fri, 21 Aug 2026 21:14:09 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787346849;
 b=y3MvIzM4dOFdA0sSSrrQpwXKcHvoRlcJdsE+gWmKW3HTTh049MEBP6OXewRisRCpKDyUa
 1q0vf6SntcQk3fEBjBoSnchp9NOc3VuMogu0gswoIDrHvo9XlcaOdytRv0cZHnWXdkkyoRJ
 a7czLvqrFYa2dU0NCHH1aU2QZGr5f+ZWFcWmhSSIoJC4o9ZRGcw3HbsGU/D1Ci5JhMAhUUE
 a6wFG8yQrAfbpJFY82waPv/8qTenO8163xm9Km6sPDc9wKrT3bmP7/djCLGROuBvu8OsgQT
 gzEl8mrTKc2IRK1q8ZF9WH6Wsv/r1z7wJlqVyHkmO/yFm63JgUefXLvBHZXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787346849; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=74TiAJn6z/7VQlw0UBHusaAaeUNgRbghuyIuxPhfCjI=;
 b=E1+7TOcrcHRpGTZAd2jAcznMfSqFrRLD1k/f5Y5ob3weoyDRcL6uEqhbRu/NMjCi63bzh
 zs05adD/UEdd3d+g6fKljpp/FwCdtwA6pTB5wZY+du8JDdyJQpWWmicIFUWnp7NCqbm5/cG
 Pxu5U7WFRhDKtlmIX9lkLWjKd0kYTwpG9JhMSpR0QDY6A3vf+hQcNUGAoTfzmYVvt5Uaw7O
 qvnf4JY9NbFemMrIItcNmejVMkAn/NRc+e40UgWCU2aafaiJicwUD8tJin69L6wqBbHLa7H
 BViG1EH/Eh+XfgHV1ajqj10ufA0p52ljBFxPXNrjuuw/iHx+o7zGPf+A78UA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 7662F47AB5
	for <nouveau@lists.freedesktop.org>; Fri, 21 Aug 2026 21:14:05 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 316DC10E376
	for <nouveau@lists.freedesktop.org>; Fri, 21 Aug 2026 21:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787347842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=74TiAJn6z/7VQlw0UBHusaAaeUNgRbghuyIuxPhfCjI=;
	b=Q4aAc7FRqQ4DqkuhoJsStG95Xqb0rkFlg8r2giN8BhpTLVSRwRhbFN/hFv38wwFbIh3CYZ
	MlDEAWLp0zINDd3jeAy6ErbDZBZ3QP2PaSrRSYJTa1rjeitQgHbMjoMC/rB2xs7yqLRIRv
	PmE4R3mEhzIe/cCAzy/LfD68WcE++PY=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-khVxdouiNpCJM3wuvkw8Gw-1; Fri, 21 Aug 2026 17:30:40 -0400
X-MC-Unique: khVxdouiNpCJM3wuvkw8Gw-1
X-Mimecast-MFC-AGG-ID: khVxdouiNpCJM3wuvkw8Gw_1787347840
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-8eec6acbe21so26660796d6.3
        for <nouveau@lists.freedesktop.org>;
 Fri, 21 Aug 2026 14:30:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787347840; x=1787952640;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jUTgNefrV0RVSYcbLese14a3Jj7kRytHJFAkoezSnU4=;
        b=MmYold4mBvDfXSigYfjopMEGzFheKZQWcHp3uHmbz7lOP9ph2pVDHeRUou21SMUv7u
         wGSEjZw1Y8bfLGDvo66vjODQeHvWiRnhwk+kK14BV0+8GyslBRjyU1r8G+opgyImMFBu
         Qb/oSbilDIIjKt/M0AaLT4mcZPJPE76tS+CjMd1AncSFfcDycTH8aagG3rYiuUszqt7f
         6oLcXj27aJduX0LHzteGwPGEUJdWJQNAI9wvw36cANOxkd0HPDrUiJa4eA4T6IIDypsw
         8i+NkI+o4CPrMH2+UGNT73929bFjSZ9yQavl+Ri5XEZS1uu2Z5wbT9E3BgUT7olMER5H
         JNmw==
X-Forwarded-Encrypted: i=1;
 AHgh+RoIK2H7aGwDJoP7jTcPd1iSPtYku6c9F7/qOxy/7oYjCJUES7jQuzggVFSEdWf6Y44P5sj0ABE6@lists.freedesktop.org
X-Gm-Message-State: AFuF++mjM+lgLzPJRxhdnjgC6U46+scLjd/VQQjIDcHen4fCMoFS5E2z
	0lj0W2w7yV+mRfnzt9MrxfM1qTC3jGd0Zm43uwBpVThhnVjNHyX8+p/oJvKWSMKLzZsvBhagfoo
	wUwsgUm7deo/p05pUh2qT1Rr152KSmOvA6RC1EsmwP+61sLAfqWn++D38ihAyrNUsOYE=
X-Gm-Gg: AR+sD13lugFMCrsMlX3t+Y4g9vu9kHX7IZQ/ueXCP1rbJNGjpaY/xAOa5rX7g6uB9va
	yf/HUwdX99IuFJA6uF0Oa4VgGE+6WRpxQswPpy3WwUKlLyvIES8E5jP8DkgNSn76+r9yztqqCnA
	N9A+ZjbS1mM8SIz+RvJ5wToyuUCm+394zrwFttms5eUxyMP0zDTM45JOx2t0JxHnTZWEhGiGtXz
	UTRKI2i4UZCxTUQhooMxRHAvee3OxOknMJRBTBd+8jrrTfQ+KfRRaI7GxYgJEeepixeDN1Et43y
	Ie49/8JxZ0mwjJX1fr1EG7zj/lVwFz6ki5R320v8Hp761ZQxoHofUQ+g8yPo6Xg+bkUE0ud8
X-Received: by 2002:a05:6214:2686:b0:8f4:821d:95f7 with SMTP id
 6a1803df08f44-90c8f9fd3a3mr14377876d6.18.1787347839830;
        Fri, 21 Aug 2026 14:30:39 -0700 (PDT)
X-Received: by 2002:a05:6214:2686:b0:8f4:821d:95f7 with SMTP id
 6a1803df08f44-90c8f9fd3a3mr14376976d6.18.1787347838764;
        Fri, 21 Aug 2026 14:30:38 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90c5eec934bsm72659966d6.15.2026.08.21.14.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 14:30:36 -0700 (PDT)
Message-ID: <9b9a3f93ccaa64efa6f24ebd24d933ee758702e6.camel@redhat.com>
Subject: Re: [PATCH v2 03/10] drm/nouveau/disp: route GSP-RM display MMIO
 through nvkm_disp_func hooks
From: lyude@redhat.com
To: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
	linux-kernel@vger.kernel.org
Date: Fri, 21 Aug 2026 17:30:36 -0400
In-Reply-To: <20260820164929.17117-4-mohamedahmedegypt2001@gmail.com>
References: <20260820164929.17117-1-mohamedahmedegypt2001@gmail.com>
	 <20260820164929.17117-4-mohamedahmedegypt2001@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: smS872azmNBJty0OT8lVlvjbavCAtcYbhaFwT2giuvA_1787347840
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: I4R54XXZTPEQKK67Q7JWU6YET4Y52OAA
X-Message-ID-Hash: I4R54XXZTPEQKK67Q7JWU6YET4Y52OAA
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/I4R54XXZTPEQKK67Q7JWU6YET4Y52OAA/>
Archived-At: 
 <https://lore.freedesktop.org/9b9a3f93ccaa64efa6f24ebd24d933ee758702e6.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Some comments below:

On Thu, 2026-08-20 at 20:49 +0400, Mohamed Ahmed wrote:
> The GSP-RM display code in rm/r535/disp.c borrows a few
> register-programming routines from engine/disp (the head-timing
> interrupt handler, vblank enables, armed head state and scanout
> position
> readback, the AVI/VSI infoframe writers and the GCP AVMute write) and
> so
> far picked them by name, which means it has to know which chip it
> runs
> on the moment a generation changes any of them.
>=20
> Give nvkm_disp_func a .gsp table that each chip fills with exactly
> those
> hooks, add tu102_gsp_disp (TU1xx) and ga102_gsp_disp (GA10x onwards)
> carrying the current functions, hand them to r535_disp_new() instead
> of
> the full hardware tables, and make rm/r535/disp.c call through the
> hooks. r535_head becomes four forwarders, r535_sor_hdmi gets
> infoframe
> forwarders, r535_sor_hdmi_audio() calls the GCP hook, and the
> interrupt
> handler and its vector come from the table (intr_low_latency selects
> the
> second DISP interrupt instance for chips that raise head timing on a
> separate vector). The tables are per chip even though the two
> currently
> coincide, so a generation that changes a hook only touches its own
> file.
> rm/r535/disp.c no longer contains chip-specific register code, and a
> new
> display generation only has to provide its own table. No functional
> change.
>=20
> Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
> ---
> =C2=A0.../gpu/drm/nouveau/nvkm/engine/disp/ga102.c=C2=A0 | 16 ++++-
> =C2=A0.../gpu/drm/nouveau/nvkm/engine/disp/priv.h=C2=A0=C2=A0 | 19 ++++++
> =C2=A0.../gpu/drm/nouveau/nvkm/engine/disp/tu102.c=C2=A0 | 16 ++++-
> =C2=A0.../nouveau/nvkm/subdev/gsp/rm/r535/disp.c=C2=A0=C2=A0=C2=A0 | 60 +=
+++++++++++++++-
> --
> =C2=A04 files changed, 100 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/ga102.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/disp/ga102.c
> index ab0a85c92430..b48ed7146396 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/ga102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/ga102.c
> @@ -144,12 +144,26 @@ ga102_disp =3D {
> =C2=A0=09},
> =C2=A0};
> =C2=A0
> +static const struct nvkm_disp_func
> +ga102_gsp_disp =3D {
> +=09.uevent =3D &gv100_disp_chan_uevent,
> +=09.ramht_size =3D 0x2000,
> +=09.gsp.intr =3D tu102_disp_intr,
> +=09.gsp.head_state =3D gv100_head_state,
> +=09.gsp.head_rgpos =3D gv100_head_rgpos,
> +=09.gsp.vblank_get =3D tu102_head_vblank_get,
> +=09.gsp.vblank_put =3D tu102_head_vblank_put,
> +=09.gsp.hdmi_gcp =3D tu102_sor_hdmi_gcp,
> +=09.gsp.hdmi_infoframe_avi =3D gv100_sor_hdmi_infoframe_avi,
> +=09.gsp.hdmi_infoframe_vsi =3D gv100_sor_hdmi_infoframe_vsi,
> +};
> +
> =C2=A0int
> =C2=A0ga102_disp_new(struct nvkm_device *device, enum nvkm_subdev_type
> type, int inst,
> =C2=A0=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct nvkm_disp **pdisp)
> =C2=A0{
> =C2=A0=09if (nvkm_gsp_rm(device->gsp))
> -=09=09return r535_disp_new(&ga102_disp, device, type,
> inst, pdisp);
> +=09=09return r535_disp_new(&ga102_gsp_disp, device, type,
> inst, pdisp);
> =C2=A0
> =C2=A0=09return nvkm_disp_new_(&ga102_disp, device, type, inst,
> pdisp);
> =C2=A0}
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h
> b/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h
> index 722ec340e12a..3cb903741fb8 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h
> @@ -5,6 +5,8 @@
> =C2=A0#include <engine/disp.h>
> =C2=A0#include <core/enum.h>
> =C2=A0struct nvkm_head;
> +struct nvkm_head_state;
> +struct nvkm_ior;
> =C2=A0struct nvkm_outp;
> =C2=A0struct dcb_output;
> =C2=A0
> @@ -34,6 +36,23 @@ struct nvkm_disp_func {
> =C2=A0=09=09int (*new)(struct nvkm_disp *, int id);
> =C2=A0=09} wndw, head, dac, sor, pior;
> =C2=A0
> +=09/* Register programming that the GSP-RM display path
> (rm/r535) needs from
> +=09 * the chip, everything else on that path goes through RM.
> Every hook
> +=09 * is called unconditionally.
> +=09 */
> +=09struct {
> +=09=09irqreturn_t (*intr)(struct nvkm_inth *);
> +=09=09/* Head-timing interrupts arrive on a second DISP
> vector. */
> +=09=09bool intr_low_latency;
> +=09=09void (*head_state)(struct nvkm_head *, struct
> nvkm_head_state *);
> +=09=09void (*head_rgpos)(struct nvkm_head *, u16 *hline,
> u16 *vline);

This looks mostly fine. As far as I can tell though, it seems like
there's no actual behavioral differences between the gsp's head_state
and the non-GSP head_state, same for head_rgpos. Is it possible for us
to drop these two callbacks and keep using nvkm_head_func for that?
Perhaps by having a second nvkm_head_func that we call back down to
from RM's?

FWIW by the way, I think if we end up with say - a nvkm_head_func
struct that only has head_state/head_rgpos filled and nothing else
(e.g. using it without GSP would break things) that's probably fine
since booting these cards without GSP isn't possible on nouveau anyhow.

> +=09=09void (*vblank_get)(struct nvkm_head *);
> +=09=09void (*vblank_put)(struct nvkm_head *);
> +=09=09void (*hdmi_gcp)(struct nvkm_ior *, int head, bool
> enable);
> +=09=09void (*hdmi_infoframe_avi)(struct nvkm_ior *, int
> head, void *data, u32 size);
> +=09=09void (*hdmi_infoframe_vsi)(struct nvkm_ior *, int
> head, void *data, u32 size);
> +=09} gsp;
> +
> =C2=A0=09u16 ramht_size;
> =C2=A0
> =C2=A0=09struct nvkm_sclass root;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c
> index 6cfd52c9056f..9db3cac487e3 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c
> @@ -295,12 +295,26 @@ tu102_disp =3D {
> =C2=A0=09},
> =C2=A0};
> =C2=A0
> +static const struct nvkm_disp_func
> +tu102_gsp_disp =3D {
> +=09.uevent =3D &gv100_disp_chan_uevent,
> +=09.ramht_size =3D 0x2000,
> +=09.gsp.intr =3D tu102_disp_intr,
> +=09.gsp.head_state =3D gv100_head_state,
> +=09.gsp.head_rgpos =3D gv100_head_rgpos,
> +=09.gsp.vblank_get =3D tu102_head_vblank_get,
> +=09.gsp.vblank_put =3D tu102_head_vblank_put,
> +=09.gsp.hdmi_gcp =3D tu102_sor_hdmi_gcp,
> +=09.gsp.hdmi_infoframe_avi =3D gv100_sor_hdmi_infoframe_avi,
> +=09.gsp.hdmi_infoframe_vsi =3D gv100_sor_hdmi_infoframe_vsi,
> +};
> +
> =C2=A0int
> =C2=A0tu102_disp_new(struct nvkm_device *device, enum nvkm_subdev_type
> type, int inst,
> =C2=A0=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct nvkm_disp **pdisp)
> =C2=A0{
> =C2=A0=09if (nvkm_gsp_rm(device->gsp))
> -=09=09return r535_disp_new(&tu102_disp, device, type,
> inst, pdisp);
> +=09=09return r535_disp_new(&tu102_gsp_disp, device, type,
> inst, pdisp);
> =C2=A0
> =C2=A0=09return nvkm_disp_new_(&tu102_disp, device, type, inst,
> pdisp);
> =C2=A0}
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
> index cd4451e62512..f3e55253bcbc 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
> @@ -547,7 +547,19 @@ r535_sor_hdmi_audio(struct nvkm_ior *sor, int
> head, bool enable)
> =C2=A0{
> =C2=A0=09r535_sor_hdmi_ctrl_audio(sor->asy.outp, enable);
> =C2=A0=09r535_sor_hdmi_ctrl_audio_mute(sor->asy.outp, !enable);
> -=09tu102_sor_hdmi_gcp(sor, head, enable);
> +=09sor->disp->func->gsp.hdmi_gcp(sor, head, enable);
> +}
> +
> +static void
> +r535_sor_hdmi_infoframe_avi(struct nvkm_ior *sor, int head, void
> *data, u32 size)
> +{
> +=09sor->disp->func->gsp.hdmi_infoframe_avi(sor, head, data,
> size);
> +}
> +
> +static void
> +r535_sor_hdmi_infoframe_vsi(struct nvkm_ior *sor, int head, void
> *data, u32 size)
> +{
> +=09sor->disp->func->gsp.hdmi_infoframe_vsi(sor, head, data,
> size);
> =C2=A0}
> =C2=A0
> =C2=A0static void
> @@ -575,8 +587,8 @@ r535_sor_hdmi =3D {
> =C2=A0=09.ctrl =3D r535_sor_hdmi_ctrl,
> =C2=A0=09.scdc =3D r535_sor_hdmi_scdc,
> =C2=A0=09/*TODO: SF_USER -> KMS. */
> -=09.infoframe_avi =3D gv100_sor_hdmi_infoframe_avi,
> -=09.infoframe_vsi =3D gv100_sor_hdmi_infoframe_vsi,
> +=09.infoframe_avi =3D r535_sor_hdmi_infoframe_avi,
> +=09.infoframe_vsi =3D r535_sor_hdmi_infoframe_vsi,
> =C2=A0=09.audio =3D r535_sor_hdmi_audio,
> =C2=A0};
> =C2=A0
> @@ -601,12 +613,36 @@ r535_sor_cnt(struct nvkm_disp *disp, unsigned
> long *pmask)
> =C2=A0=09return 4;
> =C2=A0}
> =C2=A0
> +static void
> +r535_head_state(struct nvkm_head *head, struct nvkm_head_state
> *state)
> +{
> +=09head->disp->func->gsp.head_state(head, state);
> +}
> +
> +static void
> +r535_head_rgpos(struct nvkm_head *head, u16 *hline, u16 *vline)
> +{
> +=09head->disp->func->gsp.head_rgpos(head, hline, vline);
> +}
> +
> +static void
> +r535_head_vblank_get(struct nvkm_head *head)
> +{
> +=09head->disp->func->gsp.vblank_get(head);
> +}
> +
> +static void
> +r535_head_vblank_put(struct nvkm_head *head)
> +{
> +=09head->disp->func->gsp.vblank_put(head);
> +}
> +
> =C2=A0static const struct nvkm_head_func
> =C2=A0r535_head =3D {
> -=09.state =3D gv100_head_state,
> -=09.rgpos =3D gv100_head_rgpos,
> -=09.vblank_get =3D tu102_head_vblank_get,
> -=09.vblank_put =3D tu102_head_vblank_put,
> +=09.state =3D r535_head_state,
> +=09.rgpos =3D r535_head_rgpos,
> +=09.vblank_get =3D r535_head_vblank_get,
> +=09.vblank_put =3D r535_head_vblank_put,
> =C2=A0};
> =C2=A0
> =C2=A0static struct nvkm_conn *
> @@ -1650,12 +1686,17 @@ r535_disp_oneinit(struct nvkm_disp *disp)
> =C2=A0=09if (ret)
> =C2=A0=09=09return ret;
> =C2=A0
> -=09ret =3D nvkm_gsp_intr_stall(gsp, disp->engine.subdev.type,
> disp->engine.subdev.inst);
> +=09/* Chips that raise head-timing interrupts on a separate
> low-latency
> +=09 * vector report it as a second DISP interrupt table entry,
> exposed
> +=09 * as instance 1 by the RM engine-index translation.
> +=09 */
> +=09ret =3D nvkm_gsp_intr_stall(gsp, disp->engine.subdev.type,
> +=09=09=09=09=C2=A0 disp->func->gsp.intr_low_latency ?
> 1 : disp->engine.subdev.inst);
> =C2=A0=09if (ret < 0)
> =C2=A0=09=09return ret;
> =C2=A0
> =C2=A0=09ret =3D nvkm_inth_add(&device->vfn->intr, ret,
> NVKM_INTR_PRIO_NORMAL, &disp->engine.subdev,
> -=09=09=09=C2=A0=C2=A0=C2=A0 tu102_disp_intr, &disp-
> >engine.subdev.inth);
> +=09=09=09=C2=A0=C2=A0=C2=A0 disp->func->gsp.intr, &disp-
> >engine.subdev.inth);
> =C2=A0=09if (ret)
> =C2=A0=09=09return ret;
> =C2=A0
> @@ -1688,6 +1729,7 @@ r535_disp_new(const struct nvkm_disp_func *hw,
> struct nvkm_device *device,
> =C2=A0=09rm->uevent =3D hw->uevent;
> =C2=A0=09rm->sor.cnt =3D r535_sor_cnt;
> =C2=A0=09rm->sor.new =3D r535_sor_new;
> +=09rm->gsp =3D hw->gsp;
> =C2=A0=09rm->ramht_size =3D hw->ramht_size;
> =C2=A0
> =C2=A0=09rm->root.oclass =3D gpu->disp.class.root;

