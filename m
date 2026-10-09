Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D1A2CA9EBB
	for <nouveau@archiver.kernel.org>; Fri,  9 Oct 2026 22:23:20 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 322031122E2;
	Fri,  9 Oct 2026 22:23:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="aOmYC3dZ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5784948A3B;
	Fri,  9 Oct 2026 22:04:51 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1791583491;
 b=pfA7ACN1dwaYmkdSuURfTC8dpt5U/DCOW2rTchjtwLbi1nKdmN1s+uLo6fEXPJc/6p4hn
 OBvYIC4bqPBxuNu0UIUb/CbHHJQEChYtB3YG24EmfuTVmq2UAmB6s9z80YhszZ+UsyvIIWi
 nOWM2exu6C+ccdmlfb+eVR3yBLGjxWNfSJkmGpL9NC965IeozpbeK0UtBLVhOaJglsK0rE/
 ZLWwU0mVgqBPCbycnl0G2WDsWEa8ImCLCFUacTox+pNB7FRHYm0hmUuUwUewolMBZNADS9R
 h2dsmmTZkTpBXjGL+aLESVjG4BI6oi6jmHnjOLbmaTZk26b7snR/u6TWzRSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1791583491; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=PZhswLSZpKcNuqso9AUUCoP5Qyu4krUXD3dNinpXBKU=;
 b=vuhWZIn5TuSqiML4X5nk5y++3ZBV9MwKb/xU3hMfLwROy/5o+h32CQyDnQzlbMtQ5Ggnj
 w/5c/rSSTzfywKQlatyMaduYWCDdyajc8fhHrsfKqABvT8PJ6o57h2cRsnwhLDk9ATQt2cA
 tUX819uDU/tROkqabgKB3f39plfGwf4uJOjVkL/7hpdJDJwCR7/PO9c6jgBj7xEExDYF7RU
 7BoSsOA0ToYfbeikJscACL10RuTkxZ8NzTgoHeUL7lKLvJYz3qR0Xd4rOl8/xiqsamTJ3uW
 M1++vAnMRstk2t4853o0avH9HN9QOy7nAyOrsw9DFBIhncv0EGSO8kwlofiQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id AA67148A2E
	for <nouveau@lists.freedesktop.org>; Fri,  9 Oct 2026 22:04:47 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2963A1122C4
	for <nouveau@lists.freedesktop.org>; Fri,  9 Oct 2026 22:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791584593;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PZhswLSZpKcNuqso9AUUCoP5Qyu4krUXD3dNinpXBKU=;
	b=aOmYC3dZ60nvIVLlQdVEuMjjVBiBDWoAu8qaRhlKm6zeXV0rOt9ysUddAIxUn+x191gOuF
	IxoVyxi8qrR9V0KEBL6yEcO6R18AHf7bMpS5ErGZjDUxqw/2t9JESYAES3Wf+RYqnRhHiv
	Awh4z6wl6V5gQZiBVqlHoS7M/V66h5k=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-601-IecNhTaIPwuDwMWTBNs8Ng-1; Fri, 9 Oct 2026 22:23:12 +0000
X-MC-Unique: IecNhTaIPwuDwMWTBNs8Ng-1
X-Mimecast-MFC-AGG-ID: IecNhTaIPwuDwMWTBNs8Ng_1791584591
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-917baea8e5dso5285316d6.3
        for <nouveau@lists.freedesktop.org>;
 Fri, 09 Oct 2026 15:23:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791584591; x=1792189391;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1kJjybFGSYZCppzp0ILAQK86Y2LNrWWZ0v/kRNoEipQ=;
        b=E7wgz1CAirqyEKKP7XG3fzlei6taS4jjF76gd3rCAEV7xrUH3yYowqhoCC3AU18LEo
         eFkKuB/I7TfFz5gp4rc4XzIn/dw3TFEoxjqNYCgSmD+5I0JWu1vuinzPmE1KrjunNAlo
         aEMfgC1mrD0eBDMsf9TT/lmvi15TYjG4v4IDQhfJkQtdZ+35lLzt8xZOm0UkjL9fLAje
         C/Fr8BQg+NHeZEszmVQUACQYbJMuPBR6TI+HzJVSYmrdhTyJ2Ja2DifCy7GIxD5hEuH3
         OPn4QmqrPyi/x6hEOj9ntEnVjpfod1C7US99GjIHi+onVqrlM9ZUUI0kG1mn1jvViiLb
         nDXQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxzQjnN+qJUeWTn7grRG4Xdar82EeIEaeMGrwhoM+81glyWkyL+Btg7j7de1sRgojXeD2x3UX7u@lists.freedesktop.org
X-Gm-Message-State: AFq9FYJiVrRAlGFL/gOwrj5nOnorgjYbls+WN0zVJTiQ2C5aFi9k1TYF
	39ZbodcNJX4OZJHYqA3loyH7BDZrRSOlTZgOKDj+rkdVoT7UWfvWfosFKCe4F5b8kidG3ntk6cY
	nuROI8pWa5/QdSeyieJACZ7gL0sm+0NNwog/ch08vR58tYkiT74JkrW5WAabSY0Rd8mQ=
X-Gm-Gg: AYBFou1SOWTNj/Z351M7WC8pcwUb9JqUPQCPtq5cGo0Rqolx2dz4bSNbK6Qws2R012q
	YK06trieM8ykCA+99xfvKVE3OIBVgpDJuJCF1P6p0WK/HqwFGOk6c6zyjNG6D/9PzH7jlQc9Brx
	d9LiO6zIBhv67ZrfejrvGn97Iuf5wsilzO3M2CCjJ/7yNmuwb3s3Yz1uL0WW5Mv51AFe4gtE2cp
	m4/Pnx3J7Sh17oM0VeArGQKzzRYLRaukHu5aTiPgURTp2FTsb0oITwy8f0fc9YBnCon6LhEs0bc
	53zmGKg1HFA42BPEkqG+G+10nVf79+MpjQlJO5oI80ZL77Hl9DOxrMfNCDOtuPf3Ivic2lA=
X-Received: by 2002:a05:6214:769:b0:912:54f7:aea3 with SMTP id
 6a1803df08f44-91b5534d151mr61194276d6.1.1791584591481;
        Fri, 09 Oct 2026 15:23:11 -0700 (PDT)
X-Received: by 2002:a05:6214:769:b0:912:54f7:aea3 with SMTP id
 6a1803df08f44-91b5534d151mr61193756d6.1.1791584590983;
        Fri, 09 Oct 2026 15:23:10 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91b55017565sm29165376d6.15.2026.10.09.15.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 15:23:10 -0700 (PDT)
Message-ID: <f3576e4263b19d183e343eac9c56d4fc8385b431.camel@redhat.com>
Subject: Re: [PATCH v2] drm/nouveau/uvmm: reject replace across page sizes
From: lyude@redhat.com
To: moonafterrain@outlook.com, Danilo Krummrich <dakr@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann	 <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter	 <simona@ffwll.ch>, Andrew Morton
 <akpm@linux-foundation.org>, Balbir Singh	 <balbirs@nvidia.com>, Mary
 Guillemard <mary@mary.zone>, Mohamed Ahmed	
 <mohamedahmedegypt2001@gmail.com>, James Jones <jajones@nvidia.com>
Date: Fri, 09 Oct 2026 18:23:09 -0400
In-Reply-To: <9041ce7f5d6ae30213aa1ab895a4225fb33246ed.camel@redhat.com>
References: <20261009-nouveau-fixes-v2-1-a0b71bf8df1b@outlook.com>
	 <9041ce7f5d6ae30213aa1ab895a4225fb33246ed.camel@redhat.com>
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IwfgpQAUds9iO_np3xjDQXxcTN6mVNLTUad-sOnG3-s_1791584591
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: DQ2HCOV25ARTAK3YVICZLHIWMW73U5ZZ
X-Message-ID-Hash: DQ2HCOV25ARTAK3YVICZLHIWMW73U5ZZ
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DQ2HCOV25ARTAK3YVICZLHIWMW73U5ZZ/>
Archived-At: 
 <https://lore.freedesktop.org/f3576e4263b19d183e343eac9c56d4fc8385b431.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Wait-nope, hold on. Was double checking this to make sure there wasn't
anything I missed, and the sashiko comment I'm seeing looks quite
legitimate. Mind dropping my R-b and addressing that if it looks
legitimate?

On Fri, 2026-10-09 at 18:19 -0400, lyude@redhat.com wrote:
> Looks good to me, will push to drm-misc-fixes in a moment.
>=20
> On Fri, 2026-10-09 at 16:52 +0800, Junrui Luo via B4 Relay wrote:
> > From: Junrui Luo <moonafterrain@outlook.com>
> >=20
> > A new mapping takes over the page tables of the mappings it
> > replaces.
> > nouveau_uvmm_sm_prepare() only acquires page tables for the range
> > no
> > existing mapping covers, and the map path frees the replaced
> > mappings
> > without putting their references. That is only valid while all of
> > them
> > use the same page size, which select_page_shift() no longer
> > guarantees.
> >=20
> > Rebinding a GART BO over a 2MiB VRAM BO therefore leaves the new
> > mapping
> > owning page tables built for a different page size, and it then
> > maps
> > at a
> > size that was never referenced over that range. Since raw map does
> > not
> > allocate, nvkm_vmm_iter() can walk down to a NULL leaf and
> > dereference
> > it. The remainders of a split have the same problem:
> > op_map_prepare()
> > recomputes a page size with select_page_shift() while the remainder
> > keeps
> > the parent's page tables, so a parent that was itself downgraded
> > can
> > leave
> > a remainder that re-aligns to a larger size. This happens on the
> > unmap
> > path too.
> >=20
> > Reject the bind, and make split remainders inherit the page size of
> > the
> > mapping they are split from.
> >=20
> > Fixes: c488a94e7e14 ("drm/nouveau/uvmm: Allow larger pages")
> > Reported-by: Yuhao Jiang <danisjiang@gmail.com>
> > Assisted-by: LLM
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Junrui Luo <moonafterrain@outlook.com>
> > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > ---
> > Changes in v2:
> > - Drop patch 1, which has been merged.
> > - Use the abbreviated conditional operator for page_shift (Lyude
> > Paul).
> > - Compare against remap_args.page_shift (Lyude Paul).
> > - Use Assisted-by: LLM (Balbir Singh).
> > - Add Lyude's Reviewed-by.
> > - Link to v1:
> > https://lore.kernel.org/r/20260817-nouveau-fixes-v1-0-f518d0c735f3@outl=
ook.com
> > ---
> > =C2=A0drivers/gpu/drm/nouveau/nouveau_uvmm.c | 32
> > +++++++++++++++++++++++++++++++-
> > =C2=A01 file changed, 31 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> > b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> > index f5e4756b4de4..aa5b93808f41 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> > @@ -85,6 +85,8 @@ struct uvmm_map_args {
> > =C2=A0=09u64 addr;
> > =C2=A0=09u64 range;
> > =C2=A0=09u8 kind;
> > +=09/* Page size to give the new mapping, or 0 to derive it
> > from
> > the op. */
> > +=09u8 page_shift;
> > =C2=A0};
> > =C2=A0
> > =C2=A0static int
> > @@ -655,7 +657,7 @@ op_map_prepare(struct nouveau_uvmm *uvmm,
> > =C2=A0
> > =C2=A0=09uvma->region =3D args->region;
> > =C2=A0=09uvma->kind =3D args->kind;
> > -=09uvma->page_shift =3D select_page_shift(uvmm, op);
> > +=09uvma->page_shift =3D args->page_shift ?:
> > select_page_shift(uvmm, op);
> > =C2=A0
> > =C2=A0=09drm_gpuva_map(&uvmm->base, &uvma->va, op);
> > =C2=A0
> > @@ -684,8 +686,20 @@ nouveau_uvmm_sm_prepare(struct nouveau_uvmm
> > *uvmm,
> > =C2=A0=09struct drm_gpuva_op *op;
> > =C2=A0=09u64 vmm_get_start =3D args ? args->addr : 0;
> > =C2=A0=09u64 vmm_get_end =3D args ? args->addr + args->range : 0;
> > +=09u8 map_page_shift =3D 0;
> > =C2=A0=09int ret;
> > =C2=A0
> > +=09/* A new mapping takes over the page tables of the
> > mappings
> > it replaces,
> > +=09 * so every one of them has to be using its page size. The
> > new mapping
> > +=09 * is the last op drm_gpuvm_sm_map_ops_create() emits.
> > +=09 */
> > +=09if (args) {
> > +=09=09struct drm_gpuva_op *last =3D
> > drm_gpuva_last_op(ops);
> > +
> > +=09=09if (last->op =3D=3D DRM_GPUVA_OP_MAP)
> > +=09=09=09map_page_shift =3D select_page_shift(uvmm,
> > &last->map);
> > +=09}
> > +
> > =C2=A0=09drm_gpuva_for_each_op(op, ops) {
> > =C2=A0=09=09switch (op->op) {
> > =C2=A0=09=09case DRM_GPUVA_OP_MAP: {
> > @@ -713,11 +727,22 @@ nouveau_uvmm_sm_prepare(struct nouveau_uvmm
> > *uvmm,
> > =C2=A0=09=09=09struct uvmm_map_args remap_args =3D {
> > =C2=A0=09=09=09=09.kind =3D uvma_from_va(va)->kind,
> > =C2=A0=09=09=09=09.region =3D uvma_from_va(va)-
> > >region,
> > +=09=09=09=09/* The remainders of the split
> > keep
> > the page
> > +=09=09=09=09 * tables of the mapping they are
> > split from,
> > +=09=09=09=09 * so they must keep its page size
> > too.
> > +=09=09=09=09 */
> > +=09=09=09=09.page_shift =3D uvma_from_va(va)-
> > > page_shift,
> > =C2=A0=09=09=09};
> > =C2=A0=09=09=09u64 ustart =3D va->va.addr;
> > =C2=A0=09=09=09u64 urange =3D va->va.range;
> > =C2=A0=09=09=09u64 uend =3D ustart + urange;
> > =C2=A0
> > +=09=09=09if (map_page_shift &&
> > +=09=09=09=C2=A0=C2=A0=C2=A0 remap_args.page_shift !=3D
> > map_page_shift)
> > {
> > +=09=09=09=09ret =3D -EINVAL;
> > +=09=09=09=09goto unwind;
> > +=09=09=09}
> > +
> > =C2=A0=09=09=09op_unmap_prepare(r->unmap);
> > =C2=A0
> > =C2=A0=09=09=09if (r->prev) {
> > @@ -756,6 +781,11 @@ nouveau_uvmm_sm_prepare(struct nouveau_uvmm
> > *uvmm,
> > =C2=A0=09=09=09u64 uend =3D ustart + urange;
> > =C2=A0=09=09=09u8 page_shift =3D uvma_from_va(va)-
> > > page_shift;
> > =C2=A0
> > +=09=09=09if (map_page_shift && page_shift !=3D
> > map_page_shift) {
> > +=09=09=09=09ret =3D -EINVAL;
> > +=09=09=09=09goto unwind;
> > +=09=09=09}
> > +
> > =C2=A0=09=09=09op_unmap_prepare(u);
> > =C2=A0
> > =C2=A0=09=09=09if (!args)
> >=20
> > ---
> > base-commit: f5bbbfec59b4e2fb7520a91de3df8a6174325d6a
> > change-id: 20260817-nouveau-fixes-23877845c3ab
> >=20
> > Best regards,

