Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 699D3C88E50
	for <nouveau@archiver.kernel.org>; Fri, 11 Sep 2026 08:51:33 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D4E3D10E0B7;
	Fri, 11 Sep 2026 08:51:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WJaO26YQ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id DB9AB402F0;
	Fri, 11 Sep 2026 08:34:07 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789115647;
 b=BjoPAXyYLLsAIC9GotS/m7fuKOhCwrJ8aK0hJPN4bxGt77Vbu1MsI/K4UEWaILcUGydvp
 PCCMo/WFYcPzlE6cCuUswazR4JpgCTRjPStmEWFy/ui1nOuLuW/vn5h38U3RxQG8v6HNDzL
 KGKR8d8mXkELDC6LphXPWYktrIA5lSFeIMDmpNknsQ2os7Kbr88k/eKyh/PWXaz3gtpQXIx
 b6jcdPgYfJDckTMqy9Id4QDlh1CyVAdudAayRxljHHAF/l7GvX6ldUiBWMlb1Hrbi4RkXqC
 O29nChJJgOccTWCP/4k5H55BlbEYmL7trlbcaSyD81GOJdORiBzynxiHxqfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789115647; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=45Fa9JFJgFfxvMXU87kkWtdb4QSxmQx0SdJUFfq54ZE=;
 b=gk1UFh3cQJDM2TKLVHGrN6qEyDv4ZyLwGTvb85mMZC/0MIuixYCtN6cawwo9FVul1BjHl
 vBmaGKWrD8ggi4f+At/Blfoq8vERNtjjOxWhl7dXwW9JUjB9fHDPEF2omfMCvAyMIwLq02m
 6Ff49jvrtIFPQhZ8l8v0kvkjDXLOz9EjGLFISl6pUmZWH5+ZZ/sjdG7jR3PDzB8rZkFzUdE
 uA0g2Shr407OuEX9Ucrnf0DlMbuHx19SmDSpM3zGNZ1y9OsbirnvH4jcOA+M4RUp9Rw6gCw
 bUi1uXd0zLxyoZlY4pNj2CpXVcNDq5ZNoVciADufIc0Cj4UJj+xgox9EG3hQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 8A28D40102
	for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2026 08:34:04 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8D59510E61E;
	Tue,  8 Sep 2026 15:27:03 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5EB6F400EF;
	Tue,  8 Sep 2026 15:27:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AADED1F00A3A;
	Tue,  8 Sep 2026 15:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788881223;
	bh=45Fa9JFJgFfxvMXU87kkWtdb4QSxmQx0SdJUFfq54ZE=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=WJaO26YQEBESzQ+3+b4rBC4UvX2za9FEQXE6OjU06tsjMOKruOfHgjVU3OfNEKChr
	 Vyoi1VuCgZ3tlP62Ne6W+P7cu3seWG0c/EHV1AFLITSLy5tFI2iqIb8hmbhxb7Kvl9
	 WFNMiCfnk4ILz94eoTQWnkmM16Mjg+5EWijqRsK0cQP9UPnZo1DdiwmDs1Hk9/tPJO
	 PlS6aH1ZBPSAyr7BcO6VhkrJqpyV5xIxqPrnFO4tytf7Y4EwEIV3jv9xQ4+Ml+kqMT
	 AFMq2j7A4SCxp6nKvzlPeQ8PtwtNc7gmAlwN93R3Ams3lJkVXm13RWHUJhwxGt6PuR
	 vqjKcbOPxYy5g==
Message-ID: <467a6478db3c7140ca9f4d0e5c11d029@kernel.org>
Date: Tue, 08 Sep 2026 15:26:59 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Subject: Re: [PATCH v2 3/7] vga_switcheroo: Add pre_switch callback to
 client ops
In-Reply-To: <20260709092215.168172-4-tzimmermann@suse.de>
References: <20260709092215.168172-4-tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Message-ID-Hash: M3YNFVJ6767JTNBVWJM3INGWF5UI3XG6
X-Message-ID-Hash: M3YNFVJ6767JTNBVWJM3INGWF5UI3XG6
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/M3YNFVJ6767JTNBVWJM3INGWF5UI3XG6/>
Archived-At: 
 <https://lore.freedesktop.org/467a6478db3c7140ca9f4d0e5c11d029@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, 9 Jul 2026 11:15:59 +0200, Thomas Zimmermann wrote:
> Add pre_switch to struct vga_switcheroo_client_ops to inform the
> switcheroo client about upcoming switches of the outputs.
> 
> This callback is intended to replace the hard-coded call to fbdev's
> fb_switch_outputs(). With DRM supporting more clients than just fbdev
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
