Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B28C5DF7D
	for <nouveau@archiver.kernel.org>; Fri, 21 Aug 2026 19:26:44 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2E9AE10F4C2;
	Fri, 21 Aug 2026 19:26:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="coOb3s4k";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4747E47AB0;
	Fri, 21 Aug 2026 19:09:49 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787339389;
 b=brQFJBwnGS8osnrPR7RHYnuCUYeWc8o8GhAYTxRs7WUThB+lm1KEX3jh6FOpE5LUM0KN1
 AtDTVm/sqz+BVsgj0CckjEK6lkZYgZe3jUaBIhBVK3g0NltHGiT/4bm+ba5Dv+PR9bYkMRE
 1K+AVB94GymwZcU3CAEn/ZzSRLsmGNcnnlh7uRE+i0FnuxeLi3v8rq4t39FQaFpO7Hsuoc8
 8p0EKDEpfxR1EmspP2KNcCcE4PKGuMEvW6/s0Gn52G+8z8kbtybu3iRKPlqK51r/LkdhT84
 es09Ka2NvZTOmNUQ9aJf3oJ2q06JeV/V11gp0QtqPkWpY9PwHEY7Jx8FKKMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787339389; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=WNXf/dJ9hBuXVYCJeUCVP8nSk43isZcQqKrxyAyY8Co=;
 b=CyxjtHtPvsol8xXnTxp82fzrL50S06T0gel42WtYLnvhjmkxztMPlBGnAMXdXjLtrZJPR
 Y+Q0eiux2bCrFKtUUHs8LptYrB1qUG4PE5EHLBSbzEzubDpOp5BRR0PPVACqX4Vsalts6ac
 Z+B5nrNPT06aXDpk5kG6b+cs4F6DJn68dXkJlM0+BWC/U1/OQYMRqDjUNSb6RueLIl67drH
 +eaJJPxHZGdRt1Nn03iSa0CXWQnNsjm3Qr+ucX5YfYIlY7Ztl+FsSYkqF1BaMyTcY6V0esf
 OMbvejXMDpFOOK8EbFahCyNpSqGRAChFrJdwNMKGvPxxdnZYGTP60zhKxQ8w==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=fail header.d=redhat.com;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail header.d=redhat.com;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 13646475CA
	for <nouveau@lists.freedesktop.org>; Fri, 21 Aug 2026 19:09:36 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7C51710F43B
	for <nouveau@lists.freedesktop.org>; Fri, 21 Aug 2026 19:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787340343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WNXf/dJ9hBuXVYCJeUCVP8nSk43isZcQqKrxyAyY8Co=;
	b=coOb3s4kiWo848RPGWuxux0rtfzCxH+1KmNbRle5aZT7GqO+V8WjLat/F0nE3T1Yij7Kzv
	8rualJEszioxEhGDtjtSLGJ11cOgiMCW3eLwnMwdw1p/aC1bGYoDev0RpsKMaNACBqFrkC
	ib6vcYNMd5t0lT8dCZxjp54ViKR6SNQ=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-PASqIEweMBqAXjkx6R1Nxw-1; Fri, 21 Aug 2026 15:25:42 -0400
X-MC-Unique: PASqIEweMBqAXjkx6R1Nxw-1
X-Mimecast-MFC-AGG-ID: PASqIEweMBqAXjkx6R1Nxw_1787340342
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c1d137a68so26076981cf.3
        for <nouveau@lists.freedesktop.org>;
 Fri, 21 Aug 2026 12:25:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787340342; x=1787945142;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XTWvZVA7JaArjs8Zd1HxJ0CjIfwAygH13+3hEPTRLdA=;
        b=XKgyW7WBTcGKxSH7iriS/1M9OfSF+ZBsERWH3dKjX/jCs2KV4NEcSpUojWCCjyiDrV
         vviuVL0/rN1HkL06sgfFZc9nkhdMo7wZN7HyfBPsCd1SwRbMH3bGBYME9AFlQvce+lBp
         MJPYu/vXP2io88GsjgDqmD9yXV7rHoVROooHYoCw51swiZjT7nsgkc26ktnI0pyGBkg1
         j7RPZN9+uO+IvOdFbCyjfxmCJvnqXzjaV33eUk1RAUAxdLwJFRD/+S+MB5i0qqYZ/4hV
         t/VYaion1rHsjlw0zxFPh4M8mjt7TwzKYPT5GG0oPRpPvB20CaSaGU0phR4K+9mO6wcN
         esuw==
X-Forwarded-Encrypted: i=1;
 AHgh+Ropv7Sg2+PH4A8/9J26xI10Mm1uZxofSPWLr7v62DnKFkmzL2di9QEy5roQayqXEHeipgYuyPN6@lists.freedesktop.org
X-Gm-Message-State: AFuF++kF+2qSMitan60yHScuKU/XjjfcyJQtW49OrWb+/Z5CSW6Lop6y
	XfaIgN6QKbCipx0J86VQxpCvwQ66PLb0+29eK1adInmiDaXqOHgXNHtTJAXGAK+YfOuQ9kL15hC
	Htk5+oQgR8hRwK0R/fIHVzy5vRP0rb/BmfdJeKERLOkKZAWAi6Lhh6cduE3ILgJ9N1xY=
X-Gm-Gg: AR+sD10Y/fQjCD29QsuYpas6m8d88hY5VZYKnGF5JjarsGdDsVtvpquwhgubfguJxGS
	yHWAyttZAwkUdcrqVo7tTCp8g+m59MJNwow6Iv2zpJPuVxRdIyulUs+66dza5Z61uUUaFeLv+He
	R5wMhVHlJBDxriRSwOUiz7AZbtVgmwIjgiemg1kTifrVUZFVAMvXac10ASFeNVpgCjpjR7m0pD0
	03Aq8DAFhee7gSTO+eBSruBs4MsF5wK7Nf+eygG710f+8WAlB2DFn5PrRQYIKjvYDOlx5B5twry
	kRF8NlQNm9sef9QEhV46LcV0hQXem6ZYaNPUMlx1OWMI4UpkJ44wShb7/9Xh4ctlZZMdjn8a
X-Received: by 2002:a05:622a:481a:b0:52d:78c9:9377 with SMTP id
 d75a77b69052e-52e09ce9a34mr4129431cf.36.1787340341574;
        Fri, 21 Aug 2026 12:25:41 -0700 (PDT)
X-Received: by 2002:a05:622a:481a:b0:52d:78c9:9377 with SMTP id
 d75a77b69052e-52e09ce9a34mr4127511cf.36.1787340339927;
        Fri, 21 Aug 2026 12:25:39 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-52e09ae930fsm1418381cf.27.2026.08.21.12.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 12:25:39 -0700 (PDT)
Message-ID: <7509463d112de8807ba8be03a00a178a37891a94.camel@redhat.com>
Subject: Re: [PATCH v2 02/10] drm/nouveau/disp: move the GSP HDMI GCP AVMute
 write to engine/disp
From: lyude@redhat.com
To: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
	linux-kernel@vger.kernel.org
Date: Fri, 21 Aug 2026 15:25:38 -0400
In-Reply-To: <20260820164929.17117-3-mohamedahmedegypt2001@gmail.com>
References: <20260820164929.17117-1-mohamedahmedegypt2001@gmail.com>
	 <20260820164929.17117-3-mohamedahmedegypt2001@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jR9KnbLOUEVxPwVu6cHZwJqfxWQufZKOI77FbIJREAc_1787340342
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 5QUS4BU2SSGOZRMKY5DSF5NFOPQJSTGT
X-Message-ID-Hash: 5QUS4BU2SSGOZRMKY5DSF5NFOPQJSTGT
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5QUS4BU2SSGOZRMKY5DSF5NFOPQJSTGT/>
Archived-At: 
 <https://lore.freedesktop.org/7509463d112de8807ba8be03a00a178a37891a94.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Thu, 2026-08-20 at 20:49 +0400, Mohamed Ahmed wrote:
> r535_sor_hdmi_audio() pairs two RM controls (a SET_OD_PACKET carrying
> the same General Control Packet, and the audio mute-stream toggle)
> with a direct write of the GCP AVMute bit through the SF GCP unit.
> The controls are RM and stay, but the direct write is register
> programming and moves next to the other per-chip display code as
> tu102_sor_hdmi_gcp(). No functional change.
>=20
> Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h=C2=A0=C2=A0=C2=A0 |=
=C2=A0 1 +
> =C2=A0drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c=C2=A0 | 15
> +++++++++++++++
> =C2=A0.../drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c=C2=A0=C2=A0=C2=A0 |=
=C2=A0 9 +--------
> =C2=A03 files changed, 17 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h
> b/drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h
> index 3ba04bead2f9..5d682a774f2d 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h
> @@ -194,6 +194,7 @@ void gv100_sor_dp_audio_sym(struct nvkm_ior *,
> int, u16, u32);
> =C2=A0void gv100_sor_dp_watermark(struct nvkm_ior *, int, u8);
> =C2=A0extern const struct nvkm_ior_func_hda gv100_sor_hda;
> =C2=A0
> +void tu102_sor_hdmi_gcp(struct nvkm_ior *, int, bool);
> =C2=A0void tu102_sor_dp_vcpi(struct nvkm_ior *, int, u8, u8, u16, u16);
> =C2=A0
> =C2=A0int nv50_pior_cnt(struct nvkm_disp *, unsigned long *);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c
> index 7b70b466fa36..6cfd52c9056f 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c
> @@ -30,6 +30,21 @@
> =C2=A0
> =C2=A0#include <nvif/class.h>
> =C2=A0
> +/* General Control Packet: bracket an audio enable/disable with
> AVMute
> + * through the legacy GCP SF unit. Used by the GSP-RM path, which
> sends the
> + * equivalent packet via RM as well but keeps the direct write in
> sync.
> + */
> +void
> +tu102_sor_hdmi_gcp(struct nvkm_ior *sor, int head, bool enable)
> +{
> +=09struct nvkm_device *device =3D sor->disp-
> >engine.subdev.device;
> +=09const u32 hdmi =3D head * 0x400;
> +
> +=09nvkm_mask(device, 0x6f00c0 + hdmi, 0x00000001, 0x00000000);
> +=09nvkm_wr32(device, 0x6f00cc + hdmi, !enable ? 0x00000001 :
> 0x00000010);
> +=09nvkm_mask(device, 0x6f00c0 + hdmi, 0x00000001, 0x00000001);
> +}
> +
> =C2=A0void
> =C2=A0tu102_sor_dp_vcpi(struct nvkm_ior *sor, int head, u8 slot, u8
> slot_nr, u16 pbn, u16 aligned)
> =C2=A0{
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
> index 8e57bb6519e5..cd4451e62512 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
> @@ -545,16 +545,9 @@ r535_sor_hdmi_ctrl_audio(struct nvkm_outp *outp,
> bool enable)
> =C2=A0static void
> =C2=A0r535_sor_hdmi_audio(struct nvkm_ior *sor, int head, bool enable)
> =C2=A0{
> -=09struct nvkm_device *device =3D sor->disp-
> >engine.subdev.device;
> -=09const u32 hdmi =3D head * 0x400;
> -
> =C2=A0=09r535_sor_hdmi_ctrl_audio(sor->asy.outp, enable);
> =C2=A0=09r535_sor_hdmi_ctrl_audio_mute(sor->asy.outp, !enable);
> -
> -=09/* General Control (GCP). */
> -=09nvkm_mask(device, 0x6f00c0 + hdmi, 0x00000001, 0x00000000);
> -=09nvkm_wr32(device, 0x6f00cc + hdmi, !enable ? 0x00000001 :
> 0x00000010);
> -=09nvkm_mask(device, 0x6f00c0 + hdmi, 0x00000001, 0x00000001);
> +=09tu102_sor_hdmi_gcp(sor, head, enable);
> =C2=A0}
> =C2=A0
> =C2=A0static void

