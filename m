Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6F1CA9EBE
	for <nouveau@archiver.kernel.org>; Fri,  9 Oct 2026 21:27:00 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D359B1122C9;
	Fri,  9 Oct 2026 21:26:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DBU7BPTI";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 302EA48A0E;
	Fri,  9 Oct 2026 21:08:33 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1791580113;
 b=K4UiCRuxbD49nugTCb8zYk5lrogmdY1pVI2VjLPwLVFl+NUPduV0Tfan7MjGxj/miZ9bZ
 UTYV5aKpzXF7cUE5NNaZi3k8xxvlGi/BNQ3Ibpzx10hgo5wPw+9GDgBPXqI6lUaCzdL+7fQ
 X9fRRTYeQgUttEbEPoqisQ1NbRj5WUBavUlh5PH6ErWA/VIeWlcUzoI9tf/rPWSbh8iAJ/8
 ERHtWZnQyZGI8GdnWsdUJaAxudN2Mr6YFBpltUuKtOYxIt+GbVo99GlVZOcyj7aWxQUTR8q
 +MlnOhQ9m3F0DnhrEohjG91cLCyW4gi3wlK/BLrjADIhMQlxrAiJo+gdqJ1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1791580113; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=UibXxip+la5KHyH36kq6Z3BNIvqAoJ3dfaJsKYYfVc0=;
 b=xB8r94jFY8Va2ZJwWfUTm47k2W6xutcqPOeNfGGHW6wFQ1nrlwtyGfOKDRE3QibXTRsNr
 9GV4F04tsrZCFw1kk8Es94a6k3UbrOjU4j2WtLgAFM0jsIHuMm/utmlL17fowkPnTUiDHa3
 zVhdxYDyyMSW9g6RFR8NvZUrkOdv/XQ6oB337UhlVtVpZt1axDwKNCY7riKh5S9NkbvoAHb
 RP3O/9G7+Twc41vwkW6W1HBO8D8eOdO1ucmRNqOi0iMQwUUJ/GneJPRPe9SV8WYc0JRm4Ga
 fJKy7ZW8suVZTgleT7iNsWHHVortswUgyh49Bi1gtDFZb2eS8yjGzF1omjuQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 6659548299
	for <nouveau@lists.freedesktop.org>; Fri,  9 Oct 2026 21:08:30 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CCEB31122AD
	for <nouveau@lists.freedesktop.org>; Fri,  9 Oct 2026 21:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791581216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UibXxip+la5KHyH36kq6Z3BNIvqAoJ3dfaJsKYYfVc0=;
	b=DBU7BPTI50Vw7Xf2Rac1J399TT1DKLGfxcn+0cH0PfFaZYV39a32nVsldEBV5b6MSHWmij
	gECar3QTFbRaH84kWeho46Rm8mMZuRmqL7xy8s0kqk08Yd28V2KxtymGmfyiZREGTyAh4I
	3C1sEUQsVJkWpbwkvqTzR71Le8mymxo=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19-1mnqDgbDOuGi1YfdUE6GoQ-1; Fri, 9 Oct 2026 21:26:55 +0000
X-MC-Unique: 1mnqDgbDOuGi1YfdUE6GoQ-1
X-Mimecast-MFC-AGG-ID: 1mnqDgbDOuGi1YfdUE6GoQ_1791581214
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-535066512b0so3789181cf.0
        for <nouveau@lists.freedesktop.org>;
 Fri, 09 Oct 2026 14:26:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791581214; x=1792186014;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZxvkTxUcJf7CaZriMxWB3wlk03saYsRAfT3CN9F3Ggk=;
        b=kNRbS0odPrUIB5aTjyiTdUyoZfWVBdi/2oz42SGuUMF+4eef2JVQ+cOVZ5idr7z7q7
         3IB7IJZKD2lLvDaGEZTtC7pjD5L/Rz/bNjOeq6/kC5pAq4XiUi6DGNzV45vpxauUX1Ho
         T+z+BH61AIBmJZfugrm3t5Y8JD23V+RXhim+F6NcM02HVbFyiuziC4z4jaPtSkVlYIqa
         Sev1J7fvcZLn4U48UtNRL5nJg/CcnKunmKcUb9YiTQT+fxtta118rXsHCffm2V11cgLA
         DKq0eOnO+NkcmxmUTz0CD4ZByI4qbq6NoqVm3n9JYA6GgShXhDqBbFhqXQcnDhAuxGla
         vYmg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzZzeaMwKHpmP10KhRtwXgWuBBmyKxr6BDRwg3iaCuqOHg5Z8WNnNJQ+W1YPGw1gd4/NYr4JA2N@lists.freedesktop.org
X-Gm-Message-State: AFq9FYLEBOZcVbslYZ018bJZ8qcNqk7johAkvITN7SLlGJOld+3Zygj/
	0OU7lqW7DTZ6IOt8NsfL2l7A81mWqUE5XQzNw5QE5wWCJLY0bqpMcioq3sXyd0soIx0AE/FrRjO
	vDoNJ1RPBurtk1WIKN1qh1pFIi7O9KCkI+pcuR6AHsuwlzmr7l5VIqOWBbgTonsjKvZM=
X-Gm-Gg: AYBFou2sOFTtls/dDc2bMbs7IIYYPbdDE1UfXU1qe/WHa7sBbjmJ7qoWv4TiWk4OnQH
	6O7GyorbVjGc5MQI5c86jOzQsPepM/ANtzWHcnI0duX6LLS9W/rbQgYujSSAQ1YAnSoE3JE+k/3
	BYMJFHmFPeEJDNK7BGfUlgEf35OFpsuvO/eIbG9qXkaGlP03KY2cT++Y3GIAIJm+JUEbnWGhG42
	toWecL8e613VpOYXz5dAEAP5oWvvd+LQM/XYf//FzCoRTIu/05OHqCfZdmImUwaNrEyrT2rPCr6
	mRWixVcV2eJh7B3bi/XHf/Um3ztJHan3u8bL/dGMgGughiHbI5fXxfPMiON0PdQGk0Y6MR8=
X-Received: by 2002:a05:622a:343:b0:535:209a:2789 with SMTP id
 d75a77b69052e-5359fae42c4mr54673751cf.27.1791581214245;
        Fri, 09 Oct 2026 14:26:54 -0700 (PDT)
X-Received: by 2002:a05:622a:343:b0:535:209a:2789 with SMTP id
 d75a77b69052e-5359fae42c4mr54673491cf.27.1791581213810;
        Fri, 09 Oct 2026 14:26:53 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5359b7c0214sm27166781cf.25.2026.10.09.14.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 14:26:53 -0700 (PDT)
Message-ID: <fa0cc152304b5a387b1a074454ded7f9c540cc57.camel@redhat.com>
Subject: Re: [PATCH v2 3/3] nouveau: Fix NULL dereference in
 nvkm_gsp_gcx_ready()
From: lyude@redhat.com
To: jim.cromie@gmail.com, Danilo Krummrich <dakr@kernel.org>, Maarten
 Lankhorst	 <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Dave Airlie	
 <airlied@redhat.com>
Date: Fri, 09 Oct 2026 17:26:52 -0400
In-Reply-To: <20261009-my-fixups-v2-3-839e2bbe514d@gmail.com>
References: <20261009-my-fixups-v2-0-839e2bbe514d@gmail.com>
	 <20261009-my-fixups-v2-3-839e2bbe514d@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: G34zqPpfumaeqnyeWUeq5qAF4vlsLR0dfR-ok3qmzv8_1791581214
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: AF6HYHHZWVCQJWROWUD3XRRBC76VKDCX
X-Message-ID-Hash: AF6HYHHZWVCQJWROWUD3XRRBC76VKDCX
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Daniel Campos Ramos <Capitain_Jack@yahoo.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/AF6HYHHZWVCQJWROWUD3XRRBC76VKDCX/>
Archived-At: 
 <https://lore.freedesktop.org/fa0cc152304b5a387b1a074454ded7f9c540cc57.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Fri, 2026-10-09 at 11:44 -0600, Jim Cromie via B4 Relay wrote:
> From: Jim Cromie <jim.cromie@gmail.com>
>=20
> Commit cb4c7603678c ("drm/nouveau/gsp/r570: Add support for
> INTERNAL_GCX_ENTRY_PREREQUISITE") hooked nvif_device_gcx_ready() into
> nouveau_pmops_runtime_suspend() to consult GSP before runtime
> suspend.
>=20
> On GPUs running without GSP-RM (e.g. Volta GV100, NvGspRm=3D0, or
> missing
> GSP firmware blobs), device->gsp is instantiated but gsp->rm remains
> NULL. nvkm_udevice_gcx_ready() checked "!gsp" instead of verifying
> nvkm_gsp_rm(gsp), allowing non-RM instances to invoke
> nvkm_gsp_gcx_ready(). nvkm_gsp_gcx_ready() then unconditionally
> dereferenced gsp->rm->api, causing a kernel oops:
>=20
> =C2=A0 RIP: 0010:nvkm_gsp_gcx_ready+0x10/0x30 [nouveau]
> =C2=A0 Code: ... 48 8b 87 70 0e 00 00 <48> 8b 40 18 ...
> =C2=A0 RAX: 0000000000000000 RDI: ffff8c9555fca000
> =C2=A0 Call Trace:
> =C2=A0=C2=A0 nvkm_udevice_mthd+0xa5/0x150 [nouveau]
> =C2=A0=C2=A0 nvkm_ioctl+0xcc/0x1d0 [nouveau]
> =C2=A0=C2=A0 nvif_object_mthd+0x110/0x1e0 [nouveau]
> =C2=A0=C2=A0 nvif_device_gcx_ready+0x36/0x60 [nouveau]
> =C2=A0=C2=A0 nouveau_pmops_runtime_suspend+0x39/0x140 [nouveau]
>=20
> Instruction decode shows `mov rax, [rdi+0xe70]` loads gsp->rm (0x0),
> and `<48> 8b 40 18` (`mov rax, [rax+0x18]`) faults accessing rm->api.
>=20
> Fix by:
> 0. Checking !nvkm_gsp_rm(gsp) in nvkm_udevice_gcx_ready() so non-RM
> =C2=A0=C2=A0 devices report GC6/GcOff ready and bypass the GSP call entir=
ely.
> 1. Guarding gsp and gsp->rm in nvkm_gsp_gcx_ready() before inspecting
> =C2=A0=C2=A0 gsp->rm->api->gsp->gcx_ready.
>=20
> Fixes: cb4c7603678c ("drm/nouveau/gsp/r570: Add support for
> INTERNAL_GCX_ENTRY_PREREQUISITE")
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
> =C2=A0drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h | 2 +-
> =C2=A0drivers/gpu/drm/nouveau/nvkm/engine/device/user.c | 2 +-
> =C2=A0drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c=C2=A0=C2=A0=C2=A0 | =
2 +-
> =C2=A03 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> index ed5c6e0e68d3..933f13ed2a50 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> @@ -274,7 +274,7 @@ struct nvkm_gsp {
> =C2=A0static inline bool
> =C2=A0nvkm_gsp_rm(struct nvkm_gsp *gsp)
> =C2=A0{
> -=09return gsp && (gsp->fws.rm || gsp->fw.img);
> +=09return gsp && gsp->rm && (gsp->fws.rm || gsp->fw.img);
> =C2=A0}
> =C2=A0
> =C2=A0#include <rm/rm.h>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
> index f78e6b9b4292..d469437eb991 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
> @@ -201,7 +201,7 @@ nvkm_udevice_gcx_ready(struct nvkm_udevice *udev,
> void *data, u32 size)
> =C2=A0=09} *args =3D data;
> =C2=A0=09int ret =3D -ENOSYS;
> =C2=A0
> -=09if (!gsp) {
> +=09if (!nvkm_gsp_rm(gsp)) {
> =C2=A0=09=09args->v0.ready =3D NV_DEVICE_GC6_READY |
> NV_DEVICE_GCOFF_READY;
> =C2=A0=09=09return 0;
> =C2=A0=09}
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
> index e475d0e8fa7b..ea895f04293a 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
> @@ -51,7 +51,7 @@ nvkm_gsp_intr_stall(struct nvkm_gsp *gsp, enum
> nvkm_subdev_type type, int inst)
> =C2=A0int
> =C2=A0nvkm_gsp_gcx_ready(struct nvkm_gsp *gsp)
> =C2=A0{
> -=09if (!gsp->rm->api->gsp->gcx_ready)
> +=09if (!nvkm_gsp_rm(gsp) || !gsp->rm->api->gsp->gcx_ready)
> =C2=A0=09=09return NV_DEVICE_GC6_READY | NV_DEVICE_GCOFF_READY;
> =C2=A0
> =C2=A0=09return gsp->rm->api->gsp->gcx_ready(gsp);

