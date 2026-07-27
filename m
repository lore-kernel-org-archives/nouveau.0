Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26720C531D0
	for <nouveau@archiver.kernel.org>; Mon, 27 Jul 2026 13:52:11 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7F84610E3F9;
	Mon, 27 Jul 2026 13:52:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="xEcD7EIL";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 875B1473FE;
	Mon, 27 Jul 2026 13:36:26 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785159386;
 b=tC+iT2r0SAjyuzct4AgvAQ8dMujMhrR15J8MgCLS/8jv9vvHTL3CIV87QrUwWHw+NGUut
 3PKzzH1XwmMxY7PcdbooHbcPIvXxBn9AgfyUf+oF0vkp7E+5FlL/3Vgr234PX/VXVys8Ceo
 4e/0cM+Qxe5+IF5CYLkQvUIv/Y1SGuGALADJG2LW+TGvvSg+64KSMMGIs9B/6/Dw+moSddW
 7sN6fZhtSObHkoWiRsOw7TMLzw3NAjuj6bMCgckurA/eJBLRCCMceHA3WrQAVN3M2ohZyWj
 gASzJ//pOU0T4ZzvVVp/Yw6lNGNZhzIuJx/0UEr/ZmS6/4sgG3KMyKRK9BrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785159386; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=7JBXk2jXtQsOJF65QCitE7vlw/YO5M+3O4WO4XdbtAs=;
 b=tYlV5bDICIkwAD5EgcIqDW1ZIo/B+M9kwLenjrBaJH1Iv7g5L5vEI1SLC51zQeJDckOuk
 pJ5c3OWtZiOa8xskNDDjY9P5IWc+8IHoxbrCub6PLGjhdBK8C/IXdHT2gfMD7H8sIWtrJ5l
 XJP+ulmNO8ObASe9PfGp/ES6Ma4jpVw1O3dfcS68eRQaFpF929vcYwxosz5pa+cJynB5ltL
 Dw/ttiXS344D0PSZx+9ppMKJbZO/8YhN3qUldP0nhmqBAhU477nPOyTHUdBaVUIfPX8hEIU
 DPCAqJF30C0HgV4jVQVlGyEkj6wBQzYugBfLoqK0I2pD03UBwCfRqU66jE3w==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=bootlin.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=bootlin.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=bootlin.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=bootlin.com
 policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id CE6F746BC9
	for <nouveau@lists.freedesktop.org>; Mon, 27 Jul 2026 13:36:23 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7632E10E407
	for <nouveau@lists.freedesktop.org>; Mon, 27 Jul 2026 13:52:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CA35C4E40F75;
	Mon, 27 Jul 2026 13:52:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 992BF601BE;
	Mon, 27 Jul 2026 13:52:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 33ED511C13452;
	Mon, 27 Jul 2026 15:51:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785160317; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7JBXk2jXtQsOJF65QCitE7vlw/YO5M+3O4WO4XdbtAs=;
	b=xEcD7EILK4mpt5O6ZSHTjHiqPPMIIRZxC/FgQm65soRs6gzWBfNlO8wHkmhWBY+YKn/B9l
	AE+3w1ds0octEPRy7A8Ic3YMx7VL49qutGwvZNxcPMII1eImu9Q0em+hKnojUqwyf2zWCF
	ptQsw5eGRruB8MBHRz2r9bMyiPSBylwRZ6sk8x+g+sl9cHAykb+dcO+TbWqdlWNF97BlLK
	tTTSSk3Cj6Zb4NVIEmSe9uxFnT2lsUfwulDoraD1znG1sRvamPvXnG3GDT1edHwPAjmAcL
	e5z6kyufS28sIhhLT3wIN8D6Wc7QXuzUuv0Z9tcFPuZILISCbT6HJEwxb1Z43Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jagan Teki <jagan@amarulasolutions.com>, Liu Ying <victor.liu@nxp.com>,
 Francesco Dolcini <francesco@dolcini.it>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Ian Ray <ian.ray@gehealthcare.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>,
 Russell King <linux@armlinux.org.uk>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Xin Ji <xji@analogixsemi.com>,
 Marco Crivellari <marco.crivellari@suse.com>, Arnd Bergmann <arnd@arndb.de>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Kees Cook <kees@kernel.org>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>
In-Reply-To: <cover.1784545092.git.u.kleine-koenig@baylibre.com>
References: <cover.1784545092.git.u.kleine-koenig@baylibre.com>
Subject: Re: (subset) [PATCH v2 0/3] drm: Use named initializers for arrays
 of i2c_device_data
Message-Id: <178516030634.1134541.480483848560598607.b4-ty@b4>
Date: Mon, 27 Jul 2026 15:51:46 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
Message-ID-Hash: 4GAVW4634N5I4P4PODGL6CNPCWLWL7PQ
X-Message-ID-Hash: 4GAVW4634N5I4P4PODGL6CNPCWLWL7PQ
X-MailFrom: luca.ceresoli@bootlin.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4GAVW4634N5I4P4PODGL6CNPCWLWL7PQ/>
Archived-At: 
 <https://lore.freedesktop.org/178516030634.1134541.480483848560598607.b4-ty@b4/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>


On Mon, 20 Jul 2026 13:25:46 +0200, Uwe Kleine-König (The Capable Hub) wrote:
> the objective of this patch set is to prepare drm for a change to
> i2c_device_id. See
> https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/
> for the details.
> 
> (Implicit) v1 is available at
> https://lore.kernel.org/dri-devel/20260518100401.631351-2-u.kleine-koenig@baylibre.com
> 
> [...]

Applied, thanks!

[1/3] drm/bridge: Use named initializers for arrays of i2c_device_data
      commit: a2a334802883908ee86e0571faf5e9ea6a008c3a

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


