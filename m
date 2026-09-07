Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A07C88E4C
	for <nouveau@archiver.kernel.org>; Fri, 11 Sep 2026 08:52:30 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2FBF110F31D;
	Fri, 11 Sep 2026 08:52:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="E4srLzoR";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 855304191A;
	Fri, 11 Sep 2026 08:35:06 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789115706;
 b=hQKxjgx0TqdI0PQCwYddqJ9DQ+d7dvskFVJKWzl4Dxw5wubi5PwnyE8V72Gty+eE68OGP
 lzkF9/bGeiBNGKsQAMLVZn31DfIqOQJU2K+X7ZvAXgrbZW2bruAZIbLhvfWhER5q4e8WoMr
 3CSk1n8UdxdIM7Lh16V6FlreyXBOaXmFaWk/+4UlNiVZBh53j+bmckM+TTzQhvfc0eGrAmK
 fOpMMxhihf7UweyOvw0fKPLSIujRTUvv0Q3XzBWmfeBEB8H8A8oMyZHCb9WsaZtjuw7r2Px
 +HQQ4JZNi6+d185MEZIIt86rhE76iDBXOlfZ4jgwgMOLxeD2+SyaU3AS666A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789115706; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=km54XNA3pesnlH9MUSOEbKUzj91GMmwN/4bvXZLN1Qw=;
 b=FEvih/wc90/lOO85F1wmfhIs04FBiiWMlevS26SREnB/WAfXkuqj3NxMG/IMYWUv7lyfJ
 LI/H5F/hG2oxeJa/TLIMw8rC95eEa/0KsKC/nqbXTmHsFgTtrrGD8gHROLO7wxv7SjOi4Zb
 YIgoWo9/Cr2quFONqZFZKHe8xEXH7YJVhN2UhxDJuCaqq65d0tgoSC+VNwy9Xxjb24dZRra
 5O2g4c+PiQkWAvspQgRDFTD5O3xsiDeOVojJvyotehcLeV/bFS6abMWqx8b5EKcpaAd9RRZ
 hWSQBfkOxe2j6jGiYjltuzigiVv+vAkF66exjdQ6AgPC2VehtoKMsLd8S5Dw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A032640412
	for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2026 08:34:09 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CD2E610E087
	for <nouveau@lists.freedesktop.org>; Mon,  7 Sep 2026 21:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788814864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=km54XNA3pesnlH9MUSOEbKUzj91GMmwN/4bvXZLN1Qw=;
	b=E4srLzoRT2lSFcaQysiCLk/7gYWQXXHBWble0pc3yRK0BKbcUWXlkkenZdQBdblXltv429
	aq23hN2ImYmLgJhVNpUkK9ErT/FV8Sa0bc3WYo3Bf/cgSD4jChuPK5MW4huzJs8Xh8G3m2
	v2U/A6AYyGRGC393cggcW25+9qGapb4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-446-_RLkS7ptMbu2k7sKh5gzvQ-1; Mon, 07 Sep 2026 17:01:02 -0400
X-MC-Unique: _RLkS7ptMbu2k7sKh5gzvQ-1
X-Mimecast-MFC-AGG-ID: _RLkS7ptMbu2k7sKh5gzvQ_1788814862
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-495529a93f9so38127805e9.3
        for <nouveau@lists.freedesktop.org>;
 Mon, 07 Sep 2026 14:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788814861; x=1789419661;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=km54XNA3pesnlH9MUSOEbKUzj91GMmwN/4bvXZLN1Qw=;
        b=NmpKcRiNNBYN0U7Q0H8kF7virLw+XhVYXiy/AYdvpXYLPGLl0+V+unkieGJgqMExJB
         skXHYYFXwh4VtXvcsY8ThF7Z8FcKKzMlnQlm54lYAWWE6VbZzSnNFb3+Zk6Tr3N+gLdT
         vr4OlLo9PI/AFYE9fRVoM3GPKHYdta2NVKblEEcer+85zIGNqHiOInOHUgHKW5epVWQe
         czGKJwkPVBhXlgbx+6A4hHuoQogR81C196IjP94ap1cDqEmTOoD2ZCYGNcTz68iXrMhE
         Iac3PwVMyGGF7Zt1lrrjmGCF2pNDoRTOlOsF5S9jDTZlXxeXvOIizZGsuRmIM+PLiZOr
         /P8Q==
X-Forwarded-Encrypted: i=1;
 AKwUvByv8Y1nlPoQ0/tozDJxG1aytRyUHy4lnZOGbAoRLCWxdV0fuImDzjc8IU2pcdCkR7WTlIuFpzoT@lists.freedesktop.org
X-Gm-Message-State: AFuF++mvVf74RHoX0m1Op1nq8k3vAcubj9TCq0VDr2ZzFbY/1Jm8LhBA
	JgBz3bmn1/2KaSENf42up2yLLk4V/oND3Ov6NLW9kWhRugK+YMfe33pKJJ/QFmBQvClLo5gB1cf
	9TIDfDB2YAaixksS7HuBi2GOIUsyz4ivkTxk0e1UFSaEfMoeHCO8PvBsqlK5gGgzrR9g=
X-Gm-Gg: AYBFou1JWN2+H9yiKK3HZxbrlhqb/nuJcXlr10OtkBi8v655ZDQSppHnOBu5fw6gFpl
	mIWCr2e6La0dY2cEnxVi3+4AWYlfg2o4GJGkUMMQcMC47vMOd+huuuzp5cwTOg1wfLjEf8tOSAC
	+dN4sHRlMqSu+OKwGRp05yDeL8dKTHHxi4Hk3J85CQWi6nEOm9NsamB16PFvYxb+hOb60lQFA59
	O2EsmE8y+C+Vmki9D0AENH9Wl3H/l5dOG8P60LUmrj5PrwA8JT8FrmapNWmdSKMILBGn5CXig2i
	Gqdvpxm8POoRyyRLhtxqPYZJQ4SYlJ9xJK/vYYAFMnvX6Z4SD7A1LST7jNloDhVognit4Ut3Bkt
	VR5Kj8ieodYp14/10Z+NSh8xupQC7uRfMO16aHD3qgOrQm7vV
X-Received: by 2002:a05:600d:8649:10b0:49c:fa20:cc0a with SMTP id
 5b1f17b1804b1-49cfa20cd58mr167275125e9.33.1788814861719;
        Mon, 07 Sep 2026 14:01:01 -0700 (PDT)
X-Received: by 2002:a05:600d:8649:10b0:49c:fa20:cc0a with SMTP id
 5b1f17b1804b1-49cfa20cd58mr167274945e9.33.1788814861409;
        Mon, 07 Sep 2026 14:01:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:11aa:87f0:ea69:b2b0:2dae:5ef9?
 ([2a01:e0a:11aa:87f0:ea69:b2b0:2dae:5ef9])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cf7703cefsm458086515e9.5.2026.09.07.14.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 14:01:00 -0700 (PDT)
Message-ID: <b34807ad-6390-4804-ba29-43a407b3d9fb@redhat.com>
Date: Mon, 7 Sep 2026 23:00:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/14] drm/panic: Do not use un-escaped URL as format
 string
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, geert@linux-m68k.org, rdunlap@infradead.org
References: <20260902121930.597222-1-tzimmermann@suse.de>
 <20260902121930.597222-2-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20260902121930.597222-2-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FhP_x-zwtVv32kLeuQkc2BdPv9NvTNV4-AuNuQtSUY8_1788814862
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: CUKCD3LAM7LZ44A327KWMHYDQ3KWGSUK
X-Message-ID-Hash: CUKCD3LAM7LZ44A327KWMHYDQ3KWGSUK
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
 sashiko-reviews@lists.linux.dev, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/CUKCD3LAM7LZ44A327KWMHYDQ3KWGSUK/>
Archived-At: 
 <https://lore.freedesktop.org/b34807ad-6390-4804-ba29-43a407b3d9fb@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 9/2/26 14:13, Thomas Zimmermann wrote:
> Replace the direct use of DRM_PANIC_SCREEN_QR_CODE_URL in snprintf()
> with a %s conversion specifier. Avoids a possible vulnerabilty from
> a crafted URL string.
> 
> As the attacker needs to control the kernel at the Kconfig level, the
> potential for an exploit is likely low.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: cb5164ac43d0 ("drm/panic: Add a QR code panic screen")
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.12+
> ---
>   drivers/gpu/drm/drm_panic.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index e576c4791861..ba21df4be338 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -658,7 +658,8 @@ static int drm_panic_get_qr_code_url(u8 **qr_image)
>   	char *kmsg;
>   	int max_qr_data_size, url_len;
>   
> -	url_len = snprintf(url, sizeof(url), CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL "?a=%s&v=%s&z=",
> +	url_len = snprintf(url, sizeof(url), "%s?a=%s&v=%s&z=",
> +			   CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL,
>   			   utsname()->machine, utsname()->release);
>   
>   	max_qr_data_size = drm_panic_qr_max_data_size(panic_qr_version, url_len);

