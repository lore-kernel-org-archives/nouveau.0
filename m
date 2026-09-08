Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D4DC88E53
	for <nouveau@archiver.kernel.org>; Fri, 11 Sep 2026 08:52:25 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4A70010F587;
	Fri, 11 Sep 2026 08:52:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XvCV66AB";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9BD4140412;
	Fri, 11 Sep 2026 08:35:00 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789115700;
 b=OE/KQKr4WlsS5Qc+K9Xb+LtCj65DoVX3mwbs+e7kE3IDAgjMOlrIv3J7UvIE+sKusupeo
 damlspVv7pEv000QQEvd7SwPoms95jjWFCyxal6ia9x7pcTYPcozOYFRPNz4PdRME3zmq76
 SHG0pBr7x5FFfBzxEURLA4gl1oRn+u7e+mJMFZOjTZze0pTwPJOVlH+fyvvEGRY2cKFBK7o
 n+eFVMl1MDM4smPKj4knn6+VvVyp31In8xLlqnaarbsBoqWdx0d0PwcWAAc++q2CdUNGbT/
 d9nGThwwmjLhTn6PXuhPC5NSbfZ5RWhpsi4SoVpmnGa6FphHy3iZJJrfiQ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789115700; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=qQbruPdcRkbgl8HfIhF5I/ft20+teeU0jvwgM4rj26A=;
 b=Q8XiqZeOQw80U7GEVKpip4oOSpHDvL0Dg0SlYeGUJWZA90X5XE+VHP3k7yTsLtnrydb7H
 QNDj4G76zqP5w/n03BFF7ZEpyBJZcusxZRSiXiSee+FJTDJo196O59ZC5W2RyYVv5UcT1V2
 qIPxHSoiXX1dCWgQt0M7lEqhQBmlpgHVU+8Rex5DhII2PuHbajDZ8DaLpKaMgCzxBa0OTXX
 5gkSflCWIAYh2N3dM/OGOWJLa7MHhOYK+Pwk0NpkBIPKGKCoDBBEXcVvNtqlyWQEtK/9ave
 mx7rUdZa3YytM67SG8trQDZ7iIvufYSB+/LhPSEtQo+FRviDdIQz7LL3BaUQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 6E285403E7
	for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2026 08:34:09 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D187810ECB9;
	Tue,  8 Sep 2026 15:27:57 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B8DC54081D;
	Tue,  8 Sep 2026 15:27:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 205C11F00A3D;
	Tue,  8 Sep 2026 15:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788881277;
	bh=qQbruPdcRkbgl8HfIhF5I/ft20+teeU0jvwgM4rj26A=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=XvCV66ABTo4OWC/44sKVa92p43c+0v2J/iue6EFeR7/Ok7g9uSLGMfm7n9kpFj+16
	 eaikSUvoM2QGhoGsPbre8P6lPx0m5u79AcCtOL8NixpXvvpGIOiF04OfQV3zomh5TZ
	 f3fXub9npQTUMyUJhRJ5Fswyh1Z5p5dLb8nCk+HQiCMiFmNxmADmW9gI0h4g6nfSGw
	 EXqAJM6Y8TwdYsZiWXGUcNq56dSWn3+VTCvOiUanLgZEith4u8+5FXT6jvORYU7bXF
	 O2/G0LRiyojLTsip/Af1WrCdo3eZlYiM4WM7rNVggZa/d3sP+EDG9zDB+raGj+HlMv
	 9IimSxGYTwg7g==
Message-ID: <73f10ae2aa96eeefbec0f1308d85899b@kernel.org>
Date: Tue, 08 Sep 2026 15:27:54 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Subject: Re: [PATCH v2 5/7] drm: Implement struct
 vga_switcheroo_client_ops.pre_switch
In-Reply-To: <20260709092215.168172-6-tzimmermann@suse.de>
References: <20260709092215.168172-6-tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Message-ID-Hash: XPD5NVTIHAPD3WKQY624XXFUNLPV25Y6
X-Message-ID-Hash: XPD5NVTIHAPD3WKQY624XXFUNLPV25Y6
X-MailFrom: mripard@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, dakr@kernel.org, deller@gmx.de,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jani.nikula@linux.intel.com, jfalempe@redhat.com,
 joonas.lahtinen@linux.intel.com, linux-fbdev@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, Maxime Ripard <mripard@kernel.org>,
 nouveau@lists.freedesktop.org, rodrigo.vivi@intel.com,
 sashiko-reviews@lists.linux.dev, simona@ffwll.ch, tursulin@ursulin.net
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XPD5NVTIHAPD3WKQY624XXFUNLPV25Y6/>
Archived-At: 
 <https://lore.freedesktop.org/73f10ae2aa96eeefbec0f1308d85899b@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, 9 Jul 2026 11:16:01 +0200, Thomas Zimmermann wrote:
> Call drm_client_dev_acquire_outputs() from vga_switcheroo's pre_switch
> callback. Pushes fbcon updates from vga_switcheroo into DRM's fbdev
> emulation. This affects amdgpu, i915, nouveau and radeon. No other
> drivers implement vga_switcheroo.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
