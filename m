Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D4DC982D2
	for <nouveau@archiver.kernel.org>; Thu, 17 Sep 2026 22:11:46 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D044F10E779;
	Thu, 17 Sep 2026 22:11:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gZtTjLCm";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id AB17448288;
	Thu, 17 Sep 2026 21:54:08 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789682048;
 b=fn1smEhBtECRbFbl0fxlWggY2TcxUocidfcfducEKv1ZZ+kq2VkjavL9PcMlmQY+C4RpW
 67T25MYx7AohDiANSJVLxfED0auma6iWMb6sGmkGuw60PoTYsrPxb8TmuZ03646Pq9gebV4
 FYgB0k+laB7NGPeq2BvoE0AkAt7q8vdzB7cPZM3kRfwNFgHOS5myhMil2xNqh0DEjqnDdEq
 fkEYYu8SynDqc5w0qXBGozV0DkVIigdalL6Q5aAGsaqMVYIeZXrb7yGVs+CKAt31k+M5dYo
 G78BsJOWiZOoIfFUDbCVMdkILdXj0AI+F8M2b5Mdncdk3RR4rmd6h9xaFiDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789682048; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=S6U6C2auesxaluxxDRg42OWIqsobC3AFy0qVLLWaE4A=;
 b=d315sumGwndZO9EumcRtZGtC4b4cfnZmlLXEEt0AE7Qr5OdlyyNd0PADTHgFZikFhh4TP
 dpPremhZsD1U/HtKVsun24JLaxpywXRHEi8uskiK/kscdZ8+/uwFAYtB93NgYdUS1u/vBB0
 CuU+JVNFjwsOMGHkMmXT1kM9gXZsGWH8ItppXwBduMetmxD0kCvNlcnlMO2vldqTKgkGTbQ
 ykK5Pvkr9lK1WdL6eW/o3UK9to/9H2/weuIbLMUv7ln8u9y5gb6ZkbJWQqVTSd+4Zd8aiGS
 Hx01FnqDcfSJUJk0V4QmreaWvGWj/j41bPvKJmIczCHnrJXkMk7PzL+OXlRg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 7757348233
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 21:54:06 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 582B810E4D8
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 22:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789683103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S6U6C2auesxaluxxDRg42OWIqsobC3AFy0qVLLWaE4A=;
	b=gZtTjLCmcNEOVEDrdYKPrviHRHbG1TVlCMbghkAPDr0N5jeFmtf45Kv/RxmCCFc4LvV4cn
	uLTtIX9SqxdU2jFU5uLFySzYHfnDT1cbzlSnkAdXaUn0fG4J8FfHLB9KLw2JZlrGn0ZZZM
	Gv2Aqy/eh6+e49I8PYcWDOd35+WKhCw=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-295-QHmI0g5WMIaqVYoJzl_VUA-1; Thu, 17 Sep 2026 18:11:40 -0400
X-MC-Unique: QHmI0g5WMIaqVYoJzl_VUA-1
X-Mimecast-MFC-AGG-ID: QHmI0g5WMIaqVYoJzl_VUA_1789683100
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-90e8472ee1eso3865056d6.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 17 Sep 2026 15:11:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789683100; x=1790287900;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O71094SnvEzOsUSd9r3JWt4fCSADbtCWy3jIsFoSJ/s=;
        b=xpao1LZY2j0/jiubZ2hBxbp+npgh0tGZsi5b6FLU/E6EX3DWEyWE56yi9sKx1jP5vB
         KjWDc+noyDEERG82sqbx0HXylSmX8wM+qB0TCjeB2cUe+ScQkmNOgWc5QD+/OWv4NJDv
         dZuXvbxhDRtVEEjPOMoPKxVi4bWp+yQsqLLQtRxC5SU3mu8Pe4PIc7cfUnUei/9clB7X
         kUhnS4VJzSSU0v0Kz8LB7v0gyvr4D5oYt7R3plUEzAlmyp59GcKV1XkehE5ldK6Mb+Oy
         2fWvn0S29jOTvMCg9XnNABjNFm9YokYYglgq8umjCce0LMfJvwaLpyQRXBacMlQZpR68
         hIMg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwSkDcj6U7s3Iuxh96BSU1AgoV7+p4A02FdQJ/sMQUM8/FvJIV99AfQKeyub+2sMpYlWQQkVlGa@lists.freedesktop.org
X-Gm-Message-State: AFuF++nCbQDS6CCBn1uOtR5tPNqLovapD1103y2TAO/ia4SDjVNjVDCl
	VC69/iMkoSXjOFjvr9dKArarRMZuFBhfE7WP9qTaOFPP6F8Oul6iwrYGSJPubrUcD0Zz2XiXzbS
	AzOrO8J1RCxVu3b8azbTABbcyvNZclO1+wsIJ2K/WDtMt0Lm9KY2wWOzJFSo2d91VdgU=
X-Gm-Gg: AYBFou1ZT4uC+d+48B44nDInsoggD5W4sGP9D69dNs431I6MdxWIPTGdGoLNlz6ZRjF
	sR6BARbJEYFtlZKwC6dAlSa01abinMqE6KhhlRuD2s9NaEX2gRGs1zOmLqyTohFp8B4F9MtiL0r
	Og2Hjr3rJbZ092TdUrZ3dPolcxIrMtwxTRAe6fZD1C0Gp0sDj+1RMtfdOX11PuZxZoB8htpTVLq
	jvUzLVAkeWOgLw23urPdnkbbV6X+lzHCVGaGu5+Dn9VcNhF5VadkJ7oFl9uslvL3P8LE1i+adD7
	4+hmBTyo4k4jZKYs8fnx0JjWshvJv+AxFGuyEPgr3Y4a/qEf2L3jfE/O1wMbT4imm/ljGeMh
X-Received: by 2002:a05:6214:6110:b0:912:517b:913 with SMTP id
 6a1803df08f44-91254cd0952mr9605006d6.50.1789683099511;
        Thu, 17 Sep 2026 15:11:39 -0700 (PDT)
X-Received: by 2002:a05:6214:6110:b0:912:517b:913 with SMTP id
 6a1803df08f44-91254cd0952mr9604356d6.50.1789683098863;
        Thu, 17 Sep 2026 15:11:38 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-912568b9646sm142846d6.31.2026.09.17.15.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:11:37 -0700 (PDT)
Message-ID: <8ae8462fb2f74d0ab1a1d6ac663fa3a90d57ff5d.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau: fix autosuspend cleanup during teardown
From: lyude@redhat.com
To: Guangshuo Li <lgs201920130244@gmail.com>, Danilo Krummrich
 <dakr@kernel.org>,  Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann	
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter	
 <simona@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Date: Thu, 17 Sep 2026 18:11:36 -0400
In-Reply-To: <20260808134137.2864847-1-lgs201920130244@gmail.com>
References: <20260808134137.2864847-1-lgs201920130244@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BusiCOFHqGEtIdPRr0go6R_nYljlWtuxJh4urtTV6G0_1789683100
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: NFO7RIOZYSX7TG6BF4FI2ZILS7ITMMH3
X-Message-ID-Hash: NFO7RIOZYSX7TG6BF4FI2ZILS7ITMMH3
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NFO7RIOZYSX7TG6BF4FI2ZILS7ITMMH3/>
Archived-At: 
 <https://lore.freedesktop.org/8ae8462fb2f74d0ab1a1d6ac663fa3a90d57ff5d.camel@redhat.com/>
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

On Sat, 2026-08-08 at 21:41 +0800, Guangshuo Li wrote:
> nouveau_drm_device_init() calls pm_runtime_use_autosuspend(), but
> nouveau_drm_device_fini() does not call the matching
> pm_runtime_dont_use_autosuspend().
>=20
> If the autosuspend delay is set to a negative value while autosuspend
> is enabled, the runtime PM core increments usage_count to prevent
> runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
> during teardown, this reference is not dropped and usage_count
> remains
> unbalanced.
>=20
> The documentation for pm_runtime_use_autosuspend() also notes that it
> is important to undo it with pm_runtime_dont_use_autosuspend() at
> driver exit time, unless runtime PM was initially enabled with
> devm_pm_runtime_enable().
>=20
> Add the missing pm_runtime_dont_use_autosuspend() call to the common
> device teardown path.
>=20
> This issue was found by manual code inspection.
>=20
> Fixes: 5addcf0a5f0f ("nouveau: add runtime PM support (v0.9)")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_drm.c | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c
> b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index e16f59b00f6f..1579a4b0785e 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -585,6 +585,7 @@ nouveau_drm_device_fini(struct nouveau_drm *drm)
> =C2=A0=09if (nouveau_pmops_runtime()) {
> =C2=A0=09=09pm_runtime_get_sync(dev->dev);
> =C2=A0=09=09pm_runtime_forbid(dev->dev);
> +=09=09pm_runtime_dont_use_autosuspend(dev->dev);
> =C2=A0=09}
> =C2=A0
> =C2=A0=09nouveau_led_fini(dev);

