Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7FB9C88E53
	for <nouveau@archiver.kernel.org>; Fri, 11 Sep 2026 08:52:32 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 88E0810ECC3;
	Fri, 11 Sep 2026 08:52:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="K3q4EpWo";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E94ED4095E;
	Fri, 11 Sep 2026 08:35:08 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789115708;
 b=AWCpmOlqnJggda+rYpU8h6ZWHkniSV4QvjVV2OeKSQvyWdzZAFR8/cO4ZbHM7m846KnBC
 iRirk/w/xWGOPRPqyvQDW8aMs/5nQbD6Mc9W17fL4+UvyzPswhxTMipwgjYQBsRKsPL1occ
 L1x10DjEoMVpsH6m08RXqB/7WGSIFHx0Ahqlmynz+2HpZo0t0gvafKraJ0s4osiyIVaqowA
 D6DyGosh7QEaNlNanYp1EanoYrd+AY3FeBjyY4J4tVExhH1iFPY7LP2/vaK7NXtxf0dPBhb
 1lAArS8NHp/QTCbU/dQbbyZrzqWyh175pofqTa04bQabQY94dDTJ6aavDmhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789115708; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=PXr5c7hHW/s0gvhT0j+z4lGvWAuoX1i8hPPjZMT8+uA=;
 b=lwxgfg2XdAIS9I/aBLp1olPxpOPrnJe3irBoEPtOIOElI78nxo5bd8heBuP/PVVkZ1zSS
 zi9xZLvfx6AYOQT5NFNTcFvhL7ho9dQetFBoTCbZpcVsafMhBl8S5bzsFHB/Ojl/qArnRbP
 f7iRCSTOSwagHVndTWDrkzDBE5LgwcTQqmMIIA3GmoZgIAHalkT+ZcIXzEL+4wh3khhC0HN
 IOlFuworjIMW9uc2da/zCw0fcdD4AaTg6yS1RkhFCRt8wopuIo/8H15eKPn/isIKXGYXwip
 r9NSusezqbpHrih8CcpKZBNweaJVBBWN7AjfRRd5dcLhPesZgFpzVE/56gWQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C9FC74044A
	for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2026 08:34:09 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C7AC810ECB2;
	Tue,  8 Sep 2026 15:24:34 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 492CF601F6;
	Tue,  8 Sep 2026 15:24:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 754501F00A3D;
	Tue,  8 Sep 2026 15:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788881074;
	bh=PXr5c7hHW/s0gvhT0j+z4lGvWAuoX1i8hPPjZMT8+uA=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=K3q4EpWoRgrPNlSeSgNpfZ/yI6QNSgEXebIUQysMzS9lcIH6GnA9d+0Oz1u7sN0OB
	 WERrfZHOKMY2L+Ydrt0DDGUdTDbpbJ5DiNxPrasZMSlnjVSLIh2Yy+/1QRUG1Q/DWa
	 zdMa4xcP1MnmgzlZUBgnq8CwOyKsrQEEwEWNL0DhWzXvBMtPwu4h35DxY3oEVdUpKB
	 VHwxn8hFD9QDqLSKZ/YlhZadelUmd2a6xg8ucp5Cck1Iyw28BmZbYm+9XGHt2/nmjE
	 /d3DHkZ5GPFnHNdffFdImrqOmYWR9gUws86GEFky/8PpMqRkVdjVKlFt75OeHNj9sN
	 g0prrKv5Lbk1w==
Message-ID: <027090776a56ad67876ade0f31039108@kernel.org>
Date: Tue, 08 Sep 2026 15:24:25 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Subject: Re: [PATCH v2 2/7] drm/client: Add acquire_outputs callback;
 implement for fbdev emulation
In-Reply-To: <20260709092215.168172-3-tzimmermann@suse.de>
References: <20260709092215.168172-3-tzimmermann@suse.de>
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: URZOUAYOZ6VMDKW557S3SOU5GMN7S57B
X-Message-ID-Hash: URZOUAYOZ6VMDKW557S3SOU5GMN7S57B
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/URZOUAYOZ6VMDKW557S3SOU5GMN7S57B/>
Archived-At: 
 <https://lore.freedesktop.org/027090776a56ad67876ade0f31039108@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, 9 Jul 2026 11:15:58 +0200, Thomas Zimmermann wrote:
> Add the callback acquire_outputs to drm_client_funcs to inform an internal
> DRM client that vga-switcheroo is about to switch the physical outputs to
> the client's device. Allows the client to prepare its internal state for
> the upcoming switch.
>=20
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
