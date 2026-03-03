Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71436EDA693
	for <nouveau@archiver.kernel.org>; Tue,  3 Mar 2026 16:23:28 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4E5E110E856;
	Tue,  3 Mar 2026 16:23:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jW+Ib2ZV";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2548744D9C;
	Tue,  3 Mar 2026 16:13:10 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772554389;
 b=uy+fmJ+Y3eStnUbTopIHHoI/SBrExZf/GyllrRlSNVKhNoO6uZ4L6Zot2d9lRsABz55nB
 3Yt8imxKArgkpy5I2OPrlfCll+oY+q2z8Dr2EVCTRPDfvBohRBTBz/da7rkBMEc0ez34Ir5
 f/coy3Kiuvk8HgbdwVx9RBrs5V9vXMVo5QGrnHFJPpGXa8BjupGQTatRc+bD/oiMHsNGzCX
 XOOfOf8ESNbCoatwV36PUF5Y6oncgp9YiUNEqqAvNQJIX9kiwQm3Be4jK0haWrWqPDqPLXN
 yeANUNyal0oD6FtpAeTu3LMyHXExYHzHjg71TFpMzds3GKy9rbNDxmmgGuDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772554389; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=VXzhkX7OlnRRSjM8XwhhPJPKPpfXNkJBESOVC5TyefA=;
 b=DPQv1PKFthQjiZSYRJUdmyvo3AmEGVwxlLNov5P8yTNl86p4fLcieodmHZQsIqR2C18Xp
 Vp/LHk5rUYpX9ifAEk1HnpD2o/PTUGZHWHBA8KD/AKrNVBOAPK1t4HYidstUzzRKYbqGokJ
 2nVg5av6Rj0sBas1vfY3waaslBe8f/xW8LFFNLhNZ6zfSqalc5mgfU7Jd/2CgR1Xd0jkJJx
 +X8sHUqJCq82HBeNd2Uhzk/2koVRqcCF16tr7KpCLHfvnRy+0UYyhdQrmN3OdNcnO/VChOl
 pvH9dFppKxqOC/+hqyzUnjz0mooDgst2bueWmHh2jLEExwLPqASq8u1rdVkA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id E3D7244CD7
	for <nouveau@lists.freedesktop.org>; Tue,  3 Mar 2026 16:13:07 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E39F910E85A;
	Tue,  3 Mar 2026 16:23:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CA5D3441AE;
	Tue,  3 Mar 2026 16:23:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01522C19422;
	Tue,  3 Mar 2026 16:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772555005;
	bh=sZeYMfqAjnE/ZOhGVSDNSGhEbY9o/U7Qeic9UXsETko=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jW+Ib2ZVBR7gmR5KmTVPaQtcqQagtSa3fj+JrPcYu7+ZunDCTA3gDKPbR3z/hBu00
	 zOBMyBq7puRrTBszGHwAsNBk5w9kq7LGlIn+zgxCpDz2FzxwmGVYiHnmKaOongRTma
	 rhKobipEX3CX5HAyNCCPqLrU6FeZxQ3ws2H1KUh5fsXyyeMdz96JtOkwMNAlQouemQ
	 GLhrvl3pUf5kowisjzDzceQE1fis2lt3WLTA8LnYdDg8TmSpzI3NShub1Qdpvf8bE+
	 mj9xDZ6eFwbNkyMLkhzzBM93/pkdZ+WwZAAUreKp8tg5UIfHLI6AQnogG87KOsn+rx
	 L5lk9HZ5yteEQ==
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
Subject: [PATCH 1/8] rust: dma: use "kernel vertical" style for imports
Date: Tue,  3 Mar 2026 17:22:52 +0100
Message-ID: <20260303162314.94363-2-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303162314.94363-1-dakr@kernel.org>
References: <20260303162314.94363-1-dakr@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3VYENFUQWHHMPMVKP4ULL6APHJQZGC2A
X-Message-ID-Hash: 3VYENFUQWHHMPMVKP4ULL6APHJQZGC2A
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3VYENFUQWHHMPMVKP4ULL6APHJQZGC2A/>
Archived-At: 
 <https://lore.freedesktop.org/20260303162314.94363-2-dakr@kernel.org/>
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
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/dma.rs | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index cd2957b5f260..54512278085e 100644
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

