Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AEB9CA6016
	for <nouveau@archiver.kernel.org>; Thu,  8 Oct 2026 22:19:18 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 517B410FD97;
	Thu,  8 Oct 2026 22:19:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gsMPfsR9";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C2F96489D8;
	Thu,  8 Oct 2026 22:00:53 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1791496853;
 b=uyCKp8LnfgJVta+MrweSXB19l9eKk5YBPcjYZ5HSMji5vJmfXD8WNeB3O9lADn24YBjRy
 xLCKtp6vMyBGdsPsBuHLtq568OYCrVFoVGFt8njMNH8y1OAKY/T09ruQdpJZDsq4Tqj5ybw
 xGLBic8ZLU8texu4ezbgEP2rjREaIXADHfNS58fo4teBqAUlLKOUPQNj4uONoXh+yHZM0FF
 M5XF7yBWBdUkR2OLTUHcCSJ8zYGWJ9qn5rYPlOT8p3WOU4OPQ17Uz9lEAPXdyygx5No9Ych
 DjQfMD1uDx/HkMSmxC8bFC9fCXwS2/etyyZIkUy8byvRxw7UH/1hgDxdeiTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1791496853; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=pudxvFGTr2pB6xfMIe99TlxTGdnfY6LwYZPysrmQyfo=;
 b=mWwMiUFPAneg64EEH50rVTNmTIQhFhDlyEwmZdavOn8RQ3osN1/T2sXM7BlEEZgmOC7fp
 B+of4+rW46uOpoIfHkPO65ATiLYSEff9TZ9evHcU9Wk9bw95ytC+W1INvtVED6yZy8SwtHM
 kqC1dIBX3uiL296s+pazxJQEoH2xx/G1NIDAGgW5WluIk7wmkYl/oqtf2tTa4fOoPgS6Pcm
 fp8HS7P1vuKSKX0jBvd/Glq+PIUPhLObkjS4kY7hQDmyOVJIbYTSTROFQOESZz7L3xzGepj
 V9QOnr8iPqGYvLemeYxKp4ZvuYFWLQ7DAAlUkkCCw+tJPcW1EYF2Mp2KIjAA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 34BD048890
	for <nouveau@lists.freedesktop.org>; Thu,  8 Oct 2026 22:00:51 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7D26E10EA43
	for <nouveau@lists.freedesktop.org>; Thu,  8 Oct 2026 22:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791497954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pudxvFGTr2pB6xfMIe99TlxTGdnfY6LwYZPysrmQyfo=;
	b=gsMPfsR97Al5Cc2q/oRTbKC1Q5b6MraE6tqmjA/PNYYE/QYyKzvkdCYUkEmQUxzzp8cmYT
	E3yvFyHK8UW5KDfD3bR4s6DKcbpYC/e+x11QuU2XfEbxZwQvwoC1GGItwGG35pykSkfkk/
	kzflEm81Lpro7qBCjxnmScCBPRFIUn0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-g806bkKhMEG4_daeeNafvQ-1; Thu, 8 Oct 2026 22:19:13 +0000
X-MC-Unique: g806bkKhMEG4_daeeNafvQ-1
X-Mimecast-MFC-AGG-ID: g806bkKhMEG4_daeeNafvQ_1791497953
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-917870a9be3so27547976d6.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 08 Oct 2026 15:19:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791497953; x=1792102753;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xivNdc/2GIXbbGG/+ABdmEro/TPM8rs2SiF4VzboSZQ=;
        b=R2ggSDcuHCRzhtUltQyPtESyu6s/xPpaB6VfbB7V91sTbUl7Dec8xxEJqXUidfbWNK
         qWtwIiWtOx5E759zeEcPLB5OyJ9mPmYBrVa9BHV/MvKMAr2eiF3R8QNBOAZ33o6Pp8Ov
         LtYGvY2S8xCMce/+kePAqEQuuMS4OQZtQ+mImW5z40EhJpcGKhnUCFRtzdaxvIl+7q8N
         RhdCXWNjDN/z1oymm4vP/ly2hzMWWXZl1TAhWUw1QmoF5nr5cm7i5eoemJBMhQX0SiNc
         kbV7VpggVwzM0HstBJkkWL+VQdymutnTBzEKq/p038nLyjq7DzE08oliAmpaplwImbAT
         ZL0A==
X-Forwarded-Encrypted: i=1;
 AKwUvByoHqpo46UKkgegQqBH5ygSYBx7zDBzEJA++fEBNfn4d2EfybnQzh/FnTb56gSpy1lKF1Tonm6Z@lists.freedesktop.org
X-Gm-Message-State: AFuF++ldTY6gDpil/FPyz8PRW0vb3C6WDSk9QfR2K0qcO78u+VVbnRrc
	rt+pLFtrMUDOhBimVfwVTK+GQSvML2c2YEB8DmBPtkmtoisj4bFNz4+d+jyv4OuFfh/IV/KHc55
	xgpuMbLYcKcJ4UTuQGES32JkCdQbCHuWKuP85czGNL1CRFhv/6pYSDOAy8073z5di1JU=
X-Gm-Gg: AYBFou0lwDC4Au50CTH4ox4aQoj0DUBQISWxg6dgj955Rwx0/YZuWaUn9vHQ/Pdl5j4
	FpJ613s0aWb5oB4bVmKibhraBesRxv845uyvx7pa709nhnqS7QdoL+Jxi4jmgC1qd6EEywCMElT
	9H77ixXeS4dWj/QAdJqTcAZB0VVogmec4l0PYjRnZYFtM8EjVyZ+p3jal9waw+W8AnaTJKG0s0c
	rMUcz5kTtnlLIWqMtEwdBHG3/PmzeRN2qwMH7Gx12JmDu1dgetQL/C+JyzPEoe432mq5V/xWTC4
	+hYHexPyKD0q/rleP0cRUhms193gW5TKE2xSXHq9PQlJ2o0GGheJofcGaTIPgUlvKp22aHI=
X-Received: by 2002:a05:620a:8389:b0:93e:9808:2e1f with SMTP id
 af79cd13be357-93eb96ef267mr79425485a.44.1791497952929;
        Thu, 08 Oct 2026 15:19:12 -0700 (PDT)
X-Received: by 2002:a05:620a:8389:b0:93e:9808:2e1f with SMTP id
 af79cd13be357-93eb96ef267mr79420785a.44.1791497952277;
        Thu, 08 Oct 2026 15:19:12 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93eb9847f9dsm38714285a.8.2026.10.08.15.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 15:19:11 -0700 (PDT)
Message-ID: <4e16aa7b2a6bba489326428a4fc7650ae8adcfcb.camel@redhat.com>
Subject: Re: [PATCH 2/3] drm/nouveau: Fix NULL pointer dereference in
 GET_ZCULL_INFO ioctl
From: lyude@redhat.com
To: jim.cromie@gmail.com, Danilo Krummrich <dakr@kernel.org>, Maarten
 Lankhorst	 <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Dave Airlie	
 <airlied@redhat.com>
Date: Thu, 08 Oct 2026 18:19:10 -0400
In-Reply-To: <20261002-my-fixups-v1-2-a83d20f9d3fe@gmail.com>
References: <20261002-my-fixups-v1-0-a83d20f9d3fe@gmail.com>
	 <20261002-my-fixups-v1-2-a83d20f9d3fe@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YwQ-uLfnxRJyVkOnt7eo1NE7jWytZw6QlkffgEwo1T8_1791497953
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: FKXO24TVMOI2ZN6PFXF4X4QAXTVOMXI4
X-Message-ID-Hash: FKXO24TVMOI2ZN6PFXF4X4QAXTVOMXI4
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FKXO24TVMOI2ZN6PFXF4X4QAXTVOMXI4/>
Archived-At: 
 <https://lore.freedesktop.org/4e16aa7b2a6bba489326428a4fc7650ae8adcfcb.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to drm-misc-fixes in just a moment

On Fri, 2026-10-02 at 12:09 -0600, Jim Cromie via B4 Relay wrote:
> From: Jim Cromie <jim.cromie@gmail.com>
>=20
> When graphics engine firmware fails to load or initialization aborts
> early, nvxx_gr(drm) returns NULL. Calling
> DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO
> causes nouveau_abi16_ioctl_get_zcull_info() to dereference gr at
> offset
> 0xf0 without checking for NULL, triggering a kernel page fault.
>=20
> Validate that gr is non-NULL before inspecting gr->has_zcull_info.
>=20
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
> Aug 14 09:21:52 frodo kernel: BUG: kernel NULL pointer dereference,
> address: 00000000000000f0
> Aug 14 09:21:52 frodo kernel: #PF: error_code(0x0000) - not-present
> page
> Aug 14 09:21:52 frodo kernel: Oops: Oops: 0000 [#1] SMP NOPTI
> Aug 14 09:21:52 frodo kernel: RIP:
> 0010:nouveau_abi16_ioctl_get_zcull_info+0x17/0xa0 [nouveau]
> Aug 14 09:21:52 frodo kernel: Code: 00 00 00 90 90 90 90 90 90 90 90
> 90 90 90 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 48 8b 47 40 48 8b
> 00 48 8b 80 70 02 00 00 <80> b8 f0 00 00 00 00 74 72 8b 90 c0 00 00
> 00 89 16 8b 90 c4 00 00
> Aug 14 09:21:52 frodo kernel: Call Trace:
> Aug 14 09:21:52 frodo kernel:=C2=A0 <TASK>
> Aug 14 09:21:52 frodo kernel:=C2=A0 drm_ioctl_kernel+0xae/0x100
> Aug 14 09:21:52 frodo kernel:=C2=A0 drm_ioctl+0x2e0/0x560
> Aug 14 09:21:52 frodo kernel:=C2=A0 ?
> __pfx_nouveau_abi16_ioctl_get_zcull_info+0x10/0x10 [nouveau]
> Aug 14 09:21:52 frodo kernel:=C2=A0 nouveau_drm_ioctl+0x58/0xc0 [nouveau]
> Aug 14 09:21:52 frodo kernel:=C2=A0 __x64_sys_ioctl+0xb9/0x100
> Aug 14 09:21:52 frodo kernel:=C2=A0 do_syscall_64+0xe2/0x560
> Aug 14 09:21:52 frodo kernel:=C2=A0
> entry_SYSCALL_64_after_hwframe+0x76/0x7e
> Aug 14 09:21:52 frodo kernel:=C2=A0 </TASK>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_abi16.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> index cb1810dee8e5..0871ac025ace 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> @@ -357,7 +357,7 @@
> nouveau_abi16_ioctl_get_zcull_info(ABI16_IOCTL_ARGS)
> =C2=A0=09struct nvkm_gr *gr =3D nvxx_gr(drm);
> =C2=A0=09struct drm_nouveau_get_zcull_info *out =3D data;
> =C2=A0
> -=09if (gr->has_zcull_info) {
> +=09if (gr && gr->has_zcull_info) {
> =C2=A0=09=09const struct nvkm_gr_zcull_info *i =3D &gr-
> >zcull_info;
> =C2=A0
> =C2=A0=09=09out->width_align_pixels =3D i->width_align_pixels;

