Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A43C5C43458
	for <nouveau@archiver.kernel.org>; Sun, 12 Jul 2026 16:14:42 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 878C910E283;
	Sun, 12 Jul 2026 16:14:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="W8mwYIfb";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4643A4606F;
	Sun, 12 Jul 2026 15:59:32 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783871972;
 b=NhGII9XuDAz0XxapYOTJmXu4dUwne0Uj7/rPApconutd5Em9jxSNjUCdMZ3Dqh9D1T9to
 HU1Ll6lJzKGih0IoxHxNwePQlRWJ6sA5XH24ATgwgIZORa8+aDjN5lkzMQ0i/t7YN/5x2gU
 U7IT+Ji5zOgY/UDgVgNVO/Obdm+grCjDCmtJ/xQ0Gy36U/C75mDCVWnYrEWoRDlD+J0H6Xo
 tLa8KqY8JJYQ+PDf+6DZ3G5/dJbasCKawckyaVJkdbYv0dBLI/CWSVMu7HgBR/OLIUiU5Fc
 Ld4UeCQJn5EdA8jEgjAbXzYqmE2TApYeUfUg95Zm3ZISnh3HzLWQ/4EWNiTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783871972; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=LVt/07JkeRUrRXhGR7j99ZsCFUAQhYPRKJkbnlsLIrs=;
 b=BUSlj6lWQhB+YEuz0hwngBPFId6QUO+rBTmJk2QoHKqp6uPBz4qxSRecdkWkgMN/RYDLE
 Df6IMAT+V2KAl11wN6sdYiYWEqjagRC35NZScRKVwftQ39i9jH4R2SuOwjsjYwdYf3DSNCv
 hC3Sr1wXaO5Xjg4S/m3/KQmVqOtUvTa95K4rfpIOleK2MkIj6RsDR2PVwFp8g2h7FJI9az0
 7xjsmwYrmYp8g/m8NdtuD0N/FLWxaI+etg5StBKegU+jzvuD8swEtLeLmowbGqGkDyYR0Au
 PTr8lUO9w+j3LydbXS1wrH05JD1xrIFZPipsXLgd9GX4dHZK4oOEaQnWhaMQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B37DD40019
	for <nouveau@lists.freedesktop.org>; Sun, 12 Jul 2026 15:59:29 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD9C10E093;
	Sun, 12 Jul 2026 16:14:38 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2D67A600AE;
	Sun, 12 Jul 2026 16:14:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5E911F000E9;
	Sun, 12 Jul 2026 16:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783872876;
	bh=LVt/07JkeRUrRXhGR7j99ZsCFUAQhYPRKJkbnlsLIrs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=W8mwYIfbjtGapNHEG8qUgFHP5kTfriyYRZS4922cMWclWw639zwyMtbHigRl/JRO5
	 0yJB0WgYukQXCoMI5E2P4e0NNIorrkKG7WYM+VQtVDmVPI2Rp/1/dF+1C1rLdfIaqq
	 JNkXeZxHoHhB+dvWpOQ4LGUpUAxy4SlPCc8wVLpaOPtEBns6Y1mzvMGFU2Qq5FOzN7
	 GVgL5yOy+sJlVb+aVln3j7pwmLrhJrMy6Y3KH5estk9MaU3kAMaz47R9HQZvtdFDxi
	 ZeQE6x2kEtdmZ4u/kZ+bEsXe3jtBNsY/6s1Qb3FIRSOYn5sWJq2oBeBdoDfOiFXiy7
	 2HLzTvM7vBWPw==
From: Danilo Krummrich <dakr@kernel.org>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH] nouveau/instmem: use iomapping interface for instmem
 handling (v3)
Date: Sun, 12 Jul 2026 18:14:26 +0200
Message-ID: <20260712161426.6461-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260706030520.857104-1-airlied@gmail.com>
References: <20260706030520.857104-1-airlied@gmail.com>
X-Patch-Reply: applied
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UNJX3X2E3QCYAO345RALGFM7YVITGWDB
X-Message-ID-Hash: UNJX3X2E3QCYAO345RALGFM7YVITGWDB
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 dakr@kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/UNJX3X2E3QCYAO345RALGFM7YVITGWDB/>
Archived-At: 
 <https://lore.freedesktop.org/20260712161426.6461-1-dakr@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon,  6 Jul 2026 13:05:20 +1000, Dave Airlie wrote:
> [PATCH] nouveau/instmem: use iomapping interface for instmem handling (v3)

Applied, thanks!

  Branch: drm-misc-next
  Tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git

[1/1] nouveau/instmem: use iomapping interface for instmem handling
      commit: 34e27b90552a

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for the upcoming merge window for the next major kernel
release.
