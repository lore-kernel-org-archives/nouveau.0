Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00293E9D826
	for <nouveau@archiver.kernel.org>; Sun,  5 Apr 2026 23:55:57 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BB38310E1A6;
	Sun,  5 Apr 2026 23:55:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pFKlWdbI";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8F954455E3;
	Sun,  5 Apr 2026 23:44:25 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775432665;
 b=IVQTN6f4AX+knjshbZ78fDGUteF/mGGeceKfCdnfJCD4BfhQtYy5wJcm8ZNJC/tAK+U/9
 profboIK0EtWVk2K8aF1cy4FM4Q9rkSiZwwYFzvV3Ud1kii4OUJWo3hViPxp+oERWxN6u5K
 hgWuSP8bS+PgX8VLkQJTFbBOMw5U+empBkuFWpc7AmYlnFl6C7Ek4jIxO3RyL2ex5bjAtc9
 06+59GBtRnvl6udbuA1/ptWT+OwonS6wnUfZTKSPnQ1+POB4OEuh9vNdL9yZPhLUGSv+9TK
 B4XECL68P4ktbueaENLSSFk6C9o7XT8vmXxTeGh8RJ+TbgZnfqf0eepRS1vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775432665; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=9NPyZHhWeqCNKKZLSFGdK0W1C48Vt8aHQa5VkkBGICc=;
 b=C/8/ovJXpzOcr6xFyht7bDYOpmaXwOwxCSDUz+I2BW/AX2WzK0wcrGWviCflKh3bPGy/j
 QnUEMu+uBIgt4u524Xvp2L+SzzE2m5zEg79Hy5nSAJ6CJXDcM/iVt0iZZUFP6hPth4YpQtX
 FBv0Z5GdlUCbSr+jGUF8/89jDo0Vkx05fjr9SWN3e4hStRn/2bbHA/vRoA/yKDfmhpkmNsp
 HsZOcVqKTI1Zg+VDc8+L1nkTLyaPN5FK9+1h/ze6YwNcvfp7DOKetlWqRCIjwBLjtyo02sU
 AUjC4pNyz2PAqiWM9Eus7dkDousDfvcV8VyjaBMRQ5jEYXwMWfU5mvPQ9/AA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 89770448E7
	for <nouveau@lists.freedesktop.org>; Sun,  5 Apr 2026 23:44:22 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6F06310E1A0;
	Sun,  5 Apr 2026 23:55:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E6F47600CB;
	Sun,  5 Apr 2026 23:55:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03DC7C116C6;
	Sun,  5 Apr 2026 23:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775433353;
	bh=5w/hrnObbKhvO+jKV9Ekcn8KO5lrvAgEuh7kkEvfcjs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pFKlWdbIbGq0s7ECR/XX4/m1j5ueBsd37sKXJ5uePknRDz52bcxRKKdQUe1jTopVz
	 My33xj+WU7MHbje6Gh0L7CxJ3KxzvwAzOCWOcACpPEKqFS6mcKRf8vZJADvLXmZb8Y
	 o52+2gns0KIFCn54pt8VBrZ+FWo9rC1to0WiGTYC13dYbxzXvTcpelifn0bJwujKk8
	 86EYB1I8NJU19juZwmDdg9wxjSeTqxQvMdO4C+IKLVR+fihXZU6p1+0tn/pIcBpd8O
	 l9nnLvpiSxsgD13f15cAIkVKNBh1pZpZ73szNIqI8iXIz7LHd1T89xgFnRcsHNKyFY
	 9vVjtBOKjhKqQ==
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
Subject: [PATCH v2 13/33] rust: transmute: simplify code with Rust 1.80.0
 `split_at_*checked()`
Date: Mon,  6 Apr 2026 01:52:49 +0200
Message-ID: <20260405235309.418950-14-ojeda@kernel.org>
In-Reply-To: <20260405235309.418950-1-ojeda@kernel.org>
References: <20260405235309.418950-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DDIPMCC547P3HTTGXDQW6NI2ENLQVV7U
X-Message-ID-Hash: DDIPMCC547P3HTTGXDQW6NI2ENLQVV7U
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DDIPMCC547P3HTTGXDQW6NI2ENLQVV7U/>
Archived-At: 
 <https://lore.freedesktop.org/20260405235309.418950-14-ojeda@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

`feature(split_at_checked)` [1] has been stabilized in Rust 1.80.0 [2],
which is older than our new minimum Rust version (Rust 1.85.0).

Thus simplify the code using `split_at_*checked()`.

Link: https://github.com/rust-lang/rust/issues/119128 [1]
Link: https://github.com/rust-lang/rust/pull/124678 [2]
Reviewed-by: Tamir Duberstein <tamird@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
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

