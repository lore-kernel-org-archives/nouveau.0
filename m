Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FAD11099B30
	for <nouveau@archiver.kernel.org>; Fri, 20 Mar 2026 20:27:27 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3F74810EC22;
	Fri, 20 Mar 2026 20:27:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RhHsNnN/";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id DDBC44524A;
	Fri, 20 Mar 2026 20:16:28 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774037788;
 b=utfUsU3IqdWA/Imk1ilF/kuyvcuUD2qE3NEO6HL1JcE4NSPQ6cvQrZkYjaalil1N+QJee
 RvCKvVZslK3X+Lrpdmj1Yl8uiIP8xul0k8b7vk+bf3GX/LE//RPbcGvgaMkX7Xg/zYnN+Is
 bpt/txfZtLhmrl6h5A2dHSnhErYcg/SLepFx6KEe7Yc+ORnh701dVizdFXNl1QJQiLzPyAj
 cwPybPCC4QWavd+92jc/OqPXCRTsaKNoNWAo2j0PxUU5CKJvLB9mctuw4EMW1u9ftgkHSZr
 VdpK2aDn+shRwEqmiNlAPOLELP19T1qpydkFFOJyN1H8YGgAs//NAclhGYvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774037788; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=AJMXPSFWArYmrnP7zLSkM+CTFVv6oJClq2Ka1iADR9M=;
 b=XavD47c7xf+nsBicahGFbUwTcV5N6o0CzrKxuQbKWXfzbAjAyza7crgTDiQCCSnoY+VeV
 KJhwGVyUP3cQeHEDz0pJ4ds7+3F+ANRcSyZ381/tS+BB+pS31XO/3Odw3aohsKUoHJS0RHr
 r8czGUrq1939r5X3Mmqhik0RCSbo1PdJ7d+ES1jbigGSusJ1FaIQWqMWKb2KscWqwmAIZit
 +0OGJDyv95f3crlub1uw+5/TPpCs6KxPtPhH+2UgvAHgWbr7SdjbLmtRciaU1u3U7KxbZ6o
 qeYLrotZnTMbHsVGk2RhFkn/sCVchQqSxEOfAPr/S0DkBAjdoyFbtvd4QnqA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B6A5644C8D
	for <nouveau@lists.freedesktop.org>; Fri, 20 Mar 2026 20:16:24 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BFCAE10EB04
	for <nouveau@lists.freedesktop.org>; Fri, 20 Mar 2026 20:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774038439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AJMXPSFWArYmrnP7zLSkM+CTFVv6oJClq2Ka1iADR9M=;
	b=RhHsNnN/i7WVOmW6KhKvohRwQtvEIeLF3rrePujJJC8AtmY7ey8sMvbaxAmX8pqqMPyLBl
	OzdOaW6fK9ZIRWO6a5Sd1Jn8cwHLlVhxD9Pu3/uwVB7AiK8lEjgp6QkYgbxp7g//zv9FpS
	nk6/UkE9WL09aj4FsqZAS7XuwXlP2Uw=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-ylGrhoxXOju79NhbcNKIeg-1; Fri, 20 Mar 2026 16:27:17 -0400
X-MC-Unique: ylGrhoxXOju79NhbcNKIeg-1
X-Mimecast-MFC-AGG-ID: ylGrhoxXOju79NhbcNKIeg_1774038437
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-89a108d17d2so121509886d6.2
        for <nouveau@lists.freedesktop.org>;
 Fri, 20 Mar 2026 13:27:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774038437; x=1774643237;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MB0+rSNGBKBl0fATluwYhfYR/8s/ouHiFI/my1DN3XI=;
        b=NzhghZ9v6LRv6nZ/FCq2GpV44ETm7+8/XThVlfqtHgx1GWpawG9nIzGDzyYGoa6Csd
         chwFsXxtRiW7M6K3+pUhwms+efjNyNBA/TYRIxjazu9/hWRSSHQDUhUQs046OUnFw3wn
         3rEpBjjwDIHDwIgfJrUEqw3iCP+hUdhXtHOMUaiYHth2VByOzDcvfDnonP84TvGGBrGD
         sWMypZpe/Ush+coIyWiVwRwevTijmQ5+4FgDBCSPP46azOWFrc5QsJ0G+WD3m8Q91H+B
         68tNCeJRL9uqMIip7QmMH8Fp8Ap88CHcxl+paWzIfwwaMGZ9kZuW4eaeJoIxbtLM6E8O
         947A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHK+oMK5QpGjqFWFwT5ejFZ4dgnPjqY9ftDw7LSumzC4zAJZ1fWx/S+RlCP0liPwQHUFjklJY6@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDYc/+rCKUfJU2KQP7F9cf5cVj4M6Wp45ldZjJh3p8km3t99CX
	Z3dAo6iKOo9ooBcojAOYtL9b485v/fWWIsXyCT+eggVttKABqrhEzSU4k0v6RkybEqHTvzTtBlL
	rqfjFA6tT7pursTVuARLi1AuDZFN8CBCoT977KosUVjfEL+KJDchv9NtRtK2UufxdH10=
X-Gm-Gg: ATEYQzynXpi2OPmnFXbPXvf2MTIa6nscgy6B2V5oUMan7G+uP9upxn/HoUw/y3WF/TG
	msOrKxh+m+LYk1bcv3JX4BEcufihaMz/XIcCkHRgwp2v7Yb0WTEVbZJ29zH9gUe5uYlRbp3ZzpJ
	47Fh31FvIluqalLhib+Xjm/YZ3ZXTuMMc17sRrW42QGascXuxxVvxuOrmhb6bvY/2UU6mVZDMAx
	JZg186rZ/swuZzVyXW7gsescMKCngRjXPkT0/xPbmua7TUql13PNgMB5z5QqqFsc2d9hiU0wiuk
	Frv0zLoYs9BbCZqXxheQFNgp1b/aTaT9GHMp27v8V+5pdPqvON9EYfY8gHApsPJbWAPPy7x7BcX
	MurH+vMcka9yniwCzsg==
X-Received: by 2002:ad4:5968:0:b0:89c:4ea7:a70f with SMTP id
 6a1803df08f44-89c859e8c82mr70322146d6.14.1774038437326;
        Fri, 20 Mar 2026 13:27:17 -0700 (PDT)
X-Received: by 2002:ad4:5968:0:b0:89c:4ea7:a70f with SMTP id
 6a1803df08f44-89c859e8c82mr70321736d6.14.1774038436929;
        Fri, 20 Mar 2026 13:27:16 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-89c85361ac2sm27015786d6.41.2026.03.20.13.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 13:27:16 -0700 (PDT)
Message-ID: <5cbcc6ff5b5dd72e0c4737cdff8ef897fa10cb61.camel@redhat.com>
Subject: Re: [PATCH v11 43/65] drm-dyndbg: DRM_CLASSMAP_USE in nouveau
From: lyude@redhat.com
To: Jim Cromie <jim.cromie@gmail.com>, airlied@gmail.com, simona@ffwll.ch,
	jbaron@akamai.com, gregkh@linuxfoundation.org, Danilo Krummrich
 <dakr@kernel.org>,  Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann	
 <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Fri, 20 Mar 2026 16:27:15 -0400
In-Reply-To: <20260313132103.2529746-44-jim.cromie@gmail.com>
References: <20260313132103.2529746-1-jim.cromie@gmail.com>
	 <20260313132103.2529746-44-jim.cromie@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CAaKLmPAeJ3mPAaYg7NqY33HKHA3OOCx1D2-SzvDEFQ_1774038437
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 2MHHMYT2YQAIJRQ3TGFD2AUMYZ4MBG6H
X-Message-ID-Hash: 2MHHMYT2YQAIJRQ3TGFD2AUMYZ4MBG6H
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 christian.koenig@amd.com, matthew.auld@intel.com,
 arunpravin.paneerselvam@amd.com, louis.chauvet@bootlin.com,
 skhan@linuxfoundation.org, pmladek@suse.com, ukaszb@chromium.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/2MHHMYT2YQAIJRQ3TGFD2AUMYZ4MBG6H/>
Archived-At: 
 <https://lore.freedesktop.org/5cbcc6ff5b5dd72e0c4737cdff8ef897fa10cb61.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Fri, 2026-03-13 at 07:20 -0600, Jim Cromie wrote:
> Following the dyndbg-api-fix, replace DECLARE_DYNDBG_CLASSMAP with
> DRM_CLASSMAP_USE.=C2=A0 This refs the defined & exported classmap, rather
> than re-declaring it redundantly, and error-prone-ly.
>=20
> This resolves the appearance of "class:_UNKNOWN_" in the control file
> for the driver's drm_dbg()s.
>=20
> Fixes: f158936b60a7 ("drm: POC drm on dyndbg - use in core, 2
> helpers, 3 drivers.")
>=20
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_drm.c | 12 +-----------
> =C2=A01 file changed, 1 insertion(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c
> b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index 5d8475e4895e..d205b58aff70 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -74,17 +74,7 @@
> =C2=A0#include "nouveau_uvmm.h"
> =C2=A0#include "nouveau_sched.h"
> =C2=A0
> -DECLARE_DYNDBG_CLASSMAP(drm_debug_classes,
> DD_CLASS_TYPE_DISJOINT_BITS, 0,
> -=09=09=09"DRM_UT_CORE",
> -=09=09=09"DRM_UT_DRIVER",
> -=09=09=09"DRM_UT_KMS",
> -=09=09=09"DRM_UT_PRIME",
> -=09=09=09"DRM_UT_ATOMIC",
> -=09=09=09"DRM_UT_VBL",
> -=09=09=09"DRM_UT_STATE",
> -=09=09=09"DRM_UT_LEASE",
> -=09=09=09"DRM_UT_DP",
> -=09=09=09"DRM_UT_DRMRES");
> +DRM_CLASSMAP_USE(drm_debug_classes);
> =C2=A0
> =C2=A0MODULE_PARM_DESC(config, "option string to pass to driver core");
> =C2=A0static char *nouveau_config;

