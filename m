Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBEE81075269
	for <nouveau@archiver.kernel.org>; Wed, 25 Mar 2026 00:39:37 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0D37410E628;
	Wed, 25 Mar 2026 00:39:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="I36ewqRd";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6CE62452D0;
	Wed, 25 Mar 2026 00:28:30 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774398510;
 b=wWCTCaCBp6mvTZ/8l1HKJGqGR0kkP3NkO1uNLgLt9k3olCJeGgO9uXi329daLH4yPLsrm
 MS7Kkl+fhLR4J3GT+Nfjk6eI3cntfmymfVNBLjC5EfyGiT3hfB4sp5Q2LHtDjjciWKaW3iT
 HLPVHd7APQUwbzilLifEwAByqs/coQRoq8GQMEyJxEu9fpA2e6gnP0VEmB8qJ/9q0CI9RiI
 wp0TKwfidcmONBUwlGxUrcUwijycb4xITO9ZfW6EKHf7WI+LL1r94579N+LpYUgSh2cpA7x
 1WfNsM2lFyxkBLs9BlQPnkfaUhyIwRbM6mxSQTAvcLYd9uT8EAHBqpqGxaow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774398510; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=7fo59Xph6Ns+tdvtvjZ/JWYloOlmJfVCL6A9LUhAu6Q=;
 b=yY3/L0RD86DnhnSURbU+K6wucntGHsyzYuvuWMMAQ98ukn+zObEYWhlbmEIPRos0QXMff
 spP3R0kHt+wzfBz7fK0bl7NuPW2cns670JJqJXiwz9DyVYJ6VkxMaZ4ArY7WTfNUB5WTzA5
 RVSOxIBkUDqCxhkRALJB+A/UWh9AXC1iTs8FBQ00Gdvul8ptqUAW2RQZ/kZvOlOODS28FrG
 v+bDF/wotR12H3IIta8FVULTwZ5qfon2Hz7eULQwPL3tYUYab8lRTaI1J9FecV3rHy23w6J
 yqutqJDD/8WiN1db4uxzfkY5/9CGJoS3mmzfHpZsG2Y12bRoiomzHTAWrESA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 08318433BB
	for <nouveau@lists.freedesktop.org>; Wed, 25 Mar 2026 00:28:28 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3E48810E61F;
	Wed, 25 Mar 2026 00:39:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DD6AC423D5;
	Wed, 25 Mar 2026 00:39:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20FB8C19424;
	Wed, 25 Mar 2026 00:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774399172;
	bh=+mTb7igADfQv5dHN/X3TmqsYTOT3vg9UdFFcQL8Vmco=;
	h=From:To:Cc:Subject:Date:From;
	b=I36ewqRdAS4Qczc8+Xl1aqOZOcf+kdLzZrIocpHb4SHux8H+QeqLgwbQbLYHFpdtN
	 o5WobSL9tQO9tAbob0GBp3UHo7Wa53spMTxbA1NMZMLqjamQuTTovBuGIqzZNkJDCj
	 zfW7CIhX+EkmIWzneiYSlzuFyaUXeBsS0KJZEUvLVjea+YpE4w61CwIRqde84GNUkk
	 tAZYa9M2t3pZxqgC0wzDpNljxD8eyul8hStBkSjtP5ZVUSkZZGCSywuvERPIWqawl8
	 OUjuuc8XdlmTh+tFru/pISEj9pMOpUhN9leDTnag5i/umemdIrggXhN8vy1MjMbkP4
	 cOzHDkV7EWtoQ==
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
Subject: [PATCH 1/3] rust: uaccess: generalize write_dma() to accept any
 Coherent<T>
Date: Wed, 25 Mar 2026 01:39:15 +0100
Message-ID: <20260325003921.3420-1-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZJV5LM3KTR65CKXPCERSRXUO425IZV4S
X-Message-ID-Hash: ZJV5LM3KTR65CKXPCERSRXUO425IZV4S
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZJV5LM3KTR65CKXPCERSRXUO425IZV4S/>
Archived-At: 
 <https://lore.freedesktop.org/20260325003921.3420-1-dakr@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Generalize write_dma() from &Coherent<[u8]> to &Coherent<T> where
T: KnownSize + AsBytes + ?Sized. The function body only uses as_ptr()
and size(), which work for any such T, so there is no reason to
restrict it to byte slices.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/uaccess.rs | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
index e26ef90ba8ad..6c9c1cce3c63 100644
--- a/rust/kernel/uaccess.rs
+++ b/rust/kernel/uaccess.rs
@@ -12,6 +12,7 @@
     ffi::{c_char, c_void},
     fs::file,
     prelude::*,
+    ptr::KnownSize,
     transmute::{AsBytes, FromBytes},
 };
 use core::mem::{size_of, MaybeUninit};
@@ -524,7 +525,12 @@ pub fn write_slice(&mut self, data: &[u8]) -> Result {
     ///     writer.write_dma(alloc, 0, 256)
     /// }
     /// ```
-    pub fn write_dma(&mut self, alloc: &Coherent<[u8]>, offset: usize, count: usize) -> Result {
+    pub fn write_dma<T: KnownSize + AsBytes + ?Sized>(
+        &mut self,
+        alloc: &Coherent<T>,
+        offset: usize,
+        count: usize,
+    ) -> Result {
         let len = alloc.size();
         if offset.checked_add(count).ok_or(EOVERFLOW)? > len {
             return Err(ERANGE);

base-commit: dff8302ca1d0e773c90dbeeb05e759f995c95482
-- 
2.53.0

