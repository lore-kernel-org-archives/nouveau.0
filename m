Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607B5E9D82C
	for <nouveau@archiver.kernel.org>; Sun,  5 Apr 2026 23:54:05 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3ACD810E173;
	Sun,  5 Apr 2026 23:54:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ME0m/TLb";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1C9AD455B0;
	Sun,  5 Apr 2026 23:42:33 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775432553;
 b=Y+2NBGx06W2WM6pa5abLm5VR+OBrBbKbB7IVmNrrI9U6782+LkhzGOLd1aMs3IzS9HpTw
 78T0Hecf8QeBrXOw8DIBRuzpkWuROokHJ5jBfdNw8IEepjfbkWtO2U4roWSIIrofWjYS+B7
 /wT2yGonLU7YeX7x8Qkr0uS2vfaWPyTFGPb327OAeYZJRYeIEJDukn4oyQQSSkOZFzXz9e8
 bzVKvqCAdHK2d5vn2F6rlfaXHtRxLaqwOShrimHcbU9Hy9mkLMZMILbf9TKS9JUQ6mxtdwt
 3mtrDHsJZN/iJkniVCo9LHyzlJZqgq/0WwvBZs9jtfPA3J38jKnduzGV5/wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775432553; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=KvYP29wP9BffMi2xX+Zrn1NTDiFRqpHF9Qqc7eVJnqA=;
 b=QUnM576iW2TwxezY5tzlrSiG3n8/s3Grxs2kAFlby7pEcGSgjaioVvBdhTdLwVQsq3Kz0
 NAi20oTbwxRAtfsSGCwK2wvg0NAMhyLHgrE41VFBJNF0SWqMpe4KHu7/OhqiwWtQeGPw0fx
 uU7nSrNjo1Y1jYZJP9AO//caKqmb8emjTPXvbmCvARJAQX5vWU8ReQPSkDuqcHfDMzHtR5z
 VzTYsvAx1CYkm1Wn0eekeuac28dvoc3O+PKJrrzQIyIvJ6HkywZnSOZDLWWRYaCEEw26kbZ
 lqCco27rxqWv0qrUjnYWHNsxFzR0gISn5ngzsjRhMVQ5k7f5gWtuccucJ8mQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 99759448E7
	for <nouveau@lists.freedesktop.org>; Sun,  5 Apr 2026 23:42:30 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 97A7810E116;
	Sun,  5 Apr 2026 23:54:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 48ECD418CE;
	Sun,  5 Apr 2026 23:54:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BA5CC116C6;
	Sun,  5 Apr 2026 23:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775433242;
	bh=WQ0oBITAbznQlvSGXpQS73br2HMX6Bl0r6ccv/0kOtQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ME0m/TLbLLPkqVSK+iLGCx7Qa57ge0tZp/EzBj65jU7Gi+ERQSPKwf2Rr77wxXDNK
	 RkuzSWWrTer5zZVSX7ZmfNpmGDHDw7AZNyURN5b/Ek393YiaAlqw2oFr05KY04oAsL
	 +byIpV99QPfflerc2makyl1vZ5n/+4tGd3ni4/cv1L0w8FGwdTMh/La5YBban/5liF
	 rXGoYtIzYujv6gOLZ0J7fGKgoDYlFWyFYbLrMQ922zNgC7RKaWG7Wpxf/bTSvu9QDC
	 6GF9afyHuSpq7uqaF+5GL7UIb7V7T5KnR79NZsLE7/OJgSJegLBz9pdg1DjD/JZ7yQ
	 d+gllyV3biqBg==
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
Subject: [PATCH v2 03/33] rust: kbuild: remove unneeded old `allow`s for
 generated layout tests
Date: Mon,  6 Apr 2026 01:52:39 +0200
Message-ID: <20260405235309.418950-4-ojeda@kernel.org>
In-Reply-To: <20260405235309.418950-1-ojeda@kernel.org>
References: <20260405235309.418950-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DKC2HZNWKYOOP4N7V3DJLOI2VBRMZO6C
X-Message-ID-Hash: DKC2HZNWKYOOP4N7V3DJLOI2VBRMZO6C
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
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 Tamir Duberstein <tamird@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DKC2HZNWKYOOP4N7V3DJLOI2VBRMZO6C/>
Archived-At: 
 <https://lore.freedesktop.org/20260405235309.418950-4-ojeda@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The issue that required `allow`s for `cfg(test)` code generated by
`bindgen` for layout testing was fixed back in `bindgen` 0.60.0 [1],
so it could have been removed even before the version bump, but it does
not hurt.

Thus remove it now.

Link: https://github.com/rust-lang/rust-bindgen/pull/2203 [1]
Reviewed-by: Tamir Duberstein <tamird@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/bindings/lib.rs | 4 ----
 rust/uapi/lib.rs     | 4 ----
 2 files changed, 8 deletions(-)

diff --git a/rust/bindings/lib.rs b/rust/bindings/lib.rs
index 19f57c5b2fa2..e18c160dad17 100644
--- a/rust/bindings/lib.rs
+++ b/rust/bindings/lib.rs
@@ -9,10 +9,6 @@
 //! using this crate.
 
 #![no_std]
-// See <https://github.com/rust-lang/rust-bindgen/issues/1651>.
-#![cfg_attr(test, allow(deref_nullptr))]
-#![cfg_attr(test, allow(unaligned_references))]
-#![cfg_attr(test, allow(unsafe_op_in_unsafe_fn))]
 #![allow(
     clippy::all,
     missing_docs,
diff --git a/rust/uapi/lib.rs b/rust/uapi/lib.rs
index 1d5fd9efb93e..821e286e0daa 100644
--- a/rust/uapi/lib.rs
+++ b/rust/uapi/lib.rs
@@ -8,10 +8,6 @@
 //! userspace APIs.
 
 #![no_std]
-// See <https://github.com/rust-lang/rust-bindgen/issues/1651>.
-#![cfg_attr(test, allow(deref_nullptr))]
-#![cfg_attr(test, allow(unaligned_references))]
-#![cfg_attr(test, allow(unsafe_op_in_unsafe_fn))]
 #![allow(
     clippy::all,
     clippy::cast_lossless,
-- 
2.53.0

