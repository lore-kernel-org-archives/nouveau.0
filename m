Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F2A3CD3445
	for <nouveau@archiver.kernel.org>; Thu,  7 May 2026 08:09:52 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2682110EFDF;
	Thu,  7 May 2026 08:09:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="hv/yPiVn";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6014C45E06;
	Thu,  7 May 2026 07:57:09 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1778140629;
 b=sIXZVVguPOwqXTJ3RyJQtT7tyeYaA0QHLl23oDa7tgABbSUx/DzBZ7bu3z0JeppVPoAHC
 fOICs9dTOpd49ciAfPOCVddk5BwpH7uGlXGmD3xLPMx1KqcE/zT5icCyfNNMwuy1SFXcKQo
 GlYJK9U9tJ6G+eYuh7dvDsfyAO8S/w7gH3BKno1vFIFFz/4mpLPW3zM/Hqmm5aXmmWrljeY
 WOpqM9q6dCtB02DGVPrOxJP2NNy82ofBSqxlo50cmYCROgctImiiCiTcBr1CfesZWWqS4mP
 VSyiqC0dEFLwXNv7YRHpHBsTuyKF9fm1CtCdE7+xGVx4SBe49yd0Zu3kkasQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1778140629; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=jE1HbCaoyzHVWim3Bx3dBln6qMQUyoLxDCS0Dd09bJE=;
 b=adhLvkuB1mnKfspeWc6c4xb+HLF3pwmusueUHunm7HtMaVGbMpSMo0ihCuiDZF6njvlsS
 yzDtluNzYBkgZy68YnCYpnGTVFsiOhYR4TI9im+uLWFnmBItJZGA1qwg66M9SXO3ybBB/ff
 MjpKCnIhl/WY2dcftEv8ul2dF6EeILfMgcUwfNxEypC0hom4n9PXkukOBnLyR9FJgkAfrPR
 EqpORpdoW+uCUjy8IAPmGl2Bx13b4ad202RCqFJ3nqGDs12VXXKzfBNEQL4k80qxR+fWL7s
 P20b08sN18ZE4fMjwzFv7shq/cCcXm25Pi62/l1cfEQvziq/h9xjI1T36GAw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=collabora.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=collabora.com
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=collabora.com; arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=collabora.com
 policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C464945DBC
	for <nouveau@lists.freedesktop.org>; Thu,  7 May 2026 07:57:06 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 26EF610EFD6;
	Thu,  7 May 2026 08:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778141386;
	bh=QPfTt+pyBlnDFF1TwXqztL0WqBfkEElueSQtmdgH5To=;
	h=From:To:Cc:Subject:Date:From;
	b=hv/yPiVncdmnZ13tD75UzM5X5p5h068RXRGnc7vRhfPMdWvhSPk1aBAp2eyF/HRiP
	 yNb6N73Q6LQOyaCwABxEosR4WN1+6MxrLWRr6b/SmjXjUCwvZGfMh0ul8TYzEWPUv0
	 2NEwLuGoiBENgl+0Bf/Kp7+KNAr4TYEXT88lM6eRXhGoCx1sVmqd81K+xgXBcGb6JA
	 14R9EU22sE8U0Dc3mSCBQxmMWJnj5AM/shI+7eZTeb4BXkAwTONZt7qZ5sdr//TleM
	 2cS9ocWUftzEQsf7/kmWc3LtouOymQmsJK5skFLD1Jl6dvYY+R3Q6ZEv12kN/dKlhU
	 hEutmloxNvc7w==
Received: from laura.lan (unknown [100.64.0.215])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D7CF917E04AE;
	Thu,  7 May 2026 10:09:45 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: dakr@kernel.org,
	aliceryhl@google.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	boris.brezillon@collabora.com
Subject: [PATCH v3 0/1] DRM 'feature' support for DRM drivers
Date: Thu,  7 May 2026 10:09:13 +0200
Message-Id: <20260507080914.95478-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AEQC3ECT4RI7DFL62OZMXCSS3HS4DXDG
X-Message-ID-Hash: AEQC3ECT4RI7DFL62OZMXCSS3HS4DXDG
X-MailFrom: laura.nao@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 kernel@collabora.com, Laura Nao <laura.nao@collabora.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/AEQC3ECT4RI7DFL62OZMXCSS3HS4DXDG/>
Archived-At: 
 <https://lore.freedesktop.org/20260507080914.95478-1-laura.nao@collabora.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This is a follow up to [1], which introduces feature support for DRM
drivers, as will soon be needed by Tyr and rvkms.

Based on feedback and discussion on the first iteration, render node
support has been reworked.

Support for render nodes was initially modeled as an unsafe trait, to
require drivers to comply with any safety requirements tied to enabling
a given feature. For DRIVER_RENDER specifically, the intent was to force
implementors to ensure that any ioctl declared with DRM_RENDER_ALLOW
does not call KMS/modesetting APIs or require DRM_MASTER.

However, the C DRM core already enforces render node access control at
the ioctl dispatch level: if a client opens a render node, any ioctl
without the DRM_RENDER_ALLOW flag will fail. So the C DRM framework
already ensures the rules are respected for core ioctls, and the
unsafe trait doesn't add any meaningful protection beyond this.

For these reasons and since enabling DRIVER_RENDER doesn't require any
particular method to be implemented, there's no real need to model this
as a trait, and a boolean flag is sufficient.

This does not prevent other driver features to be modeled differently
based on their requirements. Features that require additional ops (e.g.
FEAT_MODESET) could instead be modeled as a trait, and some other
constant type that can only be constructed when the relevant trait is
implemented.

Introducing the FEAT_RENDER bool flag here leaves room for
implementing other features differently at a later stage.

Changes since v2[2]:
- Renamed RENDER_CAPABILITY const to FEAT_RENDER
- Expanded documentation for FEAT_RENDER

[1] v1: https://lore.kernel.org/rust-for-linux/20260119-drm-render-v1-0-8326e4d5cb44@collabora.com/
[2] v2: https://lore.kernel.org/rust-for-linux/20260505092304.108262-1-laura.nao@collabora.com/

Laura Nao (1):
  rust: drm: add FEAT_RENDER flag for render node support

 drivers/gpu/drm/tyr/driver.rs |  1 +
 rust/kernel/drm/device.rs     | 12 +++++++++++-
 rust/kernel/drm/driver.rs     | 12 ++++++++++++
 3 files changed, 24 insertions(+), 1 deletion(-)

-- 
2.39.5

