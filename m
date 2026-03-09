Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E86BF41810
	for <nouveau@archiver.kernel.org>; Mon,  9 Mar 2026 16:35:25 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 80C9A10E566;
	Mon,  9 Mar 2026 16:35:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qJypnZvq";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E854F44F74;
	Mon,  9 Mar 2026 16:24:50 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773073490;
 b=RxHGgIdORQDX85HHylgN930Mt/h8nCAXwTqID4LpYYPU4RiHEW1zWgKHsM44ZdsIOzftz
 Wlp+7uCBpihPEwHtuccRz8Y3BWYJGaLjTT6ziYT21wkulZ9U+AwhQIsCx84zv/FOgfc3ppZ
 P+Dhszb+RwXJ3qql9ai9BolzQJ87ZGd7+Frgdv+4xuRJ3HprQif231GMWo/HoGCOllZGnf9
 jaYdOyWhoNNRk+GrOfONZQurqQ06AFPMtaVbplx6ChNttTxevAIV5LvQ+zU7pjRO7srdSUq
 VZNypWD0PZWOQHz37yFLxq1P//Iv5p3LLrnFxBczt0VflCjjfOF0iW8mtGXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773073490; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=lAJYyoSqxT/dqQO+mnTZIVqT6arhuOiueZbCAyrRn6A=;
 b=xkk3pX1wy6ZRbM93E83ou28qeHUyZpFLGLhqppYLToHgnaEhQ81DFY7bZa19T9noryCWs
 eQmLEfcBn8yhsr4gtDo54+zXIxsNuuR4TWQX/+oSymnCPufD73F5WjWPPmbq8fF8PZh9VKT
 4fRHI2XkF0Mt09Qr7TNvGme18zuMJNADnY/lcjGLoLQHvMbQ/g/iNXzyZ3E5r2wR0yDpINg
 A4BwPGjiLtu/tNJCZ0F2Q8NFxufw66LIFl+hBfimq5YYfDTMgUExhjXDruf7cHDcGzc8dWD
 sXGtP71Qnd8hHVf8ZYGViqGylwbL1CCNLHhMv/TdHEUFimuGu1mYyhGSOqCA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id BDBFC4034D
	for <nouveau@lists.freedesktop.org>; Mon,  9 Mar 2026 16:24:47 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC4510E558;
	Mon,  9 Mar 2026 16:35:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B7EEA43603;
	Mon,  9 Mar 2026 16:35:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A517C2BCB1;
	Mon,  9 Mar 2026 16:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773074118;
	bh=Lf/tjBPdlKcD7jrxP5eEotYbP1CD88GOp7ffo4qPdl4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=qJypnZvqDuuvPI/9HNKX96yrIj5W8JOHoDnuKraZ5hTnn+VfEmTiPbv0ojNT4/B59
	 JW23FjLhK83UL3OuvvkIvqIQLmlOW+fo7xere/D4Byy2R2FsNQithXuEo/8/3zBVpB
	 Zm+/eABRZJw5giIvS8QhAf9BYlO9lwjoTjx4mu8SEAX68qPDqDImKJD+oD2jl12vzG
	 ZPdf4pdCGvfVPm3fOkuBcWMgm9PNPjOdSe/QyvYtr1sdLrb4+pHyOHHvAeguu2VvLL
	 kShyRrDjBVsoHe8sadvaBULOq3XPKaZWTtH8NJ/nHZc0+9evQ8+0DpdsIUr6bgQ3Gf
	 Z0VtBq0C8/2jA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E316F41811;
	Mon,  9 Mar 2026 16:35:18 +0000 (UTC)
From: Tim Kovalenko via B4 Relay <devnull+tim.kovalenko.proton.me@kernel.org>
Subject: [PATCH v4 0/4] Fixes the stack overflow
Date: Mon, 09 Mar 2026 12:34:17 -0400
Message-Id: <20260309-drm-rust-next-v4-0-4ef485b19a4c@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XMsQ6DIBSF4VcxzKWBi0rp1PdoOqBcK4NogBIb4
 7sXnYxJx3OS719IQG8xkHuxEI/JBju6PMpLQdpeuzdSa/ImwKBmwIEaP1D/CZE6nCNtsFGgEZW
 RFclm8tjZee89X3n3NsTRf/d84tv7r5Q45bRkSqhbwwFr/pj8GEd3HZBspQRHLc4astaaqbKTN
 wlcn7U4annWImuFElXVVkqa9qjXdf0BSCj97iYBAAA=
X-Change-ID: 20260212-drm-rust-next-beb92aee9d75
To: Alexandre Courbot <acourbot@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, Boqun Feng <boqun@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773074117; l=1907;
 i=tim.kovalenko@proton.me; s=20260212; h=from:subject:message-id;
 bh=ur3mma4izM+B5GojZDmfk652EPp1d2EJADISR8mbwE0=;
 b=H3g4pztXItI93AFUT5bJEqqHh4yK27wA5nyBvGNWYTZ5xmzc0yEOXNpfRQ0CgA/5ymjpVGqFG
 fbcO1cz35oUA5sAonNIeYEaK47bnSFhPuWvMK5hzWiftvd8WbwGMrlU
X-Developer-Key: i=tim.kovalenko@proton.me; a=ed25519;
 pk=/+OiulEpgeZifgP4mDE4e5YlV6nMeY+frze/lY/xiHI=
X-Endpoint-Received: by B4 Relay for tim.kovalenko@proton.me/20260212 with
 auth_id=635
X-Original-From: Tim Kovalenko <tim.kovalenko@proton.me>
Message-ID-Hash: DESDJA3IX6ARWROLEXZ43CYDVC5HBNVE
X-Message-ID-Hash: DESDJA3IX6ARWROLEXZ43CYDVC5HBNVE
X-MailFrom: devnull+tim.kovalenko.proton.me@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, driver-core@lists.linux.dev,
 Tim Kovalenko <tim.kovalenko@proton.me>
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: tim.kovalenko@proton.me
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DESDJA3IX6ARWROLEXZ43CYDVC5HBNVE/>
Archived-At: 
 <https://lore.freedesktop.org/20260309-drm-rust-next-v4-0-4ef485b19a4c@proton.me/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>


---
Changes in v4:
- Rebase on top of projection changes
- Use index projection when writing PTEs
- Keep PteArray, as discussed in V2, and move entry calculation there
- Avoid stack allocation by writing PTEs directly to DMA memory

- Link to v3: https://lore.kernel.org/r/20260217-drm-rust-next-v3-1-9e7e95c597dc@proton.me

Changes in v3:
- Addressed the comments and re-instated the PteArray type.
- PteArray now uses `init` instead of `new` where it writes to `self`
  page by page.
- PteArray just needs a pte pointer obtained from the `gsp_mem.as_slice_mut`.

I hope I understood everything in the V2 email chain and implemented it correctly :)

- Link to v2: https://lore.kernel.org/r/20260213-drm-rust-next-v2-1-aa094f78721a@proton.me

Changes in v2:
- Missed a code formatting issue.
- Link to v1: https://lore.kernel.org/r/20260212-drm-rust-next-v1-1-409398b12e61@proton.me

---
Gary Guo (3):
      rust: ptr: add `KnownSize` trait to support DST size info extraction
      rust: ptr: add projection infrastructure
      rust: dma: use pointer projection infra for `dma_{read,write}` macro

Tim Kovalenko (1):
      gpu: nova-core: fix stack overflow in GSP memory allocation

 drivers/gpu/nova-core/gsp.rs      |  48 ++++---
 drivers/gpu/nova-core/gsp/boot.rs |   2 +-
 drivers/gpu/nova-core/gsp/cmdq.rs |  23 ++-
 rust/kernel/dma.rs                | 114 +++++++--------
 rust/kernel/lib.rs                |   4 +
 rust/kernel/ptr.rs                |  30 +++-
 rust/kernel/ptr/projection.rs     | 294 ++++++++++++++++++++++++++++++++++++++
 samples/rust/rust_dma.rs          |  30 ++--
 scripts/Makefile.build            |   4 +-
 9 files changed, 443 insertions(+), 106 deletions(-)
---
base-commit: dd8a93dafe6ef50b49d2a7b44862264d74a7aafa
change-id: 20260212-drm-rust-next-beb92aee9d75

Best regards,
-- 
Tim Kovalenko <tim.kovalenko@proton.me>


