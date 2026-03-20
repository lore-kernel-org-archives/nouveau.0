Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 010111099B39
	for <nouveau@archiver.kernel.org>; Fri, 20 Mar 2026 19:46:46 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B90FA10EBD6;
	Fri, 20 Mar 2026 19:46:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qeog/oha";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 775944523B;
	Fri, 20 Mar 2026 19:35:48 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774035348;
 b=sWh4AtMBE/B0NtplErZ5dOTH85X9EDwVCUBEs7a25FTO1+KG463j7FfjXIgXAr6UPvoJp
 ifgt1Xeqvs4OWp7v585QF1CHQm1dnuCs078NRSV9Vx7GHelvuyaT013kLzZeYyw7zGbWta8
 TOVaeHvUpsLjfBCxt/vzqmmpE2hmBiPMgrJ/Kmo3pdMKcv25EYbQvk8dv15X5aDHFQjcenq
 Tikc/cdsS8ItdfNH4/LA/eMHqIPpJBbeBa/rkKTJIMRPZFXOryTaegqVdfNromzuJaD8pQt
 3tPqU1q3JQGA6EvK3Dd637LKPgselbIeT8ibaTJZqNhR2PeqDAJsnKO6VCLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774035348; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=FeEBa4akCWNGuZc6n70U3ClVlhw8D5YwrbYP4GtPHOA=;
 b=ooOic8Q6kfN56JUnKGfBHKiILsvQYmaxgRpRtz5FZMFoSoBbeiqqalskNT1QiPlNna8J2
 UrUlExuLV337dti596oUsR/DwRGVsFeubYSLTG0eFvmOyLHoqCyPlIwRpnghU6RWRqdUjai
 oe0n2HQO99hOTqOIf8rwxuP87ViXK3kr9PQlyTWCJ38rwdk924ImY6gqFeMD4QWjqFL9NsK
 uhoXeFaOlQdFZ9Q/+bP9ZjSNpHsF1EjS6GsdDtOO2uEXeNBL2ZMJlFyLuctRmZCKzv56dGi
 rIl1+3ZFwIo5LG4Yc6Zg6rELGAP9lIn6SuahvaoBvQ0zE3AYLDHJwaHFZHMA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id E42D344C8D
	for <nouveau@lists.freedesktop.org>; Fri, 20 Mar 2026 19:35:45 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9C27A10EB8C;
	Fri, 20 Mar 2026 19:46:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C400643B86;
	Fri, 20 Mar 2026 19:46:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4E52C4CEF7;
	Fri, 20 Mar 2026 19:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774036000;
	bh=hKFaHx/rV9ES8Nrcg8VcMJye1TEo/NvG2boQBSRvjm0=;
	h=From:To:Cc:Subject:Date:From;
	b=qeog/ohazEx+Dd6S4RUapklBDv/7RBg/CObkZCOa7DvX2HK5o4YxymKWDjY473e2r
	 PgG0zChFLXqQsAyYOFV9LDS1cqguwr4x0CiD2o3BTh1ilYQN33tqxJ5GXLzxGqdcYb
	 thEMuRkbT/uInb6qAghWBOtS6rUyES4PEvnj2qUJy/KqciaeMBSkkUj7Ob/o4iH/yj
	 xthqoU/mynEsgZSBkgEcicR0mMabdtA8PIsXzJF/2I65io08vsiQeEB+HlYhro+bih
	 PgHNHUtt7eVhPuzPMCi14/y2P9H7I95byXeh2PSc7MUyt2w8rMgnjXiYhrYve1xYtD
	 ppME0dSPRHmZg==
From: Danilo Krummrich <dakr@kernel.org>
To: aliceryhl@google.com,
	acourbot@nvidia.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	abdiel.janulgue@gmail.com,
	daniel.almeida@collabora.com,
	robin.murphy@arm.com
Subject: [PATCH v2 0/8] dma::Coherent & dma::CoherentBox API
Date: Fri, 20 Mar 2026 20:45:35 +0100
Message-ID: <20260320194626.36263-1-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HWIE5HK7KVK5JU4EC6G2YM3CXXG6Y57T
X-Message-ID-Hash: HWIE5HK7KVK5JU4EC6G2YM3CXXG6Y57T
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: driver-core@lists.linux.dev, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HWIE5HK7KVK5JU4EC6G2YM3CXXG6Y57T/>
Archived-At: 
 <https://lore.freedesktop.org/20260320194626.36263-1-dakr@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This patch series introduces the dma::Coherent API Gary worked out in the
context of his I/O projection work.

Additionally, introduce dma::CoherentBox, a type that encapsulates a
dma::Coherent object before its DMA address is exposed to the device.
dma::CoherentBox can guarantee exclusive access to the inner dma::Coherent
object and implement Deref and DerefMut.

Also add Coherent::init() and Coherent::init_with_attrs() so we can directly
initialize a new dma::Coherent object through an impl Init<T, E>.

Changes in v2:
  - Rebase onto the DMA and nova-core fixes that went into -rc4.
  - Rename CoherentInit to CoherentBox.
  - Add a bunch of #[inline] attributes.
  - Remove a few unnecessary trait bounds in "rust: dma: add generalized
    container for types other than slices".
  - Fix a typo and convert core::ptr::from_mut(&mut self[i]) into
    &raw mut self[i].

Danilo Krummrich (5):
  rust: dma: use "kernel vertical" style for imports
  rust: dma: introduce dma::CoherentBox for memory initialization
  rust: dma: add Coherent:init() and Coherent::init_with_attrs()
  gpu: nova-core: use Coherent::init to initialize GspFwWprMeta
  gpu: nova-core: convert Gsp::new() to use CoherentBox

Gary Guo (3):
  rust: dma: add generalized container for types other than slices
  rust: dma: add zeroed constructor to `Coherent`
  gpu: nova-core: convert to new dma::Coherent API

 drivers/gpu/nova-core/dma.rs      |  19 +-
 drivers/gpu/nova-core/falcon.rs   |   5 +-
 drivers/gpu/nova-core/gsp.rs      |  68 ++--
 drivers/gpu/nova-core/gsp/boot.rs |   7 +-
 drivers/gpu/nova-core/gsp/cmdq.rs |  21 +-
 drivers/gpu/nova-core/gsp/fw.rs   | 128 +++---
 rust/kernel/device.rs             |   4 +-
 rust/kernel/dma.rs                | 632 +++++++++++++++++++++++-------
 samples/rust/rust_dma.rs          |   8 +-
 9 files changed, 626 insertions(+), 266 deletions(-)


base-commit: a19457958c3018783881c4416f272cd594f13049
-- 
2.53.0

