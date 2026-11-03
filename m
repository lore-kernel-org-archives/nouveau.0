Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCE3606A329
	for <nouveau@archiver.kernel.org>; Wed,  4 Nov 2026 14:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=thelittleman.net header.i=@thelittleman.net header.a=rsa-sha256 header.s=20140415-thelittleman header.b=OcRk48xl
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 585D510F57A;
	Wed,  4 Nov 2026 14:34:21 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id ED8DA48D20;
	Wed,  4 Nov 2026 14:14:57 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793801697;
 b=YoweAzOorAIqTbYCzbk2IHQgx/n7NKDrM6y19j2SSTKXjtJlBQ4e68Mvw4hX/Jup+9OVc
 Qa9NjOwr8yaiaV258bjCBMtiUClr48ZtkMFDE+1vpUJuSneScW6Rlt+xzFqJQr02aD/+v35
 VOfhbQS9+hOToBHolZ1AoraFnLa9Om9to/IbrTkPoRwRCL9QT4Hk70MDAfrwd0W5onFuP1o
 4UbEco7ek/3N1ycI9wzy8HV4SwUxjxwEkXsccgHb08dhG6GUZaOH/p3+k1B4bYYhkCr7LX1
 w+yWeaq0elBmu92N5HrVEN4NuUocijw9WzRk0QV2mbztILzNP3JMmV1iuRMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793801697; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=z1YZpLjfbu6fNLdkBVvsc4d/vtdUbC5126/UpuwWjT4=;
 b=Qbs/RJwQw+C2VOSxCw0whi3XdE0VCLm/FdzAfHFjUqxzClQEKUUQ2DfAM0BMzF690XS7/
 bOcv7gQDdxyVgSc89jHrf8zzvG5xju/fH7L49SLz0oFrOiiooYVkEse8m8UzBRvjE4ErR+b
 cdn6hgH+UUq4/qMv8R/3m6CGi2AQjDZIC8JVFts2NlI7iuL+uRkPuL98W+eOXiY1bv4Mgi5
 0Nic6GQaYXBDXr2GUQ1Yy4Fu0SNlU/Y80mkw46PhIvauIgQ1EBboxOXClo0prS/qn19RV5q
 POJ7QPXRN17Ga1BIm42RXD6tNv7LoS1B31ztcgstFdkyXjHJ3SXLwcoOIAmg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=thelittleman.net;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=thelittleman.net
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=thelittleman.net; arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=thelittleman.net
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id CF91148A90
	for <nouveau@lists.freedesktop.org>; Tue,  3 Nov 2026 20:36:47 +0000 (UTC)
X-Greylist: delayed 512 seconds by postgrey-1.36 at gabe;
 Tue, 03 Nov 2026 20:56:04 UTC
Received: from mail.thelittleman.net (mail.thelittleman.net [91.99.148.243])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 47F5610E172;
	Tue,  3 Nov 2026 20:56:04 +0000 (UTC)
Received: from mail.thelittleman.net (localhost [127.0.0.1])
	by mail.thelittleman.net (Postfix) with ESMTPSA id 8ABDD5F92D;
	Tue, 03 Nov 2026 20:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thelittleman.net;
	s=20140415-thelittleman; t=1793738849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z1YZpLjfbu6fNLdkBVvsc4d/vtdUbC5126/UpuwWjT4=;
	b=OcRk48xluXvjulj0mjLRYuQOra8JaZF3vUToOHWr1Q9S/Zvjj/ZXd8kEkzDZx0QVp8iLbv
	o84BgZMFykPizLZQsBd2NY83Ht94mG67fCQQy2A/H+8yRj2whLkruF/hpbuI2Y4n2YxRDG
	27WRS/3wn/l9qQb1sIoUd0YBFODrAxM=
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Tue, 03 Nov 2026 14:47:29 -0600
From: "David R. Hedges" <linuxdev844@thelittleman.net>
To: sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH 4/5] drm/nouveau/kms/nv50-: don't drive outputs at 0 bpc
In-Reply-To: <sashiko-outbox-195931@kernel.org>
References: <20261103-nouveau-dp-fixes-v1-0-892f4bd357cd@thelittleman.net>
 <20261103-nouveau-dp-fixes-v1-4-892f4bd357cd@thelittleman.net>
 <sashiko-outbox-195931@kernel.org>
Message-ID: <f3a2d8f720d1b619210067ad366fe7e9@thelittleman.net>
X-Sender: linuxdev844@thelittleman.net
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: linuxdev844@thelittleman.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: EHR4YIIGYMYAUB7U3E4RZGTXZT6SQZUP
X-Message-ID-Hash: EHR4YIIGYMYAUB7U3E4RZGTXZT6SQZUP
X-Mailman-Approved-At: Wed, 04 Nov 2026 14:14:55 +0000
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/EHR4YIIGYMYAUB7U3E4RZGTXZT6SQZUP/>
Archived-At: 
 <https://lore.freedesktop.org/f3a2d8f720d1b619210067ad366fe7e9@thelittleman.net/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-03 13:41 -0600, sashiko-bot@kernel.org wrote:
> Could unconditionally defaulting asyh->or.bpc to 8 here break 6 bpc eDP 
> and
> 18-bit (6 bpc) LVDS panels?

Yes. ->detect() replaces the EDID on every probe, which resets
display_info.bpc, and for a panel whose EDID doesn't give a color depth
it stays 0 until ->get_modes() runs, so this isn't limited to a lost
EDID. For those panels, nouveau_connector_detect_depth() picks 6 bpc on
eDP and starts from 6 bpc on LVDS. Forcing 8 would drive eDP panels at
24 bpp and make nv50_sor_atomic_enable() override the VBIOS straps on
18-bit LVDS panels.

v2 will fall back to 6 bpc for eDP and LVDS and 8 bpc for everything
else, the same defaults nouveau_connector_detect_depth() uses before it
looks at the straps. On LVDS, that leaves the 18/24-bit choice to the
straps as 0 did, and eDP gets the depth ->get_modes() would give it
instead of 0, which trips the same watermark WARN as on DP. Calling
nouveau_connector_detect_depth() from ->detect() doesn't work for LVDS,
which needs the native mode that ->get_modes() sets up.
