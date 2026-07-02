Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3585C43458
	for <nouveau@archiver.kernel.org>; Thu,  2 Jul 2026 00:27:27 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C00C610F112;
	Thu,  2 Jul 2026 00:27:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eZ2/sMWO";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7474946E2E;
	Thu,  2 Jul 2026 00:12:39 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782951159;
 b=f1763mGeYg3gGovzpQecjGLiP5HMwD6xFtk3QZ5DHrgDNgx5utrRqA/r845PNnjJqCPbk
 SYxD4Ey+6bQsZe+lf7ogdR1AY+gK8OGga4beejrdWyftMnHTt9ccKE2d5Lc/2Zl9f/j7yUb
 tS4F+9hz4PmzezdPzUbAXMt4qXjHe1Udj582LaxXNnmqpKAPSTBMz06WxqofjibAERLLz3z
 puZAYOczCsF1vwbuJD2M5C6UfNtpyACq0nb9l1xVTKfqXK+nObaSCqfjEhgpoHgyvDOz7+J
 5xiwmzNsmQpSqTC/QhxudCT1UBSrwG+TIVljKWync2MI1lZW0Myl35H/TzYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782951159; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=3sTyqrkR4eDbnmC3hLWq/ZUAIvO8O4HY1eb/XkK/jVc=;
 b=BJ/y6GOilpBTKoBtAvzR0LU/X42rtsvTLj7yVONStOWY1negXtDl8Nns0S8XxRXwsN5jA
 uSYMto1TnDHoJu1m7mH9TlIME9UdkrHKX1OFiircqg/fiwMNeqph7+gZPkWe6sIv7p69zdO
 E3WXA9jKJNhuv8i++l5GSujJuLH3ZsZI83CfHrwkJICf4bT4xlzlV6fUFFrEXhFc24Tz8ll
 VKH73tdxozkB+pRP7OtzwGVIz4aFYjVDvLqnIhIGYCSqLH7CAN1YYYuWPav4uTi2QXPBvlj
 wbx2V1qy798qVwMfEjNM7/zCXe+HcfWRGfwDLRwnK7VIAe/cCsqCckxOe85g==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 9E11946B17
	for <nouveau@lists.freedesktop.org>; Thu,  2 Jul 2026 00:12:36 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 920FF10E3DB;
	Thu,  2 Jul 2026 00:27:21 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9E7666001D;
	Thu,  2 Jul 2026 00:27:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 393331F000E9;
	Thu,  2 Jul 2026 00:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782952040;
	bh=3sTyqrkR4eDbnmC3hLWq/ZUAIvO8O4HY1eb/XkK/jVc=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=eZ2/sMWO8m1SQUkDzovbRcZVQ3wAiBuqe+1CGTuaCOk5VmyvLxyTzJYhSiswFlbCg
	 hyPCBsNnAsrIc/hU0yjwiJI6mvVPuUeJV49oiGB0d7be9mryFdBo+ZBxzeXznmsTft
	 qrVDFHITjbJlptdpu5J4qGhTfzUxMV06cmLF1es3N13d70NwHr4mpDCyEyjplRB8mF
	 I9U0AKpPaMo5jdWu5OUU83Z/4Nxc+6i7ACf3yPEWwQ3ilUrHNfOhwlf7P/4JfLoOqD
	 zgjKF5PG2CHtpJY2lv0UCuUIjBg9XRS6zSxcYSOQuAi2mJDvdoIdmfZtrSC88U5Bpv
	 ZlqSYu1f4SYuA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Jul 2026 02:27:11 +0200
Message-Id: <DJNNQVO96RR1.141CE7TKF6MZP@kernel.org>
Subject: Re: [PATCH v3 2/3] drm/nouveau/gsp/r570: Never enter Gcoff state
To: "Lyude Paul" <lyude@redhat.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260701182857.190713-1-lyude@redhat.com>
 <20260701182857.190713-3-lyude@redhat.com>
In-Reply-To: <20260701182857.190713-3-lyude@redhat.com>
Message-ID-Hash: WBEYZVEBWMJWPPDCKKDPDLVFAU3MMTRB
X-Message-ID-Hash: WBEYZVEBWMJWPPDCKKDPDLVFAU3MMTRB
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kees Cook <kees@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/WBEYZVEBWMJWPPDCKKDPDLVFAU3MMTRB/>
Archived-At: 
 <https://lore.freedesktop.org/DJNNQVO96RR1.141CE7TKF6MZP@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

(Cc: John)

On Wed Jul 1, 2026 at 8:17 PM CEST, Lyude Paul wrote:
> It turns out that the only reason our previous fixes looked like they
> worked for this was because we would occasionally set the Gcoff state to =
0
> in the normal S3 path, which fixed suspend/resume on desktops - but not o=
n
> machines using runtime suspend.
>
> The proper fix is to just never set this flag. Our current guess for the
> reasoning behind this is that Gcoff likely coincides with GC6, and not
> literally power off.

I don't think GcOff coincides with GC6, it should actually be a power off.

>From a quick glance in OpenRM, it seems that with bEnteringGcoffState =3D 1=
 it
also saves off buffers flagged as MEMDESC_FLAGS_LOST_ON_SUSPEND.

My guess would be that with bEnteringGcoffState =3D 1, GSP's resume path ex=
pects
certain kernel-driver-allocated buffers to still be in place that nouveau d=
idn't
save off, or rather never had in the first place.

John, do you have some details about this?

> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Fixes: 53dac0623853 ("drm/nouveau/gsp: add support for 570.144")
> Cc: <stable@vger.kernel.org> # v6.16+
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c b/dri=
vers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
> index 2945d5b4e5707..af5aa5065c3dd 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
> @@ -81,7 +81,7 @@ r570_fbsr_init(struct nvkm_gsp *gsp, struct sg_table *s=
gt, u64 size)
>  	ctrl->hClient =3D gsp->internal.client.object.handle;
>  	ctrl->hSysMem =3D memlist.handle;
>  	ctrl->sysmemAddrOfSuspendResumeData =3D gsp->sr.meta.addr;
> -	ctrl->bEnteringGcoffState =3D 1;
> +	ctrl->bEnteringGcoffState =3D 0;
> =20
>  	ret =3D nvkm_gsp_rm_ctrl_wr(&gsp->internal.device.subdevice, ctrl);
>  	if (ret)
> --=20
> 2.54.0

