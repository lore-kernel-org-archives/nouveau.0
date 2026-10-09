Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3CF8CA9EBB
	for <nouveau@archiver.kernel.org>; Fri,  9 Oct 2026 22:19:34 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A19B51122DD;
	Fri,  9 Oct 2026 22:19:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="D8dhZf0Q";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CFAA048A36;
	Fri,  9 Oct 2026 22:01:05 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1791583265;
 b=nGwl2x7wvMNs++HUzO4gOUr8gdIoZITM4i1oMqfKL+2J3oXr4+djYmL4ULTk3u9wZALk+
 2Wxux/hvR2Mtp1nrTeA9+9f6lQqhgqnDE1uchFYcatvtz0cVvsM5aO5ghgPERTFnHR0CHiD
 Y8atAnyhSVkOyBrT6tElBM7JMlUGi5PB4ZenU/RG0X0Sqeg7nrlhp+EAitsxh+pHd2L5+Kx
 iReLiy2ODXubh+iS2OFa1LOe0G9jdu+tgCeN787YNAwQFPUbScEewJeTRil8a6dpYS/FwRX
 JS+kSRgYAF1DybKGbdbyq1n4775yW9AgTjbCFP7m/VNBtu0Djb7V/oqgIGug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1791583265; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=lAbXSNEHNzrqTsqJVgNOfkNx2k093dnekJ7TxlCcf9Y=;
 b=EBt4VVWuXo4yw1B33yTT+7F0Uk1BfepaubOLFeNRSar1fF9NMDnCYjKKndLdPrAOWWNb4
 8rLwsMdkfw810mPNV4HDtOvZVWbcwEucyJpdyTrSzmz04D/M3s8giPxskTzWtqJNe2H6D6N
 lj73LqfUrNjv7/JiCc3EnqGaAh0TharqmDzhy+IDlYmVE132wkxXB0wQOrwsK4+yPU+hS6p
 p7dOclYcg8K4ANdd2AfdLpy4Wyyy2Zik0hQFL03bptSrzzpiLfn2qyx5ocXqh+/10GR+5C2
 ls9Uvd0KrbMx7Dw4xKS4IVXeCubJx/iolzchLi+qysBHtUNmsiEpAFkICI7A==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 162D648A14
	for <nouveau@lists.freedesktop.org>; Fri,  9 Oct 2026 22:01:03 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 75BF110EB6E
	for <nouveau@lists.freedesktop.org>; Fri,  9 Oct 2026 22:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791584368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lAbXSNEHNzrqTsqJVgNOfkNx2k093dnekJ7TxlCcf9Y=;
	b=D8dhZf0QpQJWQRa1xoJ1Nrw9fAlSih8suFAhF2+Aq+Ax7KMOJWIDLccU0EHhtukkno5y6E
	gBc/dq0AiDjnMnIY6XBSaSw4ekiZnoNfx+0RExl5U9QjfTjcIVohr4BDGqbnGXa1zU8HXQ
	Sv2RxxD+UKQXh+K5galLBvlkdWwfoSs=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-286-n2r5SzypN_K-n3nUWDKEyg-1; Fri, 9 Oct 2026 22:19:25 +0000
X-MC-Unique: n2r5SzypN_K-n3nUWDKEyg-1
X-Mimecast-MFC-AGG-ID: n2r5SzypN_K-n3nUWDKEyg_1791584365
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-9179d9cde17so3628136d6.0
        for <nouveau@lists.freedesktop.org>;
 Fri, 09 Oct 2026 15:19:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791584365; x=1792189165;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/9KqQUhlnxO9tnxirSVybe3jxd+G2c4sf1QFVpuAgNA=;
        b=sn2n1SO7UUy060wcslMJ04E3XmobDvKry2vMIoUakp99yquvewGfNAnokRtJlEqX/z
         CXQogn1FX4d6zQsUaWVQLskEvMz7NmzlRyizTN597jGIIW4ZTyZMxowtAsCanEvtXTyi
         MCG6dR/hajRTP2VSlQ7ANaaBty53ypi9UOntgkhij1IV0yJgAKwUxlh7vArG+bub7eSN
         powGVdLhzHyZRexYS8bBITWYhnopBcszwbDKH1KbVqKHFZn4foGfuX/ynJKiMyoUUg0m
         BF7VdJX7D4kKz6TftXACgt9jUgyqTaIkhJDbMHs/Anw4BSpohrVY44hYcwOb5h0NC2D8
         Xi0Q==
X-Forwarded-Encrypted: i=1;
 AKwUvByekf6LOPpWXTSDQVH9+Q2vzp5SHXq1mcKAwRTHDRzaZPuKFy7vYxO9wHKwvI0xIwmUzDD39LHk@lists.freedesktop.org
X-Gm-Message-State: AFq9FYIQQuckgc7p/dOSWk4VswZr9BiRnZMxr81/CmVGhOj9zOab+xmr
	5YL39nOcG33fWrYcrQvNEOXgDwSWOs8XQrp2Cdw5wUxBi1PR9/KxzmGOi7DTgSCfxhkEVxYDCRw
	VpEjWaiamwG1qL1T8T+doWNUUzKslgYl+5zT4cQOcUn3/xC7aTk8zok2Nm0NwYKrqLLw=
X-Gm-Gg: AYBFou0vrAwFRePGh7Cho6PWnFE1uZsGN9bTIxGOm8GBP2QPNvyBj/Afb2AnUr3peBw
	0NRJL6e+0SODnbAeDULHJgUgYWUo9OZV3wfR2PHHqwSMgUczd0yIgWy/5uSdVKN2PXcmOEHVTra
	5DrBOXhZFg2e0RTd8BekMZ0AyysXNEKqmJmg+ksq5UHpiLON678S4FvzFpdVYJFWq68BlEBszM/
	25j/kiGsmOPxZZJqLlJ5O6f9Vl2ErU0FIIKiVYifq6zhhF6dkBuv42vhBMQ0gCoEt5ShzSL2mo+
	LiocvoGrRWZPh2c4wKRzdGSNs0MmS4nvvIpvjXGxSTNqdTvoeX6K8N2rIYZnm9K7RY9Eqms=
X-Received: by 2002:ad4:5aa6:0:b0:914:4c57:5108 with SMTP id
 6a1803df08f44-91b554ea694mr60160536d6.16.1791584364501;
        Fri, 09 Oct 2026 15:19:24 -0700 (PDT)
X-Received: by 2002:ad4:5aa6:0:b0:914:4c57:5108 with SMTP id
 6a1803df08f44-91b554ea694mr60159926d6.16.1791584363944;
        Fri, 09 Oct 2026 15:19:23 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91b5504e3d1sm29155796d6.23.2026.10.09.15.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 15:19:23 -0700 (PDT)
Message-ID: <9041ce7f5d6ae30213aa1ab895a4225fb33246ed.camel@redhat.com>
Subject: Re: [PATCH v2] drm/nouveau/uvmm: reject replace across page sizes
From: lyude@redhat.com
To: moonafterrain@outlook.com, Danilo Krummrich <dakr@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann	 <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter	 <simona@ffwll.ch>, Andrew Morton
 <akpm@linux-foundation.org>, Balbir Singh	 <balbirs@nvidia.com>, Mary
 Guillemard <mary@mary.zone>, Mohamed Ahmed	
 <mohamedahmedegypt2001@gmail.com>, James Jones <jajones@nvidia.com>
Date: Fri, 09 Oct 2026 18:19:22 -0400
In-Reply-To: <20261009-nouveau-fixes-v2-1-a0b71bf8df1b@outlook.com>
References: <20261009-nouveau-fixes-v2-1-a0b71bf8df1b@outlook.com>
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2u2m5m9mm5-DLxPgoGLOKfNWzij7wDzGpg3ORki0xOQ_1791584365
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: D6P2WTAOFM6WQYU6752B2IYJYZY4IEEQ
X-Message-ID-Hash: D6P2WTAOFM6WQYU6752B2IYJYZY4IEEQ
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/D6P2WTAOFM6WQYU6752B2IYJYZY4IEEQ/>
Archived-At: 
 <https://lore.freedesktop.org/9041ce7f5d6ae30213aa1ab895a4225fb33246ed.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Looks good to me, will push to drm-misc-fixes in a moment.

On Fri, 2026-10-09 at 16:52 +0800, Junrui Luo via B4 Relay wrote:
> From: Junrui Luo <moonafterrain@outlook.com>
>=20
> A new mapping takes over the page tables of the mappings it replaces.
> nouveau_uvmm_sm_prepare() only acquires page tables for the range no
> existing mapping covers, and the map path frees the replaced mappings
> without putting their references. That is only valid while all of
> them
> use the same page size, which select_page_shift() no longer
> guarantees.
>=20
> Rebinding a GART BO over a 2MiB VRAM BO therefore leaves the new
> mapping
> owning page tables built for a different page size, and it then maps
> at a
> size that was never referenced over that range. Since raw map does
> not
> allocate, nvkm_vmm_iter() can walk down to a NULL leaf and
> dereference
> it. The remainders of a split have the same problem: op_map_prepare()
> recomputes a page size with select_page_shift() while the remainder
> keeps
> the parent's page tables, so a parent that was itself downgraded can
> leave
> a remainder that re-aligns to a larger size. This happens on the
> unmap
> path too.
>=20
> Reject the bind, and make split remainders inherit the page size of
> the
> mapping they are split from.
>=20
> Fixes: c488a94e7e14 ("drm/nouveau/uvmm: Allow larger pages")
> Reported-by: Yuhao Jiang <danisjiang@gmail.com>
> Assisted-by: LLM
> Cc: stable@vger.kernel.org
> Signed-off-by: Junrui Luo <moonafterrain@outlook.com>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> ---
> Changes in v2:
> - Drop patch 1, which has been merged.
> - Use the abbreviated conditional operator for page_shift (Lyude
> Paul).
> - Compare against remap_args.page_shift (Lyude Paul).
> - Use Assisted-by: LLM (Balbir Singh).
> - Add Lyude's Reviewed-by.
> - Link to v1:
> https://lore.kernel.org/r/20260817-nouveau-fixes-v1-0-f518d0c735f3@outloo=
k.com
> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_uvmm.c | 32
> +++++++++++++++++++++++++++++++-
> =C2=A01 file changed, 31 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> index f5e4756b4de4..aa5b93808f41 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> @@ -85,6 +85,8 @@ struct uvmm_map_args {
> =C2=A0=09u64 addr;
> =C2=A0=09u64 range;
> =C2=A0=09u8 kind;
> +=09/* Page size to give the new mapping, or 0 to derive it from
> the op. */
> +=09u8 page_shift;
> =C2=A0};
> =C2=A0
> =C2=A0static int
> @@ -655,7 +657,7 @@ op_map_prepare(struct nouveau_uvmm *uvmm,
> =C2=A0
> =C2=A0=09uvma->region =3D args->region;
> =C2=A0=09uvma->kind =3D args->kind;
> -=09uvma->page_shift =3D select_page_shift(uvmm, op);
> +=09uvma->page_shift =3D args->page_shift ?:
> select_page_shift(uvmm, op);
> =C2=A0
> =C2=A0=09drm_gpuva_map(&uvmm->base, &uvma->va, op);
> =C2=A0
> @@ -684,8 +686,20 @@ nouveau_uvmm_sm_prepare(struct nouveau_uvmm
> *uvmm,
> =C2=A0=09struct drm_gpuva_op *op;
> =C2=A0=09u64 vmm_get_start =3D args ? args->addr : 0;
> =C2=A0=09u64 vmm_get_end =3D args ? args->addr + args->range : 0;
> +=09u8 map_page_shift =3D 0;
> =C2=A0=09int ret;
> =C2=A0
> +=09/* A new mapping takes over the page tables of the mappings
> it replaces,
> +=09 * so every one of them has to be using its page size. The
> new mapping
> +=09 * is the last op drm_gpuvm_sm_map_ops_create() emits.
> +=09 */
> +=09if (args) {
> +=09=09struct drm_gpuva_op *last =3D drm_gpuva_last_op(ops);
> +
> +=09=09if (last->op =3D=3D DRM_GPUVA_OP_MAP)
> +=09=09=09map_page_shift =3D select_page_shift(uvmm,
> &last->map);
> +=09}
> +
> =C2=A0=09drm_gpuva_for_each_op(op, ops) {
> =C2=A0=09=09switch (op->op) {
> =C2=A0=09=09case DRM_GPUVA_OP_MAP: {
> @@ -713,11 +727,22 @@ nouveau_uvmm_sm_prepare(struct nouveau_uvmm
> *uvmm,
> =C2=A0=09=09=09struct uvmm_map_args remap_args =3D {
> =C2=A0=09=09=09=09.kind =3D uvma_from_va(va)->kind,
> =C2=A0=09=09=09=09.region =3D uvma_from_va(va)->region,
> +=09=09=09=09/* The remainders of the split keep
> the page
> +=09=09=09=09 * tables of the mapping they are
> split from,
> +=09=09=09=09 * so they must keep its page size
> too.
> +=09=09=09=09 */
> +=09=09=09=09.page_shift =3D uvma_from_va(va)-
> >page_shift,
> =C2=A0=09=09=09};
> =C2=A0=09=09=09u64 ustart =3D va->va.addr;
> =C2=A0=09=09=09u64 urange =3D va->va.range;
> =C2=A0=09=09=09u64 uend =3D ustart + urange;
> =C2=A0
> +=09=09=09if (map_page_shift &&
> +=09=09=09=C2=A0=C2=A0=C2=A0 remap_args.page_shift !=3D map_page_shift)
> {
> +=09=09=09=09ret =3D -EINVAL;
> +=09=09=09=09goto unwind;
> +=09=09=09}
> +
> =C2=A0=09=09=09op_unmap_prepare(r->unmap);
> =C2=A0
> =C2=A0=09=09=09if (r->prev) {
> @@ -756,6 +781,11 @@ nouveau_uvmm_sm_prepare(struct nouveau_uvmm
> *uvmm,
> =C2=A0=09=09=09u64 uend =3D ustart + urange;
> =C2=A0=09=09=09u8 page_shift =3D uvma_from_va(va)-
> >page_shift;
> =C2=A0
> +=09=09=09if (map_page_shift && page_shift !=3D
> map_page_shift) {
> +=09=09=09=09ret =3D -EINVAL;
> +=09=09=09=09goto unwind;
> +=09=09=09}
> +
> =C2=A0=09=09=09op_unmap_prepare(u);
> =C2=A0
> =C2=A0=09=09=09if (!args)
>=20
> ---
> base-commit: f5bbbfec59b4e2fb7520a91de3df8a6174325d6a
> change-id: 20260817-nouveau-fixes-23877845c3ab
>=20
> Best regards,

