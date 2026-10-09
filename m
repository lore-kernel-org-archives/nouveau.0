Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CEECA9EBB
	for <nouveau@archiver.kernel.org>; Fri,  9 Oct 2026 22:25:36 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B0E081122E4;
	Fri,  9 Oct 2026 22:25:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CSW45Q12";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E120748A3D;
	Fri,  9 Oct 2026 22:07:06 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1791583626;
 b=H9DRm2n38oWEFNvlztn4vOTQ9gBtTDgseal6B+XtxIJWtJPe5lUheu+PxmIFJsMGF+4iX
 +K0ViSTuMFPLpbUlzUxmmj5FgpiNso5q9p3BO+xg72cOi+5ZsGNjKGdGACOKVqz02gVUnOj
 Qd0AUb27r+9zHwwalpuD452DaLcUJAhGFxvWizvj3qCQlADqOFeUxw5EG4fQSbr+HfZE5xt
 tYMUjyftcuQINoJL4ZHSkDQ2x3PsHSwPhs1yrBpeZghlNpmOAR3xFQ1/pGK3KDXSMJnUp7z
 yVGpjev21kIT1bM9QlosYvxZzS1ikbZDfLM6rCvjdYxsDk3oO+AJXtUMG77g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1791583626; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=bK4K6Zwn6uj/JoYpayj3VUrzNvyKqfzTmCHlvOGm9C4=;
 b=DJdYyEh8YeEKZK+f8IS3oQ2mEueo9Y1DZcBdCLe52vc6o/S5WzzbBjEBwNK7kUFR7gVbI
 IxtILH6MtuTkMZrN/dByu1mv2fYR54xVKW9yyp2LhRmT7eFjoUq9ypLzhvC6E8/IEUjCZtb
 LeOy2BSWn6bMxC0pOMRq9VxZV62gsdjyNrOZtuyAu6fyzre/0KjsTkLjJjR1a4OFwyY2Ekl
 uXaWAguMvEznxUObx48IlgcZ2wdXSeXLh2aWqn86BsnundP85fCtKJAKR4N9u/hr3+RsLJm
 KJ+f06XmlzTCnJQsZcnMGbLTUoUUE3L6gM2ORW3ylbDZ6Y99i6DmH19KGhMw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id BC7D748A2D
	for <nouveau@lists.freedesktop.org>; Fri,  9 Oct 2026 22:07:04 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3C2A51122DB
	for <nouveau@lists.freedesktop.org>; Fri,  9 Oct 2026 22:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791584730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bK4K6Zwn6uj/JoYpayj3VUrzNvyKqfzTmCHlvOGm9C4=;
	b=CSW45Q12oNVZAg+6CisK5tEwsqBf4Z2rA0IbcAc+YmbqBMtl+Q6pj1fj6JPkUAMxfnm5D0
	DNdYsjDiTk3vxXq6gefmYWMbSvJDrFtojb8/+hcbcyfQaZPotVc/z+7joM0RTHrdBVCuo8
	VFTTrokZd1FvOcvzPz6ZibUp0PRgc+I=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-522-rvlIXHVeN-u5se0TZUzu-g-1; Fri, 9 Oct 2026 22:25:28 +0000
X-MC-Unique: rvlIXHVeN-u5se0TZUzu-g-1
X-Mimecast-MFC-AGG-ID: rvlIXHVeN-u5se0TZUzu-g_1791584727
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-3a998bcf6afso1298821fa.0
        for <nouveau@lists.freedesktop.org>;
 Fri, 09 Oct 2026 15:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791584727; x=1792189527;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bK4K6Zwn6uj/JoYpayj3VUrzNvyKqfzTmCHlvOGm9C4=;
        b=bvQa+4w+1s0GcOT3zb7RwNRMyMvYmg++HBLZJ/etJv05bi5+qoZmpFKYRQQ+kkW8fk
         WhfJU75gJtJ8BqWh093JF+wUz52DdXc+azO+i2FIfwC3IUtipWY/vU22dDJp0UTrIiJC
         +iPdzgox9Fp980HbN9Np+RYCUqckb4yRuTlizwQRrvwOcCjMWE0iT6r1WbGkYR4BQ2l6
         LOayvSRg46OGLwbT98KUCycL1H0ZiymUgooH6Y+L8Ef9oXWyQ0Wo7KSVaVKJU4O5xOqe
         zJjlZsKF6B/pqFXHQzeftVICF+k0d0BKb5U7QA+847nSUDeZkw41qSmviP5RJaHE6I6P
         w6qg==
X-Forwarded-Encrypted: i=1;
 AKwUvBz7ZndLr7KJoebhalYRl3SJ+djRboslpYaM+RRu47rD3bfrRtRWeojtPkp/0ycb22RBNvIMt/b5@lists.freedesktop.org
X-Gm-Message-State: AFq9FYKOV1iWC315UTZpFohn6Tpi46sd8+kXbsuka/UjI9d/oZdg7kAe
	fFqqVzsYlaa3Hckmgd2h3+60IUtMaU8kLg4QVy/mA9RvDewk1Hl/HjiXhjhj4HG7ZR8J/t5bSE5
	xu0Dl6ldhz/3YW7NgYQ/J1+KJZV7SLK32/MKtbP8huTyB5C1T8qYZrnzUFGJNRnJYph8=
X-Gm-Gg: AYBFou1For4FPDQSlBUUvZgaIn9kxKbhFPIWIC8AbAue/NesQo5FVs0UWCtflEoLC7i
	nziZOzXgOFapvL3i6ImD1nIOHr1elscziPHikRkzzrMrYA8KKl8B1NtTM51mCFpRlGgv3JwJgKN
	WkOBCE0DdbFATlMJqXxdyrQ4zL6S0BlyEbc0hJQEGmYYAVk0jZFsb1FU0uy8BZITPOFSys2t0FI
	/GmBu+lmGrV+mbdyoBe4jbjE02yjmZpv0sAG+igqx5lk3jwnaf2o+g9ND6N4B7mrerbveVyw/HB
	O0NOeJTt620LHTBlHPuV4ByVwwQph5DPBSm4jiB8Z8EF2deYOog1CBBrp0z+WyfzFrLHqXQ=
X-Received: by 2002:a05:651c:1510:b0:3a9:a07b:7448 with SMTP id
 38308e7fff4ca-3a9c2b34b4bmr8879361fa.19.1791584727361;
        Fri, 09 Oct 2026 15:25:27 -0700 (PDT)
X-Received: by 2002:a05:651c:1510:b0:3a9:a07b:7448 with SMTP id
 38308e7fff4ca-3a9c2b34b4bmr8879291fa.19.1791584726867;
        Fri, 09 Oct 2026 15:25:26 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3a9c3c9af97sm9864011fa.14.2026.10.09.15.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 15:25:26 -0700 (PDT)
Message-ID: <80477cda2bee82a656b866fea09b964ca9e0b955.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/kms: defer window LUT disable until the
 image update
From: lyude@redhat.com
To: Solom Tamawy <solom@solom.dev>, nouveau@lists.freedesktop.org
Date: Fri, 09 Oct 2026 18:25:24 -0400
In-Reply-To: 
 <CACbN=AsQdd1GsAA1FpNMZCrd4YNHidX_dQ1CmBW4zYUnHbrioQ@mail.gmail.com>
References: 
 <CACbN=AsQdd1GsAA1FpNMZCrd4YNHidX_dQ1CmBW4zYUnHbrioQ@mail.gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vToT1B-ZfQy4UnHmGHHJW9pPSWlS409tShllrWLbgJs_1791584727
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: QOR5ZRYLTQCAR5P3IFJYRV6ZIRRLQ4UN
X-Message-ID-Hash: QOR5ZRYLTQCAR5P3IFJYRV6ZIRRLQ4UN
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Danilo Krummrich <dakr@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QOR5ZRYLTQCAR5P3IFJYRV6ZIRRLQ4UN/>
Archived-At: 
 <https://lore.freedesktop.org/80477cda2bee82a656b866fea09b964ca9e0b955.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

JFYI - I will review this patch soon, but I'm currently waiting on
getting the information I need from elsewhere to actually decode the
NvDisplay error here just to double check that this fix makes sense.

On Sat, 2026-10-03 at 17:41 -0700, Solom Tamawy wrote:
> A modeset on one head can set flush_disable for the entire atomic
> commit while another window changes from an integer framebuffer to
> FP16 without a modeset. The latter sets clr.xlut and set.image, but
> not clr.image.
>=20
> nv50_wndw_flush_clr() clears that window's ILUT before the
> intermediate
> disable UPDATE, leaving the old integer image enabled without its
> LUT.
> The new FP16 image is only programmed later in nv50_wndw_flush_set().
> On hardware that uses the ILUT to convert integer input to the
> internal
> FP16 pipeline, the intermediate state is invalid.
>=20
> This ordering defect was found while investigating a Plasma login
> hang
> on GB205 after atomic modesetting became enabled by default. The
> failure
> logs contained window UPDATE exceptions followed by a core notifier
> timeout:
>=20
> =C2=A0=C2=A0 gsp: Xid:56 CMDre 00000001 00000200 00000001 00000005 000000=
2d
> =C2=A0=C2=A0 gsp: Xid:56 CMDre 00000005 00000200 00000001 00000005 000000=
2d
> =C2=A0=C2=A0 drm: core notifier timeout
>=20
> Defer the LUT clear until the image update when the old image remains
> enabled across a separate disable UPDATE. The LUT clear and new image
> then take effect together. Keep early clears for windows whose images
> are disabled and preserve the path without a separate disable UPDATE.
> Pass flush_disable explicitly to the set phase, since the new plane
> state's atomic-state backpointer is cleared during state swap.
>=20
> Fixes: ebf8ca6b3d6d ("drm/nouveau/kms/nv50-: disable input lut
> harder")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Solom Tamawy <solom@solom.dev>
> ---
> Based on linux-next f0406245cb9855e6318335a8a223551354291a46
> (next-20261002). This is the functional fix only; atomic modesetting
> remains enabled and the advertised formats are unchanged.
>=20
> Testing:
> - A focused C harness extracts the actual pristine and patched flush
> =C2=A0=C2=A0 helpers and models two heads at each UPDATE boundary. The pr=
istine
> =C2=A0=C2=A0 helpers fail the mixed-head integer-to-FP16 case; the patche=
d
> helpers
> =C2=A0=C2=A0 pass all 14 cases. The model is not a full GPU simulator.
> - Nouveau built against the matching kernel configuration and headers
> =C2=A0=C2=A0 with successful modpost and BTF generation and no build warn=
ings.
> - I successfully logged into Plasma Wayland on RTX 5070
> =C2=A0=C2=A0 (GB205), with three NVIDIA DP displays, amdgpu active on the
> integrated
> =C2=A0=C2=A0 GPU, and a CalDigit TS5 Plus dock connected before login. No
> atomic=3D0
> =C2=A0=C2=A0 override or USB/PCIe/Thunderbolt PM workarounds were present=
. The
> =C2=A0=C2=A0 expected patched module was loaded, and the I confirmed a
> =C2=A0=C2=A0 successful DRM_CLIENT_CAP_ATOMIC=3D1 capability probe. No Xi=
d or
> core
> =C2=A0=C2=A0 notifier timeout appeared in this boot.
>=20
> =C2=A0 drivers/gpu/drm/nouveau/dispnv50/disp.c |=C2=A0 2 +-
> =C2=A0 drivers/gpu/drm/nouveau/dispnv50/wndw.c | 13 ++++++++++++-
> =C2=A0 drivers/gpu/drm/nouveau/dispnv50/wndw.h |=C2=A0 4 ++--
> =C2=A0 3 files changed, 15 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index e91130f93db6..b7022a9b6e6f 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -2351,7 +2351,7 @@ nv50_disp_atomic_commit_tail(struct
> drm_atomic_commit *state)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (!asyw->clr.mask || atom->=
flush_disable))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 co=
ntinue;
>=20
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 nv50_wndw_flush_set(wndw, interlock, asyw);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 nv50_wndw_flush_set(wndw, interlock,
> atom->flush_disable, asyw);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Flush update. */
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> index 74eb1dfcc043..ac59219e162a 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> @@ -137,6 +137,14 @@ nv50_wndw_flush_clr(struct nv50_wndw *wndw, u32
> *interlock, bool flush,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 union nv50_wndw_atom_mas=
k clr =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 .mask =3D asyw->clr.mask & ~(flush ? 0 : asyw-
> >set.mask),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* A different head can require a s=
eparate disable update
> while this
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * window only changes format.=
 Keep its LUT enabled for the
> old
> image
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * until the new image is prog=
rammed: integer formats require
> an
> ILUT.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (flush && !clr.image && asyw->se=
t.image)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 clr.xlut =3D false;
> +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (clr.sema ) wndw->fun=
c-> sema_clr(wndw);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (clr.ntfy ) wndw->fun=
c-> ntfy_clr(wndw);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (clr.xlut ) wndw->fun=
c-> xlut_clr(wndw);
> @@ -147,7 +155,7 @@ nv50_wndw_flush_clr(struct nv50_wndw *wndw, u32
> *interlock, bool flush,
> =C2=A0 }
>=20
> =C2=A0 void
> -nv50_wndw_flush_set(struct nv50_wndw *wndw, u32 *interlock,
> +nv50_wndw_flush_set(struct nv50_wndw *wndw, u32 *interlock, bool
> flush,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct nv50_wndw_atom *asy=
w)
> =C2=A0 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (interlock[NV50_DISP_=
INTERLOCK_CORE]) {
> @@ -157,6 +165,9 @@ nv50_wndw_flush_set(struct nv50_wndw *wndw, u32
> *interlock,
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (asyw->set.sema ) wnd=
w->func->sema_set (wndw, asyw);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (asyw->set.ntfy ) wnd=
w->func->ntfy_set (wndw, asyw);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Apply a deferred LUT disable tog=
ether with the new image.
> */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (flush && asyw->clr.xlut && !asy=
w->clr.image && asyw-
> >set.image)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 wndw->func->xlut_clr(wndw);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (asyw->set.image) wnd=
w->func->image_set(wndw, asyw);
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (asyw->set.xlut ) {
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.h
> b/drivers/gpu/drm/nouveau/dispnv50/wndw.h
> index 7bd8bcc199db..b0b1b10cf782 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/wndw.h
> +++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.h
> @@ -40,8 +40,8 @@ int nv50_wndw_new_(const struct nv50_wndw_func *,
> struct drm_device *,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const u32 *format, u32 heads,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum nv50_disp_interlock_type, u=
32
> interlock_data,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct nv50_wndw **);
> -void nv50_wndw_flush_set(struct nv50_wndw *, u32 *interlock,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct n=
v50_wndw_atom *);
> +void nv50_wndw_flush_set(struct nv50_wndw *wndw, u32 *interlock,
> bool
> flush,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct n=
v50_wndw_atom *asyw);
> =C2=A0 void nv50_wndw_flush_clr(struct nv50_wndw *, u32 *interlock, bool
> flush,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 struct nv50_wndw_atom *);
> =C2=A0 void nv50_wndw_ntfy_enable(struct nv50_wndw *, struct
> nv50_wndw_atom *);
>=20
> base-commit: f0406245cb9855e6318335a8a223551354291a46

