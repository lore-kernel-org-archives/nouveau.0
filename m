Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2963EC982D9
	for <nouveau@archiver.kernel.org>; Thu, 17 Sep 2026 21:13:32 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 140B910E856;
	Thu, 17 Sep 2026 21:13:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dkXTfZBv";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id ECD024824D;
	Thu, 17 Sep 2026 20:55:51 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789678551;
 b=pqD8VNgNbEfyskYw/RQf+WGBqtBKVSgKWeBqAt5VdlSfC+5M28iQluqwaG6nqDNmAuRCo
 U+qUNQnhYC8ngG6XW20aDbgokmDniMSs5JrBG6ytJ1a9v1TB48+skwT5QDg5+uyPoRFbnXS
 jnoW4rv95Sw6y9OKR94ap8h2uTOpRhsVwCId3ocTDii2epg1igwDIFMYQfoTD0ZxPfWMI1w
 ruD3N9qYM5Y0rId9p16yZT89NVHP9cOMqQu5nYeEmmDSgk4C4vrLNgmWWR9oGa+BbQ5iPOR
 +R3CkoTn6c8bJEFm7vFxwPX+kCEMuMBX97N7wysR+sjNGC8dvmNKKzRGrtJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789678551; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=04R2pZSwG+OaBUsHlvhl9TEuvS7EQ6VAEsVarWVXYVE=;
 b=bg4MfihiJvPjFvnJ7ao0J2IZZ5ajRIldkNNkLVGlMQPjkDnAQw6cmOkXTpJbWa/te+A52
 kn2h0TNKICI566/3/sDyAs3dI7OzkssFPGQ23ALxXOX017OuugGdMyRjcfCP/S6QUp6dMHe
 wPZtw9MfHzMXhrke1i4Ax6ay+tcL0qk0tMF+Qi0oTTSAbhuka7StCO9l1kvqrUU5M9GRlMc
 CQmQCtQYzvTJgck4gTduRRF8LKwFavXIISEOdvM5jtyPN815jT3LbymmDAyHd7M0FiOpcAm
 FJ4m5oKksEGpD79ehBIqEoL2cWtk37AiD5DXEHN0ehmSCGXWx05E7HpknfSw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 251A5481EA
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 20:55:49 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E5F6010E769
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 21:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789679606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=04R2pZSwG+OaBUsHlvhl9TEuvS7EQ6VAEsVarWVXYVE=;
	b=dkXTfZBvZKJpPHmZ1/WHTVgV1oJrkA8WskKiptghNg1SDmPol/x8/OUxHgy4fCT2bAOher
	r6LwmZONTz1NiqvdkMFomru+Vu+kc/ew8rJwN+HGSz0auO5lmJwGVfsT7uNVuFfoN6HkPE
	rp6mlpKXhSDmSvIDyGDVZqqSm73BYHk=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-eol0bcgOMZeeIGI3Z3mM_w-1; Thu, 17 Sep 2026 17:13:24 -0400
X-MC-Unique: eol0bcgOMZeeIGI3Z3mM_w-1
X-Mimecast-MFC-AGG-ID: eol0bcgOMZeeIGI3Z3mM_w_1789679604
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-934963b2bc0so10957785a.3
        for <nouveau@lists.freedesktop.org>;
 Thu, 17 Sep 2026 14:13:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789679604; x=1790284404;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+1WRQ3xpv0F4/rm47tzzwq3oGBSMX7i9LTQrQwZCVGM=;
        b=0pFlPu+p6tZ2n5NapVwFDHp6Wu314pCLltNbIHlfQ4QzSmdSLZaHb0rQ84Y1yJG0gT
         s6ZwuaLqP8E7rv172dKpvCd914iFKc/9tOpJNWzuPfq+iitfG+ttrM3mrhyB02h4YCj2
         ugLtkTCHkYAlwWY8v0uilU0KbyxJZ7jhIzlNY4J51+SmILyTOk6OlCaJHrRk+GhmfjY5
         GPz8KHoHRrrIlVKeJLnCDYppnyiDuwEHvbLx58c9E8wek1THkth9yyD5A0XC9lWosUnv
         1OuMPFzQbKofshl9wMuCT8wgcYJh7cQRYTWqMSibczAgg5P0R0C/sEHqxrBDCXbWxTnx
         XBQQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByjlrQ1jcYrKtVPwP16kQ7dSP1/1RVViObJ7cldWoxEd4u+azWaJI9EELb0861xrMTTR+lGE9/L@lists.freedesktop.org
X-Gm-Message-State: AFuF++koFrU2yd6V4YRYYbFBUK1/g5TqKixJAuOc2kO65roFxupaVF1h
	VJ+JSIvwSlEBTtYRUzVp1U6xXq1XczonryNnkQsVIr64fYzy9dvyqR6e/wDV/g+A/+BDVJDwJVn
	zidx0l1LKxr1EkcqT8HgG+zylywj5MJEp3/F2UvBOmJdQhkA4JPQP57SdezjvKR+hK2U=
X-Gm-Gg: AYBFou3i9JM3cQ3ogEnfQ0UaclKH5q3R0hK1HDIZdVsFVwPoOdhp6UCVfUwr/V3+0tS
	GQyzFrhRZ7s9i9NfC9dl8TdzQTFtFCZ2z42kO67txhTxrx9ojoS6GhRLflTOrgs39nnkz4nBkpb
	nFNwRxsotilaOd6Z0Nk4vqrFxcEt+vEPagoi6QNvr5AQH+F5XgIouEOc/9zT0+MbhoRWaTQ0iVi
	UVPO/NieUl54gXi2+ksK8gu5fEEAYZQKJXIRD0Oftvbwtp2gg+3ULahsacTxjgMsFAftojK1Vd+
	mvn0zuDRyg27f7HEDMP4LgkThUVT6QHXkZlhcz4WnQ57meKTkLMArmjU5ACFgporxGN9SgqY
X-Received: by 2002:a05:620a:4103:b0:938:e23a:2ce9 with SMTP id
 af79cd13be357-93bdc6d5f01mr40255585a.16.1789679603888;
        Thu, 17 Sep 2026 14:13:23 -0700 (PDT)
X-Received: by 2002:a05:620a:4103:b0:938:e23a:2ce9 with SMTP id
 af79cd13be357-93bdc6d5f01mr40251785a.16.1789679603464;
        Thu, 17 Sep 2026 14:13:23 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93b7821d231sm558697385a.21.2026.09.17.14.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 14:13:22 -0700 (PDT)
Message-ID: <d6d916ceab76de14541a087c092cecf895c82164.camel@redhat.com>
Subject: Re: [PATCH v2 3/4] drm/nouveau/device: don't use the pstate cursor
 after the loop
From: lyude@redhat.com
To: Francesco Magazzu <postadelmaga@gmail.com>, Danilo Krummrich
	 <dakr@kernel.org>
Date: Thu, 17 Sep 2026 17:13:21 -0400
In-Reply-To: <20260712123616.1180830-4-postadelmaga@gmail.com>
References: <20260712123616.1180830-1-postadelmaga@gmail.com>
	 <20260712123616.1180830-4-postadelmaga@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qQVJ95w0LkRGm09fdpS3m3b67ys567_esNWGYGgFSKY_1789679604
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: BCN64AH5SUXVIKISNTGBQ7QGVKCR32QC
X-Message-ID-Hash: BCN64AH5SUXVIKISNTGBQ7QGVKCR32QC
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BCN64AH5SUXVIKISNTGBQ7QGVKCR32QC/>
Archived-At: 
 <https://lore.freedesktop.org/d6d916ceab76de14541a087c092cecf895c82164.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Sun, 2026-07-12 at 14:36 +0200, Francesco Magazzu wrote:
> nvkm_control_mthd_pstate_attr() looks up the pstate at the index
> supplied
> by userspace by walking clk->states, and then keeps using the
> list_for_each_entry cursor after the loop.=C2=A0 This is not triggerable
> today:
> the function already rejects args->v0.state >=3D clk->state_nr before
> the
> loop, and clk->state_nr is kept in sync with the number of entries on
> clk->states, so the lookup always breaks on a real entry.
>=20
> Should the loop ever run to completion, the cursor would point at the
> list
> head rather than at a pstate, and the pstate->base.domain[] read and
> the
> walk of pstate->list that follow would read past it.=C2=A0 Rather than
> leave
> that trap in place, track whether the entry was found and return -
> EINVAL if
> it was not, like the other lookup failures in this function.
>=20
> No functional change.
>=20
> Signed-off-by: Francesco Magazzu <postadelmaga@gmail.com>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c | 8 +++++++-
> =C2=A01 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c
> index f2e9a0626..28702741a 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c
> @@ -74,6 +74,7 @@ nvkm_control_mthd_pstate_attr(struct nvkm_control
> *ctrl, void *data, u32 size)
> =C2=A0=09const struct nvkm_domain *domain;
> =C2=A0=09struct nvkm_pstate *pstate;
> =C2=A0=09struct nvkm_cstate *cstate;
> +=09bool found =3D false;
> =C2=A0=09int i =3D 0, j =3D -1;
> =C2=A0=09u32 lo, hi;
> =C2=A0=09int ret =3D -ENOSYS;
> @@ -104,10 +105,15 @@ nvkm_control_mthd_pstate_attr(struct
> nvkm_control *ctrl, void *data, u32 size)
> =C2=A0
> =C2=A0=09if (args->v0.state !=3D
> NVIF_CONTROL_PSTATE_ATTR_V0_STATE_CURRENT) {
> =C2=A0=09=09list_for_each_entry(pstate, &clk->states, head) {
> -=09=09=09if (i++ =3D=3D args->v0.state)
> +=09=09=09if (i++ =3D=3D args->v0.state) {
> +=09=09=09=09found =3D true;
> =C2=A0=09=09=09=09break;
> +=09=09=09}
> =C2=A0=09=09}
> =C2=A0
> +=09=09if (!found)
> +=09=09=09return -EINVAL;
> +
> =C2=A0=09=09lo =3D pstate->base.domain[domain->name];
> =C2=A0=09=09hi =3D lo;
> =C2=A0=09=09list_for_each_entry(cstate, &pstate->list, head) {

