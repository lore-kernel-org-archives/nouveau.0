Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D47DE9D826
	for <nouveau@archiver.kernel.org>; Sun,  5 Apr 2026 23:57:15 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0DE5E10E1BA;
	Sun,  5 Apr 2026 23:57:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sjMfFJzy";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E286F455EF;
	Sun,  5 Apr 2026 23:45:42 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775432742;
 b=siIXIf11AKDxFN3mDmx1PpVCUobyLSWLMQEfRVkW1i58P041CjyhS5mA7xk0AnFo+lC9/
 OJddzLbJ7cDWmOq+UjysFvyatek/bGVWEQGrg73clGeDVv7IWKt/nfrdPLpa0aF3qrhbVGk
 8e1ec9bJM9WtLoAjCa2Ytf1tEwxb9wk6gNKOGVHE99B+bVozPGaqvr/Tz74LLtYOoDKBi4C
 CqLX5pz6E+R1ouj3dGUnrnAk/JMiHbZ+VZYHC8SM3CC3O/A9xn+UyIOl737V39fNRJRD0Z5
 h/QhejvwYI1AC/YKjr6K787X7TmNsZWYErCDvKciV52EHk2HvF1ddFLVSX8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775432742; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=V6zkrH7boVFREcyUo/mII/AAmdr1g5aPpAKIdiI5/fo=;
 b=JBPvhbsRyDPNB6XCr58m1Z246jFEwyUpS68OA70InJ4ytVLRaHiTxyt4Pq+vvGrmJIvqs
 ddfTGEa/K24a6MKKh1oW8Nu9SFtVWpaUgPS8DY9+Nf1v3EjN0tliOEGQzjYUfWBTWCuvoQM
 FZf1O79bRv0ltFkspzbShWWtx1WHmdgUGNhgDc7ZOU+FvSDrSz3iIWxxRny0/QPvLKvyFt9
 SK35MqrE+FFEDv4Ca+kdTcZVobv/jfWddZ6rFktxFMxb8sVkOEo2tc9Ge848L6rzNmMXs3d
 3zWqOB+yb+AnAOS1ECLsO99LPPls7iK8/PBj0FHOox0TXC9BM+2iWvQPhvlw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 76C4F42DA9
	for <nouveau@lists.freedesktop.org>; Sun,  5 Apr 2026 23:45:40 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5EB1D10E189;
	Sun,  5 Apr 2026 23:57:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D4C8060123;
	Sun,  5 Apr 2026 23:57:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D849BC2BC9E;
	Sun,  5 Apr 2026 23:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775433431;
	bh=IRt9MhYeBO0++hWWCjmyX0eYSozz5sufq57E0UcpLrc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sjMfFJzy5gkgRHkNpL+Rrzg29TE6lfhKgKvGE/mRM4pSeUJKdNXGRzwTBpSsWjZxF
	 5TcuobtvROn3nG8N8jTFVTYyBbdd4WJ8k3PoxaWn2JRFtEayqFJJ+TyEHWBr4ixb6d
	 huAo6J2g/V9pJIndQG8BbX2FDy7/Swlfqo0yCCLL/nqEuQWO4h8ZB2UTc/+FCi6TKn
	 J53d7PSkxc/4XOykjk3qZn9OAY3uq5SdOumTONU7QLdwZfA78JXqUAWFOHTcTMeC/8
	 ZZ4WD6SNGpjWYRUf1wSyCCrmyZscYQRP2ps7rZ7YD2RE4RNR0qpCl4FKzDJ9XT5JWN
	 orKj9ro+iCbvw==
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
Subject: [PATCH v2 20/33] rust: kbuild: update `bindgen --rust-target` version
 and replace comment
Date: Mon,  6 Apr 2026 01:52:56 +0200
Message-ID: <20260405235309.418950-21-ojeda@kernel.org>
In-Reply-To: <20260405235309.418950-1-ojeda@kernel.org>
References: <20260405235309.418950-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3P2J7LRJXPJCWHGX27YLA7IJB77NWSVA
X-Message-ID-Hash: 3P2J7LRJXPJCWHGX27YLA7IJB77NWSVA
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3P2J7LRJXPJCWHGX27YLA7IJB77NWSVA/>
Archived-At: 
 <https://lore.freedesktop.org/20260405235309.418950-21-ojeda@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

As the comment in the `Makefile` explains, previously, we needed to
limit ourselves to the list of Rust versions known by `bindgen` for its
`--rust-target` option [1].

In other words, we needed to consult the versions known by the minimum
version of `bindgen` that we supported.

Now that we bumped the minimum version of `bindgen`, that limitation
does not apply anymore since `bindgen` 0.71.0 [2].

Thus replace the comment and simply write our minimum supported Rust
version there, which is much simpler.

See commit 7a5f93ea5862 ("rust: kbuild: set `bindgen`'s Rust target
version") for more details.

Link: https://rust-lang.zulipchat.com/#narrow/channel/425075-rust-for-linux/topic/rust.20version.20on.20generated.20bindings/near/484087179 [1]
Link: https://github.com/rust-lang/rust-bindgen/pull/2993 [2]
Reviewed-by: Tamir Duberstein <tamird@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/Makefile | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 54498cb5b851..866f9afc1b7f 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -441,22 +441,10 @@ endif
 # architecture instead of generating `usize`.
 bindgen_c_flags_final = $(bindgen_c_flags_lto) -fno-builtin -D__BINDGEN__
 
-# Each `bindgen` release may upgrade the list of Rust target versions. By
-# default, the highest stable release in their list is used. Thus we need to set
-# a `--rust-target` to avoid future `bindgen` releases emitting code that
-# `rustc` may not understand. On top of that, `bindgen` does not support passing
-# an unknown Rust target version.
-#
-# Therefore, the Rust target for `bindgen` can be only as high as the minimum
-# Rust version the kernel supports and only as high as the greatest stable Rust
-# target supported by the minimum `bindgen` version the kernel supports (that
-# is, if we do not test the actual `rustc`/`bindgen` versions running).
-#
-# Starting with `bindgen` 0.71.0, we will be able to set any future Rust version
-# instead, i.e. we will be able to set here our minimum supported Rust version.
+# `--rust-target` points to our minimum supported Rust version.
 quiet_cmd_bindgen = BINDGEN $@
       cmd_bindgen = \
-	$(BINDGEN) $< $(bindgen_target_flags) --rust-target 1.68 \
+	$(BINDGEN) $< $(bindgen_target_flags) --rust-target 1.85 \
 		--use-core --with-derive-default --ctypes-prefix ffi --no-layout-tests \
 		--no-debug '.*' --enable-function-attribute-detection \
 		-o $@ -- $(bindgen_c_flags_final) -DMODULE \
-- 
2.53.0

