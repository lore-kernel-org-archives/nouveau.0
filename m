Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA2A1075269
	for <nouveau@archiver.kernel.org>; Wed, 25 Mar 2026 00:39:41 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 415BA10E688;
	Wed, 25 Mar 2026 00:39:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lmTCDmKJ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id AA695452D0;
	Wed, 25 Mar 2026 00:28:34 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774398514;
 b=rb+6svZZ3Y3uBgBubuwpQq3SWOZF0MAYMUqkcg9zwjh6Bha4W1ygqKIWRcRm6uVDBiSQv
 IlFZjIl6kmKJHdUqrjlXpm9ANVwCXmy0Lld+RvK0us/O5schNsswLAy56c+AiK8roVxmWjj
 YSuSVeihvt7FIOxDgxUcUqxpdii+uB13m/uxUawprhZ7ZsHEBAj9yoTpdrtJsYwKNPm26Iy
 QT8qaUkZko8LInG9tTt8X0tJRKriSpFmJZeyreY5eoAYcbq8VNW8h7V5V77KJ+rtcz1Ukqy
 ZERVfmnPc0yGiCvEC1Fac6u5RIN0ObwliVi/fCpV8T9rl6vLJRQveO331rKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774398514; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=xvTacd7u4Jfsjni1NT7W29L89LwL6/05iUNYAXZIuKk=;
 b=qepLHcmpIM5XwY35fIlEh8MOw4s8e2b+rQxVlyyC3UxcsO3oXazJLf/f0jOZUQdXGinIt
 XfVY+lf3oHn+6i7hivOS/KKVEcP7wmNUJPPs2HZ1n9hPHs6qr8MRgUtmXAyiITBFdBr0t/K
 QSzO2OczQn7VGD8ldIhVk1oWaqRMcRrn85336/zBRX/NEvi3cx0oJvqWTUYVat78hnYRDK7
 uamVh+1zb70oDxMlfy9UZyLQQuGReLZ4LIdoZ7AEtlu1yEjBzbLEvVyq5QISjgukdIMYoks
 wEqQPxL/L/+03mn3PnyQDC5jMRjWDcsDdrIZzGY3tn/FBWtSowQ1td/rcZSQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id ECF6A433BB
	for <nouveau@lists.freedesktop.org>; Wed, 25 Mar 2026 00:28:31 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA5E10E679;
	Wed, 25 Mar 2026 00:39:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E4AAB43AB2;
	Wed, 25 Mar 2026 00:39:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3374AC2BCB1;
	Wed, 25 Mar 2026 00:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774399176;
	bh=gbwC0bUs3ACbCLJCFMmEYT75zj/GDqXq5ckIamVbOTI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lmTCDmKJjwrYNTrIvkdfRz+Vi8m1T5GX7Fm9FQVG120/OAH2UsT58emkqcoGxATvc
	 SoezpcnwzOYkuh5E4AZrxQTQs5fQKOihBdrMtP/G+V/bTKonC7f3GY9CWyuH56y8+5
	 EIT9rhfmdfj7minUXffoTQLmLHUu5jHpz/ddQplsItuHOIWk9OH9KVSg5/yIqsKi80
	 IniZLJhDq/PxqkpsIsMV1hGc59Blgt//WHyAGRBW2FJ/vwQMBrcr5vLNBh8xzJxIXh
	 IlbYCoGsP78VMw2pqcfgJAWTHAqH2P0ofl0kofpN2rGKqX/bhouqzDDqFvIl/gDMVX
	 Gi30lYVOQq4BQ==
From: Danilo Krummrich <dakr@kernel.org>
To: acourbot@nvidia.com,
	aliceryhl@google.com,
	abdiel.janulgue@gmail.com,
	daniel.almeida@collabora.com,
	robin.murphy@arm.com,
	a.hindborg@kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	tmgross@umich.edu,
	ttabi@nvidia.com
Subject: [PATCH 2/3] rust: dma: generalize BinaryWriter impl for Coherent<T>
Date: Wed, 25 Mar 2026 01:39:16 +0100
Message-ID: <20260325003921.3420-2-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325003921.3420-1-dakr@kernel.org>
References: <20260325003921.3420-1-dakr@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MZRN4KY66YZZOSRVZGWYYH2PDUTWNQE2
X-Message-ID-Hash: MZRN4KY66YZZOSRVZGWYYH2PDUTWNQE2
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MZRN4KY66YZZOSRVZGWYYH2PDUTWNQE2/>
Archived-At: 
 <https://lore.freedesktop.org/20260325003921.3420-2-dakr@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Generalize the BinaryWriter implementation from Coherent<[u8]> to
Coherent<T> where T: KnownSize + AsBytes + ?Sized. The implementation
only uses size() and write_dma(), neither of which depends on the
inner type being a byte slice.

This allows any Coherent allocation with an AsBytes inner type to be
exposed as a debugfs binary file.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/dma.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 3eef7c2396bb..7bc97f9f83fd 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -885,7 +885,7 @@ unsafe impl<T: KnownSize + Send + ?Sized> Send for Coherent<T> {}
 // The safe methods only return metadata or raw pointers whose use requires `unsafe`.
 unsafe impl<T: KnownSize + ?Sized + AsBytes + FromBytes + Sync> Sync for Coherent<T> {}
 
-impl debugfs::BinaryWriter for Coherent<[u8]> {
+impl<T: KnownSize + AsBytes + ?Sized> debugfs::BinaryWriter for Coherent<T> {
     fn write_to_slice(
         &self,
         writer: &mut UserSliceWriter,
-- 
2.53.0

