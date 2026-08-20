Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4110EC5DF85
	for <nouveau@archiver.kernel.org>; Thu, 20 Aug 2026 17:15:41 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 16FE310F144;
	Thu, 20 Aug 2026 17:15:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Mj02zLOh";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 864A147A2E;
	Thu, 20 Aug 2026 16:59:01 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787245141;
 b=K9sj9qd7Q8v0emgjdnMjsPHIxCQytAfdSgIfB8nVvm7H84wX5/dn0xbAEzK4mpP7SYt/Y
 hWPowLAQUtoVONp1aAihz5ZnIo/pTmwfrjEsTb6/ACiIVO939NzZEjK8Nu8vTWJq76bfN89
 9E37q17gj8LivpxJLz3NXClhKpBSJmkuH2FWYC5Pub7GhqTbihR0iaeq2BeZ0kMG/9DjqYK
 n9uyosSIzhKN36HZfUx4pF+fp/z4zCDOoYmgA9kInXhnEOad2ovzwV88x9Pxewt6V4MzX6O
 hmILsn5TfctLzOBwgdoJ0qORmdeG7cIn0aBOOrVzy2CqajOLgUqFEdjr5geA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787245141; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=EM5PkmngzWPW5YVaOcE4doFSUi3DdsSPp8p0edYyrwQ=;
 b=SkcoZ0OAgvqilewCGeUnJQlOHJBfTEm5HpFgBBLbCBxZbMCUg16ZSTWbVpF5NY+a5UtOV
 9r3Ba6O71Jddl/pGrMJpqQsjccdrg9eCfJI2RoXjBkFoU2ve5W5Hcld+YUCglvXeGz200Ui
 CBIVOl2BUEgxJVrBXhbiSAI9OjsnXIvYf2nhD6L049YrYuIGtWSP2NZA6kXmM9isW2YRAJP
 bTnYkMKhpY4TCcWC4HmBVLEIBE1HOlPgNWUB2at455ILHSmQyac9EPcyYkmc5J2kkkD5gZH
 Cq5LDOVxDaBABBefwoxqm4f1KyEhjq8AHH10X6Hr3S8UbGfy0piFN6tbJfEQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id BB99C47A10
	for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2026 16:58:58 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F030910F137
	for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2026 17:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787246133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EM5PkmngzWPW5YVaOcE4doFSUi3DdsSPp8p0edYyrwQ=;
	b=Mj02zLOhbOZABOq6NVZ00KGwDRJ+eO6RF62/nltLfvTd5U2PGrXXstR0gdDLm2vjZVg5bc
	G2PkwOiIBv0oLgyrxvYg8NDGPO2x9ie+W+axNEpKpOGuF424rNa+twDXzbaDhkjmm3QOSi
	VO6Vt/O5v2eXZ3YduGiWmNHdSklo/R4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-10uv2Pz3OMm1WtA7ND9QGw-1; Thu, 20 Aug 2026 13:15:31 -0400
X-MC-Unique: 10uv2Pz3OMm1WtA7ND9QGw-1
X-Mimecast-MFC-AGG-ID: 10uv2Pz3OMm1WtA7ND9QGw_1787246130
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-49991beee7aso458995e9.2
        for <nouveau@lists.freedesktop.org>;
 Thu, 20 Aug 2026 10:15:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787246130; x=1787850930;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EM5PkmngzWPW5YVaOcE4doFSUi3DdsSPp8p0edYyrwQ=;
        b=faXU0NMekhuS3qAQAFf1Ptdq5P3X8+q1/w8gg1mvWCeORZmjInoKTgDELIr6j67O3p
         q9VflyhF2bryLglCpvTgSzQ4iZ8ZgFTYfHHgbJ1TVtmq52FON+thu/q2hYpModTN9E9h
         u7dRGg/0L7+ztbMer5EuZysyFWRiD9d2epTpWTyv9WDCax56VQY362HyClIzTDPHndf4
         slIpgGYQtA+5Ahf3g6FnSlOTcrsS2HmdDoIVs4BO8VtNfxNm6ZVyTQeFXh/XGq13RkAn
         PNvEtHwx70p1B8cbDiiv/8HOee8JU+frbG7Rr5rhw5xKRvA1LfSRd56K4vJPguJhvbms
         zqKQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpw+Z270NGDioNtHN7amJXacKqnEZl57n/AJMZZPVcbGltVFLTzns8SiBpk/3HJIMoaW0Fp1Z8E@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwT7Q03dJhKu4CnAlKC4OaWmyzloWhoB3bw95ztQGirgzqZEbZq
	2w98qm0XILSdtKsAbchnR8M3fvIgyisCfKSOrArXWuro3uS2HeaySnXzUwYPDLOdYEy9kq4wLW8
	cXmRlw5ffoBEDOE9adOocgPa0yunH6NOaqM2TTiWHThHEMFTXJ9++SVqz9hyxbEZYBRM=
X-Gm-Gg: AR+sD13RZyXa39JyYtLxcmEn70jxdzcTmatUrbN+HAJheh81AKab6M+VikYqEvNnB8u
	OT9nafiVxe6G8Y7QHnzPgMbBxV44423qjYm5JfEYRsNxzbMHLhgPpMtQOg4jk23CCsAI4OdRnIY
	0CQcr1zzLlWMNT9TMrfc58BsEwNuukVa/vB4TEChxy7brrNuAe43u4OnghY6NAkn5pR84i1/mek
	6avc+NoknlmuJiHqyCF2vHxSbDP4mhwgKCUq6NxKO5DhMnw1rfejg78ft+fR9G57t/IRqO1+SAL
	ssFCTKSNTnCglQHBFQu/TnzJmVsrHnkjnoBbPqs40GJX1NKgh23Llt9H1zEslqahLBtGFnbs4IX
	lyQhATWO5v4SgnvYnlVwV9md2S4EKDthMNMhAKpzLxHl2gw==
X-Received: by 2002:a05:600c:c493:b0:499:7aa7:eaa7 with SMTP id
 5b1f17b1804b1-499b845c184mr6845295e9.15.1787246130261;
        Thu, 20 Aug 2026 10:15:30 -0700 (PDT)
X-Received: by 2002:a05:600c:c493:b0:499:7aa7:eaa7 with SMTP id
 5b1f17b1804b1-499b845c184mr6843265e9.15.1787246129216;
        Thu, 20 Aug 2026 10:15:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:11aa:87f0:935:4f8e:b423:64eb?
 ([2a01:e0a:11aa:87f0:935:4f8e:b423:64eb])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b14514d5sm14505430f8f.10.2026.08.20.10.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 10:15:28 -0700 (PDT)
Message-ID: <dd1da602-675f-4b63-ace3-a23e55ce549b@redhat.com>
Date: Thu, 20 Aug 2026 19:15:24 +0200
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
X-Mimecast-MFC-PROC-ID: BYnnPnvKfXS3iF3nRTEfotuwWfC3NYj-O7j8E9ybiCs_1787246130
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: K5BGW4UPAOSJIYHVFQIPB45ITYY22XFK
X-Message-ID-Hash: K5BGW4UPAOSJIYHVFQIPB45ITYY22XFK
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/K5BGW4UPAOSJIYHVFQIPB45ITYY22XFK/>
Archived-At: 
 <https://lore.freedesktop.org/dd1da602-675f-4b63-ace3-a23e55ce549b@redhat.com/>
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

