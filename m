Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6456EC5DF88
	for <nouveau@archiver.kernel.org>; Tue, 18 Aug 2026 15:55:23 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4107B10EBE9;
	Tue, 18 Aug 2026 15:55:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="Ui5KdUDl";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4228A478F1;
	Tue, 18 Aug 2026 15:38:52 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787067532;
 b=eVeo+VYDRe1qNowjwBrUeICD5VIcn2Y8A8hGSaU9kWIFeTQVF69YBWWg34fbgK789pR73
 m+p++3J0Cg4ol1E6n27lyb0ti6O1amGeMPhSzKHcWgwj6SBy4PlS976q4ZDbn9Xo2NcctUa
 j4SYIVE1WVOP2+GcJR0UHho4vNNvjHNvwRxKenceIfsFmw7oqaz2xTuNpNkUawElSGRng8h
 YDYa7QoqTmpz019CuOZfbbaDo5oYXfsDJKTvmK7lkpsVtKpReIJR3CLBCYzCjPW5mHQhI3R
 l7Fd1x1LxdcFVUV8R2hdifinhOoVrkFUeUfVcphPAxmiHTj4niOZi3PUkkVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787067532; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Oib1sAGemzHmu6ROtRkEHyhCtwDTicVNKskycatCaao=;
 b=PDB1DV84cQ5TgSeg06GrlOcXL+S+m+ERdyi9tE9RNvwnoVj3SRO4KGqb2b6WvGATGD3X1
 IUQhJC2l0YY9Ek7bTAvdtj4CNe9nlufDlkiFJ+bTVAVBg7qdOXDEZg2QntCoAk39QlEgZUH
 DthulvhP3JF57uVzPbWNatZpk1buf18H2Y3zbd5n+dcz+ZuASv0wziP2YFCSgHt+YcNTC8x
 7U2Qmia2pB9V1uyK1ePBIBnUIjxBDjB8KgaD/4PideWMHynYi5N7MbAGWX8YLY4T/QsJL5N
 ev6D9zUTuxqq8xh0okrkJrrY7wigDAvOqzgMwHNmGjWleZNOMlxd0G0E7pGg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=infradead.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=infradead.org
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=infradead.org; arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=infradead.org
 policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 82C7745297
	for <nouveau@lists.freedesktop.org>; Tue, 18 Aug 2026 15:38:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 798B710EBDD;
	Tue, 18 Aug 2026 15:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=Oib1sAGemzHmu6ROtRkEHyhCtwDTicVNKskycatCaao=; b=Ui5KdUDlipNO9Vm4nINkg/+v4R
	bOUqu7BxrFpPjJPyyxL5/SQNc4/JySqtBdMrb5CyEz/IRILpW8+YnFuGzsaYbvWJv+9e0YtT8uwx/
	eE0eXe6fRPjm1sfCVSmOReeGwtH7/zEHlNxdnu5tpHNRyMiy4cejksDu81kvbeMEFRTaItbMt/IGi
	Q61CWpoF2IThZoi159FSHVf/TCVp1AzMzc9ZSRaQVSMkGFqvkSEm1dUtgG8Qvp88FNz5jkcBhNEOs
	ACjeQ2XWgqHevHSOffjhKrvnRBjt4Y+4cNGXzMxdf7NzZpsvk2bac1B5a/UMTuKt7keKswSiklY2c
	JG0mN6zA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwM9g-00000008JC7-1PPo;
	Tue, 18 Aug 2026 15:55:12 +0000
Message-ID: <916c4bd5-c73f-466e-8e9b-aee9d4d7d742@infradead.org>
Date: Tue, 18 Aug 2026 08:55:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/12] drm/panic: Move panic display code into helper
 library
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com,
 javierm@redhat.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
References: <20260818125012.468092-1-tzimmermann@suse.de>
 <20260818125012.468092-12-tzimmermann@suse.de>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260818125012.468092-12-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: DMWCCEE47VCJVEJS7Y27Q4JZRCGNRUUC
X-Message-ID-Hash: DMWCCEE47VCJVEJS7Y27Q4JZRCGNRUUC
X-MailFrom: rdunlap@infradead.org
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DMWCCEE47VCJVEJS7Y27Q4JZRCGNRUUC/>
Archived-At: 
 <https://lore.freedesktop.org/916c4bd5-c73f-466e-8e9b-aee9d4d7d742@infradead.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi,

On 8/18/26 5:28 AM, Thomas Zimmermann wrote:
>  M:	Hans de Goede <hansg@kernel.org>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 323422861e8f..cdfd72d9a9c5 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -45,6 +45,7 @@ config DRM_MIPI_DSI
>  config DRM_KMS_HELPER
>  	tristate
>  	depends on DRM
> +	select DRM_PANIC_HELPER if DRM_PANIC

but DRM_PANIC_HELPER depends on DRM_TTM so
DRM_KMS_HELPER should also depend on DRM_TTM. Otherwise:

WARNING: unmet direct dependencies detected for DRM_PANIC_HELPER
  Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_TTM [=n]
  Selected by [y]:
  - DRM_KMS_HELPER [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_PANIC [=y]


>  	select FB_CORE if DRM_FBDEV_EMULATION
>  	help
>  	  CRTC helpers for KMS drivers.
> @@ -130,6 +131,10 @@ config DRM_PANIC_SCREEN_QR_VERSION
>  	  Smaller QR code are easier to read, but will contain less debugging
>  	  data. Default is 40.
>  
> +config DRM_PANIC_HELPER
> +	bool
> +	depends on DRM_TTM
> +
>  config DRM_RAS
>  	bool "DRM RAS support"
>  	depends on DRM

-- 
~Randy

