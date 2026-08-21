Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731B2C5DF97
	for <nouveau@archiver.kernel.org>; Fri, 21 Aug 2026 21:59:39 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 349E310F3CE;
	Fri, 21 Aug 2026 21:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DiEA8sNy";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E9E6247AE2;
	Fri, 21 Aug 2026 21:42:58 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787348578;
 b=aV4bcyw5geQj6tY0VjBddwMQ1BcsqtiHkjqv1Bv8LkTPiOCZRoKjRGLfzMGcBDuGbbKH3
 8gBne6pbthmuTVxkx60Qi+sCHVlzNY6AgQm1BPzuqfoyJg7oAjzMIuMUpo3XZErWWK06cDX
 xDMk15atD+PB+/Jel4fqR72lT7oAibcFmteOOSlPh0maLtVoidx2qurl2kxC+ND1Vuwxhp5
 I9Wn6dQo1ijCbNFHKaQ4U2+LQ//n78qzKay02Cuc5Qh3rSv4FmLJMTspKqVsCTpL+HYzEkR
 3xwDNz7fjXO7Mz2ipUQki6ep65ECvdEp1sV8Kds6XCYccI0ji0j9G4WCGM/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787348578; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=tYY+VYhzG1oHVnCCsnrZL1hda9ZFN1K71JsN0AuTTHI=;
 b=Saev04cYpSXk2boqMHlxQOnG8d3VoUD2pWYyTi2jD/eNiD7Herzn0UsyP4YhBDDg8PLMd
 /mDvBiX+6XWEeD1gUBMHsemtNeRm4pxzgtnOyZhwRdJMdSwedJP65Poum2MwvihdXwZ87lE
 8EPJ1XgjUeMceEz+IakxFrWEReBSsTF4syRnwhSLQ8L2+xgipuuO4ZXq0oEM9ApK7j28ZRn
 6NxoEw2MSWoJjjygoTKbQTse+Y0YOUCdQY92ZU01aLvFwDRdA93G8TnBR1CgpUqE1x9q7nI
 DAVj0U5FrJGo8VUz4a8+aToA4YUaCSXUrH6qo5/L0SIUAJtRRGQY3qtFt3tA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id D396947AB5
	for <nouveau@lists.freedesktop.org>; Fri, 21 Aug 2026 21:42:55 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AB4F010F3C4
	for <nouveau@lists.freedesktop.org>; Fri, 21 Aug 2026 21:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787349572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tYY+VYhzG1oHVnCCsnrZL1hda9ZFN1K71JsN0AuTTHI=;
	b=DiEA8sNy/kuT7LHkAU71ULAnRbBLVBaNI8QhNzkXIJZYpp2T2o5QL30F58n7bMXL3YZD2E
	G80++zIE5ytShcQdQYSTUD2VsTYTInqe8WiWp5GXAlXRQE55YYBA+zCzx/tpV5q9hz740K
	CYC+8ZYQan1bk17IcAVPnLKTQR2iar8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-5_p2LdTpM6aw6xOa16ULXg-1; Fri, 21 Aug 2026 17:59:31 -0400
X-MC-Unique: 5_p2LdTpM6aw6xOa16ULXg-1
X-Mimecast-MFC-AGG-ID: 5_p2LdTpM6aw6xOa16ULXg_1787349571
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-92e820609d9so147783685a.2
        for <nouveau@lists.freedesktop.org>;
 Fri, 21 Aug 2026 14:59:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787349571; x=1787954371;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yu+hOZT2DZL8hLRcYSAFyvPiNjPMHm+BvocQ7hwJTWc=;
        b=fmLyvoDOLnG6TxScQcVpCXv1vb88iIreQTfmlPvvRbHvcPMmjQ6qL1KQbTTZ/1ZH7m
         MZWgj1GjkgG1gv38NOD0+x2NKT2nmLxCdgvH0BHTsOiytbXH7v/Y6DHfuVpWVxfRV4Fg
         /Sa1kSvl1U9UichL89IXHnKvJIA/yJKnpHms6G7v2FyUrViNeJ21PVqeb8iQv8a+RVOM
         KCkd4dQ4HvtPxn7YcetvR7oswqDHl8bA6D5CNyHry5wGJIiQuKQc6x7/RZPNSeEghpxY
         ZbXcGgjM8QwdjtTSKO3KB7libMrvzcu1A8VxUrkbS9XPd59WBIR5H/w235BuHo2Qwk2o
         7DWg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr3bfqcdrZs7vAXs55lsHsZzw97DLFhmWAoTKYUpLkPUzKuGPlLDzUChvNHCzRC2Ajl/kAIbndM@lists.freedesktop.org
X-Gm-Message-State: AFuF++nbZIwuo42DH3+Ow94IoKZ1yQTdvMCKrlz0c9+Bbm5Y/VaCn9Ff
	Ss+972ALTEL4qsQQeNw6gTUBdh2NGBdbaDA9zi+LqlfE89U3w3xnWAE+Aqg1VxjoLAqwESt5twu
	GY3UVptLER/G59U2UUAfBqkK5MiOmlJD2osw1n+iKRyKpEF9AE31cUj48wdTs6lOZ4LI=
X-Gm-Gg: AR+sD11ltvMvBzUDuf/o47RO7skmBTm5yIOd3WAqfiDoa3GzdAj7EhrJJ4SNg3aGxdo
	oBDoPRttBJq5nNJPqDq5Qh7fg0uFAFsGmGcEFckdC4vQbOQj/HQC7V7FiewtVI8rrhtYER7dP0A
	Z3xZfTLh8+2dvffGobCT3Y0q7usQlas6SCOG7I2Rp/phPn+ModQlSR/waAR6VsEXxeQy9Pt2QPw
	jkPEZt6STbJbMBBJXbOnU+U7oay+r5CFjsNiPZh+e7fmlfqudxezS0+3dmuzT3LZz0G/zxVM88d
	BsRFM94NwEHelbAZShklRVu5CIaJWNsNLotWvsCPFY2lBf40SVf7eabVXTjyTXe4xqG9xsfz
X-Received: by 2002:a05:620a:288b:b0:936:51af:1de0 with SMTP id
 af79cd13be357-937395f23d9mr843720185a.47.1787349570858;
        Fri, 21 Aug 2026 14:59:30 -0700 (PDT)
X-Received: by 2002:a05:620a:288b:b0:936:51af:1de0 with SMTP id
 af79cd13be357-937395f23d9mr843716385a.47.1787349570425;
        Fri, 21 Aug 2026 14:59:30 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93749adeee6sm7807585a.15.2026.08.21.14.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 14:59:29 -0700 (PDT)
Message-ID: <66d7cd7ee0a94e01ccb559a36178497ae2d806ad.camel@redhat.com>
Subject: Re: [PATCH v2 05/10] drm/nouveau/disp: fix HDMI GCP AVMute register
 offsets on GB20x
From: lyude@redhat.com
To: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
	linux-kernel@vger.kernel.org
Date: Fri, 21 Aug 2026 17:59:28 -0400
In-Reply-To: <20260820164929.17117-6-mohamedahmedegypt2001@gmail.com>
References: <20260820164929.17117-1-mohamedahmedegypt2001@gmail.com>
	 <20260820164929.17117-6-mohamedahmedegypt2001@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Qi6pueGlnTes05ULoKlWeol4LRRcOM5LTjSnOW73DZk_1787349571
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 6IKMMG5HL5BU2ZDKW4WN7ROPG6VADFFE
X-Message-ID-Hash: 6IKMMG5HL5BU2ZDKW4WN7ROPG6VADFFE
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/6IKMMG5HL5BU2ZDKW4WN7ROPG6VADFFE/>
Archived-At: 
 <https://lore.freedesktop.org/66d7cd7ee0a94e01ccb559a36178497ae2d806ad.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Code-wise this looks totally fine, but I'm not actually getting any
audio on my local GB206 setup. Is this expected, e.g. will we need more
work to actually get it working?

On Thu, 2026-08-20 at 20:49 +0400, Mohamed Ahmed wrote:
> The GSP path brackets audio enablement with a General Control Packet
> AVMute toggle. r535_sor_hdmi_audio() calls the gsp.hdmi_gcp hook,
> which
> every chip so far serves with tu102_sor_hdmi_gcp() and the legacy GCP
> unit at 0x6f00c0/0x6f00cc. On GB20x the SF packet units were
> compacted
> and the old generic and VSI units are gone (ACR keeps slot 2) and the
> GCP unit moved from slot 3 to slot 1 (control 0x6f0040 and subpack
> 0x6f004c from NVIDIA's published clc971.h. The same offsets are also
> used by OpenRM's hdmiWriteGeneralCtrlPacketC871() on these chips).
> The
> old addresses are reserved on GB20x, so the AVMute writes were silent
> no-ops and mitigated only by the equivalent GCP r535_sor_hdmi_audio()
> already sends through the SET_OD_PACKET RM control.
>=20
> Add a GB20x GCP writer using the new offsets and hook it into
> gb202_gsp_disp, keeping the direct MMIO path in sync with the
> hardware
> as on earlier chips.
>=20
> Only SB0 (the AVMute bit) is written. On NVD5.0 the subpack register
> also
> carries SB1_CTRL (bit 24), which selects where the deep-color CD/PP
> fields are generated (hardware or from the driver, with the default
> being
> HW). hdmiWriteGeneralCtrlPacketC871() likewise writes only SB0-SB2.
>=20
> Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
> ---
> =C2=A0.../gpu/drm/nouveau/nvkm/engine/disp/gb202.c=C2=A0 | 20
> ++++++++++++++++++-
> =C2=A01 file changed, 19 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gb202.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gb202.c
> index fa83aee35ae7..4863b2b36db0 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gb202.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gb202.c
> @@ -65,6 +65,24 @@ gb202_sor_hdmi_infoframe_vsi(struct nvkm_ior *ior,
> int head, void *data, u32 siz
> =C2=A0=09nvkm_wr32(device, 0x6f03f8 + hoff, 0x00000002);
> =C2=A0}
> =C2=A0
> +/* General Control Packet AVMute bracket. The GCP unit moved to slot
> 1 on
> + * NVD5.0. Only SB0 (the AVMute bit) is ours to write so we must not
> do a
> + * full write here: SB1 carries the deep-color CD/PP fields, and
> SB1_CTRL
> + * (bit 24, new with clc871.h) controls where their generation
> happens (HW
> + * or driver) on these chips, with the default being HW.
> + */
> +static void
> +gb202_sor_hdmi_gcp(struct nvkm_ior *sor, int head, bool enable)
> +{
> +=09struct nvkm_device *device =3D sor->disp-
> >engine.subdev.device;
> +=09const u32 hdmi =3D head * 0x400;
> +
> +=09nvkm_mask(device, 0x6f0040 + hdmi, 0x00000001, 0x00000000);
> +=09nvkm_mask(device, 0x6f004c + hdmi, 0x000000ff, !enable ?
> 0x00000001 :
> +=09=09=09=09=09=09=09=09
> 0x00000010);
> +=09nvkm_mask(device, 0x6f0040 + hdmi, 0x00000001, 0x00000001);
> +}
> +
> =C2=A0/* GB20x is GSP-only. This table supplies the register programming
> the
> =C2=A0 * GSP-RM display path needs from the chip.
> =C2=A0 */
> @@ -77,7 +95,7 @@ gb202_gsp_disp =3D {
> =C2=A0=09.gsp.head_rgpos =3D gv100_head_rgpos,
> =C2=A0=09.gsp.vblank_get =3D tu102_head_vblank_get,
> =C2=A0=09.gsp.vblank_put =3D tu102_head_vblank_put,
> -=09.gsp.hdmi_gcp =3D tu102_sor_hdmi_gcp,
> +=09.gsp.hdmi_gcp =3D gb202_sor_hdmi_gcp,
> =C2=A0=09/* The legacy AVI unit is unchanged on GB20x. */
> =C2=A0=09.gsp.hdmi_infoframe_avi =3D gv100_sor_hdmi_infoframe_avi,
> =C2=A0=09.gsp.hdmi_infoframe_vsi =3D gb202_sor_hdmi_infoframe_vsi,

