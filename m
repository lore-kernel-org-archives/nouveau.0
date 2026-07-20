Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A33C4452A
	for <nouveau@archiver.kernel.org>; Mon, 20 Jul 2026 13:04:59 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4662110E920;
	Mon, 20 Jul 2026 13:04:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JolGGOex";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id DBB8047257;
	Mon, 20 Jul 2026 12:49:31 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784551771;
 b=rbe9wxA26qXzJ3mIuO6aYdSwKu8xGjJ3JVb0q4mDyW3AHOE/wVOADzhgj1nwJZMpFAR8d
 +LKb0fJ7NqSexi/gNTszAT5FTmtppB7Avpq5LOI4Rqy9kdA1fiY/IKDLO4MSfCb6+U31WKN
 DBLjci6XgUc/28F28iKFRyJjqklTHrXwQ7b0BIlcAfWuJ3QU7w0XoT+OTpNWOLQyjwM0A3i
 vaoBDp3ox+EgygPLoTD3I10t25ey9ehpfrZOt2mY9VbnbF5tGADYqAK9/06bv2nYLj2G7dZ
 7xyn3SPPz8vHT49gWVaQyZWb+IoS2eamj2954yqLIi73Q33WObCqwECmZlxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784551771; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ISsGvIfiVmCTmpBk17+CxNOpuAPZuqtsfciv62CwcyI=;
 b=AXvYSFFAXf/K3/TUvN65fdjhqDY733H6FoQMuohYKuI1sbWsMWouuOGVbXQ6CKUZiKPgc
 hWbntLercE0xAc7jNEzF1NqJaMJ66Ui0JZWBEB0WuHQ1QMjnR0SYyH3XK1Qs1zM0AL7CyFP
 jKwt2gOja+IECZX6OGv7yrITLXpdhLuFykHaT7dHhjh6f1+OfknokI9Dxp2D82WXZv362gK
 EYx7spn/0D/MZjmifvxDEDzrIHN9ULPRS83/d4CA8bikTEt+CoRY/qBT0ijSuCgAX1p/luT
 zU+zg3RcIfczmzNML2u9iLgWdPgLgRJdcx+xuS0xT5YwZRusytgDBrvmdLYg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 5B78640408
	for <nouveau@lists.freedesktop.org>; Mon, 20 Jul 2026 12:49:29 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 724E610E919;
	Mon, 20 Jul 2026 13:04:55 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 81D3060A80;
	Mon, 20 Jul 2026 13:04:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD98C1F00A3A;
	Mon, 20 Jul 2026 13:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784552694;
	bh=ISsGvIfiVmCTmpBk17+CxNOpuAPZuqtsfciv62CwcyI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=JolGGOexPicnfnErFSAn/d0jmybfzVKbMPFtTGBWBI9gY0GlJLD5IKQEZrCm5ezuv
	 tZZ3x74Pur4I5yLFBe+CBpQ/nkZ+E866N6QM3GazmNC99hjZ8+IrdLXegfctA6oWdd
	 daaV1yYFdiTwoEi7B8RG5sZVOwwuHZe57aBK35fm2XPOt6tjCYs9MgA1OKEREi8rMl
	 xVGlwZQz8KbKepXqoGl48aD2SEwrkFPUMAXmGMS9kYljVXvgGVrBSHKNXGaGCCHicj
	 QGBti7p5s2Jb6JiEFhqJEgKSXvUUAamXEXRMSaWescmtPxSoDWc+hPsYaNyzOfXS3m
	 lQdm3WuluL6eA==
Message-ID: <b7f4445b-8108-4d2d-817c-3c8cfbc904c3@kernel.org>
Date: Mon, 20 Jul 2026 15:04:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/nouveau: Use named initializers for
 i2c_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>
References: <cover.1784545092.git.u.kleine-koenig@baylibre.com>
 <7d6033270daf9ff409b427897cb8218f9a69048a.1784545092.git.u.kleine-koenig@baylibre.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: 
 <7d6033270daf9ff409b427897cb8218f9a69048a.1784545092.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: F6MLFQ5H6XECOKMF5GZT5X3PTTZSVMMC
X-Message-ID-Hash: F6MLFQ5H6XECOKMF5GZT5X3PTTZSVMMC
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Kees Cook <kees@kernel.org>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/F6MLFQ5H6XECOKMF5GZT5X3PTTZSVMMC/>
Archived-At: 
 <https://lore.freedesktop.org/b7f4445b-8108-4d2d-817c-3c8cfbc904c3@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 7/20/26 1:25 PM, Uwe Kleine-König (The Capable Hub) wrote:
> Named initializers are better readable and more robust to changes of the
> struct definition. This robustness is relevant for a planned change to
> struct platform_device_id replacing .driver_data by an anonymous union.
> (Though these drivers don't use .driver_data, so this patch isn't
> strictly needed, but still good for consistency.)
> 
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
Acked-by: Danilo Krummrich <dakr@kernel.org>
