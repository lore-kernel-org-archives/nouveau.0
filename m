Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA53CA5FA1
	for <nouveau@archiver.kernel.org>; Mon, 28 Sep 2026 18:10:38 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CAA8210EB70;
	Mon, 28 Sep 2026 18:10:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ba5M3eSB";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A8DE24878E;
	Mon, 28 Sep 2026 17:52:36 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1790617956;
 b=rUGxze+MoKg8F3Z1dBrO9KtWLQDQu7oFPQm8TCq7Bwu28oK1qrct+kvBPZC7enB4CALcS
 rDq9RN0h6v1mL1A7ycIzlg+ao4oV8OinpNie8S1vcPUjy7wtHaeZ7aiuTzADyPyfIg9qE4w
 ZsXB1OlPafrP/7safktlysst5fDHF8Lgc4uqVEqgRwoNiF31ZZ+tlV7+hz4wAsMyW9RME2H
 k7AL27mw7rN81RInYVPIJSPg1j2foIrSv7x0E2k9Z7Kw+Ogy+s6P40ei4fifCKPmjfdXUBH
 6ZsAiVkkLWRQJJ74lR7JLUOxfaG5hb3gToyVWbvKS0EkDESURv9HIi0LERQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1790617956; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=OFTht72VGYwnHy4rRuIiS5N5orHNND6LgvZVdS8G2Q0=;
 b=TbmBEKVXuncs5Z3JapraJMw8zAc0r1iZZAEOwm5mmIaKF2S8FNkpZazk1vhENwfyH5kD5
 oj70DVlwC+jLH/S3GgkIC9sVLdBuQbnl1TyOR0jEqNsTkFWKzmO5c5pZkJ+mL7RfSJYcujl
 Bqsop+hFNeP3RrdxkxexfYT5WhZS8QO3aFHRxhzgypbRm+d0h2NvxSuNZEwOjJABp7CMsES
 zZUp33WX8KYi4EtZIGaFNr3/24gdZoTP/xkbGS7fNrPIcHV+G3DSkeN/SB5jh9VOtwoXrJx
 y0t/3fuvUyvLcjAOapd13XdnQvcbiRpwzqw3w3fuZp/50fGZiF90dKzuN1Bw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 9F01C4764D
	for <nouveau@lists.freedesktop.org>; Mon, 28 Sep 2026 17:52:33 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6535710EB6A
	for <nouveau@lists.freedesktop.org>; Mon, 28 Sep 2026 18:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790619034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OFTht72VGYwnHy4rRuIiS5N5orHNND6LgvZVdS8G2Q0=;
	b=ba5M3eSB2aU1dR+veVcUzfFraM+VToN/iV7Wpk8dz1654estlF+ipPmSpkfiV7SNzL0sTn
	IlxU5CrReGOZ52vnu2CyWIFT6Vq6cnGlBH+MF7CbOHlW/x57wmC8uOoCUSs2eLoIOo7BR+
	1d96OCVGuIvm2DE2vmxxTX58BGEFmA4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-q-OBpONsP_yXR_30yj4hDw-1; Mon, 28 Sep 2026 14:10:31 -0400
X-MC-Unique: q-OBpONsP_yXR_30yj4hDw-1
X-Mimecast-MFC-AGG-ID: q-OBpONsP_yXR_30yj4hDw_1790619030
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4994d67d0e3so24457065e9.2
        for <nouveau@lists.freedesktop.org>;
 Mon, 28 Sep 2026 11:10:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790619030; x=1791223830;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OFTht72VGYwnHy4rRuIiS5N5orHNND6LgvZVdS8G2Q0=;
        b=diwST3WmjqfOuaSqNx3Hom270Z+plmeOrcyO+0cF7fNLOVKvhofNvyrvw/nvokpgY7
         0nLa2uvhRIN87FwAIYTSjbwwTPARqbV5WDJiDLzcblDHJWXFqTNmYuejDwCVjHfJBQIh
         E2mW2Xg+ocWSkkX3AHAD4iS1IXo0hM6Q3lX5n/AlJmCu8lz21XWOrYLN+zzVN5/XAA1k
         Z7ACiuRE4/e4hsmPfPIQ+sls6Bnt44LGe+eXBTiVFfHfQm7KMS5ZAIDloXKj/rRZrs8N
         AHMp6Lc2XBffCTZGn5kpqUpfEpb4MqzmXyK/iWj2RKVblBJvhOV0mnc+Na0rhvjzpQ3L
         59XQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzcesQTk1/AjJuQ+VlGMHTf6yx+oNjZOB+NTdzBaRIo+asNr63k4hHcTzNNDb4B4nPPHnzPzQji@lists.freedesktop.org
X-Gm-Message-State: AFuF++kDgpyJ2Qpm6zIGr7X2VmRH7RXCJdagcLVVcXSMpBFkJovCa8oe
	oAuPu+sSfKjGJUz/gxMgNhBx0Ychimrz3eNso2q8VFKRhFhYk9fAO5KYKiPj9TLF4XhqUxfSwrZ
	if+5oWOgzdL/TceCl596eCGO9HB3SqlLgJJF4UEMy269NE3ZL7qA0eKAXcJ/fyJpdSDo=
X-Gm-Gg: AYBFou3Cw1ogYcP0LfH641UujWAMQdQkCWk/LhXmdMH17M/t4/N/qFFRPy16OoLIXrx
	lxXcsLHvKbVE7XKZ86iyexYn/0IUW6gt3s5goW54+eqmPxY9ulYnGtGH+9YIUIHu+1MVqni5vgK
	6GjbhHMEIm+ZBt/VCKBcCwcGelF4jutmUMG91ENwZPJ4faFLNHhgrkWs8cWpGQMuGS3UpcxgH3f
	Iyf72cFHaDKAXI/pGxT644saz3Cyeqh6bKuWpus4TP6HpU8NK7ZSAVKlqmoMPB3m1Y45IUUIBTX
	tbw6QaxruKsGiZml2fbNa6zrKTxK5s4AD1FpVfbiuCWfP8dxQq4OG4hvLO5NhV8pZWRQr66Kgod
	FGzf+OtzdQaLD/EcqS4npQ7+dbTGknHw5QmQWdRHJuMf0mO2Q31AkFzWQ4OQe6lUW3A==
X-Received: by 2002:a05:600c:4f44:b0:4a0:23f:8b0d with SMTP id
 5b1f17b1804b1-4a0023f8d93mr91712505e9.2.1790619030039;
        Mon, 28 Sep 2026 11:10:30 -0700 (PDT)
X-Received: by 2002:a05:600c:4f44:b0:4a0:23f:8b0d with SMTP id
 5b1f17b1804b1-4a0023f8d93mr91712165e9.2.1790619029624;
        Mon, 28 Sep 2026 11:10:29 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a00cfe16a2sm9652415e9.4.2026.09.28.11.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 11:10:28 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, jani.nikula@linux.intel.com, Alexander.Deucher@amd.com
Subject: Re: [PATCH v4 2/2] drm/fbdev: Move fbdev helpers into client library
In-Reply-To: <20260928080323.23909-3-tzimmermann@suse.de>
References: <20260928080323.23909-1-tzimmermann@suse.de>
 <20260928080323.23909-3-tzimmermann@suse.de>
Date: Mon, 28 Sep 2026 20:10:27 +0200
Message-ID: <xlv1zex1dz70.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gvWFc5gUUMy3x_sh7j-x7zIffN6AGAxPYsY8TBVAEGc_1790619030
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Message-ID-Hash: RZPOXCPLA3SBBZVJ7UEZIZNSZ43VGDKI
X-Message-ID-Hash: RZPOXCPLA3SBBZVJ7UEZIZNSZ43VGDKI
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
 Alex Deucher <alexander.deucher@amd.com>, Jani Nikula <jani.nikula@intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/RZPOXCPLA3SBBZVJ7UEZIZNSZ43VGDKI/>
Archived-At: 
 <https://lore.freedesktop.org/xlv1zex1dz70.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> DRM's fbdev helpers are for the fbdev-emulation clients. Move them
> into the client-library module. Fix include statements throughout
> DRM drivers.
>
> While at it, rename the files from drm_fb_helper to drm_fbdev_helper.
> The old name was too reminiscent of DRM's framebuffer code.
>
> The GEM support code for fbdev remains part of DRM's memory managers.
>
> v4:
> - fix the depedendencies from v3
> v3:
> - remove obsolete dependencies from Kconfig
> v2:
> - update armada und docs
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

