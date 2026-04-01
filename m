Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E92F8D35177
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 11:48:27 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BFBD110F06B;
	Wed,  1 Apr 2026 11:48:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GoxIk+02";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A08294536C;
	Wed,  1 Apr 2026 11:37:05 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775043425;
 b=k3FWFtqkN00A5zutto/oe2h8VpL8ZFhsm/yKqIi6xHiWpaOPMM0NjO8Y+KTzJi/6hOPOF
 IdmoTyvL6bYd62QHzcQqOz/RrLyfZ6Wv2Cp7hmIHGA/4QqakRkFLTObpfDZjcnsrpl3b49U
 bXsgP5wGKhOH6E4yt7gPoCUKJkAAQ6UqFe7e+Cs5At8m8GzzsQ73q6mf5/Ybx5MrC2KMpvv
 uw+0ZoN1TGXNVVSpEdZDd9bYTBnKSS4RqwU+EY8ZzV6K+zqMAMHlzq6/h5DSwkvB2fz8t9P
 QToT0EzqdtRuRsH6UFDRQZXdthf/zTmtn3byND8+TTSQ5TTfZvk15rShIHkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775043425; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=4NeP3MH2AtPdcWLmckwtGvj7Vmo/dD7G6Ej9iUZzn4s=;
 b=rM2XpTFNLteQZsXkhQGfRRM0jkOCUf778WtEqZ6ue+FlOtJ2pxGb0/hgbHjJ/ks9gCTDD
 kJb5QdboMAtRWZiPNhmf3jq8yMs2CPV9xnc4sg3tPZ3LMXHDw2JGx4zPDmRi3ZRX5wWchmK
 ESbzv5zwRdIvVC/3ky/X/ADHZY7O6PkR8q58PpCuC5VbULi7PKooZTVg8O6vPXu6q9dyDFc
 /C7ESYqxfG+yJAL3shbid/QcCe4HIi9eacBeVlRx7oYZo7M1qOhWsygaHcmadB4fnKNjRX1
 aJvfur+YTeH1WxyilwqgkzuIGM3IZO5w3dW+PszkNTJ3kQ+H3grKbdxdEn2A==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 65BE140545
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 11:37:03 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6102310F043;
	Wed,  1 Apr 2026 11:48:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 48326408F5;
	Wed,  1 Apr 2026 11:48:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F04AFC4CEF7;
	Wed,  1 Apr 2026 11:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044105;
	bh=oCOOGcyyszcaXC31455V0be0QqdPMZoxWheuEK3ZCSA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GoxIk+02vJe18xjAgrD81txVK4wtRlTfUWrhHLGDRSQiV+me/fjnLC+7phHDlesuL
	 J7Hq1xhTdOPfCfF8DlMkdOt8rrbVHMirjmXItItYHfBPD25cX4fMo/GBYwdrbRu7fZ
	 0AkU4tct54K8WMu16YFOTGOQcGE3qx2fKQnsmkDzl/vyf61S0QPF9vcb0C1gkRPnMR
	 e+5uOE14VQelGq2Cq0xHw4LUMkQ9WlkXANUH0HKCMdNXt3l1xPhuNuUmuYpg9lJb/A
	 TRD5Link8UuZH9tLBuJ6KDPuIvaQ52PV5omvSLGJvk5BLHki1ajJnBJ5vuJsGi1ltQ
	 c73r0TDlYXWnA==
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
Subject: [PATCH 12/33] rust: macros: update `extract_if` MSRV TODO comment
Date: Wed,  1 Apr 2026 13:45:19 +0200
Message-ID: <20260401114540.30108-13-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-1-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VAX5QK3THIPLEODBQINWSDL6I74BAJZK
X-Message-ID-Hash: VAX5QK3THIPLEODBQINWSDL6I74BAJZK
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VAX5QK3THIPLEODBQINWSDL6I74BAJZK/>
Archived-At: 
 <https://lore.freedesktop.org/20260401114540.30108-13-ojeda@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

`feature(extract_if)` was stabilized in Rust 1.87.0 [1].

Thus update the comment to reflect that.

Alternatively, we could use it unstably already.

Link: https://github.com/rust-lang/rust/pull/137109 [1]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/macros/kunit.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/macros/kunit.rs b/rust/macros/kunit.rs
index 6be880d634e2..6f6d746b8dbb 100644
--- a/rust/macros/kunit.rs
+++ b/rust/macros/kunit.rs
@@ -87,7 +87,7 @@ pub(crate) fn kunit_tests(test_suite: Ident, mut module: ItemMod) -> Result<Toke
             continue;
         };
 
-        // TODO: Replace below with `extract_if` when MSRV is bumped above 1.85.
+        // TODO: Replace with `extract_if` when MSRV is >= 1.87.0.
         let before_len = f.attrs.len();
         f.attrs.retain(|attr| !attr.path().is_ident("test"));
         if f.attrs.len() == before_len {
-- 
2.53.0

