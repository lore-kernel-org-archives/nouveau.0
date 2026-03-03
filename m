Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D3EBEDA693
	for <nouveau@archiver.kernel.org>; Tue,  3 Mar 2026 16:23:25 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E6F4110E858;
	Tue,  3 Mar 2026 16:23:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="D20tbfkk";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id BBB8E44D39;
	Tue,  3 Mar 2026 16:13:06 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772554386;
 b=LmFFYVA/nQTZfONwEuvPB8yqkIbmfB4VEZJjt8pPCgBj9H9yo7EYesvcLrXgXvYZl6EXL
 pzvyTuT3Mycgs/cOPzXkV3rWapeIlDLLZ963OsTq15+bYpIjBrHP0t9bO1TJ9/zviD4Ib9P
 0jvs0bISBlXdY24lVNeO5pjXt3w9hS7lNC195XN21DJKBzCtoyjhcYEY4ngD8U5dTiv9cxg
 7xYApjkgogvzt78Uvmv1SxGw+nO5slFYq4lA2pO9yUxMbvcEtwok9ffCUSG4mwIXwvsfYvG
 lzlXSosSWjlWBw0E0F1UtLJuYKfhIeKNAYFDFCjQWKR2AWR9dRrM7C/dR3SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772554386; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=zWCHRxUEfGP+4K1Bn52kk1RwA2kBBXXWu+W+2ctHXKc=;
 b=e+eZfxIhN9YH9yeRKkGVHpbrjBYkLWXIqSPdEsZI5JeeyiKczNcJvZ5ZIjebxilTaS7FB
 X5TbdEaDCm6thiHskj7IL4mUWVUNvofLlgG4fK5WXKAUO/yGi8CdH1938DlXeLrnAEJ3Vzm
 YVjmjEpSqvERkNE6ZpfyMFDoppRYGymxgHaKTYsP287RqkjXbFp45RulxRgmtdeF97LpVst
 K5Q58W83fI7k7pRDI/mZh0wQR9B4XRBtXpQDGaBedcyASh9MeiNZcdg/LBx0yvV1ZWxTbBi
 27APlqa1gsZV9q2PnTiI2K8GCWlXRXzVK18R9snt1IY11VrdVZUhdG9z6XAA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=fail header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=fail header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id E85FB44CD7
	for <nouveau@lists.freedesktop.org>; Tue,  3 Mar 2026 16:13:03 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E1FD810E852;
	Tue,  3 Mar 2026 16:23:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A3A784094A;
	Tue,  3 Mar 2026 16:23:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAFDCC116C6;
	Tue,  3 Mar 2026 16:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772555001;
	bh=LZhImWuMkU3twctJXiYSMBdRdlQpQCpIy5sEVsTJsPs=;
	h=From:To:Cc:Subject:Date:From;
	b=D20tbfkk1xkCPRKVfaRXdyuOyGZz1o7Ue+wpoIv/a6AGFcACdSsZvjdOlt1lRKfvQ
	 Fe3wXKViyuY0H0RA4uCFyoshov8odkRYxqGBg6EyzRcLNkQkE62kddf6fOzsSazMem
	 brjQS63XriSXH5R6skF56yLgRCVC3chPWIzCc4uSzDmAgW/FvZyq5qIWrcVANTNJpF
	 /se/9Zm9lyHKpYaz1ydAdzgPugtxASifjrH6Dik2pVK49p7RiUaPnPw8oSN7K9fUsA
	 omOYTIt2mxuY90G9aG8rA2AXkPg/ApM3+L+tq2V0xb0gIslnkFmktJEWz/zRjtDljD
	 opvtQUPsw7HYw==
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
Subject: [PATCH 0/8] dma::Coherent & dma::CoherentInit API
Date: Tue,  3 Mar 2026 17:22:51 +0100
Message-ID: <20260303162314.94363-1-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: D2DURMFMA7LB3ACEQSUKQCYCHC7NX33O
X-Message-ID-Hash: D2DURMFMA7LB3ACEQSUKQCYCHC7NX33O
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/D2DURMFMA7LB3ACEQSUKQCYCHC7NX33O/>
Archived-At: 
 <https://lore.freedesktop.org/20260303162314.94363-1-dakr@kernel.org/>
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

Additionally, introduce dma::CoherentInit, a type that encapsulates a
dma::Coherent object before its DMA address is exposed to the device.
dma::CoherentInit can guarantee exclusive access to the inner dma::Coherent
object and implement Deref and DerefMut.

Also add Coherent::init() and Coherent::init_with_attrs() so we can directly
initialize a new dma::Coherent object through an impl Init<T, E>.

Danilo Krummrich (5):
  rust: dma: use "kernel vertical" style for imports
  rust: dma: introduce dma::CoherentInit for memory initialization
  rust: dma: add Coherent:init() and Coherent::init_with_attrs()
  gpu: nova-core: use Coherent::init to initialize GspFwWprMeta
  gpu: nova-core: convert Gsp::new() to use CoherentInit

Gary Guo (3):
  rust: dma: add generalized container for types other than slices
  rust: dma: add zeroed constructor to `Coherent`
  gpu: nova-core: convert to new dma::Coherent API

 drivers/gpu/nova-core/dma.rs      |  19 +-
 drivers/gpu/nova-core/falcon.rs   |   7 +-
 drivers/gpu/nova-core/firmware.rs |  10 +-
 drivers/gpu/nova-core/gsp.rs      |  65 ++--
 drivers/gpu/nova-core/gsp/boot.rs |   7 +-
 drivers/gpu/nova-core/gsp/cmdq.rs |  55 +--
 drivers/gpu/nova-core/gsp/fw.rs   |  82 ++--
 rust/kernel/device.rs             |   4 +-
 rust/kernel/dma.rs                | 626 +++++++++++++++++++++++-------
 samples/rust/rust_dma.rs          |   8 +-
 10 files changed, 619 insertions(+), 264 deletions(-)


base-commit: 1195fcbda62f12108dc9be56fa4173897905b90c
-- 
2.53.0

