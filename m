Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E41C5CFC1
	for <nouveau@archiver.kernel.org>; Tue, 11 Aug 2026 21:27:07 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 606D010E398;
	Tue, 11 Aug 2026 21:27:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="c2F2SqeJ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 57F55476E6;
	Tue, 11 Aug 2026 21:10:50 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786482650;
 b=Fm/nIehjks6X6PGNe2eFJfKs54Xw2by2FO1Mo04Hd/oKW+GlKGdlTqNIC7jqT6LWT9ijR
 85tUXqPgGbY/XLYvTH/+zm7oY0oc4YrszQHTABxbvYEXYiSkcB9LI2uMY5ht1F7hKY0RPcB
 4JPBUueCfJclgZZHLtbNMrGFepLyxcbVriy8o7YErm+V2nQO2V/plNZtQS3JpylSB4G36ea
 TLPnoWBu1gOfzbP9pldr9LGDy2chfIWlgXL66gK3ATEcu1fiPrzqGUomHLlDyWL2clS2dM0
 aRYlOgDJGo0t+myYhiWPBFRPdnw1QlDaZMCJjuX2VqMErEc5SWL2+Ezh7DLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786482650; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=VyjTfJ6M6WhikLFiddpAGC6DAl6KdSUSHU1hQ6sGp+U=;
 b=jqpahDmsL4YwdDUGzK3guIRtTHkwuFDc0Aa6XOIc8BGOJAACDA5sc4OkmNiyav8mjoQtW
 8EK0AYrbZrxnsl/GSBMKupIbfJ/5bvzHLiOmSjUThkEZs1rSNemgezV7qoTtvhVSthasEKJ
 85JtQ28xR3jsNuBu0zVz5+AwYmlN9Wu3igZRubfiJqRYZj6r/rvsm8n+OM5BWvByFl6unfI
 vf2YIA0q9BngRgLljvEz0+/yQam0Np0PSB/eu3LTpcc8+mbPeMJy7YrkiNU3yOXQi7Fjqpi
 si1F6yqZjISjPQjE4S1ZmgP6WNGqKejJrvFZENSayOWwkZUpMPJSHdms2blA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 80FF04767F
	for <nouveau@lists.freedesktop.org>; Tue, 11 Aug 2026 21:10:47 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 29AC710E263
	for <nouveau@lists.freedesktop.org>; Tue, 11 Aug 2026 21:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786483622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VyjTfJ6M6WhikLFiddpAGC6DAl6KdSUSHU1hQ6sGp+U=;
	b=c2F2SqeJBjBuTqgCP8FHmHO73V0kc1cuRjJY+568JAEgIFnwkAG+ENxSPmHsIK+RRdZBWv
	y89+MRtnwr0yUsTT2H7C55XuUKGUb745Jb2FuIabiw4zWAsqT/pU97e9LuVJb07Qc6epfo
	EtH1sTleuTP7ARFdNWTc+xVRKk3OQVk=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-3-iiZ07COnOS2DHxpnd5dw-1; Tue, 11 Aug 2026 17:27:01 -0400
X-MC-Unique: 3-iiZ07COnOS2DHxpnd5dw-1
X-Mimecast-MFC-AGG-ID: 3-iiZ07COnOS2DHxpnd5dw_1786483621
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51c20762d21so5626611cf.0
        for <nouveau@lists.freedesktop.org>;
 Tue, 11 Aug 2026 14:27:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786483621; x=1787088421;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rTYFSNNmHE5Ej6nfI5EPC0KoXgMH1Yho7tZYF93ZSko=;
        b=pcUyb5ila4mMGVtT7o8mw0+hbEf7aNH+ip3xqTpy++yptQI2pLaaTIayaOBX0fq+eJ
         ARPYVRjjfa8m2lessE/Q6Ez1UT5LmNRNVaPpS6fYQTwRFZtIYBha5VQZkebDRDF6kuCv
         q6HHQlkIKRkXR4Y834liSjn+tsjQ4Dm7KZkom5mjwEbGfkhVpSY6PeSOxhtXVLsHkXOK
         85EYmqeXAqHDPkUD3lpR1jTOoydOa6pI0Uo5IpQaVCiDWkn7wVKOlnYLbyWEbtUyGmoE
         8U2KEFdN1AjTDGCN/PqBfp+GoLBoiEA8Zuz1/M0+ijlwHGrZHPYLf7gyHditg1KNWCCi
         4WOg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqm2qYRCdhisdOmEMKBivKaYsKDJ9v6IeidUvRJupkzrmWMAw942oezc2NJNwdcvDuXFnKTUYqj@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJO/i91YtEPRo/67ClD6ItHs75P1Hf0nhj34QKjkT/wskw+sWm
	Ivl/G1A4BDcBSMUKU+9E6ZfyMBMZj7e3EQFTOSpqT3JUVyh9SkGrUbeIRuuAUoAyimSs4tzMt6P
	LkYZXDU4CHHAOlvK/+x7tqQU69E+NuVYyv5VOqXJYIxtEQv47PNPnEW/6QbMvCmS1R04=
X-Gm-Gg: AR+sD13jinK4R2dSgoLQIWPrcD0DXP806ZDPkQuzjPLIwyesnLHTMBQ10/VEv60c9kA
	Rn+9rcn+O9fG2j77J+6scn9j1kHjNfFVWEIriN55+F0TpHBRwClTO8aYIvR3VU49jbxDquhADBn
	axoLXemvvqjag8mh+tpSBA84uzsgMPmPTBtgY3R5b9QvjC/f+HyIfXluMbN1nLB8klD7p9kw4XC
	1aam02zoi63cjxEpfbiTUPBwYQB7NDcP21rieTmE4ejBRgVFgP/omwvGMkUu4ADOEV4lPHLafIk
	+OYixOfpVHRjKRMF6alp0gGcEr3GQACE+KLAbPt8WgbMrdPusFTrXYw3UqxGuR1SUwgmJqHk
X-Received: by 2002:a05:622a:1cc7:b0:521:934c:bcf with SMTP id
 d75a77b69052e-52d64838801mr2843911cf.41.1786483620647;
        Tue, 11 Aug 2026 14:27:00 -0700 (PDT)
X-Received: by 2002:a05:622a:1cc7:b0:521:934c:bcf with SMTP id
 d75a77b69052e-52d64838801mr2843391cf.41.1786483620229;
        Tue, 11 Aug 2026 14:27:00 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-52d61d91199sm4729021cf.14.2026.08.11.14.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 14:26:59 -0700 (PDT)
Message-ID: <3449a374543614d15655576d13d87c3822e29896.camel@redhat.com>
Subject: Re: [PATCH v2 1/3] drm/nouveau/uvmm: fix NULL deref unwinding an
 OP_MAP_SPARSE op
From: lyude@redhat.com
To: Zhenhao Wan <whi4ed0g@gmail.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann	 <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter	 <simona@ffwll.ch>, Dave Airlie
 <airlied@redhat.com>
Date: Tue, 11 Aug 2026 17:26:58 -0400
In-Reply-To: <20260811-nouveau-uvmm-vmbind-fixes-v2-1-aaee4b395d04@gmail.com>
References: <20260811-nouveau-uvmm-vmbind-fixes-v2-0-aaee4b395d04@gmail.com>
	 <20260811-nouveau-uvmm-vmbind-fixes-v2-1-aaee4b395d04@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rJSxtfdKjFOq-aL9CTtMePwxaSDWB-xXUf8MGzZ6EMM_1786483621
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 6FVRKAHXVRWBW24YNCLMLTL4JX65FAX2
X-Message-ID-Hash: 6FVRKAHXVRWBW24YNCLMLTL4JX65FAX2
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Yuhao Jiang <danisjiang@gmail.com>,
 stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/6FVRKAHXVRWBW24YNCLMLTL4JX65FAX2/>
Archived-At: 
 <https://lore.freedesktop.org/3449a374543614d15655576d13d87c3822e29896.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Tue, 2026-08-11 at 16:46 +0800, Zhenhao Wan wrote:
> Each bind_job_op is zeroed by kzalloc_obj() in
> bind_job_op_from_uop(),
> and the OP_MAP_SPARSE case in nouveau_uvmm_bind_job_submit() only
> creates
> a region, so op->ops stays NULL for a successfully processed sparse
> map.
>=20
> If a later op in the same job fails, the reverse unwind loop revisits
> that
> op and calls drm_gpuva_ops_free(&uvmm->base, op->ops)
> unconditionally.
> drm_gpuva_ops_free() dereferences its argument right away
> (list_for_each_entry_safe on &ops->list), so a NULL op->ops oopses.
> The
> path is reachable by any render-node fd holder, since NOUVEAU_VM_BIND
> is
> DRM_RENDER_ALLOW.
>=20
> Guard the free with IS_ERR_OR_NULL(), as
> nouveau_uvmm_bind_job_cleanup()
> already does for the identical free.
>=20
> Fixes: b88baab82871 ("drm/nouveau: implement new VM_BIND uAPI")
> Reported-by: Yuhao Jiang <danisjiang@gmail.com>
> Assisted-by: Claude:claude-opus-5
> Cc: stable@vger.kernel.org
> Signed-off-by: Zhenhao Wan <whi4ed0g@gmail.com>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_uvmm.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> index 36445915aa58..849bf42c124e 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> @@ -1489,7 +1489,8 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job
> *job,
> =C2=A0=09=09=09break;
> =C2=A0=09=09}
> =C2=A0
> -=09=09drm_gpuva_ops_free(&uvmm->base, op->ops);
> +=09=09if (!IS_ERR_OR_NULL(op->ops))
> +=09=09=09drm_gpuva_ops_free(&uvmm->base, op->ops);
> =C2=A0=09=09op->ops =3D NULL;
> =C2=A0=09=09op->reg =3D NULL;
> =C2=A0=09}

