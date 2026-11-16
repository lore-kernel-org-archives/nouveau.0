Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A04606A32A
	for <nouveau@archiver.kernel.org>; Mon, 16 Nov 2026 09:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BwZcJYhj
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D340E10EE97;
	Mon, 16 Nov 2026 09:28:23 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7379449421;
	Mon, 16 Nov 2026 09:08:34 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1794820114;
 b=ehzjdoFl+LXcSejgrEXLkvDpE9faExsrK5vy38TL1Oaey5bk/KlTVS72fuK1zUtpnNOaT
 8FZOPU2kqELztKcSM1Ym4qeiyDKiRj/IcJPeYTwelAL3SrCXvnZ5r/quxR7T239A63R8GDM
 a8S00VxhxUJCjBPxWohmXY2+l41cl3H3TZRHLY8houOqSvDi6xJTcQNzHhy5RAiasiymgAA
 HbQt0LGRGUhxvf3mqDY/OuYOtyL/LJrRkrfNQAgobQwVkKT1b8rTgK9kFupbUeDY/rvntZH
 +VoDFHDILC4xOhO5BqSvnkgVUnHIRfDzbdNx+IT76rDhYJtK1dAfS9S7wdnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1794820114; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=6O5L7vNOw9tqxoH8eLe9M+49Omq2w8inLzq+ECt/NxU=;
 b=cxaQqCzvAdGLys5MkTI4YbckW68tHnXLlm96hxVDD12NA2N3MNACJFe4BUM86VivjYyQ1
 ZQkeH72ej6BLdyE4O8uhCq2+SdNh1LHeAUvWGATRKralv2AQ21btYTPPXAMY2c214H2aYYh
 Z8G+mTZVEzoAnNKwLOrEO+5ZCayIC0inLx1KXUZZCLlhWJ7JZTU1i0pf5EmcXJrSTYga6ut
 zWNx4LUnI3d2g+41K58mFfFhwwisDv0O7q91irJ3PY2A71eetkWlbsuMMohtaaNPZGlmOma
 TqK+vsF8nlex/T1pgUvHFQgz2y9vGmGpTbIdRbbaeVPjR7wgRkFTV49VJwEQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 3BD6D49418
	for <nouveau@lists.freedesktop.org>; Mon, 16 Nov 2026 09:08:31 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 498FB10EE7C
	for <nouveau@lists.freedesktop.org>; Mon, 16 Nov 2026 09:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794821294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6O5L7vNOw9tqxoH8eLe9M+49Omq2w8inLzq+ECt/NxU=;
	b=BwZcJYhjRymcmBgjCmkbZqbD3p/7Z5yUIbI7BWl3csiyfQr4n5j8UxnyHgnvYPgRmKRnVI
	8qhDedUnvU1+nud8PS3oufxHCj8E+8P8mdtSVHVs0BjFS5TtBpFXyjxiVJRjnXYD//WsVJ
	t3KBHJmGz0jx44PKQ0LKGNP8xprcRUs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-196-YZLSXiLAPVK_Y0oYF9Rp7w-1; Mon, 16 Nov 2026 04:28:11 -0500
X-MC-Unique: YZLSXiLAPVK_Y0oYF9Rp7w-1
X-Mimecast-MFC-AGG-ID: YZLSXiLAPVK_Y0oYF9Rp7w_1794821290
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4ad3d35e899so21062505e9.1
        for <nouveau@lists.freedesktop.org>;
 Mon, 16 Nov 2026 01:28:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794821290; x=1795426090;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6O5L7vNOw9tqxoH8eLe9M+49Omq2w8inLzq+ECt/NxU=;
        b=z/9dDFOfCyZLU4VQNvm/PrsZHZji3mKBaYij3yJXAYzc3jF2GA/0Iw60qGeYQe6i6y
         Nrv5uk2OOuGS8RwvwTXbMvLCt0k1xmXP2nyc2EgCbIHf+mS6VXxrarWDRvpubBZ6NB9X
         V3AiEh2eXhi5narU3HkSPagwMGLLpslO7gRkac98lR44UyZWtOjSLi4JpBHFUal0fyKX
         j5CMA43nI4e2XCpySmUBdA9P4TuhNlYer8ZNEzXqCeSofX/UNzOoVwtyZzY3+FQNXLgv
         PIHgXA/hG4iWM9qb/IUAHg6suuYTkpTFC3pX8TLztJ7hAqv1SpQGDLA5CeZwSf32DCU1
         B41Q==
X-Forwarded-Encrypted: i=1;
 AL+hErHy5e7jdzSGcOagUO+n4hmKXPH34VI/VvOueDKFmvnmuBjtTmyin+aSVxzO5TpdprXUxY2Q9rN3@lists.freedesktop.org
X-Gm-Message-State: APuU4Z9PdWONcg0E9ZqIqysnLGg7VckH/6dgaoM3XuxhDwQg918AzOKy
	CQNAD/GKHly/TfFMJrbLQADEieZyAfrHFnctPFZarZ+YuwcOwaZM27LNeHYldIgxNbj+YaqrNfE
	eMOqcgmxTuJd/Bt0M1wTatNBqPJTa1PErX3uST3wHSfa81VS3Y58TdYxSkWtfgKJMXRU=
X-Gm-Gg: AYBFou3asmV0KcYkagVPYtOi3A6cWZZ7udzmDuOYcM+Rwk7fUpbeJJKLwLiqE6urXUm
	w7wmk68amlbpVRYUsrF+LOnV3MpK7l9zA5EjRGPilVLwY9ru+OTsLKeQ8pOvwPpbQcnedmKOFnz
	I7lUxEPvMuMcFf92/j5kEwRZPIbxrFTu9580d7iU3ER5J6mwgZNQ1yFDhb88Bln09UJrFIFowHd
	3jPsG9yLa2DLwC70B73YGmqlu6/So0CBRMxhmDWQL2HVNl1ABMyR0eXgifPLRRVOyBoZ67zxdAv
	1cv7R+Sp3oqdGkzMnd3YqsBYYQQNEffyaot4MlPNjtBOldta0s/iwVu32xijQid+SgCQHNxsef2
	VIO4a1F7934uC7OskUcBG10h01Ky4d59LDUIGyuaXVBICg1z2fGEn95S9a/Tkv/CgCNS6NT6wMB
	vjGOnKy9Y03ekuQFF9IzxLciWs95CfhLsYLILUbxY=
X-Received: by 2002:a05:600c:1993:b0:4bb:659c:b8db with SMTP id
 5b1f17b1804b1-4bb659cb9e8mr125482055e9.12.1794821289833;
        Mon, 16 Nov 2026 01:28:09 -0800 (PST)
X-Received: by 2002:a05:600c:1993:b0:4bb:659c:b8db with SMTP id
 5b1f17b1804b1-4bb659cb9e8mr125481505e9.12.1794821289312;
        Mon, 16 Nov 2026 01:28:09 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb5720f6basm139362015e9.4.2026.11.16.01.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:28:08 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: "Mario Limonciello (AMD)" <superm1@kernel.org>, Maxime Ripard
 <mripard@kernel.org>, Alex Deucher <alexander.deucher@amd.com>, Jani
 Nikula <jani.nikula@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>, Leo Li
 <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>
Subject: Re: [PATCH v11 08/12] drm/bridge_connector: add luminance support
In-Reply-To: 
 <20261103-superm1-backlight-property-v11-8-00cce7b2ba22@kernel.org>
References: 
 <20261103-superm1-backlight-property-v11-0-00cce7b2ba22@kernel.org>
 <20261103-superm1-backlight-property-v11-8-00cce7b2ba22@kernel.org>
Date: Mon, 16 Nov 2026 10:28:07 +0100
Message-ID: <xlv1o6bpruqg.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SMojx2AFrms8DOihbr2yKUS5DgMNM0GLHnyK6Tees58_1794821290
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Message-ID-Hash: QPSHMY2WA6S52PLABKD2ON6V6NIXHYU7
X-Message-ID-Hash: QPSHMY2WA6S52PLABKD2ON6V6NIXHYU7
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QPSHMY2WA6S52PLABKD2ON6V6NIXHYU7/>
Archived-At: 
 <https://lore.freedesktop.org/xlv1o6bpruqg.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb/>
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
> Discover the last bridge in a chain that owns brightness control, attach
> its relative luminance range to the connector, and forward atomic
> luminance updates to it.
>
> Do not infer panel luminance support from a terminal panel bridge. Panels
> still have direct consumers, so their connector integration must remain
> explicit.
>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

