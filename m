Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 642CFC88E50
	for <nouveau@archiver.kernel.org>; Fri, 11 Sep 2026 08:51:40 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0233610E203;
	Fri, 11 Sep 2026 08:51:39 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E2E6F4048C;
	Fri, 11 Sep 2026 08:34:14 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789115654;
 b=uQJzH0Cxo6hgemFi63S8ajRFOAAC/xDsI+/cS1/rsOfDkfN0aIJQr5BuHI0Galj+YXApd
 6+Y7ucEvIlNmxOdXJZdGq5rDLhX9RuavzFTaxaJnGFCSjaXnZA+U3aHaIlt6UYpCEAFg9Ww
 XD9t0R6nzlRbBFyrKXoYLFGFLTtOUIgxwBpluZEFTImlz0h92tPGgyfuI78Rggd1FdM8zA5
 +/DZKkednxp0HhI8VjNf/jy3HF2GgPmaNWyFsxqOnyfsw7kRAgk7r/3U1eblPVsjKGAorfk
 +vRAuK8Qq1F1CJHOPapa1WN8PoM+RqJ6qx5rcOTw8xhj/4OsTbLlUFo5pAsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789115654; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=PvbqlM2Qg2vdQ1We5e89ltHlqjf8uqTFifmHlAcij/U=;
 b=ozgJddNydYKeM0dhpwFdC21OrME5J2xVPSll7ZD7/F5RCl41LLz9mksL6dtCr5N65SYkv
 tM56Q6V5dUu0eQEXt0JApjrF8CG9EPUeD850/qG4YGKi5TAF1nl3iMV6uxb9wvHcBAHkwDo
 isurAMpFX9JGWPGJjOTR5X1kYq5iNuL0+aOumGO7vJxL37LFYeLbCwtlXpusYv5ARdeF2A6
 WC4GVXGWiO3TRQHaqnh8E4Xpna8Wfrqc8MJDSYFv9OKbxd6h5cZr/QXyY3nTgLHDdO8/Ho4
 WExrXJc5ADJ/1PLC+xGUVKf5el92ganJfE2tuCOxNANNRLK2eE/S/XDt9luQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 96EE440102
	for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2026 08:34:05 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E705E10E129;
	Tue,  8 Sep 2026 15:23:58 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5A4BA601DB;
	Tue,  8 Sep 2026 15:23:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 885BE1F00A3A;
	Tue,  8 Sep 2026 15:23:57 +0000 (UTC)
Message-ID: <2a3a7a962caadab3399d3e03f5538d90@kernel.org>
Date: Tue, 08 Sep 2026 15:23:54 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Subject: Re: [PATCH v2 1/7] drm/edid: Include <linux/fb.h>
In-Reply-To: <20260709092215.168172-2-tzimmermann@suse.de>
References: <20260709092215.168172-2-tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Message-ID-Hash: CM7XRCQPCU3KXQ2AIA7MRSYOSPRXTSWU
X-Message-ID-Hash: CM7XRCQPCU3KXQ2AIA7MRSYOSPRXTSWU
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/CM7XRCQPCU3KXQ2AIA7MRSYOSPRXTSWU/>
Archived-At: 
 <https://lore.freedesktop.org/2a3a7a962caadab3399d3e03f5538d90@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, 9 Jul 2026 11:15:57 +0200, Thomas Zimmermann wrote:
> We currently get <linux/fb.h> via <linux/vga_switcheroo.h>. Include it
> explicitly.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
