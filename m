Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F94FF512E
	for <nouveau@archiver.kernel.org>; Tue,  7 Apr 2026 18:55:39 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8BFA610E4A2;
	Tue,  7 Apr 2026 18:55:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FP8MtPvd";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 63843456C1;
	Tue,  7 Apr 2026 18:44:02 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775587442;
 b=EN3oWiZkvC9Hq/67Jj8Vd2o3aBHVjlUItch8LVNMYAy9UwEru2U5DkhgCyhhwLCGWpCoL
 G+EWRnbFqAaA2ye39GDXFuts8deKPCNZeuGnATGw0YU393WHSAlXYpwObwZAmJ2JSfu+HNy
 +M/RytqICcYtQyRGlpoN0uoE6xhmedeZTJ1Vd2Ld6J0DiEAdc24E7vHRz9J1iLJleBXmsoL
 DU1zHPit+it6uQvD2V2AH58pwbroASBxnCSrwawJJwp7P9cb6B94elqw2BsQcf8ydyqKfO+
 x7ky8yxieHbGuFaxYY587LZnbzFKniN7xiQdSZvaqUmWsgYOWVOpx8MXPzvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775587442; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=aSt4/2N0gParUkoaZX65sqq7aHHfJG82tMHYet/fXLQ=;
 b=lBNAYulQteERoGNPBxw70h/A5j16h3SWGECSSN33zpCVHakGip8BcNLDvbX2AoC87YH+s
 4xo1Dw0bo5lzy5nC+KLHWBx2rmX3cNGfTMgHoTqEFzskokbi/zVQ5kdxTJyUN5JkViDet3z
 sysb36hpW1ZGFVDjqSPvzQ9Ca2vjZGFZjvyTDyd+pfuR6zfK2A5kUDd/3hR5e+Q1fkH6xFz
 QjZCV3ArFDJ7ZWts9ZOYHVsxkiwQl5xYMqkncUDbczBzowCnEWQvSnwhAILx3wnL20rkLf0
 DdhT5n30PK1DD/yWjlXZKJv8bLFJDYMkk9Ce8yjmnyRuSB+8wn981QFY3XfA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 3B32E43E5F
	for <nouveau@lists.freedesktop.org>; Tue,  7 Apr 2026 18:44:00 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 213FF10E493;
	Tue,  7 Apr 2026 18:55:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 499D2600AC;
	Tue,  7 Apr 2026 18:55:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EE8DC116C6;
	Tue,  7 Apr 2026 18:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775588135;
	bh=AbcygA1hOmjThs+kbyOAawPX0KVgGRAxsXzWkqu+CkY=;
	h=Date:Subject:Cc:To:From:From;
	b=FP8MtPvdSqCBr1ogWi6BQ+YA+Df1Ie2Y3Q0+hkYEJysJV9CoUfrZPCogvwNEPL2xo
	 8mzRD2nqy6ffVpZcIlYLK4+YvwaHV5AzxpXW47Q8hBxVzUbwPJxonshwwyABOOiodl
	 8x9GAf6t0aRGd4GcAa3/EKACYwtrU2al7PvzmERzKCPqVPMv5ZFgxDtFbuN5KMQZC1
	 kinuLl2Fj7epL16gQsVoWfs2yLkbAfNBn/8KTZ016Q3NQSZBwLwYuVZdOre7QYUist
	 JV7CAuzm5CP9xmGUNeQSGmF2iNguvsbZqkj671XvO7pqYYDzdC1TVx6fLrQiMsRDLi
	 GIOzfvs4v5cyg==
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Apr 2026 20:55:31 +0200
Message-Id: <DHN5GMSIBKO2.2AYOLXDU4X19S@kernel.org>
Subject: [GIT PULL] DRM Rust changes for v7.1-rc1 (2nd)
To: "Dave Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona.vetter@ffwll.ch>
From: "Danilo Krummrich" <dakr@kernel.org>
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
X-Mailer: aerc 0.21.0-0-g5549850facc2
Message-ID-Hash: H3UGDNPE3STHDSESQTBNOBKN2HCQ5CNO
X-Message-ID-Hash: H3UGDNPE3STHDSESQTBNOBKN2HCQ5CNO
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/H3UGDNPE3STHDSESQTBNOBKN2HCQ5CNO/>
Archived-At: 
 <https://lore.freedesktop.org/DHN5GMSIBKO2.2AYOLXDU4X19S@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi Dave and Sima,

Please pull these DRM Rust fixes.

All changes have been in linux-next for two rounds -- no conflicts expected=
.

- Danilo

The following changes since commit 7c50d748b4a635bc39802ea3f6b120e66b1b9067=
:

  gpu: nova-core: firmware: factor out an elf_str() function (2026-03-30 14=
:01:53 +0900)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/rust/kernel.git tags/drm-rust-next-202=
6-04-06

for you to fetch changes up to a7a080bb4236ebe577b6776d940d1717912ff6dd:

  gpu: nova-core: fix missing colon in SEC2 boot debug message (2026-04-06 =
10:06:39 +0900)

----------------------------------------------------------------
DRM Rust changes for v7.1-rc1 (2nd)

Nova (Core):
  - Don't create intermediate (mutable) references to the whole command
    queue buffer, which is potential undefined behavior.

  - Add missing padding to the falcon firmware DMA buffer to prevent DMA
    transfers going out of range of the DMA buffer.

  - Actually set the default values in the bitfield Default
    implementation.

  - Use u32::from_le_bytes() instead of manual bit shifts to parse the
    PCI ROM header.

  - Fix a missing colon in the SEC2 boot debug message.

----------------------------------------------------------------
Alexandre Courbot (2):
      gpu: nova-core: gsp: fix undefined behavior in command queue code
      gpu: nova-core: falcon: pad firmware DMA object size to required bloc=
k alignment

David Carlier (1):
      gpu: nova-core: fix missing colon in SEC2 boot debug message

Eliot Courtney (1):
      gpu: nova-core: bitfield: fix broken Default implementation

John Hubbard (1):
      gpu: nova-core: vbios: use from_le_bytes() for PCI ROM header parsing

 drivers/gpu/nova-core/bitfield.rs |   5 ++---
 drivers/gpu/nova-core/falcon.rs   |  21 +++++++++++++++++++--
 drivers/gpu/nova-core/gsp/boot.rs |   2 +-
 drivers/gpu/nova-core/gsp/cmdq.rs | 114 ++++++++++++++++++++++++++++++++++=
++++++++++++++++++++++++++++++++++-----------------------------------------=
-----
 drivers/gpu/nova-core/vbios.rs    |   7 +------
 5 files changed, 91 insertions(+), 58 deletions(-)
