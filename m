Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 193E8C88E50
	for <nouveau@archiver.kernel.org>; Fri, 11 Sep 2026 08:52:34 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DF61610F579;
	Fri, 11 Sep 2026 08:52:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AV9cKUZR";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 441744197D;
	Fri, 11 Sep 2026 08:35:10 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789115710;
 b=S4b/AgFSf5OnNA46SOAx8oZ39TRj+QYPxMT/ZZTO4/5sxfh3pwA/dQUN4HESL6f7HSjr2
 5XM7f/I/aVlSOe12vZiTSKdfl/RtnYBPDmhCdMJE3gqywQ8vah0eIO63XaEbYpI3rxPpmXu
 U+Fj6oS9X4u7YFGFJEKzULP0BrUDBEr3ux1t9plXmuZ+hr4KTyFvHQrzM/0AyNWbjL2DWDG
 XyvNoJAwH5fGNbEtpfJ629KsXr42vG2TOzyXLJvaaGMr8sweBs00guSIWOCWM61eOL+E9M7
 lMomL9AeyMki12SEtv5hyeHRcg1M0ybb4xYTPjDw/SVnPxUxlwk/mfMm/R+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789115710; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=i5px7Z02W9P6PnBrjrtniLAiKpg60s8L1n7dEkh5OQ4=;
 b=mYy5+o/2BUC4zY/b7S0RvgHA10Qh2vPifift39zQ1qI1Rcf7xIn+akUaCSV5TgTOOdmAv
 3fFzxlxgZ9Z0yavMXs4UCJ1HTu/7E6U5W9n/eAD1aMirDzRfYK3XT3mY2+83AT1p4hKmnnq
 54N4dlDdCquOj3MC7X9I8hVZ/K4rxVP67kM/s7JiZELRdJJM3vGWsH/8rNbGCRMNqG9lVUJ
 SL0YbanQ4yhirIZ5H5BLuS7zl62FbEQ7TRa6ADXMZtxauO7YSpPfddTyDhYCDRGIXsP9nOa
 3f0DKziYnqFZLVGDoIux+NS2hL+zWarBxby1SkVHlEuRzm602uf/d2oK32PQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A4C6140433
	for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2026 08:34:09 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A82BA10ECCC;
	Tue,  8 Sep 2026 15:28:49 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EF872601FD;
	Tue,  8 Sep 2026 15:28:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27D9C1F00A3F;
	Tue,  8 Sep 2026 15:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788881328;
	bh=i5px7Z02W9P6PnBrjrtniLAiKpg60s8L1n7dEkh5OQ4=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=AV9cKUZR4BhWai6g0oRaFc+2nidqX3yLaigBsGDyNfIM9Tp9ryU2OpqVcrUTzyMJ0
	 a7rHY3+Dxqx77MNGGXEBHbWhivFf1kRuBhB9zr/0JzXUii3rBKbtWHVLrXD0ObgDKE
	 4Rb3TTUQ6T9sL8hZvgbUK7hQfZFnSfYzfcZ/FiHiCWjzRkUq52HEZ1sLetA+UpjmJs
	 ynne02lnBaKeUPBAbk/k/4X3FDPGQyZPTfqAwwbsLw46L4fAPFbthEt35ALko5jj9M
	 X8EzF/TchCrO3QWwCAYH97FlSzn+aZabOSmxvtw5S7rlS3RMAGxFks23AE3qmOuA7A
	 MMWb30OAsCDbA==
Message-ID: <88959eaf8836f080a10f67dda5e2adda@kernel.org>
Date: Tue, 08 Sep 2026 15:28:45 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Subject: Re: [PATCH v2 6/7] drm: Implement
 vga_switcheroo_client_ops.post_switch
In-Reply-To: <20260709092215.168172-7-tzimmermann@suse.de>
References: <20260709092215.168172-7-tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Message-ID-Hash: CZ3USH54XML4HY3SHKPY6BNJGO7PWUAK
X-Message-ID-Hash: CZ3USH54XML4HY3SHKPY6BNJGO7PWUAK
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/CZ3USH54XML4HY3SHKPY6BNJGO7PWUAK/>
Archived-At: 
 <https://lore.freedesktop.org/88959eaf8836f080a10f67dda5e2adda@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, 9 Jul 2026 11:16:02 +0200, Thomas Zimmermann wrote:
> An output's attached display might have changed while a DRM client's
> device did not have the output switched to it.
> 
> The nouveau_switcheroo_reprobe() callback sends a hotplug notice to
> DRM's internal clients, so that they can reconfigure their display
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
