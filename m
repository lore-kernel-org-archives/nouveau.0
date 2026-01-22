Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DCDFD6CFA2
	for <nouveau@archiver.kernel.org>; Thu, 22 Jan 2026 21:48:49 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8A9C410EAE9;
	Thu, 22 Jan 2026 21:48:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="Qm3bc/2V";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E4819404B5;
	Thu, 22 Jan 2026 21:39:57 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769117997;
 b=SctTikULZen27k566gGRDj74Ne/TueJMMv94LWD/zgMq5Dn1XIqrCmaJ+mW+Ig3rGT+lU
 s9vJ8j2fyj30UbQSALKGC9DRUSGF2InZGqCocMBFML1BQPHOV4Pu/8EEOt/h/Zw5NeUocy2
 weVzIp63157Co0SSWcfOijf8KiLOUdOrRI+n4dGYR9gkx4UFGu7S8h6WkUHi0N4oj1nZScL
 uPaE1p2TB3DYpkD9DbcS6qVbjVaHhN2puR4rkUu3xuSdXp8Nc8qvDEifw7+25ibk0d5Ydmj
 ltwbUS+IigSE0CdzAe+W7IUnYEo9CtPfNl7ciK0RAxoss8npz8yNTJ5QhOYA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769117997; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ne15GaPicXdJZl529f1ZvPcK/tvA3QDhIqLeZ0EIySk=;
 b=ZieZ+eFdbtJhQWH5Co49VORtx8hhElSuSiOzXxeq5Myy4NLqS/YXkjDJBGAUwwsQEhlQw
 kfsa1JioITQrQzbNMDSWApjRWAdACrEOImsKyjvKTAwyhVScXm/e/wi8S0ah2O49a0C9SzO
 X9f1gGKhTHuos69HksUWgP/80LWFLV8G0afR7kqGFvZWYy1nFT4ByCt0ypHuZjgpSrJqS/l
 4mPReMIVdy8NdoqnbBP0Upfp6s+mc8sWj8KrT5ErtHTWND+tUTJ/5QAipm7fOdBdw0oke0+
 tXlnpY3QkGqxdfQ15OO7WKu7pX2avhTXrhjSE5R0bnseJs8YaSh4g2X8kjww==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=darkrefraction-com.20230601.gappssmtp.com;
  arc=pass;
  dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=darkrefraction-com.20230601.gappssmtp.com; arc=pass;
 dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 649AF4031A
	for <nouveau@lists.freedesktop.org>; Thu, 22 Jan 2026 21:39:54 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8291E10EAE5
	for <nouveau@lists.freedesktop.org>; Thu, 22 Jan 2026 21:48:43 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-b8845cb580bso177886166b.3
        for <nouveau@lists.freedesktop.org>;
 Thu, 22 Jan 2026 13:48:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769118522; cv=none;
        d=google.com; s=arc-20240605;
        b=ZBAHQGdk8CftZwr9IqMNlv8DIobVfZH7j9utRA3+OfEJIdpwkj6mGUv6Jsp2MM8HbF
         XwV3FAgtb+AVdQL6q1gLtYtOohnN8Ya0fZjEiS2MrszbY7euybQquMbApvdTTl8O/aOG
         EQ+cxG7N2TEyasP/cuNueau3yCg8oyhCaEGg2mgrQprfrIvY41uE5lDeiTyfpxVuo1zJ
         wad+VFs3XjD9KPLBGwJSkNiUS6qvFKGeqQqj4Dj9lnfAwnlBGru+X9sa62oW9t0RwDzn
         Wr6XGn5kSDdQg/MHxr9BzFegZDtUgeItjmRbvqafUGo2vlDGRzZpwvuNUWQrBTdMmKvg
         m3JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ne15GaPicXdJZl529f1ZvPcK/tvA3QDhIqLeZ0EIySk=;
        fh=4j/kC59NZYtmK4o8kubS0kr+YPwD6CsLgoLaRcsLVyw=;
        b=gVKl47YysxEJj52kTcbOqigxgPpR0dxdDWpjlUzQRwG3SnACEBAahfYS20TEv7H6Yv
         QuKrGouTo3ddMPkI0mgtE7BG1Lq9Nhuj+3AZg6bkoyiOSy2Pd9Z1CsfG8cZtsx1nDY39
         i+iKLUOvGMPz2IYkjON440+SRcm/f19K26CBMvzL5tRTgZ9ps0txE2JTwiO6sm3KtGjD
         V4QIbKierHreibv0WjmeJrpcQW9UdSsYPB8cjzduu6LKYVluQZZzqLKi7R/fC+UJPULy
         +Ar/RNn1tEmpmlaJ2SqZpB7Y8DmLGOHC+rYBaOH5jASDVP+GNsGMHI8pKPoP+RzquJ6B
         AVLA==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1769118522;
 x=1769723322; darn=lists.freedesktop.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ne15GaPicXdJZl529f1ZvPcK/tvA3QDhIqLeZ0EIySk=;
        b=Qm3bc/2V6Sy19W0ScRoA7D1jmmboYemSSSmVuztppjseoR3bvX4rMLToJLMvqJpKcr
         jHIhF+2hJ+vB1yMqO9xYRDxPAMKf/6Wd7TnZZk6jHl5WZNuiA8c/hB+SMKQ4MilleLkR
         dxe8vYlaGT4VtEtxiMpM/9BVE2eEY6q9X1F7D/ribBNkvDGnru9EP0qUjTF2Omp1096T
         WVQTxWAa3g6/5FE67ptifP3CQtBnvr7esMvNhEauYpx5bXVDffdE0pxcw0aajwNbqtAc
         6zoDJ62pYQLPwC/FH5fewoxCHge0oSYK4GaQeuyGZhKTojeDnfXI/MydLu4nbVIZa1MT
         5iLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769118522; x=1769723322;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ne15GaPicXdJZl529f1ZvPcK/tvA3QDhIqLeZ0EIySk=;
        b=oicZ/ZhnOyy/mKyW8LgSyQYhxrBUH+9p4ZqLWiXiW3FFy5Y4zZPrPER1cyNUp6qLwx
         1Tg9pR4KuEKXzU9aDqTJbvg9PUuOaHXlNpe9E23yWJYvB/dxBrz2XTmG6ljL8QQ0a6Qz
         oVVmkNFO+480HvdQyAXzZ5Z7BA/8LetJ2TSRFNWAr6awTT3gjgVNigAtvMxBpxLx0Jbq
         2fQo3qk0I9xedlapLEjsiCuBquJcFwlz1fUH/Ml4J4JpQNiJ6nZREtpoKSiGucf122s/
         /eluffLlE7vyaxETv9ACTiSwosE4qDY9x2rKqKTPkl4RZ2XSEgXQiU+xP5SqiOUXoWkR
         PuxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwkS6FpyEp1sL5z8ASMaa0OHqz/0Qxvap4nUJC368jkaSyJc32Y1M6rC0C5IldlCxzZO/GqZ5E@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3HH2gBy+gcDCRhcO/LuHU6cQqjEO4n6fP0qREl9ZSJQccPJhr
	H3roEqrAlDTDMls/m+58yNt/IsPfM9sq2JPpsALbyw2jFOShY6nNxcwS7wmnu3XTOH7p1QeAQM2
	HV+wDJsgw+3tW7W7BifTWIx3PmjbKZ2kxHEsmRBACcA==
X-Gm-Gg: AZuq6aKUP04oIAjqN84bhq9VgzlK5G+2t/A1t0aIEFO2ls2uCv59ldpw77/3TK/Tyv3
	jbug9pnA29bU1lBTxk+Le9VHeyPbvw+YLyi0j0VQ1gVQO4grraoHwI3OrfriEfpMKqo2RABTFes
	MIattvt02ug4LY0L2C3DgWA+bTJOBvzNxYUWclWOrSYtH2AIOv8lFw4lJZVb7YIv6HkYpQRkmBa
	Fj/MqwQVYVwLnILrlAwk/A9wZEbzxrstPScbEB9UknsDjmo/FDMG5rPPA2H/lGrhPSprHp9
X-Received: by 2002:a17:907:97c7:b0:b87:756b:cfb3 with SMTP id
 a640c23a62f3a-b885abe432emr41485866b.19.1769118521565; Thu, 22 Jan 2026
 13:48:41 -0800 (PST)
MIME-Version: 1.0
References: <20260122202834.414058-1-airlied@gmail.com>
In-Reply-To: <20260122202834.414058-1-airlied@gmail.com>
From: M Henning <mhenning@darkrefraction.com>
Date: Thu, 22 Jan 2026 16:48:15 -0500
X-Gm-Features: AZwV_Qieo13qJt-pIVhWs1Q68RJ-Fe6d7pcBRtplXzLsbSjPwqOqca0WcxMkn_E
Message-ID: 
 <CAAgWFh0WMK5Kj-nUDeRXnz-U2+wPY-zh3uw1yAi8==SekQsPmw@mail.gmail.com>
Subject: Re: [PATCH] nouveau/vmm: start tracking if the LPT PTE is valid.
To: Dave Airlie <airlied@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000000b32290649010186"
Message-ID-Hash: BC2P3JSHQLAUQRKOHYNDQSU3K3PCLI55
X-Message-ID-Hash: BC2P3JSHQLAUQRKOHYNDQSU3K3PCLI55
X-MailFrom: drawoc@darkrefraction.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BC2P3JSHQLAUQRKOHYNDQSU3K3PCLI55/>
Archived-At: 
 <https://lore.freedesktop.org/CAAgWFh0WMK5Kj-nUDeRXnz-U2+wPY-zh3uw1yAi8==SekQsPmw@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

--0000000000000b32290649010186
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is meant to address the MMU faults reported in
https://gitlab.freedesktop.org/mesa/mesa/-/issues/14610 ?

With this patch I still see faults when running the test script I posted
there.

On Thu, Jan 22, 2026 at 3:35=E2=80=AFPM Dave Airlie <airlied@gmail.com> wro=
te:

> From: Dave Airlie <airlied@redhat.com>
>
> When NVK enabled large pages userspace tests were seeing fault
> reports at a valid address.
>
> There was a case where an address moving from 64k page to 4k pages
> could expose a race between unmapping the 4k page, mapping the 64k
> page and unref the 4k pages.
>
> Unref 4k pages would cause the dual-page table handling to always
> set the LPTE entry to SPARSE or INVALID, but if we'd mapped a valid
> LPTE in the meantime, it would get trashed. Keep track of when
> a valid LPTE has been referenced, and don't reset in that case.
>
> The SPTES field is fine at 31 limit, so just steal a bit from it.
>
> Cc: stable@vger.kernel.org
> Link: https://gitlab.freedesktop.org/mesa/mesa/-/issues/14610
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c | 33 ++++++++++++++-----
>  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h |  3 +-
>  2 files changed, 27 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> index f95c58b67633..73141dda4728 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> @@ -242,14 +242,17 @@ nvkm_vmm_unref_sptes(struct nvkm_vmm_iter *it,
> struct nvkm_vmm_pt *pgt,
>                 if (pgt->pte[pteb] & NVKM_VMM_PTE_SPARSE) {
>                         TRA(it, "LPTE %05x: U -> S %d PTEs", pteb, ptes);
>                         pair->func->sparse(vmm, pgt->pt[0], pteb, ptes);
> -               } else
> -               if (pair->func->invalid) {
> -                       /* If the MMU supports it, restore the LPTE to th=
e
> -                        * INVALID state to tell the MMU there is no poin=
t
> -                        * trying to fetch the corresponding SPTEs.
> -                        */
> -                       TRA(it, "LPTE %05x: U -> I %d PTEs", pteb, ptes);
> -                       pair->func->invalid(vmm, pgt->pt[0], pteb, ptes);
> +               } else if (!(pgt->pte[pteb] & NVKM_VMM_PTE_BIG_VALID)) {
> +                       if (pair->func->invalid) {
> +                               /* If the MMU supports it, restore the
> LPTE to the
> +                                * INVALID state to tell the MMU there is
> no point
> +                                * trying to fetch the corresponding SPTE=
s.
> +                                */
> +                               TRA(it, "LPTE %05x: U -> I %d PTEs", pteb=
,
> ptes);
> +                               pair->func->invalid(vmm, pgt->pt[0], pteb=
,
> ptes);
> +                       }
> +               } else {
> +                       TRA(it, "LPTE %05x: V %d PTEs", pteb, ptes);
>                 }
>         }
>  }
> @@ -280,6 +283,13 @@ nvkm_vmm_unref_ptes(struct nvkm_vmm_iter *it, bool
> pfn, u32 ptei, u32 ptes)
>         if (desc->type =3D=3D SPT && (pgt->refs[0] || pgt->refs[1]))
>                 nvkm_vmm_unref_sptes(it, pgt, desc, ptei, ptes);
>
> +       if (desc->type =3D=3D LPT && (pgt->refs[0] || pgt->refs[1])) {
> +               for (u32 lpti =3D ptei; ptes; lpti++) {
> +                       pgt->pte[lpti] &=3D ~NVKM_VMM_PTE_BIG_VALID;
> +                       ptes--;
> +               }
> +       }
> +
>         /* PT no longer needed? Destroy it. */
>         if (!pgt->refs[type]) {
>                 it->lvl++;
> @@ -374,6 +384,13 @@ nvkm_vmm_ref_ptes(struct nvkm_vmm_iter *it, bool pfn=
,
> u32 ptei, u32 ptes)
>         if (desc->type =3D=3D SPT)
>                 nvkm_vmm_ref_sptes(it, pgt, desc, ptei, ptes);
>
> +       if (desc->type =3D=3D LPT) {
> +               for (u32 lpti =3D ptei; ptes; lpti++) {
> +                       pgt->pte[lpti] |=3D NVKM_VMM_PTE_BIG_VALID;
> +                       ptes--;
> +               }
> +       }
> +
>         return true;
>  }
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
> b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
> index 4586a425dbe4..1fe7915b8e87 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
> @@ -46,7 +46,8 @@ struct nvkm_vmm_pt {
>          */
>  #define NVKM_VMM_PTE_SPARSE 0x80
>  #define NVKM_VMM_PTE_VALID  0x40
> -#define NVKM_VMM_PTE_SPTES  0x3f
> +#define NVKM_VMM_PTE_BIG_VALID 0x20
> +#define NVKM_VMM_PTE_SPTES  0x1f
>         u8 pte[];
>  };
>
> --
> 2.52.0
>
>

--0000000000000b32290649010186
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This is meant to address the MMU faults reported in=
=C2=A0<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/issues/14610">h=
ttps://gitlab.freedesktop.org/mesa/mesa/-/issues/14610</a> ?</div><div><br>=
</div><div>With this patch I still see faults when running the test script =
I posted there.</div></div><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 22, 2026 at 3:35=E2=
=80=AFPM Dave Airlie &lt;<a href=3D"mailto:airlied@gmail.com">airlied@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">From: Dave Airlie &lt;<a href=3D"mailto:airlied@redhat.com" target=3D"_=
blank">airlied@redhat.com</a>&gt;<br>
<br>
When NVK enabled large pages userspace tests were seeing fault<br>
reports at a valid address.<br>
<br>
There was a case where an address moving from 64k page to 4k pages<br>
could expose a race between unmapping the 4k page, mapping the 64k<br>
page and unref the 4k pages.<br>
<br>
Unref 4k pages would cause the dual-page table handling to always<br>
set the LPTE entry to SPARSE or INVALID, but if we&#39;d mapped a valid<br>
LPTE in the meantime, it would get trashed. Keep track of when<br>
a valid LPTE has been referenced, and don&#39;t reset in that case.<br>
<br>
The SPTES field is fine at 31 limit, so just steal a bit from it.<br>
<br>
Cc: <a href=3D"mailto:stable@vger.kernel.org" target=3D"_blank">stable@vger=
.kernel.org</a><br>
Link: <a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/issues/14610" r=
el=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/mesa/mes=
a/-/issues/14610</a><br>
Signed-off-by: Dave Airlie &lt;<a href=3D"mailto:airlied@redhat.com" target=
=3D"_blank">airlied@redhat.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c | 33 ++++++++++++++----=
-<br>
=C2=A0drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h |=C2=A0 3 +-<br>
=C2=A02 files changed, 27 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/dr=
m/nouveau/nvkm/subdev/mmu/vmm.c<br>
index f95c58b67633..73141dda4728 100644<br>
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c<br>
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c<br>
@@ -242,14 +242,17 @@ nvkm_vmm_unref_sptes(struct nvkm_vmm_iter *it, struct=
 nvkm_vmm_pt *pgt,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pgt-&gt;pte[pte=
b] &amp; NVKM_VMM_PTE_SPARSE) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 TRA(it, &quot;LPTE %05x: U -&gt; S %d PTEs&quot;, pteb, ptes);<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 pair-&gt;func-&gt;sparse(vmm, pgt-&gt;pt[0], pteb, ptes);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (pair-&gt;func-&=
gt;invalid) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* If the MMU supports it, restore the LPTE to the<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * INVALID state to tell the MMU there is no point<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * trying to fetch the corresponding SPTEs.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0TRA(it, &quot;LPTE %05x: U -&gt; I %d PTEs&quot;, pteb, ptes);<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pair-&gt;func-&gt;invalid(vmm, pgt-&gt;pt[0], pteb, ptes);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (!(pgt-&g=
t;pte[pteb] &amp; NVKM_VMM_PTE_BIG_VALID)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (pair-&gt;func-&gt;invalid) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* If the MMU supports it, restore th=
e LPTE to the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * INVALID state to tell the MMU ther=
e is no point<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * trying to fetch the corresponding =
SPTEs.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TRA(it, &quot;LPTE %05x: U -&gt; I %d=
 PTEs&quot;, pteb, ptes);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pair-&gt;func-&gt;invalid(vmm, pgt-&g=
t;pt[0], pteb, ptes);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0TRA(it, &quot;LPTE %05x: V %d PTEs&quot;, pteb, ptes);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0}<br>
@@ -280,6 +283,13 @@ nvkm_vmm_unref_ptes(struct nvkm_vmm_iter *it, bool pfn=
, u32 ptei, u32 ptes)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (desc-&gt;type =3D=3D SPT &amp;&amp; (pgt-&g=
t;refs[0] || pgt-&gt;refs[1]))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nvkm_vmm_unref_spte=
s(it, pgt, desc, ptei, ptes);<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (desc-&gt;type =3D=3D LPT &amp;&amp; (pgt-&g=
t;refs[0] || pgt-&gt;refs[1])) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (u32 lpti =3D p=
tei; ptes; lpti++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pgt-&gt;pte[lpti] &amp;=3D ~NVKM_VMM_PTE_BIG_VALID;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ptes--;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* PT no longer needed? Destroy it. */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!pgt-&gt;refs[type]) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 it-&gt;lvl++;<br>
@@ -374,6 +384,13 @@ nvkm_vmm_ref_ptes(struct nvkm_vmm_iter *it, bool pfn, =
u32 ptei, u32 ptes)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (desc-&gt;type =3D=3D SPT)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nvkm_vmm_ref_sptes(=
it, pgt, desc, ptei, ptes);<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (desc-&gt;type =3D=3D LPT) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (u32 lpti =3D p=
tei; ptes; lpti++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pgt-&gt;pte[lpti] |=3D NVKM_VMM_PTE_BIG_VALID;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ptes--;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
=C2=A0}<br>
<br>
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h b/drivers/gpu/dr=
m/nouveau/nvkm/subdev/mmu/vmm.h<br>
index 4586a425dbe4..1fe7915b8e87 100644<br>
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h<br>
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h<br>
@@ -46,7 +46,8 @@ struct nvkm_vmm_pt {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0#define NVKM_VMM_PTE_SPARSE 0x80<br>
=C2=A0#define NVKM_VMM_PTE_VALID=C2=A0 0x40<br>
-#define NVKM_VMM_PTE_SPTES=C2=A0 0x3f<br>
+#define NVKM_VMM_PTE_BIG_VALID 0x20<br>
+#define NVKM_VMM_PTE_SPTES=C2=A0 0x1f<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u8 pte[];<br>
=C2=A0};<br>
<br>
-- <br>
2.52.0<br>
<br>
</blockquote></div>

--0000000000000b32290649010186--
