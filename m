Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C6ED35177
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 11:48:17 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6111110F068;
	Wed,  1 Apr 2026 11:48:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BctafedQ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3E1FF4536C;
	Wed,  1 Apr 2026 11:36:55 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775043415;
 b=kOR1E1MnxM02/zZ+fDpI4vb42Jmz0UEYsQYrHwr1y3dIMdNsCOa2TJoIln7VB9vR9h9FT
 21EAa0Q164q9/c+t+6sV1kZG/upOovP+5dsX3O7B9zs0wu8Zx3Vb9BoN6hhkm16iJdHkczs
 zWfFu8hklwOH+fsLjOkMxJjQ3MWJX9CGINpcERFS0LfxhEZ1JV073Lt6fwF5OWZb4PP+jOj
 VmYGEdWOhc9Reqg0oLZ5x2Bu5uTFG8BoV1E5oxUzpNlWFZOP2eb7RZnbg0S7m/EGaa/v+nO
 L4HMf+tQ4IdeuJjpvARTUaF2ro38Spbo9HddVOWJNIVaMUiWfUQYd5ys2EIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775043415; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=EZjiSKXVmjcHn9YoZ/yHco4+/3fGMxFZwKbyij6mW+4=;
 b=Ig0h0xva4C/kDt31QSwJUUpffPg8ESZjipY2cZ+pYnRr5QebItwvFk3fWkoUDe6I7zVBP
 NjfG7eXXhTRQ6XPYqMeppe3s6n6mp0BxLsBRqIe1+M540JWgT40p5Zxji41V6pwYJpIlQNd
 k+pwqdsgPPm18C83qfnlhYTl7Dcvq3oD1Ua40VUiq//vmYoR0/dGuRzS52HNahQMCVjbEU9
 PKO0I5+VfiWlDio+2yU4UCPK2vHIgQox6oTt/B9A998RBnYMPVOIFzBO1MmpPSi4qgZ/jHT
 TZV/rGhFtipd3w9f8UgmLit0633xdNyqxWtrWpp4MxYChz+cldNagMW05f+w==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B3D9140545
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 11:36:52 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9C24710F055;
	Wed,  1 Apr 2026 11:48:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B495060180;
	Wed,  1 Apr 2026 11:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30F73C4CEF7;
	Wed,  1 Apr 2026 11:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044093;
	bh=Pc5ewSafnPFxKHksepcgeyeiYuBuOzddWiUYOLo44fc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BctafedQl739LjER8MXut5f/UHQmwOMgY8eiBY9GPjZTa6UhwF33xTqKAsv/k9Jpr
	 UXZVhOtcmmlzZOYf7Vb8QT5b+Sj/g3QrIBGXZxTM3uNlk/xWwz3doBmOs5UrfpKtV3
	 BYeIBH88Jfn81A8lOQUe/b7L+LFkxTKWrdN5PeuA4bvB3G5atuDiVtTQLpJHRcGIi8
	 078hXEr/7kYFNT7XsI7KvwhnIDxnv/Nf9IHI6ZwVq+LPtCR1GNMcpgdXOerf3ytBI9
	 Tm7z4+ydsRwNHDCQkzUS7eKrnLuo9suwO47RZoBJZ7m1nD1AfOYKE0TTcQdbVpDSUj
	 Rk7BTlqek9WZw==
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
Subject: [PATCH 11/33] rust: alloc: simplify with `NonNull::add()` now that it
 is stable
Date: Wed,  1 Apr 2026 13:45:18 +0200
Message-ID: <20260401114540.30108-12-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-1-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: I3YF6TTSVQ4QQR5OF66MPNLEY5GBY3XF
X-Message-ID-Hash: I3YF6TTSVQ4QQR5OF66MPNLEY5GBY3XF
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/I3YF6TTSVQ4QQR5OF66MPNLEY5GBY3XF/>
Archived-At: 
 <https://lore.freedesktop.org/20260401114540.30108-12-ojeda@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Currently we need to go through raw pointers and then re-create the
`NonNull` from the result of offsetting the raw pointer.

Thus, now that we bump the Rust minimum version, simplify using
`NonNull::add()` and clean the TODO note.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/kernel/alloc/allocator/iter.rs | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/rust/kernel/alloc/allocator/iter.rs b/rust/kernel/alloc/allocator/iter.rs
index 5759f86029b7..e0a70b7a744a 100644
--- a/rust/kernel/alloc/allocator/iter.rs
+++ b/rust/kernel/alloc/allocator/iter.rs
@@ -42,15 +42,9 @@ fn next(&mut self) -> Option<Self::Item> {
             return None;
         }
 
-        // TODO: Use `NonNull::add()` instead, once the minimum supported compiler version is
-        // bumped to 1.80 or later.
-        //
         // SAFETY: `offset` is in the interval `[0, (self.page_count() - 1) * page::PAGE_SIZE]`,
         // hence the resulting pointer is guaranteed to be within the same allocation.
-        let ptr = unsafe { self.buf.as_ptr().add(offset) };
-
-        // SAFETY: `ptr` is guaranteed to be non-null given that it is derived from `self.buf`.
-        let ptr = unsafe { NonNull::new_unchecked(ptr) };
+        let ptr = unsafe { self.buf.add(offset) };
 
         // SAFETY:
         // - `ptr` is a valid pointer to a `Vmalloc` allocation.
-- 
2.53.0

