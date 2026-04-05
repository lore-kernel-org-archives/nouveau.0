Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2368AE9D827
	for <nouveau@archiver.kernel.org>; Sun,  5 Apr 2026 23:55:35 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F084910E1A6;
	Sun,  5 Apr 2026 23:55:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PWyM8OyK";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C8CA1455C8;
	Sun,  5 Apr 2026 23:44:02 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775432642;
 b=DUW937Bje/NhfNN29uHWSTip8URaCywzxmALO+gOUa5n+9w3RxctaSf+ZiuXBTayhY2M9
 tmccbjUX77CbJju2TMPwN91OXGmIvx49lJM7GJxGhYt+2Qqeb3cb0qHGayWZ+/BwycMNzxS
 knrKkMKWBd2fA0KYHLXbFp3dYTc2VS5BntFwK5ret7gJfQUMH/qPOzvHv+yAHYDhRXo1Xrg
 bZYkngcG2SqZc1gQ9Sf/t/UUzj0zxB2RIwNcQmKVaouEKnb3fXkPLC1jO7R3cf7zeDCk/jL
 uxvd8tW9mY9ikxp09G9/qQTjhWb4BUPCZl9OFxJ2LI6Jpf/OfpXfv4fDExFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775432642; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=NNEetW96YBbmEPo4gbv2Lj+b47vqyX/CJ3m5ua325nA=;
 b=yQ6jiBWWCmwJXrlplK+JZhCmlLDdvsv5aMnkYQbI1WdIl+D8RfJ9OixgkjLOot2Tl4snu
 XC1PXWFa9DuY5nxMjzXuAD97fdFq/MwPwHw2FpC//P00FqCMElrCc49ZYA6IWq/gf9ILagq
 piMcOVZONtWawxboyqHX+CBMYRhBSGIKMo34oZS8wNMf9nNuOks9SD8leFNVkj6uoNleLpk
 wjNCyG9K9FMZiyXnMcmg6x7V36eyac29se32/Fhg1BjByozF3+4Ehz04eJ/kFiM7/oUK7Wr
 P5VIH5GQs+mLTwKP5i4rXLvT5RGwm8EpCxPVS7Vs4FGHa6D6vPqlF6n69WAw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 97CB2448E7
	for <nouveau@lists.freedesktop.org>; Sun,  5 Apr 2026 23:43:59 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9653610E17D;
	Sun,  5 Apr 2026 23:55:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 790AE4091F;
	Sun,  5 Apr 2026 23:55:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD4E1C2BCB0;
	Sun,  5 Apr 2026 23:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775433331;
	bh=y9tHNT9LLwvCnIp2g8KfzIzoqrv/gM7tQZbqTUN0GxU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PWyM8OyKxUz2TNjL8+e0G5SaNub5kKLoxTD9YqzS8KN12eDUh3ZxxS1ZwAzbPmbfi
	 nDroB+Dw6RlYMaIL1hnynDku4rObXrjTriUfRg/LjdBlpJ5OogQ+hXxDqZ5iAO3GAK
	 e23RwquOxN6ersxOC2v4Ca/qVybz5FXHmP0vq4U7f/+JsRHgs3qrHbTqzV1ypTAys0
	 UfpfwtLB8OR4qY8z6MRfaqIIuEmSd/QnTRo3ZGXmJFgkIE5hy3PpAGlENeQma7W6Kh
	 TbGlWD7OxbQ+ffRD4Uktwmuh8O2wehF4rKRblvXpaWPq7wb8e0PQQD7ybIk0+Jhh7V
	 ALQrawJ7O1w1A==
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
Subject: [PATCH v2 11/33] rust: kbuild: remove skipping of
 `-Wrustdoc::unescaped_backticks`
Date: Mon,  6 Apr 2026 01:52:47 +0200
Message-ID: <20260405235309.418950-12-ojeda@kernel.org>
In-Reply-To: <20260405235309.418950-1-ojeda@kernel.org>
References: <20260405235309.418950-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KSDN3O2K65AYBGMZ5WMQRN5KPDKYSQCI
X-Message-ID-Hash: KSDN3O2K65AYBGMZ5WMQRN5KPDKYSQCI
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KSDN3O2K65AYBGMZ5WMQRN5KPDKYSQCI/>
Archived-At: 
 <https://lore.freedesktop.org/20260405235309.418950-12-ojeda@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Back in Rust 1.82.0, I cleaned the `rustdoc::unescaped_backticks` lint in
upstream Rust and added tests so that hopefully it would not regress [1].

Thus we can remove it from our side given the Rust minimum version bump.

Link: https://github.com/rust-lang/rust/pull/128307 [1]
Reviewed-by: Tamir Duberstein <tamird@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/Makefile | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 16ea720e0a8e..5dc8b4cc89d1 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -75,8 +75,7 @@ core-edition := $(if $(call rustc-min-version,108700),2024,2021)
 
 core-skip_flags := \
     --edition=2021 \
-    -Wunreachable_pub \
-    -Wrustdoc::unescaped_backticks
+    -Wunreachable_pub
 
 core-flags := \
     --edition=$(core-edition) \
@@ -209,8 +208,6 @@ rustdoc-macros: $(src)/macros/lib.rs rustdoc-clean rustdoc-proc_macro2 \
     rustdoc-quote rustdoc-syn FORCE
 	+$(call if_changed,rustdoc)
 
-# Starting with Rust 1.82.0, skipping `-Wrustdoc::unescaped_backticks` should
-# not be needed -- see https://github.com/rust-lang/rust/pull/128307.
 rustdoc-core: private skip_flags = $(core-skip_flags)
 rustdoc-core: private rustc_target_flags = $(core-flags)
 rustdoc-core: $(RUST_LIB_SRC)/core/src/lib.rs rustdoc-clean FORCE
-- 
2.53.0

