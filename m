Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D72C5DF97
	for <nouveau@archiver.kernel.org>; Fri, 21 Aug 2026 22:12:35 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6497410F3DC;
	Fri, 21 Aug 2026 22:12:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eVXHc/4r";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2284147AFA;
	Fri, 21 Aug 2026 21:55:57 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787349356;
 b=S2Vy4HI6X/7JO5mSYjE1tUvgCAHGd90WEp3gZgsD1tgTNf/iw/G+ZOn+JiA+AE3VaY6ol
 2gnxROkXpmGsn6qByEYRo0p/hzSsooCTTXsu8ooTV9+RJIqEQSF5WbyA3EqGEKoDTFg+f1Y
 pWvMphZftr0Q84bmuSgkd+7RYwwbB7SYurOWe0ThqOaWuniQqbv94/+o5z20uTxK7i2FZzS
 eAxKcbCL56Xc8PItUlcFGsvVbPZbaaa0ruScXIfrGIwHninOcIT4CvGWIJDGaIujBpN3uzt
 XpQuVUuvvqoqAUaNoVD1hG1jxxwCeGtRuHl8X530Kg0Jp1QKYUo19HY+EzUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787349356; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ZATu8m33dNIkK0AIGWEAmOkLpOfsVEyZx202Lm97Oos=;
 b=RETJuluvcHQIDej7oU3NWJB3fC21cC6eGVhg8U+tOl76kZbr3kO8bUobU323BTv/IMnjq
 x+OftNO/rebIj1DcGE5E9AUn1HnvrqcJywmmkv+wFEeswCQxjlAcN3r3ukksFVML1YvqFh2
 WGUKcEl88anOG5SUZEsIJBd/KW8LFaLhICvOCagm0ixp0TXdI/Cz0HhWoyG0X2BPxra/Fyc
 XYh26ChfpE2RGE4GrlbgT9KJ/XaU8DnBnwAbQViVJwEov4rAgHvYPgvnEiO00JgbDeVqbUO
 R82f3xbFOO37NRxvsVvLrI2Y8ohunBSEJQhq4IGdNy1GI32ZSRegIlYk2ouQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 6634347AE6
	for <nouveau@lists.freedesktop.org>; Fri, 21 Aug 2026 21:55:53 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4E5DA10E37D
	for <nouveau@lists.freedesktop.org>; Fri, 21 Aug 2026 22:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787350350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZATu8m33dNIkK0AIGWEAmOkLpOfsVEyZx202Lm97Oos=;
	b=eVXHc/4r3gt52x0pPddQq2diVsw54RdlVusDSUao5qaJvs1JepZVPm37GYEulKWXDO9FSB
	kkuGVbe52F72WMdbDg3waGl0M2TnYS77AxYCeGx4dd+dG1ecT4CxD8LCQ+LajpJh5jh4W7
	OGsypoyWBlm4jIlHtl9XPRz9ymW6p10=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-6HetbzbhMwegVwhqtXiqMA-1; Fri, 21 Aug 2026 18:12:29 -0400
X-MC-Unique: 6HetbzbhMwegVwhqtXiqMA-1
X-Mimecast-MFC-AGG-ID: 6HetbzbhMwegVwhqtXiqMA_1787350349
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-92e9a2b95b5so264936585a.2
        for <nouveau@lists.freedesktop.org>;
 Fri, 21 Aug 2026 15:12:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787350349; x=1787955149;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I0eUZt+KIoHEj0to+icRP80gEEgroNZ4RZo6TFwXBQ8=;
        b=gBpcfG845z2sAFcyk2O/bYM5XxxKKFEJy9Um8EWpho4laY6+IrOeq/80WuPoKGZf0/
         uqFxiXY3ikIeYaVtXoEg+XXD1Yj3WjqnO7gtDADmZ6jfpNzOUaeCnXn78OMVLTGevcBn
         6lZAncFFeC+ibOdbgf0Dem6MWKTvRamE83p4eW9d/qm2zJdzUPJM20vaq6eVrLTtnYHf
         l1H5suiULc//55KGSAxtU/ddpyfq0ABau2mLjCHBThLUIAq4r5sZ9UhWmVBZ00hMOnU+
         XrMmMSR4VIaprOD7KGjYs9PtP1kwqCtmWcEwPVA1ZtI1exdGrnuupFSQ0uxjN9h8on+O
         Pr+w==
X-Forwarded-Encrypted: i=1;
 AHgh+RqbfbhPZmctX1np45w7qXUGy1wDkUXNpkG88cMutEoNWA+4IYRIYowMG3o50VjyzOntBBo/LvXq@lists.freedesktop.org
X-Gm-Message-State: AFuF++kJWGsRlVqT+Vj9y6oBD72vMo2u8VCyWTZDeX3P8MwSPR+dP2R/
	LToweGJjcFLX5bYkQ13qN9DJp0nFWebM5tTrykhC04r+jnzKYd6P3FY+JHqP2IwbKZU9OslnT3W
	vUgmWD6AgTaQV1vqhhmMA5SjKl6jN1tW+NC5CylHGByXNU8wV+abjl6tpSrQ3Cd60Sgc=
X-Gm-Gg: AR+sD13sdr90n5x1h3HJ57X6eJlnAdlGKqtVIvfu+AdGSjQmk5ZPFunVK7x3hjNp8Ma
	7PLF5J8bT8xDXRuV5G1PCxMD7HZ4iWJLkZE73lgKKC2r7voOXM0CtmYWtHZ2q4lZeq57qLvrYK+
	05bvJlcxMah3OE2a5MoKH1BZXOWeLpZeoUXlAq7qtuHl5uhrGxxQUN64CTcl4dVSMsg/ZJsbRU1
	KzajGr19SWmIc2EYyLzysUiW0Wn+hUuVkfb1m152FAZ9RNzrZVnW1opIn/BVaCKC30OjpVc8DHl
	87WpJbS3EOar80qFHDTGD9vcqwj0HYvp59nhFjqSZzKQwkKAOB5kr6ITbdrO7GzIkhyrCxKq
X-Received: by 2002:ae9:e50d:0:b0:92e:5444:9274 with SMTP id
 af79cd13be357-937395378e7mr667906985a.30.1787350348750;
        Fri, 21 Aug 2026 15:12:28 -0700 (PDT)
X-Received: by 2002:ae9:e50d:0:b0:92e:5444:9274 with SMTP id
 af79cd13be357-937395378e7mr667902985a.30.1787350348297;
        Fri, 21 Aug 2026 15:12:28 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93749da8294sm7974085a.32.2026.08.21.15.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 15:12:27 -0700 (PDT)
Message-ID: <33cd07ffe8f6a9c525f9d9b6d646efbf09cf76e9.camel@redhat.com>
Subject: Re: [PATCH v2 08/10] drm/nouveau/gsp: fix vblank interrupts on GB20x
From: lyude@redhat.com
To: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
	linux-kernel@vger.kernel.org
Date: Fri, 21 Aug 2026 18:12:26 -0400
In-Reply-To: <20260820164929.17117-9-mohamedahmedegypt2001@gmail.com>
References: <20260820164929.17117-1-mohamedahmedegypt2001@gmail.com>
	 <20260820164929.17117-9-mohamedahmedegypt2001@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hPfeX3fmnX09YgUjmLrRGR0LASOkh2T-iU-QHTsafI0_1787350349
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 5TMKIXOGAZ7PHRRHLNHXG35MFSZ75UXA
X-Message-ID-Hash: 5TMKIXOGAZ7PHRRHLNHXG35MFSZ75UXA
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5TMKIXOGAZ7PHRRHLNHXG35MFSZ75UXA/>
Archived-At: 
 <https://lore.freedesktop.org/33cd07ffe8f6a9c525f9d9b6d646efbf09cf76e9.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Some comments regarding both patch #2 and this patch below:


On Thu, 2026-08-20 at 20:49 +0400, Mohamed Ahmed wrote:
> The GSP path programs per-head timing (vblank) interrupts the same
> way on
> every generation. NVD5.0 (GB20x) reworked the FE interrupt frontend
> around four message-based kernel vectors (high latency, low latency,
> PMU,
> and GSP) and moved RM head-timing interrupts to the dedicated low-
> latency
> vector:
>=20
> =C2=A0- The enable is NV_PDISP_FE_RM_INTR_EN1_HEAD_TIMING, 0x611ef0 +
> =C2=A0=C2=A0 head*4 (570.144 kernel_head_0501.c, renamed kernel_head_0502=
.c
> from
> =C2=A0=C2=A0 575.51.02 on, and v05_01 dev_disp.h).
>=20
> =C2=A0- The vector is reported as a separate interrupt table entry,
> =C2=A0=C2=A0 MC_ENGINE_IDX_DISP_LOW (intr_gb202.c, intrCacheDispIntrVecto=
rs).
>=20
> =C2=A0- The vector must be re-armed through NV_PDISP_FE_INTR_RETRIGGER(1)
> =C2=A0=C2=A0 at 0x611f34 after servicing (kdispServiceInterrupt ->
> =C2=A0=C2=A0 kdispIntrRetrigger_v05_01).
>=20
> The event latch (0x611800), per-head status (0x611c00), and dispatch
> summary (0x611ec0) the interrupt handler uses are unchanged on GB20x
> (kheadReadPendingVblank_v03_00 and kheadResetPendingLastData_v03_00
> remain for DISPv0502+).
>=20
> On GB20x the old code enables head timing onto the legacy vector,
> leaves
> its handler there, and never re-arms the message-based vectors. Page
> flips still complete (nv50 sends those events from the commit path),
> so
> the desktop looks fine while DRM vblank waits and vblank sequence
> queries
> are affected.
>=20
> Supply GB20x vblank enables and an interrupt handler that re-arms the
> vector after servicing through gb202_gsp_disp, translate the low-
> latency
> interrupt table entry as a second NVKM_ENGINE_DISP instance, and flag
> the table so r535_disp_oneinit() attaches the handler to that
> instance.
>=20
> Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
> ---
> =C2=A0.../gpu/drm/nouveau/nvkm/engine/disp/gb202.c=C2=A0 | 42
> +++++++++++++++++--
> =C2=A0.../nouveau/nvkm/subdev/gsp/rm/r535/disp.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 5 ++-
> =C2=A0.../drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c |=C2=A0 9 ++++
> =C2=A03 files changed, 52 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gb202.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gb202.c
> index a66c820be9fe..f78669bafd64 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gb202.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gb202.c
> @@ -130,6 +130,40 @@ gb202_head_state(struct nvkm_head *head, struct
> nvkm_head_state *state)
> =C2=A0=09}
> =C2=A0}
> =C2=A0
> +/* NVD5.0 (GB20x and later) moved the RM head-timing interrupt
> enable to
> + * the low-latency vector's EN1 block. The event latch is unchanged.
> + */
> +static void
> +gb202_head_vblank_put(struct nvkm_head *head)
> +{
> +=09struct nvkm_device *device =3D head->disp-
> >engine.subdev.device;
> +
> +=09nvkm_mask(device, 0x611ef0 + (head->id * 4), 0x00000002,
> 0x00000000);
> +}
> +
> +static void
> +gb202_head_vblank_get(struct nvkm_head *head)
> +{
> +=09struct nvkm_device *device =3D head->disp-
> >engine.subdev.device;
> +
> +=09nvkm_wr32(device, 0x611800 + (head->id * 4), 0x00000002);
> +=09nvkm_mask(device, 0x611ef0 + (head->id * 4), 0x00000002,
> 0x00000002);
> +}
> +
> +static irqreturn_t
> +gb202_disp_intr(struct nvkm_inth *inth)
> +{
> +=09struct nvkm_disp *disp =3D container_of(inth, typeof(*disp),
> engine.subdev.inth);
> +=09irqreturn_t ret =3D tu102_disp_intr(inth);
> +
> +=09/* The FE interrupt vectors are message-based on NVD5.0. Re-
> arm the
> +=09 * low-latency vector so it fires again for any event that
> latched
> +=09 * while we were servicing.
> +=09 */
> +=09nvkm_wr32(disp->engine.subdev.device, 0x611f34, 0x00000001);
> +=09return ret;
> +}
> +
> =C2=A0/* GB20x is GSP-only. This table supplies the register programming
> the
> =C2=A0 * GSP-RM display path needs from the chip.
> =C2=A0 */
> @@ -137,11 +171,13 @@ static const struct nvkm_disp_func
> =C2=A0gb202_gsp_disp =3D {
> =C2=A0=09.uevent =3D &gv100_disp_chan_uevent,
> =C2=A0=09.ramht_size =3D 0x2000,
> -=09.gsp.intr =3D tu102_disp_intr,
> +=09/* Head timing arrives on the dedicated low-latency vector.
> */
> +=09.gsp.intr =3D gb202_disp_intr,
> +=09.gsp.intr_low_latency =3D true,
> =C2=A0=09.gsp.head_state =3D gb202_head_state,
> =C2=A0=09.gsp.head_rgpos =3D gv100_head_rgpos,
> -=09.gsp.vblank_get =3D tu102_head_vblank_get,
> -=09.gsp.vblank_put =3D tu102_head_vblank_put,
> +=09.gsp.vblank_get =3D gb202_head_vblank_get,
> +=09.gsp.vblank_put =3D gb202_head_vblank_put,
> =C2=A0=09.gsp.hdmi_gcp =3D gb202_sor_hdmi_gcp,
> =C2=A0=09/* The legacy AVI unit is unchanged on GB20x. */
> =C2=A0=09.gsp.hdmi_infoframe_avi =3D gv100_sor_hdmi_infoframe_avi,
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
> index 3a8ff621ed62..a95f78c4502f 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
> @@ -1705,7 +1705,10 @@ r535_disp_oneinit(struct nvkm_disp *disp)
> =C2=A0
> =C2=A0=09/* Chips that raise head-timing interrupts on a separate
> low-latency
> =C2=A0=09 * vector report it as a second DISP interrupt table entry,
> exposed
> -=09 * as instance 1 by the RM engine-index translation.
> +=09 * as instance 1 by the RM engine-index translation (see
> +=09 * r570_gsp_xlat_mc_engine_idx()). Their high-latency vector
> +=09 * (instance 0) is left unhandled as no event nouveau
> enables is
> +=09 * routed to it, and without a handler it stays masked.
> =C2=A0=09 */

I didn't notice it until I got to this patch, but is it possible you
mistakenly added the intr_low_latency stuff a little early with patch
#2 and meant to add it here?

(doesn't matter to me too much either way, whatever you intended works
fine with me)

Otherwise:

Reviewed-by: Lyude Paul <lyude@redhat.com>

> =C2=A0=09ret =3D nvkm_gsp_intr_stall(gsp, disp->engine.subdev.type,
> =C2=A0=09=09=09=09=C2=A0 disp->func->gsp.intr_low_latency ?
> 1 : disp->engine.subdev.inst);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
> index 3e391646d8f7..b45781cd0dfd 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
> @@ -44,6 +44,15 @@ r570_gsp_xlat_mc_engine_idx(u32 mc_engine_idx,
> enum nvkm_subdev_type *ptype, int
> =C2=A0=09=09*ptype =3D NVKM_ENGINE_DISP;
> =C2=A0=09=09*pinst =3D 0;
> =C2=A0=09=09return true;
> +=09case MC_ENGINE_IDX_DISP_LOW:
> +=09=09/* GB20x+ report a separate low-latency display
> vector, used
> +=09=09 * for head-timing interrupts. Expose it as a second
> DISP
> +=09=09 * interrupt instance. r535_disp_oneinit() attaches
> the
> +=09=09 * handler to it when the chip's
> gsp.intr_low_latency is set.
> +=09=09 */
> +=09=09*ptype =3D NVKM_ENGINE_DISP;
> +=09=09*pinst =3D 1;
> +=09=09return true;
> =C2=A0=09case MC_ENGINE_IDX_CE0 ... MC_ENGINE_IDX_CE19:
> =C2=A0=09=09*ptype =3D NVKM_ENGINE_CE;
> =C2=A0=09=09*pinst =3D mc_engine_idx - MC_ENGINE_IDX_CE0;

