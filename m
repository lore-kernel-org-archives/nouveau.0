Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59853C5B572
	for <nouveau@archiver.kernel.org>; Fri, 14 Aug 2026 20:45:42 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9DDF710F6C2;
	Fri, 14 Aug 2026 20:45:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="R9V/pbTn";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id F0B1C477FD;
	Fri, 14 Aug 2026 20:29:17 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786739357;
 b=ziPfbxI1Wylx429eGag7l0m6JN7txwsX3tQW19aIPuPSmAMLktD3wfn0+b8MEAMHUNgkJ
 dBw2ROyiX7ZPd5ATgNg8bmg6ld8+B+DiNqgcqX8Fu9zKUoRhKLODJF/y6okHq/gI69M2rVo
 E/sWJe4PKZAm4HD7KV83qoQxiDstLqtCfy10efYJmn7C2sg9lkUlaIi19UqyOA7v4AV1+gm
 Z3X/EbjLQaMWSjTXsLDl6cVZel6xziUTRk479e1HvRts/enzW7NpODvRCEMFMn37NAPKAz4
 27PcrIQRu4zrQ2x6WMjPTjP8ghh9x65kEgaOeDX2QalNPoUOnKtbqlMeu6Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786739357; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=VxShuxNWjK6vy6fFi45+c1RKfCy31uup4sL6awRsGyk=;
 b=bH7P+PDBbaSz3HjdvuFia/pNHstzQutdqnQ/gZddYCVzAMwWHETP03YkHFkeHKKxkKifb
 KreTIh7r4WtBWACB6HxF6oKPpfWGeQYS5wUoXEn1ogB7KvRHKpaGYpulJ+aM1eOBvP4Exuy
 CAKEYFO8TmJYSbiyIdGl5mnAU9QD8HJBTk5daZFHUP6CaPbcjpLEPsUSL9C4RysWyZp3AP5
 WTsGX2+ldACbK8aXo1OglkHIkQ2QuB099lbWaqUu+zO49RKrDTHlGhqU4bCl+Ljzuzy/0EV
 BAHq33T5F6iHfQio/FDtXvvT0/o926Upluj5J0NImmTGaQljMwMe1M4p3kXA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 4268D477D5
	for <nouveau@lists.freedesktop.org>; Fri, 14 Aug 2026 20:29:15 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8061810ED4C
	for <nouveau@lists.freedesktop.org>; Fri, 14 Aug 2026 20:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786740336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VxShuxNWjK6vy6fFi45+c1RKfCy31uup4sL6awRsGyk=;
	b=R9V/pbTnefR9dNI+n5l8nMDA2ifuyPYC4iyIewYeX+WgSVffKEleEbZdgmuRU+tnOvH9Q/
	PMgPqrd7blBclG8Qm6M6WWms/s2PogBa2vsENkZ7sAkD0B2vEijG5oLrVGgNisiV9W8E5+
	TR54ISX49uj1F5VhPacpCkSYJfIMz3Q=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-eBBXxq9SOWCvYDe6xNEawA-1; Fri, 14 Aug 2026 16:45:34 -0400
X-MC-Unique: eBBXxq9SOWCvYDe6xNEawA-1
X-Mimecast-MFC-AGG-ID: eBBXxq9SOWCvYDe6xNEawA_1786740333
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2cec4226c70so21232645ad.1
        for <nouveau@lists.freedesktop.org>;
 Fri, 14 Aug 2026 13:45:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786740333; x=1787345133;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VxShuxNWjK6vy6fFi45+c1RKfCy31uup4sL6awRsGyk=;
        b=ryv3RaTjffLggF7ZxizySfqBBMmM1igHgWNZzOLZDYHZQAxzn7ZJVQgByEixebp80+
         pBkBMnMq2efpOTD9QhzViKdErd5crQgfhC8dqBnzrtkqNFTMIWkq60g3O6Ibd7uOUlfW
         lwhjG2vyJfFS56YdL7id/h5CooOjjRvOGcE9Mbo/nXSmy2YLp1GQAKkJqCxp6LkJ+Y8G
         gVfN3mZSl2cj989TQ2VE6dIL8p2VOUuc7b0dRnQ+WkkzZ7mXezIkwHqBka4iFfMEwmLi
         hSsUmLdqemJ/Rxrk07paeRxmHeviPLw7aoZG0eY2jDYTYBnnKiNq0f2KqmPTLhwuWS2F
         D3XA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqEf1mKQzFBoh+6C863nlT4E1h9N5lE0NYiOrjD7GKcQoE0so4GI0T1cMGH4JpDZzchp75jLZPU@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjfM6dA56zk8SWNF8B6FYQ3AgZHIxiCBMG9T6eH2asALEUnYLk
	66xE084VYRaKoou0W90A2oXl3zEimM3np7an0HOk65LPsrL1bh4s8ryfFyqBBjF+AEE4KyP9oJS
	cSfKh74g2825L2m5N7P0/BUp0OlAGGVFt3ccphOy3W4NdblBi9y7vL3K7vCRZx2R3iNiMuewXp3
	l1xlftGTCb4lKLNenIF7JfEioEDzTy19JTh+LjZrxrAA==
X-Gm-Gg: AR+sD11bq8IJKMpPcXrM/iFb8nONtwOiqnB7iVo8Zi1YyKskvZ01TgPD3kQnf5I1XVh
	fEEnQe5z/mrhNcqiTvBsamRkEoKpslTaDMIlp1iJe3psgKO5I+fNPuy3Ooennff5ZrwL6+Z8ymV
	qURtOq2nkRPjZCa4pUUxa6or59xrxhM3mBqm1YAB+YQbfhvyWgFQLJE2kctF1EkyPD0/mk4nxFa
	bqp8It3awe1Twa0
X-Received: by 2002:a17:90b:3889:b0:381:11eb:d78e with SMTP id
 98e67ed59e1d1-3933b8ace11mr8972408a91.14.1786740333039;
        Fri, 14 Aug 2026 13:45:33 -0700 (PDT)
X-Received: by 2002:a17:90b:3889:b0:381:11eb:d78e with SMTP id
 98e67ed59e1d1-3933b8ace11mr8972357a91.14.1786740332584; Fri, 14 Aug 2026
 13:45:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260814194542.781955-1-lyude@redhat.com>
In-Reply-To: <20260814194542.781955-1-lyude@redhat.com>
From: David Airlie <airlied@redhat.com>
Date: Sat, 15 Aug 2026 06:45:21 +1000
X-Gm-Features: AUfX_my66rtVpLJbBZVMgZwZu3oFOTX2t4ug31ZdJulSxidKcPEsvPNIyHxdcEw
Message-ID: 
 <CAMwc25pWnT2ScvkhvB3QZ5A5SbB9JrsnyV9HncqpeiGOzQ5bTA@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] drm/nouveau: GSP runtime PM fixes
To: Lyude Paul <lyude@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 22YyVeSFdj6tfT4EDnCnXcUQmeCKgm7_St2iAxS3NN0_1786740333
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: XYG2UY74BSGEQ3F3OOHMGPNE3QWYRPVH
X-Message-ID-Hash: XYG2UY74BSGEQ3F3OOHMGPNE3QWYRPVH
X-MailFrom: airlied@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Kees Cook <kees@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XYG2UY74BSGEQ3F3OOHMGPNE3QWYRPVH/>
Archived-At: 
 <https://lore.freedesktop.org/CAMwc25pWnT2ScvkhvB3QZ5A5SbB9JrsnyV9HncqpeiGOzQ5bTA@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat, Aug 15, 2026 at 5:45=E2=80=AFAM Lyude Paul <lyude@redhat.com> wrote=
:
>
> Runtime suspend/resume has been notoriously flakey since we started
> using the R570 GSP firmware, and possibly was also flakey for some time
> when we introduced GSP support initially.
>
> These fixes get runtime PM to be dramatically more stable then it was
> before. Unfortunately even with this patch series, there are still some
> remaining issues that need to be fixed. These likely stem from the
> currently different code path that we need to take with these fixes in
> order to get suspend/resume working.
>
> While we're making progress in understanding what exactly we're doing
> differently from OpenRM that makes this the case, it will likely take us
> a while before we actually have things working well enough to copy what
> OpenRM does. Taking precisely the same path that OpenRM takes however,
> will require some additional work - and at the very least these fixes do
> appear to get suspend/resume and runtime PM working the vast majority of
> the time.
>
> Thanks for nvidia for providing context into what all of these various
> flags and settings do!

While I did not expect the ending to be make the magic sleep magicer,
I appreciate I introduced the magic sleep and got to the same point in
trying to explain it, and failed for it to make any sense.

For the series:

Reviewed-by: Dave Airlie <airlied@redhat.com>

>
> Previous version of this patch series:
>
>   https://patchwork.freedesktop.org/series/169457/
>
> Patch-wide changes:
> * Add magic sleep, this seems to get things stable - but boy I wish I
>   could figure out why.
>
> Lyude Paul (4):
>   Revert "nouveau/gsp: fix suspend/resume regression on r570 firmware"
>   drm/nouveau/gsp/r570: Set GcOff =3D 0 in fbsr
>   drm/nouveau/gsp/r570: Enable S/R Display workaround in GSP
>   drm/nouveau/gsp: Increase delay for magic sleep in r535_gsp_fini()
>
>  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c    | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c     | 8 ++++++--
>  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c    | 8 ++++----
>  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c     | 3 ++-
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gsp.h    | 8 ++++++++
>  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h           | 2 +-
>  6 files changed, 22 insertions(+), 9 deletions(-)
>
>
> base-commit: f29ab62f7ed55eae7b246bb535ede56d3b338674
> --
> 2.55.0
>

