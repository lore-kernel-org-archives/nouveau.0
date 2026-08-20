Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB03C5DF81
	for <nouveau@archiver.kernel.org>; Thu, 20 Aug 2026 17:10:33 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 630D710F13D;
	Thu, 20 Aug 2026 17:10:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gCOENdlM";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D8EC247A25;
	Thu, 20 Aug 2026 16:53:57 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787244837;
 b=SRZqna3amebBDoRXrSTU6n9xKf0vVVs39IILfO20ufz9G+6x6u5LGt875wIEjeLYsb6dc
 NT80GAMUpq/qmtU86IH00AX+fVGvRSUOuw5fFKyMHjDOdMHLlsYnhJn1HOGth4+Awb6zgNr
 guZ4Yvziqa4Qrq1h0mpHSpliSUuNJL7nRfukufY2AB2XEfXysbbK0P+L5Jcj7FKJl0wEpmB
 ePWjsBazkQCR2gKWYqTmHj4jMYx/VDfsxnRfRs7xQ5TAb95iLE22yF2TNq+yI4UZKsev3wh
 3leA7+XaOVYEK+aJ0oohdS5kW42wCoi2ehHs67alBx1t+cXgG/23MKwWGPYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787244837; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=8RFOFNhe8dD42ULPXJPC0m4cGSa+x0bKLYsWhLafPUQ=;
 b=MfWkJO5Is9P/WNSQNN6l9+sBekyJAcacY8AXz3frnTcVWphgg+0+SkX13nRntSpldT+s2
 QtQnyHqgDwPjMY0ilsbnPRYWl+k35NZB33n5DW6p0f/cHo/6Wgly/mHSxsCTprxvZ01EZf+
 FlmoU3XGbZEMAebU4G/RzUHUFM2QP2sjF0DcbSk716qVgP2xuETG69WYriuP1o6zRSScT40
 g3M0pmPbsH5X3b0U/Vwl14rjdzykRFaREt3yvN37ikA8vQhEz2VT11oad9K3aa3JXL8nBjJ
 t2GyVIvCu8Gr0AaId6wNjWzr03QQdxyW0C15YD2hG3XH+k4GvfjVSQmEhxbA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 4869B479C7
	for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2026 16:53:55 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7823C10F136
	for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2026 17:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787245829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8RFOFNhe8dD42ULPXJPC0m4cGSa+x0bKLYsWhLafPUQ=;
	b=gCOENdlMbf3qpI95KyRk40qwe5KDlECT5j4iS+8yWUvYIKyi8iVz05mHxn38Nbss4LwmPP
	EjqtKDeeQqc7qDfZNvEHbCJqE3oHNc8RdKw8RUKLhTeUUxu+FwqXghgRy4etbI8vnP0wIq
	GI4/Uf4mhxQNWPkb1tWt34QK+FpiFig=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-47-u-fAvKwYPCWn6C75WhxCsg-1; Thu, 20 Aug 2026 13:10:25 -0400
X-MC-Unique: u-fAvKwYPCWn6C75WhxCsg-1
X-Mimecast-MFC-AGG-ID: u-fAvKwYPCWn6C75WhxCsg_1787245824
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-482bf4da3d5so89267f8f.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 20 Aug 2026 10:10:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787245824; x=1787850624;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8RFOFNhe8dD42ULPXJPC0m4cGSa+x0bKLYsWhLafPUQ=;
        b=tLQSVHSlyrrIOWWjaZLSa+EamScdHAGNPUl5x+KUBhxqgzA/dsuDj9uwze6nE9GBhF
         JxWlAS9KaAbp7CjloIEYOKfZtCWMMJXm2ECJhoFujCfE7e1kzAkfpU+LtDhTaB7+6QQe
         WdnKCxx9jxZzovVDWa4QSiCxw/82kHLieUzuBBJuOo1w1tpmhX//wDT/t+01AUUR88f/
         6Jchd3DLCaKI+Uv/x0tBWJIPZYyBGDJwtQvCQLkqTGlySZIr/noYT7BkmQuckL15silL
         JNtddOJ3dBHq0DByed8C/BpooSqQRgzWnWKvWV2NjxDWANiaGLWxFx/zF/pS3CyzO3wD
         C4Rw==
X-Forwarded-Encrypted: i=1;
 AHgh+RoLRTQWThzr8AlyVFjKiaUuC3ZgDUsrPbQfvOv3zynzMJkz+jKPYbCWWTW1X+9Tc2GTsdPQqatS@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxE+MWI/IQSLqHulO3UEi+jS0gaz3snLd2m2q6vdPaNZsmaooUi
	obToGcl4LtNpim2xIOuoYP5s3HjL5Ykb2YnO/5GMBTTkLody8LJUXGMo2kHcx8xAVcp+CzVr4/v
	9vfvCFGetaikpfiM6Ubn4x7URGXjuMCzfNMlME6m1NaRLoWhpB44rmdYvvgjPL1S07Fw=
X-Gm-Gg: AR+sD112j7kKfX4FMG38VyV37sFHaVYGqBybnUp4+8aG7ArCuwZ2Ua57h+Uz7OU2IiX
	OnqRFJ9zrjgTnv13dXUsSBjtSiqlF6+1+FOL7DbzooqaOUjv9Pb0iDjClqcqOqA3gvxiNKFrU9a
	XR/PDXdr/oqoPe75WWHduuan0CcloEnjGzC+80bg4Xjbs9fJZd/hPwpDfR5ASW1+MWM1Kq/Y8bc
	Ntwt0coPgLLyp0bFVlWB/WgKTsDaADW4H18G95vG0skn3bKhd17ooC14zbokMmKxcouK+79XR+h
	ru08a91Jwvd64z0RXbcy5qTReq45LW8gJ63z6OfWpPlRGCJpU7FDHWKTxZETHKwkeRa08QJEb/M
	pukiRKHyjZqkdTnM6pjZB5pXjOZ+Bzv6VOgOD6l62BZkfgA==
X-Received: by 2002:a05:600c:4744:b0:499:93b3:91ea with SMTP id
 5b1f17b1804b1-499b831c0b1mr6516215e9.15.1787245824361;
        Thu, 20 Aug 2026 10:10:24 -0700 (PDT)
X-Received: by 2002:a05:600c:4744:b0:499:93b3:91ea with SMTP id
 5b1f17b1804b1-499b831c0b1mr6515045e9.15.1787245823921;
        Thu, 20 Aug 2026 10:10:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:11aa:87f0:935:4f8e:b423:64eb?
 ([2a01:e0a:11aa:87f0:935:4f8e:b423:64eb])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499a9e805a4sm169531595e9.4.2026.08.20.10.10.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 10:10:23 -0700 (PDT)
Message-ID: <deba971f-7f8b-4c91-86c5-e3cf0e3c4bdd@redhat.com>
Date: Thu, 20 Aug 2026 19:10:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/12] drm/panic: Pass global module parameters to
 drm_panic_dispatch()
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
References: <20260818125012.468092-1-tzimmermann@suse.de>
 <20260818125012.468092-7-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20260818125012.468092-7-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: J34VjcvKztUslMNmaDqKXS1JnTGlWhIw97mUDYigQ50_1787245824
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ND7J3Q65PKSPWPXX2RRFIZZNEYP6NWBZ
X-Message-ID-Hash: ND7J3Q65PKSPWPXX2RRFIZZNEYP6NWBZ
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ND7J3Q65PKSPWPXX2RRFIZZNEYP6NWBZ/>
Archived-At: 
 <https://lore.freedesktop.org/deba971f-7f8b-4c91-86c5-e3cf0e3c4bdd@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 18/08/2026 14:28, Thomas Zimmermann wrote:
> Set the panic type and QR version in draw_panic_plane() as a single
> point of truth. Pass the values into the individual drawing functions.
> 
> In the test case, always create a QR code with version 40 (i.e., the
> highest supported version).

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_panic.c            | 39 ++++++++++++++++----------
>   drivers/gpu/drm/tests/drm_panic_test.c |  2 +-
>   2 files changed, 25 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index ede620b27515..12c39217cbcb 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -657,7 +657,7 @@ static void drm_panic_qr_exit(void)
>   	stream.workspace = NULL;
>   }
>   
> -static int drm_panic_get_qr_code_url(u8 **qr_image)
> +static int drm_panic_get_qr_code_url(u8 **qr_image, unsigned int qr_version)
>   {
>   	struct kmsg_dump_iter iter;
>   	char url[256];
> @@ -672,7 +672,7 @@ static int drm_panic_get_qr_code_url(u8 **qr_image)
>   		return -EINVAL;
>   	url_len = ret;
>   
> -	max_qr_data_size = drm_panic_qr_max_data_size(panic_qr_version, url_len);
> +	max_qr_data_size = drm_panic_qr_max_data_size(qr_version, url_len);
>   	max_kmsg_size = min(MAX_ZLIB_RATIO * max_qr_data_size, sizeof(qrbuf1));
>   
>   	/* get kmsg to buffer 1 */
> @@ -718,11 +718,11 @@ static int drm_panic_get_qr_code_url(u8 **qr_image)
>   				     qrbuf1, sizeof(qrbuf1));
>   }
>   
> -static int drm_panic_get_qr_code_raw(u8 **qr_image)
> +static int drm_panic_get_qr_code_raw(u8 **qr_image, unsigned int qr_version)
>   {
>   	struct kmsg_dump_iter iter;
>   	size_t kmsg_len;
> -	size_t max_kmsg_size = min(drm_panic_qr_max_data_size(panic_qr_version, 0),
> +	size_t max_kmsg_size = min(drm_panic_qr_max_data_size(qr_version, 0),
>   				   sizeof(qrbuf1));
>   
>   	kmsg_dump_rewind(&iter);
> @@ -735,19 +735,20 @@ static int drm_panic_get_qr_code_raw(u8 **qr_image)
>   				     qrbuf2, sizeof(qrbuf2));
>   }
>   
> -static int drm_panic_get_qr_code(u8 **qr_image)
> +static int drm_panic_get_qr_code(u8 **qr_image, unsigned int qr_version)
>   {
>   	if (strlen(CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL) > 0)
> -		return drm_panic_get_qr_code_url(qr_image);
> +		return drm_panic_get_qr_code_url(qr_image, qr_version);
>   	else
> -		return drm_panic_get_qr_code_raw(qr_image);
> +		return drm_panic_get_qr_code_raw(qr_image, qr_version);
>   }
>   
>   /*
>    * Draw the panic message at the center of the screen, with a QR Code
>    */
>   static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
> -				      u32 fg_color, u32 bg_color)
> +				      u32 fg_color, u32 bg_color,
> +				      unsigned int qr_version)
>   {
>   	const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);
>   	struct drm_rect r_screen, r_logo, r_msg, r_qr, r_qr_canvas;
> @@ -774,7 +775,7 @@ static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
>   
>   	max_qr_size = min(3 * sb->width / 4, 3 * sb->height / 4);
>   
> -	qr_width = drm_panic_get_qr_code(&qr_image);
> +	qr_width = drm_panic_get_qr_code(&qr_image, qr_version);
>   	if (qr_width <= 0)
>   		return -ENOSPC;
>   
> @@ -816,9 +817,11 @@ static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
>   	return 0;
>   }
>   
> -static int draw_panic_screen_qr_code(struct drm_scanout_buffer *sb, u32 fg_color, u32 bg_color)
> +static int draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
> +				     u32 fg_color, u32 bg_color,
> +				     unsigned int qr_version)
>   {
> -	if (_draw_panic_screen_qr_code(sb, fg_color, bg_color))
> +	if (_draw_panic_screen_qr_code(sb, fg_color, bg_color, qr_version))
>   		draw_panic_screen_user(sb, fg_color, bg_color);
>   	return 0;
>   }
> @@ -891,17 +894,18 @@ static bool drm_panic_is_format_supported(const struct drm_format_info *format)
>   	return drm_draw_can_convert_from_xrgb8888(format->format);
>   }
>   
> -static int draw_panic_dispatch(struct drm_scanout_buffer *sb, u32 fg_color, u32 bg_color)
> +static int draw_panic_dispatch(struct drm_scanout_buffer *sb, enum drm_panic_type panic_type,
> +			       u32 fg_color, u32 bg_color, unsigned int qr_version)
>   {
>   	int ret;
>   
> -	switch (drm_panic_type) {
> +	switch (panic_type) {
>   	case DRM_PANIC_TYPE_KMSG:
>   		ret = draw_panic_screen_kmsg(sb, fg_color, bg_color);
>   		break;
>   #if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
>   	case DRM_PANIC_TYPE_QR:
> -		ret = draw_panic_screen_qr_code(sb, fg_color, bg_color);
> +		ret = draw_panic_screen_qr_code(sb, fg_color, bg_color, qr_version);
>   		break;
>   #endif
>   	case DRM_PANIC_TYPE_USER:
> @@ -951,6 +955,11 @@ static void draw_panic_plane(struct drm_plane *plane, const char *description)
>   #else
>   	u32 bg_color = 0x00000000;
>   #endif
> +#if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
> +	unsigned int qr_version = panic_qr_version;
> +#else
> +	unsigned int qr_version = 0;
> +#endif
>   
>   	if (!drm_panic_trylock(plane->dev, flags))
>   		return;
> @@ -966,7 +975,7 @@ static void draw_panic_plane(struct drm_plane *plane, const char *description)
>   
>   	drm_panic_set_description(description);
>   
> -	ret = draw_panic_dispatch(&sb, fg_color, bg_color);
> +	ret = draw_panic_dispatch(&sb, drm_panic_type, fg_color, bg_color, qr_version);
>   	if (!ret) {
>   		/*
>   		 * Only flush if we have a panic screen to display. Otherwise
> diff --git a/drivers/gpu/drm/tests/drm_panic_test.c b/drivers/gpu/drm/tests/drm_panic_test.c
> index 969a096ec840..196496238d23 100644
> --- a/drivers/gpu/drm/tests/drm_panic_test.c
> +++ b/drivers/gpu/drm/tests/drm_panic_test.c
> @@ -58,7 +58,7 @@ static int draw_panic_screen_kmsg_default(struct drm_scanout_buffer *sb)
>   #if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
>   static int draw_panic_screen_qr_code_default(struct drm_scanout_buffer *sb)
>   {
> -	return draw_panic_screen_qr_code(sb, 0x00ffffff, 0x00000000);
> +	return draw_panic_screen_qr_code(sb, 0x00ffffff, 0x00000000, 40);
>   }
>   #endif
>   

