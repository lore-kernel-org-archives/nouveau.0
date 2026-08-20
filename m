Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E5DC5DF85
	for <nouveau@archiver.kernel.org>; Thu, 20 Aug 2026 17:06:09 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 979D610F12B;
	Thu, 20 Aug 2026 17:06:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ag32rPux";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 23A4E47A1A;
	Thu, 20 Aug 2026 16:49:34 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787244574;
 b=dl0ZEcqFXF0AauqNM1nh4rAfhFxzgmr0Fh+nVe3wxq3f8rD5Ffj2TA5Brha49akV6hrY1
 7t4NfVj+Tn890ZbO3YdfG3toEApuFHj0I9MVzQny/fPx0qWn4FsEcAv7DOV5eoxVEJTQOwn
 QsrQcTeEkEkawidKwJaVbYXr/w+ZGSRgvLsm1bdSdVET5j2z+MmIaQUe5sLFAaLMiTt46fc
 CpJ4M6RYmm7MAGpRL/gTwkkmQLylReWvREE75YiYXAihwwBP5lOCUJptYWfXSXr2FOOZiOI
 wKVADWdZ3LkdF6fPOiA31Qt9p38+BHLg0frU7mMuD5y9IUMcubzSaRbqvx0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787244574; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Z4jxRAgmGu6qOONmDUji01BEYH0iTGQlpmgV/kwEyHw=;
 b=JwFKCpzvCTYFaq4y3PCzMX5cBqEcvdHEJ29K4cfQVSzPLE1WMxTzMt6rQOBYnZCVlMsdR
 /88+WOJGwEs+3+4zm+2lTosiiCh6H88iuqb7nab9jyZQehklgXGhc1mvrb60jF8QOl09e79
 zYzbb7Kwz0V7zDL/Jv8VxLBNg2nB4yjdVv8zw+1gFxm2CrGeY31OW0/Z/LIFblQ59KdbqQZ
 qmWp8OJyKKR7Jy4Xld6ILq+wKwqknV/4iUbHrtmn58wLLrUIwzYNvwoiIdLKh3ddRF9jguw
 RwVnPN3cfKcksi5UxIrI6958yn5/sL1Y1VFBA7dQmyeyVvy/acPAOvLivWlQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 5C4DF47A10
	for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2026 16:49:31 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 842CE10F122
	for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2026 17:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787245565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z4jxRAgmGu6qOONmDUji01BEYH0iTGQlpmgV/kwEyHw=;
	b=ag32rPuxablCnaM34SMF24vOf97MUqFOmfPUT2b2VErS7r8korJOY3at67S/krk/K6vcH2
	eaWOJjjdve5Er6VCmihz6JLdaGNQAy4H+XQmOOL8sBLWQfmGTzMK2mck7LfpWKeYqcAaUo
	LuddsdxulAagTLF4mNJL7hSc3U0FoV4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-77-fdSPa4PoPwCIKwJPis8nRQ-1; Thu, 20 Aug 2026 13:06:03 -0400
X-MC-Unique: fdSPa4PoPwCIKwJPis8nRQ-1
X-Mimecast-MFC-AGG-ID: fdSPa4PoPwCIKwJPis8nRQ_1787245562
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-47f83450a8eso100923f8f.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 20 Aug 2026 10:06:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787245562; x=1787850362;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z4jxRAgmGu6qOONmDUji01BEYH0iTGQlpmgV/kwEyHw=;
        b=RPUEgs+Uow05ruDKlMfJMo7NsIWLYhL++hsJKwu9RBqVZGmpY3HznbvCGhOuB8KSKw
         PyertyuhhEkRlXUB1gV5nuEII+mIHXA5nE2NsZOXpMy7KnQ1kRryFesiqz8TqJmYi0oZ
         7lh870IGDEts4bylo0/zhrtIfnRRGmia9FDaLLR2GmIk9cOyPKBcNNAhSu9efzeyr8t4
         caW5uw0P5uG/PgiiA33ym3PloaaC0pybrhiIxbiylYN/eRVu5zuak+JeGxZT1CCMnUp3
         5rWGlyXK/wVeh7zb7/sWb/1wZlibETy4v+SKWghHney5ql8iqIhqd29fAiAa6ceQRx3E
         qR/g==
X-Forwarded-Encrypted: i=1;
 AHgh+RpVqSz/SDZqhWGYxxkGz3nZmdcSfC48qDU1Sk/tWPuoSBRU6JtZPysS2kgJo2xk+hMGB1rr5zLR@lists.freedesktop.org
X-Gm-Message-State: AFuF++nIisCIoFNJ2JoLkWOlo6rlyLmlppTJK0/RHHEOMnVpJ7ofrItv
	IMXUHQVyvmVKRVQ3R+cM/kiy3j/08smr7kXvEp+TvVNAf0t6AYFD8UIErYJ2bL6ai7t+32xu8h/
	mIDTfYRAoOKjWwMTjIe99brjzaySHrE02D99uMQBa0ac+if5t2oOJ/iYBnIDlheflfSI=
X-Gm-Gg: AR+sD10nMqDkJQvkMbbR5mcuHHxzo0L6Vn9Y+lF3BL26Yo/ca2tKBrLFAPTXxUqWjkB
	UVSfD28rfH1lfoH/MHIp2knBID86Uquc9sjP1kXnHXU+NMfq4qWkiKLXdygMNLFXNOFjwlJKBsk
	43Eye7nbnzUGDss2WpYlXZ7OCrv3+1VHB+oB/do2exgg60POj3+vKGI0W5CwH2XklNEe+M0ZEMc
	aCaPF3Bb+/qzUdKMiBUqLh2M0AShQjY7KavTZizZ02ohTBbjU8OYZ3f027MTxhpoxzOBAY8O9K/
	cTSb4z1dQ1sS1O/0e6BPrO917W2g8Kr9dDDFOJI7IUTRovQvgFGmgtIUmVhC0BeV15bRi4Lwhrn
	4JKBA36LileiDaRbpQ5DE0lh294NCpphZP0mDMCtH4DfNMw==
X-Received: by 2002:a05:6000:25fe:b0:47f:86af:8fe7 with SMTP id
 ffacd0b85a97d-482c0ba220fmr134359f8f.22.1787245562165;
        Thu, 20 Aug 2026 10:06:02 -0700 (PDT)
X-Received: by 2002:a05:6000:25fe:b0:47f:86af:8fe7 with SMTP id
 ffacd0b85a97d-482c0ba220fmr134240f8f.22.1787245561785;
        Thu, 20 Aug 2026 10:06:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:11aa:87f0:935:4f8e:b423:64eb?
 ([2a01:e0a:11aa:87f0:935:4f8e:b423:64eb])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b14cf0a3sm13674489f8f.32.2026.08.20.10.06.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 10:06:01 -0700 (PDT)
Message-ID: <5e7e0d9c-2fe2-4c0f-a854-1b1a495b1a7f@redhat.com>
Date: Thu, 20 Aug 2026 19:05:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] drm/panic: Return errno codes if panic output fails
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
References: <20260818125012.468092-1-tzimmermann@suse.de>
 <20260818125012.468092-5-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20260818125012.468092-5-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4wb96oepuwf3wiyT8m69EWkgn1LbmR0tsLWRq4DtJ9E_1787245562
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: NN26IAOPRC4JQJMSTFIHRYIMUHB7IFCE
X-Message-ID-Hash: NN26IAOPRC4JQJMSTFIHRYIMUHB7IFCE
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NN26IAOPRC4JQJMSTFIHRYIMUHB7IFCE/>
Archived-At: 
 <https://lore.freedesktop.org/5e7e0d9c-2fe2-4c0f-a854-1b1a495b1a7f@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 18/08/2026 14:28, Thomas Zimmermann wrote:
> Return errno codes from the panic output helpers to detect invalid
> panic handling. Avoid flushing the display if an error ocured. The
> unflushed display output might be helpful in debugging.
> 
> For now, test the result values in the panic test cases. A later patch
> will add support for retrying failed panic output.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_panic.c            | 41 +++++++++++++++++---------
>   drivers/gpu/drm/tests/drm_panic_test.c | 16 ++++++----
>   2 files changed, 37 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index 96d238bfceee..594235661710 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -478,7 +478,7 @@ static void drm_panic_logo_draw(struct drm_scanout_buffer *sb, struct drm_rect *
>   				   fg_color);
>   }
>   
> -static void draw_panic_screen_user(struct drm_scanout_buffer *sb)
> +static int draw_panic_screen_user(struct drm_scanout_buffer *sb)
>   {
>   	u32 fg_color = drm_draw_color_from_xrgb8888(CONFIG_DRM_PANIC_FOREGROUND_COLOR,
>   						    sb->format->format);
> @@ -489,7 +489,7 @@ static void draw_panic_screen_user(struct drm_scanout_buffer *sb)
>   	unsigned int msg_width, msg_height;
>   
>   	if (!font)
> -		return;
> +		return -EINVAL;
>   
>   	r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
>   	drm_panic_logo_rect(&r_logo, font);
> @@ -508,6 +508,8 @@ static void draw_panic_screen_user(struct drm_scanout_buffer *sb)
>   		drm_panic_logo_draw(sb, &r_logo, font, fg_color);
>   
>   	draw_txt_rectangle(sb, font, panic_msg, panic_msg_lines, true, &r_msg, fg_color);
> +
> +	return 0;
>   }
>   
>   /*
> @@ -547,7 +549,7 @@ static int draw_line_with_wrap(struct drm_scanout_buffer *sb, const struct font_
>    * Draw the kmsg buffer to the screen, starting from the youngest message at the bottom,
>    * and going up until reaching the top of the screen.
>    */
> -static void draw_panic_screen_kmsg(struct drm_scanout_buffer *sb)
> +static int draw_panic_screen_kmsg(struct drm_scanout_buffer *sb)
>   {
>   	u32 fg_color = drm_draw_color_from_xrgb8888(CONFIG_DRM_PANIC_FOREGROUND_COLOR,
>   						    sb->format->format);
> @@ -562,7 +564,7 @@ static void draw_panic_screen_kmsg(struct drm_scanout_buffer *sb)
>   	int yoffset;
>   
>   	if (!font || font->width > sb->width)
> -		return;
> +		return -EINVAL;
>   
>   	yoffset = sb->height - font->height - (sb->height % font->height) / 2;
>   
> @@ -589,6 +591,8 @@ static void draw_panic_screen_kmsg(struct drm_scanout_buffer *sb)
>   			start--;
>   		}
>   	}
> +
> +	return 0;
>   }
>   
>   #if defined(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
> @@ -814,10 +818,11 @@ static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb)
>   	return 0;
>   }
>   
> -static void draw_panic_screen_qr_code(struct drm_scanout_buffer *sb)
> +static int draw_panic_screen_qr_code(struct drm_scanout_buffer *sb)
>   {
>   	if (_draw_panic_screen_qr_code(sb))
>   		draw_panic_screen_user(sb);
> +	return 0;
>   }
>   #else
>   static void drm_panic_qr_init(void) {};
> @@ -888,23 +893,25 @@ static bool drm_panic_is_format_supported(const struct drm_format_info *format)
>   	return drm_draw_can_convert_from_xrgb8888(format->format);
>   }
>   
> -static void draw_panic_dispatch(struct drm_scanout_buffer *sb)
> +static int draw_panic_dispatch(struct drm_scanout_buffer *sb)
>   {
> +	int ret;
> +
>   	switch (drm_panic_type) {
>   	case DRM_PANIC_TYPE_KMSG:
> -		draw_panic_screen_kmsg(sb);
> +		ret = draw_panic_screen_kmsg(sb);
>   		break;
> -
>   #if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
>   	case DRM_PANIC_TYPE_QR:
> -		draw_panic_screen_qr_code(sb);
> +		ret = draw_panic_screen_qr_code(sb);
>   		break;
>   #endif
> -
>   	case DRM_PANIC_TYPE_USER:
>   	default:
> -		draw_panic_screen_user(sb);
> +		ret = draw_panic_screen_user(sb);
>   	}
> +
> +	return ret;
>   }
>   
>   static void drm_panic_set_description(const char *description)
> @@ -951,9 +958,15 @@ static void draw_panic_plane(struct drm_plane *plane, const char *description)
>   
>   	drm_panic_set_description(description);
>   
> -	draw_panic_dispatch(&sb);
> -	if (plane->helper_private->panic_flush)
> -		plane->helper_private->panic_flush(plane);
> +	ret = draw_panic_dispatch(&sb);
> +	if (!ret) {
> +		/*
> +		 * Only flush if we have a panic screen to display. Otherwise
> +		 * it's probably better to leave the display output as-is.
> +		 */
> +		if (plane->helper_private->panic_flush)
> +			plane->helper_private->panic_flush(plane);
> +	}
>   
>   	drm_panic_clear_description();
>   
> diff --git a/drivers/gpu/drm/tests/drm_panic_test.c b/drivers/gpu/drm/tests/drm_panic_test.c
> index ad2f3a2f93b6..fdd77b0cc54c 100644
> --- a/drivers/gpu/drm/tests/drm_panic_test.c
> +++ b/drivers/gpu/drm/tests/drm_panic_test.c
> @@ -30,7 +30,7 @@ struct drm_test_mode {
>   	const int width;
>   	const int height;
>   	const u32 format;
> -	void (*draw_screen)(struct drm_scanout_buffer *sb);
> +	int (*draw_screen)(struct drm_scanout_buffer *sb);
>   	const char *fname;
>   };
>   
> @@ -87,7 +87,7 @@ static void drm_test_panic_screen_user_map(struct kunit *test)
>   	const struct drm_test_mode *params = test->param_value;
>   	char *fb;
>   	int fb_size;
> -	int i;
> +	int i, ret;
>   
>   	sb->format = drm_format_info(params->format);
>   	fb_size = params->width * params->height * sb->format->cpp[0];
> @@ -102,7 +102,8 @@ static void drm_test_panic_screen_user_map(struct kunit *test)
>   	sb->height = params->height;
>   	sb->pitch[0] = params->width * sb->format->cpp[0];
>   
> -	params->draw_screen(sb);
> +	ret = params->draw_screen(sb);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
>   
>   	for (i = 0; i < fb_size; i++)
>   		drm_panic_check_color_byte(test, fb[i]);
> @@ -119,7 +120,7 @@ static void drm_test_panic_screen_user_page(struct kunit *test)
>   {
>   	struct drm_scanout_buffer *sb = test->priv;
>   	const struct drm_test_mode *params = test->param_value;
> -	int fb_size, p, i, npages;
> +	int fb_size, p, i, npages, ret;
>   	struct page **pages;
>   	u8 *vaddr;
>   
> @@ -146,7 +147,8 @@ static void drm_test_panic_screen_user_page(struct kunit *test)
>   	sb->height = params->height;
>   	sb->pitch[0] = params->width * sb->format->cpp[0];
>   
> -	params->draw_screen(sb);
> +	ret = params->draw_screen(sb);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
>   
>   	for (p = 0; p < npages; p++) {
>   		int bytes_in_page = (p == npages - 1) ? fb_size - p * PAGE_SIZE : PAGE_SIZE;
> @@ -182,6 +184,7 @@ static void drm_test_panic_screen_user_set_pixel(struct kunit *test)
>   {
>   	struct drm_scanout_buffer *sb = test->priv;
>   	const struct drm_test_mode *params = test->param_value;
> +	int ret;
>   
>   	sb->format = drm_format_info(params->format);
>   	sb->set_pixel = drm_test_panic_set_pixel;
> @@ -189,7 +192,8 @@ static void drm_test_panic_screen_user_set_pixel(struct kunit *test)
>   	sb->height = params->height;
>   	sb->private = test;
>   
> -	params->draw_screen(sb);
> +	ret = params->draw_screen(sb);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
>   }
>   
>   static void drm_test_panic_desc(const struct drm_test_mode *t, char *desc)

