Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B77C5DF97
	for <nouveau@archiver.kernel.org>; Fri, 21 Aug 2026 22:06:26 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4859E10F3D6;
	Fri, 21 Aug 2026 22:06:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VlU8Fjgh";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0965147AED;
	Fri, 21 Aug 2026 21:49:48 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787348987;
 b=C9kln/s98z+KW//ulp4R5IqC+lAAsjOQwJpbfBhzi/2n5OZ7aWejARXMQpWYRnISP1aAi
 HUUugSO4DSg0e4ef5LgoEdDoV2KOvlTlOizun4S0O4NFfxLVpUeQq1BQ1MjXeB1TQOqsbkl
 0wNVRjGpZOGlI88vNfuCUQKtjt/8N14xvzG7MWzumRgJu91eGZnhEEG76kAMSr5qiNKZO5B
 6XTl4zg3K3AEIijQGxzqALpMrq8Rno6guZP6MQFsatHfEnFGG6z4PEQU661mrBEV4PFGpoI
 P+WQcVIcWb2BaXleHfWez65aaXfq1+pf81fiLyPtTvBXB1u7yE7JBMNLTekA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787348987; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=qwhVKlFw0C7U0qZUm2FHhHp351/G0aZVZwuOAuxRA3A=;
 b=MZRmdHuNkYcMuHSjYr0ZGuBHwukyzDo8DCZlDsxMojGV18eTjtdSUpVzFcmqHfeeMuyX6
 k/4DgG3xH3uRpADMS+r9X0KgAGHlYcYZDlMuQNXse5IQC6Z1TG87ftN8C+M5ws/WoakHpxA
 eJmf8NK/RvwkMhoOa18XRMA2nxuACO7prw1o+cZHj39TCFXopWJXtsFodN0GM5NEaQA8j2H
 /QnilvXwmVhEHNCadw2g2h6q4Ndv21AE7lDrwwuOyZlB08hAlS9kfIyEZ4UbeoLVWKJAcp9
 eBq6vz92YJzuuJdOGms1sJWOMVhyuvNkbcH91v37grXj6pNzA06UXR9s23SQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 9E4B547AB5
	for <nouveau@lists.freedesktop.org>; Fri, 21 Aug 2026 21:49:44 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7C8E010E500
	for <nouveau@lists.freedesktop.org>; Fri, 21 Aug 2026 22:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787349981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qwhVKlFw0C7U0qZUm2FHhHp351/G0aZVZwuOAuxRA3A=;
	b=VlU8FjghUR6PyxWEmsj3B4vuvnc8V3hq3ZBeQNb1FHnFCtHuQx+8Z3u1XBpPYHO7EbdjFD
	exlfszRjXOl2uoG+WWZ+s4rJ8SwBdiH2lUupuy5phSFgNdEwFdjhvannfzX/O7g1POVYEg
	NJmkdnlRa7cPBvNs6a2Nudph5JjXWgw=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-hjHHu1_lNNmB-b6-opuBCA-1; Fri, 21 Aug 2026 18:06:18 -0400
X-MC-Unique: hjHHu1_lNNmB-b6-opuBCA-1
X-Mimecast-MFC-AGG-ID: hjHHu1_lNNmB-b6-opuBCA_1787349978
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51c0e702df8so18975701cf.2
        for <nouveau@lists.freedesktop.org>;
 Fri, 21 Aug 2026 15:06:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787349978; x=1787954778;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GTNrL6a76djYPY+4BIDNC1iw4ko1rS7zaHUKe36ZGxo=;
        b=KLCbl+hzkDjIMS843X2Hg44gIdBbpG4Wq9lXnLoZHHvbw96iN2Vc+CfJflkGULTVPy
         AYiXevvJcDyvnBNX9OR0Iz8TgQ7IFj5LUWfs/ldjC9H6HmIDOJs+PuJVieoHs1Z9UFG3
         MoSHQch9FBmz16v0CTB09Eu1JzZYe+9rRef4ZhWrwXtmo+KC7CItZSgZvXfqus7JC2xx
         39IlShghlFZXmQM5yg2oggc9opsgTf2IsTQKs1k+8c6GhacLBFy0ntkxQFs0AVGhh3ke
         iD1zCDHF1L9c3Q4jNNJ/svuw+j0UrecYzk6+c4QQDUvrLbC0UI7jcFXHoIpSmcklvxy1
         lSGQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoXu9dwHvB9F832JiuVRgDLKy2Ud3qm/ErK5W4W2cWyp0F5kpm3TI0T8rZRYzLti5+SkW6AxLuk@lists.freedesktop.org
X-Gm-Message-State: AFuF++n6YBIdfwm9/pwXAxb0XZatAq0siBDyecLHAy+01Zzhg/jE45dw
	2Nda5b7Vieb/Oqey+sj36Nb2/f0ri99D9oklb974v9uKwOqf1o+h5Xn8z8QGVdcx/CFg7vZ3is4
	kK+zHjPlR1qI85XNhfDGkq5wavbgWMEWcUXcujC6WxTNGV8phZSOwg/2id0MnFkomub4=
X-Gm-Gg: AR+sD12ptBn5c3Qv0bBlBSXwyp5Vhd1HqUVBC68rf3Wto7EgrjL0QM3rKkPiQaGzjAO
	EVD1lBuWh8ibKw2tYAEvLgXmAcH79oHF81DnL7i9msym13GLPYDrc4F0vJdepJtB+YzTGqJa9Np
	C812FTwaUNCvnRcqjwHJwYliQnX2MFUl2kehxMC1vQ+p9Sd5Tn22XPWn2oKe4083cYsDM0AhYqf
	UnxeEK5GlH/foPU5e5d8BmWzX+DdURwNq2lqd13JWksZp49iGUthWzozA5QmKcnXvWm/0dn/Tt7
	sjmMxH8rCHBpBoQ6cMpVngXHzWbZ8998ePJKY/NPVAyVeIBpb/DgFpK98BisjkbF7n5c0eHc
X-Received: by 2002:a05:622a:5594:b0:516:d60f:6438 with SMTP id
 d75a77b69052e-52df5521abamr98361591cf.0.1787349977869;
        Fri, 21 Aug 2026 15:06:17 -0700 (PDT)
X-Received: by 2002:a05:622a:5594:b0:516:d60f:6438 with SMTP id
 d75a77b69052e-52df5521abamr98360961cf.0.1787349977361;
        Fri, 21 Aug 2026 15:06:17 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90c5f2b4ad5sm72819006d6.42.2026.08.21.15.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 15:06:15 -0700 (PDT)
Message-ID: <072f26a26bbba19cf8701472141590ffadd72f45.camel@redhat.com>
Subject: Re: [PATCH v2 07/10] drm/nouveau/disp: fix head state readback on
 GB20x
From: lyude@redhat.com
To: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
	linux-kernel@vger.kernel.org
Date: Fri, 21 Aug 2026 18:06:14 -0400
In-Reply-To: <20260820164929.17117-8-mohamedahmedegypt2001@gmail.com>
References: <20260820164929.17117-1-mohamedahmedegypt2001@gmail.com>
	 <20260820164929.17117-8-mohamedahmedegypt2001@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IG_mn1n-qVvdiqZj4YAHhqCk0y5rGYElS4iwkfa7zzA_1787349978
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 4ZQVEGRL3HOHBGTDMPWAMKBWOW2PI5V3
X-Message-ID-Hash: 4ZQVEGRL3HOHBGTDMPWAMKBWOW2PI5V3
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4ZQVEGRL3HOHBGTDMPWAMKBWOW2PI5V3/>
Archived-At: 
 <https://lore.freedesktop.org/072f26a26bbba19cf8701472141590ffadd72f45.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

One nitpick below

On Thu, 2026-08-20 at 20:49 +0400, Mohamed Ahmed wrote:
> The GSP path reads armed head state and the RG scanout position
> through
> gv100_head_state() and gv100_head_rgpos() on every generation.
> gv100_head_state() reads the core channel's state mirror at a 0x400
> per-head stride, which NVD5.0 (GB20x) doubled. Per NVIDIA's published
> CA7D class header every HEAD_SET method sits at 0x2000 + head *
> 0x800,
> while the mirror bases are unchanged (assembly at 0x680000, armed at
> +0x8000, per OpenRM's v03_00 channel-user-base HAL which is still
> used on
> DISPv0502).
>=20
> Add gb202_head_state(), the same readback at the 0x800 stride, and
> supply it through gb202_gsp_disp.
> gv100_head_rgpos() is kept. The RG registers keep their per-head
> 0x800
> stride on NVD5.0, and OpenRM's
> kdispReadRgLineCountAndFrameCount_v03_00
> still reads NV_PDISP_RG_DPCA on DISPv0502.
>=20
> Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
> ---
> =C2=A0.../gpu/drm/nouveau/nvkm/engine/disp/gb202.c=C2=A0 | 49
> ++++++++++++++++++-
> =C2=A01 file changed, 48 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gb202.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gb202.c
> index 4863b2b36db0..a66c820be9fe 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gb202.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gb202.c
> @@ -83,6 +83,53 @@ gb202_sor_hdmi_gcp(struct nvkm_ior *sor, int head,
> bool enable)
> =C2=A0=09nvkm_mask(device, 0x6f0040 + hdmi, 0x00000001, 0x00000001);
> =C2=A0}
> =C2=A0
> +/* Same core-channel state mirror as gv100_head_state() (assembly at
> 0x680000,
> + * armed at +0x8000, per-head method offsets unchanged), but NVD5.0
> spaces
> + * heads 0x800 apart (see NVCA7D_HEAD_SET_*(a) in clca7d.h).
> + */
> +static void
> +gb202_head_state(struct nvkm_head *head, struct nvkm_head_state
> *state)
> +{
> +=09struct nvkm_device *device =3D head->disp-
> >engine.subdev.device;
> +=09const u32 hoff =3D (state =3D=3D &head->arm) * 0x8000 + head->id *
> 0x800;
> +=09u32 data;
> +
> +=09data =3D nvkm_rd32(device, 0x682064 + hoff);
> +=09state->vtotal =3D (data & 0xffff0000) >> 16;
> +=09state->htotal =3D (data & 0x0000ffff);
> +=09data =3D nvkm_rd32(device, 0x682068 + hoff);
> +=09state->vsynce =3D (data & 0xffff0000) >> 16;
> +=09state->hsynce =3D (data & 0x0000ffff);
> +=09data =3D nvkm_rd32(device, 0x68206c + hoff);
> +=09state->vblanke =3D (data & 0xffff0000) >> 16;
> +=09state->hblanke =3D (data & 0x0000ffff);
> +=09data =3D nvkm_rd32(device, 0x682070 + hoff);
> +=09state->vblanks =3D (data & 0xffff0000) >> 16;
> +=09state->hblanks =3D (data & 0x0000ffff);
> +=09/* Bit 31 is ADJ1000DIV1001, not a HERTZ bit. We don't have
> enough bits
> +=09 * to add the full clock in hz on Blackwell (35 bits), but
> state->hz
> +=09 * is unused and obsolete under GSP so this is fine.
> +=09 */
> +=09state->hz =3D nvkm_rd32(device, 0x68200c + hoff) & 0x7fffffff;
> +
> +=09data =3D nvkm_rd32(device, 0x682004 + hoff);
> +=09switch ((data & 0x000000f0) >> 4) {
> +=09case 5:
> +=09=09state->or.depth =3D 30;
> +=09=09break;
> +=09case 4:
> +=09=09state->or.depth =3D 24;
> +=09=09break;
> +=09case 1:
> +=09=09state->or.depth =3D 18;
> +=09=09break;
> +=09default:
> +=09=09state->or.depth =3D 18;
> +=09=09WARN_ON(1);
> +=09=09break;
> +=09}

I would probably condense this switch case like ben did with
gv100_head_state():

=09switch ((data & 0x000000f0) >> 4) {
=09case 5: state->or.depth =3D 30; break;
=09case 4: state->or.depth =3D 24; break;
=09case 1: state->or.depth =3D 18; break;
=09default:
=09=09state->or.depth =3D 18;
=09=09WARN_ON(1);
=09=09break;
=09}

With that fixed:

Reviewed-by: Lyude Paul <lyude@redhat.com>

> +}
> +
> =C2=A0/* GB20x is GSP-only. This table supplies the register programming
> the
> =C2=A0 * GSP-RM display path needs from the chip.
> =C2=A0 */
> @@ -91,7 +138,7 @@ gb202_gsp_disp =3D {
> =C2=A0=09.uevent =3D &gv100_disp_chan_uevent,
> =C2=A0=09.ramht_size =3D 0x2000,
> =C2=A0=09.gsp.intr =3D tu102_disp_intr,
> -=09.gsp.head_state =3D gv100_head_state,
> +=09.gsp.head_state =3D gb202_head_state,
> =C2=A0=09.gsp.head_rgpos =3D gv100_head_rgpos,
> =C2=A0=09.gsp.vblank_get =3D tu102_head_vblank_get,
> =C2=A0=09.gsp.vblank_put =3D tu102_head_vblank_put,

