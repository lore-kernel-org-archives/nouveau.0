Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3985C44501
	for <nouveau@archiver.kernel.org>; Wed,  8 Jul 2026 21:56:35 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6667610F2EF;
	Wed,  8 Jul 2026 21:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fpvCR/f7";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C5B1E46F94;
	Wed,  8 Jul 2026 21:41:34 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783546894;
 b=hjKVuUxIHr4N39PmdZE3Qyem65PZ4masywlZjcetsBiQGrkfEIFvz3ke8pCFTeM706CT7
 ljBPh5jUcSyyptmCa0ahU5tjZMXO1PanonezHEdOPjAUoN6qz6t0C92jNdYtTHhnx4c5Nux
 +URnepD0tbmnez++HqAhiPOCTsxcRAIh0DdJo/QyGcD8X36ZXDRI3h+AfYbzJ3akmYiuqvH
 nFuP8HlDxO5LAUsScn1G1aN9WpQorx+Ak2VF+419uD1In5KzD4xXIUXJiKeBjdUkayXwrQj
 0H6C6eZZKSDPObDSF8LVeienSMmkoxdie+4VXEi79ued7anb/zbFx9RNjO0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783546894; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=btjBlfn1gEh32xkLC16toOwaofpK3E2AbdoJxAP/F/4=;
 b=r/cXSOrOS1jjo6lkOw99CRBDMWSQSD8aSQQ86zFHfDWkzaifogjkk9B+VzRSlBih/2QUx
 6AV5yQ8ta/hrAAT9tYeE60S6xf9uxPjup3DaYx2rXWUvsoIAFABcmzmV1aC+NCJdHqCrtuc
 WMe1MkA5DECg6sReBHyHX4lDKJ8e0N4LUyycHkf9v1k+LEIPfySL62AT2Mj/rK/i1gAPujl
 VE+oBBfvNdhldYj0tHpSWsopVpZhGTEMIQVEijBF7jUbZeBxjJbyFxucg5jXZBfkwM8VVfU
 z0h5qmmtfWVJoyj0VhUIt8kw21CKME+Ljn5XFYQVPK7tVqW4/BxAXD7zHtaw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id DCCDD46BAA
	for <nouveau@lists.freedesktop.org>; Wed,  8 Jul 2026 21:41:30 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 26E5910F2DC
	for <nouveau@lists.freedesktop.org>; Wed,  8 Jul 2026 21:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783547790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=btjBlfn1gEh32xkLC16toOwaofpK3E2AbdoJxAP/F/4=;
	b=fpvCR/f7ni7Li0uZLpRIIfJOvjFGdK8OPxyxfZMOTAAeEc/H0fov4Lm1HnS6v5gJ43Gcvp
	dvlq1MrWp5k+O7H02YT7aXQB8DIzJV+6+zCNs8GX6GvG5Zj0RFZDEELuDXkHV3TCQJtpo4
	LY0rOgDG++KbhOPdwAvNHgkFKfUnEVs=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-l3GZ8fbzMw6A96w3WwVwKg-1; Wed, 08 Jul 2026 17:56:28 -0400
X-MC-Unique: l3GZ8fbzMw6A96w3WwVwKg-1
X-Mimecast-MFC-AGG-ID: l3GZ8fbzMw6A96w3WwVwKg_1783547788
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-92e82060977so41866385a.1
        for <nouveau@lists.freedesktop.org>;
 Wed, 08 Jul 2026 14:56:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783547788; x=1784152588;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=btjBlfn1gEh32xkLC16toOwaofpK3E2AbdoJxAP/F/4=;
        b=V7Chfl7eBeDWfoWNf0M1awl2I1w6w/Ut4GPoQNW8hpVMPHPLxqggDBy3Cn1/29FS2O
         y3im7KqOPo+xq8sYoIvuhN/koGFQFpF0SZx8Lf2RiYPDXaxToVSCaWMEon/veRQkvKGG
         wBX/y8bwny9xsGWE02Q2KhOmnrLGyQE+i76vAh5hu1TLnoN9QL21Ec6tlczDBGW3E8WS
         4sdxIRktLMtXKeVJLKdqQuSOqyWLU0cWuZMA/xn6hnMASuWaPEvPeiNGVzOrNLkinUTY
         JjEi6HSpKUPtUGHsIwJjixFVInR7cGbwIbf7PEiJqpT7hcDPRvdb5+Axz8gzKE1zTvD1
         TjOw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq2VqpApibPvw0HyKuBqvN1+t1ozlh3oAyTBb/cZ8Xgb+aIo1NATHtBQ9up2yewapFFz9ETmS0C@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxziXc/oKpnhHCdukTiDANEY/gMbtALH0Zt6dvhI+xSPZ3MMfHH
	JM1uqnYaWK/CiEbbkI9MGeAlSg1l8VESRPmcq5ldOYuomFZAW2v2Cz7RKIttOtA3TPmKeSRXd+d
	dc46FD1G2DzrEsofwV/MNS1y4KFrE/EGSDQU4i+s29tToQRY2v7k150mt9i1MVQ8I6O8=
X-Gm-Gg: AfdE7ckjkVU6i0n1WaxKl/y8zxICEc9b0CJEUImJPnGqgsSnc5323WuTIdKjWYm9ZDU
	q5Qs1otvmCES2OeLkN3s7LdzE8bUkl+4tuzzvfjlbrqpV1uryu9chQYajHO6wA+gJwcADcEfFI2
	I4M8g+KhzXgyezTnVg/dZJIOubc4Q9UJJKOlH8DiTvlfmve6p2VuCQbqJqPRyW7qtpw9eRYzsTG
	RkwiWGpRP0QrRD89RLBBij02SGtLA7mNMpU2cPYDcr7ImHuW+4SjtSj93IZS0S6TaCExsTQHAyT
	XLMP1Cf67fOF5cQZjShBLnmBxuqdiRNYUiU7O/F/nlc7JgJ9p/gEpj+9YjybigHKFlol0QmbOBB
	FYw324FM=
X-Received: by 2002:a05:620a:444a:b0:911:e11e:dc0d with SMTP id
 af79cd13be357-92edac0d694mr13102485a.24.1783547788318;
        Wed, 08 Jul 2026 14:56:28 -0700 (PDT)
X-Received: by 2002:a05:620a:444a:b0:911:e11e:dc0d with SMTP id
 af79cd13be357-92edac0d694mr13096985a.24.1783547787628;
        Wed, 08 Jul 2026 14:56:27 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-92e90ca90a5sm1483479985a.32.2026.07.08.14.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 14:56:26 -0700 (PDT)
Message-ID: <b6b58477af57eb25e28eefb1a979a65aa250dc45.camel@redhat.com>
Subject: Re: [PATCH 00/10] vga_switcheroo, drm: Push fbcon handling into DRM
 clients
From: lyude@redhat.com
To: Thomas Zimmermann <tzimmermann@suse.de>, lukas@wunner.de,
	jfalempe@redhat.com, alexander.deucher@amd.com, christian.koenig@amd.com,
	airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, 	rodrigo.vivi@intel.com,
 tursulin@ursulin.net, dakr@kernel.org, deller@gmx.de
Date: Wed, 08 Jul 2026 17:56:25 -0400
In-Reply-To: <20260707135724.247562-1-tzimmermann@suse.de>
References: <20260707135724.247562-1-tzimmermann@suse.de>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xvAQbpwoUAUhJQhGtNSwaS02RuJIwMNTmGREnrHS_Kk_1783547788
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 3HPGTC4DPIQVSEHJOI4HKMJAPJQ5JXJA
X-Message-ID-Hash: 3HPGTC4DPIQVSEHJOI4HKMJAPJQ5JXJA
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, sashiko-reviews@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3HPGTC4DPIQVSEHJOI4HKMJAPJQ5JXJA/>
Archived-At: 
 <https://lore.freedesktop.org/b6b58477af57eb25e28eefb1a979a65aa250dc45.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

For both nouveau patches:

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Tue, 2026-07-07 at 15:38 +0200, Thomas Zimmermann wrote:
> Vga_switcheroo currently invokes fb_switch_outputs() to inform fbcon
> about switching of the physical outputs among framebuffer devices.
> But
> new DRM clients to not use fbdev/fbcon and might require their own
> vga_switcheroo support. Let's strictly separate them from each other.
>=20
> Remove fbdev/fbcon from vga_switcheroo. Introduce a pre_switch
> callback
> for vga_switcheroo clients to do the fbcon update. Allows for
> removing
> all direct interactions between vga_switcheroo and fbdev/fbcon.
>=20
> Also replace the existing reprobe hook with post_switch for symetry.
>=20
> At the same time, push the fbcon update into DRM's client for fbdev
> emulation. Do this with the new DRM client callback acquire_outputs,
> so that other clients can have their own handling of vga_switcheroo.
>=20
> There are only four drivers that support vga_switcheroo: amdgpu,
> radeon, i915 and nouveau. Update each of them with the new callbacks.
> When vga_switcheroo now invokes pre_switch, each DRM driver forwards
> to aquire_outputs and lets the DRM clients handle the new outputs.
>=20
> Tested with radeon on a notebook with Radeon HD 4225 and HD 5430.
>=20
> Thomas Zimmermann (10):
> =C2=A0 drm/edid: Include <linux/fb.h>
> =C2=A0 drm/client: Add acquire_outputs callback; implement for fbdev
> =C2=A0=C2=A0=C2=A0 emulation
> =C2=A0 vga_switcheroo: Add pre_switch callback to client ops
> =C2=A0 vga_switcheroo: Add post_switch callback to client ops
> =C2=A0 drm/amdgpu: Implement struct vga_switcheroo_client_ops.pre_switch
> =C2=A0 drm/i915: Implement vga_switcheroo_client_ops.pre_switch
> =C2=A0 drm/nouveau: Implement vga_switcheroo_client_ops.pre_switch
> =C2=A0 drm/nouveau: Implement vga_switcheroo_client_ops.post_switch
> =C2=A0 drm/radeon: Implement struct vga_switcheroo_client_ops.pre_switch
> =C2=A0 vga-switcheroo: Remove unused interfaces
>=20
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |=C2=A0 9 ++++-
> =C2=A0drivers/gpu/drm/clients/drm_fbdev_client.c | 23 ++++++++----
> =C2=A0drivers/gpu/drm/drm_client_event.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 18 ++++++++++
> =C2=A0drivers/gpu/drm/drm_edid.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0drivers/gpu/drm/i915/i915_switcheroo.c=C2=A0=C2=A0=C2=A0=C2=A0 | 11=
 +++++-
> =C2=A0drivers/gpu/drm/nouveau/nouveau_vga.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 28 +++++++++------
> =C2=A0drivers/gpu/drm/radeon/radeon_device.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 9 ++++-
> =C2=A0drivers/gpu/vga/vga_switcheroo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 41 +++++---------------
> --
> =C2=A0drivers/video/fbdev/core/fbcon.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 -----
> =C2=A0include/drm/drm_client.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 14 +++=
+++++
> =C2=A0include/drm/drm_client_event.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++
> =C2=A0include/linux/vga_switcheroo.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 30 +++++++++-------
> =C2=A012 files changed, 122 insertions(+), 73 deletions(-)
>=20
>=20
> base-commit: cd8abe2554ec7eba16c1d48ab508732bf93534eb

