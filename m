Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0680FC982D2
	for <nouveau@archiver.kernel.org>; Thu, 17 Sep 2026 19:56:47 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EEF1210F0B7;
	Thu, 17 Sep 2026 19:56:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QbSRc3ND";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E8F084821B;
	Thu, 17 Sep 2026 19:39:07 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789673947;
 b=CGEPmMxBQy7WXzkgBgalRb+EUAbr2oSTjPjV9b+eRAVjv2j8C+CiuwyO7ZTH6/ITqMg/Y
 YgO5MF1Ir7svqxZ2iuFVczDBIrHxINvbXcHKt8jEi3LkQ66vad2SZGle9ywNOOP0wBXmyW1
 Uzo82XaX0HVjTDWLdWWvFs0z68rsTYxd5mD/sm6P8D6gScR+5/XwsclICjzNTZxnZH941fl
 tzbhXIcDR3KKKhXA55ZN1sVqlKfNLLevRG9PH+CC5W7W9Q3OnBWWZto6e1EFSJLfg5SXv9K
 CwE0UvKCCXyVcP86AWB5NKwofhuQQXIBAyZnecxpENl2OHJgfmOMpVGU/Jig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789673947; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=UvyG8B+fTniu1RjcrQ+hup/WdRBYqNwBYbowJ0pVU/M=;
 b=kN9lRz6rQA4EQ3hKLsaMcWdPCHtRb37KxD07TVeSlM28WH8D3Jn4xQfMRHgYIp72N5ulo
 MWZGPyTOs0tbLyMzCcj44H8iayfIpVw7WIy6zGg1FU20E1oBjm6xxXPoTwl5UzatVUbAAm2
 oeeURI5s9GuX2MECNB/ELNvJQcMOWq/sk8i1+T6TR6QqWQw2WMHzzI/XejZRIEhyaOB9T6E
 HvZtKLF2VkSHEYHE88W8bHSmDO8dyUjq5Dob1YxfLWOC+6UM8pzAas6g5CGRcLzhhl79TTh
 fQAyQ9aW2u0FW+5rFpRYoIgUh/tW5cNpt/VX0yc/sGO6arCEpawbM1ZuVkvA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 43BD9481F4
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 19:39:05 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E1F6910F079
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 19:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789675002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UvyG8B+fTniu1RjcrQ+hup/WdRBYqNwBYbowJ0pVU/M=;
	b=QbSRc3NDlWEfu75BHfqH3o/2/kpz0DaUdklXr0kSQvA8dbQxWvMX4kBvHYdHYNa/vaqY+o
	f4/XCTu5x73D6PGzuXzKjid8x06jMVlgPhadGm2qO5il1EnzN3PiaMH0Yr7zcXiRUVthaU
	GlFmQ+d95FpNMyNZXw7SlUnIGz5dyFk=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-388-RRntqzfHPRyrh7bc0DLxmg-1; Thu, 17 Sep 2026 15:56:39 -0400
X-MC-Unique: RRntqzfHPRyrh7bc0DLxmg-1
X-Mimecast-MFC-AGG-ID: RRntqzfHPRyrh7bc0DLxmg_1789674999
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93a082c014aso311013385a.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 17 Sep 2026 12:56:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789674999; x=1790279799;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SK8FkV9t4hK7QEUa6h1DUFLUc29+3sFP86iMsPEZQZY=;
        b=K10kETsvNFyzy0AW1HqyMsITKIuOe7tRL3B84H95mfWo3OiWXhgzo7D7b6thJlUGXB
         +61qMJXz415cYiYVmPl0cw88xbxpTwCgvKs6/cMCLpNS4XREnH64YCzistqtoix6M2KE
         /aTeqgA9tLdY8pIWGI4dvkQaPuNaKbSGu37iB+HINLqHXXJRX33w2eqe1GOVcYJLeobt
         9if2VJi7nCsbwu9dkyhB/K8ripXy/+kRe9rJtvrW6xZiIJS991scMqHWKdUQw+rS9+ku
         aT0Fcfn85okaNTjwrWG/Ha+BTdxBOOBodofqQi6bIrkwoeHw1CCnW4wuEOuP1TE6AVLq
         97eQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzhHgL24evcofvskaL0zaF5H1+ZmF3nbnkL1mO867ml+yxGc1ReeYgfQjq0uW88oALOqybKkw28@lists.freedesktop.org
X-Gm-Message-State: AFuF++mTc3XDKQuNpyN7T0DswE+LZCuO1FWoXJl9lNsrO6xAnZEL2bPe
	HfLg2IIxBOGpRsqwGjyCqpXECcS6DlGaQ8fTgtutglzJKqewXRFBH52FfcSgTfkcN9JlQMM6Bb4
	GPDDmj7vA/d/x/r8Ii9oJqlPVDYxLdnc60UTOvyMftks5uqpH7leYylhq7VWIwLkImyw=
X-Gm-Gg: AYBFou0eb3ckQOB4ofGsakl/rNVH9dR+pzFiii2KMnJs7AW8L2yRI9U5+He6qucax02
	cFAC9ExyQ3Y3uc6fpRyG2HKNScoI5n7wYZ0/JN7H6d8ghoPlo0C1vPUQoIDsEWYxzQgVFpWkkse
	t62mig6lu8JEWlSK8/FaptcxuSrZnI5G7r5sXKFggp3nEQNzq8XN7oA8lt6URaJk0lGOYkII0bF
	T5O3Fm9XhTw1jSJMIAwtZn30BXLtBV/67Me8Dpf6Bt3UqkGe+6LXQhtWanpYJBANm9d4Yz0GcOA
	PmcFgs3/pHnROZv8t35su2vmTGI4q7Ar7V9Opu6tukeniWOTtsJCYS5oP8yhm/W2FZDa1bqJ
X-Received: by 2002:a05:620a:4055:b0:939:a45:8c96 with SMTP id
 af79cd13be357-93bc62c0d2amr633009585a.19.1789674999086;
        Thu, 17 Sep 2026 12:56:39 -0700 (PDT)
X-Received: by 2002:a05:620a:4055:b0:939:a45:8c96 with SMTP id
 af79cd13be357-93bc62c0d2amr633006785a.19.1789674998638;
        Thu, 17 Sep 2026 12:56:38 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93b7825b6d3sm538457085a.31.2026.09.17.12.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 12:56:38 -0700 (PDT)
Message-ID: <f21df5ff995cba8272f3bfb30c0129a76e2cf3ed.camel@redhat.com>
Subject: Re: [PATCH 2/2] drm/nouveau/uvmm: reject replace across page sizes
From: lyude@redhat.com
To: moonafterrain@outlook.com, Danilo Krummrich <dakr@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann	 <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter	 <simona@ffwll.ch>, Andrew Morton
 <akpm@linux-foundation.org>, Balbir Singh	 <balbirs@nvidia.com>, Mary
 Guillemard <mary@mary.zone>, Mohamed Ahmed	
 <mohamedahmedegypt2001@gmail.com>, James Jones <jajones@nvidia.com>
Date: Thu, 17 Sep 2026 15:56:37 -0400
In-Reply-To: <20260817-nouveau-fixes-v1-2-f518d0c735f3@outlook.com>
References: <20260817-nouveau-fixes-v1-0-f518d0c735f3@outlook.com>
	 <20260817-nouveau-fixes-v1-2-f518d0c735f3@outlook.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: omxnKdy7Z753OR_l2pfAyt4hoMDleJFlCg5BT8QjTJY_1789674999
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 7AQ2K22NSOTIJ75W5277C3BEH2434SSD
X-Message-ID-Hash: 7AQ2K22NSOTIJ75W5277C3BEH2434SSD
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7AQ2K22NSOTIJ75W5277C3BEH2434SSD/>
Archived-At: 
 <https://lore.freedesktop.org/f21df5ff995cba8272f3bfb30c0129a76e2cf3ed.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Changes down below:

On Mon, 2026-08-17 at 14:50 +0800, Junrui Luo via B4 Relay wrote:
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
> Assisted-by: Claude:claude-opus-5
> Cc: stable@vger.kernel.org
> Signed-off-by: Junrui Luo <moonafterrain@outlook.com>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_uvmm.c | 33
> ++++++++++++++++++++++++++++++++-
> =C2=A01 file changed, 32 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> index f5e4756b4de4..6404c54d097c 100644
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
> @@ -655,7 +657,8 @@ op_map_prepare(struct nouveau_uvmm *uvmm,
> =C2=A0
> =C2=A0=09uvma->region =3D args->region;
> =C2=A0=09uvma->kind =3D args->kind;
> -=09uvma->page_shift =3D select_page_shift(uvmm, op);
> +=09uvma->page_shift =3D args->page_shift ? args->page_shift :
> +=09=09=09=C2=A0=C2=A0 select_page_shift(uvmm, op);

This can just be:

   args->page_shift ?: select_page_shift(uvmm, op);

> =C2=A0
> =C2=A0=09drm_gpuva_map(&uvmm->base, &uvma->va, op);
> =C2=A0
> @@ -684,8 +687,20 @@ nouveau_uvmm_sm_prepare(struct nouveau_uvmm
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
> @@ -713,11 +728,22 @@ nouveau_uvmm_sm_prepare(struct nouveau_uvmm
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
> +=09=09=09=C2=A0=C2=A0=C2=A0 uvma_from_va(va)->page_shift !=3D
> map_page_shift) {

Let's just take this value from remap_args instead of doing
uvma_from_va(va), it makes it a bit easier for people to understand
what's happening here.

With those nitpicks fixed:

Reviewed-by: Lyude Paul <lyude@redhat.com>

> +=09=09=09=09ret =3D -EINVAL;
> +=09=09=09=09goto unwind;
> +=09=09=09}
> +
> =C2=A0=09=09=09op_unmap_prepare(r->unmap);
> =C2=A0
> =C2=A0=09=09=09if (r->prev) {
> @@ -756,6 +782,11 @@ nouveau_uvmm_sm_prepare(struct nouveau_uvmm
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

