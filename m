Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C15D3517A
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 11:48:41 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0454310F073;
	Wed,  1 Apr 2026 11:48:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="D7CRYS4I";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D9E1C4536E;
	Wed,  1 Apr 2026 11:37:18 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775043438;
 b=Sgg2/R27+b28AMmLVOLoavRZ5NrpAhTgqPmUJ0OyfHvI1awD2HdTHxlcpZpSWqIluHNz4
 07iUgPvNe45IoXbdxIV8D+XgGgwqHprZDmCXbTVCP2CPTTmkj6Z7uWarNiprCmiowdwoqK8
 b8Y3vNq3Oc5U7P60eFOwp4ZVNewZjXy7srKpJHMLdMKd8hNermITUWtoGvCgQf3vRtlUwJr
 LMh8JVtMWAnfxPqpZe5O1tk8050i4jcH51F9fgZD8bkh+VJxYV6G+Fwe2KLnpkTsVdWtCrr
 ArD/o2B6ShnKbC5gJFlcPELPahDz+nRa2XefQw+AG/mYs/vpqt2RVD5gfh6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775043438; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=gLKzVlrt8yDZKpzjcFvol0wwGymoBUesBbQpwWfGgug=;
 b=lxoYiq7cZg55NU2cmml7J3+CCg+B8jrRQKw9qMA4aIWYPGktnWmEXrKralap6FdmKDc/H
 7fnwS83K0BmJNc9P6NcUZjPJgTQmrY8CGTlyMQgVXKqz+Z4qiLkNJ3uBqrWRdfJhjGquPx2
 uJRtm7N2/R8+54TyC3avaBXXua7fW0oZp3VEb5xc1K6xNQsowAbie1sh+f1NtZYoGnTDnn4
 M6+Et2hvy1A/26Y7Ehna2m2nYXItx79OtqDhW3OuxktnRiU0++kkyoOYA9+6ABnlLKRR++O
 0W1Cr5WrCsk83kDMMdlA3mmcG/QrWnbFItYgwN4bl/LCiMGVWFNNbdbZX8CQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id EEF8840545
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 11:37:15 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CEC1310F061;
	Wed,  1 Apr 2026 11:48:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 36E8760142;
	Wed,  1 Apr 2026 11:48:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADE8FC4CEF7;
	Wed,  1 Apr 2026 11:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044116;
	bh=ljnXuX5HwPO9n952btUletHJHOtBVyk1Xf5y47SLQh0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D7CRYS4IETw0CEZ0NBFJ9NJ7Srw9Q9SJGBqB5dx9NagMuyqc8NAQ7QI2LNuDqTtsU
	 cXTdniFrOXotXLNiYoIzv8/FMc6rjp6Y9iXHw6ytzNYDyy7kY3i5pz5PnDeYZJ42+q
	 k2jEvdGxqyQrAlfbok54A0BLe7rt8A0yaS6MmErdKMwP/VqrnqKQrd3eneqJSPBmjc
	 I22A+exN4GmReO/dkLfFCgCVorndbUnr4Y8X3K18TdefNFRwsg0z/MSWzMqqu0Ugjm
	 4uwsza3aByQxj2gKMRIC+jyTTFP8zqXpD23dJHCcbI0oNlhL7k6OePQoJ+l2j/j1NC
	 vn7gNIS5m0nxg==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <christian@brauner.io>,
	Carlos Llamas <cmllamas@google.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 13/33] rust: block: update `const_refs_to_static` MSRV TODO
 comment
Date: Wed,  1 Apr 2026 13:45:20 +0200
Message-ID: <20260401114540.30108-14-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-1-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DU6YNOAHTHZZJFK5ZM27Q7WO6P23HHN6
X-Message-ID-Hash: DU6YNOAHTHZZJFK5ZM27Q7WO6P23HHN6
X-MailFrom: ojeda@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@kernel.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org,
 moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DU6YNOAHTHZZJFK5ZM27Q7WO6P23HHN6/>
Archived-At: 
 <https://lore.freedesktop.org/20260401114540.30108-14-ojeda@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

`feature(const_refs_to_static)` was stabilized in Rust 1.83.0 [1].

Thus update the comment to reflect that.

Link: https://github.com/rust-lang/rust/pull/129759 [1]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/kernel/block/mq/gen_disk.rs | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/rust/kernel/block/mq/gen_disk.rs b/rust/kernel/block/mq/gen_disk.rs
index c8b0ecb17082..912cb805caf5 100644
--- a/rust/kernel/block/mq/gen_disk.rs
+++ b/rust/kernel/block/mq/gen_disk.rs
@@ -140,9 +140,7 @@ pub fn build<T: Operations>(
             devnode: None,
             alternative_gpt_sector: None,
             get_unique_id: None,
-            // TODO: Set to THIS_MODULE. Waiting for const_refs_to_static feature to
-            // be merged (unstable in rustc 1.78 which is staged for linux 6.10)
-            // <https://github.com/rust-lang/rust/issues/119618>
+            // TODO: Set to `THIS_MODULE`.
             owner: core::ptr::null_mut(),
             pr_ops: core::ptr::null_mut(),
             free_disk: None,
-- 
2.53.0

