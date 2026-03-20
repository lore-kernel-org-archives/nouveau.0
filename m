Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A10551099B37
	for <nouveau@archiver.kernel.org>; Fri, 20 Mar 2026 19:46:50 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F17DD10EBFC;
	Fri, 20 Mar 2026 19:46:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="q6EXzaEG";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B7D204523B;
	Fri, 20 Mar 2026 19:35:53 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774035353;
 b=RDJZI0uUmaZzxDr4YfODgcoR3TjVR7CDe1OZFqOrtGBO2wPscCjcYrlGxle8CPL8IxWCD
 URq3+teOv5ChGpVSw0FTwtcI5lIq4NXnbWKyaHRul+VNJD2ORtssC/J1l37aJE8wDPfr93F
 p/baoLkyKCZOzr5w4e/t8hI1rJ7it4jPYlwkNvQx9UfaqXShrx1Vlk9hhezU+a4MvNWQc6U
 d/p3eMpO9qNAgjbzo+3UTbrNskxLLH3mjVGBe4o1SnbOHNtFBZuwr2R3chIG9oiSarS5cp4
 a6LnhAMPJxXNh2+plOk2dqRou1K9QV/eDxN0ebtlkWTREGvuKp/mNXPoxhyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774035353; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=03WHCGGKh0chQjvSvy05U9GzVSN+CvEdxaCqpDnUK0U=;
 b=PfSAyV/c2gFIzm98TTok8OWVS9N8gpPLCaavNB2BpYNipw4GmvWtz72EQzk3XGX/lwOY6
 ONV8ZyVLKDhLr9QwYY4r1w6bhch8frXHxsmNj8V3gyUKTgNNmiHIBTFsBpP9eeupVHhESzB
 cFqw2lcfwiSdnudOMQYMBRqt+dBnDK2blhYRU5OcLqC1Csbde7Z30ISL/+V8brksxHLLN/0
 u/t5BR7+/CNWFU3bCnyARqYstvARSqh6Mx4dB0mP8KUG6w18nVK+H06rBopwmpSwm27WrRH
 dsRflEN/famWldLfzhiGBEsNLvwrKKMwvV0RF92Sc+68L8GyijUt0SL26wwA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id DFB9E44C8D
	for <nouveau@lists.freedesktop.org>; Fri, 20 Mar 2026 19:35:49 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EA7E110EBE8;
	Fri, 20 Mar 2026 19:46:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3247F60128;
	Fri, 20 Mar 2026 19:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FE0FC19425;
	Fri, 20 Mar 2026 19:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774036004;
	bh=7IrYb1jT8W1MG5tVtcLS6oRPxPvMpufx+jp6IJ+X/uo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q6EXzaEGhZjv5DtTK1D3QHVldQRYQNWz9Rq628sTPVJt8UpsaCgTgBKhADgkBzW1n
	 OcZu8qW0YYDRUvK0i02i+JkAOL8r+MoCtvTAq0FZLlRQfU8Q2X+sZZCgIBikO6PbH8
	 mvLQ1Gmki+l0q2kgqLYU0izL9e0vM9GYVGoTESsSEGC/6mn2hQcKHXG4E5I/p+cMAO
	 BhM4OWvMrJKkjT7i6U/nbAKzfHbBMnlTqPILazfhB0rFM5BCQtEGqBUmBxmXv1FEle
	 Ibfg1gM7ENyU56D79wpCYY28Csho/rhpbVVyZEe5Je8WDSU3mQPpO9GQkTW5ncaQub
	 J3/HM0rFVwLxQ==
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
Subject: [PATCH v2 1/8] rust: dma: use "kernel vertical" style for imports
Date: Fri, 20 Mar 2026 20:45:36 +0100
Message-ID: <20260320194626.36263-2-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320194626.36263-1-dakr@kernel.org>
References: <20260320194626.36263-1-dakr@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7EWW763UGCYAT2ICCGHJ7XXKNECY6TFT
X-Message-ID-Hash: 7EWW763UGCYAT2ICCGHJ7XXKNECY6TFT
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7EWW763UGCYAT2ICCGHJ7XXKNECY6TFT/>
Archived-At: 
 <https://lore.freedesktop.org/20260320194626.36263-2-dakr@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Convert all imports to use "kernel vertical" style.

With this, subsequent patches neither introduce unrelated changes nor
leave an inconsistent import pattern.

While at it, drop unnecessary imports covered by prelude::*.

Link: https://docs.kernel.org/rust/coding-guidelines.html#imports
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/dma.rs | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index a396f8435739..2eea7e2f8f04 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -5,12 +5,20 @@
 //! C header: [`include/linux/dma-mapping.h`](srctree/include/linux/dma-mapping.h)
 
 use crate::{
-    bindings, build_assert, device,
-    device::{Bound, Core},
-    error::{to_result, Result},
+    bindings,
+    build_assert,
+    device::{
+        self,
+        Bound,
+        Core, //
+    },
+    error::to_result,
     prelude::*,
     sync::aref::ARef,
-    transmute::{AsBytes, FromBytes},
+    transmute::{
+        AsBytes,
+        FromBytes, //
+    }, //
 };
 use core::ptr::NonNull;
 
-- 
2.53.0

