Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBF5CD3439
	for <nouveau@archiver.kernel.org>; Tue,  5 May 2026 09:23:48 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A0B2910EA17;
	Tue,  5 May 2026 09:23:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="FpaXi/Re";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2E7C245DBA;
	Tue,  5 May 2026 09:11:10 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777972270;
 b=l435UY+JvITYjGVlfOcFNcjcmI/JRjT89QiH6NxY9Y+JlTJVkx8Artg1zMHQp97jqUn1i
 eTLkzgrsaBraU+iMumD/XTwj1fXBzqLBX4OGkLk6jtqtvd0ZRDu5ac5T5M8zuEaYO1N8mm2
 RcrojD5WlPlojrNkgbXGkQ6rzt9Qs15azTjkF8Kriz1lW6IvYPYZhb/9QBfOkIhU8vKyGY9
 h+5joLifeesCXLUMfvyODXuwzXG5AIeIR2C7idfu7Wz3Gnkm1+awEaxiRjbNyRHrylbAI0K
 L8DQndpkw5aWiBfwC9GVuNCSmTEl2jTQOpqW8xGIVLu5/wjQMR5gibWLxfGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777972270; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ZtIf7whWk3h5wqf3PRPlnAK3kiuwP+gRbrUiinGqvEs=;
 b=iNDi7Ddr6IfLD1o9hiGg+ePNhe7MSXjmWYtPkFHwjMPSH8Cm6iExdMdYCljgD9oMgplKx
 apgni1MXcSkRJ6xfBeZoKjxQAJaF5vgJP01+bcokTLDE0varkcDC112btic0MBq978haDew
 vwDFBmhzE5EfHzgPVclPkeAnyp+Ea4izXy1ry5K6JP9M/U5Br7+Gs5a5CfeoPVqU6yBdFLK
 1sf/KlZmcL0cp/iHHbN/xuCDkAOtZtaiaHJ5m1LGyf1IPEogLiSF6VVbpwIUXri9EMHEJjM
 3WwJNm9qHZBbCvaFBd9wQaO6rzJ+zVUarrt9auaLx6TT0yleahLTU+TcRnww==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 13517403F0
	for <nouveau@lists.freedesktop.org>; Tue,  5 May 2026 09:11:07 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1F83910EA07;
	Tue,  5 May 2026 09:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777973022;
	bh=6ByzArm6c9srdkzSpiFI1EwobrNc4kEF+ciE/WkIMy8=;
	h=From:To:Cc:Subject:Date:From;
	b=FpaXi/Re+zbxWlAeTNktVEuXjWs0uMKcTPRyK0hzVYseTj/H0I6eI5eYRXkJhseDa
	 QhfVCmTnSxMZVvuTjv1xJsjw6L9Nx1mU1JavtaIgKbPxMEczpQiZam2b+DOGUnh5Q6
	 +m30XnN99Im5hXCSg1mjueRZaS1YfCHLaO55Up0rBeW/nu/HFwUv3Iqf9MDYpylCnc
	 BHSyo/Gor0YE4I+5mrJeak5yvu1HKPy6IiR6gGJvk2W8z+jnbtrpeWfrJy4TkzX9rc
	 B3rTPC2s3GRbqWfX+AsZbimnp+J/WwuunqcCqD/TSbOK3GXO0Cu2bLsTu74u+JkI17
	 AyPv1cL93BMCw==
Received: from laura.lan (unknown [100.64.0.215])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 16D8117E1301;
	Tue,  5 May 2026 11:23:42 +0200 (CEST)
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
Subject: [PATCH v2 0/1] DRM 'feature' support for DRM drivers
Date: Tue,  5 May 2026 11:23:03 +0200
Message-Id: <20260505092304.108262-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 676ZH5QIES5TO5WLDAR6DARXX7K3MQUS
X-Message-ID-Hash: 676ZH5QIES5TO5WLDAR6DARXX7K3MQUS
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/676ZH5QIES5TO5WLDAR6DARXX7K3MQUS/>
Archived-At: 
 <https://lore.freedesktop.org/20260505092304.108262-1-laura.nao@collabora.com/>
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

Introducing the RENDER_CAPABILITY bool flag here leaves room for
implementing other features differently at a later stage.

Changes since v1:
- Replaced DriverFeatures trait and ZSTs with single
  RENDER_CAPABILITY: bool constant
- Squashed changes into a single patch

[1] v1: https://lore.kernel.org/rust-for-linux/20260119-drm-render-v1-0-8326e4d5cb44@collabora.com/

Laura Nao (1):
  rust: drm: add RENDER_CAPABILITY flag for render node support

 drivers/gpu/drm/tyr/driver.rs |  1 +
 rust/kernel/drm/device.rs     | 12 +++++++++++-
 rust/kernel/drm/driver.rs     |  5 +++++
 3 files changed, 17 insertions(+), 1 deletion(-)

-- 
2.39.5

