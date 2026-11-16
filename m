Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1D8606A32F
	for <nouveau@archiver.kernel.org>; Mon, 16 Nov 2026 09:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UiBzXo6v
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8C2BE10EE71;
	Mon, 16 Nov 2026 09:27:45 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 240F04941F;
	Mon, 16 Nov 2026 09:07:56 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1794820076;
 b=i7FeAEnILOXt8P3+DhJacU/UoFOXQd/aH0IoIIa/uuiRedT7lABlhKhKRX1NYMxTbStIA
 oC9B/C5VMVD4ApuKAblq2fktBQZJzaDsjCmFiEU7ARl9QNcXqRt6eQdLgKzEWjmnaUocZuO
 6sgY1gy8Rhg5FRjheR9DQJxYN62kGY7sH92/8Y/nYzfL5qs8GOAkAqxGKo9HFZzpeGKWfC0
 bPrEmKSN0eckiA3HC19v7Ud0YrV4zbXV3ifa/w86YSNO0YTr4kSEfwLXaV/QsBLx5HDa09L
 c9wRSuLudLMPX/8z1XqfOLLS4MQt/uNEjF/1Nh5k1pUj5UZOaCjAmaF7sk6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1794820076; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=UeghsTiOb4ju5n7zGZ1nHsTM034u6BwVxNZLSRJoYfw=;
 b=d36hJqtOW2tgLOqRQh1DxQypC1lklAluD2Ih3tuBNmW30HfCU1IkLr7WjQLYiLfJcf/pi
 DqsS2wfyM4gaZconiTPQbcC87RxWEHK/uiU4Rbb9LY27kDzLCgMYCD5mG+qeLvXCajidgPK
 USivbefj+cL5MwFsK2YVnTOfDe1yfNw5oSjhtElWUimGFwRQJkOC+NJJKVaWKhwzm5o8Ieo
 BoJ2gGlB0eHmfZKQatX9krMOiAP0j+lH9nJ68Xa3WlYOsibflkMB7LkllH6Ecz+bxWPsCqJ
 IH0Jagj29tjeSjnvLQiuLNIKcJbqb1LedR56kLQ1UmNJIX21L1jdXp5co3ug==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id BD5E049418
	for <nouveau@lists.freedesktop.org>; Mon, 16 Nov 2026 09:07:53 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C7B4C10EE51
	for <nouveau@lists.freedesktop.org>; Mon, 16 Nov 2026 09:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794821257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UeghsTiOb4ju5n7zGZ1nHsTM034u6BwVxNZLSRJoYfw=;
	b=UiBzXo6vcCDc6FiyxEEiAZd28cP/FZ/X3izfMP+7vC6RhVFci77XlVY5rEAG4YxSN365nw
	hr4c1+N7U7r2zuqogoYPHyXlGbb2EUqHGK9raWnDJq0ShcyVtKVcGGQrzEXCKka4G9vfM6
	x3J462hsPj6HgEgp0pfIHqJpGt7NJuw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-Mp2bpvhbOByD-Vk9bu6UIg-1; Mon, 16 Nov 2026 04:27:35 -0500
X-MC-Unique: Mp2bpvhbOByD-Vk9bu6UIg-1
X-Mimecast-MFC-AGG-ID: Mp2bpvhbOByD-Vk9bu6UIg_1794821254
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4b0a307487aso14787415e9.1
        for <nouveau@lists.freedesktop.org>;
 Mon, 16 Nov 2026 01:27:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794821254; x=1795426054;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UeghsTiOb4ju5n7zGZ1nHsTM034u6BwVxNZLSRJoYfw=;
        b=IEs7LK5z5rL90ES+ZTto5plQ52raThthYwvK6hgk21la+WCf/qCAl84R1Ep+AdJtjI
         be3Zb0SIXgFUw6cigqKL3Mr/zUjP2pZKhX2koSAF7TmVNtE6sXfchf/c0AqxtAUdH0g8
         Y5XqDQP/3BFQ7an0pOHs7sWuS7SvcOnK0sPMb6LyFEU59U4cqi7aTr1eCUvtcxClz1vN
         YriRWOh30MvU7OsiIYJ5ICA5YO5+4etbmqwl5uUL2pmfCc/bfVG0+ykalGCGl9l4pRmS
         oVrwmU2Ub5+EgornmIVNB3Ei/gaAaGUuQc8qPFuYJOsq5QhZQnBgMItCt4rfZ9aeU9+j
         Sgog==
X-Forwarded-Encrypted: i=1;
 AL+hErFeH4I4u5i5XHOpx01fVQATHjT4q57wNb+O06QLkG4DBKdKlKLPi5IgyMs56AIaLU4ZBTp4CRPS@lists.freedesktop.org
X-Gm-Message-State: APuU4Z8D68APwyfYiBubjQMvhpoBtT2SrFS8SClUMIjexzoo9GxfGTfR
	vRGp1TfUryTfTsmXfXFyQmgpnaRw6i0wt1vXZJLdMnW7n6RQbERPl0UQ+FsBqRECFDDpNDa8vrx
	LATMEEylZlQ4FaSJbPrEADUwKt1etvO8ILQBZ1MVF1PA1h5jA/Srb1N4YtL18E/idzx4=
X-Gm-Gg: AYBFou0b2iKgxJxw5y3hOuOsHekif+1qtA0AVkiC5BA0Z7tQNVFBP4+gq/tH+p+4In6
	VNz/48TnDYkJQQ4aeDnPuUXwL6K9CbOrL2r3e874lMU/Z5kI6P48IEL4Udcj0mHNoERt4IuYhRr
	+OxLBIXHoC5p4FIr1c6UCZO+eg+APGbySgxcK/dHLZZ8zy6akgbib8nfbiqUkyws559Vs1xypt3
	gOdyCrqnqLHPeAVK4KLIguMuBgJMfOn/XpvIvvplij6tM2uWtNZwF6HmqksZt+brqrcRDh4yTYF
	6jDrtejCh2m8sZQGiF+ze0uOYNjGlHAMQRP2MZJ5Aq5EMx+VVDxq9nXy2qZcJsGJopJmjKxor1s
	BnX2ZT70tdMVmgntKS3DDIrqD4EjI23Nx2X/pMlHzIpbFvfVMSW4c8HdYvmv1XEon+jOHOKzAWl
	N1kszo5sDxwW+p2w8FUtOn9jk7Yt4aZTkl8KTTBtc=
X-Received: by 2002:a05:600c:3114:b0:4a2:167a:c939 with SMTP id
 5b1f17b1804b1-4bb55a5de41mr207753975e9.21.1794821253831;
        Mon, 16 Nov 2026 01:27:33 -0800 (PST)
X-Received: by 2002:a05:600c:3114:b0:4a2:167a:c939 with SMTP id
 5b1f17b1804b1-4bb55a5de41mr207753235e9.21.1794821253228;
        Mon, 16 Nov 2026 01:27:33 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb52bab8bbsm280128335e9.13.2026.11.16.01.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:27:32 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: "Mario Limonciello (AMD)" <superm1@kernel.org>, Maxime Ripard
 <mripard@kernel.org>, Alex Deucher <alexander.deucher@amd.com>, Jani
 Nikula <jani.nikula@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>, Leo Li
 <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>
Subject: Re: [PATCH v11 07/12] drm/panel: add connector luminance forwarding
In-Reply-To: 
 <20261103-superm1-backlight-property-v11-7-00cce7b2ba22@kernel.org>
References: 
 <20261103-superm1-backlight-property-v11-0-00cce7b2ba22@kernel.org>
 <20261103-superm1-backlight-property-v11-7-00cce7b2ba22@kernel.org>
Date: Mon, 16 Nov 2026 10:27:31 +0100
Message-ID: <xlv1qzglrurg.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YO-gddTJqzCLITfWOepqOyxAc7zFzQL7xh1yGu3zfeY_1794821254
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Message-ID-Hash: 6OBKW3F37JODX2PHJUWDZRJRKIOD6B6Q
X-Message-ID-Hash: 6OBKW3F37JODX2PHJUWDZRJRKIOD6B6Q
X-MailFrom: fmartine@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Mario Limonciello <superm1@kernel.org>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Mario Limonciello <mario.limonciello@amd.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/6OBKW3F37JODX2PHJUWDZRJRKIOD6B6Q/>
Archived-At: 
 <https://lore.freedesktop.org/xlv1qzglrurg.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

"Mario Limonciello (AMD)" <superm1@kernel.org> writes:

> From: Mario Limonciello <mario.limonciello@amd.com>
>
> Add helpers that expose a panel backlight through the connector
> LUMINANCE property and forward connector updates to the backlight
> backend.
>
> Hook the helpers into panel bridges that create their own connector.
> Panels consumed directly, or by a panel bridge attached with
> DRM_BRIDGE_ATTACH_NO_CONNECTOR, remain unchanged. Turning the backlight
> on and off is left to drm_panel_enable() and drm_panel_disable(), which
> already honour self refresh.
>
> The panel backlight remains the hardware backend and keeps its
> /sys/class/backlight device, which is owned by the backlight driver.
>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

