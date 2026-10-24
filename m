Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D976A606A31D
	for <nouveau@archiver.kernel.org>; Sat, 24 Oct 2026 07:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JJ2SrZ8t
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1118210E7A1;
	Sat, 24 Oct 2026 07:06:12 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 86BC348B61;
	Sat, 24 Oct 2026 06:47:13 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1792824433;
 b=IwqhfTdId3DHV/qwyM3XKrLLl6cBDF8M/RAnriykTkAVKvDqp3mmzPQiOsn26LKtF9yD8
 VSgc4BpRxImCL2UlyNw3eOBfC86464NxZ5qYiIwkDQ9UvHpz4F9YAwr0I80HZZ25QvNhhuH
 xu05/CTZolPZhUmpLVUtBxt3bc0rZd77gslNmDQ3Cd3iMlWhmMNatFHVPQXz90hh9PUNWkf
 fmpAHBOZrimH/NJYz3qlgxjfLix9tGUuOsA05radtbYQ/AjIbbk0orro6UOaLc13V+Mz7DJ
 NtL6WTnjhVnPSX+8LkoCuJZyFP+4GmnKo0RjccDfkCPceEWVIjUAHFCvKOTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1792824433; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=oqxBdCmRUh/o3pj/13O6zevxwBIO3ke0ZjDeWjPvwqM=;
 b=iNUfPQ8NXRG+S1rTicFshUUo3UQSkDJBxRCI0MomQbxD8cyuJHNN4DEwF3F1k9S3DJOf9
 e0W0JmyTZ1aUrZRP2jSOGb/pBjIcp81Yf6baE7VZS1XeJ43zovbjcK2kDZxYlGS4BndOqOA
 o+3l/O9l18rtkYE0pE6hQrMma/iQ5LTs//sBXhdk/RQa6lj7riPPnixzCS6CQPzaWA+ZMxC
 9AvjGpwhxQOGxrBtoVDVvYmHi41xMSrRKER8kQSEWTUTKMy8qF8zD8JKRL7XhdIkBW7el1e
 97Gol6rAJ59rWEM14vM2rKcaaZaG1yICy4WmA7EkvbE/1+BIhb8t1XU4nysQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 7DEE446BC8
	for <nouveau@lists.freedesktop.org>; Sat, 24 Oct 2026 06:47:11 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A6FFA10E0E7
	for <nouveau@lists.freedesktop.org>; Sat, 24 Oct 2026 07:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792825563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oqxBdCmRUh/o3pj/13O6zevxwBIO3ke0ZjDeWjPvwqM=;
	b=JJ2SrZ8tHjiD+4a4EVkGa1iS+liDwFTBCMR17Llq4wjzCmqIlWEHf/xbhQDwae84tO/Su/
	ITlJC0OKVlzX7RVS8xJZ8JblaCf2Fjz8iGvyl6tUGwexDiu214J/Abftl9YN1c3q3wIKW+
	D3E5Ny83yNSJLiwIvu/pi9/+R4bXuD0=
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-z9gVJ25YMY6k5wQOKJBeHg-1; Sat, 24 Oct 2026 03:06:02 -0400
X-MC-Unique: z9gVJ25YMY6k5wQOKJBeHg-1
X-Mimecast-MFC-AGG-ID: z9gVJ25YMY6k5wQOKJBeHg_1792825561
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-3692c5b061bso5059385eec.1
        for <nouveau@lists.freedesktop.org>;
 Sat, 24 Oct 2026 00:06:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792825561; x=1793430361;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oqxBdCmRUh/o3pj/13O6zevxwBIO3ke0ZjDeWjPvwqM=;
        b=2HGQxgEgnTLS/Ypo6C5dQDek5T8GDsihAzlN1oLUXR+/bitF2bS/hsNp1E21E3EQhu
         /R+GXjTdf6A8k1QiOPaW6A98cv6URBWL53BLYW6SiyxyeJW/Wus3HGsThl2SFCrX83av
         yZtI+K5b7pv3LTyHx0ONfQUJzgXf9MaQ9fjcfoBd77TwSlQxeyvv8tqte7DtBCyZqcUQ
         KoRuwWv8a5OIpOzNw6CJ03WCk8rVAvLgbNKP6G4Y+jDzNqgWbvdmPZUxnUyZ+slVtrkf
         A6fHWjnPka0/TIGSU8vQH8NUmcGLF1QpdFhqY9imZKONLEM919zuAtXuNH47qNqW+4kE
         +45A==
X-Forwarded-Encrypted: i=1;
 AKwUvBwPM+y2GmE5C84PE8nZ1MwJg/ULMlYzPB8nRbDLeWF2Prs4PzDP6RAAVd5jdf9zXUEA8pgEtMqQ@lists.freedesktop.org
X-Gm-Message-State: AFq9FYKw1WMZVmgnqD0qJ9uc0h191jpeR9OOaRbHRE4Ro8SlpTlGILQv
	1fyTYHbE7oJyvPNNh9sUJ5rD/eWdqJg/polNmz0VJWPFbwgjEVd1qWC2bFc5HW7jk2aclBSsuwI
	D6pFGA+qlteS1cj6hIMu651v8WjDD6/yheaH01tfAtTaNS+MNhhmXdm+FqvXILnDmqOzf70th9k
	twUtKHnA0LuU8Ps1V05loQSuR+fc4FiIVavsTCCa2FMlFyJhBgptG+
X-Gm-Gg: AYBFou1OfKxz+DYfryCuAXq9Dk/kJzYorvJ0vhYtYnj4mYGWNu18VNoPXAtnWps+WJJ
	7lMN3aQEMbK2MK7QiT9volNkgmhb2IrLN1l7z7juohIv23thwNpXUkKuWnhIAE7YxIThinjUK3S
	xo8t6Hd7Iuv2VB6pX9SlFaqKkO6ElMEMU5Xksw0by3pwoe2Orw48g39QtbWF25dtAGpkD3qQPES
	h9a3BQ9B327gxXK
X-Received: by 2002:a05:7022:f90e:b0:165:aced:1fde with SMTP id
 a92af1059eb24-1991b421e8dmr1507377c88.0.1792825560697;
        Sat, 24 Oct 2026 00:06:00 -0700 (PDT)
X-Received: by 2002:a05:7022:f90e:b0:165:aced:1fde with SMTP id
 a92af1059eb24-1991b421e8dmr1507363c88.0.1792825560145; Sat, 24 Oct 2026
 00:06:00 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261023-nouveau-gsp-irqdest-v1-1-5dd6131faa14@sudmix.de>
In-Reply-To: <20261023-nouveau-gsp-irqdest-v1-1-5dd6131faa14@sudmix.de>
From: David Airlie <airlied@redhat.com>
Date: Sat, 24 Oct 2026 17:05:48 +1000
X-Gm-Features: AclHuK-0XItFovw3G1bBVKRVCBplwABReOzmq7h2Qp7p5fFLlK5pknGM07AUT98
Message-ID: 
 <CAMwc25pyuJxHJnziCvorWvFb5awsgn9RZeYQ8GXpQ3Vzs7ro6A@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/gsp: only handle GSP interrupts routed to the
 host
To: joe@sudmix.de
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vtHovZHQ34ejrxbLf3sA4xzVJcCc4YJSsXfVSfo98sE_1792825561
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 4PW35WXLSKMHZK66626ISGOMPTQ63M4X
X-Message-ID-Hash: 4PW35WXLSKMHZK66626ISGOMPTQ63M4X
X-MailFrom: airlied@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Ben Skeggs <bskeggs@nvidia.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4PW35WXLSKMHZK66626ISGOMPTQ63M4X/>
Archived-At: 
 <https://lore.freedesktop.org/CAMwc25pyuJxHJnziCvorWvFb5awsgn9RZeYQ8GXpQ3Vzs7ro6A@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 7:38=E2=80=AFPM Joe Finzel via B4 Relay
<devnull+joe.sudmix.de@kernel.org> wrote:
>
> From: Joe Finzel <joe@sudmix.de>
>
> The GSP's interrupt handler takes every pending interrupt the RISC-V
> IRQMASK enables as its own, without looking at IRQDEST, which says
> whether an interrupt goes to the host or to the GSP itself. One that
> belongs to GSP-RM, pending when the host's handler runs for the message
> queue, is reported as unknown, cleared and masked off with IRQMCLR,
> taking it away from the firmware:
>
>   nouveau 0000:01:00.0: gsp: intr 00040000
>
> NVIDIA's driver reads the interrupts routed to the host as
> IRQSTAT & IRQMASK & IRQDEST (kflcnRiscvReadIntrStatus_TU102() and
> _GA102()). Do the same, with IRQDEST from NVIDIA's register headers
> next to IRQMASK on each falcon.
>
> Seen once in a few boots on an RTX 3070 Ti (GA104, GSP-RM 570.144),
> before the login prompt. There IRQMASK reads 0x01049042 and IRQDEST
> 0x01000040: 0x00040000 is enabled but routed to the GSP.
>
> Fixes: 830531e94712 ("drm/nouveau/gsp/r535: add interrupt handling")
> Cc: stable@vger.kernel.org
> Signed-off-by: Joe Finzel <joe@sudmix.de>

This seems very reasonable.


Reviewed-by: Dave Airlie <airlied@redhat.com>

> ---
>  drivers/gpu/drm/nouveau/include/nvkm/engine/falcon.h  | 1 +
>  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c       | 1 +
>  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c       | 1 +
>  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 4 +++-
>  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c       | 1 +
>  5 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/engine/falcon.h b/drive=
rs/gpu/drm/nouveau/include/nvkm/engine/falcon.h
> index 341f133dc38..eb8adaf07fe 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/engine/falcon.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/engine/falcon.h
> @@ -63,6 +63,7 @@ struct nvkm_falcon_func {
>         int (*select)(struct nvkm_falcon *);
>         u32 addr2;
>         u32 riscv_irqmask;
> +       u32 riscv_irqdest;
>         bool reset_pmc;
>         int (*reset_eng)(struct nvkm_falcon *);
>         int (*reset_prep)(struct nvkm_falcon *);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c b/drivers/gp=
u/drm/nouveau/nvkm/subdev/gsp/ga100.c
> index d5126fe39d2..10e2813a016 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
> @@ -27,6 +27,7 @@ ga100_gsp_flcn =3D {
>         .enable =3D gm200_flcn_enable,
>         .addr2 =3D 0x1000,
>         .riscv_irqmask =3D 0x2b4,
> +       .riscv_irqdest =3D 0x2b8,
>         .reset_eng =3D gp102_flcn_reset_eng,
>         .reset_wait_mem_scrubbing =3D gm200_flcn_reset_wait_mem_scrubbing=
,
>         .bind_inst =3D gm200_flcn_bind_inst,
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c b/drivers/gp=
u/drm/nouveau/nvkm/subdev/gsp/ga102.c
> index b6b3eb6f4c0..96fa26fa612 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
> @@ -140,6 +140,7 @@ ga102_gsp_flcn =3D {
>         .select =3D ga102_flcn_select,
>         .addr2 =3D 0x1000,
>         .riscv_irqmask =3D 0x528,
> +       .riscv_irqdest =3D 0x52c,
>         .reset_eng =3D gp102_flcn_reset_eng,
>         .reset_prep =3D ga102_flcn_reset_prep,
>         .reset_wait_mem_scrubbing =3D ga102_flcn_reset_wait_mem_scrubbing=
,
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/driv=
ers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
> index 94925f1590e..463e463db24 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
> @@ -64,7 +64,9 @@ r535_gsp_intr(struct nvkm_inth *inth)
>         u32 intr =3D nvkm_falcon_rd32(&gsp->falcon, 0x0008);
>         u32 inte =3D nvkm_falcon_rd32(&gsp->falcon, gsp->falcon.func->add=
r2 +
>                                                   gsp->falcon.func->riscv=
_irqmask);
> -       u32 stat =3D intr & inte;
> +       u32 dest =3D nvkm_falcon_rd32(&gsp->falcon, gsp->falcon.func->add=
r2 +
> +                                                 gsp->falcon.func->riscv=
_irqdest);
> +       u32 stat =3D intr & inte & dest;
>
>         if (!stat) {
>                 nvkm_debug(subdev, "inte %08x %08x\n", intr, inte);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c b/drivers/gp=
u/drm/nouveau/nvkm/subdev/gsp/tu102.c
> index 11a37963bd4..823532758af 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
> @@ -420,6 +420,7 @@ tu102_gsp_flcn =3D {
>         .enable =3D gm200_flcn_enable,
>         .addr2 =3D 0x1000,
>         .riscv_irqmask =3D 0x2b4,
> +       .riscv_irqdest =3D 0x2b8,
>         .reset_eng =3D gp102_flcn_reset_eng,
>         .reset_wait_mem_scrubbing =3D gm200_flcn_reset_wait_mem_scrubbing=
,
>         .bind_inst =3D gm200_flcn_bind_inst,
>
> ---
> base-commit: fb26cf4f1df40a462ea65552a3fbcc8cfafab523
> change-id: 20261023-nouveau-gsp-irqdest-a0819d1eda96
>
> Best regards,
> --
> Joe Finzel <joe@sudmix.de>
>
>

