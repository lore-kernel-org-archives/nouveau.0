Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA0CC5DF81
	for <nouveau@archiver.kernel.org>; Tue, 18 Aug 2026 20:18:52 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8D06210EC71;
	Tue, 18 Aug 2026 20:18:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bvZimBUW";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 29C1A4790D;
	Tue, 18 Aug 2026 20:02:18 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787083338;
 b=xzZh57R+fR99PsiT9L3nBvZA+B2M32BNkQTQqxM1u4imMDz+HPf+YFxREjrR4Xn10ls9e
 1jN33tPA5NYRj99mULTrYwlwlvpmbRZWqLE8FO9Iwpq3McxuZjltvJguWmI9rltCisEQxE7
 oycxnjo5HO29z1vmpwXM5XZvBimUI5ZP2umjUxt6ZFP/T6Pz2byIYPB/e0A4xyHSY15c/NK
 zgGAg6JhJhnCQp1+R4Ewz5lMZM5Gx0MHGWL7a4JzSFHdVgLFaGtblvVBYzc4c2bVtPTS9vz
 ydihb4kNdYxznD4DdrEor7XH5TRl5gdyctIEQAZU7oiR1xlEgdokPokptwOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787083338; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=6DxuAQI4Zuu+TQLQ99XoqbV0v3/Ns0/E+RTsN2ch1AI=;
 b=ag9U3UqoSs7+8Us8B3oeAq3X1LED007PVUjy2V6OxfyGIRFrgC3ICAbgf5ZOfbujQycUS
 Xl6WXvpNWLG4jtDqj/wy7hxhgf+2JH7BgOpQqNFpfb5sQiFlV7YoE0dUvqlDv9XeUrHzVXj
 pmyrKbmHzH+TOitjpQmERwO7LdMvlXj4z/zCam128t0BnFBacjySAw7sYslzZ5zNw4MM2+p
 ef8BuYF1041Y3OY3e/8uvYMoRz+VDTBEfvaJfVHMMlf0a8ig7r1HW7Yf7gXbjM7FrSkxVSI
 2oNAbVjD03u39SD8dCuDFGSU5g0ESr34rXCw7hpf5XQ8auo861Z3oJzMOSCw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id E3D86478F2
	for <nouveau@lists.freedesktop.org>; Tue, 18 Aug 2026 20:02:15 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EDAEA10EC66
	for <nouveau@lists.freedesktop.org>; Tue, 18 Aug 2026 20:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787084326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6DxuAQI4Zuu+TQLQ99XoqbV0v3/Ns0/E+RTsN2ch1AI=;
	b=bvZimBUWgPN+ZlKwN/5V/zhE4vnJ5QF9UhalcRdxpKFalVIiquifRMr0kqmtp9jHGAK9I5
	VWxy3kd7Hr2ybwbVXR2iI4kQBgud/vtb70mUf651XGPttR66/7ah2gk8fMro3A4F8et7nn
	Ae1hcJJUnWXZYQ33sKRUCVKVgQB2hnM=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-WSH2wvKHPYu3miG0z-1Pxg-1; Tue, 18 Aug 2026 16:18:44 -0400
X-MC-Unique: WSH2wvKHPYu3miG0z-1Pxg-1
X-Mimecast-MFC-AGG-ID: WSH2wvKHPYu3miG0z-1Pxg_1787084324
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8ef8249f871so4215066d6.0
        for <nouveau@lists.freedesktop.org>;
 Tue, 18 Aug 2026 13:18:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787084324; x=1787689124;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g9OWuHNZhe61OBLjXm8D+LZBFST1XmHdZMCDCW5KK8E=;
        b=Yws8aHgjXhzcpIPLT0BbYsk988DDPsIiCor8tx2eLo4YPfEupqd+03R8oGo33J6ki5
         eUHoRlNpcIJ2UHR50OB6SO1EVIHm9xoAGwBV/oSoj9SHcJ6mz2TOiz7u48Os4E9ivizH
         RADEhatpRZcuGv0uliqDQxomGm+9GTnhOpAEN/35OwKkNJdSUIoHK/5GiKiDa775S3Y9
         fR8dU6JenelsLZuuxOFt6Ck4tJ8s/NMNgrelHXe6Bh9gQoOEXayszrZYtaom8kqb7c/z
         G58UQPTRPM0MmImQ3/NuzjVvs/982HvFZPQ5dpbPSN9OYab0CUfbsnXfrs3FKxnNAByR
         K0IA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqQ5+TsslKRiutCH/VwRaaebowZ6ug5oNApvGno1tMnobxFs0PLjxJsI97vefUoCdZ7LeN1BeKI@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGdQ5c0iu++FPJqc7QhKJm/58bq420/+C+wvTeTMwvJxfUlN1Y
	zW5heAE+eJpvRmFI9MrJ6su8FEstmR+7sOgjvm/7RwiV8mIx/e97YW9I5juujeqnDKmjZODz7fx
	TFbdYwGE0By2erjmSGFSbMXOf6ZQk4jrSrFPmazUXZgrkwYDu9Rfkb/Yc0CGsaCy1R5s=
X-Gm-Gg: AR+sD11DhTZJhR2hnFiNeWZc3Y9VUSlcU8vI3FI2GtZQBzzb4A4bW7hr07FBT+L94Ua
	rrY6t2CLncENAGPDS9sFk2L1T3LgR1a2gkwE+Iogcv2YcxgzPlCeKx532nyRxjcv6jqNjobbxmS
	vvDntK5u/5P4vfbX6iF3jmHyU62ATFobXJ5nyLxxaeYtPwZyp/ODcTl/G7PJsdYi9R6dDggiueZ
	qk7TsRGs3nAiGXQEB5HN9gNOhUJEe+VD5EiZdRZXIkYbFR3PQNDYlUcVZ7WhxmKinLno+L3oSGd
	67Pfw+d+zTKchRLLad1SihB2MAcyrrLPNk5sGCA2fPSes9Yw6iTm2wrJ7MSfZf9RraXiSV75
X-Received: by 2002:a05:6214:4518:b0:8be:7779:d1b1 with SMTP id
 6a1803df08f44-90c5c14e795mr13754686d6.30.1787084323994;
        Tue, 18 Aug 2026 13:18:43 -0700 (PDT)
X-Received: by 2002:a05:6214:4518:b0:8be:7779:d1b1 with SMTP id
 6a1803df08f44-90c5c14e795mr13753966d6.30.1787084323495;
        Tue, 18 Aug 2026 13:18:43 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90c4597793esm39672716d6.41.2026.08.18.13.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 13:18:42 -0700 (PDT)
Message-ID: <d7adac6cd62cdf816e0caf96f524d3ff30811186.camel@redhat.com>
Subject: Re: [PATCH v2] drm/nouveau/svm: drain fault handler before freeing
 svmm
From: lyude@redhat.com
To: Zhenhao Wan <whi4ed0g@gmail.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann	 <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter	 <simona@ffwll.ch>, Ben Skeggs
 <bskeggs@redhat.com>
Date: Tue, 18 Aug 2026 16:18:42 -0400
In-Reply-To: <20260814-nouveau-svm-svmm-uaf-v2-1-8e6590519f07@gmail.com>
References: <20260814-nouveau-svm-svmm-uaf-v2-1-8e6590519f07@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Rqt2J-u569HywgpzMweX9LX6X4ODan2J8SgKgm5KOzk_1787084324
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 2WRIQNFANYKNQ7NO7M6DFHBIVX6WVNLX
X-Message-ID-Hash: 2WRIQNFANYKNQ7NO7M6DFHBIVX6WVNLX
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/2WRIQNFANYKNQ7NO7M6DFHBIVX6WVNLX/>
Archived-At: 
 <https://lore.freedesktop.org/d7adac6cd62cdf816e0caf96f524d3ff30811186.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to drm-misc-next in just a moment

On Fri, 2026-08-14 at 18:00 +0800, Zhenhao Wan wrote:
> The SVM fault handler nouveau_svm_fault() looks up each fault's
> nouveau_svmm under svm->mutex, caches it in the fault array, then
> drops
> svm->mutex and dereferences the svmm across blocking faults
> (mmu_interval_notifier_insert(), hmm_range_fault()).
>=20
> nouveau_svmm is not refcounted. On DRM file close nouveau_svmm_fini()
> ->
> mmu_notifier_put() frees it asynchronously via call_srcu() without
> waiting for the handler, and mmget_not_zero() pins the mm, not the
> svmm.
> flush_work() on the fault buffer otherwise runs only at device
> removal
> and suspend, never on close, so a fault handled concurrently with a
> close
> can dereference a freed svmm.
>=20
> The instance is already unlinked by nouveau_svmm_part() earlier in
> the
> same close, so no new fault can resolve to it. Drain the handler in
> nouveau_svmm_fini() before the free, guarding the flush with a NULL
> check
> on drm->svm: on device teardown nouveau_svm_fini() runs first and
> frees
> drm->svm (NULL) after blocking the notify and flushing the buffer, so
> the
> handler is already drained; on per-client close drm->svm is alive and
> the
> flush runs.
>=20
> Fixes: eeaf06ac1a55 ("drm/nouveau/svm: initial support for shared
> virtual memory")
> Reported-by: Yuhao Jiang <danisjiang@gmail.com>
> Assisted-by: Claude:claude-opus-5
> Cc: stable@vger.kernel.org
> Signed-off-by: Zhenhao Wan <whi4ed0g@gmail.com>
> ---
> Changes in v2:
> - Fix a NULL deref introduced in v1: guard flush_work() with a NULL
> =C2=A0 check on drm->svm.=C2=A0 On device teardown nouveau_svm_fini() fre=
es
> =C2=A0 drm->svm before the per-client svmm teardown, so
> nouveau_svmm_fini()
> =C2=A0 would deref NULL (reported by Sashiko AI review); the handler is
> =C2=A0 already drained there, so there is nothing left to flush.
> - Tighten the commit message and the code comment; no functional
> change.
> - Link to v1:
> https://patch.msgid.link/20260813-nouveau-svm-svmm-uaf-v1-1-2d3112dea734@=
gmail.com
>=20
> To: Lyude Paul <lyude@redhat.com>
> To: Danilo Krummrich <dakr@kernel.org>
> To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> To: Maxime Ripard <mripard@kernel.org>
> To: Thomas Zimmermann <tzimmermann@suse.de>
> To: David Airlie <airlied@gmail.com>
> To: Simona Vetter <simona@ffwll.ch>
> To: Ben Skeggs <bskeggs@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_svm.c | 13 +++++++++++++
> =C2=A01 file changed, 13 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c
> b/drivers/gpu/drm/nouveau/nouveau_svm.c
> index dcc92131488e..a87406d3da30 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_svm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
> @@ -304,6 +304,19 @@ nouveau_svmm_fini(struct nouveau_svmm **psvmm)
> =C2=A0{
> =C2=A0=09struct nouveau_svmm *svmm =3D *psvmm;
> =C2=A0=09if (svmm) {
> +=09=09struct nouveau_svm *svm =3D svmm->vmm->cli->drm->svm;
> +
> +=09=09/* The fault handler caches svmm pointers under svm-
> >mutex and
> +=09=09 * dereferences them after dropping it, across
> blocking faults.
> +=09=09 * The instance is already unlinked
> (nouveau_svmm_part), so drain
> +=09=09 * the handler before the free to release any in-
> flight reference.
> +=09=09 *
> +=09=09 * On device teardown nouveau_svm_fini() ran first
> and freed
> +=09=09 * drm->svm (NULL) after draining the buffer;
> nothing to flush.
> +=09=09 */
> +=09=09if (svm)
> +=09=09=09flush_work(&svm->buffer[0].work);
> +
> =C2=A0=09=09mutex_lock(&svmm->mutex);
> =C2=A0=09=09svmm->vmm =3D NULL;
> =C2=A0=09=09mutex_unlock(&svmm->mutex);
>=20
> ---
> base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
> change-id: 20260813-nouveau-svm-svmm-uaf-bbcf36265aaa
>=20
> Best regards,
> --=C2=A0=20
> Zhenhao Wan <whi4ed0g@gmail.com>

