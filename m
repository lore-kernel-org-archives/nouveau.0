Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 640F4D3517B
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 11:48:04 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1945410F064;
	Wed,  1 Apr 2026 11:48:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="W7RUQV2H";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id EDC754535A;
	Wed,  1 Apr 2026 11:36:41 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775043401;
 b=zah8ekFElmJUSLMWKx/Ga2F6BO0ZyINl8soTSRdV0HwM1+jVMjBD2TRT5HPvbNFlJvChI
 N5/yi0VFzCZe3Hk7QcDfnC6N2+p9UfJTTUAwRs/81cKpMhwCaiQ1+8A0jp1WuAodAHc9Ewp
 0JUIHgpQK/Bev0e64f/+5UYhTObsAZg6hcaYnPhlIg55Yzl1lW3JWHTbh0sblOPzOhf+Bgk
 1shW0+V15FjsL9jS1BWl3bA8ii1WyMzMG1KkOKvJW5OIkwOwQpf9KJNp0lkrbiYp1WLYpnD
 +fGgyaQ8wWsoTAuvump8T3drqa1IacImBu5/z6ldFddX4rnOQzWMtpk7yWnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775043401; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=vWEKmqVBjTEpQwDIjVnmDz4c+/yDDPJZ0EI/QhjWeUI=;
 b=ZHDcaTisSivYIuYJacgOFckPAz7j4SZX5vyizwlpP3ZBI6PxkJP+Z88zGhIMjQYMp1k7s
 S7q+fPzjGNQjffIfgbB27LY+/LSZnWldPP44b+yl1JKz1D0zjIjxu6KNH3DGQZ9Zsl7XPFf
 XEptSaBWDq7JixGNepeiepNnXER7vHI/IhCSbgS+UxmJdisZ01jV/bDS9h04nBbDsOy2iho
 UdZXEFdSN+RkfhxMjRZ98fl51DL3RhaVG9BEQxnJCfwDovcok/RtsiKoRzYPgtXeWZstx4i
 zI7sortXDy9rufNxMFTykyncA/Xblu1gR1g3fbo6ZuK70S3PJdGDJWIXIFdw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id E96FC40545
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 11:36:39 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E789F10F027;
	Wed,  1 Apr 2026 11:48:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C293E40914;
	Wed,  1 Apr 2026 11:48:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60409C4CEF7;
	Wed,  1 Apr 2026 11:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044081;
	bh=adABYvIqd3NTguvnrLCuC9umM1YlmwtHIfAtv/sMMlY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W7RUQV2HZDvpt7cb2QLkpsSjIXygeJXHzglkI2wvWnPnI2M1b6re/EbnmI0XwokyF
	 wrrwYxN+/b+ugyMYmH9z5Umd525lrDMMtI1jgyazypmGOGTbjEKg2Uf67p5z3f9Bmg
	 c6SqSWS5dXNcFVk9QuiGQs+D+hKuqndvN5lUWvCrCbINYOm3WsPZfDOtxulUNeWqbM
	 y89bDoxVl41VBEb3zkJMUAunBi8T9StVC/clbVAz8kgUAUUzxcNf8AJj/euaS7+TKs
	 GxDpNxLDh92OcnV4pmrI+T0sPk26QqFNokBc1fpaibHISln0xBEqZ/Iba9ePZXRZ+o
	 QQE6E4BNPh56g==
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
Subject: [PATCH 10/33] rust: transmute: simplify code with Rust 1.80.0
 `split_at_*checked()`
Date: Wed,  1 Apr 2026 13:45:17 +0200
Message-ID: <20260401114540.30108-11-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-1-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EE6EU4GEV2YUPSZTIDI3VSGATPLMENXR
X-Message-ID-Hash: EE6EU4GEV2YUPSZTIDI3VSGATPLMENXR
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/EE6EU4GEV2YUPSZTIDI3VSGATPLMENXR/>
Archived-At: 
 <https://lore.freedesktop.org/20260401114540.30108-11-ojeda@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

`feature(split_at_checked)` [1] has been stabilized in Rust 1.80.0 [2],
which is beyond our new minimum Rust version (Rust 1.85.0).

Thus simplify the code using `split_at_*checked()`.

Link: https://github.com/rust-lang/rust/issues/119128 [1]
Link: https://github.com/rust-lang/rust/pull/124678 [2]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/kernel/transmute.rs | 33 ++++++---------------------------
 1 file changed, 6 insertions(+), 27 deletions(-)

diff --git a/rust/kernel/transmute.rs b/rust/kernel/transmute.rs
index b9e6eadc08f5..654b5ede2fe2 100644
--- a/rust/kernel/transmute.rs
+++ b/rust/kernel/transmute.rs
@@ -66,16 +66,9 @@ fn from_bytes_prefix(bytes: &[u8]) -> Option<(&Self, &[u8])>
     where
         Self: Sized,
     {
-        if bytes.len() < size_of::<Self>() {
-            None
-        } else {
-            // PANIC: We checked that `bytes.len() >= size_of::<Self>`, thus `split_at` cannot
-            // panic.
-            // TODO: replace with `split_at_checked` once the MSRV is >= 1.80.
-            let (prefix, remainder) = bytes.split_at(size_of::<Self>());
+        let (prefix, remainder) = bytes.split_at_checked(size_of::<Self>())?;
 
-            Self::from_bytes(prefix).map(|s| (s, remainder))
-        }
+        Self::from_bytes(prefix).map(|s| (s, remainder))
     }
 
     /// Converts a mutable slice of bytes to a reference to `Self`.
@@ -108,16 +101,9 @@ fn from_bytes_mut_prefix(bytes: &mut [u8]) -> Option<(&mut Self, &mut [u8])>
     where
         Self: AsBytes + Sized,
     {
-        if bytes.len() < size_of::<Self>() {
-            None
-        } else {
-            // PANIC: We checked that `bytes.len() >= size_of::<Self>`, thus `split_at_mut` cannot
-            // panic.
-            // TODO: replace with `split_at_mut_checked` once the MSRV is >= 1.80.
-            let (prefix, remainder) = bytes.split_at_mut(size_of::<Self>());
+        let (prefix, remainder) = bytes.split_at_mut_checked(size_of::<Self>())?;
 
-            Self::from_bytes_mut(prefix).map(|s| (s, remainder))
-        }
+        Self::from_bytes_mut(prefix).map(|s| (s, remainder))
     }
 
     /// Creates an owned instance of `Self` by copying `bytes`.
@@ -147,16 +133,9 @@ fn from_bytes_copy_prefix(bytes: &[u8]) -> Option<(Self, &[u8])>
     where
         Self: Sized,
     {
-        if bytes.len() < size_of::<Self>() {
-            None
-        } else {
-            // PANIC: We checked that `bytes.len() >= size_of::<Self>`, thus `split_at` cannot
-            // panic.
-            // TODO: replace with `split_at_checked` once the MSRV is >= 1.80.
-            let (prefix, remainder) = bytes.split_at(size_of::<Self>());
+        let (prefix, remainder) = bytes.split_at_checked(size_of::<Self>())?;
 
-            Self::from_bytes_copy(prefix).map(|s| (s, remainder))
-        }
+        Self::from_bytes_copy(prefix).map(|s| (s, remainder))
     }
 }
 
-- 
2.53.0

