Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C61C5DF86
	for <nouveau@archiver.kernel.org>; Thu, 20 Aug 2026 17:05:07 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 662A410F127;
	Thu, 20 Aug 2026 17:05:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Be3T+p6m";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D91D347A17;
	Thu, 20 Aug 2026 16:48:31 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787244511;
 b=VeguQ5F11rsM4fIJN8N6tsQblff2DmXQA/d9OHlJ/xx51C6I1oXrpEKqfmcP5Cqg5SJ0j
 EPsWL1KJ22afp521l5kVbYqvGkKpOgVR3Ewtc9t6DzQ3NFtGWDqutU5pYg2HGChnKpGx28l
 3XgDlu7riKWTuE7pTbq+1f3VM00vTIl/6ssyO1zzcpJWqMtRVf9pz1LNA9lY/bvxVE0veMB
 Ac3h4+IHyGIujeoRR8IX+7l7R5qyRjgfETY21H/GSYFxi5644vaPst4XVCVM1znnSoKdibj
 GQtXhN8YEviIjaOS8C96/ABiKLxVEpvADPwYeo16znmA/k41CnDuCwJftOtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787244511; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=TF+roY3oCVB3u96D2m+Kn+7JYFil1XkjxfPcXPVAxaA=;
 b=sn+xr+3uOz0L3N0+Khm43m6wlRFqbxdx/lqG3L11QKVQnCU5jwEoOfcfAJqqCxxj1r8dx
 x3tVmDDf6fV3tJz7YyLfCVrYfZry0vQ47TsFe62JdZFnV34EPCjM0foDjMgfOMCAw5r32R2
 2/mojPYqhJPWrtIHqN7IDs8iP33zTQ08skInC8W/weJlFMoN621u1o91CWiw/OUUC4bMSOp
 lSWhvpFdxkZbQcTXurFRmo2gXSDFVdKS35UrrrqNpAN8NWPOB1/RUgTeSbOYQEmZ+SGVdAA
 I3QdmX5872pty6O1Sh5nqCtya5m/+szloGDitXXZL/UXkmbqryEp/pfzwCkQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 2F8F5479C7
	for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2026 16:48:29 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5943F10F11F
	for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2026 17:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787245503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TF+roY3oCVB3u96D2m+Kn+7JYFil1XkjxfPcXPVAxaA=;
	b=Be3T+p6mFPfn5YcVDRQG2CTD8jYXC1m/QI14N6v0z2Suy97Ou/5AV8Mlfx+Yz+DuEII7D6
	hs+wBoZ4O4hvmcm27JtziryF4Yq2/xiHoaKlEa7LzaolwrJVDX9R+R3Ku8lQBpe1XyZ8N3
	hdLCWQHgz3whNb0tpqBArAFqfzPNBt4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-lyoDRCzZPlWJ9wbEez10GA-1; Thu, 20 Aug 2026 13:05:00 -0400
X-MC-Unique: lyoDRCzZPlWJ9wbEez10GA-1
X-Mimecast-MFC-AGG-ID: lyoDRCzZPlWJ9wbEez10GA_1787245499
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-495474a5fbcso391595e9.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 20 Aug 2026 10:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787245499; x=1787850299;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TF+roY3oCVB3u96D2m+Kn+7JYFil1XkjxfPcXPVAxaA=;
        b=J0aTCzouFgDTsy8514yJkgJjb2DgucbbGZvZYl0kjjyVnEt+8r6CM0nEQvKGKNEfQ2
         REUpUefz2vvMSJneoOyNnfNodCVty+oTJdPOQLe/PtTJq8G/Yrqp8CuUxnv8iR6h6Yez
         l3zT55KTE72Ju0VvVLqME7uk6on1twIirUj8wX2D29Uxv6/ne2jVSiDbNvU9x6TGeA39
         tDoWV5kHOdTS7W0yFZi8TBTjSTt0DDD6JwE288xhXB5u6V0Tiat+qptqPZnoL2A43Nh2
         tuUdOdGzFedCeYFALCAf4VQHPYZmAwX1rdFK9mz+LpuafhsHGPt1PBb4nqSpbjtqsjC+
         IvfQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrehDkXDReF7zWXwDJVohBoJKp/KPz1EC6jTeegWNyMoRSZxED7qgbbisMTrKJVrFYJdxhwPf5K@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAtS4cow620AxIK9H5v9AY7htZlUpvgGTGSG1Fi6PSjWmzybJG
	PMrARUPYwZ4WDNXG75e3TdFVtAkbGW8r0+6NoNDxJpkLL44DeJ98HN6jBZAbDYdAEWnfAyle8Mt
	16MyO3RPA3HlygHNdoOdzAKRxaZgiDiqj/cDCRX0nzP+ii6kiM+1XBfiYkFauAo1XVek=
X-Gm-Gg: AR+sD10vpsArKfQUwHRNlpmm5UdZJA8BdLhkMcYWgPb9dEfC9rwtwxQyFxlaNYcBXiT
	cXcJEIT5NvKJ2n2AdxLPqCjbd9Pgm9kYDmEPGnCI9pOZxWEnlbl8AYrbIojLzDhCxIp6GqdpkP6
	zQPYPc/UiNVEVcHHtKriaMpF/9UWwPuq/u5+bEHIPpRjK3lAAYzPyNNdnGByfI6xsqwi/JqF++n
	4k2/4JZNaA0uDCbiymcF3YloWrtV7poSiIaVR1iiPB4HUshZSy15Lkf6UaJQPhLMi/WDUYuL8V3
	Q2J73NR155QkGiNf6U2bLoYyl4zg+1Ttyoow3gioHvFn6fJgexXXh1B42bIlBVU+LugPuiOuMVW
	GbGZGlBH/HRzD+FLCBY1OKjoWVt12Z/GHDOIwCUz+upQ27g==
X-Received: by 2002:a05:600c:6211:b0:495:4d88:e630 with SMTP id
 5b1f17b1804b1-499b8465f7dmr5016935e9.10.1787245499083;
        Thu, 20 Aug 2026 10:04:59 -0700 (PDT)
X-Received: by 2002:a05:600c:6211:b0:495:4d88:e630 with SMTP id
 5b1f17b1804b1-499b8465f7dmr5015695e9.10.1787245498659;
        Thu, 20 Aug 2026 10:04:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:11aa:87f0:935:4f8e:b423:64eb?
 ([2a01:e0a:11aa:87f0:935:4f8e:b423:64eb])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b14c33b3sm13157002f8f.27.2026.08.20.10.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 10:04:58 -0700 (PDT)
Message-ID: <cb784cf6-f3d8-41aa-9f71-c197a5eba7f2@redhat.com>
Date: Thu, 20 Aug 2026 19:04:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] drm/panic: Return -EINVAL if font is not available
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
References: <20260818125012.468092-1-tzimmermann@suse.de>
 <20260818125012.468092-4-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20260818125012.468092-4-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7YcxZJEPr23MuO_VjcplIPTDvQZ_LWu9tN_o8B5ZGqA_1787245499
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: BC3VYQ7RUFN4B7RUM2KINDRQW4CI5E6I
X-Message-ID-Hash: BC3VYQ7RUFN4B7RUM2KINDRQW4CI5E6I
X-MailFrom: jfalempe@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, virtualization@lists.linux.dev,
 sashiko-reviews@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BC3VYQ7RUFN4B7RUM2KINDRQW4CI5E6I/>
Archived-At: 
 <https://lore.freedesktop.org/cb784cf6-f3d8-41aa-9f71-c197a5eba7f2@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 18/08/2026 14:28, Thomas Zimmermann wrote:
> Font lookup does not allocate memory. Hence reporting ENOMEM on
> failed lookups is misleading. Report EINVAL instead.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_panic.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index 705b72bf0d83..96d238bfceee 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -757,8 +757,10 @@ static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb)
>   	int qr_width, qr_canvas_width, qr_pitch, v_margin;
>   	u8 *qr_image;
>   
> -	if (!font || !stream.workspace)
> +	if (!stream.workspace)
>   		return -ENOMEM;
> +	if (!font)
> +		return -EINVAL;
>   
>   	r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
>   

