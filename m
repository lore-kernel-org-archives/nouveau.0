Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBCB606A329
	for <nouveau@archiver.kernel.org>; Mon, 16 Nov 2026 09:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EMITteBu
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 121EA10EE51;
	Mon, 16 Nov 2026 09:16:57 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9FA3E49408;
	Mon, 16 Nov 2026 08:57:07 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1794819427;
 b=K89UPGbpc1hapQmV1t7GwiqCHEEAaOrwlaMNO0cFHo6k2mkbGjRRgJGYeWRn6XyMaRry9
 axDsSdWscABnaBedxi21iSZMifKeAlPENArSf9MzdXY6uKdajLJ0iaVnPq5rThvnfzyKgPy
 n3Ba54obSSQkxnyQQQN309rxvZBLEShPWBUyvc83SaX/EaIOxn4G+C4uIMiifAjrZVXzaT1
 /gToNrjFlI05gS/jHi55Cm3fey6N2s9oxeo/n5zXCUIORGv9NmCOkzKVyW5lQuRtQcTbfXC
 MvYOpzTgtqO78CkVgNN70x0rcFButQmImrvdP4B4E5lf3FfsMkMayEcmt+iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1794819427; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=oRP30ct8ql2mTXDmxPgRrEvZM+dzcMrlEdSg9+eoSP4=;
 b=e9Tsbx6iO0nq4+e+7UC7GLWXkHXuP82PCQVUZLbwAsSktPd33Qt9IRdQf41n+KOwDb/yA
 UeAHa7uTnaPO7vcRjTySL9oXlDSIah1bl7DMA0gZSjmJeEVcLHAO/OhHBC/YX7ZPAGf7uTn
 xTDSKHOsEFcKghxq19pMxhtcXnu5skDNwUTZTo8UcgaOhvI3TrA76SM9uyZ7FeiZev0TL3o
 4ethwPSz/bN/mB8LHWM0EgO18JAtQl9gjSQA2+CgAhqMhSQxE5NOBuBNXcTYK0drlZP5F+M
 BESpnNvmbGUjR2/f7aJsJJzvEHcdWG9tQ3FvXJc9BkaD9gJaed8rTTkM8EHg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 2D79F49315
	for <nouveau@lists.freedesktop.org>; Mon, 16 Nov 2026 08:57:04 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 36F2310EE73
	for <nouveau@lists.freedesktop.org>; Mon, 16 Nov 2026 09:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794820607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oRP30ct8ql2mTXDmxPgRrEvZM+dzcMrlEdSg9+eoSP4=;
	b=EMITteBu+Zq8r2lIitF9xBTTKbkSgXU4IffsBkd4BZFKpcgITbCd7jZEUSnebvtB2Q1W6d
	PH35SJqECAscrYKbWMwb5wWggcBbMPV98Z82Erc6SmcAfUQrQ+UmiqSowFcYnMHNmbUBtL
	/2QOZwEK8sHfcBqS3vJlpjRRNyFyp5s=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-218-8aFgDEHPNhmRrTeEFnlnLw-1; Mon, 16 Nov 2026 04:16:42 -0500
X-MC-Unique: 8aFgDEHPNhmRrTeEFnlnLw-1
X-Mimecast-MFC-AGG-ID: 8aFgDEHPNhmRrTeEFnlnLw_1794820601
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-4916bd6e3baso2512039f8f.0
        for <nouveau@lists.freedesktop.org>;
 Mon, 16 Nov 2026 01:16:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794820601; x=1795425401;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oRP30ct8ql2mTXDmxPgRrEvZM+dzcMrlEdSg9+eoSP4=;
        b=DYiBRY5VHkeTF0G+1N1yROTRyz+R3iNWyiBUP9NgI+JmA0rB/eIk3pB7Dnz+dGzLa0
         UmC/ZhrVulSU3DN53rxIzY8eixskoEIX9Oboq49mt9/VlFCIL69Dyoc65UsmUqm5hi/v
         OlxoYvFbQJYJq2vfjkD2TvpFKJHzXAyQBf6neOLGFllLv037okTYpqCDxlo+bz6dG3im
         ROzkLukwB31en5CZkA5iD3/PpJ5oBe2Yb/Qy9SK6Bbtth4QzcpM2SzcvHvqKFneJ2CZ2
         AFL9XhpsyV1HIwatPsERweV7D5faFzbVS8IahRctapmqU+gIqVdbliQASwjI/7o81L7W
         VFEQ==
X-Forwarded-Encrypted: i=1;
 AL+hErEOM7zrW/u3fdfvSvv2bA5r/lpJIy8rrF4K1+APWlq4HUad4pwYZm5puBZ6yJzKOsQD9rsSQu8+@lists.freedesktop.org
X-Gm-Message-State: APuU4Z8mw2pqznUPwiXcNtzJoCw8rJ38dwbC8AwiqA8B4T49g69zsw1d
	n54vxsE/p7MpR1uBPyOvxqWKnysfv7BUgKkiKCFJmayq0ca8oQCZN9snx+gFkF0crv8Gr26Emp6
	ojuNkSjptTDuDnpacYUsWE5Rkia2DVwxGb16h8p/+TV9j2DiSwlsouyZbUXfS0uwBi74=
X-Gm-Gg: AZFdTZcoa2bVbH6w0SskSjJGZpnF+VCfcym1LlB1X+ulv1wYpMqG8NqPIDNUr6lFjY4
	HcLfb87c4xT67qp9trNgBQpBjigwT/fhnlJ3lzTIawkAMp4QrVcx26JEN6kN16w3+MQp0vh+Wul
	6bUa+i4uLau2kNqNxSt2Ofylhg9Req1Ivu2N8XxjjzfA5gNB8zAoDruB1V/FWFYoUYsO5NPfzmW
	dCJvIpqToXTe4al8OKkIdyQX9rM9TrEQuGT0oE0Ja3q17GmySA8r6UjD4v8upjOTebAMKRc1UVD
	i2e5H0EIlVDHWHZi6Tu8GG3pdnLNKXOfjN3mAJJdaScljq3OP0fsa7jM8Yr9HeVw8l4Cirfkwc+
	7q8uMZpfVB489D6uTlOQXo1Z3JPQfySHSzaPmBpXdT5P0+1eAQtOhxGUZ+me17Mi1QuFrtl44Ho
	jIBfin7RiX4vyLh8hqx+MgnLLyJHO2QiN16Bi+F2E=
X-Received: by 2002:a05:6000:4907:b0:48e:b62:d133 with SMTP id
 ffacd0b85a97d-49c6d453058mr20772422f8f.5.1794820600448;
        Mon, 16 Nov 2026 01:16:40 -0800 (PST)
X-Received: by 2002:a05:6000:4907:b0:48e:b62:d133 with SMTP id
 ffacd0b85a97d-49c6d453058mr20772359f8f.5.1794820599837;
        Mon, 16 Nov 2026 01:16:39 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49dc430fa15sm14802191f8f.13.2026.11.16.01.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:16:39 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: "Mario Limonciello (AMD)" <superm1@kernel.org>, Maxime Ripard
 <mripard@kernel.org>, Alex Deucher <alexander.deucher@amd.com>, Jani
 Nikula <jani.nikula@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>, Leo Li
 <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>
Subject: Re: [PATCH v11 06/12] drm/bridge: add connector luminance operations
In-Reply-To: 
 <20261103-superm1-backlight-property-v11-6-00cce7b2ba22@kernel.org>
References: 
 <20261103-superm1-backlight-property-v11-0-00cce7b2ba22@kernel.org>
 <20261103-superm1-backlight-property-v11-6-00cce7b2ba22@kernel.org>
Date: Mon, 16 Nov 2026 10:16:38 +0100
Message-ID: <xlv1tslhrv9l.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iuAjo_XrAoYrOnb84VAFwUbPXEERxrtq0EjI9VRIKbM_1794820601
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Message-ID-Hash: 3Q2AE23ZB43ATQMRXDLZSWHBSAQ576IC
X-Message-ID-Hash: 3Q2AE23ZB43ATQMRXDLZSWHBSAQ576IC
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3Q2AE23ZB43ATQMRXDLZSWHBSAQ576IC/>
Archived-At: 
 <https://lore.freedesktop.org/xlv1tslhrv9l.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb/>
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

Hello Mario,

> From: Mario Limonciello <mario.limonciello@amd.com>
>
> Allow bridges that own brightness control to advertise a luminance
> operation and its supported relative range.
>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---

I'm not a bridge expert but this make sense to me.

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

