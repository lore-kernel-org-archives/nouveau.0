Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DE4606A31C
	for <nouveau@archiver.kernel.org>; Mon, 16 Nov 2026 09:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EreqnY2u
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3619410EEE0;
	Mon, 16 Nov 2026 09:29:13 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CA32F49425;
	Mon, 16 Nov 2026 09:09:23 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1794820163;
 b=rjKRK89comHbax0EpVU7gMg8VYfRSsS20g8XpQWIwbkb2J8OGip1ReFtvVIbgD3Wu3wmh
 6VMX9Q8rLUdPpb34bvusZw8TcoxU897wjTxl+Q0Yr8jbsBilBoFJbaZVd4BoLJWs/Sn0Ttj
 sq4ZsyRA3vWArm1ZkF6hZl1iroQpeW3yemP/3coN2/Z7u5yCRmewYHFCS07oyk3jSdRW677
 RtP9FsadN0RrkRbl7FKH3474lQ+DhahljEjYx4ITm1cUyN6Q/HhvUoxWgMfCR4tIoZOuylb
 IHrFKOC35ADQhY3IvW6JWjyZ9RpqOw13e9Cob7jCkiRIv6NwL/pU2qBMcd8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1794820163; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=wFbznQG0d5IonVOFhnusqlVdFzPG48oiZmmSS9tPXTU=;
 b=KkjkZIk8FIc+mzfHIIvkT1uCIOxS+G74i2mmOtx7o2XCUilnWY1ngEe3mDWZNKzzEtiei
 wBEnmmG6ukfWQ30aQgOetJytI+8dk1yZzrEhYytEoqh4nkXnDMJmUplQTTzBifAJLnuQ1If
 OTXM3wq24/LifC6F3WY4So1Gc7PjKn5eu/iapDBjZ/Oo6ghkJWMvG/s5GzoWZio+2X6gnGd
 YDHBttsFnZOz0aTG9oEI7o0Td+TvefTJhTONdo4jmQm78xZ0RHULQujkUHp3OOcQIrmREG8
 b7DGvfnDiNxK7dvOGLIOUjjNpN0BZ0KQfVMY7Kp6yWEBpvRzapn0wd/whDgg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 3F1EE49418
	for <nouveau@lists.freedesktop.org>; Mon, 16 Nov 2026 09:09:21 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 486A610EEDD
	for <nouveau@lists.freedesktop.org>; Mon, 16 Nov 2026 09:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794821344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wFbznQG0d5IonVOFhnusqlVdFzPG48oiZmmSS9tPXTU=;
	b=EreqnY2uGsPcGB08CysgsQlx2r4/WZU1DJtu10NyBFowSXSRQwTr+DDZ5u4hEu8Vvrf2VL
	T2HA1h/5StAh4rLX6cK0x6E/6USu1TwtXzonLSXLJ+6m+hDOcsVfH/CQWfq8AAP6EgT9B/
	0TGalq8gj1Y5x0gaJwlsRwjRFpJ6+bg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-bWXoxoRwMfa7HMpOyxuEGQ-1; Mon, 16 Nov 2026 04:29:03 -0500
X-MC-Unique: bWXoxoRwMfa7HMpOyxuEGQ-1
X-Mimecast-MFC-AGG-ID: bWXoxoRwMfa7HMpOyxuEGQ_1794821342
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4a35e1d2dddso24287695e9.0
        for <nouveau@lists.freedesktop.org>;
 Mon, 16 Nov 2026 01:29:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794821342; x=1795426142;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wFbznQG0d5IonVOFhnusqlVdFzPG48oiZmmSS9tPXTU=;
        b=W48mgS0Zk5d67FUdyBQYGiI8duW+vBLYMu4p+QUn5zPYFmT+HfjSOZC2pwQiAyCcj0
         jPLiD1Vt8yujh380QCADQyGHP4U21KMzRs1YpJiqrDSfXfMGERtfyxnFcWHAvpQqBinQ
         3v69CU1ImtDWjvKL49SfMxR8ouR/nKP7d31sW+IcotAF/TaHDHJjYKCdFdXTnsotfgNc
         RWbe9om0DkYTD83GQVtram7Sh082qs+ELZRtMMCIgCfw7zWhbKy9biBmVmTrjtNczIeZ
         LfUqBXrDFef5Fi+YgWUXCIbFOfpqjTd89nCaHwurehBdZZig3RJWKZ5p/90jQcevZmRA
         0erg==
X-Forwarded-Encrypted: i=1;
 AL+hErFZuVwAn94t4SLKHRW1ODD2HdBbZL4Mzzshpninup3+s+HbIjkvRrGzqiMPOf7pHeQmzptgQ/CM@lists.freedesktop.org
X-Gm-Message-State: APuU4Z9ah8+pTgYknNICM7Iv4RKYa1KgiuV5AJrHZIu2yXzpDLcejjfk
	tXXfe7t4FTBHHx5XJP8d3vp3InydxzbFEe+WayPoJojqmUb2Hn61VyEgDhESgaOjTe8RHtbJktk
	wZNDMjdwTCY3p0polnGVtZbXrTqHptwz49VgbBQZvnOzxlM4jQlJaNrCseOTC3VsIA68=
X-Gm-Gg: AYBFou3Gxv4zyVpJCABmdi+qZQbg+tWEI4Oi4w7CoGa4nf7kYW/gvkNpc5xT2yLugFy
	vsVQdekV7byI+iLR25xFO+FvO5tTTQzm2RunaNQVLg55dPwzroKO7k/XZxbLn/w2RipW65vi2wZ
	UJ6rbyl9j897Ioow0xZNNFC4+6HLczZr0xK5iDVbP3gXxciVFfxNETBUlq8fCjfrUBeC1ZTv86L
	YNugNQZbmzW9DKyUwm1qQ/crjs1rnSn+2+1LrR6L8RveZsoH3SGKgZWue/S+xovMIz59A6XFn3z
	rI3g3+JSlr2KrPHLKqpWcpUlrFv0px0OLW1g00P7fVW1do6YllxDRIolmy41e3pSyLuuyRVBMD8
	pC/Jz1jlN5OmVy50hszzNe2LvYBjaP1i6kE9vJ7xcClykynWga3In3NfXWE5atDLKYghM62RbL8
	couwJzuyEzP6LZ6pNUSo68j78GeZVREZucuO+uM6Q=
X-Received: by 2002:a05:600d:41c9:b0:4bb:60bd:5398 with SMTP id
 5b1f17b1804b1-4bb60bd5507mr133776655e9.10.1794821341839;
        Mon, 16 Nov 2026 01:29:01 -0800 (PST)
X-Received: by 2002:a05:600d:41c9:b0:4bb:60bd:5398 with SMTP id
 5b1f17b1804b1-4bb60bd5507mr133775995e9.10.1794821341249;
        Mon, 16 Nov 2026 01:29:01 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb675200e4sm115370395e9.0.2026.11.16.01.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:29:00 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: "Mario Limonciello (AMD)" <superm1@kernel.org>, Maxime Ripard
 <mripard@kernel.org>, Alex Deucher <alexander.deucher@amd.com>, Jani
 Nikula <jani.nikula@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>, Leo Li
 <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>
Subject: Re: [PATCH v11 11/12] drm/bridge: add PS8622 connector luminance
 support
In-Reply-To: 
 <20261103-superm1-backlight-property-v11-11-00cce7b2ba22@kernel.org>
References: 
 <20261103-superm1-backlight-property-v11-0-00cce7b2ba22@kernel.org>
 <20261103-superm1-backlight-property-v11-11-00cce7b2ba22@kernel.org>
Date: Mon, 16 Nov 2026 10:28:59 +0100
Message-ID: <xlv1ld6trup0.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: veyINsx4PEKAyyAFQJTKtaIu0HcNlfHsyh7XdpLBBB8_1794821342
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Message-ID-Hash: 42YMQVD32YOIZEOM3TONGRYSNMOFYXAU
X-Message-ID-Hash: 42YMQVD32YOIZEOM3TONGRYSNMOFYXAU
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/42YMQVD32YOIZEOM3TONGRYSNMOFYXAU/>
Archived-At: 
 <https://lore.freedesktop.org/xlv1ld6trup0.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb/>
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
> Expose PS8622 brightness through bridge luminance operations when
> DRM_LUMINANCE is enabled. Keep registering the backlight class device
> otherwise.
>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

