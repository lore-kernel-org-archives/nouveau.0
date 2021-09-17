Return-Path: <SRS0=9rOE=OH=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A387FC433EF
	for <nouveau@archiver.kernel.org>; Fri, 17 Sep 2021 15:41:44 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77FD360E94
	for <nouveau@archiver.kernel.org>; Fri, 17 Sep 2021 15:41:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 77FD360E94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=poorly.run
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B9B06EE06;
	Fri, 17 Sep 2021 15:41:40 +0000 (UTC)
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30BD86EE06
 for <nouveau@lists.freedesktop.org>; Fri, 17 Sep 2021 15:41:39 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id y144so18724388qkb.6
 for <nouveau@lists.freedesktop.org>; Fri, 17 Sep 2021 08:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=sD9uOm5tvP8G0xyXDbxUkajObP/tQsvPQSYJ5ZYdDAM=;
 b=Rg3pQPgRu26LSb3Ym25tiFmMLVhLfw9SdEEPoUud66ykQ931PiVOz52pLoXgAwC0ox
 /mHm2+hTiXHgLGuu8t2OWBPxQeOxDuKiW2UWpQCJgV/9B2iyAFVPcdrDxhJyA8LPkxyJ
 OVEGgkK3fO0TjncIvsrXlzuOkF9DG2sCzr1V8nefKneQvr08Iin7PI1M/USyeat1+qSV
 cOlTWgRk5Y/SwKT1Vqv7vzUsbBQS0nxnQuYMU4VQRwxuRpApDeTEvusujkPUACV+t5Rr
 PqWzgleLdsIFdM+KfFpZGV0L6vGeeHDCvPQNK/XrwqX+BsWpcls4hgKiAqKiOlKNQk9K
 vi7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=sD9uOm5tvP8G0xyXDbxUkajObP/tQsvPQSYJ5ZYdDAM=;
 b=uT6gD8sj4n0k/XTLzUOudoOcLHeK0xgzZkhGaTLqV3xSGA/MBGOH2XF9h4y18/MBrk
 ygsFmuCQ1L2Ns51KfZwrAEXuEMvfylVnFy5/WusMmpsjhTCQwXUCQfZM9s2pWqUvdCol
 pDZKJmOKKD3qyEMQ92V4M/bhCQTk0YZFQ+crQGUWo3CqoRmihppi3C9dgwbqsLONNvN6
 taAXzI67m2jg9/NaEKloUKYVPY61AH3RfNdGfc11TSg/ROP3fVNHUSjVnPj+aFK8LLa1
 s1LNxXBetNn0R/m3vX6s2rX5/WQWARr/59GaYRS3fYERVuC3VuuJReDn5KY8jnItE05I
 pNaQ==
X-Gm-Message-State: AOAM530cb0g7F4aoiog0qs6pXZ4jDWAlP2rWVtcU3n/4MlRQuaVSI4j0
 r0+fkFF6MJ9nyy1Yg54FF1Z5Fg==
X-Google-Smtp-Source: ABdhPJyjGqSsuJH7awGUj/YMxh1AbnFOYdGXvCtauKtD0RAp5YpZ9/RTGbsIl79Pjc1kmnuFaGBLDw==
X-Received: by 2002:a37:a87:: with SMTP id 129mr3162058qkk.448.1631893298377; 
 Fri, 17 Sep 2021 08:41:38 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id 9sm4122038qtz.83.2021.09.17.08.41.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Sep 2021 08:41:37 -0700 (PDT)
Date: Fri, 17 Sep 2021 11:41:36 -0400
From: Sean Paul <sean@poorly.run>
To: Fernando Ramos <greenfoo@u92.eu>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Message-ID: <20210917154136.GJ2515@art_vandelay>
References: <20210916211552.33490-1-greenfoo@u92.eu>
 <20210916211552.33490-10-greenfoo@u92.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210916211552.33490-10-greenfoo@u92.eu>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Nouveau] [PATCH 09/15] drm/omapdrm: cleanup:
 drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Sep 16, 2021 at 11:15:46PM +0200, Fernando Ramos wrote:
> As requested in Documentation/gpu/todo.rst, replace driver calls to
> drm_modeset_lock_all() with DRM_MODESET_LOCK_ALL_BEGIN() and
> DRM_MODESET_LOCK_ALL_END()
> 
> Signed-off-by: Fernando Ramos <greenfoo@u92.eu>
> ---
>  drivers/gpu/drm/omapdrm/omap_fb.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_fb.c b/drivers/gpu/drm/omapdrm/omap_fb.c
> index 190afc564914..56013c3ef701 100644
> --- a/drivers/gpu/drm/omapdrm/omap_fb.c
> +++ b/drivers/gpu/drm/omapdrm/omap_fb.c
> @@ -62,13 +62,15 @@ static int omap_framebuffer_dirty(struct drm_framebuffer *fb,
>  				  unsigned num_clips)
>  {
>  	struct drm_crtc *crtc;
> +	struct drm_modeset_acquire_ctx ctx;
> +	int ret;
>  
> -	drm_modeset_lock_all(fb->dev);
> +	DRM_MODESET_LOCK_ALL_BEGIN(fb->dev, ctx, 0, ret);
>  
>  	drm_for_each_crtc(crtc, fb->dev)
>  		omap_crtc_flush(crtc);
>  
> -	drm_modeset_unlock_all(fb->dev);
> +	DRM_MODESET_LOCK_ALL_END(fb->dev, ctx, ret);
>  
>  	return 0;

Return ret here, with that,

Reviewed-by: Sean Paul <sean@poorly.run>


>  }
> -- 
> 2.33.0
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
