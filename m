Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CFEDCD3447
	for <nouveau@archiver.kernel.org>; Sun, 10 May 2026 15:44:46 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB1910E208;
	Sun, 10 May 2026 15:44:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="S3Mu9s7j";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4FD0940B03;
	Sun, 10 May 2026 15:31:56 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1778427116;
 b=DOGmFYqB6aUrL8X5KsF6uJmsj7zZyGmNn6eVYe77uchLAFz9VJFpXPjswD+KAVrSTRZch
 2AzfnnQt/RriQwN5vhjFGORYJGjYmWoCeBscdifujXMd5gwmmHmV1111VQIVSsRYhmJKvlC
 ZLJUfxMmoSbgQi6pm/wsMnHnCi/YhxiryQsUWP2RUoM9l8a18j4ZwSDN0wjtgcIcGox3DV0
 PqvIzzInApVqdc1hvw9w5HhlOAWkOtwe0+GmAr4WhosAM95EOgW8K9cy/l5qq4vA2GND3T5
 N/Yop/ooQYhzp7vS03yPa02GsRBNFv4PQRKwngrtSa+5nLQV/s9BT76heXJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1778427116; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=3YM2yIxFZng8udCyyxfJNqN2OWJuimyAwuqVc1zr66I=;
 b=gnrAhG2d0JDcMEsbym5v4m7bwN4NmM+h3tUsXMZzT+vFcJD2PwWSFEZ4tz1HYJltO6NLO
 OhVrai4gnq8X9pnrCPC8z7s+Sd1sTF1vAiyYzNKsYcP4S89+XBRgQYgRP9q0Dj8hZ64E5BM
 K4V8/AjHS9dhQm8lBZ53uDhE4bUAIHjkDW1kJ2SIrTHmrMvFVwd6ztt0YaEXmvqlUle5B9S
 jYKo5YAST4L1nZi5V5I8o9ptoAhHEQdpaoryaGT02dlUfLkV7p6d7pApD/1MAXOjFOAerpz
 TuflG57xF7WpwWLxuwKhXeo84hm6EPGH1l6MdQ42oDfAnYmkZhEVevG+ZNCw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 698F644FF1
	for <nouveau@lists.freedesktop.org>; Fri,  8 May 2026 18:17:05 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 057A210F5B7
	for <nouveau@lists.freedesktop.org>; Fri,  8 May 2026 18:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778264989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3YM2yIxFZng8udCyyxfJNqN2OWJuimyAwuqVc1zr66I=;
	b=S3Mu9s7j8syseo+bZnj/4RcxkeTRYVBA2exHpmF6y4q6DqYvRBSFdpaX4QmK30qEiXfqXp
	3wdgGFnLdzppN8p379AAMVw45Dv3Wzecqg5Zr72f95+ia9Opvt7XFv90nPygUmg4nrSYU9
	ZrVxktOrvWiaE3muTvXHuAaDHkwpTaU=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-zhEgEuRDPACnPm53TumV2Q-1; Fri, 08 May 2026 14:29:45 -0400
X-MC-Unique: zhEgEuRDPACnPm53TumV2Q-1
X-Mimecast-MFC-AGG-ID: zhEgEuRDPACnPm53TumV2Q_1778264985
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8eabf08affaso238443685a.1
        for <nouveau@lists.freedesktop.org>;
 Fri, 08 May 2026 11:29:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778264985; x=1778869785;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ts89bXnsydMC3S8XTyf/KWj9UES6R504LBZEUkz/MQM=;
        b=KMpZJKS7Y3oEZqvfLQR6f0aTb4OMGSufSfDrTVF3UR9toF0xK8pMmPt1iBSx6WWCCy
         N8vWIEn/GVU0+YVcJm4vkyoGzXCJStQNU/BfraHKIzuUWrP0/GZSSyBl4LJUAA8rd6BD
         A/tF3dchVuU+wCnjRcpkD0PUF+b2IuiQg+u5fnf7PRBCZDEoblG8YEegm4vWQlRgwGm4
         Jy+oyyzE3i0C6b6+kBBRMQpPMRU6TrM6Pj1qbwSLb1vNGypokszC4Gus+ZHLROhug0a2
         ihGWbIAJOFS/m02BAVMRCEO+ZbIH7OlJnXqgYePS7FYPB4SPYRJdUMhHzbpfu2ksfkDD
         +SwQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/nSCTKZlWl2x9zPU/gTqHR51M6YcBhmbnNBI3da0J4N97Lr9F6FlG9yZEmGhoCiJfmbea3xqgf@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEu5vooMmoJq9DwqwyMpFCTNR6LrOzwE83rwoFhnXAMzPKo+7S
	3SJwnDxKTIt1pnA7cH2eguIPmGumusD7+/VxKzbjTA2gUbz9gnGbQbGlSQ2wFsxQrM9uo5KZ4pK
	sDXCcPCGt5f3/kM4nWZlUBSoRuy/p6MKm0osS7Az0FF3yCpK8Rb1CmnnXEd5uhGaB3OM=
X-Gm-Gg: AeBDieuKzLJJu1dHom5nKRm10nuVzXawBFff2gZO4dejl4+vScjp18n5ZrG4uyEDYzj
	qK6vIfSqo58NbjsUvfH6KcjAMaFgegZkYULQ4coe3svVMIM4/obrgtV3wBQZPz/4rfFdLED6/OU
	tZNzvKJEOuu02T0djcJlKSdW/th45fdXNZAL3PG5e/Yi1rDZirf85OTXumlEDgBxUfkah58iHz5
	hmadcwUCgchrR5j6GCTrn0qxFfMf0/uwGX4RmxVd+EvyIVNxVkrF09Cnp9AbXShN1G4N0QRmp3R
	6F5sfQacbJ3N9KSXujaBlZ3nkqxHR+6kZ9USE4ml6xn7iAvZ3B8XR32C15wpJ61eOQnqGXX1vse
	roahAhLEEZPssU9Bcrg==
X-Received: by 2002:a05:620a:2586:b0:8ec:7323:9361 with SMTP id
 af79cd13be357-904d72b9151mr1971900985a.55.1778264984985;
        Fri, 08 May 2026 11:29:44 -0700 (PDT)
X-Received: by 2002:a05:620a:2586:b0:8ec:7323:9361 with SMTP id
 af79cd13be357-904d72b9151mr1971895885a.55.1778264984558;
        Fri, 08 May 2026 11:29:44 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-907b8e98521sm278551985a.17.2026.05.08.11.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 11:29:43 -0700 (PDT)
Message-ID: <3b324ccebe4ce6f49f6ff7c9558408b9484589a4.camel@redhat.com>
Subject: Re: [PATCH] nouveau/vmm: use kzalloc_flex
From: lyude@redhat.com
To: Rosen Penev <rosenp@gmail.com>, dri-devel@lists.freedesktop.org
Date: Fri, 08 May 2026 14:29:42 -0400
In-Reply-To: <20260312195529.13002-1-rosenp@gmail.com>
References: <20260312195529.13002-1-rosenp@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: r7IMbWFldHeFIOzS61S7oH5va988syAHQuNo7B58go8_1778264985
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 max-recipients; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: QH5GQ3GL5QXY27F7BOBKAUKHBK6NFCPV
X-Message-ID-Hash: QH5GQ3GL5QXY27F7BOBKAUKHBK6NFCPV
X-Mailman-Approved-At: Sun, 10 May 2026 15:31:54 +0000
CC: Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QH5GQ3GL5QXY27F7BOBKAUKHBK6NFCPV/>
Archived-At: 
 <https://lore.freedesktop.org/3b324ccebe4ce6f49f6ff7c9558408b9484589a4.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Sorry I didn't notice this patch until now!

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push it to drm-misc-next in just a moment

On Thu, 2026-03-12 at 12:55 -0700, Rosen Penev wrote:
> Use the proper macro do to these sizeof calculations.
>=20
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> index 958fd78080bd..b9648290dffb 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> @@ -53,7 +53,7 @@ nvkm_vmm_pt_new(const struct nvkm_vmm_desc *desc,
> bool sparse,
> =C2=A0=09=09}
> =C2=A0=09}
> =C2=A0
> -=09if (!(pgt =3D kzalloc(sizeof(*pgt) + (sizeof(pgt->pte[0]) *
> lpte), GFP_KERNEL)))
> +=09if (!(pgt =3D kzalloc_flex(*pgt, pte, lpte)))
> =C2=A0=09=09return NULL;
> =C2=A0=09pgt->page =3D page ? page->shift : 0;
> =C2=A0=09pgt->sparse =3D sparse;

