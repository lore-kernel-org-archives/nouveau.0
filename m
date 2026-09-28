Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDCC7CA5FA2
	for <nouveau@archiver.kernel.org>; Mon, 28 Sep 2026 18:09:38 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8953B10EB66;
	Mon, 28 Sep 2026 18:09:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="A6biqNKX";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5C13C4878A;
	Mon, 28 Sep 2026 17:51:36 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1790617896;
 b=a0XonRSjXlsF455leWvyLOUsPHwA3agKGvNS3yvpDppZBKhCBu+hDeDidpnw30R/02pBt
 /AckkG9Lt0/g6sMtudpjWP71/88CnnXR+VKho924OHkBJ7FvqlXMfSH8bLfkB3lfEXfuGvt
 A/w4pUGYgdJ2E/gaB1DMsKYOitBvCKTJqqqqXk1fupmUDn3kSlkUk69l4jb5HO51wLdE/aR
 jAxoKqlxIpb6anYIDeDWL0+q9U0zw92MKnpymtiIcvw5X+EJkSzSYaMOurP/PWGsjh5nZVL
 XsLxVZKplIm/VOfu1rHTVpNgM5CZhOhuWu2k1Byp08uZmrIOb3lByy+YzULQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1790617896; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=WblzAY3JRV9CtwzNMKeAP2oGeUzXJbmdjxKWRmzPjT0=;
 b=rysgYFq5cI5aPHGkZ6SdcJCTAhKcbMNBl6K9LUrQ2agB6o2iJ7h2ICjCHXdVtiOCxgwvi
 ojFwUmaBKtdO2gXDcMhb8THHoo7P9qs1yjkKe5GXua1jtixAgJAqSZicIXFfoLBgCbeZJmx
 ENxKoYBElWwcQA7YyDB8ENDM0eQFu6HShEun5najkgFd5VeEgzdokiqRnnJ9gqjZvm5Xnq5
 LjbKJGObQuJejEGKPznQQjASTFXzKZtIpwXNT644ENmkzMLcHa0EJkK6veBxGXyLaeZUzIr
 eW0NbmMNMdqn4B1XxbRU7yXDvlTv0pfYhQPeLarVMwaNCAok3623TYurEWSA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id E1DBC4764D
	for <nouveau@lists.freedesktop.org>; Mon, 28 Sep 2026 17:51:33 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A1E5F10EB59
	for <nouveau@lists.freedesktop.org>; Mon, 28 Sep 2026 18:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790618973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WblzAY3JRV9CtwzNMKeAP2oGeUzXJbmdjxKWRmzPjT0=;
	b=A6biqNKXoIYIsoP4BCSWnzSdE+Qo0qGkMIRW3A9+nQGJh5MzKzkRmpny5t80bfArJOzMbx
	GqsLZHQf4LKot3eng/aUwK4IZGim2JK6l62nU+PoCjFZGsYBE/z4jyWV6CYHbwTfP1djXU
	uKNckHVxNbjD1AvbM3DfrU2XnMIAxwI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-389-NibGGjp5PYuFgLCeqwYoBw-1; Mon, 28 Sep 2026 14:09:29 -0400
X-MC-Unique: NibGGjp5PYuFgLCeqwYoBw-1
X-Mimecast-MFC-AGG-ID: NibGGjp5PYuFgLCeqwYoBw_1790618967
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-49e6ba4abdfso35375675e9.1
        for <nouveau@lists.freedesktop.org>;
 Mon, 28 Sep 2026 11:09:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790618967; x=1791223767;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WblzAY3JRV9CtwzNMKeAP2oGeUzXJbmdjxKWRmzPjT0=;
        b=wGH7idBbuZz6Y3DPIwuHO777juPlsB40W3mSw+3GRFHZ3b38W1FyV3v8x3GP50gwuf
         YJjr5HXmj3QOjPyycxdXLxQiKrCbuA8UQW5q/PywppptggnCEVH0EU1N8Fy/Y+JVa7MM
         9vOTHE2qSJxLT5dSdnKrcnxt9sH4CO/pdWlDsSs0FNSyBmSqOBorlE9b133S6Rm/jNov
         PAb78Io/SG5XTucpiOZTNwKU51IR0lpp81lUjjuCzcpbPkaQVIo6UCpyRUvy6hl90/oU
         ToW5D4iidsgroPkouS+kec8niLHBT5irEhod5xV62zAFAmB1saofCxm5VzPKYe/nKO1F
         +00Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBwnodFvkZ+c+Lw2sDUGlCq+4pOMmXJtn5KzJFDw/2bPVMloHg19AZHdgNx4DWXuxDBg81GAthTr@lists.freedesktop.org
X-Gm-Message-State: AFuF++lolqXZCroCBUo1l/Xr3JqnV5JT8fSkEQZrG7ePK5b3/MYJPLU5
	rcYWMUndwOkiMjmXzOUcsuE+S5OYoEV3SBxNnlrOX8yvlZg+CgvTOJAwPu0vFdwaJ15Vm2kAjHD
	3E5fwKgEBg3lVtEEHjYNWg43YgREwnS16GpRm0qem1zQa9Jqu50dvubdxiecg4NTVVw8=
X-Gm-Gg: AYBFou0lcFzGwB7X2Ko0I34BQUklvHq3wyzyCCVzbiM6B3VjV+WNPDjmLgKFnfUzMYB
	djgQgMk1+nfP7DoyR5xLAIxaHiCuhRMF8iulYOORFsHNbOIHUfhz7LrTKaXOZoWmsFhc9gPe4lX
	qFGWmfCzUz8GClseH6VUwXspC1PIvw+26XR8ebGYXyb8nGuBjNUI2q7iIY20hRKtidd4QfivO6c
	uSqJZNyAkGFo/QBYYSsRG6ijhhYtzlNoOYHSRZz5yXvPPpAvbBP7DtwGhN/v6ML1gyeH6wFl5MR
	tzLjXJXkzwvKTHAO8LxL7WfTd/jkS7x/66GGnQMibWLkyXOogSZ+9yr5z/MMCfg5KdJBItmNjSf
	4O3qmMVw0SyJqOePHmSyuLAo5iB9+u7/yWwAlghojBXT+41wBIVSMljFPFWyQiMO+2w==
X-Received: by 2002:a05:600c:1389:b0:49f:dcc8:c735 with SMTP id
 5b1f17b1804b1-49fe66f4c7dmr231739895e9.18.1790618966877;
        Mon, 28 Sep 2026 11:09:26 -0700 (PDT)
X-Received: by 2002:a05:600c:1389:b0:49f:dcc8:c735 with SMTP id
 5b1f17b1804b1-49fe66f4c7dmr231739375e9.18.1790618966445;
        Mon, 28 Sep 2026 11:09:26 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a00d10cb7dsm3533065e9.0.2026.09.28.11.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 11:09:25 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, jani.nikula@linux.intel.com, Alexander.Deucher@amd.com
Subject: Re: [PATCH v4 1/2] drm/fbdev: Move fbdev module parameters next to
 module init
In-Reply-To: <20260928080323.23909-2-tzimmermann@suse.de>
References: <20260928080323.23909-1-tzimmermann@suse.de>
 <20260928080323.23909-2-tzimmermann@suse.de>
Date: Mon, 28 Sep 2026 20:09:23 +0200
Message-ID: <xlv133utfdt8.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5iC6u97fXmg88kvvlxfYybxhkSYU13T8dQf-YukPHPc_1790618967
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Message-ID-Hash: 4EVDJ7LYG6N4GI55RBNZX6NXZOXMQVYK
X-Message-ID-Hash: 4EVDJ7LYG6N4GI55RBNZX6NXZOXMQVYK
X-MailFrom: fmartine@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org, sashiko-reviews@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4EVDJ7LYG6N4GI55RBNZX6NXZOXMQVYK/>
Archived-At: 
 <https://lore.freedesktop.org/xlv133utfdt8.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Define the parameters for fbdev emulation in the source file with the
> module-initialization and exit code of drm_kms_helper.ko. The parameters
> control some aspects of DRM's fbdev emulation. Common usage looks like
>
>   drm_kms_helper.drm_fbdev_overalloc=200
>
> on the kernel's command line. This has been possible for many years
> and changing it would likely upset users.
>
> The emulation code is supposed to be moved into the module for DRM
> clients. Keeping the parameters in drm_kms_helper.ko avoids breaking
> systems the use them in the way described above.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

