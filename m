Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A075D35162
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 11:50:03 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1F2A110ED4E;
	Wed,  1 Apr 2026 11:50:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KLZvlL/X";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E59574538D;
	Wed,  1 Apr 2026 11:38:40 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775043520;
 b=ffXi/igWLLFnhWnSbtoM6yhAazCBNz6cZ1bf6v/BJ7b6Vn9cbzy3hK3I40TMAHpeoW/7y
 y0PXT4+n9gk6D5Kp3JSTeWoazC4/tb4A4hcrGDqAXHsJcue1SqI+DP3guZ2O4NGyMEjxoav
 7ROS9YCprc/uKNL31MEi+gOGhHxoqjGFWQTFckDsijG0tE7ObaWdbchN2Ce4pBuThq/ySrL
 3W3KjzEfblzSPR228g74IvF2mo9kFhF6phKoG2FP+IwXSuVdcFk6PuoYGmD7bQEYN40qSg2
 GZZiuSCp0cTqqikSrw27oHhjLtsX3747aFjHzMadPM8mghYyMibjp4iGET5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775043520; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=zfctsG0MEK9DjfOKGfow/kn/X0nicO8wFVvKRFNEt/s=;
 b=ghvpcD6q51sYKLiFJYfbXlZXQm4S+avsNA0Igq27Bkw0F9+jYCfE4/os2VliWTgtFcV2f
 uhIz4nIWpAvapDeXlcFGB17RuszSELKZGT3DiutIeEHFatJDuQ1Y6RL1t12op9QXudnpGmh
 QgGA7rCto4yTi4CkwrU5zqOmf78sK74JaBirnDQBQ4dSSFXjan+A5kAT0LvbkxA1BL7wXE+
 sjaxZOy83GcqHKk+mIGNA4HJkbnAsUgi0NeJ4qd1F1ix1eJUOWxs0I5nnNESM0hT11uMAcA
 DjTucAIVuOO0oYh43zqvioB5d3hUF7YLuRKNw5EqFwN1L3X0e0t+QCx49jvg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 84BF240545
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 11:38:38 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6ED6A10EA73;
	Wed,  1 Apr 2026 11:50:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CAC6560154;
	Wed,  1 Apr 2026 11:49:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46A22C4CEF7;
	Wed,  1 Apr 2026 11:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044199;
	bh=wcbQRLM9qTKpTFYFEosr/1QG1mBAWkf0/gok9PQzPf0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KLZvlL/XgCiazZjeX/Y8Xsx+YBTjea4SwD1HWIceKRTwgPjL3m8jDIKob1H4JBDVK
	 Qv/gfay0rXXO8p6eOYCpHlnWtMyICts5OWSd/EChkJgjnopuAIv2sUN1fDAaxML48n
	 9TIoL+dFCzSt6wkaesp6HqT6gd69LLUqI/fxVyWnZIsvBy/1WzuOrn5BZUxz1qMYIo
	 gaQDh06efSy/bIy5G9jpxAOh5JyNttJWHRH4Q+dopWG8qMbViy2UJZMZeohpUyx+Jz
	 +RDMOn+Rr4uDTVxWPo738niiObo6baL76z0Nght9kLTnVeXGgAA20Xj4aKleoK+drH
	 N2UWk3KxrLXug==
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
Subject: [PATCH 20/33] rust: kbuild: remove unneeded old `allow`s for
 generated layout tests
Date: Wed,  1 Apr 2026 13:45:27 +0200
Message-ID: <20260401114540.30108-21-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-1-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OXH5LMRXZCKU76YUAIJXAU6ZGAX5WPNZ
X-Message-ID-Hash: OXH5LMRXZCKU76YUAIJXAU6ZGAX5WPNZ
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/OXH5LMRXZCKU76YUAIJXAU6ZGAX5WPNZ/>
Archived-At: 
 <https://lore.freedesktop.org/20260401114540.30108-21-ojeda@kernel.org/>
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

