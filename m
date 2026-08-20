Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1DCAC5DF8A
	for <nouveau@archiver.kernel.org>; Thu, 20 Aug 2026 17:12:48 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B333B10F142;
	Thu, 20 Aug 2026 17:12:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MB95tA0k";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 31A2947A28;
	Thu, 20 Aug 2026 16:56:13 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787244973;
 b=q5LZOc1PjE0gqati1aBtbZeWRsME8kvDFI4q3QdClmucahlwwDL0/m6OOUJva+jNBM48P
 A9NNqEf2o+GIN+qSpoxkHQ6XNTG6bm8TYeVj70LfB1zhbkc3WLslf0D+D8PHXUGuGybHBFj
 LgtcENfnZPBiCadL0DsNOPoFkUGadjoEnaRjAdp3na79pkaNHRZiiT0BjbQ0EEhBEe0MXwG
 JQYtIrekQhKuDgkVkjr2uYstAapMLiDz5XLVfKvDds6f8d/emIiLZA16Rxo1s+1XXmckwMr
 6XDa3+XX9pN6JH0oUmaoA5aTY9ibEjqEz+5+NabQjrOk/HhoJBqgCv2+/caQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787244973; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=EM5PkmngzWPW5YVaOcE4doFSUi3DdsSPp8p0edYyrwQ=;
 b=ucVHm+P/aenv8MS4Ki/GhrcAA+NxGMAXwWLdwgGP1pjEwgO/hwDr8zH3R/EW/Npbk2xoX
 S5oWumokbWZANf4jz6ShFDmiIBtY8gx+9Tp4yuBxP7kwBKerxgM+TtlawEHJz2Z0gC3kymR
 Mu1zS69wjPW/3kGjY1V860laXVBhEVJ5EjncCwLhRwLB0L+5y2Fxth0QiiHCp3weLg/E8hR
 TXvRUTIt1pyeZ6mSyNqSL4YbWq/QSRdrtIEV96evLsf5a+/GW9OM9n9jLikYmchFWCbaDAo
 CpTcJegiHuolHfufA/cfCInYFrrNhgG5iBiolgORKaM2s/rVcdSjH6NmnMsw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A0FAE479C7
	for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2026 16:56:09 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D5BE310F138
	for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2026 17:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787245964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EM5PkmngzWPW5YVaOcE4doFSUi3DdsSPp8p0edYyrwQ=;
	b=MB95tA0kSm/DzqgLDbcjacsn/i2D4iPtbg3PFM2VLK9WSAP4Ajxo+Cy8MYgkAsfJwZEJ52
	MX5QK0J/SjdCgQShzWcaO6IbVSuxndH1P2ZV/eEEUVEqHqkTDMq+R8IoZvPsdavpjWpR3y
	kETTKZ4McQrkv+W35O6eGcdga+wZ2rg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-xYQxYMb-NC2nQnPJnMO6Ag-1; Thu, 20 Aug 2026 13:12:43 -0400
X-MC-Unique: xYQxYMb-NC2nQnPJnMO6Ag-1
X-Mimecast-MFC-AGG-ID: xYQxYMb-NC2nQnPJnMO6Ag_1787245962
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-47f726186c4so64911f8f.2
        for <nouveau@lists.freedesktop.org>;
 Thu, 20 Aug 2026 10:12:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787245962; x=1787850762;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EM5PkmngzWPW5YVaOcE4doFSUi3DdsSPp8p0edYyrwQ=;
        b=dvMuMaNw6QHJKLgP6nhvYFKeSb6coBRcAtkWs56EBzDkPyEhQwuFSUUN0tTuu7hCUD
         64ceWuQvPFAP/7q+fwIYafWDflLQB3MG9aSV1KUriEXN8a0CFGNK7iW3JyetIQMEh9K7
         mSnAgO0iwYOiCOavWlABQ4ECfbxRoYMAMKyQ5KHMH6cQd1xeNVD1aqdKzp0DH590Y+8t
         yy+xDQK3vKYNdfpXAT6IXjz6GxgZ3IzYSbtCepml8Ale4QrKWY62oi0+mizJhUjQfNfp
         Syb0xR6MzKEHG4TdJwGKg/NpRSeT2V8Xy0K9XskoibY6UAr5q01p6aEKJ3dqWWUQfzDz
         B+Hg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrBcSKsAfAhlBslYYcMCNyBYb+C2aXYV4ua0QfX7Yl72Xw0DhppDAf+4luFoLqrd9JBPKs8XZX6@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHVeZV/C+kOFw97ipVdGkQawCjYUYmATApObjQZsH0e7ZlSGMs
	cwEeXnoqLVLsr5rv7R8I4hZe2iTPlS2ScOk5SjK/0zw8q8gEI7wd8tqg+hEbYorJUS9UU06i3F1
	djDge6rW70R8mSBE+fLT1jQkjH1Azwap6qHK41mWRAr11iYZfxgNP8x0FTIBk7MIniOc=
X-Gm-Gg: AR+sD10oQEDc5ssapn/hjzXEDkPDThSvgjVOkN6Hg9hX0bZ3Fx2vGp2jbcGbRC++f17
	QXD+NCQHpSqE0Q56o2dtQnVc0XSfLC25ujdylS7BmPORUrbGUKsw1e5PZ3gucqXcCNTycfkIimr
	bK/8QoTWo0vFy+1mNzPxbLTod353+bofE+W45iOhpeaIjLzOpkjnBlg7PpmArNxTIKrllceqNMH
	O1yIlmHwNN9Jb3znS+Zxcs8pbsC5XhqV62myixx7Om3TTMLr+pXSx1c+VHbPdWsfPZk3kHHT5yS
	8HpvOGKFQu/IHLCz+fw/BGkfMbI7Tk9uhrqL/okf6PYKKA3U+WZlPRersMwWkgt5BrPHb0gujmF
	klWALRwPEvTohywLZ0O8rLEZC6lwITowmfUuBle4J5i2/rg==
X-Received: by 2002:a05:600c:8819:b0:499:8aff:59b6 with SMTP id
 5b1f17b1804b1-499b8301c54mr7853155e9.14.1787245961731;
        Thu, 20 Aug 2026 10:12:41 -0700 (PDT)
X-Received: by 2002:a05:600c:8819:b0:499:8aff:59b6 with SMTP id
 5b1f17b1804b1-499b8301c54mr7852145e9.14.1787245961316;
        Thu, 20 Aug 2026 10:12:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:11aa:87f0:935:4f8e:b423:64eb?
 ([2a01:e0a:11aa:87f0:935:4f8e:b423:64eb])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499aa17fc80sm168153685e9.14.2026.08.20.10.12.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 10:12:40 -0700 (PDT)
Message-ID: <b332e4f1-30a8-40b1-bdd5-f0c3f816c229@redhat.com>
Date: Thu, 20 Aug 2026 19:12:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] drm/panic: Retry in dispatch function if panic
 output fails
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
References: <20260818125012.468092-1-tzimmermann@suse.de>
 <20260818125012.468092-8-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20260818125012.468092-8-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Y9HEFRvAqbRgtrqKrdVZ4lGC93VoqUyRsls_d-j4HjM_1787245962
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: YIFBCEKCQWCHR3PTP72TAT7UKXSEVLCD
X-Message-ID-Hash: YIFBCEKCQWCHR3PTP72TAT7UKXSEVLCD
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YIFBCEKCQWCHR3PTP72TAT7UKXSEVLCD/>
Archived-At: 
 <https://lore.freedesktop.org/b332e4f1-30a8-40b1-bdd5-f0c3f816c229@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 18/08/2026 14:28, Thomas Zimmermann wrote:
> On failed output of QR codes and kmsg buffers, fall back to a user
> message. QR-code output already did this internally, but now formally
> support it in drm_panic_dispatch(). Streamlines the existing logic.
> 
> Also pass module parameter drm_panic_type as a parameter to
> drm_panic_dispatch(). This simpifies the implementation. It will later
> allow for moving the function into a helper library.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_panic.c | 24 ++++++++++++------------
>   1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index 12c39217cbcb..0960750bfce2 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -746,9 +746,9 @@ static int drm_panic_get_qr_code(u8 **qr_image, unsigned int qr_version)
>   /*
>    * Draw the panic message at the center of the screen, with a QR Code
>    */
> -static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
> -				      u32 fg_color, u32 bg_color,
> -				      unsigned int qr_version)
> +static int draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
> +				     u32 fg_color, u32 bg_color,
> +				     unsigned int qr_version)
>   {
>   	const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);
>   	struct drm_rect r_screen, r_logo, r_msg, r_qr, r_qr_canvas;
> @@ -816,15 +816,6 @@ static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
>   	drm_panic_blit(sb, &r_qr, qr_image, qr_pitch, scale, fg_color);
>   	return 0;
>   }
> -
> -static int draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
> -				     u32 fg_color, u32 bg_color,
> -				     unsigned int qr_version)
> -{
> -	if (_draw_panic_screen_qr_code(sb, fg_color, bg_color, qr_version))
> -		draw_panic_screen_user(sb, fg_color, bg_color);
> -	return 0;
> -}
>   #else
>   static void drm_panic_qr_init(void) {};
>   static void drm_panic_qr_exit(void) {};
> @@ -899,13 +890,22 @@ static int draw_panic_dispatch(struct drm_scanout_buffer *sb, enum drm_panic_typ
>   {
>   	int ret;
>   
> +retry:
>   	switch (panic_type) {
>   	case DRM_PANIC_TYPE_KMSG:
>   		ret = draw_panic_screen_kmsg(sb, fg_color, bg_color);
> +		if (ret) {
> +			panic_type = DRM_PANIC_TYPE_USER;
> +			goto retry;
> +		}
>   		break;
>   #if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
>   	case DRM_PANIC_TYPE_QR:
>   		ret = draw_panic_screen_qr_code(sb, fg_color, bg_color, qr_version);
> +		if (ret) {
> +			panic_type = DRM_PANIC_TYPE_USER;
> +			goto retry;
> +		}
>   		break;
>   #endif
>   	case DRM_PANIC_TYPE_USER:

