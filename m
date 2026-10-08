Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBCCDCA6017
	for <nouveau@archiver.kernel.org>; Thu,  8 Oct 2026 22:19:59 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BDDFE10FDA6;
	Thu,  8 Oct 2026 22:19:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IAl2FVKD";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2F374489DC;
	Thu,  8 Oct 2026 22:01:35 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1791496895;
 b=r6wfw/AmpAkZMIvI3U57hcsaX79GHP+f++NOarW5/wfqg9U7wwQx7cVc1zVfah6D9PDIl
 RNqQz/B3GqnluaY9frvghnEHnMGZPWrA6wEW8X2m+KK7ToChpuUGofMFPdKgCqzRqeoQKth
 bGUfPvNtnUbLCQqaNEcgwkeeVEhq+ZpOovv7tcaIV88HyIpijwH7vCGgCw+dYC6RehxAAiK
 oEt0wdASCP1QTe/XK8EM8NquVWCpNZ7WSBC0rlqLIyXBo9V90zNJ2skjFLbynBY4hDtEXRr
 3trD5HXkKoIDrPAksSwjrIN0Gbly0e8Fq1X1oocbpf6SljxL+b/QVk0CNgqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1791496895; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=q26pHtJq5AW1BVb5JdpMBhNJVBPJeWS+ScAq8jhsGho=;
 b=Kcb+a9zXOTVdmfiJI1jKCO4MlN5Z9ZWr62aLSi7GdTRI1A3FcL1l6qiMm3mZ3ZvqJmdDH
 GyNJeQH0LokGHrLCjlpogbgF4lCh4TUxxsb5T1M1tNcUMz7oQ9pC7agGKQijY9FsClKg/tL
 zGRIlzUgdIl3WKXqgyOodei9VSJPX0ED10uUB7rK5hGwfOnr4urZNIfO3V6Zi5x7Gye0eVW
 wsDSKa6EYMjNyJGV/EQ3PCwoi+OiIWljffQKAFxKxp+qc4X8CMHHsBwWYQ5em99h4LFoAz7
 g/nojpcBEVURlaX93zPkAeauQ1RUgsoBWJq0xewfVqk1GHacZR+9HtRaD+NQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id CBEBC48890
	for <nouveau@lists.freedesktop.org>; Thu,  8 Oct 2026 22:01:32 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1E15310FD90
	for <nouveau@lists.freedesktop.org>; Thu,  8 Oct 2026 22:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791497996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q26pHtJq5AW1BVb5JdpMBhNJVBPJeWS+ScAq8jhsGho=;
	b=IAl2FVKDGZ45mH4IW4uAg+3UxWQH0JfYMOv/Q6LrePe33ajf3QEDtsDlH6QcR9BCNMGQQa
	78KFdVrLID07rKNY50Fj41KtN/vTUSn9UWyYyEecnuq4WYmuD1AMXbTGlRtX/QqrZcImmx
	HGGF7w7HbghUCC/UKvjSEAX05QojAi4=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-358-PqX07P5mNPWWlmmbeLPK0A-1; Thu, 08 Oct 2026 18:19:53 -0400
X-MC-Unique: PqX07P5mNPWWlmmbeLPK0A-1
X-Mimecast-MFC-AGG-ID: PqX07P5mNPWWlmmbeLPK0A_1791497992
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93ae8e7e546so1166370485a.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 08 Oct 2026 15:19:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791497992; x=1792102792;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GjfKe0UMSMorT3desuNDK/FRCwDViDwkhbHy5Q186yc=;
        b=1McVWZBX/J1ndRGU7BG65wNwBhq92FSR1/qSA4KhVynAAGjyb5pUlvavbd6p7qnV/d
         6ic+NTJEGhjoesQ/cIhZfJoUeCH1lZVZGF9GG5t/gZSGhClzKjL/AU7JzzGtZYmpmIkA
         KSOOmHBH9kzHve0537BHD854f8TpLaQQGgjQ2iklDD3NtqhdpIUWOGnaVDLPH6WK9kFO
         CNDx/ZD4vb0p4OZZC5HKeitpUyAvHFFWFhZp0b43MOPdpZdhdL945OSSfgU1QnyiVKcq
         tP1dpaM4DPp0vh5418aQynFOJkXHeK/sW9/bfQYc2iitW7XlTqMzXYkbZnO76jYzGfsb
         IIQA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxMSr9uCb5PvMz1HuwKUN8ASMtGknEpax8xbT33psuyMWKSb3HnUShnvojEFc9MHcGaoE6yQJ0S@lists.freedesktop.org
X-Gm-Message-State: AFuF++lMZlGYxppLCcZpkeO/u7rUT+BlVJdakFbfJQt6A+grB2mh9QnE
	32BXf+Pu3IH5n3ctWSbDqR/7AN4W2hDD9j+JMVViUOE/oaERbgt4KkEF23hiZC4A4qhpUteRmqb
	qPM6UUxipIIX11WaKt0QLFlwdYE/bT63Aqx4AuROyW6dRDhMQprh3IOINtHABh7aOvoU=
X-Gm-Gg: AYBFou2V4CiTVAq2Q41qbBJRyelYONjJVjXwZGELUHqlyh3n7oZodwk/M/LWG4Lii3S
	32DiWJefw5tOTEVa4x941TYhx5KgwCuzP3wEwjVHDo72jrZzbl41z0V/oZyxLJoNFEleGvr9SMF
	Rj2+Cc0HVY4VVv7eczkFF49ND2KBPRb+oG/C6N6+RCsFuA0N+NMcSiphtybpwWR4mgl8j2I7+Ba
	7XPC5RuwPD2Z+7RvGG2Pwt4sakOtX59h+jbxc3VU8ZuJ7kD473JkO/+1l3HUjzD0TqV+xRelV4G
	yG0jvi35pUYPDIt3swz0A4HiHueG7TX1BBkvGuB2SEbJIfY7jN7lF2bT62TMDBpXMrgojT8=
X-Received: by 2002:a05:620a:198d:b0:93e:942f:b8ae with SMTP id
 af79cd13be357-93ebd1dfff5mr2778285a.26.1791497992306;
        Thu, 08 Oct 2026 15:19:52 -0700 (PDT)
X-Received: by 2002:a05:620a:198d:b0:93e:942f:b8ae with SMTP id
 af79cd13be357-93ebd1dfff5mr2774485a.26.1791497991653;
        Thu, 08 Oct 2026 15:19:51 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93eb986c350sm38274685a.22.2026.10.08.15.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 15:19:51 -0700 (PDT)
Message-ID: <778d3018e596c0be1db309b5e36aa361db89c9bb.camel@redhat.com>
Subject: Re: [PATCH 3/3] drm/nouveau/gsp: Fix NULL dereference in
 nvkm_gsp_gcx_ready()
From: lyude@redhat.com
To: jim.cromie@gmail.com, Danilo Krummrich <dakr@kernel.org>, Maarten
 Lankhorst	 <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Dave Airlie	
 <airlied@redhat.com>
Date: Thu, 08 Oct 2026 18:19:50 -0400
In-Reply-To: <20261002-my-fixups-v1-3-a83d20f9d3fe@gmail.com>
References: <20261002-my-fixups-v1-0-a83d20f9d3fe@gmail.com>
	 <20261002-my-fixups-v1-3-a83d20f9d3fe@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZZbc7_bCgVcvYTSY3EgCOC6I-0RYxbfPHKCCjRDrUPE_1791497992
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: YWSTZYH64WJF24OLUDXDLGOJ4W7LVUZL
X-Message-ID-Hash: YWSTZYH64WJF24OLUDXDLGOJ4W7LVUZL
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YWSTZYH64WJF24OLUDXDLGOJ4W7LVUZL/>
Archived-At: 
 <https://lore.freedesktop.org/778d3018e596c0be1db309b5e36aa361db89c9bb.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to drm-misc-fixes in a moment, thanks!

On Fri, 2026-10-02 at 12:09 -0600, Jim Cromie via B4 Relay wrote:
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
> =C2=A0drivers/gpu/drm/nouveau/nvkm/engine/device/user.c | 2 +-
> =C2=A0drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c=C2=A0=C2=A0=C2=A0 | =
2 +-
> =C2=A02 files changed, 2 insertions(+), 2 deletions(-)
>=20
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
> index e475d0e8fa7b..9e07d67dcb0f 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
> @@ -51,7 +51,7 @@ nvkm_gsp_intr_stall(struct nvkm_gsp *gsp, enum
> nvkm_subdev_type type, int inst)
> =C2=A0int
> =C2=A0nvkm_gsp_gcx_ready(struct nvkm_gsp *gsp)
> =C2=A0{
> -=09if (!gsp->rm->api->gsp->gcx_ready)
> +=09if (!gsp || !gsp->rm || !gsp->rm->api->gsp->gcx_ready)
> =C2=A0=09=09return NV_DEVICE_GC6_READY | NV_DEVICE_GCOFF_READY;
> =C2=A0
> =C2=A0=09return gsp->rm->api->gsp->gcx_ready(gsp);

