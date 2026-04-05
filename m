Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24EBAE9D82C
	for <nouveau@archiver.kernel.org>; Sun,  5 Apr 2026 23:57:48 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 036CE10E1C0;
	Sun,  5 Apr 2026 23:57:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fWajgKwf";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D8C0E455F9;
	Sun,  5 Apr 2026 23:46:15 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775432775;
 b=iKcE8oIZNWhZj1iUDXxoKbdqaQctW3D51lolasZm2JRfM4qyCYJBAOQEoDhe0IAhIrFbh
 XzL/N5LDRW5jlSfuYGzNm2uKAyr+dznnMKDhm0PCRrh9YiWIJ5IwenhqnXUc6iHx8qMcDTE
 1IrYsewIrJJ0uroJH0roVS7zb+G4KscW4fgupGKy6gLzVik0U6PuOGsfWdGWTYNXYQvJbnf
 WH5SUMqoLnuhONUUYekJaUvUvQHdwlrm8YWY+EbP0wjXVuYk5CBr4NJKALggJ18D+orPN4M
 Tttk0PGjm4B8Bb5ZeJ0HzqMjeHPgFLsfrjM/TaypAjkyqmJv2wDB/m3RP5+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775432775; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=pM1PRpAnNQfM5eG7xT7ATh5rmPzX19SK8//72fpnuEA=;
 b=KpS1j/l1YpvbopuYruLgTDUQfEgAFhRatVkjh+63volUPYM2Fp/et3FfLzcpkUcFCckb5
 Gzy9suT0P2AAVzkgSe3u4dyN3ZOLNefV1Ey+zkbaKq25n7L3DWLslmXEpcEUZ6RMLVWnxZr
 5E1Zk9MSkUNKQT590G1txgwj9JwwexHlTjaM1tU7rbPpjMnYTqgClzrXWs8Ji7K9hg+cB5T
 SB4xEDXfL/uzUgbgkw81G5Y2Ve48D6Cg4zLIqjJEfKNo+gKWvYhUcg8AWTKjLdKu37d20oZ
 VCnFRAsv43DLsYbMbkgyzOhsPElWAgR8h5xN3NRm3Edx7k96GSiG7o+UWybw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 4C5DB42DA9
	for <nouveau@lists.freedesktop.org>; Sun,  5 Apr 2026 23:46:13 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD6E10E1A6;
	Sun,  5 Apr 2026 23:57:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2E0474394F;
	Sun,  5 Apr 2026 23:57:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D085C116C6;
	Sun,  5 Apr 2026 23:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775433465;
	bh=7mv52/ZG4QUnDcOB1zLib3ghxysM4SNZUNBkbqsCd6I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fWajgKwfrkdSNkiYnAd9kVPK1GTxxVyj6J8fkBbJmrLEd8CgJanav/phR9AoL3ylx
	 txfRsKu9RyJkL4rGC6RD3J1lxpa9C1fBSZzYpGbeXeZbD3guGiERO3kTGiCHAhtg92
	 EgiGkmUZ+/W0GJ+7JzQjQgfMYPZT8BWyQe0qXfjMWmH6CabWhNT0oyMw9cRsUMhrb4
	 4xmAOFIxtQwyfAcrhXC65dsH2AYzCrEmcwkeyxe2CLJSxNlqukCsRdgXYFRU6ozXdz
	 4B+nAbib/RZGoGdyfYl4J/MgCruSgPuD1K/cXlZHR3jxvKX31DQGGowb/YmjIjlMaf
	 nst7B8vwy2roQ==
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
Subject: [PATCH v2 23/33] docs: rust: quick-start: update Ubuntu versioned
 packages
Date: Mon,  6 Apr 2026 01:52:59 +0200
Message-ID: <20260405235309.418950-24-ojeda@kernel.org>
In-Reply-To: <20260405235309.418950-1-ojeda@kernel.org>
References: <20260405235309.418950-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NH5JIWWW5WTVWQ4DHZ4XWFX3AX2SNUJD
X-Message-ID-Hash: NH5JIWWW5WTVWQ4DHZ4XWFX3AX2SNUJD
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NH5JIWWW5WTVWQ4DHZ4XWFX3AX2SNUJD/>
Archived-At: 
 <https://lore.freedesktop.org/20260405235309.418950-24-ojeda@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Now that the minimum supported Rust version is bumped, bump the versioned
Rust packages [1][2][3][4] to that version for Ubuntu in the Quick
Start guide.

In addition, add "may" to the `RUST_LIB_SRC` line since it does not look
like it is needed from a quick test in a Ubuntu 24.04 LTS container.

Link: https://packages.ubuntu.com/search?suite=all&searchon=names&keywords=rustc [1]
Link: https://packages.ubuntu.com/search?suite=all&searchon=names&keywords=bindgen [2]
Link: https://launchpad.net/ubuntu/+source/rustc-1.85 [3]
Link: https://launchpad.net/ubuntu/+source/rust-bindgen-0.71 [4]
Reviewed-by: Tamir Duberstein <tamird@kernel.org>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Documentation/rust/quick-start.rst | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/quick-start.rst
index 642efce04ee8..54fe491deb7d 100644
--- a/Documentation/rust/quick-start.rst
+++ b/Documentation/rust/quick-start.rst
@@ -112,33 +112,33 @@ Though Ubuntu 24.04 LTS and older versions still provide recent Rust
 releases, they require some additional configuration to be set, using
 the versioned packages, e.g.::
 
-	apt install rustc-1.80 rust-1.80-src bindgen-0.65 rustfmt-1.80 \
-		rust-1.80-clippy
-	ln -s /usr/lib/rust-1.80/bin/rustfmt /usr/bin/rustfmt-1.80
-	ln -s /usr/lib/rust-1.80/bin/clippy-driver /usr/bin/clippy-driver-1.80
+	apt install rustc-1.85 rust-1.85-src bindgen-0.71 rustfmt-1.85 \
+		rust-1.85-clippy
+	ln -s /usr/lib/rust-1.85/bin/rustfmt /usr/bin/rustfmt-1.85
+	ln -s /usr/lib/rust-1.85/bin/clippy-driver /usr/bin/clippy-driver-1.85
 
 None of these packages set their tools as defaults; therefore they should be
 specified explicitly, e.g.::
 
-	make LLVM=1 RUSTC=rustc-1.80 RUSTDOC=rustdoc-1.80 RUSTFMT=rustfmt-1.80 \
-		CLIPPY_DRIVER=clippy-driver-1.80 BINDGEN=bindgen-0.65
+	make LLVM=1 RUSTC=rustc-1.85 RUSTDOC=rustdoc-1.85 RUSTFMT=rustfmt-1.85 \
+		CLIPPY_DRIVER=clippy-driver-1.85 BINDGEN=bindgen-0.71
 
-Alternatively, modify the ``PATH`` variable to place the Rust 1.80 binaries
+Alternatively, modify the ``PATH`` variable to place the Rust 1.85 binaries
 first and set ``bindgen`` as the default, e.g.::
 
-	PATH=/usr/lib/rust-1.80/bin:$PATH
+	PATH=/usr/lib/rust-1.85/bin:$PATH
 	update-alternatives --install /usr/bin/bindgen bindgen \
-		/usr/bin/bindgen-0.65 100
-	update-alternatives --set bindgen /usr/bin/bindgen-0.65
+		/usr/bin/bindgen-0.71 100
+	update-alternatives --set bindgen /usr/bin/bindgen-0.71
 
-``RUST_LIB_SRC`` needs to be set when using the versioned packages, e.g.::
+``RUST_LIB_SRC`` may need to be set when using the versioned packages, e.g.::
 
-	RUST_LIB_SRC=/usr/src/rustc-$(rustc-1.80 --version | cut -d' ' -f2)/library
+	RUST_LIB_SRC=/usr/src/rustc-$(rustc-1.85 --version | cut -d' ' -f2)/library
 
 For convenience, ``RUST_LIB_SRC`` can be exported to the global environment.
 
-In addition, ``bindgen-0.65`` is available in newer releases (24.04 LTS and
-24.10), but it may not be available in older ones (20.04 LTS and 22.04 LTS),
+In addition, ``bindgen-0.71`` is available in newer releases (24.04 LTS),
+but it may not be available in older ones (20.04 LTS and 22.04 LTS),
 thus ``bindgen`` may need to be built manually (please see below).
 
 
-- 
2.53.0

