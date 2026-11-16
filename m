Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15D1606A31C
	for <nouveau@archiver.kernel.org>; Tue, 17 Nov 2026 15:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yLSnr85G
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 95AA910E9AC;
	Tue, 17 Nov 2026 15:33:58 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B06EF494BB;
	Tue, 17 Nov 2026 15:13:58 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1794928438;
 b=KHFz7cm28X8l5J77NfO0KJrOlifgYuCZW/LHWWkFyY3vk9jurixvb812cppOlR7HSZtwa
 Nk72yiIUuUmupmGPG1oIxhRcyzmdNxprseaJHyKAlB0YWQawxveA88RFutb6XBiRFe7hxbj
 KQ6XChqXSLOv5TR4LS1PbgK7IHhlaJJt0HX0+hz8yerJUg5rCd1OUtM/X8mfcCfgyzmwXnP
 yRX4y8sXvuXzcwPWyFRybCgbOzwPru4Kczmg1YSv7foRfMlV5OnG8HwxQ0gqLIRHLdLSxhv
 Qqc+w80fqx6+nA0CKUzNFNj40L0PpZiOwOMcZUNUqp8kZI+zJP3cAEClQgmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1794928438; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ohJe8BJBCDffCZ4MuZ0uQ527x40SLHyvNrdc9OJlZqQ=;
 b=nIiPLt0cnxekRQGNgIso57YZeNyYw7wvHgAQYhaiZPM3MaaKwxYPdwGJy4hM6K7GFloCY
 R1/sDcb5YURbr8QhKt4R/yp30zvxNeJUTBCUb+2KEBO81Wx1Zm/+SKBOIqGmQddaTF5zrS4
 DXkvaZoXkGnwuZwN3T/uvlwiWW5w3oUHMSzqUpwR0AaF4kA5qWn5o+Za2pzE7wkOn+cZQ+H
 J9pSBvAfPxUTBx9jEq/Nfqlf11oNSquxst4pq3hT3o0pQC8LzcemhAyxfLP8KieoA816Pte
 vrIylgOZAkk2eu2d/5ZgSSiVNuwBoENj8Ynzy881AkTeD8Ak31DNUENCgKfA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 1EB7E49468
	for <nouveau@lists.freedesktop.org>; Mon, 16 Nov 2026 18:09:57 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 273FB10F3B2
	for <nouveau@lists.freedesktop.org>; Mon, 16 Nov 2026 18:29:42 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4ba013938d7so40212305e9.2
        for <nouveau@lists.freedesktop.org>;
 Mon, 16 Nov 2026 10:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794853780; x=1795458580;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ohJe8BJBCDffCZ4MuZ0uQ527x40SLHyvNrdc9OJlZqQ=;
        b=yLSnr85G4Y819zUrmY63pK4JuRVM7bzKsBBYekOBnKl9IQgpWHAyvva1DrgDLB5vDa
         6jmnWEqJLEV8ArMo4x6pljeLAav8AsBZhLLbka+Cw8B0g33Ksf+YQrBbv9Cukn0HCICs
         Ufb2E58oFmVT2LtTpg2JgWuDAGpyD4VhtRYAD0me33K4s73WK+kGoHKg910Mptcs4PIx
         T5IgwnZkSOBZX9RicW3gi7BMh3k0lFBPvmapDoZTekMGEOaY70r6ao08xwrZ5MpaBfTQ
         HuOa5OrDVzKgS7lm4EILmb8Ap8rxCRurqBy9Ghl6HGYxIrRByvIEnYXH7Zs6b3clb4/5
         oPUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853780; x=1795458580;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ohJe8BJBCDffCZ4MuZ0uQ527x40SLHyvNrdc9OJlZqQ=;
        b=ftw/fmpyNluP5zffujxbNjUsFhtSnSUpZt6K35eDyMqe9Op4kAyThDBLZFttf8bjh3
         4B/MPae2SnlzXkD1NUrVR0+mJbmrQOYTf/osQZzqNfhW3pz2/NEYh+8eSPEXD4dp7XcJ
         gN5l0lym8JmrXll65Gc43DL+ghjRx9aAW5sk4s+9uXUrIIsOAO5GGK0fds5Pw2mX9vih
         3+esV87/TUcGHDhZlBO7GMUf4riXj37zsHQJSl2BUASjyQobmINvOCi3kESUEW3UPdw6
         iFNcAyCBvCaqKpOUsdFzF5v/GqmvFdGWHEoa4HJDNmbMiaE7LnoqnYT7vJ22kJdMppQv
         Yqcw==
X-Forwarded-Encrypted: i=1;
 AL+hErH0Y/LMrnQtDjzbruSCpB9RsbEMbh+mUt1rj4/xT7ttdazJe9F5JhQMCxCbYC06MjHAJzEXXOnH@lists.freedesktop.org
X-Gm-Message-State: APuU4Z9Jgt2e7kC5AVcBn2E6HQBFhvuoLzKk+og/cR09/SsYkVa+ujs4
	khDGhBGdr0ER/0GrmbN3vQDMfkG0PEUDXbyqWWhMM0SMdqnVDMViUxQu
X-Gm-Gg: AYBFou3Vf1DHfChe4GGa/Mnjl7vNk6fGkYWkwogVE3Ukc2autZs+iJ6gCW6Tl46GSU7
	e5xCVS3cQzW1bpnu8flKQwV1JUmtpcowPnag8lORZKLfuXdjJZSwp3cVAZU9P9vM62YuVwa0hae
	vDWAYPk6MPNjPnz5bFwVbJpLmSCxskPGdcJ2PgvuaV/sq8un7G+lQi+U8NgPcTfYCAyUy4ag5qj
	1NO10fR3OImm/B4V8Tszt3nSwCToLaoH7609apxHYwlT0Xb+qXRZjnDdysFQqKMOpYbxsiwy8cf
	opFlypYOz5ZKIkh+JpvOPDyRqFKCKIiPZ6o3RnujpQtnSL+aiwEz/BE3A9qC7ThxpN5RE9hznA6
	ZdNYbR4UJ7pCKqVc7GuaGIimtWwaH45F49lQ2qpd9StsNXBdcll/jykjLnpGvhCUlrG/PdIXr3o
	Z57fgoO1+mA1eUCGKpRSzoI9sAeD3ioBOhxeLlf7CeifkNtYzjF+PDDSBNUvgh6iRbc3DqERFFa
	Xq9kNO4JVV1Vn1vv77m4fH9LX2iExPuIKaV1F26Vn2wrzIsO321ITkc0+fO+CijbIC+AkaFrb7h
	Bl7LXaoZcRRuPde40cOSql14+HlMrIU4NoF8cLniwJgOet3tbl8=
X-Received: by 2002:a05:600c:46c9:b0:4a3:d327:6ed with SMTP id
 5b1f17b1804b1-4bb55a5fdf6mr254839115e9.17.1794853780298;
        Mon, 16 Nov 2026 10:29:40 -0800 (PST)
Received: from [10.155.107.148] ([147.88.200.116])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb783965d4sm7171285e9.7.2026.11.16.10.29.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 10:29:39 -0800 (PST)
Message-ID: <1b7a7d94-e349-4f3c-b973-c365041c15f2@gmail.com>
Date: Mon, 16 Nov 2026 18:29:38 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] drm/atomic: Try to make atomic+async usable, and
 clear up the "async update" helper confusion
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20261116091130.13950-1-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Erwin Springer <aot.lerwin@gmail.com>
In-Reply-To: <20261116091130.13950-1-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MailFrom: aot.lerwin@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: UJA5JXMPIVZAU6N35I7YH4CGWGRLRSBC
X-Message-ID-Hash: UJA5JXMPIVZAU6N35I7YH4CGWGRLRSBC
X-Mailman-Approved-At: Tue, 17 Nov 2026 15:13:57 +0000
CC: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Christopher Snowhill <chris@kode54.net>,
 Dharma Balasubiramani <dharma.b@microchip.com>,
 Dmitry Baryshkov <lumag@kernel.org>, freedreno@lists.freedesktop.org,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Huacai Chen <chenhuacai@kernel.org>, Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 Jianmin Lv <lvjianmin@loongson.cn>, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 Maxime Ripard <mripard@kernel.org>, Mingcong Bai <jeffbai@aosc.io>,
 nouveau@lists.freedesktop.org, Qianhai Wu <wuqianhai@loongson.cn>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Simon Ser <contact@emersion.fr>, wayland-devel@lists.freedesktop.org,
 Xaver Hugl <xaver.hugl@kde.org>, Xi Ruoyao <xry111@xry111.site>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/UJA5JXMPIVZAU6N35I7YH4CGWGRLRSBC/>
Archived-At: 
 <https://lore.freedesktop.org/1b7a7d94-e349-4f3c-b973-c365041c15f2@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


Am 16.11.2026 um 10:11 schrieb Ville Syrjala:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> The weird uapi semantics of the atomic async flip support make it
> really hard for drivers to implement. Try to fix that by filtering
> out the no-op junk from the commit that userspace likes to put there.
>
> Also a lot of people are apparently confusing the
> .atomic_async_{update,check}() hack with async flips. The two
> are completely orthogonal, so try to clear up that mess by
> renaming the hack to .atomic_bypass_{update,check}().
>
> TODO: atomic+async is in serious need to proper tests, somehow
>        all that seems to have gotten skipped when the feature
>        was added :(

thanks, this fixes the KWin case for me, so my patch is no longer
needed..

tested on Raptor Lake-U (Iris Xe) with unmodified KWin 6.8.2 and a
fullscreen client that requests tearing through wp_tearing_control_v1,
without my patch. I applied the series to the CachyOS 7.3.4 kernel,
the only conflicts were the renames in amdgpu and msm.

Before, none of about 350 frames per run was presented without vsync.
With the series 3330 of 3336 frames tear over four runs (with and
without CCS modifiers), and the "async flip not supported" message is
gone. What is still rejected is the first flip after the modifier or
format changed, once per run, as intended, and in three of the runs
one commit that touches the cursor plane, which can't do async flips:

   [PLANE:146:cursor A] does not support async flips
No warnings and no flip_done timeouts in the log.

If you think it fits, feel free to add:

Reported-by: Erwin Springer <aot.lerwin@gmail.com>
Tested-by: Erwin Springer <aot.lerwin@gmail.com>

