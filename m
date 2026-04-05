Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55FE0E9D827
	for <nouveau@archiver.kernel.org>; Sun,  5 Apr 2026 23:56:09 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3192710E1A6;
	Sun,  5 Apr 2026 23:56:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QWwho++C";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1166E455E3;
	Sun,  5 Apr 2026 23:44:37 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775432676;
 b=RV4rcKqZZXPMEZ6suy5l6mNVDoKsAOWTZdXgQi9w6cyd6mg/5fe+3kIJCN5H10VMHKYzv
 r1NMYUZRhpar9lhChihK4Q8ksUnajq+4Lmym0qmErcz7rVRUyLKmiZnlpvgg3dmbYSbdXb9
 9HbwI9jAKcaudFadRpud/X44gox/4pTMFrOwEUxAaajDi+dmZQrACsj+bWjFUlnX/2VIFBs
 cQe8n7VJ59NEEFjaNpisAtAPpOq8KK+dXCvSPWskJh5vxmWFYFAVmHsIxt9wDmSMJatknHu
 dt15beeKsg56jf83VFM8UaskwWYbJAWuOT34bTki+M6amFt/J/DlKkrnPHUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775432676; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Ao5HuNNgu8GyNLR5yoqLUQbdm3ZNaNRIYyCEwCnTf+0=;
 b=gTgh34yb+fmodl1UJvVJm4NXwOLcJBoPAdNqPJjHBpE5QskgOEsN8ODXnGESwTiJeWmz1
 Lr7KpWIEiIynAHTTRlzPn95U6uOLMS3rh+q/mMM81q/s6G7gKdk8HXbrXYY9cyIuOmx/bif
 gUHXWYTqBqRU7CF93K6jpJFzgxbiSpb20uy5AJZFJ52aKWKsQCnAAFjkn5Bwtduv+rb/IEI
 5WdYbvxROfR+CyQ2JjETn1N/5bn2OluiGuhF49T/LnBEXGZaY1zcJWRjqu48A+k/7zGvXpo
 6WIpKNshw+KMZ8qoTHtREwNixXrEPQsSPHTmNJtVRTs5OPEWJL7bfuxNbgwA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id AD2BD448E7
	for <nouveau@lists.freedesktop.org>; Sun,  5 Apr 2026 23:44:33 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 92DCD10E179;
	Sun,  5 Apr 2026 23:56:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 16814600AC;
	Sun,  5 Apr 2026 23:56:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27803C2BC9E;
	Sun,  5 Apr 2026 23:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775433364;
	bh=H/Ay6Jkav43FJVWalNMqy1drrqBC5z0jZaYEliYSxsg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QWwho++CAQHqbiJSHYjIFW+3zbIRsYkzI2NhaXD915XErZ5bX8D0JSqumwCvnboQC
	 JA2kZyy0PbupBQQ6NzUS0I5RoleMORu4/mJ8QJHPf8WuIxsJK2BntYwSEFYuKrHgs5
	 VPKZomQQHZR70NsihUxiVAScWTSo2yfHf8uJ/qsMQd0mTZH9HvJHft2Dn5JgiAXnIO
	 3PdrXjw1Cnt6FYPbyK/FBO1nONRhPiI30ad4Kc7dhk4L7g63i4MoWAU0uWhs56aoAB
	 o0/TRdl5mjZSVEIann5jDzC12StU6bGXcn2XxNGHneIkfSLv34y3M6cbP04LdQktPx
	 m2gUzuUeHkCMQ==
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
Subject: [PATCH v2 14/33] rust: alloc: simplify with `NonNull::add()` now that
 it is stable
Date: Mon,  6 Apr 2026 01:52:50 +0200
Message-ID: <20260405235309.418950-15-ojeda@kernel.org>
In-Reply-To: <20260405235309.418950-1-ojeda@kernel.org>
References: <20260405235309.418950-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: M4O5J5TLPTPQSWHBRGLDHNTT6HSM7CTR
X-Message-ID-Hash: M4O5J5TLPTPQSWHBRGLDHNTT6HSM7CTR
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/M4O5J5TLPTPQSWHBRGLDHNTT6HSM7CTR/>
Archived-At: 
 <https://lore.freedesktop.org/20260405235309.418950-15-ojeda@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Currently, we need to go through raw pointers and then re-create the
`NonNull` from the result of offsetting the raw pointer.

`feature(non_null_convenience)` [1] has been stabilized in Rust
1.80.0 [2], which is older than our new minimum Rust version
(Rust 1.85.0).

Thus, now that we bump the Rust minimum version, simplify using
`NonNull::add()` and clean the TODO note.

Link: https://github.com/rust-lang/rust/issues/117691 [1]
Link: https://github.com/rust-lang/rust/pull/124498 [2]
Reviewed-by: Tamir Duberstein <tamird@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Acked-by: Danilo Krummrich <dakr@kernel.org>
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

